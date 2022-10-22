unit Rejects;

{ *** History ***

  07/08/2009
  Replaced TFDTable dataset with TFDQuery, and update SQL. Added TIQSearch grid.
  Customer wanted to be able to sort and search items in the rejects grid.
  Requested by Randy (SCR #361) for 05-05-09 SP1. [7.7.2.1] (Byron);

}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  Grids,
  ExtCtrls,
  DBCtrls,
  DBGrids,
  DB,
  Wwdatsrc,
  Wwdbigrd,
  Wwdbgrid,
  Mask,
  wwdbedit,
  Wwdotdot,
  Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
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
  uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmRejects = class(TUniForm)
    SrcRejects: TDataSource;
    TblRejects: TFDQuery;
    TblRejectsID: TBCDField;
    TblRejectsHIST_ILLUM_PART_ID: TBCDField;
    TblRejectsPROD_DATE: TDateTimeField;
    TblRejectsSHIFT: TBCDField;
    TblRejectsREJECTS: TBCDField;
    TblRejectsREJECT_CODE: TStringField;
    TblRejectsOPNO: TStringField;
    TblRejectsSOURCE: TStringField;
    TblRejectsAttribute: TStringField;
    QryDescripLookUp: TFDQuery;
    TblRejectsCode: TStringField;
    wwDBLookupComboReason: TUniDBLookupComboBox;
    wwDBComboDlgRejects: TUniEdit;
    TblRejectsFG_LOTNO: TStringField;
    QryDescripLookUpREJECT_CODE: TStringField;
    QryDescripLookUpATTRIBUTE: TStringField;
    QryDescripLookUpEPLANT_ID: TBCDField;
    wwDBLookupComboCode: TUniDBLookupComboBox;
    wwCodeLookUp: TFDQuery;
    wwCodeLookUpREJECT_CODE: TStringField;
    wwCodeLookUpATTRIBUTE: TStringField;
    wwCodeLookUpEPLANT_ID: TBCDField;
    TblRejectsDAY_PART_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    PMain: TUniPopupMenu;
    About1: TUniMenuItem;
    TblRejectsCAVITY_NO: TStringField;
    TblRejectsPMEQMT_EQNO: TStringField;
    Grid: TIQUniGridControl;
    TblRejectsCOMMENT1: TStringField;
    SrcDescripLookUp: TDataSource;
    SrcCodeLookUp: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TblRejectsBeforePost(DataSet: TDataSet);
    procedure TblRejectsNewRecord(DataSet: TDataSet);
    procedure TblRejectsBeforeClose(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlgRejectsCustomDlg(Sender: TObject);
    procedure AssignParams(DataSet: TDataSet);
    procedure wwDBLookupComboCodeCloseUp(Sender: TObject;
      LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure About1Click(Sender: TObject);
    procedure TblRejectsAfterPost(DataSet: TDataSet);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure TblRejectsUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);

    procedure TblRejectsBeforeDelete(DataSet: TDataSet);
    procedure TblRejectsBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
  private
    { Private declarations }
    FID: Real;
    FProd_Date: TDateTime;
    FShift: Integer;
    FMfgType: string;
    FUom: string;
    Fg_LotNo: string;
    FDay_Part_ID: Real;
    FMfgCell_ID: Real;
    FReadOnly: Boolean;
    procedure AssignRejectsColumn;
    procedure DoRefresh;
    procedure SetDay_Part_ID(const Value: Real);
  public
    { Public declarations }
    property ID: Real read FID write FID;
    property Prod_Date: TDateTime read FProd_Date write FProd_Date;
    property Shift: Integer read FShift write FShift;
    property Day_Part_ID: Real write SetDay_Part_ID;
  end;

  // procedure DoEditRTRejects( ADay_Part_ID:Real; Prod_Date:TDateTime; Shift:Integer; AFG_LotNo: string );
procedure DoEditRTRejects(ADay_Part_ID: Real; AReadOnly: Boolean = FALSE);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  {TODO -oSanketG -cWebConvert : Need to revisit}
  // UomConv,
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  Variants,
  prod_rscstr;

procedure DoEditRTRejects(ADay_Part_ID: Real; AReadOnly: Boolean = FALSE);
var
  FrmRejects: TFrmRejects;
begin
  FrmRejects := TFrmRejects.Create(uniGUIApplication.uniApplication);
  with FrmRejects do
  begin
    Day_Part_ID := ADay_Part_ID;
    FReadOnly := AReadOnly;
    ShowModal
  end;
end;

procedure TFrmRejects.FormCreate(Sender: TObject);
begin
  AssignRejectsColumn;
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl }
  //Grid.Wwdbgrid.Options := Grid.Wwdbgrid.Options + [dgTabs];

  IQRegFormRead(self, [self]);
  TblRejects.Close;
  TblRejects.CachedUpdates := not FReadOnly;

  IQSetTablesActive(TRUE, self); // pas
  // Hide the grid controls
  wwDBComboDlgRejects.Visible := FALSE;
  wwDBLookupComboReason.Visible := FALSE;
  wwDBLookupComboCode.Visible := FALSE;
end;

procedure TFrmRejects.FormShow(Sender: TObject);
var
  A: Variant;
begin
  // 07/08/2009 Normally the TIQSearch grid is rowselect and read-only.
  // Setting these values at design-time generated a
  // 'List index out of bounds' error.  To compensate, we
  // set the options here, after the components have loaded.
  // (Byron).
  { TODO -oSanketG -cWebConvert : Need to find alternative for Options in TIQUniGridControl }
  {Grid.Options := Grid.Options - [dgRowSelect];
  if not FReadOnly then
    Grid.Options := Grid.Options + [dgEditing];}
  A := SelectValueArrayFmt('select p.hist_illum_part_id, ' +
    '       d.prod_date,          ' + '       d.shift,              ' +
    '       d.fg_lotno            ' + '  from day_part p, dayprod d ' +
    ' where p.dayprod_id = d.id   ' + '   and p.id = %f             ',
    [FDay_Part_ID]);

  if VarArrayDimCount(A) = 0 then
    A := SelectValueArrayFmt('select p.hist_illum_part_id,   ' +
      '       d.prod_date,            ' + '       d.shift,                ' +
      '       d.fg_lotno              ' + '  from pday_part p, pdayprod d ' +
      ' where p.dayprod_id = d.id   ' + '   and p.id = %f             ',
      [FDay_Part_ID]);

  IQAssert(VarArrayDimCount(A) > 0, Format('Invalid day_part_id = %.0f',
    [FDay_Part_ID]));

  ID := A[0];
  Prod_Date := Trunc(A[1]);
  Shift := A[2];
  Fg_LotNo := A[3];

  A := SelectValueArrayFmt
    ('select h.mfg_type, h.uom, h.mfgcell_id from hist_illum_rt h, hist_illum_part p where p.id = %f and p.hist_illum_rt_id = h.id',
    [ID]);
  if VarArrayDimCount(A) > 0 then
  begin
    FMfgType := A[0];
    FUom := A[1];
    FMfgCell_ID := A[2];
  end;

end;

procedure TFrmRejects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // TblRejects.Close;
  IQRegFormWrite(self, [self]);
end;

procedure TFrmRejects.TblRejectsBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'REJECTS');
end;

procedure TFrmRejects.TblRejectsNewRecord(DataSet: TDataSet);
begin
  TblRejectsDAY_PART_ID.asFloat := FDay_Part_ID;
  TblRejectsHIST_ILLUM_PART_ID.asFloat := ID;
  TblRejectsPROD_DATE.asDateTime := Prod_Date;
  TblRejectsSHIFT.asInteger := Shift;
  TblRejectsFG_LOTNO.asString := Fg_LotNo;
  TblRejectsSOURCE.asString := 'PR';
end;

procedure TFrmRejects.TblRejectsBeforeClose(DataSet: TDataSet);
begin
  with DataSet do
    if (State in [dsInsert, dsEdit]) and IQWarningYN('Save Changes?') then
      Post;
end;

procedure TFrmRejects.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmPROD_REP { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmRejects.AssignRejectsColumn;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for ShowButton in TUniEdit }
  {wwDBComboDlgRejects.ShowButton :=
    StrInList(FMfgType, ['EXTRUSION', 'EXTRUSION2', 'EXTRUSION3', 'COMPOUND1']);}
  if FMfgType = 'EXTRUSION' then
    TblRejectsREJECTS.DisplayLabel := prod_rscstr.cTXT0000042; // 'Length (ft)'

  TblRejectsCAVITY_NO.Visible := IsLikeInjection(FMfgType);
end;

procedure TFrmRejects.wwDBComboDlgRejectsCustomDlg(Sender: TObject);
var
  AValue: Real;
  AArinvt_ID: Real;
  ASourceUOM: string;
  AUOMType: string;
begin
  if FReadOnly then
    EXIT;

  AValue := TblRejectsREJECTS.asFloat;
  AArinvt_ID := SelectValueFmtAsFloat('select p.arinvt_id from partno p, ' +
    'hist_illum_part h where h.id = %f and p.id = h.partno_id', [ID]);

  if StrInList(FMfgType, ['EXTRUSION', 'EXTRUSION2', 'EXTRUSION3', 'COMPOUND1'])
  then
  begin
    ASourceUOM := IIf(FMfgType = 'EXTRUSION', 'FT', 'EACH');
    AUOMType := IIf(FMfgType = 'EXTRUSION', 'LENGTH', 'WEIGHT');

    { UomConv.pas }
    { TODO -oSanketG -cWebConvert : Need to revisit , dependent on uomconv}
    (*if IQGetConvertedUOM(ASourceUOM, { Source UOM }
      FUom, { Target UOM }
      AValue, { Converted Value }
      AUOMType, { UOM Type }
      AArinvt_ID) then { Arinvt_ID }
    begin
      TblRejects.Edit;
      TblRejectsREJECTS.asFloat := AValue;
    end;*)
  end;
end;

procedure TFrmRejects.AssignParams(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // if Params.FindParam('mfgcell_id') <> nil then
  // ParamByName('mfgcell_id').asFloat:= FMfgCell_ID;
  AssignQueryParamValue(DataSet, 'mfgcell_id', FMfgCell_ID);

  //IQAssignEPlantFilter(DataSet, TRUE);
end;

procedure TFrmRejects.wwDBLookupComboCodeCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    TblRejectsAttribute.asString := LookupTable.FieldByName
      ('attribute').asString;
    TblRejectsREJECT_CODE.asString := LookupTable.FieldByName
      ('REJECT_CODE').asString;
  end;
end;

procedure TFrmRejects.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRejects.TblRejectsAfterPost(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
  begin
    ApplyUpdates;
    CommitUpdates;
  end;

  DoRefresh;
end;

procedure TFrmRejects.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    DoRefresh;
    SysUtils.Abort;
  end;
end;

procedure TFrmRejects.SetDay_Part_ID(const Value: Real);
begin
  FDay_Part_ID := Value;
end;

procedure TFrmRejects.DoRefresh;
begin
  RefreshDataSetByID(TblRejects);
end;

procedure TFrmRejects.TblRejectsBeforeOpen(DataSet: TDataSet);
begin
  // with TFDQuery(DataSet) do
  // begin
  // ParamByName('DAY_PART_ID').AsFloat := FDay_Part_ID;
  // // ParamByName('BY_DAY_PART_ID').AsInteger := INTEGER(FDay_Part_ID>0);
  // end;
  AssignQueryParamValue(DataSet, 'DAY_PART_ID', FDay_Part_ID);
end;

procedure TFrmRejects.TblRejectsBeforeDelete(DataSet: TDataSet);
begin
  ExecuteCommandFmt('delete from rejects where id = %.0f',
    [DataSet.FieldByName('ID').asFloat]);
end;

procedure TFrmRejects.TblRejectsUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);

var
  ASQL: String;
begin
  if ARequest = arUpdate then
    with ASender do
    begin
      ASQL := 'update REJECTS set'#13 + '  rejects = :REJECTS,'#13 +
        '  attribute = :ATTRIBUTE,'#13 + '  reject_code = :REJECT_CODE,'#13 +
        '  cavity_no = :CAVITY_NO,'#13 + '  pmeqmt_eqno = :PMEQMT_EQNO,'#13 +
        '  opno = :OPNO,'#13 + '  source = :SOURCE,'#13 +
        '  fg_lotno = :FG_LOTNO,'#13 + '  day_part_id = :DAY_PART_ID,'#13 +
        '  hist_illum_part_id = :HIST_ILLUM_PART_ID,'#13 +
        '  prod_date = :PROD_DATE,'#13 + '  shift = :SHIFT,'#13 +
        '  comment1 = :COMMENT1'#13 + 'where id = :ID';

      ExecuteCommandParamDataSet(ASQL, ASender); // iqlib
    end
  else if ARequest = arInsert then
    with ASender do
    begin
      ASQL := 'insert into REJECTS'#13 + '('#13 + '  id,'#13 +
        '  hist_illum_part_id,'#13 + '  prod_date,'#13 + '  shift,'#13 +
        '  rejects,'#13 + '  reject_code,'#13 + '  opno,'#13 + '  source,'#13 +
        '  attribute,'#13 + '  fg_lotno,'#13 + '  day_part_id,'#13 +
        '  cavity_no,'#13 + '  pmeqmt_eqno,'#13 + '  comment1'#13 + ')'#13 +
        'values'#13 + '('#13 + '  :ID,'#13 + '  :HIST_ILLUM_PART_ID,'#13 +
        '  :PROD_DATE,'#13 + '  :SHIFT,'#13 + '  :REJECTS,'#13 +
        '  :REJECT_CODE,'#13 + '  :OPNO,'#13 + '  :SOURCE,'#13 +
        '  :ATTRIBUTE,'#13 + '  :FG_LOTNO,'#13 + '  :DAY_PART_ID,'#13 +
        '  :CAVITY_NO,'#13 + '  :PMEQMT_EQNO,'#13 + '  :COMMENT1'#13 + ')';

      ExecuteCommandParamDataSet(ASQL, ASender); // iqlib
    end;

  AAction := eaApplied;
end;

procedure TFrmRejects.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    EXIT;
  if (UpperCase(Field.FieldName) = 'PMEQMT_EQNO') then
    ABrush.Color := clBtnFace;
end;

end.
