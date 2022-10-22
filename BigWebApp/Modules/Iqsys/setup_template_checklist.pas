unit setup_template_checklist;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.UDComboBox,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame;

type
  TFrmSetupTemplateChecklist = class(TUniForm)
    PnlHeader: TUniPanel;
    Splitter1: TUniSplitter;
    PnlDetail: TUniPanel;
    PnlToolbarHeader: TUniPanel;
    PnlToolbarDetail: TUniPanel;
    PnlHeaderGrid: TUniPanel;
    PnlDetailGrid: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    SrcHeader: TDataSource;
    SrcDetail: TDataSource;
    QryHeader: TFDQuery;
    QryDetail: TFDQuery;
    QryHeaderID: TBCDField;
    QryHeaderDESCRIP: TStringField;
    QryHeaderNOTES: TStringField;
    QryHeaderEPLANT_ID: TBCDField;
    QryHeaderEPLANT_NAME: TStringField;
    QryDetailID: TBCDField;
    QryDetailSEQ: TBCDField;
    QryDetailCHECK_TEXT: TStringField;
    QryDetailCRITICAL: TStringField;
    QryDetailNOTES: TStringField;
    sbtnSearch: TUniSpeedButton;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    GridHeader: TIQUniGridControl;
    GridDetail: TIQUniGridControl;
    cmbGridHeaderNote: TUniEdit;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    cmbGridEplantID: TUniEdit;
    cmbGridDetailNote: TIQWebUDComboBox;
    QryDetailSETUP_TEMPL_CHKLIST_ID: TBCDField;
    PkTemplate: TIQWebHPick;
    PkTemplateID: TBCDField;
    PkTemplateDESCRIP: TStringField;
    PkTemplateNOTES: TStringField;
    PkTemplateEPLANT_NAME: TStringField;
    QryHeaderSOURCE: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    { TODO -oSanketG -cWebConvert : Need to revisit
    procedure DoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure DoApplyUpdates(DataSet: TDataSet);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure QryHeaderBeforeDelete(DataSet: TDataSet);
    procedure QryDetailBeforeDelete(DataSet: TDataSet);
    procedure QryHeaderNewRecord(DataSet: TDataSet);
    procedure QryDetailNewRecord(DataSet: TDataSet);
    procedure QryHeaderUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryDetailUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure EditHeaderNote1Click(Sender: TObject);
    procedure EditDetailNote1Click(Sender: TObject);
    procedure ChangeEPlant1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oSanketG -cWebConvert : Need to find suitable UniGUI component for replacement of TNavigateBtn.
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);}
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure PkTemplateIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    private
      { Private declarations }
      FSource: string;
      FChecklistID: Real;
      procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure UpdateCaption;
    procedure SetChecklistID(const Value: Real);
    procedure SetSource(const Value: string);
    public
      { Public declarations }
      class procedure DoShow(ASource: string; AChecklistID: Real = 0);
      property Source: string write SetSource;
      property ChecklistID: Real write SetChecklistID;
  end;



implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //editmemostr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.WebVcl.SecurityManager,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //SetPlant,
  IQMS.Common.TableSequence;

const
  cnstAppendNew = 1;

{ TFrmPmChecklists }

class procedure TFrmSetupTemplateChecklist.DoShow(ASource: string; AChecklistID: Real = 0);
var
  FrmSetupTemplateChecklist: TFrmSetupTemplateChecklist;
begin
  FrmSetupTemplateChecklist := TFrmSetupTemplateChecklist.Create(uniGUIApplication.UniApplication);
  FrmSetupTemplateCheckList.Source:= ASource;
  FrmSetupTemplateCheckList.Show;
end;

procedure TFrmSetupTemplateChecklist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlHeader, GridHeader, GridDetail]);
end;

procedure TFrmSetupTemplateChecklist.UniFormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQMS.Common.Screen.ApplySystemFont(Self);
  { TODO -oSanketG -cWebConvert :
  [dcc32 Error] setup_template_checklist.pas(199): E2010 Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
  //IQMS.Common.Controls.ResizeNavBar(NavMain);
  //IQMS.Common.Controls.ResizeNavBar(NavDetail);

end;

procedure TFrmSetupTemplateChecklist.UniFormShow(Sender: TObject);
begin
  IQAssert( FSource <> '', 'Undefine mandatory ''Source'' parameter in call to TFrmSetupTemplateChecklist form');

  ReOpen(QryHeader);
  ReOpen(QryDetail);
  cmbGridHeaderNote.Visible := False;
  cmbGridDetailNote.Visible := False;
  cmbGridEplantID.Visible := False;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlHeader, GridHeader, GridDetail]);
  UpdateCaption;

  // Locate record
  if FChecklistID > 0 then
    QryHeader.Locate('ID', FChecklistID, [])
  else
    try
      Search1Click(nil);
    except
      on E: EAbort do
        begin
          // FAbortOnCreate := True;
          //PostMessage(Handle, wm_Command, Exit1.Command, 0); // Call "Exit"
        end;
    end;
end;

procedure TFrmSetupTemplateChecklist.UpdateCaption;
var
  S: string;
begin
  S:= '?';
  if FSource = 'STANDARD' then S:= 'BOM'
  else if FSource = 'WORK_CENTER' then S:= 'Work Center'
  else if FSource = 'SNDOP' then S:= 'Process';

  Caption:= Format('Checklist Templates [ %s ]', [ S ]);
end;

procedure TFrmSetupTemplateChecklist.IQNotify(var Msg: TMessage);
begin
  {case Msg.WParam of
    cnstAppendNew: if navMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
                      navMain.BtnClick( nbInsert );
  end;}
end;

procedure TFrmSetupTemplateChecklist.PkTemplateIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  //PostMessage( self.Handle, iq_Notify, cnstAppendNew, 0 );
end;

procedure TFrmSetupTemplateChecklist.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmSetupTemplateChecklist.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmSetupTemplateChecklist.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSetupTemplateChecklist.Search1Click(Sender: TObject);
begin
  with PkTemplate do
    if Execute then
       QryHeader.Locate('ID', GetValue('ID'), [])
    else
       System.SysUtils.Abort;
end;

procedure TFrmSetupTemplateChecklist.SetChecklistID(const Value: Real);
begin
  FChecklistID := Value;
end;

procedure TFrmSetupTemplateChecklist.SetSource(const Value: string);
begin
  FSource := Value;
end;

procedure TFrmSetupTemplateChecklist.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmSetupTemplateChecklist.ChangeEPlant1Click(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit }
  {if DoChangePlantIDEx(Self, QryHeader) then // SetPlant.pas
  begin
    if(QryHeader.State in [dsEdit, dsInsert]) then
      QryHeader.Post;
    RefreshDataSetByID(QryHeader);
  end;}
end;

procedure TFrmSetupTemplateChecklist.EditHeaderNote1Click(Sender: TObject);
var
  s: string;
begin
  s := QryHeaderNOTES.AsString;
  { TODO -oSanketG -cWebConvert : Need to revisit after editmemostr file conversion}
  {if editmemostr.DoEditMemoStr(Self, s, QryHeaderNOTES.Size) then
    begin
      if not (QryHeader.State in [dsEdit, dsInsert]) then
        QryHeader.Edit;
      QryHeaderNOTES.AsString := s;
      QryHeader.Post;
    end;}
end;

procedure TFrmSetupTemplateChecklist.EditDetailNote1Click(Sender: TObject);
var
  s: string;
begin
  s := QryDetailNOTES.AsString;
  { TODO -oSanketG -cWebConvert : Need to revisit after editmemostr file conversion}
  {if editmemostr.DoEditMemoStr(Self, s, QryDetailNOTES.Size) then
    begin
      if not (QryHeader.State in [dsEdit, dsInsert]) then
        QryDetail.Edit;
      QryDetailNOTES.AsString := s;
      QryDetail.Post;
    end;}
end;

{ TODO -oSanketG -cWebConvert : Need to revisit }
{procedure TFrmSetupTemplateChecklist.NavDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmSetupTemplateChecklist.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;}

procedure TFrmSetupTemplateChecklist.DoApplyUpdates(DataSet: TDataSet);
begin
  // apply cached updates
  with TFDRDBMSDataSet(DataSet) do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
end;

procedure TFrmSetupTemplateChecklist.QryDetailBeforeDelete(DataSet: TDataSet);
var
  AID: Int64;
begin
  AID := QryDetailID.AsLargeInt;
  QryDetail.Prior;
  ExecuteCommandFmt(
    'DELETE FROM setup_templ_chklist_dtl WHERE id = %d',
    [AID]);
  IQMS.Common.TableSequence.ReSequence('setup_templ_chklist_dtl', ['setup_templ_chklist_id'],
    [QryHeaderID.AsLargeInt]);
  RefreshDataSetByID(QryDetail);
  System.SysUtils.Abort;
end;

procedure TFrmSetupTemplateChecklist.QryDetailNewRecord(DataSet: TDataSet);
begin
  QryDetailID.AsLargeInt := GetNextID('setup_templ_chklist_dtl');
  QryDetailSETUP_TEMPL_CHKLIST_ID.AsLargeInt := QryHeaderID.AsLargeInt;
  QryDetailSEQ.AsInteger := SelectValueFmtAsInteger(
    'SELECT MAX(seq) FROM setup_templ_chklist_dtl WHERE setup_templ_chklist_id = %.0f',
    [QryHeaderID.AsFloat]) + 1;
end;

procedure TFrmSetupTemplateChecklist.QryDetailUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
  ASQL: TStringList;
begin
  if ARequest = arUpdate then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('UPDATE setup_templ_chklist_dtl');
        ASQL.Add('   SET seq = :seq,');
        ASQL.Add('       check_text = :check_text,');
        ASQL.Add('       critical = :critical,');
        ASQL.Add('       notes = :notes');
        ASQL.Add(' WHERE id = :id');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end
  else if ARequest = arInsert then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('INSERT INTO setup_templ_chklist_dtl(id,');
        ASQL.Add('                                     setup_templ_chklist_id,');
        ASQL.Add('                                     seq,');
        ASQL.Add('                                     check_text,');
        ASQL.Add('                                     critical,');
        ASQL.Add('                                     notes)');
        ASQL.Add('    VALUES (:id, :setup_templ_chklist_id, :seq, :check_text,');
        ASQL.Add('            :critical, :notes)');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end;
  AAction := eaApplied;
end;

procedure TFrmSetupTemplateChecklist.QryHeaderBeforeDelete(DataSet: TDataSet);
var
  AID: Int64;
begin
  AID := QryHeaderID.AsLargeInt;
  QryHeader.Prior;
  ExecuteCommandFmt('DELETE FROM setup_templ_chklist WHERE id = %d',
    [AID]);
  RefreshDataSetByID(QryHeader);
  System.SysUtils.Abort;
end;

procedure TFrmSetupTemplateChecklist.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'source', FSource);
end;

procedure TFrmSetupTemplateChecklist.QryHeaderNewRecord(DataSet: TDataSet);
begin
  QryHeaderID.AsLargeInt := GetNextID('setup_templ_chklist');
  if SecurityManager.EPlantsExist and (SecurityManager.EPlant_ID <> 'NULL') then
    QryHeaderEPLANT_ID.AsLargeInt := SecurityManager.EPlant_ID_AsInteger;
  QryHeaderSOURCE.asString:= FSource;
end;

procedure TFrmSetupTemplateChecklist.QryHeaderUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
  ASQL: TStringList;
begin
  if ARequest = arUpdate then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('UPDATE setup_templ_chklist');
        ASQL.Add('   SET descrip = :descrip, notes = :notes,');
        ASQL.Add('       eplant_id = :eplant_id');
        ASQL.Add(' WHERE id = :id');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end
  else if ARequest = arInsert then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('INSERT INTO setup_templ_chklist( id,');
        ASQL.Add('                                 descrip,');
        ASQL.Add('                                 notes,');
        ASQL.Add('                                 source,');
        ASQL.Add('                                 eplant_id)');
        ASQL.Add('    VALUES (:id, :descrip, :notes, :source, :eplant_id)');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end;
  AAction := eaApplied;
end;

procedure TFrmSetupTemplateChecklist.sbtnMoveDownClick(Sender: TObject);
begin
  ChangeSequence( QryDetail { DataSet } ,
                  'SETUP_TEMPL_CHKLIST_DTL',  { TableName }
                  'SETUP_TEMPL_CHKLIST_ID',   { Master Field }
                  QryDetailSEQ.AsInteger ,    { Current Seq }
                  QryDetailSEQ.AsInteger + 1  { New Seq } ); // table_seq
end;

procedure TFrmSetupTemplateChecklist.sbtnMoveUpClick(Sender: TObject);
begin
  ChangeSequence( QryDetail { DataSet } ,
                  'SETUP_TEMPL_CHKLIST_DTL', { TableName }
                  'SETUP_TEMPL_CHKLIST_ID',  { Master Field }
                  QryDetailSEQ.AsInteger,    { Current Seq }
                  QryDetailSEQ.AsInteger - 1 { New Seq } ); // table_seq
end;

{ TODO -oSanketG -cWebConvert : Need to revisit }
{procedure TFrmSetupTemplateChecklist.DoCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  if Field.ReadOnly or Field.Calculated then
    ABrush.Color := clBtnFace;
end;}

end.
