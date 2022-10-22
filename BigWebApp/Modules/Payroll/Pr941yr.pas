unit Pr941yr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniComboBox, uniDBComboBox, uniEdit, uniDBEdit;

type
  TFrm941year = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    BtnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbYear: TUniDBNumberEdit;
    dbQtr: TUniDBNumberEdit;
    dbFed: TUniDBLookupComboBox;
    QryEin: TFDQuery;
    QryEinID: TBCDField;
    QryEinDESCRIP: TStringField;
    SrcEin: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetUseFed(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    FYear, FQuarter:Integer;
    FEinId:Real;
    property UseFed : Boolean write SetUseFed;
  end;

function Get941Year(AUseFed:Boolean; var AYear:Integer; var AQuarter:Integer;var AEin_Id:Real):Boolean;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.DFM}

function Get941Year(AUseFed:Boolean; var AYear:Integer; var AQuarter:Integer;var AEin_Id:Real):Boolean;
var
  LFrm941year : TFrm941year;
begin
  LFrm941year := TFrm941year.Create(UniGUIApplication.UniApplication);
  with LFrm941year do
  begin
    UseFed := AUseFed;
    dbYear.Value := Trunc(SelectValueAsFloat('select to_number(to_char(trunc(sysdate, ''YEAR''), ''YYYY'')) from dual'));
    dbQtr.Value  := Trunc(SelectValueAsFloat('select IQMisc.RoundUp( to_char( trunc( sysdate, ''Q''),''MM'') / 3 ) from dual'));
    ShowModal;
    Result := ModalResult = mrOk;
    AYear    := FYear;
    AQuarter := FQuarter;
    AEin_Id   := FEinId;
  end;
end;

procedure TFrm941year.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrm941year.SetUseFed(const Value: Boolean);
begin
    Label3.Visible := Value;
    dbFed.Visible  := Value;
    QryEin.Active  := Value;
end;

procedure TFrm941year.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrm941year.btnOkClick(Sender: TObject);
begin
  if Trim(dbYear.Text) = '' then
    raise exception.create('Year must be filled');
  if Trim(dbQtr.Text) = '' then
    raise exception.create('Quarter must be filled');
  FYear    := Trunc(dbYear.Value);
  FQuarter := Trunc(dbQtr.Value);
  if QryEin.Active then
    FEinId   := QryEinID.AsFloat;
  ModalResult := mrOk;

end;

end.
