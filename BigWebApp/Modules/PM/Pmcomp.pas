unit Pmcomp;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPMComponents = class(TUniForm)
    Panel2: TUniPanel;
    Grid: TIQUniGridControl;
    SrcPMComponents: TDataSource;
    TblPMComponents: TFDTable;
    TblPMComponentsID: TBCDField;
    TblPMComponentsPMEQMT_ID: TBCDField;
    TblPMComponentsQTY: TBCDField;
    TblPMComponentsNOTES: TStringField;
    TblPMComponentsDESCRIP: TStringField;
    PopupMenu1: TUniPopupMenu;
    Help1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblPMComponentsNewRecord(DataSet: TDataSet);
    procedure TblPMComponentsBeforePost(DataSet: TDataSet);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPMEQMT_ID: Int64;
    procedure SetPMEQMT_ID(const Value: Real);
  public
    { Public declarations }
    property PMEQMT_ID: Real write SetPMEQMT_ID;
  end;

procedure DoPMComponents( APMEQMT_ID: Real);



implementation

{$R *.DFM}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm;

procedure DoPMComponents( APMEQMT_ID: Real);
var
  FrmPMComponents: TFrmPMComponents;
begin
  FrmPMComponents := TFrmPMComponents.Create(uniGUIApplication.uniApplication );
  FrmPMComponents.PMEQMT_ID := APMEQMT_ID;
  FrmPMComponents.Show;
end;

procedure TFrmPMComponents.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmPMComponents.UniFormCreate(Sender: TObject);
begin
  TblPMComponents.Filter := IQFormat('PMEQMT_ID=%d', [FPMEQMT_ID]);
  TblPMComponents.Filtered := TRUE;
  TblPMComponents.Open;
end;

procedure TFrmPMComponents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TblPMComponents.CheckBrowseMode;
  IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmPMComponents.TblPMComponentsNewRecord(DataSet: TDataSet);
begin
  TblPMComponentsID.AsLargeInt := GetNextID('PM_COMPONENTS');
  TblPMComponentsPMEQMT_ID.AsLargeInt := FPMEQMT_ID;
end;

procedure TFrmPMComponents.TblPMComponentsBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  TblPMComponentsPMEQMT_ID.AsLargeInt := FPMEQMT_ID;
end;

procedure TFrmPMComponents.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmPMComponents.SetPMEQMT_ID(const Value: Real);
begin
  FPMEQMT_ID := Trunc(Value);
end;

end.
