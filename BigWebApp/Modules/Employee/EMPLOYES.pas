unit Employes;

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
  Menus,
  DBCtrls,
  Buttons,
  ExtCtrls,
  Grids,
  DBGrids,
  ComCtrls,
  Data.Db,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  StdCtrls,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmEmployee = class(TUniForm)
    Panel1: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    sbtnTableForm: TUniSpeedButton;
    navEmp: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    N7: TUniMenuItem;
    ToggleFormTable1: TUniMenuItem;
    N6: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    N2: TUniMenuItem;
    About1: TUniMenuItem;
    pcEmp: TUniPageControl;
    tabGrid: TUniTabSheet;
    tabForm: TUniTabSheet;
    gridEmp: TUniDBGrid;
    SrcEmp: TDataSource;
    TblEmp: TFDQuery;
    TblEmpEMPNO: TStringField;
    TblEmpFIRST_NAME: TStringField;
    TblEmpMIDDLE_NAME: TStringField;
    TblEmpLAST_NAME: TStringField;
    TblEmpSSNMBR: TStringField;
    TblEmpADDR1: TStringField;
    TblEmpADDR2: TStringField;
    TblEmpSTATE: TStringField;
    TblEmpCOUNTRY: TStringField;
    TblEmpZIP: TStringField;
    TblEmpPHONE_NUMBER: TStringField;
    TblEmpCITY: TStringField;
    TblEmpSTATUS_CODE: TStringField;
    TblEmpDATE_HIRED: TDateTimeField;
    TblEmpTERMINATION_DATE: TDateTimeField;
    TblEmpLAST_REVIEW_DATE: TDateTimeField;
    TblEmpNEXT_REVIEW_DATE: TDateTimeField;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
//    PrinterSetupDialog1: TPrinterSetupDialog;
    PkEmp: TIQWebHpick;
    PkEmpEMPNO: TStringField;
    PkEmpFIRST_NAME: TStringField;
    PkEmpMIDDLE_NAME: TStringField;
    PkEmpLAST_NAME: TStringField;
    PkEmpSSNMBR: TStringField;
    PkEmpADDR1: TStringField;
    PkEmpADDR2: TStringField;
    PkEmpSTATE: TStringField;
    PkEmpCOUNTRY: TStringField;
    PkEmpZIP: TStringField;
    PkEmpPHONE_NUMBER: TStringField;
    PkEmpCITY: TStringField;
    PkEmpSTATUS_CODE: TStringField;
    PkEmpDATE_HIRED: TDateTimeField;
    PkEmpTERMINATION_DATE: TDateTimeField;
    PkEmpNEXT_REVIEW_DATE: TDateTimeField;
    GroupBox1: TUniGroupBox;
    editEmpNo: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    editFName: TUniDBEdit;
    editMName: TUniDBEdit;
    Label3: TUniLabel;
    editLName: TUniDBEdit;
    Label4: TUniLabel;
    editSSN: TUniDBEdit;
    Label5: TUniLabel;
    editAddr1: TUniDBEdit;
    Label6: TUniLabel;
    Label7: TUniLabel;
    editAddr2: TUniDBEdit;
    Label8: TUniLabel;
    editPhone: TUniDBEdit;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label11: TUniLabel;
    Label12: TUniLabel;
    editCity: TUniDBEdit;
    editState: TUniDBEdit;
    editZip: TUniDBEdit;
    editCountry: TUniDBEdit;
    GroupBox2: TUniGroupBox;
    editHired: TUniDBEdit;
    Label17: TUniLabel;
    editTerm: TUniDBEdit;
    Label100: TUniLabel;
    Label101: TUniLabel;
    editStatus: TUniDBEdit;
    Label20: TUniLabel;
    editCharge: TUniDBEdit;
    Label21: TUniLabel;
    Label102: TUniLabel;
    editLast: TUniDBEdit;
    editNext: TUniDBEdit;
    SecurityRegister1: TIQWebSecurityRegister;
    TblEmpID: TBCDField;
    TblEmpCHARGE_RATE: TBCDField;
    PkEmpID: TBCDField;
    PkEmpCHARGE_RATE: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnTableFormClick(Sender: TObject);
    procedure TblEmpBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent);
  end;

procedure DoEmployees;

var
  FrmEmployee: TFrmEmployee;

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoEmployees;
var
  FrmEmployee : TFrmEmployee;
begin
  FrmEmployee := TFrmEmployee.Create(UniApplication);
  FrmEmployee.ShowModal;
end;

procedure TFrmEmployee.FormCreate(Sender: TObject);
begin
  TblEmp.Open;
  IQRegFormRead( self, [self, gridEmp]);
end;

procedure TFrmEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridEmp]);
end;

procedure TFrmEmployee.sbtnTableFormClick(Sender: TObject);
begin
  if (pcEmp.ActivePage = tabGrid) or (Sender = NIL) then
  begin
    gridEmp.DataSource:= NIL;
    pcEmp.ActivePage := tabForm;
  end
  else
  begin
    gridEmp.DataSource  := SrcEmp;
    pcEmp.ActivePage := tabGrid;
  end;
end;

procedure TFrmEmployee.TblEmpBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmEmployee.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmEmployee.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmEmployee.PrintSetup1Click(Sender: TObject);
begin
  //PrinterSetupDialog1.Execute;
end;

procedure TFrmEmployee.sbtnSearchClick(Sender: TObject);
begin
  with pkEmp do
    if Execute then
      tblEmp.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmEmployee.New1Click(Sender: TObject);
begin
  TblEmp.Insert;
end;

procedure TFrmEmployee.Delete1Click(Sender: TObject);
begin
  TblEmp.Delete;
end;

procedure TFrmEmployee.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
