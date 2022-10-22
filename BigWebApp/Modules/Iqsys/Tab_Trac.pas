unit Tab_Trac;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniDBText,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmConfigTrace = class(TUniForm)
    Splitter1: TUniSplitter;
    SrcTables: TDataSource;
    SrcColumns: TDataSource;
    wwTblTR_Tab: TFDTable;
    wwTblTR_Col: TFDTable;
    wwTblTR_TabID: TBCDField;
    wwTblTR_TabTABLE_NAME: TStringField;
    wwTblTR_ColID: TBCDField;
    wwTblTR_ColTR_TAB_ID: TBCDField;
    wwTblTR_ColCOL_NAME: TStringField;
    wwQryCols: TFDQuery;
    wwQryColsCOLUMN_NAME: TStringField;
    wwQryTabs: TFDQuery;
    wwQryTabsTABLE_NAME: TStringField;
    Panel3: TUniPanel;
    wwTblTR_TabTrigger_Status: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SecurityRegister1: TIQWebSecurityRegister;
    Content1: TUniMenuItem;
    PTable: TUniPopupMenu;
    Apply1: TUniMenuItem;
    Panel4: TUniPanel;
    btnApply: TUniButton;
    PnlTracedTables: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Label3: TUniLabel;
    Panel15: TUniPanel;
    wwgridTab: TIQUniGridControl;
    PnlTracedColumns: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Label1: TUniLabel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    wwgridCol: TIQUniGridControl;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    Label2: TUniLabel;
    DBText1: TUniDBText;
    PkTraceTable: TIQWebHPick;
    sbtnSearch: TUniSpeedButton;
    PkTraceTableID: TBCDField;
    PkTraceTableTABLE_NAME: TStringField;
    PkTraceTableSTATUS: TStringField;
    wwTblTR_ColAFTER_INSERT: TStringField;
    wwTblTR_ColAFTER_UPDATE: TStringField;
    wwTblTR_ColAFTER_DELETE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure btnApplyClick(Sender: TObject);
    procedure wwTblTR_TabCalcFields(DataSet: TDataSet);
    procedure wwTblTR_TabBeforeDelete(DataSet: TDataSet);
    procedure DisableTrigger(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Content1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure wwTblTR_ColNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CheckReleasesTable;
  public
    { Public declarations }
  end;

procedure DoConfigTrace;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  //WEB_CONVERT IQSecIns,
  iqsys_rscstr,
  IQMS.Common.Trace;

procedure DoConfigTrace;
begin
  with TFrmConfigTrace.Create( UniGUiApplication.UniApplication ) do
    ShowModal;
end;

procedure TFrmConfigTrace.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, PnlTracedTables, wwgridTab, wwgridCol ]);
end;

procedure TFrmConfigTrace.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlTracedTables, wwgridTab, wwgridCol ]);
end;


procedure TFrmConfigTrace.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmConfigTrace.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TFrmConfigTrace.btnApplyClick(Sender: TObject);
begin
  wwTblTR_Tab.CheckBrowseMode;
  wwTblTR_Col.CheckBrowseMode;
  CheckReleasesTable;
  try
    CreateReplaceT2Trigger( wwTblTR_TabTABLE_NAME.asString );  {IQMS.Common.Trace.pas}
  finally
    wwTblTR_Tab.Refresh;
  end;
end;

procedure TFrmConfigTrace.CheckReleasesTable;
begin
  if wwTblTR_TabTABLE_NAME.asString = 'RELEASES' then
  begin
    if SelectValueFmtAsFloat('select id from tr_col where col_name = ''ID'' and tr_tab_id = %f', [wwTblTR_TabID.asFloat]) = 0 then
       ExecuteCommandFmt('insert into tr_col (col_name, tr_tab_id, after_insert, after_update, after_delete) '+
                 'values (''ID'', %f, ''Y'', ''Y'', ''Y'' )', [wwTblTR_TabID.asFloat]);

    if SelectValueFmtAsFloat('select id from tr_col where col_name = ''ORD_DETAIL_ID'' and tr_tab_id = %f', [wwTblTR_TabID.asFloat]) = 0 then
       ExecuteCommandFmt('insert into tr_col (col_name, tr_tab_id, after_insert, after_update, after_delete) '+
                 'values (''ORD_DETAIL_ID'', %f, ''Y'', ''Y'', ''Y'' )', [wwTblTR_TabID.asFloat]);

    if SelectValueFmtAsFloat('select id from tr_col where col_name = ''PROMISE_DATE'' and tr_tab_id = %f', [wwTblTR_TabID.asFloat]) = 0 then
       ExecuteCommandFmt('insert into tr_col (col_name, tr_tab_id, after_insert, after_update, after_delete) '+
                 'values (''PROMISE_DATE'', %f, ''Y'', ''Y'', ''Y'' )', [wwTblTR_TabID.asFloat]);
    wwTblTR_Col.Refresh;
  end;
end;

procedure TFrmConfigTrace.wwTblTR_TabCalcFields(DataSet: TDataSet);
var
  S: string;
begin
  S:= SelectValueFmtAsString('select status from user_triggers where trigger_name = ''%s''',
                   [ 'T2_'+ wwTblTR_TabTABLE_NAME.asString ]);
  if S = '' then
     wwTblTR_TabTrigger_Status.asString:= iqsys_rscstr.cTXT0000081 // 'Unavailable'
  else
     wwTblTR_TabTrigger_Status.asString:= S;
end;

procedure TFrmConfigTrace.wwTblTR_ColNewRecord(DataSet: TDataSet);
begin
  wwTblTR_ColAFTER_INSERT.asString:= 'Y';
  wwTblTR_ColAFTER_UPDATE.asString:= 'Y';
  wwTblTR_ColAFTER_DELETE.asString:= 'Y';
end;

procedure TFrmConfigTrace.wwTblTR_TabBeforeDelete(DataSet: TDataSet);
begin
  DropT2Trigger( wwTblTR_TabTABLE_NAME.asString );    {IQMS.Common.Trace.pas}
end;

procedure TFrmConfigTrace.DisableTrigger(DataSet: TDataSet);
begin
  try
    DisableT2Trigger( wwTblTR_TabTABLE_NAME.asString ); {IQMS.Common.Trace.pas}
  finally
    wwTblTR_Tab.Refresh;
  end;
end;

procedure TFrmConfigTrace.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfigTrace.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmConfigTrace.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmConfigTrace.sbtnSearchClick(Sender: TObject);
begin
  with PkTraceTable do
   if Execute then
      wwTblTR_Tab.Locate('ID', GetValue('id'), [])
end;

procedure TFrmConfigTrace.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmConfigTrace.FormShow(Sender: TObject);
begin
  //WEB_CONVERT EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmConfigTrace.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmConfigTrace.Content1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
