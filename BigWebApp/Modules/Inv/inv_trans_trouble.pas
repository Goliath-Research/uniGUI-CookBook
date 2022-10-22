unit inv_trans_trouble;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  Mask,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.COmmon.SetPlant,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvTransTrouble = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryInvTransTrouble: TFDQuery;
    SrcInvTransTrouble: TDataSource;
    SR: TIQWebSecurityRegister;
    QryInvTransTroubleSOURCE_MODULE: TStringField;
    QryInvTransTroubleDESCRIP: TStringField;
    QryInvTransTroubleEPlantDisp: TStringField;
    wwDBComboBoxSourceModule: TUniDBComboBox;
    wwDBComboDlgEplantOnForm: TUniEdit;
    QryInvTransTroubleID: TBCDField;
    QryInvTransTroubleEPLANT_ID: TBCDField;
    PkTransTrouble: TIQWebHPick;
    sbtnSearch: TUniSpeedButton;
    PkTransTroubleID: TFloatField;
    PkTransTroubleSOURCE_MODULE: TStringField;
    PkTransTroubleDESCRIP: TStringField;
    PkTransTroubleEPLANT_ID: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgEplantOnFormCustomDlg(Sender: TObject);
    { TODO -oSanketG -cWC : Need to find alternative component for TNavigateBtn }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryInvTransTroubleBeforePost(DataSet: TDataSet);
    procedure QryInvTransTroubleCalcFields(DataSet: TDataSet);
    procedure QryInvTransTroubleNewRecord(DataSet: TDataSet);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: string);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkTransTroubleIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure RestoreSorting;
    { TODO -oSanketG -cWC : Need to revisit, dependent on IQMS.Common.UserMessages }
    //procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;

const
  constInsertNewViaNavigator = 1;

{ TFrmInvTransTrouble }

class procedure TFrmInvTransTrouble.DoShow();
var
  FrmInvTransTrouble: TFrmInvTransTrouble;
begin
  FrmInvTransTrouble := self.Create(UniGUIApplication.uniApplication);
  FrmInvTransTrouble.Show;
end;

procedure TFrmInvTransTrouble.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvTransTrouble.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ TODO -oSanketG -cWC : Need to find alternative component for TNavigateBtn}
{procedure TFrmInvTransTrouble.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;}

procedure TFrmInvTransTrouble.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
end;

{ TODO -oSanketG -cWC : Need to revisit, dependent on IQMS.Common.UserMessages }
{procedure TFrmInvTransTrouble.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    constInsertNewViaNavigator:
      if navMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
         navMain.BtnClick( nbInsert );
  end;
end;}

procedure TFrmInvTransTrouble.PkTransTroubleIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  //PostMessage( self.Handle, IQ_Notify, constInsertNewViaNavigator, 0 );   { Call Insert }
end;

procedure TFrmInvTransTrouble.RestoreSorting;
var
  AScalarString: string;
begin
  if (QryInvTransTrouble.IndexName = '') and IQRegStringScalarRead( self, 'index_field_name', AScalarString ) and (AScalarString > '') then
  begin
    FD_AssignDataSetIndexName( QryInvTransTrouble, AScalarString );
    QryInvTransTrouble.First;
  end;
end;

procedure TFrmInvTransTrouble.sbtnSearchClick(Sender: TObject);
begin
  with PkTransTrouble do
    if Execute then
       QryInvTransTrouble.Locate('id', GetValue('id'), [])
end;

procedure TFrmInvTransTrouble.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
  IQSetTablesActive(TRUE, self);
  RestoreSorting;
  LocateOrPickList( self, 0, QryInvTransTrouble, PkTransTrouble );
end;

procedure TFrmInvTransTrouble.QryInvTransTroubleBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'INV_TRANS_TROUBLE');
end;

procedure TFrmInvTransTrouble.QryInvTransTroubleCalcFields(DataSet: TDataSet);
begin
  if QryInvTransTroubleEPLANT_ID.asFloat > 0 then
     QryInvTransTroubleEplantDisp.asString:= SelectValueByID('name', 'eplant', QryInvTransTroubleEPLANT_ID.asFloat);

end;

procedure TFrmInvTransTrouble.QryInvTransTroubleNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').asFloat:= 0;
end;

procedure TFrmInvTransTrouble.wwDBComboDlgEplantOnFormCustomDlg(
  Sender: TObject);
begin
  DoChangePlantID( QryInvTransTrouble );  {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmInvTransTrouble.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  FD_AssignDataSetIndexName( QryInvTransTrouble, AFieldName );
  IQRegStringScalarWrite( self, 'index_field_name', FD_GetDataSetIndexFieldName( QryInvTransTrouble ));
end;

end.
