unit OSSrvcCreds;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Mask,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.CaptionPanel,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniPanel, Vcl.Controls;

type
  TFrmOSSrvcCreds = class(TUniForm)
    edUsername: TUniDBEdit;
    edPassword: TUniDBEdit;
    edDomainName: TUniDBEdit;
    lblUsername: TUniLabel;
    lblPassword: TUniLabel;
    lblDomainName: TUniLabel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    tblIQSys2: TFDTable;
    srcIQSys2: TDataSource;
    CaptionPanel1: TIQWebCaptionPanel;
    tblIQSys2SRVC_DOMAIN: TStringField;
    tblIQSys2SRVC_USERNAME: TStringField;
    tblIQSys2SRVC_PASSWORD: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoOSServiceCredentials;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;


class procedure TFrmOSSrvcCreds.DoOSServiceCredentials;
begin
  with TFrmOSSrvcCreds.Create(UniGuiApplication.UniApplication) do
    ShowModal;
end;


procedure TFrmOSSrvcCreds.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;


procedure TFrmOSSrvcCreds.btnOKClick(Sender: TObject);
begin
  if tblIQSys2.State in [ dsEdit ] then
    tblIQSys2.Post;
end;

end.
