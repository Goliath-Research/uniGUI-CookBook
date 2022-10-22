unit UnArchivePos;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker;

type
  TFrmUnArchivePos = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    UnArchive1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnUnArchive: TUniButton;
    BtnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    DbFrom: TUniDBDateTimePicker;
    DbTo: TUniDBDateTimePicker;
    btnApply: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Src: TDataSource;
    Qry: TFDQuery;
    QryID: TBCDField;
    QryPONO: TStringField;
    QryVENDOR_ID: TBCDField;
    QryPO_DATE: TDateTimeField;
    QryTERMS_ID: TBCDField;
    QryREMIT_TO_ID: TBCDField;
    QrySHIP_TO_ID: TBCDField;
    QryUSERID: TStringField;
    QryFREIGHT_ID: TBCDField;
    QryFOB: TStringField;
    QryTAX_CODE_ID: TBCDField;
    QryCOMMENT1: TStringField;
    QryCOMPANY_ID: TBCDField;
    QryVENDOR_VENDORNO: TStringField;
    QryVENDOR_COMPANY: TStringField;
    QryVENDOR_ATTN: TStringField;
    QryVENDOR_ADDR1: TStringField;
    QryVENDOR_ADDR2: TStringField;
    QryVENDOR_ADDR3: TStringField;
    QryVENDOR_CITY: TStringField;
    QryVENDOR_STATE: TStringField;
    QryVENDOR_COUNTRY: TStringField;
    QryVENDOR_ZIP: TStringField;
    QryTERMS_DESCRIP: TStringField;
    QryTERMS_DAYS: TBCDField;
    QryTERMS_DISCOUNT: TBCDField;
    QryTERMS_DISCOUNT_DAYS: TBCDField;
    QryREMIT_TO_ATTN: TStringField;
    QryREMIT_TO_ADDR1: TStringField;
    QryREMIT_TO_ADDR2: TStringField;
    QryREMIT_TO_ADDR3: TStringField;
    QryREMIT_TO_CITY: TStringField;
    QryREMIT_TO_STATE: TStringField;
    QryREMIT_TO_ZIP: TStringField;
    QryREMIT_TO_COUNTRY: TStringField;
    QrySHIP_TO_ATTN: TStringField;
    QrySHIP_TO_ADDR1: TStringField;
    QrySHIP_TO_ADDR2: TStringField;
    QrySHIP_TO_ADDR3: TStringField;
    QrySHIP_TO_CITY: TStringField;
    QrySHIP_TO_STATE: TStringField;
    QrySHIP_TO_COUNTRY: TStringField;
    QrySHIP_TO_ZIP: TStringField;
    QryCOMPANY_COMPANY: TStringField;
    QryCOMPANY_ADDRESS1: TStringField;
    QryCOMPANY_ADDRESS2: TStringField;
    QryCOMPANY_ADDRESS3: TStringField;
    QryCOMPANY_CITY: TStringField;
    QryCOMPANY_STATE: TStringField;
    QryCOMPANY_ZIP: TStringField;
    QryCOMPANY_COUNTRY: TStringField;
    QryFREIGHT_DESCRIP: TStringField;
    QryTAX_CODES_TAX_CODE: TStringField;
    QryTAX_CODES_TAX_RATE: TFMTBCDField;
    QryBUYERID: TStringField;
    QryCONFIRM_TO: TStringField;
    QryCURRENCY_ID: TBCDField;
    QryFX_RATE: TFMTBCDField;
    QryECODE: TStringField;
    QryEID: TBCDField;
    QryEDATE_TIME: TDateTimeField;
    QryECOPY: TStringField;
    QryCURRENCY_CODE: TStringField;
    QryCURRENCY_DESCRIP: TStringField;
    QryPO_CONTROL: TStringField;
    QryPR_EMP_ID_RQSTNR: TBCDField;
    QryEMPNO_RQSTNR: TStringField;
    QryEPLANT_ID: TBCDField;
    QryPRINT_COUNT: TBCDField;
    QryPRINT_LAST_USER: TStringField;
    QryPRINT_LAST_DATE: TDateTimeField;
    QryARCHIVED_BY: TStringField;
    QryPO_TYPE: TStringField;
    QryAPPROVED_BY: TStringField;
    QryVENDOR_CONTACT_ID: TBCDField;
    QryVENDOR_CONTACT_FIRST: TStringField;
    QryVENDOR_CONTACT_LAST: TStringField;
    QryARCHIVED_DATE: TDateTimeField;
    SR: TIQWebSecurityRegister;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnUnArchiveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShow: Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  po_rscstr;

class function TFrmUnArchivePos.DoShow: Boolean;
var
  LFrmUnArchivePos : TFrmUnArchivePos;
begin
  LFrmUnArchivePos := TFrmUnArchivePos.Create(uniGUIApplication.UniApplication);
  LFrmUnArchivePos.Show;
end;

procedure TFrmUnArchivePos.FormShow(Sender: TObject);
begin
  IQRegFormRead( self,[self]);
end;

procedure TFrmUnArchivePos.UniFormCreate(Sender: TObject);
begin
  DBFrom.DateTime := Date;
  DBTo.DateTime   := Date;
  btnUnArchive.Enabled := false;
  Qry.Close;
end;

procedure TFrmUnArchivePos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self,[self]);
end;

procedure TFrmUnArchivePos.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUnArchivePos.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmUnArchivePos.btnApplyClick(Sender: TObject);
begin
  Qry.Close;
  Qry.ParamByName('AFrom').asDateTime := DBFrom.DateTime;
  Qry.ParamByName('ATo').asDateTime := DBTo.DateTime;
  Qry.Open;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'UnselectAll'
  IQSearch1.DBGrid.UnselectAll; }

  btnUnArchive.Enabled := SR.Enabled['btnUnArchive'];
end;

procedure TFrmUnArchivePos.btnUnArchiveClick(Sender: TObject);
var
  i: integer;
  AList: TList<Int64>;
  AMsg: TPanelMesg;
begin
  if IQSearch1.DBGrid.SelectedRows.Count = 0 then
    raise Exception.Create('Nothing Selected.');

  // po_rscstr.cTXT0000052 = 'Do you wish to UnArchive selected POs?';
  if not IqConfirmYN(po_rscstr.cTXT0000052) then
    Exit;

  AMsg := hPleaseWait(po_rscstr.cTXT0000053);
  try
    AList := TList<Int64>.Create;
    try
      with IQSearch1.DBGrid, IQSearch1.DBGrid.datasource.DataSet do
      begin
        DisableControls;
        for i := 0 to SelectedRows.Count - 1 do
        begin
          GotoBookmark(SelectedRows.items[i]);
          AList.Add(QryID.AsLargeInt);
        end;
        EnableControls;
      end;

      for i := 0 to AList.Count - 1 do
        ExecuteCommandFmt('begin po_unarchive.unarchivepo(%d); end;', [AList[i]]);
    finally
      FreeAndNil(AList);
    end;
  finally
    AMsg.Free;
  end;

  btnApplyClick(nil);

  IQInformation(po_rscstr.cTXT0000054);
end;

end.
