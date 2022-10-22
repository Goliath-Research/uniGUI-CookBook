unit ps_archive;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
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
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmPSArchive = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    SrcShipments: TDataSource;
    QryShipments: TFDQuery;
    QryShipmentsPACKSLIPNO: TStringField;
    QryShipmentsFOB: TStringField;
    QryShipmentsSHIPDATE: TDateTimeField;
    QryShipmentsPS_DATE: TDateTimeField;
    QryShipmentsARCUSTO_CUSTNO: TStringField;
    QryShipmentsSHIP_TO_ATTN: TStringField;
    QryShipmentsSHIP_TO_ADDR1: TStringField;
    QryShipmentsSHIP_TO_ADDR2: TStringField;
    QryShipmentsSHIP_TO_ADDR3: TStringField;
    QryShipmentsSHIP_TO_CITY: TStringField;
    QryShipmentsSHIP_TO_STATE: TStringField;
    QryShipmentsSHIP_TO_COUNTRY: TStringField;
    QryShipmentsSHIP_TO_ZIP: TStringField;
    QryShipmentsBILL_TO_ATTN: TStringField;
    QryShipmentsBILL_TO_ADDR1: TStringField;
    QryShipmentsBILL_TO_ADDR2: TStringField;
    QryShipmentsBILL_TO_ADDR3: TStringField;
    QryShipmentsBILL_TO_CITY: TStringField;
    QryShipmentsBILL_TO_STATE: TStringField;
    QryShipmentsBILL_TO_COUNTRY: TStringField;
    QryShipmentsBILL_TO_ZIP: TStringField;
    QryShipmentsARCUSTO_COMPANY: TStringField;
    QryShipmentsSHIP_VIA: TStringField;
    QryShipmentsFREIGHT_DESCRIP: TStringField;
    QryShipmentsEPLANT_ID: TBCDField;
    QryShipmentsTRACKING_NUM: TStringField;
    QryShipmentsVMI: TStringField;
    QryShipmentsID: TBCDField;
    QryShipmentsPS_TICKET_ID: TBCDField;
    QryShipmentsPS_TICKET_BATCH: TBCDField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    StatusBar1: TUniStatusBar;
    SR: TIQWebSecurityRegister;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  { TODO -oGPatil -cWebConvert : Dependency on Files
  CheckVerification,
  IQSecIns, }
  IQMS.Common.NLS,
  packslip_rscstr;

class function TFrmPSArchive.DoShowModal: Boolean;
var
  LFrmPSArchive : TFrmPSArchive;
begin
  LFrmPSArchive := TFrmPSArchive.Create(UniGUIApplication.UniApplication);
  Result := LFrmPSArchive.ShowModal = mrOK;
end;

procedure TFrmPSArchive.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
{ TODO -oGPatil -cWebConvert : Dependency on Files
  EnsureSecurityInspectorOnTopOf(self); }
end;

procedure TFrmPSArchive.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmPSArchive.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG{CHM}, iqhtmSHIP{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPSArchive.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPSArchive.btnOKClick(Sender: TObject);
var
  ACount: Integer;
  ACount2: Integer;
  I: Integer;
  AStr: string;
  AConfirm: Integer;
begin
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
  ACount := IQSearch1.DBGrid.SelectedList.Count;  }

  //packslip_rscstr.cTXT0000188 = 'Please select a packing slip.';
  IQAssert(ACount > 0, packslip_rscstr.cTXT0000188);

  //packslip_rscstr.cTXT0000189 =
  //'This process will archive %d packing slips.'#13#13'Do you want to continue?';
  if not IQConfirmYN(Format(packslip_rscstr.cTXT0000189, [ACount])) then
    EXIT;

  ACount2 := 0;
  with IQSearch1 do
    for I := 0 to ACount - 1 do
    begin
      StatusBar1.Update;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
      Datasource.DataSet.GotoBookmark(DBGrid.SelectedList.Items[I]); }
      AStr := SelectValueFmtAsString(
        'select trim(inventory_verified_userid || '' '' || ' +
        'to_char(inventory_verified_date, ''DD/MON/RRRR HH:MM AM'')) ' +
        'from shipments where id = %d',
        [Datasource.DataSet.FieldByName('ID').AsLargeInt]);
      if AStr = '' then
        ACount2 := ACount2 + 1;
    end;

  if ACount2 <> 0 then
  begin
{ TODO -oGPatil -cWebConvert : Dependency on Files
    AConfirm := IQDialogChkEx(TFrmCheckVerification,
      IqFormat(packslip_rscstr.cTXT0000054, [ACount, ACount2]),
      'PS_Confirm_Verification');   }

    if AConfirm <> 1 then
      EXIT;
  end;

  with IQSearch1 do
    for I := 0 to ACount - 1 do
    begin
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain SimpleText
      StatusBar1.SimpleText := Format('Archiving PS# ''%s'' (%d/%d) ...',
        [Datasource.DataSet.FieldByName('packslipno').asString, I, ACount]); }
      StatusBar1.Update;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain selectedlist
      Datasource.DataSet.GotoBookmark(DBGrid.SelectedList.Items[I]); }
      ExecuteCommandFmt('update shipments set ARCHIVED = ''Y'' where id = %f',
        [Datasource.DataSet.FieldByName('ID').asFloat]);
    end;

  ModalResult := mrOK;
end;

end.
