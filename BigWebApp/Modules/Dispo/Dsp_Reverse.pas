unit Dsp_Reverse;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Dsp_Prod,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.Trans,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  Vcl.Buttons,
  IQMS.WebVcl.DropDownButton,
  Vcl.DBGrids,
  Vcl.Forms,
  Vcl.Controls, uniMainMenu, uniSpeedButton, uniBitBtn, uniMenuButton,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniPageControl, uniCheckBox,
  uniDBCheckBox, uniGUIClasses, uniEdit, uniDBEdit, uniScrollBox, uniSplitter,
  uniButton, uniLabel, uniGUIBaseClasses, uniPanel;

type
  TFrmDispoReverseProduction = class(TFrmDispoProduction)
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure AssignDispositioned; override;
    procedure ExecuteTransaction; override;
    procedure SetDataSetReadOnly; override;
    procedure BeforeTransDispoAddOut( ADay_Part_ID: Real; AQry: TDataSet; AMaster_Label_List: TStringList ); override;

  public
    { Public declarations }
    procedure AddOverhead( const AIN_OUT: string ); override;
    procedure AddLabor( const AIN_OUT: string ); override;
  end;

{var
  FrmDispoReverseProduction: TFrmDispoReverseProduction;}

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.Controls,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  IQMS.Common.Miscellaneous,
  IQMS.Common.JumpConstants;

{ TFrmDispoReverseProduction }

procedure TFrmDispoReverseProduction.FormCreate(Sender: TObject);
begin
  inherited;
  FReverseDisposition:= TRUE;
end;

procedure TFrmDispoReverseProduction.AssignDispositioned;
begin
  Dispositioned:= 'N';

  ExecuteCommandFmt('delete from matprod where day_part_id = %f', [ TblMasterID.asFloat ]);
  ExecuteCommandFmt('delete from day_part_location where day_part_id = %f', [ TblMasterID.asFloat ]);

  Reopen(TblMaster);
  Reopen(TblMasterLoc);
  Reopen(TblDetail);

  IQMS.Common.Controls.PostMessageToForm('TMainProdRep', iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmDispoReverseProduction.ExecuteTransaction;
var
  I: Integer;
begin
  {just prior to executing the transaction loop over the objects and change the sign to minus}
  with TransDispo1 do
    for I:= 0 to TransObjects.Count - 1 do
    begin
      if TIQWebInvTranBase( TransObjects[ I ]) is TIQWebTransIn then with TIQWebTransIn( TransObjects[ I ]) do
         begin
           Trans_Quan   := - Trans_Quan;
           Trans_RG_Quan:= - Trans_RG_Quan;
           Act_Cost     := - Act_Cost;
         end
      else if TIQWebInvTranBase(TransObjects[ I ]) is TIQWebTransOut then with TIQWebTransOut( TransObjects[ I ]) do
         begin
           Trans_Quan   := - Trans_Quan;
           Trans_RG_Quan:= - Trans_RG_Quan;
         end
      else if TIQWebInvTranBase(TransObjects[ I ]) is TIQWebTranOverhead then with TIQWebTranOverhead( TransObjects[ I ]) do
         begin
           Act_Cost:= - Act_Cost;
         end
      else if TIQWebInvTranBase(TransObjects[ I ]) is TIQWebTranLabor then with TIQWebTranLabor( TransObjects[ I ]) do
         begin
           Act_Cost:= - Act_Cost;
         end
    end;

  TransDispo1.Trans_Note:= 'Reverse Disposition';

  inherited;
end;

procedure TFrmDispoReverseProduction.AddLabor(const AIN_OUT: string);
begin
  ReverseLabor( AIn_Out );      // in TFrmDispoProduction
end;


procedure TFrmDispoReverseProduction.AddOverhead(const AIN_OUT: string);
begin
  ReverseOverhead( AIn_Out );   // in TFrmDispoProduction
end;

procedure TFrmDispoReverseProduction.SetDataSetReadOnly;
var
  IsDispo: Boolean;
begin
  IsDispo:= Dispositioned = 'Y';
  dbchkDispo.Color:= TColor( iIIf( IsDispo, Ord(clRed), Ord(clBtnFace)));

  // IQSetTablesActive( TRUE, self );
  TblMasterLoc.Open;
  TblDetail.Open;
  TblDetailLoc.Open;

  btnDisposition.Enabled:= Dispositioned = 'Y';
end;

procedure TFrmDispoReverseProduction.BeforeTransDispoAddOut( ADay_Part_ID: Real; AQry: TDataSet; AMaster_Label_List: TStringList );
var
  ADispoOutTranslog_ID: Real;
  A: Variant;
  ALoc_ID: Real;
begin
  // inherited;

  // when reverse dispo of manual dispo no need to do anything
  // 03-04-2014 EIQ-2425 ShopData -> Floor Disposition -> Out -> SIC items must make the inventory transaction on post
  // always run the fgmulti check
  // if Assigned(AMaster_Label_List) and (AMaster_Label_List.Count > 0) then
  //    EXIT;

  // ensure fgmulti_id exists
  if SelectValueByID('1', 'fgmulti', AQry.FieldByName('fgmulti_id').asFloat ) = 1 then
     EXIT;

  // restore fgmulti based on the translog. first find the translog representing dispo out of the consumed material at the time of the disposition
  ADispoOutTranslog_ID:= SelectValueFmtAsFloat('select max(id)                        '+
                                   '  from translog                       '+
                                   ' where day_part_id = %f               '+
                                   '   and fgmulti_id = %f                '+
                                   '   and trans_in_out = ''OUT''         '+
                                   '   and trans_reason = ''DISPOSITION'' '+
                                   '   and nvl(trans_note, ''*'') <> ''Reverse Disposition'' ',
                                   [ ADay_Part_ID,
                                     AQry.FieldByName('fgmulti_id').asFloat ]);
  IQAssert( ADispoOutTranslog_ID > 0, 'Unable to find dispo out record in the translog identifying consumed material');

  A:= SelectValueArrayFmt('select arinvt_id, loc_desc, lotno, eplant_id from translog where id = %f', [ ADispoOutTranslog_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Invalid translog ID %.0f', [ ADispoOutTranslog_ID ]));

  ALoc_ID:= SelectValueFmtAsFloat('select id from locations where rtrim(loc_desc) = ''%s'' and nvl(eplant_id,0) = %f', [  A[ 1 ], DtoF( A[ 3 ])]);
  IQAssert( ALoc_ID > 0, Format('Unable to determine master location ID based on translog ID %.0f', [ ADispoOutTranslog_ID ]));

  ExecuteCommandFmt('insert into fgmulti ( id, arinvt_id, loc_id, lotno ) values (%f, %f, %f, ''%s'' )',
            [ AQry.FieldByName('fgmulti_id').asFloat,
              DtoF(A[ 0 ]), // arinvt_id
              ALoc_ID,
              A[ 2 ]]);  // lotno
end;


end.
