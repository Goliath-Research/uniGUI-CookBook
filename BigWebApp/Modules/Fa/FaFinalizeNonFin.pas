unit FaFinalizeNonFin;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.Search,
  Vcl.Menus,
//  Vcl.Buttons,
  Data.DB,
//  vcl.wwdatsrc,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
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
  Vcl.Controls,
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
  TFrmFinilizeNonFin = class(TUniForm)
    Panel1: TUniPanel;
    Label9: TUniLabel;
    SBPeriod: TUniSpeedButton;
    SBFinalize: TUniSpeedButton;
    DBEditPeriod: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    FinalizeSelected1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcPrepost: TDataSource;
    QryPrepost: TFDQuery;
    QryPrepostPOST_DATE: TDateTimeField;
    QryPrepostAMOUNT: TBCDField;
    QryPrepostBOOK_DESCRIP: TStringField;
    QryPrepostASSET_NO: TStringField;
    QryPrepostASSET_DESCRIP: TStringField;
    QryPrepostDEPR_ACCOUNT: TStringField;
    QryPrepostEXPENCE_ACCOUNT: TStringField;
    QryPrepostGLACCT_ID_ASSET: TBCDField;
    QryPrepostGLACCT_ID_DEPRECIATION: TBCDField;
    QryPrepostGLACCT_ID_EXPENSE: TBCDField;
    QryPrepostID: TBCDField;
    QryPrepostFA_BOOK_ID: TBCDField;
    QryPrepostGLPERIODS_ID: TBCDField;
    QryPrepostBEG_BALANCE: TStringField;
    QryPrepostGLBATCHID_ID: TBCDField;
    QryPrepostFA_MAIN_ID: TBCDField;
    QryPrepostASSET_ACCOUNT: TStringField;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    procedure SBPeriodClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFinalizeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FGlPeriod:Real;
//    FList:TStringList;
    FGLBatchDate:TDateTime;
    procedure AssignPeriod(AId:Real);
  public
    { Public declarations }
  end;

procedure DoFinalizeNonFin;


implementation
uses
  { TODO -oLema : Dependent on DateDlg }
//  DateDlg,
  IQMS.Common.Period,
  IQMS.Common.AccountingShare,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
  //  IqSecIns,
  IQMS.Common.DataConst,
  IQMS.Common.Sequence;
{$R *.dfm}

procedure DoFinalizeNonFin;
var
  frm : TFrmFinilizeNonFin;
begin
  frm := TFrmFinilizeNonFin.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmFinilizeNonFin.UniFormCreate(Sender: TObject);
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



procedure TFrmFinilizeNonFin.SBPeriodClick(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod;
//  AId := DoFindPeriod(self);
  if AId <> 0 then
    AssignPeriod(AId);
end;


procedure TFrmFinilizeNonFin.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFinilizeNonFin.AssignPeriod(AId:Real);
var
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(self);
  with AQry do
  try
    ConnectionName := cnstFDConnectionName;
    Sql.Add(IQFormat('select period, start_date, end_date from glperiods where id = %f', [AId]));
    Open;
    if not Eof then
    begin
      FGlPeriod := AId;
      DBEditPeriod.Text := Format('%s [%s - %s]',
                           [FieldByName('period').asString,
                            FormatDateTime('mm/dd/yyyy', FieldByName('start_date').asDateTime),
                            FormatDateTime('mm/dd/yyyy', FieldByName('end_date').asDateTime)]);
{ TODO -oLema : Undeclared identifier: DBGrid.UnselectAll }
//       IQSearch1.DBGrid.UnselectAll;
       QryPrepost.Close;
       QryPrepost.ParamByName('AId').Value := FGlPeriod;
       QryPrepost.Open;
    end;
  finally
    Free;
  end;
end;


procedure TFrmFinilizeNonFin.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFinilizeNonFin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1]);
end;

procedure TFrmFinilizeNonFin.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
 // EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmFinilizeNonFin.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmFinilizeNonFin.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmFinilizeNonFin.SBFinalizeClick(Sender: TObject);
var
  DBase:TFDCustomConnection;
  I:Integer;
begin
{ TODO -oLema : Undeclared identifier: 'SelectRecord' }
//  if IQSearch1.DBGrid.SelectedRows.Count = 0 then
//    IQSearch1.DBGrid.SelectRecord;

  if not IqConfirmYN('Do you wish to Finalize non-financial books?') then exit;


{ TODO -oLema : GetDateDialog in DateDlg.pas }
(*
  if GetDateDialog( FGLBatchDate, 'Post Date:') then   {in DateDlg.pas}
  try
    DBase := FDManager.FindConnection('IQFD');
    DBase.StartTransaction;

    CheckForOpenPeriod('gl_status', FGlPeriod);  {in IQMS.Common.AccountingShare.pas}

    with IQSearch1.wwDBGrid, IQSearch1.wwDBGrid.datasource.dataset do
    for I:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[I]);
      ExecuteCommandFmt('update FA_DEPR_POSTING set  finalized_date = To_Date(''%s'', ''MM/DD/RRRR'') where id = %f',
      [FormatDateTime('mm/dd/yyyy', FGLBatchDate), QryPrepostID.asFloat]);
    end;
    DBase.Commit;
  finally;
    if DBase.InTransaction then
    begin
      DBase.RollBack;
    end
    else
      IQSearch1.wwDBGrid.UnSelectAll;
      QryPrepost.Close;
      QryPrepost.Open;
  end;
  *)


end;

procedure TFrmFinilizeNonFin.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmFA{CHM}, iqhtmFA{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmFinilizeNonFin.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
