unit translog_master_label;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmTranslogMasterLabel = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    SrcTransLogMasterLabel: TDataSource;
    QryTransLogMasterLabel: TFDQuery;
    QryTransLogMasterLabelID: TBCDField;
    QryTransLogMasterLabelTRANSLOG_ID: TBCDField;
    QryTransLogMasterLabelMASTER_LABEL_ID: TBCDField;
    QryTransLogMasterLabelSERIAL: TStringField;
    sbtnLockSerialNumbersView: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnLockSerialNumbersViewClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMasterDataSource: TDataSource;
    procedure SetMasterDataSource(AMasterDataSource: TDataSource);
  public
    { Public declarations }
    Property MasterDataSource: TDataSource read FMasterDataSource
      write SetMasterDataSource;
  end;

procedure DoShow(AMasterDataSource: TDataSource);

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmTranslogMasterLabel }

procedure DoShow(AMasterDataSource: TDataSource);
var
  FrmTranslogMasterLabel: TFrmTranslogMasterLabel;
begin
  FrmTranslogMasterLabel := TFrmTranslogMasterLabel.Create(uniGUIApplication.UniApplication);
  FrmTranslogMasterLabel.MasterDataSource := AMasterDataSource;
  FrmTranslogMasterLabel.Show;
end;

procedure TFrmTranslogMasterLabel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmTranslogMasterLabel.sbtnLockSerialNumbersViewClick(Sender: TObject);
begin
  QryTransLogMasterLabel.Close;
  try
    if not sbtnLockSerialNumbersView.Down then
    begin
      QryTransLogMasterLabel.ParamByName('ID').Bound := FALSE;
      QryTransLogMasterLabel.DataSource := FMasterDataSource;
    end
    else
    begin
      QryTransLogMasterLabel.ParamByName('ID').Value :=
        QryTransLogMasterLabel.DataSource.DataSet.FieldByName('ID').asFloat;
      QryTransLogMasterLabel.DataSource := nil;
    end;
  finally
    Reopen(QryTransLogMasterLabel);
  end;
end;

procedure TFrmTranslogMasterLabel.SetMasterDataSource(AMasterDataSource : TDataSource);
begin
  FMasterDataSource := AMasterDataSource;
  QryTransLogMasterLabel.DataSource := AMasterDataSource;
end;

procedure TFrmTranslogMasterLabel.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);
end;

end.
