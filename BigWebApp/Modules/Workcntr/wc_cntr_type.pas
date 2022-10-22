{ TUpdateSQL UpdateSQLCntrType was updated manually. The component was only recognizing cntr_type_elements so I had to change it to cntr_type in the updates stat }
unit wc_cntr_type;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniMainMenu,
  IQUniGrid,
  uniGUIFrame,
  Vcl.Controls,
  Vcl.ExtCtrls;

type
  TFrmWorkCenterType = class(TUniForm)
    Panel1: TUniPanel;
    pnlHeader: TUniPanel;
    Splitter1: TUniSplitter;
    pnlDetails: TUniPanel;
    Panel4: TUniPanel;
    wwDBGridCntrType: TIQUniGridControl;
    wwDBGridElements: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    NavElements: TUniDBNavigator;
    SrcCntrType: TDataSource;
    QryCntrType: TFDQuery;
    QryCntrTypeID: TBCDField;
    QryCntrTypeNAME: TStringField;
    SrcElements: TDataSource;
    QryElements: TFDQuery;
    QryElementsID: TBCDField;
    QryElementsCNTR_TYPE_ID: TBCDField;
    QryElementsELEMENTS_ID: TBCDField;
    QryElementsSTD_COST: TFMTBCDField;
    QryElementsFIXED_STD_COST: TFMTBCDField;
    PkCntrType: TIQWebHPick;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    UpdateSQLCntrType: TFDUpdateSQL;
    UpdateSQLElements: TFDUpdateSQL;
    wwDBEditCenterType: TUniDBEdit;
    wwDBComboDlgElemDescrip: TUniEdit;
    QryElementsELEM_DESCRIP: TStringField;
    QryElementsELEM_TYPE: TStringField;
    sbtnSearch: TUniSpeedButton;
    PkCntrTypeID: TBCDField;
    PkCntrTypeNAME: TStringField;
    PkCntrTypeRATE: TBCDField;
    PkCntrTypeCOST: TFMTBCDField;
    PkCostElements: TIQWebHPick;
    PkCostElementsID: TBCDField;
    PkCostElementsELEM_DESCRIP: TStringField;
    PkCostElementsELEM_TYPE: TStringField;
    PkCostElementsGLACCT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    QryCntrTypeIS_CHANGED: TStringField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnApplyPending: TUniBitBtn;
    pnlLegend: TUniPanel;
    Shape4: TShape;
    QryCntrTypeEPLANT_ID: TBCDField;
    wwDBComboDlgEplant_ID: TUniEdit;
    PkCntrTypeEPLANT_ID: TBCDField;
    QryCntrTypeSTD_COST: TFMTBCDField;
    QryCntrTypeFIXED_COST: TFMTBCDField;
    Contents1: TUniMenuItem;
    QryCntrTypeFUTURE_STD_COST: TFMTBCDField;
    QryCntrTypeFUTURE_FIXED_STD_COST: TFMTBCDField;
    QryCntrTypeBUDGET_STD_COST: TFMTBCDField;
    QryCntrTypeBUDGET_FIXED_STD_COST: TFMTBCDField;
    QryCntrTypeFORECAST_STD_COST: TFMTBCDField;
    QryCntrTypeFORECAST_FIXED_STD_COST: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryCntrTypeBeforePost(DataSet: TDataSet);
    procedure QryElementsBeforePost(DataSet: TDataSet);
    procedure QryElementsNewRecord(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure wwDBComboDlgElemDescripCustomDlg(Sender: TObject);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure bbtnSyncWorkCentersClick(Sender: TObject);
    procedure ApplyUpdateToChild(DataSet: TDataSet);
    procedure wwDBGridCntrTypeCalcCellColors(Sender: TObject;
      Field: TField; {State: TGridDrawState;} Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure wwDBComboDlgEplant_IDCustomDlg(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure QryElementsBeforeInsert(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  strict private
    FCenter_Type_ID : Real;
    procedure SyncWorkCentersOfCntrType(ACntr_Type_ID: Real);
    procedure CheckEnableApplyPending;
    function GetCenter_Type_ID : Real;
    procedure SetCenter_Type_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow(ACenter_Type_ID : Real);

    property Center_Type_ID  : Real read GetCenter_Type_ID write SetCenter_Type_ID;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  //SetPlant,
  workcntr_rscstr;

{ TFrmWorkCenterType }

class procedure TFrmWorkCenterType.DoShow(ACenter_Type_ID : Real);
var
  aFrmWorkCenterType : TFrmWorkCenterType;
begin
  aFrmWorkCenterType := TFrmWorkCenterType.Create(UniGUIApplication.UniApplication);
  aFrmWorkCenterType.Center_Type_ID := ACenter_Type_ID;
  aFrmWorkCenterType.ShowModal;
end;

procedure TFrmWorkCenterType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(self, [self, pnlHeader, wwDBGridCntrType, wwDBGridElements]);
end;

function TFrmWorkCenterType.GetCenter_Type_ID: Real;
begin
  Result:= FCenter_Type_ID;
end;

procedure TFrmWorkCenterType.SetCenter_Type_ID(const Value: Real);
begin
  FCenter_Type_ID := Value;
end;

procedure TFrmWorkCenterType.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmWorkCenterType.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWorkCenterType.QryCntrTypeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'cntr_type');
end;

procedure TFrmWorkCenterType.QryElementsBeforeInsert(DataSet: TDataSet);
begin
  QryCntrType.CheckBrowseMode;
  wwDBComboDlgElemDescripCustomDlg(DataSet);
end;

procedure TFrmWorkCenterType.QryElementsBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'cntr_type_elements');
end;

procedure TFrmWorkCenterType.QryElementsNewRecord(DataSet: TDataSet);
begin
  QryElementsCNTR_TYPE_ID.AsLargeInt := QryCntrTypeID.AsLargeInt;
end;

procedure TFrmWorkCenterType.sbtnSearchClick(Sender: TObject);
begin
  with PkCntrType do
    if Execute then
      QryCntrType.Locate('ID', System.Variants.VarAsType(GetValue('ID'),
        varInt64), [])
end;

procedure TFrmWorkCenterType.wwDBComboDlgElemDescripCustomDlg(Sender: TObject);
begin
  with PkCostElements do
    if Execute then
      begin
        if QryElements.State = dsBrowse then
          QryElements.Edit;
        QryElementsELEMENTS_ID.asFloat := System.Variants.VarAsType
          (GetValue('ID'), varInt64);
      end;
end;

procedure TFrmWorkCenterType.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  QryCntrType.CheckBrowseMode;
end;

procedure TFrmWorkCenterType.bbtnSyncWorkCentersClick(Sender: TObject);
var
  AList: TStringList;
  I: Integer;
begin
  // workcntr_rscstr.cTXT0000046 =
  // 'This option updates all work centers based on associated ' +
  // 'center type pending changes.  Do you want to continue?';
  if not IQConfirmYN(workcntr_rscstr.cTXT0000046) then
    Exit;

  AList := TStringList.Create;
  try
    LoadColumnValueIntoStringList(AList,
      'select id from cntr_type where is_changed = ''Y''');
    for I := AList.Count - 1 downto 0 do
      SyncWorkCentersOfCntrType(StrToFloat(AList[I]));
  finally
    AList.Free;
  end;

  RefreshDataSetByID(QryCntrType);
  CheckEnableApplyPending;
end;

procedure TFrmWorkCenterType.SRAfterApply(Sender: TObject);
begin
  wwDBEditCenterType.Visible := False;
  wwDBComboDlgEplant_ID.Visible := False;
  wwDBComboDlgElemDescrip.Visible := False;
end;

procedure TFrmWorkCenterType.SyncWorkCentersOfCntrType(ACntr_Type_ID: Real);
var
  I: Integer;
begin
  ExecuteCommandFmt(
    'begin cntr_type_misc.sync_cntr_type_work_centers( %f ); end;',
    [ACntr_Type_ID]);
end;

procedure TFrmWorkCenterType.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlHeader, wwDBGridCntrType, wwDBGridElements]);
end;

procedure TFrmWorkCenterType.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(True, self);
  CheckEnableApplyPending;
  LocateOrPickList(self, FCenter_Type_ID, QryCntrType, PkCntrType);
end;

procedure TFrmWorkCenterType.ApplyUpdateToChild(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);

  // the trigger on cntr_type_elements will toggle the cntr_type.is_changed to Y.
  // Refresh the parent cntr_type grid to reflect it. Same for cost totals
  RefreshParentChildByID([QryCntrType, QryElements]);

  btnApplyPending.Enabled := True and SR.Enabled['btnApplyPending'];
end;

procedure TFrmWorkCenterType.wwDBGridCntrTypeCalcCellColors(
  Sender: TObject; Field: TField; {State: TGridDrawState;}
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    EXIT;

  if QryCntrTypeIS_CHANGED.asString = 'Y' then
    begin
      AFont.Color := clWindow;
      ABrush.Color := clRed
    end;
end;

procedure TFrmWorkCenterType.CheckEnableApplyPending;
begin
  btnApplyPending.Enabled :=
    (SelectValueAsInteger(
    'select 1 from cntr_type where is_changed = ''Y'' and rownum < 2') = 1) and
    SR.Enabled['btnApplyPending'];
end;

procedure TFrmWorkCenterType.wwDBComboDlgEplant_IDCustomDlg(
  Sender: TObject);
begin
  //DoChangePlantID(self, QryCntrType); { SetPlant.pas }
end;

procedure TFrmWorkCenterType.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext); { IQMS.Common.HelpHook.pas }
end;

procedure TFrmWorkCenterType.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } ); { IQMS.Common.HelpHook.pas }
end;

end.
