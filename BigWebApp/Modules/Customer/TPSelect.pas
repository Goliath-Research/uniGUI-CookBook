unit TPSelect;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmTPSelect = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniBitBtn;
    BtnSelect: TUniBitBtn;
    CheckBox1: TUniCheckBox;
    SrcTP: TDataSource;
    QryTP: TFDQuery;
    QryTPID: TBCDField;
    QryTPARCUSTO_ID: TBCDField;
    QryTPTP_INTERCHANGE_CODE: TStringField;
    QryTPOUR_INTERCHANGE_CODE: TStringField;
    QryTPCUSTNO: TStringField;
    QryTPCOMPANY: TStringField;
    procedure CheckBox1Click(Sender: TObject);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FId:Real;
    FArcustoId:Real;
    procedure ResetQuery;
  public
    { Public declarations }
  end;

function GetTradingPartner(ArcustoId:Real):Real;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{$R *.dfm}

function GetTradingPartner(ArcustoId:Real):Real;
var
  frm: TFrmTPSelect;
begin
  frm := TFrmTPSelect.Create(uniGUIApplication.UniApplication);
  frm.FArcustoId := ArcustoId;
  frm.ShowModal;
  Result := frm.FId;
end;

procedure TFrmTPSelect.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmTPSelect.UniFormShow(Sender: TObject);
var
  AType:Integer;
begin
  AType := 0;

  if IQRegIntegerScalarRead( self, 'TP_CURR_CUST_ONLY', AType ) then
  begin
    if AType = 0 then
      CheckBox1.Checked := False
    else
      CheckBox1.Checked := True;
  end
  else
  begin
    CheckBox1.Checked := False;
    IQRegIntegerScalarWrite( self, 'TP_CURR_CUST_ONLY', 0);
  end;
  ResetQuery;
end;

procedure TFrmTPSelect.ResetQuery;
begin
  QryTP.Close;
  if CheckBox1.Checked then
  begin
    QryTP.ParamByName('aId').Value := FArcustoId;
    QryTP.ParamByName('aDummy').Value := 0;
  end
  else
  begin
    QryTP.ParamByName('aId').Value := 0;
    QryTP.ParamByName('aDummy').Value := 1;
  end;
  QryTP.Open;
end;

procedure TFrmTPSelect.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    IQRegIntegerScalarWrite( self, 'TP_CURR_CUST_ONLY', 1)
  else
    IQRegIntegerScalarWrite( self, 'TP_CURR_CUST_ONLY', 0);
   ResetQuery;

end;

procedure TFrmTPSelect.BtnSelectClick(Sender: TObject);
begin
  FId := QryTPID.asFloat;
  Close;
end;

procedure TFrmTPSelect.BtnCancelClick(Sender: TObject);
begin
  FId := 0;
  Close;
end;

procedure TFrmTPSelect.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

end.
