unit wc_optional_elem;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  Vcl.DBCtrls, //TNavigateBtn
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  Vcl.Controls;

type
  TFrmWorkCenterOptionalElements = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1WORK_CENTER_ID: TBCDField;
    wwQuery1ELEMENT_SIZE: TFMTBCDField;
    SR: TIQWebSecurityRegister;
    wwQuery1DESCRIP: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    UpdateSQL1: TFDUpdateSQL;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure wwQuery1NewRecord(DataSet: TDataSet);
    procedure wwQuery1BeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
  private
    { Private declarations }
    FWork_Center_ID: Real;
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    property Work_Center_ID: Real write SetWork_Center_ID;
    class procedure DoShowModal( AWork_Center_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns;

class procedure TFrmWorkCenterOptionalElements.DoShowModal(AWork_Center_ID: Real);
var
  frm : TFrmWorkCenterOptionalElements;
begin
  frm := TFrmWorkCenterOptionalElements.Create(uniGUIApplication.UniApplication);
  frm.Work_Center_ID := AWork_Center_ID;
  frm.ShowModal;
end;

procedure TFrmWorkCenterOptionalElements.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmWorkCenterOptionalElements.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmWorkCenterOptionalElements.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

procedure TFrmWorkCenterOptionalElements.SRAfterApply(Sender: TObject);
begin
//  IQMS.Common.Controls.AutoSizeNavBar(DBNavigator1);
end;

procedure TFrmWorkCenterOptionalElements.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'work_center_id', FWork_Center_ID);
end;

procedure TFrmWorkCenterOptionalElements.wwQuery1NewRecord(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('work_center_id').asFloat:= FWork_Center_ID;
end;

procedure TFrmWorkCenterOptionalElements.wwQuery1BeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'work_center_opt_element');
end;

procedure TFrmWorkCenterOptionalElements.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable( DataSet );
end;

procedure TFrmWorkCenterOptionalElements.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmWorkCenterOptionalElements.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWorkCenterOptionalElements.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmWorkCenterOptionalElements.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  // IQMS.Common.HelpHook.pas
end;

end.
