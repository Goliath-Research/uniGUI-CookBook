unit ict_params;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmICT_Params = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    dbchkAlwaysCheckNewDemand: TUniDBCheckBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SrcParams: TDataSource;
    QryParams: TFDQuery;
    QryParamsSCHED_FORCE_ICT_PROCESSING: TStringField;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmICT_Params }
class procedure TFrmICT_Params.DoShowModal;
begin
  with TFrmICT_Params.Create( UniGUIApplication.UniApplication) do
    ShowModal;
end;

procedure TFrmICT_Params.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmICT_Params.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmICT_Params.btnOKClick(Sender: TObject);
begin
  QryParams.CheckBrowseMode;
  ModalResult:= mrOK;
end;


end.
