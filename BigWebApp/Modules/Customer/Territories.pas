unit Territories;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.DBCtrls, //TNavigateBtn
  uniDBGrid, //TUniDBGridColumn
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  FireDAC.UI.Intf,
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
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

(* For a tree view:
  *  1. Start with parent nodes:
  *
  *     SELECT id
  *       FROM territory
  *      WHERE parent_id IS NULL
  *
  *  2. For each parent node, show child nodes:
  *
  *        SELECT id,
  *               code,
  *               descrip,
  *               parent_id
  *          FROM territory
  *    START WITH id = 9
  *    CONNECT BY parent_id = PRIOR id
*)

type
  { TFrmTerritories }
  TFrmTerritories = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Search1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    SR: TIQWebSecurityRegister;
    PkTerritory: TIQWebHPick;
    SrcTerritory: TDataSource;
    QryTerritory: TFDQuery;
    FDUpdateSQL_Territory: TFDUpdateSQL;
    SrcTerritoryPrEmp: TDataSource;
    QryTerritoryPrEmp: TFDQuery;
    FDUpdateSQL_TerritoryPrEmp: TFDUpdateSQL;
    QryTerritoryID: TBCDField;
    QryTerritoryCODE: TStringField;
    QryTerritoryDESCRIP: TStringField;
    QryTerritoryPARENT_ID: TBCDField;
    QryTerritoryPARENT_CODE: TStringField;
    QryTerritoryPARENT_DESCRIP: TStringField;
    QryTerritoryPrEmpID: TBCDField;
    QryTerritoryPrEmpTERRITORY_ID: TBCDField;
    QryTerritoryPrEmpPR_EMP_ID: TBCDField;
    QryTerritoryPrEmpFIRST_NAME: TStringField;
    QryTerritoryPrEmpLAST_NAME: TStringField;
    QryTerritoryPrEmpUSER_NAME: TStringField;
    QryTerritoryPrEmpMIDDLE_NAME: TStringField;
    PkEmployee: TIQWebHPick;
    PkEmployeeID: TBCDField;
    PkEmployeeEMPNO: TStringField;
    PkEmployeeFIRST_NAME: TStringField;
    PkEmployeeMIDDLE_NAME: TStringField;
    PkEmployeeLAST_NAME: TStringField;
    PkEmployeeEMAIL: TStringField;
    PkEmployeeEPLANT_ID: TBCDField;
    PkEmployeeUSER_NAME: TStringField;
    PkEmployeeEPLANT_NAME: TStringField;
    PkEmployeeDISPLAY_NAME: TStringField;
    PkEmployeePK_HIDE: TStringField;
    PkTerritoryID: TBCDField;
    PkTerritoryCODE: TStringField;
    PkTerritoryDESCRIP: TStringField;
    PkTerritoryPARENT_ID: TBCDField;
    PkTerritoryPARENT_CODE: TStringField;
    PkTerritoryPARENT_DESCRIP: TStringField;
    PnlHeader: TUniPanel;
    PnlDetail: TUniPanel;
    Splitter1: TUniSplitter;
    PnlToolbar: TUniPanel;
    PnlToolbarDetail: TUniPanel;
    PnlGridDetail: TUniPanel;
    PnlHeaderControls: TUniPanel;
    Splitter2: TUniSplitter;
    PnlHeaderControlsLeft1: TUniPanel;
    PnlHeaderControlsClient1: TUniPanel;
    NavMain: TUniDBNavigator;
    GridDetail: TIQUniGridControl;
    dbeCode: TUniDBEdit;
    dbeDescription: TUniDBEdit;
    lblCode: TUniLabel;
    lblDescription: TUniLabel;
    cmbParent: TUniEdit;
    dbeParentDescription: TUniDBEdit;
    lblParentCode: TUniLabel;
    lblParentDescription: TUniLabel;
    sbtnSearch: TUniSpeedButton;
    PkParentTerritory: TIQWebHPick;
    PkParentTerritoryID: TBCDField;
    PkParentTerritoryCODE: TStringField;
    PkParentTerritoryDESCRIP: TStringField;
    PMain: TUniPopupMenu;
    SelectParentCode1: TUniMenuItem;
    ClearParentCode1: TUniMenuItem;
    sbtnClear: TUniSpeedButton;
    Contents1: TUniMenuItem;
    N1: TUniMenuItem;
    procedure Search1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryTerritoryBeforePost(DataSet: TDataSet);
    procedure QryTerritoryNewRecord(DataSet: TDataSet);
    procedure QryTerritoryPrEmpAfterPost(DataSet: TDataSet);
    procedure QryTerritoryPrEmpBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PkTerritoryIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure PkParentTerritoryBeforeOpen(DataSet: TDataSet);
    procedure SelectParentCode1Click(Sender: TObject);
    procedure ClearParentCode1Click(Sender: TObject);
    procedure cmbParentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AddNewEmployee;
  public
    { Public declarations }
    class procedure DoShow(ATerritoryID: Real);
  end;


implementation

{$R *.dfm}


uses
  cust_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;


procedure TFrmTerritories.UniFormCreate(Sender: TObject);
begin
//
end;

class procedure TFrmTerritories.DoShow(ATerritoryID: Real);
var
  frm: TFrmTerritories;
begin
  frm := TFrmTerritories.Create(uniGUIApplication.UniApplication);

  ReOpen(frm.QryTerritory);
  ReOpen(frm.QryTerritoryPrEmp);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(frm.PnlHeaderControlsClient1);
  if ATerritoryID > 0 then
    frm.QryTerritory.Locate('ID', ATerritoryID, [])
  else
    frm.Search1Click(nil);

  frm.Show;

end;

procedure TFrmTerritories.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlHeader, PnlHeaderControlsLeft1]);
//  IQMS.Common.Controls.AutoSizeNavBar(NavMain);
//  IQMS.Common.Controls.AutoSizeNavBar(NavDetail);
end;

procedure TFrmTerritories.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmCRM{CHM}, iqhtmCRM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTerritories.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlHeader, PnlHeaderControlsLeft1]);
end;

procedure TFrmTerritories.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTerritories.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTerritories.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTerritories.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTerritories.Search1Click(Sender: TObject);
begin
  with PkTerritory do
    if Execute then
      begin
        if NewResultValue then
          QryTerritory.Append
        else
          QryTerritory.Locate('ID', System.Variants.VarAsType(GetValue('ID'),
            varUInt64), []);
      end;
end;

procedure TFrmTerritories.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmTerritories.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  // cust_rscstr.cTXT0000073 = 'Delete territory?';
  IQCheckDelete(Sender, Button, cust_rscstr.cTXT0000073);
end;

procedure TFrmTerritories.PkParentTerritoryBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
    ParamByName('ID').Value := QryTerritoryID.AsFloat;
end;

procedure TFrmTerritories.PkTerritoryIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TFrmTerritories.QryTerritoryBeforePost(DataSet: TDataSet);
begin
  // cust_rscstr.cTXT0000074 = 'Please enter a Territory code.';
  IQAssert(Trim(QryTerritoryCODE.AsString) > '', cust_rscstr.cTXT0000074);
  // cust_rscstr.cTXT0000075 = 'Please enter a Territory description.';
  IQAssert(Trim(QryTerritoryDESCRIP.AsString) > '', cust_rscstr.cTXT0000075);
end;

procedure TFrmTerritories.QryTerritoryNewRecord(DataSet: TDataSet);
begin
  QryTerritoryID.AsLargeInt := GetNextID('TERRITORY');
end;

procedure TFrmTerritories.QryTerritoryPrEmpAfterPost(DataSet: TDataSet);
begin
  // cust_rscstr.cTXT0000076 = 'Please select an employee.';
  IQAssert(QryTerritoryPrEmpPR_EMP_ID.AsLargeInt > 0, cust_rscstr.cTXT0000076);
end;

procedure TFrmTerritories.QryTerritoryPrEmpBeforeInsert(DataSet: TDataSet);
begin
  AddNewEmployee;
  System.SysUtils.Abort;
end;

procedure TFrmTerritories.AddNewEmployee;
var
  AID, APrEmpID: Real;
begin
  with PkEmployee do
    if Execute then
      begin
        AID := GetNextID('territory_pr_emp');
        APrEmpID := System.Variants.VarAsType(GetValue('ID'), varUInt64);
        ExecuteCommandFmt(
          'INSERT INTO territory_pr_emp(id, territory_id, pr_emp_id) ' +
          'VALUES (%.0f, %.0f, %.0f)', [AID, QryTerritoryID.AsFloat, APrEmpID]);
        QryTerritoryPrEmp.Refresh;
        QryTerritoryPrEmp.Locate('ID', AID, []);
      end;
end;

procedure TFrmTerritories.cmbParentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Clear the parent ID
  if Key = VK_DELETE then
    begin
      Key := 0;
      ClearParentCode1Click(ClearParentCode1);
    end;
end;

procedure TFrmTerritories.SelectParentCode1Click(Sender: TObject);
var
  AParentID: Real;
begin
  if (QryTerritory.State in [dsEdit, dsInsert]) then
    QryTerritory.Post;
  with PkParentTerritory do
    if Execute then
      begin
        AParentID := System.Variants.VarAsType(GetValue('ID'), varUInt64);

        // Check for circular reference
        if (AParentID = QryTerritoryID.AsFloat) or
          (SelectValueFmtAsInt64(
          'SELECT parent_id FROM territory WHERE id = %.0f', [AParentID]) =
          QryTerritoryID.AsFloat) then
          raise Exception.Create
            ('Circular reference.  Cannot set parent Territory.');

        ExecuteCommandFmt(
          'UPDATE territory SET parent_id = %.0f WHERE id = %.0f',
          [AParentID, QryTerritoryID.AsFloat]);
        QryTerritory.Refresh;
      end;
end;


procedure TFrmTerritories.ClearParentCode1Click(Sender: TObject);
begin
  if not (QryTerritory.State in [dsEdit,dsInsert]) then
    QryTerritory.Edit;
  QryTerritoryPARENT_ID.Clear;
  QryTerritoryPARENT_CODE.Clear;
  QryTerritoryPARENT_DESCRIP.Clear;
end;

end.
