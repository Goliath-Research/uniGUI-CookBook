unit FAGLPost;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFAGlPost = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    SrcPrepost: TDataSource;
    QryPrepost: TFDQuery;
    IQSearch1: TIQUniGridControl;
    Label9: TUniLabel;
    SBPeriod: TUniSpeedButton;
    DBEditPeriod: TUniEdit;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    SBPostGL: TUniSpeedButton;
    PosttoGL1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    QryPrepostID: TBCDField;
    QryPrepostFA_BOOK_ID: TBCDField;
    QryPrepostPOST_DATE: TDateTimeField;
    QryPrepostGLPERIODS_ID: TBCDField;
    QryPrepostAMOUNT: TBCDField;
    QryPrepostBEG_BALANCE: TStringField;
    QryPrepostGLBATCHID_ID: TBCDField;
    QryPrepostBOOK_DESCRIP: TStringField;
    QryPrepostFA_MAIN_ID: TBCDField;
    QryPrepostASSET_NO: TStringField;
    QryPrepostASSET_DESCRIP: TStringField;
    QryPrepostGLACCT_ID_ASSET: TBCDField;
    QryPrepostGLACCT_ID_DEPRECIATION: TBCDField;
    QryPrepostGLACCT_ID_EXPENSE: TBCDField;
    QryPrepostASSET_ACCOUNT: TStringField;
    QryPrepostDEPR_ACCOUNT: TStringField;
    QryPrepostEXPENCE_ACCOUNT: TStringField;
    N1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure FormShow(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBPeriodClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBPostGLClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FGlPeriod:Real;
    FList:TStringList;
    FGLBatchDate:TDateTime;
    FGLBatchIdId:Real;
    procedure AssignPeriod(AId:Real);
    procedure InsertGlbatchId;
    procedure PostToGL;
    procedure PrintAfterPostReport;
    procedure SetCriteriaExpression( List:TStringList; cStr:String );
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);override;
  end;

procedure DoFAPrepostGL(Aowner:TComponent);

var
  FrmFAGlPost: TFrmFAGlPost;

implementation
uses
  ArShare,
  DateDlg,
  edbadord,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Print,
  IQMS.Common.RegFrm,
  IqSecIns,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Sequence;
{$R *.DFM}


procedure DoFAPrepostGL(Aowner:TComponent);
begin
  with TFrmFAGlPost.Create(AOwner) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

constructor TFrmFAGlPost.Create(AOwner:TComponent);
var
  AId:Real;
begin
  inherited;
  IQRegFormRead( self, [self, Panel1]);
  AId :=  SelectValueFmtAsFloat('select id from glperiods where To_Date(''%s'', ''MM/DD/RRRR'') between start_date and end_date and GL.CheckGLYearEplant(id) = 1',
            [FormatDateTime('mm/dd/yyyy', Date)]);
  if Aid <> 0 then
    AssignPeriod(AId);
end;

procedure TFrmFAGlPost.FormShow(Sender: TObject);
begin
  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmFAGlPost.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmFAGlPost.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmFAGlPost.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFAGlPost.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFAGlPost.AssignPeriod(AId:Real);
var
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    Connection := MainModule.FDConnection;
    Sql.Add(IQFormat('select period, start_date, end_date from glperiods where id = %f', [AId]));
    Open;
    if not Eof then
    begin
      FGlPeriod := AId;
      DBEditPeriod.Text := Format('%s [%s - %s]',
                           [FieldByName('period').asString,
                            FormatDateTime('mm/dd/yyyy', FieldByName('start_date').asDateTime),
                            FormatDateTime('mm/dd/yyyy', FieldByName('end_date').asDateTime)]);
       IQSearch1.wwDBGrid.UnselectAll;
       QryPrepost.Close;
       QryPrepost.ParamByName('AId').Value := FGlPeriod;
       QryPrepost.Open;
    end;
  finally
    Free;
  end;
end;

procedure TFrmFAGlPost.SBPeriodClick(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod(self);
  if AId <> 0 then
    AssignPeriod(AId);
end;

procedure TFrmFAGlPost.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1]);
end;

procedure TFrmFAGlPost.SBPostGLClick(Sender: TObject);
var
  DBase:TFDCustomConnection;
  I:Integer;
begin
  if IQSearch1.wwDBGrid.SelectedList.Count = 0 then
    IQSearch1.wwDBGrid.SelectRecord;
  if not IqConfirmYN('Do you wish to post selected assets to the GL?') then exit;

  FList := TStringList.Create;
  try
    if GetDateDialog( FGLBatchDate, 'Post Date:') then   {in DateDlg.pas}
    try

      DBase := FDManager.FindConnection('IQFD');
      DBase.StartTransaction;
      CheckPostDate(FGLBatchDate, FGlPeriod, 'FA_CHECK_POST_DATE' ); {ArShare.pas}

      CheckForOpenPeriod('gl_status', FGlPeriod);  {in IQMS.Common.AccountingShare.pas}
      FGLBatchIdId  := GetNextID('GLBATCHID');
      InsertGlbatchId;

      with IQSearch1.wwDBGrid, IQSearch1.wwDBGrid.datasource.dataset do
      for I:= 0 to SelectedList.Count-1 do
      begin
        GotoBookmark(SelectedList.items[I]);
        PostToGL;
      end;
      DBase.Commit;
      if SelectValueFmtAsFloat('select count(id) from glbatch where glbatchid_id = %f', [FGLBatchIdId]) = 0 then
      begin
        ExecuteCommandFmt('delete from glbatchid where id = %f', [FGLBatchIdId]);
        FList.Add('No records were posted to the GLBATCH. Header GLBATCHID record was deleted');
      end;

      if (FList.Count > 0) then
        DoShowBadEdiOrds( FList );    {in edbadord.pas}

    if IqConfirmYN('Assets posted to GL, Do you wish to print the AfterPost report?')
      then  PrintAfterPostReport;
    finally;
      if DBase.InTransaction then
      begin
        DBase.RollBack;
        IqConfirm('Assets were not posted to GL');
      end
      else
        IQSearch1.wwDBGrid.UnSelectAll;
        QryPrepost.Close;
        QryPrepost.Open;
    end;
  finally
    FList.Free;
  end;

end;

procedure TFrmFAGlPost.PrintAfterPostReport;
var
  cServerName, cUID, cPassword:String;
  SelectionList:TStringList;
begin
  try
    SelectionList := TStringList.Create;
    SetCriteriaExpression( SelectionList, IQFormat('{GLBATCHID.ID} = %f', [FGLBatchIdId]));
    PrintDefaultReport( self, 'fa_afterpost_report', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
  Screen.Cursor := crDefault;
end;

procedure TFrmFAGlPost.SetCriteriaExpression( List:TStringList; cStr:String );
begin
  List.Clear;
  List.Add(cStr);
end;


procedure TFrmFAGlPost.InsertGlbatchId;
var
  ABatchnumber:Real;
begin
  ABatchNumber   := GetNextSequenceNumber('S_FA');
  ExecuteCommandFmt('insert into glbatchid ' +
                '(id, ' +
                'batchnumber, ' +
                'source, ' +
                'tablename, ' +
                'glperiods_id, ' +
                'userid, ' +
                'system_date, ' +
                'batch_date) ' +
                'values ' +
                '(%f, ' +
                '%f, ' +
                '''FA'', ' +
                '''FA_DEPR_POSTING'', ' +
                '%f, ' +
                '''%s'', ' +
                'To_Date(''%s'', ''MM/DD/RRRR''), ' +
                'To_Date(''%s'', ''MM/DD/RRRR''))',
                [FGlBatchIdId,
                 ABatchNumber,
                 FGlPeriod,
                 SecurityManager.UserName,
                 FormatDateTime('mm/dd/yyyy', Date),
                 FormatDateTime('mm/dd/yyyy', FGLBatchDate)]);

end;

procedure TFrmFAGlPost.PostToGL;
begin
  if (QryPrepostGLACCT_ID_EXPENSE.asFloat = 0) or (QryPrepostGLACCT_ID_DEPRECIATION.asFloat = 0) then
  begin
    FList.Add(Format('Asset %s, does not have all the necessary account assigned',
                             [QryPrepostASSET_DESCRIP.asString]));
    Exit;
  end;



  ExecuteCommandFmt('insert into glbatch ' +
                '(glbatchid_id, ' +
                'detail_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'values ( ' +
                '%f, ' +
                '%f, ' +
                '%f, ' +
                'decode(sign(%f) , -1, 0, Abs(%f) ), ' +
                'decode(sign( %f), -1, Abs(%f), 0 ), ' +
                '''Asset# %s Depreciation'' ) ',
                [FGlBatchIdId,
                 QryPrepostID.asFloat,
                 QryPrepostGLACCT_ID_EXPENSE.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostASSET_NO.asString]);

  ExecuteCommandFmt('insert into glbatch ' +
                '(glbatchid_id, ' +
                'detail_id, ' +
                'glacct_id, ' +
                'debit, ' +
                'credit, ' +
                'descrip) ' +
                'values ( ' +
                '%f, ' +
                '%f, ' +
                '%f, ' +
                'decode(sign( %f), -1, Abs(%f), 0 ), ' +
                'decode(sign(%f) , -1, 0, Abs(%f) ), ' +
                '''Asset# %s Depreciation'' ) ',
                [FGlBatchIdId,
                 QryPrepostID.asFloat,
                 QryPrepostGLACCT_ID_DEPRECIATION.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostamount.asFloat,
                 QryPrepostASSET_NO.asString]);

  ExecuteCommandFmt('update FA_DEPR_POSTING set glbatchid_id = %f where id = %f', [FGlBatchIdId, QryPrepostID.asFloat]);
end;



procedure TFrmFAGlPost.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmFAGlPost.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmFA{CHM}, iqhtmFA{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.
