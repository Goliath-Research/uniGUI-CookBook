unit crmword_sqlprv;

interface

uses
  Data.DB,
  MainModule,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.Classes,
  System.SysUtils,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.Forms,
  Winapi.Windows,
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
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmCRMWordSQLPreview = class(TUniForm)
    PnlCarrier: TUniPanel;
    PnlToolbar: TUniPanel;
    Panel2: TUniPanel;
    NavMain: TUniDBNavigator;
    Grid: TIQUniGridControl;
    sbtnCount: TUniSpeedButton;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCountClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(  ADataSource: TDataSource );
  end;

  procedure PreviewResultSet( ADataSource: TDataSource );


implementation

{$R *.DFM}

uses
  crm_rscstr,
  IQMS.DBTrans.dbtshare,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.RecordCount,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

procedure PreviewResultSet(ADataSource: TDataSource );
begin
  with TFrmCRMWordSQLPreview.Create( ADataSource ) do
   try
      ShowModal;
   finally
      Free;
   end;
end;

{ TFrmCRMWordSQLPreview }

constructor TFrmCRMWordSQLPreview.Create(ADataSource: TDataSource);
begin
  inherited Create( uniGUIApplication.UniApplication );
  NavMain.DataSource := ADataSource;
  Grid.DataSource    := ADataSource;
  if not ADataSource.DataSet.Active then
     ADataSource.DataSet.Open;
end;

procedure TFrmCRMWordSQLPreview.FormShow(Sender: TObject);
begin
  IQRegFormRead( Self, [ Self ] );
end;

procedure TFrmCRMWordSQLPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self ] ); // iqregfrm
end;


procedure TFrmCRMWordSQLPreview.sbtnCountClick(Sender: TObject);
var
   ACount: Integer;
begin
  ACount := IQMS.DBTrans.dbtshare.GetRecordCount(Grid.DataSource.DataSet);
  IQInformation( Format( crm_rscstr.cTXT0001023 {'Record Count: %d'}, [ACount] ));
end;

end.
