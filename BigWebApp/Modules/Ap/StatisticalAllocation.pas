unit StatisticalAllocation;

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
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
//  Mask,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.DBCtrls, //TNavigateBtn
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
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmStatAlloc = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    SBGridView: TUniSpeedButton;
    sbtnSearch1: TUniSpeedButton;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryHdrID: TBCDField;
    QryHdrDESCRIP: TStringField;
    New1: TUniMenuItem;
    PkHdr: TIQWebHPick;
    PkHdrID: TBCDField;
    IQAbout1: TIQWebAbout;
    Label1: TUniLabel;
    DBDescrip: TUniDBEdit;
    SR: TIQWebSecurityRegister;
    GridHdr: TIQUniGridControl;
    PkHdrDESCRIP: TStringField;
    IQSearch1: TIQUniGridControl;
    QryDtl: TFDQuery;
    SrcDtl: TDataSource;
    UpdateSQL2: TFDUpdateSQL;
    QryDtlID: TBCDField;
    QryDtlS_ACCOUNT_HDR_ID: TBCDField;
    QryDtlGLACCT_ID_DIST: TBCDField;
    QryDtlGLACCT_SEGMENT: TStringField;
    QryDtlSEGMENT_VALUE_FROM: TStringField;
    QryDtlSEGMENT_VALUE_TO: TStringField;
    QryDtlUSE_RANGE: TStringField;
    QryDtlBALANCE_TYPE: TStringField;
    QryDtlSEGMENT_TYPE: TStringField;
    QryDtlGLACCT_DIST: TStringField;
    PkSeg: TIQWebHPick;
    wwDBSegment: TUniEdit;
    wwDBSegmentTo: TUniEdit;
    wwDBSegmentFrom: TUniEdit;
    wwDBGlAcct: TUniEdit;
    PkSegSEGMENT: TStringField;
    PkSegSEGMENT_TYPE: TStringField;
    PkAcct: TIQWebHPick;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    PkSegRange: TIQWebHPick;
    PkSubAcctType: TIQWebHPick;
    PkSubAcctTypeDESCRIP: TStringField;
    PkSegRangeSEGMENT: TStringField;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    IQSearch2: TIQUniGridControl;
    QrySeg: TFDQuery;
    SrcSeg: TDataSource;
    UpdateSQL3: TFDUpdateSQL;
    QrySegID: TBCDField;
    QrySegS_ACCOUNT_DTL_ID: TBCDField;
    QrySegSEGMENT_VALUE: TStringField;
    QryHdrSTAT_ACCOUNT: TStringField;
    QryHdrSTAT_DESCRIP: TStringField;
    QryHdrPROCEDURE_TO_RUN: TStringField;
    DBCheckBox1: TUniDBCheckBox;
    Label2: TUniLabel;
    DBEdit1: TUniDBEdit;
    Label3: TUniLabel;
    wwDBProcToRunForm: TUniEdit;
    wwDBProcToRun: TUniEdit;
    QryDtlCONSTANT_VALUE: TBCDField;
    PkProcStat: TIQWebHPick;
    PkProcStatOBJECT_NAME: TStringField;
    PkProcAlloc: TIQWebHPick;
    StringField1: TStringField;
    PkAcctID: TBCDField;
    procedure Exit1Click(Sender: TObject);
    procedure sbtnSearch1Click(Sender: TObject);
    procedure PkHdrIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure New1Click(Sender: TObject);
    procedure NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QryHdrAfterPost(DataSet: TDataSet);
    procedure QryHdrBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure SBGridViewClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryDtlAfterPost(DataSet: TDataSet);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure QryDtlBeforeInsert(DataSet: TDataSet);
    procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure wwDBSegmentCustomDlg(Sender: TObject);
    procedure QryDtlNewRecord(DataSet: TDataSet);
    procedure wwDBGlAcctCustomDlg(Sender: TObject);
    procedure wwDBSegmentFromCustomDlg(Sender: TObject);
    procedure wwDBSegmentToCustomDlg(Sender: TObject);
    procedure NavSegBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure QrySegAfterPost(DataSet: TDataSet);
    procedure QrySegBeforeInsert(DataSet: TDataSet);
    procedure QrySegBeforePost(DataSet: TDataSet);
    procedure QrySegNewRecord(DataSet: TDataSet);
    procedure QrySegBeforeEdit(DataSet: TDataSet);
    procedure wwDBProcToRunCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FId: Real;
    FSqlRange:String;
  public
    { Public declarations }
  end;

procedure DoStatAllocSetup(AId:Real = 0);

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  ap_rscstr,
  StatisticalAllocValues,
  IQMS.Common.Dialogs;
{$R *.dfm}

procedure DoStatAllocSetup(AId:Real = 0);
var
  frm: TFrmStatAlloc;
begin
  frm := TFrmStatAlloc.Create(uniGUIApplication.UniApplication);
  frm.FId := AId;
  frm.Show;
end;

procedure TFrmStatAlloc.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmStatAlloc.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, Panel1, GridHdr, Panel3]);
{
  wwDBSegment.Parent     := IQSearch1.wwDbGrid;
  wwDBSegmentTo.Parent   := IQSearch1.wwDbGrid;
  wwDBSegmentFrom.Parent := IQSearch1.wwDbGrid;
  wwDBGlAcct.Parent      := IQSearch1.wwDbGrid;
  wwDBProcToRun.Parent   := IQSearch1.wwDbGrid;
}

  wwDBSegment.visible     := false;
  wwDBSegmentTo.visible   := false;
  wwDBSegmentFrom.visible := false;
  wwDBGlAcct.visible      := false;
  wwDBProcToRun.visible   := false;


//  wwDBSegmentValue.Parent  := IQSearch2.wwDbGrid;
//  wwDBSegmentValue.visible := false;

  FSqlRange := PkSegRange.Sql.Text;

  New1.Visible := false;

//  PC.ActivePage := TabForm;

end;

procedure TFrmStatAlloc.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

  if FId <> 0 then
  begin
    QryHdr.Locate('ID', FId, [])
  end
  else
  begin
    try
      sbtnSearch1Click(NIL) ;      // activate search speed button
    except on E:EAbort do
      begin
          Exit1Click(nil);
//        PostMessage( Handle, wm_Command, Exit1.Command, 0 );
      end;
    end;
  end;

end;

procedure TFrmStatAlloc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Panel1, GridHdr, Panel3]);
end;

procedure TFrmStatAlloc.sbtnSearch1Click(Sender: TObject);
var
  AId:Real;
begin
  with pkHdr do
    if Execute then
    begin
      AId := GetValue('ID');
      if AID > 0 then
        QryHdr.Locate('ID', AId, [])
    end
    else System.SysUtils.Abort;
end;


procedure TFrmStatAlloc.PkHdrIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  New1Click(nil);
//  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmStatAlloc.New1Click(Sender: TObject);
begin
    QryHdr.Insert;
//  navHdr.BtnClick(nbInsert);
end;

procedure TFrmStatAlloc.NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
    Abort;
  end;
end;

procedure TFrmStatAlloc.NavHdrBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryHdrID.asFloat;
    QryHdr.Close;
    QryHdr.Open;
    QryHdr.Locate('ID', AId, []);
    Abort;
  end;
end;

procedure TFrmStatAlloc.NavSegBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  aId:Real;
  I:Integer;
begin
  if Button = nbRefresh then
  begin
    aId := QrySegID.asFloat;
    QrySeg.Close;
    QrySeg.Open;
    QrySeg.Locate('ID', AId, []);
    Abort;
  end
  else if Button = nbDelete then
  begin
    if IQSearch2.DbGrid.SelectedRows.Count > 1 then
    begin
      if not IqConfirmYN(ap_rscstr.cTXT0000103) then Abort;
      with IQSearch2.DBGrid, IQSearch2.DBGrid.datasource.dataset do
      begin
        for i:= 0 to SelectedRows.Count-1 do
        begin
          GotoBookmark(SelectedRows.items[i]);
          ExecuteCommandFmt('delete from S_ACCOUNT_DTL_VALUES where id = %f', [QrySegID.asFloat]);
        end;
      end;
      QrySeg.Close;
      QrySeg.Open;
      Abort;
    end;
  end;
end;

procedure TFrmStatAlloc.QryDtlAfterPost(DataSet: TDataSet);
begin
{
  try
    QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryDtl.Close;
      QryDtl.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmStatAlloc.QryDtlBeforeInsert(DataSet: TDataSet);
begin
  if (QryHdr.State in [dsEdit, dsInsert]) then QryHdr.Post;
  if QryHdrID.asFloat = 0 then Abort;
end;

procedure TFrmStatAlloc.QryDtlBeforePost(DataSet: TDataSet);
begin
  if (QryDtlSEGMENT_VALUE_TO.asString <> '')   and
     (QryDtlSEGMENT_VALUE_FROM.asString <> '') and
     (QryDtlSEGMENT_VALUE_TO.asString <= QryDtlSEGMENT_VALUE_FROM.asString) then
     raise exception.create(ap_rscstr.cTXT0000101);


  QryDtlS_ACCOUNT_HDR_ID.asFloat := QryHdrID.asFloat;
  if QryDtlID.asFloat = 0 then
    QryDtlID.asFloat := GetNextID('S_ACCOUNT_DTL');
end;

procedure TFrmStatAlloc.QryDtlNewRecord(DataSet: TDataSet);
begin
  wwDBSegmentCustomDlg(nil);
end;

procedure TFrmStatAlloc.QryHdrAfterPost(DataSet: TDataSet);
begin
{
  try
    QryHdr.DataBase.ApplyUpdates( [ QryHdr ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryHdr.Close;
      QryHdr.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmStatAlloc.QryHdrBeforePost(DataSet: TDataSet);
begin
  if QryHdrID.asFloat = 0 then
    QryHdrID.asFloat := GetNextID('S_ACCOUNT_HDR');
end;

procedure TFrmStatAlloc.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmStatAlloc.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = tabGrid) or (Sender = NIL) then
    PC.ActivePage := tabForm
  else
    PC.ActivePage := tabGrid;
end;

procedure TFrmStatAlloc.wwDBGlAcctCustomDlg(Sender: TObject);
begin
  with PkAcct do
  if execute then
  begin
    if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
    QryDtlGLACCT_ID_DIST.asFloat := GetValue('ID');
    QryDtlGLACCT_DIST.asString := GetValue('ACCT');
  end
end;

procedure TFrmStatAlloc.wwDBSegmentCustomDlg(Sender: TObject);
begin
  with PkSeg do
  if execute then
  begin
    if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
    QryDtlGLACCT_SEGMENT.asString := GetValue('SEGMENT');
    QryDtlSEGMENT_TYPE.asString := GetValue('SEGMENT_TYPE');
  end

end;

procedure TFrmStatAlloc.wwDBSegmentFromCustomDlg(Sender: TObject);
begin
  if QryDtlGLACCT_SEGMENT.asString = '' then exit;
  if QryDtlSEGMENT_TYPE.asString = 'SEGMENT' then
  begin
    PkSegRange.Sql.Text := StrTran(UpperCase(FSqlRange), 'ACCOUNT', QryDtlGLACCT_SEGMENT.asString);
    with PkSegRange do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_FROM.asString := GetValue('SEGMENT');
    end
  end
  else if QryDtlSEGMENT_TYPE.asString = 'GLACCOUNT' then
  begin
    with PkAcct do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_FROM.asString := GetValue('ACCT');
    end
  end
  else
  begin
    with PkSubAcctType do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_FROM.asString := GetValue('DESCRIP');
    end
  end;


end;

procedure TFrmStatAlloc.wwDBSegmentToCustomDlg(Sender: TObject);
begin
  if QryDtlGLACCT_SEGMENT.asString = '' then exit;
  if QryDtlSEGMENT_TYPE.asString = 'SEGMENT' then
  begin
    PkSegRange.Sql.Text := StrTran(UpperCase(FSqlRange), 'ACCOUNT', QryDtlGLACCT_SEGMENT.asString);
    with PkSegRange do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_TO.asString := GetValue('SEGMENT');
    end
  end
  else if QryDtlSEGMENT_TYPE.asString = 'GLACCOUNT' then
  begin
    with PkAcct do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_TO.asString := GetValue('ACCT');
    end
  end
  else
  begin
    with PkSubAcctType do
    if execute then
    begin
      if not (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Edit;
      QryDtlSEGMENT_VALUE_TO.asString := GetValue('DESCRIP');
    end
  end;
end;

procedure TFrmStatAlloc.QrySegAfterPost(DataSet: TDataSet);
begin
{
  try
    QrySeg.DataBase.ApplyUpdates( [ QrySeg ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QrySeg.Close;
      QrySeg.Open;
      System.SysUtils.ABORT;
    end;
  end;
  }
end;

procedure TFrmStatAlloc.QrySegBeforeEdit(DataSet: TDataSet);
begin
  Abort;
end;

procedure TFrmStatAlloc.QrySegBeforeInsert(DataSet: TDataSet);
begin
  if (QryDtl.State in [dsEdit, dsInsert]) then QryDtl.Post;
  if QryDtlGLACCT_SEGMENT.asString = '' then Abort;
  if QryDtlID.asFloat = 0 then Abort;
end;

procedure TFrmStatAlloc.QrySegBeforePost(DataSet: TDataSet);
begin
  QrySegS_ACCOUNT_DTL_ID.asFloat := QryDtlID.asFloat;
  if QrySegID.asFloat = 0 then
    QrySegID.asFloat := GetNextID('S_ACCOUNT_DTL_VALUES');
end;

procedure TFrmStatAlloc.QrySegNewRecord(DataSet: TDataSet);
begin
  DoSelectSegmentValues(QryDtlID.asFloat, QryDtlGLACCT_SEGMENT.asString, QryDtlSEGMENT_TYPE.asString);  {StatisticalAllocValues.pas}
  QrySeg.Close;
  QrySeg.Open;
end;

procedure TFrmStatAlloc.wwDBProcToRunCustomDlg(Sender: TObject);
var
  aPk:TIQWebHPick;
begin
  if QryHdrSTAT_ACCOUNT.asString = 'Y' then
    aPk := PkProcStat
  else
    aPk := PkProcAlloc;
  with aPk do
  if Execute then
  begin
    if not (QryHdr.State in [dsEdit, dsInsert])
      then QryHdr.Edit;
    QryHdrPROCEDURE_TO_RUN.asString := GetValue('OBJECT_NAME');
  end;

end;

end.
