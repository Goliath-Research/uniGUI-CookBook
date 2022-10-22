unit TranAdjQtyIn;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniDBComboBox;

type
  TFrmTranAdjQtyIn = class(TUniForm)
    Label1: TUniLabel;
    edQty: TUniEdit;
    Label2: TUniLabel;
    edSerial: TUniEdit;
    btkOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    Label6: TUniLabel;
    wwComboTransCode: TUniDBLookupComboBox;
    wwQryTransCode: TFDQuery;
    wwQryTransCodeCODE: TStringField;
    wwQryTransCodeDESCRIP: TStringField;
    wwQryTransCodeID: TBCDField;
    lblReason: TUniLabel;
    edReason: TUniComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btkOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure AdjustInSyncMasterLabelFGMulti(AMaster_Label_ID, AOldQty,
      ANewQty: Real);
    procedure CheckAdjustSerializedItemFgMultiQty(AMaster_Label_ID,
      AAdjQty: Real);
  protected
    FMaster_Label_ID : Real;
    FMaster_Label_Qty: Real;
    FFGMulti_ID      : Real;
    FTransReason     : string;
    FTrans_Code_ID   : Real;
    procedure Validate; virtual;
    procedure DoOnStartUp; virtual;
    procedure ExecuteAdjustment( AFGMulti_ID, AQty, AMaster_Label_ID: Real; AReason: string; ATrans_Date: TDateTime; ATrans_Code_ID: Real = 0 ); virtual;
    procedure SetMaster_Label_ID(AMaster_Label_ID: Real);
  public
    { Public declarations }
    class function DoShowModal( AMaster_Label_ID, AFGMulti_ID: Real ): Boolean;
    property Master_Label_ID :Real read FMaster_Label_ID Write SetMaster_Label_ID;
    property FGMulti_ID :Real read FFGMulti_ID Write FFGMulti_ID;
  end;


implementation

{$R *.dfm}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.Trans,
  IQMS.Common.JumpConstants;

{ TFrmTransAdjQtyIn }

class function TFrmTranAdjQtyIn.DoShowModal( AMaster_Label_ID, AFGMulti_ID: Real ): Boolean;
var
  FrmTranAdjQtyIn: TFrmTranAdjQtyIn;
begin
  FrmTranAdjQtyIn:=TFrmTranAdjQtyIn.Create(uniGUIApplication.UniApplication);
  with FrmTranAdjQtyIn do
  begin
    Master_Label_ID:=AMaster_Label_ID;
    FGMulti_ID     := AFGMulti_ID;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmTranAdjQtyIn.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmTranAdjQtyIn.SetMaster_Label_ID(AMaster_Label_ID: Real);
begin
  FMaster_Label_ID:=AMaster_Label_ID;

  IQAssert( 0 = SelectValueByID('ps_ticket_dtl_id', 'master_label', Master_Label_ID),
            inv_rscstr.cTXT0000210 {This serial number is scanned to pickticket - operation aborted.} );
  edSerial.Text    := SelectValueByID('serial', 'master_label', Master_Label_ID );
  FMaster_Label_Qty:= SelectValueByID('qty', 'master_label', Master_Label_ID );
end;

procedure TFrmTranAdjQtyIn.UniFormCreate(Sender: TObject);
begin
  edQty.Text       := FloatToStr(FMaster_Label_Qty);

  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );

  DoOnStartUp;  {allow extra processing for inherited TranAdjQtyOut}
end;

procedure TFrmTranAdjQtyIn.DoOnStartUp;
begin
end;

procedure TFrmTranAdjQtyIn.btkOKClick(Sender: TObject);
begin
  Validate;
  AdjustInSyncMasterLabelFGMulti( FMaster_Label_ID, FMaster_Label_Qty, StrToFloat( edQty.Text ));
  ModalResult:= mrOK;
end;

procedure TFrmTranAdjQtyIn.Validate;
begin
  IQAssert( StrToFloat( edQty.Text ) > FMaster_Label_Qty, Format('Qty must be greater than %f', [ FMaster_Label_Qty ]));

  FTransReason:= edReason.Text;
  if FTransReason = '' then
     FTransReason:= 'Inventory Adjustment';
end;

procedure TFrmTranAdjQtyIn.AdjustInSyncMasterLabelFGMulti( AMaster_Label_ID, AOldQty, ANewQty: Real );
var
  AForm: TUniForm;
begin
  UniMainModule.FDConnection1.StartTransaction;
  try

    CheckAdjustSerializedItemFgMultiQty( AMaster_Label_ID, Abs( ANewQty - AOldQty ));
    ExecuteCommandFmt('update master_label set qty = %.6f where id = %f', [ ANewQty, AMaster_Label_ID ]);

    UniMainModule.FDConnection1.Commit;

    AForm:= FindFormByClassName( 'TFrmTranMain' );  {IQMS.Common.Controls.pas}
    if Assigned(AForm) then
       PostMessage( AForm.Handle, iq_RefreshDataSets , 0, 0 );
  finally
    if UniMainModule.FDConnection1.InTransaction then
       UniMainModule.FDConnection1.RollBack;
  end;
end;

procedure TFrmTranAdjQtyIn.CheckAdjustSerializedItemFgMultiQty( AMaster_Label_ID, AAdjQty: Real );
var
  A: Variant;
  AArinvt_ID : Real;
begin
  if AAdjQty = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select arinvt_id from master_label where id = %f', [ AMaster_Label_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format( 'Cannot find master label [ID: %.0f]', [ AMaster_Label_ID ]));

  AArinvt_ID := A[ 0 ];

  if SelectValueByID('is_linked_to_serial', 'arinvt', AArinvt_ID) <> 'Y' then
     EXIT;

  IQAssert( FFGMulti_ID > 0,  'This is a serialized inventory item with unknown location ID - unable to continue');

  if wwComboTransCode.Text > '' then
     FTrans_Code_ID:= wwQryTransCode.FieldByName('ID').asFloat;

  ExecuteAdjustment( FFGMulti_ID, AAdjQty, AMaster_Label_ID, FTransReason, Now, FTrans_Code_ID );
end;

procedure TFrmTranAdjQtyIn.ExecuteAdjustment( AFGMulti_ID, AQty, AMaster_Label_ID: Real; AReason: string; ATrans_Date: TDateTime; ATrans_Code_ID: Real = 0 );
begin
  with TIQWebTransIn.Create(self) do
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
  finally
    Free;
  end;
end;



end.
