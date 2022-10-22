unit PrEmplBenefits;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  IQMS.WebVcl.UserDefinedLabel,
  Mask,
  IQMS.WebVcl.UDComboBox,
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
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmEmplBenefits = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    New1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Panel1: TUniPanel;
    PC: TUniPageControl;
    Panel2: TUniPanel;
    Nav: TUniDBNavigator;
    SBSearch: TUniSpeedButton;
    sbtnTableForm: TUniSpeedButton;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    GridHdr: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    SrcHdr: TDataSource;
    SrcDtl: TDataSource;
    QryHdr: TFDQuery;
    QryDtl: TFDQuery;
    QryHdrID: TBCDField;
    QryHdrNAME: TStringField;
    QryHdrDESCRIP: TStringField;
    QryHdrW2_CODE: TStringField;
    QryHdrBENEFIT_TYPE: TStringField;
    QryHdrEFFECTIVE_DATE: TDateTimeField;
    QryHdrINACTIVE_DATE: TDateTimeField;
    QryHdrPK_HIDE: TStringField;
    UpdateSQL1: TFDUpdateSQL;
    UpdateSQL2: TFDUpdateSQL;
    PkSearch: TIQWebHPick;
    PkSearchID: TBCDField;
    PkSearchNAME: TStringField;
    PkSearchDESCRIP: TStringField;
    PkSearchW2_CODE: TStringField;
    PkSearchBENEFIT_TYPE: TStringField;
    PkSearchEFFECTIVE_DATE: TDateTimeField;
    PkSearchINACTIVE_DATE: TDateTimeField;
    PkSearchPK_HIDE: TStringField;
    QryDtlID: TBCDField;
    QryDtlPR_EMPL_BENEFIT_ID: TBCDField;
    QryDtlPR_EMP_ID: TBCDField;
    QryDtlW2_CODE: TStringField;
    QryDtlTHIS_YEAR: TStringField;
    QryDtlAMOUNT: TBCDField;
    QryDtlCHECK_DATE: TDateTimeField;
    QryDtlMANUAL: TStringField;
    QryDtlEmpno: TStringField;
    QryDtlFirstName: TStringField;
    QryDtlLastName: TStringField;
    IQAbout1: TIQWebAbout;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label4: TUniLabel;
    Label7: TUniLabel;
    Label2: TUniLabel;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    LblW2: TUniLabel;
    Splitter2: TUniSplitter;
    Label3: TUniLabel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Splitter3: TUniSplitter;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Splitter4: TUniSplitter;
    Panel10: TUniPanel;
    edAccount: TUniDBEdit;
    edName: TUniDBEdit;
    DBDescrip: TUniDBEdit;
    DBW2: TUniDBEdit;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    wwDBDateTimePicker2: TUniDBDateTimePicker;
    DBCheckBox1: TUniDBCheckBox;
    wwDBDateTimePicker3: TUniDBDateTimePicker;
    wwDBDateTimePicker4: TUniDBDateTimePicker;
    QryDtlMiddleName: TStringField;
    PkEmp: TIQWebHPick;
    PkEmpID: TBCDField;
    PkEmpEMPNO: TStringField;
    PkEmpEMPLOYEE: TStringField;
    PkEmpPK_HIDE: TStringField;
    dbeBenefitType: TIQWebUDComboBox;
    dbeBenefitType2: TIQWebUDComboBox;
    IQSearch1: TIQUniGridControl;
    wwDBDateTimePicker5: TUniDBDateTimePicker;
    wwDBComboDlg1: TUniEdit;
    wwDBComboDlg2: TUniEdit;
    procedure QryHdrAfterPost(DataSet: TDataSet);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure PkSearchIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure QryDtlBeforeEdit(DataSet: TDataSet);
    procedure QryDtlAfterPost(DataSet: TDataSet);
    procedure QryDtlNewRecord(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure About1Click(Sender: TObject);
    procedure QryDtlCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwDBComboDlg2CustomDlg(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryDtlAfterInsert(DataSet: TDataSet);
    procedure QryHdrAfterScroll(DataSet: TDataSet);
    procedure New1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshHdr;
    procedure RefreshDtl;
    procedure SelectEmployee;
  public
    { Public declarations }
  end;

  procedure DoQuickAddBenefit;

implementation
uses
{ TODO -oGPatil -cWebConvert : Dependecny on datedlg.pas File
  DateDlg, }
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.NLS;
{$R *.dfm}

procedure DoQuickAddBenefit;
var
  LFrmEmplBenefits : TFrmEmplBenefits;
begin
  LFrmEmplBenefits := TFrmEmplBenefits.Create(UniGUIApplication.UniApplication);
  LFrmEmplBenefits.Show;
end;

procedure TFrmEmplBenefits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, GridHdr, Panel1, Panel5, Panel7, Panel9]);
end;

procedure TFrmEmplBenefits.QryHdrAfterPost(DataSet: TDataSet);
begin
{
  try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
  except on E:Exception do
    begin
      RefreshHdr;
      Application.ShowException(E);
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmEmplBenefits.RefreshHdr;
var
  AId:Real;
begin
  AId := QryHdrID.asFloat;
  QryHdr.Close;
  QryHdr.Open;
  QryHdr.Locate('ID', AId, []);
end;

procedure TFrmEmplBenefits.RefreshDtl;
var
  AId:Real;
begin
  AId := QryDtlID.asFloat;
  QryDtl.Close;
  QryDtl.Open;
  QryDtl.Locate('ID', AId, []);
end;

procedure TFrmEmplBenefits.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('PR_EMPL_BENEFIT');
  QryHdrW2_CODE.asString := UpperCase(QryHdrW2_CODE.asString);
end;

procedure TFrmEmplBenefits.SBSearchClick(Sender: TObject);
var
  aId:Real;
begin
  with PkSearch do
  if execute then
  begin
    aId := GetValue('ID');
    QryHdr.Locate('ID', aId, []);
  end
  else
    Abort;

end;

procedure TFrmEmplBenefits.PkSearchIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmEmplBenefits.sbtnTableFormClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) then
    PC.ActivePage := TabForm
  else
    PC.ActivePage := TabGrid;
end;

procedure TFrmEmplBenefits.QryDtlBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('C_PR_EMPL_BENEFITS');

  QryDtlPR_EMPL_BENEFIT_ID.asFloat :=  QryHdrID.asFloat;
  QryDtlW2_CODE.asString := UpperCase(QryDtlW2_CODE.asString);
end;

procedure TFrmEmplBenefits.QryDtlBeforeEdit(DataSet: TDataSet);
begin
  QryHdr.CheckBrowseMode;
  if QryHdrID.asFloat = 0 then Abort;
end;

procedure TFrmEmplBenefits.QryDtlAfterPost(DataSet: TDataSet);
begin
{
  try
    QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
  except on E:Exception do
    begin
      RefreshDtl;
      Application.ShowException(E);
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmEmplBenefits.QryDtlNewRecord(DataSet: TDataSet);
begin
  QryDtlMANUAL.asString := 'Y';
  QryDtlW2_CODE.asString := QryHdrW2_CODE.asString;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmEmplBenefits.NavBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  if button = nbRefresh then
  begin
    RefreshHdr;
    Abort;
  end;
end;

procedure TFrmEmplBenefits.NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if button = nbRefresh then
  begin
    RefreshDtl;
    Abort;
  end;
end; }

procedure TFrmEmplBenefits.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmEmplBenefits.QryDtlCalcFields(DataSet: TDataSet);
var
  AQry:TFDQuery;
begin
  AQry := TFDQuery.Create(nil);
  try
    AQry.Connection := UniMainModule.FDConnection1;
    AQry.Sql.Add(IqFormat('select * from pr_emp where id = %f', [QryDtlPR_EMP_ID.asFloat]));
    AQry.Open;
    if not (AQry.Bof and AQry.Eof) then
    begin
      QryDtlEmpno.asString := AQry.FieldByName('EMPNO').asString;
      QryDtlFirstName.asString := AQry.FieldByName('FIRST_NAME').asString;
      QryDtlMiddleName.asString := AQry.FieldByName('MIDDLE_NAME').asString;
      QryDtlLastName.asString := AQry.FieldByName('LAST_NAME').asString;
    end;
  finally
    AQry.Free;
  end;

end;

procedure TFrmEmplBenefits.wwDBComboDlg1CustomDlg(Sender: TObject);
var
  ADate:TDateTime;
begin
{ TODO -oGPatil -cWebConvert : Errors in datadlg.pas File
  if GetDateDialog( ADate) then
  begin
    if not (QryDtl.State in [dsInsert, dsEdit]) then
      QryDtl.Edit;
    QryDtlTHIS_YEAR.asString := FormatDateTime('yyyy', aDate);
  end;
}
end;

procedure TFrmEmplBenefits.SelectEmployee;
begin
  with PkEmp do
  if Execute then
  begin
    QryDtlPR_EMP_ID.asFloat := GetValue('ID');
    QryDtlCalcFields(nil);
  end
  else QryDtl.Cancel;
end;


procedure TFrmEmplBenefits.UniFormCreate(Sender: TObject);
begin
  New1.visible := false;
  PC.ActivePage := TabForm;
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( Self, [ Self, GridHdr, Panel1, Panel5, Panel7, Panel9]);

 { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contan a member named wwDBGrid
  wwDBDateTimePicker5.Parent := IQSearch1.wwDbGrid;
  wwDBComboDlg1.Parent := IQSearch1.wwDbGrid;
  wwDBComboDlg2.Parent := IQSearch1.wwDbGrid;   }
  wwDBDateTimePicker5.Visible := false;
  wwDBComboDlg1.Visible := false;
  wwDBComboDlg2.Visible := false;
  try
    SBSearchClick(NIL) ;      // activate search speed button
  except on E:EAbort do
    begin
      PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      //SysUtils.ABORT;
    end;
  end;
end;

procedure TFrmEmplBenefits.wwDBComboDlg2CustomDlg(Sender: TObject);
begin
  if not (QryDtl.State in [dsInsert, dsEdit]) then
    QryDtl.Edit;
  SelectEmployee;
end;

procedure TFrmEmplBenefits.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmplBenefits.QryDtlAfterInsert(DataSet: TDataSet);
begin
  SelectEmployee;
end;

procedure TFrmEmplBenefits.QryHdrAfterScroll(DataSet: TDataSet);
begin
  QryDtl.Close;
  QryDtl.ParamByName('AID').Value := QryHdrID.asFloat;
  QryDtl.Open;
end;

procedure TFrmEmplBenefits.New1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TUniDBNabigator does not contain a member named BtnClick
  Nav.BtnClick(nbInsert);  }
end;

end.
