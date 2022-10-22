unit crm_drilldown_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Vcl.Wwdatsrc,
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
  Data.DB,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmCRMDrillDownBase = class(TUniForm)
    PnlGrid: TUniPanel;
    SrcInformation: TDataSource;
    QryInformation: TFDQuery;
    Grid: TIQUniGridControl;
    PnlToolbar: TUniPanel;
    Bevel1: TUniPanel;
    Nav: TUniDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FFormActive: Boolean;
  end;

var
  FrmCRMDrillDownBase: TFrmCRMDrillDownBase;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

procedure TFrmCRMDrillDownBase.FormCreate(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  FFormActive := FALSE;
  //CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
end;

procedure TFrmCRMDrillDownBase.FormShow(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  if not Empty(QryInformation.SQL.Text) then
    begin
      hMsg := hPleaseWait('');
      try
        QryInformation.Open;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;

 // IQRegFormRead(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
  FFormActive := TRUE;
end;

procedure TFrmCRMDrillDownBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FFormActive := FALSE;
 // IQRegFormWrite(Self, [Self, Grid]); // IQMS.Common.RegFrm.pas
end;

end.
