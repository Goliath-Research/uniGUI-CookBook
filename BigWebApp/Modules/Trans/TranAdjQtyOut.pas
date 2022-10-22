unit TranAdjQtyOut;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  TranAdjQtyIn,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB, Vcl.StdCtrls,
  uniComboBox,
  uniMultiItem,
  uniDBComboBox,
  uniDBLookupComboBox,
  uniButton,
  uniEdit,
  uniPanel,
  Vcl.Controls,
  uniLabel,
  uniGUIApplication;

type
  TFrmTranAdjQtyOut = class(TFrmTranAdjQtyIn)
    chkScrap: TUniCheckBox;
    procedure chkScrapClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure DoOnStartUp; override;
    procedure Validate; override;
    procedure ExecuteAdjustment(AFGMulti_ID, AQty, AMaster_Label_ID: Real; AReason: string; ATrans_Date: TDateTime; ATrans_Code_ID: Real ); override;
  public
    { Public declarations }
  end;

  function DoShowModal( AMaster_Label_ID, AFGMulti_ID: Real ): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.Trans,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

{ TFrmTransAdjQtyOut }


procedure TFrmTranAdjQtyOut.DoOnStartUp;
begin
end;

function DoShowModal( AMaster_Label_ID, AFGMulti_ID: Real ): Boolean;
var
  FrmTranAdjQtyOut: TFrmTranAdjQtyOut;
begin
  FrmTranAdjQtyOut := TFrmTranAdjQtyOut.Create(uniGUIApplication.UniApplication);
  with FrmTranAdjQtyOut do
  begin
    Master_Label_ID := AMaster_Label_ID;
    FGMulti_ID      := AFGMulti_ID;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmTranAdjQtyOut.ExecuteAdjustment(AFGMulti_ID, AQty, AMaster_Label_ID: Real; AReason: string; ATrans_Date: TDateTime; ATrans_Code_ID: Real);
begin
  // inherited;

  with TIQWebTransOut.Create(Application) do
  try
    FGMulti_ID   := AFGMulti_ID;
    Trans_Quan   := AQty;
    Trans_Reason := AReason;
    Act_Cost     := 0;
    Trans_Date   := ATrans_Date;

    if ATrans_Code_ID > 0 then
      Trans_Code_ID:= ATrans_Code_ID;

    if AMaster_Label_ID > 0 then
    begin
      Trans_Source   := 'MASTER_LABEL';
      Trans_Source_ID:= AMaster_Label_ID;
    end;

    Execute;

    if chkScrap.Checked then
       {insert rejects and populate arinvt_id}
       ExecuteCommandFmt('insert into rejects '+
                 '       ( prod_date, shift, hist_illum_part_id, rejects, arinvt_id) ' +
                 'values ( To_Date(''%s'', ''MM/DD/RRRR hh24:mi:ss''), NULL, NULL, %f, %f )',
                 [ FormatDateTime('mm/dd/yyyy hh:nn:ss', ATrans_Date ),
                   AQty,
                   SelectValueFmtAsFloat('select arinvt_id from fgmulti where id = %f', [ AFGMulti_ID ])]);
  finally
    Free;
  end;

end;

procedure TFrmTranAdjQtyOut.UniFormShow(Sender: TObject);
var
  AStandard_ID: Real;
begin
  {populate scrap reason}
  AStandard_ID:= SelectValueByID('standard_id', 'master_label', FMaster_Label_ID);
  edReason.Items.Clear;
  with TFDQuery.Create( nil ) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( Format('select RPad(reject_code,6) || RTrim(attribute )from REJECT_CODE '+
                    ' where rt_misc.filter_mfgcell( %.0f, mfgcell_id ) = 1 '+
                    '   and nvl(pk_hide, ''N'') <> ''Y'' '+
                    ' order by reject_code',
                    [ DtoF(SelectValueByID( 'mfgcell_id', 'standard', AStandard_ID ))]));
    Open;
    while not Eof do
    begin
      edReason.Items.Add( Fields[ 0 ].asString);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmTranAdjQtyOut.Validate;
begin
  IQAssert( (0 < StrToFloat( edQty.Text )) and
            (StrToFloat( edQty.Text ) < FMaster_Label_Qty), Format('Qty must be a positive number below %f', [ FMaster_Label_Qty ]));

  if chkScrap.Checked and (edReason.Text = '') then
      raise Exception.Create('Inventory Scrap transaction must have Reject Code assigned');

  FTransReason:= edReason.Text;
  if FTransReason = '' then
     FTransReason:= 'Inventory Adjustment';
end;


procedure TFrmTranAdjQtyOut.chkScrapClick(Sender: TObject);
begin
  if chkScrap.Checked then
  begin
    edReason.Style   := Vcl.StdCtrls.csDropDownList;
    lblReason.Caption:= 'Scrap';
    edReason.Hint    := 'Enter Scrap Code';
  end
  else
  begin
    edReason.Style   := Vcl.StdCtrls.csSimple;
    lblReason.Caption:= 'Reason';
    edReason.Hint    := '';
  end;
end;


end.
