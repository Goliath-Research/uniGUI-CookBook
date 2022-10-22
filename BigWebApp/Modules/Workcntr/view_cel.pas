unit View_Cel;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  System.Variants,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Buttons,
//  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniComboBox,
  uniDBGrid, //TUniDBGridColumn
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TViewCells = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    TblCell: TFDQuery;
    SrcCell: TDataSource;
    TblCellMFGCELL: TStringField;
    TblCellDESCRIP: TStringField;
    TblCellMFGTYPE: TStringField;
    GridCell: TIQUniGridControl;
    cmbGridMFGType: TUniDBLookupComboBox;
    QryMFGTypeLookup: TFDQuery;
    QryMFGTypeLookupMFGTYPE: TStringField;
    TblCellEPLANT_ID: TBCDField;
    TblCellEPLANTNAME: TStringField;
    sbtnAssignEPlant: TUniSpeedButton;
    TblCellDIVISION_ID: TBCDField;
    TblCellDIVISIONNAME: TStringField;
    QryDivisionLookup: TFDQuery;
    QryDivisionLookupNAME: TStringField;
    QryDivisionLookupEPLANT_NAME: TStringField;
    QryDivisionLookupID: TBCDField;
    cmbGridDivision: TUniDBLookupComboBox;
    TblCellLABOR_RATE: TFMTBCDField;
    Bevel1: TUniPanel;
    pnlGrid: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Label1: TUniLabel;
    Splitter2: TUniSplitter;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Splitter3: TUniSplitter;
    Panel9: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    pnlMaterialStaging: TUniPanel;
    Splitter4: TUniSplitter;
    Panel13: TUniPanel;
    Label2: TUniLabel;
    Panel14: TUniPanel;
    wwDBComboDlgStagingLocation: TUniEdit;
    Panel15: TUniPanel;
    dbeLaborRate: TUniDBEdit;
    wwDBComboBoxProdRepMethod: TUniDBComboBox;
    wwDBComboBoxActCostMethod: TUniDBComboBox;
    TblCellPROD_REP_METHOD: TStringField;
    TblCellACT_COST_METHOD: TStringField;
    TblCellSTAGING_LOCATIONS_ID: TBCDField;
    PkLocation: TIQWebHPick;
    PkLocationID: TBCDField;
    PkLocationLOCATION: TStringField;
    PkLocationDESCRIPTION: TStringField;
    PkLocationEPLANT_ID: TBCDField;
    PkLocationDIVISION: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkLocationPK_HIDE: TStringField;
    Contents1: TUniMenuItem;
    TblCellFUTURE_LABOR_RATE: TFMTBCDField;
    TblCellBUDGET_LABOR_RATE: TFMTBCDField;
    TblCellFORECAST_LABOR_RATE: TFMTBCDField;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    dbeFutureRate: TUniDBEdit;
    dbeBudgetRate: TUniDBEdit;
    dbeForecastRate: TUniDBEdit;
    TblCellLOCATIONS_ID_IN: TBCDField;
    Label8: TUniLabel;
    wwDBComboDlgINLocation: TUniEdit;
    TblCellID: TBCDField;
    FDUpdateSQL_Cell: TFDUpdateSQL;
    TblCellINLOCATIONDESC: TStringField;
    TblCellSTAGINGLOCDESC: TStringField;
    TblCellCOMPONENT_REJECT_LOC_MANDATORY: TStringField;
    PnlRejectOptions: TUniPanel;
    Panel17: TUniPanel;
    Panel18: TUniPanel;
    DBCheckBox1: TUniDBCheckBox;
    ds_MFGTypeLookup: TDataSource;
    ds_DivisionLookup: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblCellMFGCELLSetText(Sender: TField; const Text: string);
    procedure TblCellBeforeDelete(DataSet: TDataSet);
    procedure sbtnAssignEPlantClick(Sender: TObject);
    procedure TblCellBeforeEdit(DataSet: TDataSet);
    procedure TblCellBeforeInsert(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlgStagingLocationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboBoxProdRepMethodChange(Sender: TObject);
    procedure SrcCellDataChange(Sender: TObject; Field: TField);
    procedure wwDBComboDlgStagingLocationCustomDlg(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PkLocationBeforeOpen(DataSet: TDataSet);
    procedure TblCellNewRecord(DataSet: TDataSet);
    procedure TblCellBeforePost(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure wwDBComboDlgINLocationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgINLocationCustomDlg(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbGridDivisionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure GridCellDBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure cmbGridDivisionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure GridCellDBGridDblClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

procedure DoEditCells;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.COmmon.SetPlant,
  IQMS.Common.SysShare,
  workcntr_rscstr;

procedure DoEditCells;
var
  frm: TViewCells;
begin
  frm := TViewCells.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TViewCells.UniFormCreate(Sender: TObject);
begin
{ TODO -oLema : Unknown properties }
{  with GridCell do
  begin
    CheckReplaceDivisionOfWWSelected(Selected);
    ApplySelected;
  end;
  with cmbGridDivision do
    CheckReplaceDivisionOfWWSelected(Selected);
}

  IQSetTablesActive(TRUE, self);
end;


procedure TViewCells.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlGrid, GridCell]);
end;

procedure TViewCells.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TViewCells.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlGrid, GridCell]);
end;

procedure TViewCells.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TViewCells.cmbGridDivisionCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
{ TODO -oLema : Unknown IQMS.Common.Controls.UpdateDBLookupComboDisplay }
{
  IQMS.Common.Controls.UpdateDBLookupComboDisplay(
    TUniDBLookupComboBox(Sender),
    LookupTable,
    FillTable,
    modified,
    'DIVISION_ID', //TargetIDField
    'ID', //LookupIDField
    'DivisionName', //TargetDisplayField
    'NAME' //LookupDisplayField
    );
}
end;

procedure TViewCells.cmbGridDivisionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_BACK then
    Key := 0
  else if Key = VK_DELETE then
  begin
    { TODO -oLema : Unknown CloseUp }
//    cmbGridDivision.CloseUp(False);
    IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, TblCellDIVISION_ID);
    TblCellDIVISIONNAME.Clear;
  end;
end;

procedure TViewCells.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext); { IQMS.Common.HelpHook.pas }
end;

procedure TViewCells.TblCellMFGCELLSetText(Sender: TField;
  const Text: string);
begin
  Sender.asString := UpperCase(Text);
end;

procedure TViewCells.TblCellNewRecord(DataSet: TDataSet);
begin
  TblCellID.AsLargeInt := GetNextID('MFGCELL');
  TblCellPROD_REP_METHOD.asString := 'S';
  TblCellACT_COST_METHOD.asString := 'S';
end;


procedure TViewCells.TblCellBeforeDelete(DataSet: TDataSet);
begin
  //workcntr_rscstr.cTXT0000016 =
  //'If you delete this cell, all the Work Centers and manufacturing numbers
  //associated with this cell will be unassigned.'#13#13+
  //'Are you sure you want to continue?'}
  if not IQWarningYN(workcntr_rscstr.cTXT0000016) then
    ABORT;
end;

procedure TViewCells.SrcCellDataChange(Sender: TObject; Field: TField);
begin
  wwDBComboBoxActCostMethod.Enabled := TblCellPROD_REP_METHOD.asString <> 'W';
end;

procedure TViewCells.wwDBComboBoxProdRepMethodChange(Sender: TObject);
begin
  if wwDBComboBoxProdRepMethod.Focused then
  begin
    //to convey change to the undelying field TblCellPROD_REP_METHOD
    Panel10.SetFocus;
    wwDBComboBoxProdRepMethod.SetFocus;
  end;
end;

procedure TViewCells.wwDBComboDlgStagingLocationKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_BACK then
    Key := 0
  else if Key = VK_DELETE then
  begin
    IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, TblCellSTAGING_LOCATIONS_ID);
    TblCellSTAGINGLOCDESC.Clear;
  end;
end;

procedure TViewCells.GridCellDBGridDblClick(Sender: TObject);
begin
{ TODO -oLema : Unknown GetActiveField }
//  if GridCell.GetActiveField = TblCellEPLANTNAME then
//    sbtnAssignEPlant.Click;
end;

procedure TViewCells.GridCellDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

//  if Highlight then
//    Exit;
  if CompareText(Column.Field.FieldName, 'EPLANTNAME') = 0 then
    Attribs.Color := clBtnFace;
end;


procedure TViewCells.sbtnAssignEPlantClick(Sender: TObject);
begin
  if not (TblCell.State in [dsEdit, dsInsert]) then
    TblCell.Edit;

  try
    TblCellEPLANT_ID.ReadOnly := False;
    if IQMS.COmmon.SetPlant.DoChangePlantIDEx(TblCell) then
    begin
      TblCell.Post;
      RefreshDataSetByID(TblCell);
    end;
  finally
    TblCellEPLANT_ID.ReadOnly := TRUE;
  end;
end;

procedure TViewCells.TblCellBeforeEdit(DataSet: TDataSet);
begin
  TblCellMFGCELL.ReadOnly := TRUE;
end;

procedure TViewCells.TblCellBeforeInsert(DataSet: TDataSet);
begin
  TblCellMFGCELL.ReadOnly := False;
end;

procedure TViewCells.TblCellBeforePost(DataSet: TDataSet);
begin
  if TblCellPROD_REP_METHOD.asString = 'W' then
    TblCellACT_COST_METHOD.Clear;
end;

procedure TViewCells.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TViewCells.wwDBComboDlgINLocationCustomDlg(Sender: TObject);
begin
  with PkLocation do
    if Execute then
    begin
      if not (TblCell.State in [dsEdit, dsInsert]) then
        TblCell.Edit;
      TblCellLOCATIONS_ID_IN.AsLargeInt := System.Variants.VarAsType(
        GetValue('ID'), varInt64);
      TblCellINLOCATIONDESC.asString := System.Variants.VarToStr(
        GetValue('LOCATION'));
      wwDBComboDlgINLocation.Text := TblCellINLOCATIONDESC.asString;
    end;
end;

procedure TViewCells.wwDBComboDlgINLocationKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_BACK then
    Key := 0
  else if Key = VK_DELETE then
  begin
    IQMS.Common.Controls.CheckClearWWDBComboDlg(Sender, Key, TblCellLOCATIONS_ID_IN);
    TblCellINLOCATIONDESC.Clear;
  end;
end;

procedure TViewCells.wwDBComboDlgStagingLocationCustomDlg(Sender: TObject);
begin
  with PkLocation do
    if Execute then
    begin
      if not (TblCell.State in [dsEdit, dsInsert]) then
        TblCell.Edit;
      TblCellSTAGING_LOCATIONS_ID.AsLargeInt :=
        System.Variants.VarAsType(GetValue('ID'), varInt64);
      TblCellSTAGINGLOCDESC.asString := System.Variants.VarToStr(
        GetValue('LOCATION'));
      wwDBComboDlgStagingLocation.Text := TblCellSTAGINGLOCDESC.asString;
    end;
end;

procedure TViewCells.PkLocationBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'division_id',
    TblCellDIVISION_ID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'eplant_id',
    TblCellEPLANT_ID.AsLargeInt);
end;

end.
