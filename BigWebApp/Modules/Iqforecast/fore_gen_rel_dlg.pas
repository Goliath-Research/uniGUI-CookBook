unit fore_gen_rel_dlg;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  ExtCtrls,
  ComCtrls,
  DB,
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
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  UniDBDateTimePicker, uniDateTimePicker;

type
  TForePasteMode = ( fpmCancel, fpmAppend, fpmOverwrite );

  TForeGenRelCargo = record
    Count       : Integer;
    Qty_Per     : Real;
    Start_Date  : TDateTime;
    Interval    : Real;
    Overwrite   : Boolean;
    Arcusto_ID  : Real;
    Ship_To_ID  : Real;
  end;

  TFrmForecasrGenerateReleaseDlg = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnAppend: TUniButton;
    brnOverwrite: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    PnlClient02: TUniPanel;
    edtCount: TUniEdit;
    edtQty: TUniEdit;
    edtInterval: TUniEdit;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    Label5: TUniLabel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    PnlClient03: TUniPanel;
    Label6: TUniLabel;
    Bevel5: TUniPanel;
    PnlLeft02: TUniPanel;
    Bevel6: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient04: TUniPanel;
    wwDBComboDlgCustomer: TUniEdit;
    chkCustomer: TUniCheckBox;
    chkShipTo: TUniCheckBox;
    wwDBComboDlgShipTo: TUniEdit;
    dtpStartDate: TUniDBDateTimePicker;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkShipTo: TIQWebHPick;
    PkShipToID: TBCDField;
    PkShipToARCUSTO_ID: TBCDField;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToADDR2: TStringField;
    PkShipToADDR3: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToCOUNTRY: TStringField;
    PkShipToZIP: TStringField;
    PkShipToSHIP_TIME: TBCDField;
    PkShipToPHONE_NUMBER: TStringField;
    PkShipToEXT: TStringField;
    PkShipToFAX: TStringField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToFREIGHT_ID: TBCDField;
    PkShipToDESCRIP: TStringField;
    PkShipToEPLANT_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure brnOverwriteClick(Sender: TObject);
    procedure chkCustomerClick(Sender: TObject);
    procedure chkShipToClick(Sender: TObject);
    procedure wwDBComboDlgCustomerCustomDlg(Sender: TObject);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgShipToCustomDlg(Sender: TObject);
    procedure PnlClient04Resize(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPasteMode: TForePasteMode;
    FArcusto_ID: Real;
    FShip_To_ID: Real;
    procedure InitForm;
  public
    { Public declarations }
    class function DoShowModal(var ACargo: TForeGenRelCargo): Boolean;
    procedure SaveTo( var ACargo: TForeGenRelCargo );
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

{ TFrmForecasrGenerateReleaseDlg }


procedure TFrmForecasrGenerateReleaseDlg.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, PnlLeft01, PnlLeft02 ]);
  InitForm;
end;

class function TFrmForecasrGenerateReleaseDlg.DoShowModal(var ACargo: TForeGenRelCargo): Boolean;
var
  FrmForecasrGenerateReleaseDlg: TFrmForecasrGenerateReleaseDlg;
begin
  FrmForecasrGenerateReleaseDlg := TFrmForecasrGenerateReleaseDlg.Create( uniGUIApplication.uniApplication );
  Result:= FrmForecasrGenerateReleaseDlg.ShowModal = mrOK;
  if Result then
    FrmForecasrGenerateReleaseDlg.SaveTo(ACargo);
end;


procedure TFrmForecasrGenerateReleaseDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01, PnlLeft02 ]);
end;


procedure TFrmForecasrGenerateReleaseDlg.InitForm;
begin
  edtCount.Text    := '1';
  dtpStartDate.DateTime:= Date;
  edtInterval.Text := '7';
  edtQty.Text      := '0';
end;

procedure TFrmForecasrGenerateReleaseDlg.SaveTo( var ACargo: TForeGenRelCargo);
begin
  with ACargo do
  begin
    Count     := StrToInt(edtCount.Text);
    Start_Date:= dtpStartDate.DateTime;
    Interval  := StrToFloat(edtInterval.Text);
    Qty_Per   := StrToFloat(edtQty.Text);
    Overwrite := (FPasteMode = fpmOverwrite);
    Arcusto_ID:= FArcusto_ID;
    Ship_To_ID:= FShip_To_ID;
  end;
end;

procedure TFrmForecasrGenerateReleaseDlg.brnOverwriteClick( Sender: TObject);
begin
  {Validate}
  IQAssert( StrToInt(edtCount.Text) > 0,      'Number of releases must be greater than 0');
  IQAssert( StrToFloat(edtQty.Text) > 0,      'Qty must be greater than 0');
  IQAssert( dtpStartDate.DateTime > 0,            'Start Date must be entered');
  IQAssert( StrToFloat(edtInterval.Text) > 0, 'Number of intervals must be greater than 0');

  if chkCustomer.Checked then
     IQAssert( FArcusto_ID > 0, 'Customer must be specified.');

  if chkShipTo.Checked then
     IQAssert( FShip_To_ID > 0, 'Ship To must be specified.');

  if Sender = btnAppend then
     FPasteMode:= fpmAppend

  else if Sender = brnOverwrite then
     FPasteMode:= fpmOverwrite;

  ModalResult:= mrOK;
end;

procedure TFrmForecasrGenerateReleaseDlg.chkCustomerClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl( wwDBComboDlgCustomer,  chkCustomer.Checked );
  IQMS.Common.Controls.IQEnableControl( chkShipTo,             chkCustomer.Checked );

  if not chkCustomer.Checked then
  begin
    wwDBComboDlgCustomer.Text:= '';
    FArcusto_ID:= 0;
    chkShipTo.Checked:= FALSE;
  end;

  chkShipToClick(nil);
end;

procedure TFrmForecasrGenerateReleaseDlg.chkShipToClick(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl( wwDBComboDlgShipTo, chkShipTo.Checked );
  if not chkShipTo.Checked then
  begin
    wwDBComboDlgShipTo.Text:= '';
    FShip_To_ID:= 0;
  end;
end;

procedure TFrmForecasrGenerateReleaseDlg.wwDBComboDlgCustomerCustomDlg(
  Sender: TObject);
begin
  with PkArcusto do
    if Execute then
    begin
      if FArcusto_ID <> GetValue('ID') then
      begin
        wwDBComboDlgShipTo.Text:= '';
        FShip_To_ID:= 0;
        FArcusto_ID:= GetValue('ID');
      end;
      wwDBComboDlgCustomer.Text:= GetValue('CUSTNO');
    end;
end;

procedure TFrmForecasrGenerateReleaseDlg.PkShipToBeforeOpen(DataSet: TDataSet);
begin
//  with DataSet as TFDQuery do ParamByName('arcusto_id').asFloat:= FArcusto_ID;
  AssignQueryParamValue(DataSet, 'arcusto_id', FArcusto_ID);
end;

procedure TFrmForecasrGenerateReleaseDlg.wwDBComboDlgShipToCustomDlg(
  Sender: TObject);
begin
  with PkShipTo do
    if Execute then
    begin
      FShip_To_ID:= GetValue('ID');
      wwDBComboDlgShipTo.Text:= GetValue('ATTN');
    end;
end;

procedure TFrmForecasrGenerateReleaseDlg.PnlClient04Resize(Sender: TObject);
begin
  IQMS.Common.Controls.RefreshComponentsEx( [ wwDBComboDlgCustomer, wwDBComboDlgShipTo ], nil );
end;

end.
