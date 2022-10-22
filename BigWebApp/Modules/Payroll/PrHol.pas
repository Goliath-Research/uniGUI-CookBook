unit PrHol;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  wwdblook,
  Mask,
  Vcl.wwdbedit,
  Wwdbspin,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDateTimePicker,
  uniButton, uniComboBox, uniDBComboBox, uniEdit, uniDBEdit;

type
  TFrmPrHoliday = class(TUniForm)
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    dtProddate: TUniDateTimePicker;
    DbHolHours: TUniDBNumberEdit;
    dbHolPayType: TUniDBLookupComboBox;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    QryPayType: TFDQuery;
    QryPayTypeDESCRIPTION: TStringField;
    QryPayTypeID: TBCDField;
    DataSource1: TDataSource;
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTimeCardHoliday(var ADate:TDateTime; var APay_Type_id:Real; var AHrs:Real):Boolean;


implementation
uses
  IQMS.Common.RegFrm;
{$R *.DFM}


function GetTimeCardHoliday(var ADate:TDateTime; var APay_Type_id:Real; var AHrs:Real):Boolean;
var
  FrmPrHoliday : TFrmPrHoliday;
begin
  FrmPrHoliday := TFrmPrHoliday.Create(UniApplication);
  with FrmPrHoliday do
  begin
    QryPayType.Open;
    dtProddate.DateTime := Date;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ADate        := Trunc(dtProddate.DateTime);
      AHrs         := DbHolHours.Value;
      APay_Type_id := dbHolPayType.DataSource.DataSet.FieldByName(dbHolPayType.DataField).AsFloat;
    end;
  end;
end;

procedure TFrmPrHoliday.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmPrHoliday.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmPrHoliday.BtnOkClick(Sender: TObject);
begin
  if dtProddate.DateTime = 0 then
    raise Exception.Create('Please assign production date');
  if DbHolHours.Value = 0 then
    raise Exception.Create('Please assign holiday hours');
  if dbHolPayType.Text = '' then
    raise Exception.Create('Please assign holiday paytype');
  ModalResult := mrOk;
end;

end.
