unit DPPfilt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
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
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniCheckBox, uniComboBox, uniDBComboBox;

type
  TFrmDppFilter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    QryArCusto: TFDQuery;
    Panel3: TUniPanel;
    GroupBox1: TUniGroupBox;
    cbCust: TUniCheckBox;
    cbWO: TUniCheckBox;
    wwCustomer: TUniDBLookupComboBox;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure cbCustClick(Sender: TObject);
    procedure cbWOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoDppFilter:Boolean;


implementation
uses
  IQMS.Data.Lib,
  IQMS.Common.RegFrm,
  Day_Proj;
{$R *.DFM}

function DoDppFilter:Boolean;
var
  FrmDppFilter: TFrmDppFilter;
begin
  FrmDppFilter:=TFrmDppFilter.Create(uniGUIApplication.UniApplication);
  with FrmDppFilter do
  begin
    Result := ShowModal = mrOk;
  end;
end;

procedure TFrmDppFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmDppFilter.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  IQSetTablesActive(TRUE, self);
//  wwCustomer.SearchField := 'COMPANY';
  cbCust.Checked     := (TFrmDPartsProj(Owner).FArCustoId <> 0);
  cbWO.Checked       := TFrmDPartsProj(Owner).FWOFilterON;
  wwCustomer.Enabled := (TFrmDPartsProj(Owner).FArCustoId <> 0);
  if TFrmDPartsProj(Owner).FArCustoID <> 0 then
  begin
    QryArCusto.Locate('ID', TFrmDPartsProj(Owner).FArCustoId , []);
    wwCustomer.Text := QryArCusto.FieldByName('COMPANY').asString;
  end;
  cbWOClick(NIL);
end;

procedure TFrmDppFilter.BtnOkClick(Sender: TObject);
begin
  TFrmDPartsProj(Owner).FWOFilterON := cbWO.Checked;
  if cbCust.Checked then
    TFrmDPartsProj(Owner).FArCustoId := QryArCusto.FieldByName('ID').asFloat
  else TFrmDPartsProj(Owner).FArCustoId := 0;
  ModalResult := mrOk;
end;

procedure TFrmDppFilter.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDppFilter.cbCustClick(Sender: TObject);
begin
  with wwCustomer do
  begin
    Enabled:= cbCust.Checked;
    if Enabled then Color:= clWindow else Color:= clBtnFace;
  end
end;

procedure TFrmDppFilter.cbWOClick(Sender: TObject);
begin
  cbCust.Enabled:= cbWO.Checked;
  if not cbWO.Checked then
     cbCust.Checked:= FALSE;
  cbCustClick(NIL);
end;

end.
