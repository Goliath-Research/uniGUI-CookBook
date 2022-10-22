unit Rej_main;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.UDComboBox,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  IQUniGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDBComboBox, uniComboBox, uniGUIFrame,
  uniLabel, Vcl.Controls;

type
  TFrmRejectsCode = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    TblRejectCodes: TFDTable;
    SrcRejectCodes: TDataSource;
    TblRejectCodesREJECT_CODE: TStringField;
    TblRejectCodesATTRIBUTE: TStringField;
    TblRejectCodesEPLANT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    TblRejectCodesMFGCELL_ID: TBCDField;
    wwDBGrid1: TIQUniGridControl;
    TblRejectCodesMfgCell: TStringField;
    wwDBLookupComboMfgCell: TUniDBLookupComboBox;
    QryMfgcell: TFDQuery;
    QryMfgcellID: TBCDField;
    QryMfgcellMFGCELL: TStringField;
    QryMfgcellDESCRIP: TStringField;
    QryMfgcellMFGTYPE: TStringField;
    QryMfgcellEPLANT_ID: TBCDField;
    wwDBComboDlgEPlant: TUniEdit;
    TblRejectCodesID: TBCDField;
    TblRejectCodesPK_HIDE: TStringField;
    TblRejectCodesCUSER1: TStringField;
    TblRejectCodesCUSER2: TStringField;
    IQUserDefLabelCUser1: TIQWebUserDefLabel;
    IQUserDefLabelCUser2: TIQWebUserDefLabel;
    IQUDComboBoxCUser1: TIQWebUDComboBox;
    IQUDComboBoxCUser2: TIQWebUDComboBox;
    TblRejectCodesACCT_ID_REJECT: TBCDField;
    TblRejectCodesGlAcct: TStringField;
    wwDBComboDlgGlacct: TUniEdit;
    PkAcct: TIQWebHPick;
    PkAcctID: TBCDField;
    PkAcctACCT: TStringField;
    PkAcctDESCRIP: TStringField;
    PkAcctTYPE: TStringField;
    PMClearGlAcct: TUniPopupMenu;
    ClearGlAcct1: TUniMenuItem;
    TblRejectCodesNON_CONFORM_LOCATIONS_ID: TBCDField;
    TblRejectCodesNonConformLocDesc: TStringField;
    wwDBComboDlgNonConformLoc: TUniEdit;
    PkLocation: TIQWebHPick;
    PkLocationID: TBCDField;
    PkLocationLOCATION: TStringField;
    PkLocationDESCRIPTION: TStringField;
    PkLocationEPLANT_ID: TBCDField;
    PkLocationDIVISION: TStringField;
    SrcQryMfgcell: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblRejectCodesBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure TblRejectCodesBeforePost(DataSet: TDataSet);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: string);
    procedure TblRejectCodesCalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgGlacctCustomDlg(Sender: TObject);
    procedure ClearGlAcct1Click(Sender: TObject);
    procedure wwDBComboDlgNonConformLocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgNonConformLocCustomDlg(Sender: TObject);
    procedure wwDBLookupComboMfgCellCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure wwDBLookupComboMfgCellKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure UpdateUserLabelColumnTitle(AFieldName, ATitleText: string);
    procedure wwDBComboDlgClear(Sender: TObject; var Key: Word; AField: TField);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRejectsCode: TFrmRejectsCode;

procedure ShowRejectList;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
//  IQSecIns,
  IQMS.COmmon.SetPlant;

procedure ShowRejectList;
var
  FrmRejectsCode : TFrmRejectsCode;
begin
  FrmRejectsCode := TFrmRejectsCode.Create(uniGUIApplication.UniApplication);
  FrmRejectsCode.ShowModal;
end;


procedure TFrmRejectsCode.FormActivate(Sender: TObject);
begin
//     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRejectsCode.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );

  if not SR.Visible[ 'TblRejectCodesEPLANT_ID' ] then
//  with wwDBGrid1. do
//  begin
//    // IQColumnByName( DBGrid1, 'EPLANT_ID' ).Collection:= NIL;
//
//    Select.Clear;
//    Selected.Add('REJECT_CODE'#9'11'#9'Code'#9#9);
//    Selected.Add('ATTRIBUTE'#9'24'#9'Description'#9#9);
//    // remove eplant_id: 'EPLANT_ID'#9'12'#9'EPlant ID'#9#9
//    Selected.Add('MfgCell'#9'20'#9'Mfg Cell'#9#9);
//    ApplySelected;
//  end;

//  IQMS.Common.Controls.ResizeNavBar(DBNavigator1);

  UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelCUser1.Caption );
  UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelCUser2.Caption );

//  IQRegFormRead(self, [self, wwDBGrid1]);
end;

procedure TFrmRejectsCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite(self, [self, wwDBGrid1]);
end;

procedure TFrmRejectsCode.TblRejectCodesBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

procedure TFrmRejectsCode.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmRejectsCode.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  IQAssert( SR.ReadWrite[ 'TblRejectCodesEPLANT_ID' ], 'Insufficient rights - access denied ...' );
  DoChangePlantID( TblRejectCodes );    {IQMS.COmmon.SetPlant.pas}
end;

procedure TFrmRejectsCode.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: string);
begin
  if AFieldName = 'CUSER1' then
     begin
       IQUserDefLabelCUser1.Execute;
       UpdateUserLabelColumnTitle( 'CUSER1', IQUserDefLabelCUser1.Caption );
     end
  else if AFieldName = 'CUSER2' then
     begin
       IQUserDefLabelCUser2.Execute;
       UpdateUserLabelColumnTitle( 'CUSER2', IQUserDefLabelCUser2.Caption );
     end
end;

procedure TFrmRejectsCode.wwDBLookupComboMfgCellCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (Trim(TblRejectCodesMfgCell.asString) <> Trim(wwDBLookupComboMfgCell.Text)) and (Trim(wwDBLookupComboMfgCell.Text) <> '') then
  begin
    TblRejectCodes.Edit;
    TblRejectCodesMFGCELL_ID.asFloat:= FillTable.FieldByName('id').asFloat;
  end;
end;

procedure TFrmRejectsCode.wwDBLookupComboMfgCellKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    TblRejectCodes.Edit;
    TblRejectCodesMFGCELL_ID.Clear;
  end;
end;

procedure TFrmRejectsCode.TblRejectCodesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;


procedure TFrmRejectsCode.UpdateUserLabelColumnTitle( AFieldName, ATitleText: string);
var
  i:integer;
begin
  TblRejectCodes.FieldByName(AFieldName).DisplayLabel:= ATitleText;
  for i:= 0 to wwDBGrid1.Columns.Count-1 do
    if wwDBGrid1.Columns.Items[i].FieldName = AFieldName then
       wwDBGrid1.Columns.Items[i].Title.Caption:= ATitleText;
end;

procedure TFrmRejectsCode.TblRejectCodesCalcFields(DataSet: TDataSet);
begin
  TblRejectCodesGlAcct.asString := SelectValueFmtAsString('select acct from glacct where id = %f', [TblRejectCodesACCT_ID_REJECT.asFloat]);

  if TblRejectCodesMFGCELL_ID.asFloat > 0 then
     TblRejectCodesMfgCell.asString:= SelectValueByID('mfgcell', 'mfgcell', TblRejectCodesMFGCELL_ID.asFloat);

  if TblRejectCodesNON_CONFORM_LOCATIONS_ID.asFloat > 0 then
     TblRejectCodesNonConformLocDesc.asString:= SelectValueByID('loc_desc', 'locations', TblRejectCodesNON_CONFORM_LOCATIONS_ID.asFloat );
end;

procedure TFrmRejectsCode.wwDBComboDlgGlacctCustomDlg(Sender: TObject);
begin
  with PkAcct do
  if Execute then
  begin
    if not (TblRejectCodes.State in [dsEdit, dsInsert]) then
      TblRejectCodes.Edit;
    TblRejectCodesACCT_ID_REJECT.AsFloat := GetValue('ID');
  end;
end;

procedure TFrmRejectsCode.ClearGlAcct1Click(Sender: TObject);
begin
  if not (TblRejectCodes.State in [dsEdit, dsInsert]) then
    TblRejectCodes.Edit;
  TblRejectCodesACCT_ID_REJECT.Clear;
end;


procedure TFrmRejectsCode.wwDBComboDlgNonConformLocCustomDlg(Sender: TObject);
begin
  with PkLocation do
     if Execute then
     begin
       TblRejectCodes.Edit;
       TblRejectCodesNON_CONFORM_LOCATIONS_ID.asFloat:= GetValue('id');
     end;
end;

procedure TFrmRejectsCode.wwDBComboDlgNonConformLocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  wwDBComboDlgClear( Sender, Key, TblRejectCodesNON_CONFORM_LOCATIONS_ID );
end;


procedure TFrmRejectsCode.wwDBComboDlgClear(Sender: TObject; var Key: Word; AField: TField);
begin
  if (Sender is TUniEdit) and (Key = VK_DELETE) then
  begin
    AField.DataSet.Edit;
    AField.Clear;
    TUniEdit(Sender).Text:= '';
    Key:= 0;
  end;
end;




end.
