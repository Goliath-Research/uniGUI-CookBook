unit IQMS.WebVcl.RepDefLog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  dateutils,
//  Vcl.Wwdatsrc,
//  Vcl.wwDataInspector,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.DApt.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmRepDefLog = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    SrcMain: TDataSource;
    QryMain: TFDQuery;
    QryMainREPNAME: TStringField;
    QryMainEXEC_COUNT: TFMTBCDField;
    QryMainLAST_EXEC_DATE: TDateTimeField;
    pnlCriteria: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    QryMainLONGEST_EXE_TIME: TFMTBCDField;
    Splitter2: TUniSplitter;
    pnlDetail: TUniPanel;
    IQSearchDetail: TIQUniGridControl;
    Panel5: TUniPanel;
    Label2: TUniLabel;
    Panel6: TUniPanel;
    Label3: TUniLabel;
    pnlMain: TUniPanel;
    IQSearchMain: TIQUniGridControl;
    SrcDetails: TDataSource;
    QryDetails: TFDQuery;
    QryDetailsID: TBCDField;
    QryDetailsUSER_NAME: TStringField;
    QryDetailsTIMESTAMP: TDateTimeField;
    QryDetailsEXEC_TIME: TFMTBCDField;
    QryDetailsDESTINATION: TStringField;
    PnlClient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    DateTimePickerFrom: TUniDateTimePicker;
    DateTimePickerTo: TUniDateTimePicker;
    Panel16: TUniPanel;
    Panel17: TUniPanel;
    Label6: TUniLabel;
    Panel4: TUniPanel;
    PnlSelectedToolbuttons: TUniPanel;
    sbtnApply: TUniSpeedButton;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMainBeforeOpen(DataSet: TDataSet);
    procedure sbtnApplyClick(Sender: TObject);
    procedure QryMainBeforeScroll(DataSet: TDataSet);
    procedure QryMainAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FInitialReportName: string;
    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
    procedure InitVars;
  public
    { Public declarations }
    class procedure DoShow(AReportName: string);
    property InitialReportName :string read FInitialReportName write FInitialReportName;
  end;

var
  FrmRepDefLog: TFrmRepDefLog;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

class procedure TFrmRepDefLog.DoShow(AReportName: string);
begin
  with self.Create(uniGUIApplication.uniapplication) do
   begin
     InitialReportName:=AReportName;
   end;
end;
procedure TFrmRepDefLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlCriteria, pnlMain, PnlLeft01]);
end;

procedure TFrmRepDefLog.InitVars;
begin
  DateTimePickerFrom.DateTime := Date - 30;
  DateTimePickerTo.DateTime := (Date + 1 - 1 / 86400) + 86399 / 86400;
end;

procedure TFrmRepDefLog.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRepDefLog.About1Click(Sender: TObject);
begin
//  IQAbout1.Execute;
end;

procedure TFrmRepDefLog.QryMainBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'from_date', TimeOf(DateTimePickerFrom.DateTime));
  AssignQueryParamValue(DataSet, 'to_date', TimeOf(DateTimePickerTo.DateTime));
end;

procedure TFrmRepDefLog.sbtnApplyClick(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  hMsg := hPleaseWait('');
  try
    Reopen(QryMain);
    Reopen(QryDetails);
  finally
    hMsg.Free;
  end;
end;

procedure TFrmRepDefLog.UniFormCreate(Sender: TObject);
begin
  InitVars;
  IQRegFormRead(self, [self, pnlCriteria, pnlMain, PnlLeft01]);
end;

procedure TFrmRepDefLog.IQAfterShowMessage(var Msg: TMessage);
begin
  sbtnApply.Click;
  QryMain.Locate('REPNAME', FInitialReportName, [])
end;

procedure TFrmRepDefLog.QryMainBeforeScroll(DataSet: TDataSet);
begin
//  IQSearchDetail.StoreWWFilter;
//  IQSearchDetail.ClearWWFilter;
//  IQSearchDetail.wwFilterDialog.ApplyFilter;
end;

procedure TFrmRepDefLog.QryMainAfterScroll(DataSet: TDataSet);
begin
  if DataSet.Active and IQSearchDetail.DataSource.DataSet.Active then
  begin
//    IQSearchDetail.RestoreWWFilter;
//    IQSearchDetail.wwFilterDialog.ApplyFilter;
  end;
end;

end.
