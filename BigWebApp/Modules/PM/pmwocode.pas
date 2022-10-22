unit pmwocode;

interface

uses
  Winapi.Windows,
  System.SysUtils,
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
  TFrmPMCode = class(TUniForm)
    Panel2: TUniPanel;
    Grid: TIQUniGridControl;
    SrcCode: TDataSource;
    TblCode: TFDTable;
    TblCodeID: TBCDField;
    TblCodeNAME: TStringField;
    TblCodeDESCRIP: TStringField;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblCodeBeforePost(DataSet: TDataSet);
    procedure Help1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoPMCode;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoPMCode;
var
  LFrmPMCode : TFrmPMCode;
begin
  LFrmPMCode := TFrmPMCode.Create(UniGUIApplication.UniApplication);
  LFrmPMCode.Show;
end;

procedure TFrmPMCode.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmPMCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmPMCode.TblCodeBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmPMCode.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

end.
