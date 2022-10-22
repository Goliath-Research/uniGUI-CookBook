unit JTemlate;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Mask,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,

  uniPageControl, uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmTemplate = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlToolbarMain: TUniPanel;
    NavMain: TUniDBNavigator;
    SBToggle: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    SrcGlTemplate: TDataSource;
    TblGlTemplate: TFDTable;
    SrcGlTemplateDetail: TDataSource;
    TblGlTemplateDetail: TFDTable;
    TblGlTemplateID: TBCDField;
    TblGlTemplateDESCRIP: TStringField;
    TblGlTemplateDetailGLTEMPLATE_ID: TBCDField;
    TblGlTemplateDetailGLACCT_ID: TBCDField;
    TblGlTemplateDetailDEBIT: TBCDField;
    TblGlTemplateDetailCREDIT: TBCDField;
    TblGlTemplateDetailDESCRIP: TStringField;
    TblGlTemplateDetailVENDOR_ID: TBCDField;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    TblGlTemplateDetailGlAcct: TStringField;
    TblVendor: TFDTable;
    TblGlTemplateDetailVendor: TStringField;
    PnlHeader: TUniPanel;
    pcMain: TUniPageControl;
    TabGrid: TUniTabSheet;
    TabForm: TUniTabSheet;
    Splitter1: TUniSplitter;
    Contents1: TUniMenuItem;
    TblGlTemplateDetailSEQ: TBCDField;
    QryGlAcct: TFDQuery;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    TblGlTemplateDetailID: TBCDField;
    TblGlTemplateDetailPERCENTAGE: TFMTBCDField;
    TblGlTemplateTEMPLATE_TYPE: TStringField;
    GridHeader: TIQUniGridControl;
    TblGlTemplateFX_MOVE: TStringField;
    Bevel2: TUniPanel;
    sbtnRepeatDescription: TUniSpeedButton;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBFxMove: TUniDBCheckBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    NavDtl: TUniDBNavigator;
    GridTemplate: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    SBSearch: TUniSpeedButton;
    PKTempAP: TIQWebHPick;
    PkTempGJ: TIQWebHPick;
    PKTempAPID: TBCDField;
    PKTempAPDESCRIP: TStringField;
    PkTempGJID: TBCDField;
    PkTempGJDESCRIP: TStringField;
    dbeEPlant: TUniDBEdit;
    TblGlTemplateEPLANT_ID: TBCDField;
    sbtnAssignEplant: TUniSpeedButton;
    Label113: TUniLabel;
    wwDBComboDlg1: TUniEdit;
    PkTempGJEPLANT_ID: TBCDField;
    PKTempAPEPLANT_ID: TBCDField;
    procedure SBToggleClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure GridTemplateEnter(Sender: TObject);
    procedure GridHeaderEnter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure TblGlTemplateBeforePost(DataSet: TDataSet);
    procedure TblGlTemplateDetailBeforeInsert(DataSet: TDataSet);
    procedure TblGlTemplateDetailBeforePost(DataSet: TDataSet);
    procedure TblGlTemplateDetailAfterPost(DataSet: TDataSet);
    procedure SrcGlTemplateDataChange(Sender: TObject; Field: TField);
    procedure TblGlTemplateDetailAfterInsert(DataSet: TDataSet);
    procedure TblGlTemplateDetailAfterDelete(DataSet: TDataSet);
    //procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure TblGlTemplateDetailBeforeEdit(DataSet: TDataSet);
    procedure TblGlTemplateFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure GridHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TblGlTemplateBeforeScroll(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure sbtnAssignEplantClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    cDescription:String;
    FType:String;
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure UpdateStatusBar;
    function  GetAcctCurrencyId(AcctId:Real):Real;
    function  DifferentGLAccoutCurrency:Boolean;
    function  DifferentGLAccoutCurrency2:Boolean;
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AType:String);
  end;

procedure DoTemplate(AType:String = '');


implementation

uses
  ap_main,
  apacsplt,
  { TODO -ombaral -cWEBIQ : Resolve dependency
  aracsplt,
  }
  gj_rscstr,
  inv_main,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.COmmon.SetPlant;

{$R *.DFM}

procedure DoTemplate(AType:String = '');
begin
  with TFrmTemplate.Create(uniGUIApplication.UniApplication) do
  begin
    FType := AType;
    Show;
  end;
end;
(*
constructor TFrmTemplate.Create(AOwner:TComponent; AType:String);
begin
  inherited Create( AOwner );
  FType := AType;

  TblGlTemplateFX_MOVE.Visible := False;
  DBFxMove.Visible             := False;

  QryGlAcct.Close;

  if not ((FType = '') or (FType = 'GJ')) then
  begin
    QryGlAcct.Sql.Text := StrTran(QryGlAcct.Sql.Text, 'GL_HIDE', Format('%s_HIDE', [AType]));
    TblGlTemplateDetailDEBIT.visible := false;
    TblGlTemplateDetailCREDIT.visible := false;
    TblGlTemplateDetailDESCRIP.visible := false;
    sbtnRepeatDescription.visible := false;
  end
  else
  begin
    TblGlTemplateFX_MOVE.Visible := True;
    DBFxMove.Visible             := True;
  end;

  if TUniForm(Aowner).name = 'FrmAcctsSplit' then
    TFrmAcctsSplit(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmAp' then
    TFrmAp(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmInvoice' then
    TFrmInvoice(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmApAcSplt' then
    TFrmApAcSplt(AOwner).FTemplate := self;

  //IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead( self, [ self, PnlHeader, PnlLeft01 ]);

  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  //IQMS.Common.Controls.ResizeNavBar(NavMain);

  TblGlTemplate.BeforeScroll := nil;
  TblGlTemplate.Open;
  TblGlTemplateDetail.Open;
  TblGlTemplate.BeforeScroll := TblGlTemplateBeforeScroll;
//  TblGlAcct.Open;
  QryGlAcct.Open;
  TblVendor.Open;

  NavMain.DataSource := SrcGlTemplate;
  TblGlTemplate.Refresh;
  UpdateStatusBar;
end;
*)
procedure TFrmTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
  TblGlTemplateBeforeScroll(nil);
  { TODO -ombaral -cWEBIQ : Resolve dependency
  if TUniForm(Owner).name = 'FrmAcctsSplit' then
    TFrmAcctsSplit(Owner).FTemplate := nil
  else if TUniForm(owner).name = 'FrmAp' then
    TFrmAp(Owner).FTemplate := nil
  else if TUniForm(Owner).name = 'FrmInvoice' then
    TFrmInvoice(Owner).FTemplate := nil
  else if TUniForm(Owner).name = 'FrmApAcSplt' then
    TFrmApAcSplt(Owner).FTemplate := nil;
  }
  IQRegFormWrite( self, [ self, PnlHeader, PnlLeft01 ]);

end;

procedure TFrmTemplate.SBToggleClick(Sender: TObject);
begin
  if (pcMain.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridHeader.DataSource:= NIL;
    pcMain.ActivePage := TabForm;
  end
  else
  begin
    GridHeader.DataSource:= SrcGlTemplate;
    pcMain.ActivePage := TabGrid;
  end;
end;

procedure TFrmTemplate.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTemplate.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTemplate.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTemplate.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTemplate.GridTemplateEnter(Sender: TObject);
begin
//  NavMain.DataSource := SrcGlTemplateDetail;
end;

procedure TFrmTemplate.GridHeaderEnter(Sender: TObject);
begin
//  NavMain.DataSource := SrcGlTemplate;
end;

procedure TFrmTemplate.DBEdit1Enter(Sender: TObject);
begin
//  NavMain.DataSource := SrcGlTemplate;
end;

procedure TFrmTemplate.TblGlTemplateBeforePost(DataSet: TDataSet);
begin
  TblGlTemplateTEMPLATE_TYPE.asString := FType;

  if TblGlTemplateFX_MOVE.asString = 'Y' then
  if DifferentGLAccoutCurrency2 then
    // 'You are trying to mark a template as FX Move when it has accounts of different currencies'
    raise exception.Create(gj_rscstr.cTXT0000028);

  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmTemplate.TblGlTemplateDetailBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  if sbtnRepeatDescription.Down then cDescription := TblGlTemplateDetail.FieldByName('DESCRIP').asString;
end;

procedure TFrmTemplate.TblGlTemplateDetailBeforePost(DataSet: TDataSet);
begin
  with TblGlTemplateDetail do
    if (FieldByName('Credit').asFloat <> 0) and (FieldByName('Debit').asFloat <> 0) then
      // 'Debit and Credit cannot have values at the same time.'
      raise Exception.Create(gj_rscstr.cTXT0000029);

  if TblGlTemplateDetailPERCENTAGE.asFloat < 0 then
    raise Exception.Create(gj_rscstr.cTXT0000030 {'Percentage cannot be negative.'});

  if DifferentGLAccoutCurrency then
    {You are trying to post to accounts that have a different currency.
     This cannot be permitted because it could lead to an out-of-balance
     GL entry.}
    raise exception.Create(gj_rscstr.cTXT0000031);

  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmTemplate.TblGlTemplateDetailAfterPost(DataSet: TDataSet);
begin
  UpdateStatusBar;
end;

procedure TFrmTemplate.UniFormCreate(Sender: TObject);
begin
    //QryGlAcct.Open;
end;

procedure TFrmTemplate.UpdateStatusBar;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select sum(NVL(debit, 0)) as debit, ' +
                   'sum(NVL(credit, 0)) as credit, ' +
                   'sum(NVL(debit, 0)) - sum(NVL(credit, 0)) as balance ' +
                   'from gltemplate_detail ' +
                   'where gltemplate_id = %f'
                   , [TblGlTemplate.FieldByName('ID').AsFloat]));
    Open;

    IQMS.Common.Controls.SetStatus(StatusBar1, Format(gj_rscstr.cTXT0000005 {'Total Debit: %m'},
     [FieldByName('DEBIT').asFloat]),   0);
    IQMS.Common.Controls.SetStatus(StatusBar1, Format(gj_rscstr.cTXT0000006 {'Total Credit: %m'},
     [FieldByName('CREDIT').asFloat]),  1);
    IQMS.Common.Controls.SetStatus(StatusBar1, Format(gj_rscstr.cTXT0000007 {'Balance to Distribute: %m'},
     [FieldByName('BALANCE').asFloat]), 2);

  finally
    Free;
  end;
end;

procedure TFrmTemplate.SrcGlTemplateDataChange(Sender: TObject;
  Field: TField);
begin
 UpdateStatusBar;
end;

procedure TFrmTemplate.TblGlTemplateDetailAfterInsert(DataSet: TDataSet);
var
  ASeq :Real;
begin
  if sbtnRepeatDescription.Down then TblGlTemplateDetail.FieldByName('DESCRIP').asString := cDescription;
  ASeq := SelectValueFmtAsFloat('select max(seq) from GLTEMPLATE_DETAIL where GLTEMPLATE_ID = %f',
                    [TblGlTemplateID.AsFloat]);
  TblGlTemplateDetailSEQ.AsFloat := ASeq + 1;
end;

procedure TFrmTemplate.TblGlTemplateDetailAfterDelete(DataSet: TDataSet);
begin
 UpdateStatusBar;
end;
{
procedure TFrmTemplate.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
    with NavMain.DataSource.DataSet do
    begin
      Cancel;
      Append;
    end;
end;
}

procedure TFrmTemplate.FormActivate(Sender: TObject);
begin
  TblGlTemplateFX_MOVE.Visible := False;
  DBFxMove.Visible             := False;

  QryGlAcct.Close;

  if not ((FType = '') or (FType = 'GJ')) then
  begin
    QryGlAcct.Sql.Text := StrTran(QryGlAcct.Sql.Text, 'GL_HIDE', Format('%s_HIDE', [FType]));
    TblGlTemplateDetailDEBIT.visible := false;
    TblGlTemplateDetailCREDIT.visible := false;
    TblGlTemplateDetailDESCRIP.visible := false;
    sbtnRepeatDescription.visible := false;
  end
  else
  begin
    TblGlTemplateFX_MOVE.Visible := True;
    DBFxMove.Visible             := True;
  end;

  { TODO -ombaral -cWEBIQ : Resolve dependency
  if TUniForm(Aowner).name = 'FrmAcctsSplit' then
    TFrmAcctsSplit(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmAp' then
    TFrmAp(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmInvoice' then
    TFrmInvoice(AOwner).FTemplate := self
  else if TUniForm(Aowner).name = 'FrmApAcSplt' then
    TFrmApAcSplt(AOwner).FTemplate := self;
  }
  //IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead( self, [ self, PnlHeader, PnlLeft01 ]);

  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  //IQMS.Common.Controls.ResizeNavBar(NavMain);

  TblGlTemplate.BeforeScroll := nil;
  TblGlTemplate.Open;
  TblGlTemplateDetail.Open;
  TblGlTemplate.BeforeScroll := TblGlTemplateBeforeScroll;
//  TblGlAcct.Open;
  QryGlAcct.Open;
  TblVendor.Open;

  NavMain.DataSource := SrcGlTemplate;
  TblGlTemplate.Refresh;
  UpdateStatusBar;

  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTemplate.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1022160 );
end;

procedure TFrmTemplate.TblGlTemplateDetailBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmTemplate.TblGlTemplateFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := False;
  if (FType = '') or (FType = 'GJ') then
    Accept := (TblGlTemplateTEMPLATE_TYPE.asString = '') or (TblGlTemplateTEMPLATE_TYPE.asString = 'GJ')
  else if FType = 'AP' then
    Accept := TblGlTemplateTEMPLATE_TYPE.asString = 'AP'
  else if FType = 'AR' then
    Accept := TblGlTemplateTEMPLATE_TYPE.asString = 'AR';

  if accept then
    Accept := SelectValueFmtAsFloat('select misc.eplant_filter_include_nulls(%f) from dual', [TblGlTemplateEPLANT_ID.asFloat]) = 1;
end;

procedure TFrmTemplate.GridHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    TIQUniGridControl(Sender).BeginDrag(False);
end;

function TFrmTemplate.DifferentGLAccoutCurrency:Boolean;
var
  ACurrencyId1, ACurrencyId2:Real;
begin
  Result := False;
  if TblGlTemplateFX_MOVE.asString <> 'Y' then Exit;
  ACurrencyId1 := GetAcctCurrencyId(TblGlTemplateDetailGLACCT_ID.asFloat);
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IqFormat('select glacct_id from GLTEMPLATE_DETAIL where GLTEMPLATE_ID = %f and id <> %f',
                     [TblGlTemplateID.asFloat, TblGlTemplateDetailID.asFloat]));
    open;
    while not eof do
    begin
      ACurrencyId2 := GetAcctCurrencyId(FieldByName('GLACCT_ID').asFloat);
      if ACurrencyId2 <> ACurrencyId1 then
      begin
        Result := True;
        Exit;
      end;
      next;
    end;
  finally
    free;
  end;
end;

function TFrmTemplate.DifferentGLAccoutCurrency2:Boolean;
var
  ACurrencyId1, ACurrencyId2:Real;
  AQry1, AQry2:TFDQuery;
begin
  Result := False;
  AQry1 := TFDQuery.Create(nil);
  try
    AQry1.Connection := UniMainModule.FDConnection1;
    AQry1.Sql.Add(IqFormat('select id, glacct_id from GLTEMPLATE_DETAIL where GLTEMPLATE_ID = %f',
                     [TblGlTemplateID.asFloat]));
    AQry1.open;
    while not AQry1.eof do
    begin
      ACurrencyId1 := GetAcctCurrencyId(AQry1.FieldByName('GLACCT_ID').asFloat);

      AQry2 := TFDQuery.Create(nil);
      try
        AQry2.Connection := UniMainModule.FDConnection1;
        AQry2.Sql.Add(IqFormat('select glacct_id from GLTEMPLATE_DETAIL where GLTEMPLATE_ID = %f and id <> %f',
                         [TblGlTemplateID.asFloat, AQry1.FieldByName('ID').asFloat]));
        AQry2.open;
        while not AQry2.eof do
        begin
          ACurrencyId2 := GetAcctCurrencyId(AQry2.FieldByName('GLACCT_ID').asFloat);
          if ACurrencyId2 <> ACurrencyId1 then
          begin
            Result := True;
            Exit;
          end;
          AQry2.next;
        end;
      finally
        AQry2.free;
      end;
      AQry1.next;
    end;
  finally
    AQry1.free;
  end;
end;


function TFrmTemplate.GetAcctCurrencyId(AcctId:Real):Real;
var
  AGlValue:String;
  ASegment:String;
begin
  try
   ASegment := SelectValueAsString('select FX_SEGMENT_NAME from iqsys');
   AGlValue := SelectValueFmtAsString('select %s from v_glacct where id = %f', [ASegment, AcctId]);
   Result   := SelectValueFmtAsFloat('select id from currency where glvalue = ''%s''', [AGlValue]);
  except
    Result := -1;
  end;
end;


procedure TFrmTemplate.TblGlTemplateBeforeScroll(DataSet: TDataSet);
var
  ATotal, ACount:Real;
begin
  ACount := SelectValueFmtAsFloat('select count(id) from GLTEMPLATE_DETAIL where gltemplate_id = %f', [TblGlTemplateID.asFloat]);
  if ACount = 0 then exit;

  ATotal := SelectValueFmtAsFloat('select sum(NVL(percentage, -100000000000)) from GLTEMPLATE_DETAIL where gltemplate_id = %f', [TblGlTemplateID.asFloat]);
  if ATotal > -100000000000 then
  begin
    if Abs(100 - ATotal) > 0.0000001 then
    begin
      // 'Total percentage for template, %s, does not equal 100 percent. Continue?'
      if not IqConfirmYN(Format(gj_rscstr.cTXT0000032, [TblGlTemplateDESCRIP.asString])) then
        abort;
      PostMessage(PnlToolbarMain.Handle, WM_LBUTTONDOWN, 0, 0);
      PostMessage(PnlToolbarMain.Handle, WM_LBUTTONUP, 0, 0);
    end;
  end;
end;

procedure TFrmTemplate.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
   if HintControl = sbtnRepeatDescription then
     HintStr := IQMS.Common.Numbers.sIIf(sbtnRepeatDescription.Down,
                 gj_rscstr.cTXT0000026, // 'The selected Description will be used when adding new records.'
                 gj_rscstr.cTXT0000027); // 'Click to repeat the current description when adding a new record.'
end;

procedure TFrmTemplate.SBSearchClick(Sender: TObject);
var
  aPk:TIQWebHPick;
begin
  if FType = 'GJ' then
    aPk := PkTempGJ
  else
    aPk := PkTempAP;

  with aPk do
  if execute then
    TblGlTemplate.Locate('ID', GetValue('ID'), []);
end;



procedure TFrmTemplate.sbtnAssignEplantClick(Sender: TObject);
begin
  DoChangePlantID(TblGlTemplate ); { IQMS.COmmon.SetPlant.pas}
end;

end.
