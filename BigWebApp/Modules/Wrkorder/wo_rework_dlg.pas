unit wo_rework_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmReworkDlg = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    pnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    edMfgNo: TUniEdit;
    edQty: TUniEdit;
    timepkDueDate: TUniDateTimePicker;
    edItemNo: TUniEdit;
    Panel6: TUniPanel;
    sbtnMfgNo: TUniSpeedButton;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgSTANDARD_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMfgNoClick(Sender: TObject);
    procedure PkMfgBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure PkMfgIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FStandard_ID: Real;
    FQty: Real;
    procedure SetStandard_ID(const Value: Real);
    procedure Validate;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    FWorkorder_ID: Real;
    property Standard_ID: Real read FStandard_ID write SetStandard_ID;
    //constructor Create(AOwner: TComponent; AArinvt_ID: Real);
    Property Arinvt_ID: Real write SetArinvt_ID;
    class function DoShowModal(AOwner: TComponent; AArinvt_ID: Real;
      var AWorkorder_ID: Real): Boolean;
  end;


implementation

{$R *.dfm}


uses
  //Bom_ShellExA,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  RBom_Share;
  //WO_Main;

{ TFrmReworkDlg }

//constructor TFrmReworkDlg.Create(AOwner: TComponent; AArinvt_ID: Real);
//begin
//  FArinvt_ID := AArinvt_ID;
//  inherited Create(AOwner);
//  edItemNo.Text := SelectValueByID('itemno', 'arinvt', FArinvt_ID);
//  timepkDueDate.Date := Date;
//end;

class function TFrmReworkDlg.DoShowModal(AOwner: TComponent; AArinvt_ID: Real;
  var AWorkorder_ID: Real): Boolean;
begin
  with Self.Create(UniGUIApplication.UniApplication) do
 begin
      Arinvt_ID := AArinvt_ID;
      Result := ShowModal = mrOK;
      if Result then
        AWorkorder_ID := FWorkorder_ID;
    end;
end;

procedure TFrmReworkDlg.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlLeft01]);
end;

procedure TFrmReworkDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlLeft01]);
end;

procedure TFrmReworkDlg.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmReworkDlg.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
  edMfgNo.Text := SelectValueByID('mfgno', 'standard', FStandard_ID);
end;

procedure TFrmReworkDlg.UniFormCreate(Sender: TObject);
begin
  inherited;
  edItemNo.Text := SelectValueByID('itemno', 'arinvt', FArinvt_ID);
  timepkDueDate.DateTime := Date;
end;

procedure TFrmReworkDlg.sbtnMfgNoClick(Sender: TObject);
begin
  with PkMfg do
    if Execute then
      Standard_ID := GetValue('STANDARD_ID');
end;

procedure TFrmReworkDlg.PkMfgBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmReworkDlg.btnOKClick(Sender: TObject);
begin
  Validate;
  //FWorkorder_ID := WO_Main.DoAddShowWorkOrder(Application, Standard_ID,
    //FArinvt_ID, FQty, timepkDueDate.DateTime, 'N');
  ModalResult := mrOK;
end;

procedure TFrmReworkDlg.Validate;
begin
  IQAssert(Standard_ID > 0, 'Rework Mfg# is not assigned - operation aborted');
  IQAssert(timepkDueDate.DateTime > 0,
    'Due Date is not assigned - operation aborted');
  IQAssert(IQMS.Common.Numbers.IsStringValidFloat(edQty.Text, FQty),
    'Invalid Qty - operation aborted');
  IQAssert(FQty > 0, 'Qty must be greater than zero - operation aborted');
end;

procedure TFrmReworkDlg.PkMfgIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
var
  AArinvt_ID: Real;
  AStandard_ID: Real;
  AParent_Arinvt_ID: Real;
  AParent_Standard_ID: Real;
begin
  AArinvt_ID := FArinvt_ID;
  AStandard_ID := 0;
  AParent_Arinvt_ID := 0;
  AParent_Standard_ID := 0;

//  if TBomShellExB.DoModalBOM(
//    Self, {Bom_ShellExA.pas}
//    RBom_Share.bomNew,
//    AArinvt_ID,
//    AStandard_ID,
//    AParent_Arinvt_ID,
//    AParent_Standard_ID,
//    VarArrayOf(['REWORK', // mfgtype
//    '', // center_type
//    FArinvt_ID])) then // arinvt_id
  begin
    ResultValue := AStandard_ID;
    Action := mrOK;
  end;
end;

end.
