unit setup_checklist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmSetupCheckList = class(TUniForm)
    Panel1: TUniPanel;
    sbttnSetupTemplateChecklist: TUniSpeedButton;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    Label1: TUniLabel;
    wwDBComboDlgSetupChecklist: TUniEdit;
    PkTemplate: TIQWebHPick;
    PkTemplateID: TBCDField;
    PkTemplateDESCRIP: TStringField;
    PkTemplateNOTES: TStringField;
    PkTemplateEPLANT_ID: TBCDField;
    QryTemplate: TFDQuery;
    SrcTemplate: TDataSource;
    QryTemplateDESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel10: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    wwDBGridDetail: TIQUniGridControl;
    Splitter3: TUniSplitter;
    IQSearchHeader: TIQUniGridControl;
    QrySetupChecklist: TFDQuery;
    QrySetupChecklistID: TBCDField;
    QrySetupChecklistSETUP_TEMPL_CHKLIST_ID: TBCDField;
    QrySetupChecklistSETUP_TEMPL_DESCRIP: TStringField;
    QrySetupChecklistSETUP_DATE: TDateTimeField;
    QrySetupChecklistWORKORDER_ID: TBCDField;
    QrySetupChecklistSOURCE: TStringField;
    QrySetupChecklistSOURCE_ID: TBCDField;
    QrySetupChecklistCREATED: TDateTimeField;
    QrySetupChecklistCREATEDBY: TStringField;
    SrcSetupChecklist: TDataSource;
    SrcSetupChecklistDetail: TDataSource;
    QrySetupChecklistDetail: TFDQuery;
    QrySetupChecklistDetailID: TBCDField;
    QrySetupChecklistDetailSETUP_CHKLIST_ID: TBCDField;
    QrySetupChecklistDetailSEQ: TBCDField;
    QrySetupChecklistDetailCHECK_TEXT: TStringField;
    QrySetupChecklistDetailCRITICAL: TStringField;
    QrySetupChecklistDetailNOTES: TStringField;
    QrySetupChecklistDetailSTATUS: TStringField;
    QrySetupChecklistDetailCHANGED: TDateTimeField;
    QrySetupChecklistDetailCHANGEDBY: TStringField;
    wwDBComboDlgDetailNote: TUniEdit;
    Contents1: TUniMenuItem;
    PnlCaption: TUniPanel;
    lblCaption: TUniLabel;
    Panel11: TUniPanel;
    Label3: TUniLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbttnSetupTemplateChecklistClick(Sender: TObject);
    procedure wwDBComboDlgSetupChecklistCustomDlg(Sender: TObject);
    procedure QryTemplateBeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgSetupChecklistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PkTemplateBeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwDBComboDlgDetailNoteCustomDlg(Sender: TObject);
    procedure QrySetupChecklistBeforeOpen(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSource: string;
    FSource_ID: Real;
    FSetup_Templ_Chklist_ID: Real;

    procedure UpdateCaption;
    procedure UpdateSetupTemplateChecklist( ASetup_Templ_Chklist_ID: Real );
    procedure SetSource(const Value: string);
    procedure SetSource_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(ASource: string; ASource_ID: Real );
    property Source: string write SetSource;
    property Source_ID: Real write SetSource_ID;
  end;



implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //editmemostr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  setup_template_checklist;

{ TFrmSetupCheckList }
class procedure TFrmSetupCheckList.DoShow(ASource: string;  ASource_ID: Real);
var
  FrmSetupCheckList: TFrmSetupCheckList;
begin
  FrmSetupCheckList := TFrmSetupCheckList.Create(uniGUIApplication.UniApplication);
  FrmSetupCheckList.Source := ASource;
  FrmSetupCheckList.Source_ID := ASource_ID;
  FrmSetupCheckList.Show;
end;

procedure TFrmSetupCheckList.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmSetupCheckList.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmSetupCheckList.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( Self.HelpContext );
end;

procedure TFrmSetupCheckList.UniFormShow(Sender: TObject);
begin

  FSetup_Templ_Chklist_ID:= SelectValueByID('setup_templ_chklist_id', FSource, FSource_ID );

  IQRegFormRead(self, [ self, wwDBGridDetail ]);
  IQSetTablesActive( TRUE, self );
  UpdateCaption;
end;

procedure TFrmSetupCheckList.FormActivate(Sender: TObject);
begin
  if FSource = 'STANDARD' then
    begin
      IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
      Self.HelpContext := 21511;
    end
  else if FSource = 'WORK_CENTER' then
    begin
      IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmICA{HTM} );  {IQMS.Common.HelpHook.pas}
      Self.HelpContext := 21507;
    end
  else if FSource = 'SNDOP' then
    begin
      IQHelp.AssignHTMLFile( iqchmASSY1{CHM}, iqhtmASSY1{HTM} );  {IQMS.Common.HelpHook.pas}
      Self.HelpContext := 21514;
    end;
end;

procedure TFrmSetupCheckList.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  //Action:= caFree;
  IQRegFormWrite(self, [ self, wwDBGridDetail ]);
end;

procedure TFrmSetupCheckList.PkTemplateBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'source', FSource);
end;

procedure TFrmSetupCheckList.QrySetupChecklistBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'source', FSource);
  AssignQueryParamValue(DataSet, 'source_id', FSource_ID);
end;

procedure TFrmSetupCheckList.QryTemplateBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'setup_templ_chklist_id', FSetup_Templ_Chklist_ID);
end;

procedure TFrmSetupCheckList.UpdateCaption;
var
  S: string;
begin
  S:= '?';
  if FSource = 'STANDARD' then
     S:= 'BOM ' + SelectValueByID('mfgno', FSource, FSource_ID)
  else if FSource = 'WORK_CENTER' then
     S:= 'Work Center ' + SelectValueByID('eqno', FSource, FSource_ID)
  else if FSource = 'SNDOP' then
     S:= 'Process ' + SelectValueByID('opno', FSource, FSource_ID);
  Caption:= Format('Setup Checklist [ %s ]', [ S ]);
end;


procedure TFrmSetupCheckList.wwDBComboDlgDetailNoteCustomDlg(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit after editmemostr conversion}
  //DoDBEditMemoStr( self, QrySetupChecklistDetailNOTES, SrcSetupChecklistDetail );      // editmemostr.pas
end;

procedure TFrmSetupCheckList.wwDBComboDlgSetupChecklistCustomDlg(
  Sender: TObject);
begin
  with PkTemplate do
    if Execute then
       UpdateSetupTemplateChecklist( GetValue('ID'));
end;

procedure TFrmSetupCheckList.wwDBComboDlgSetupChecklistKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) and IQConfirmYN('Clear Setup Template Checklist?') then
  begin
    UpdateSetupTemplateChecklist( 0 );
    Key:= 0;
  end;
end;

procedure TFrmSetupCheckList.UpdateSetupTemplateChecklist( ASetup_Templ_Chklist_ID: Real );
begin
  ExecuteCommandFmt('update %s set setup_templ_chklist_id = %s where id = %f',
            [ FSource,
              IQMS.Common.StringUtils.FloatToStr0asNull( ASetup_Templ_Chklist_ID, 'null' ),
              FSource_ID ]);

  FSetup_Templ_Chklist_ID:= ASetup_Templ_Chklist_ID;

  Reopen( QryTemplate );
end;

procedure TFrmSetupCheckList.sbttnSetupTemplateChecklistClick(Sender: TObject);
begin
   TFrmSetupTemplateChecklist.DoShow( FSource );  // setup_template_checklist.pas
end;

procedure TFrmSetupCheckList.SetSource(const Value: string);
begin
  FSource := Value;
end;

procedure TFrmSetupCheckList.SetSource_ID(const Value: Real);
begin
  FSource_ID := Value;
end;

end.

