unit PRDDRang;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
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
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniComboBox,
  uniDBComboBox;

type
  TFrmDDDateRange = class(TUniForm)
    QryDate1: TFDQuery;
    QryDate2: TFDQuery;
    QryDate1CHECK_DATE: TDateTimeField;
    QryDate2CHECK_DATE: TDateTimeField;
    dbFromDate: TUniDBLookupComboBox;
    dbToDate: TUniDBLookupComboBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    ds_Date1: TDataSource;
    ds_Date2: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFromDate : TDateTime;
    FToDate   : TDateTime;

  public
    { Public declarations }
    property FromDate : TDateTime read FFromDate;
    property ToDate   : TDateTime read FToDate;
  end;

function DoSelectDDRange(var AFromDate, AToDate: TDateTime): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function DoSelectDDRange(var AFromDate, AToDate: TDateTime): Boolean;
var
  frm : TFrmDDDateRange;
begin
  frm := TFrmDDDateRange.Create(uniGUIApplication.UniApplication);

  Result := frm.ShowModal = mrOK;
  if Result then
  begin
     AFromDate := frm.FromDate;
     AToDate   := frm.ToDate;
  end;
end;

procedure TFrmDDDateRange.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(True, self);
end;

procedure TFrmDDDateRange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmDDDateRange.BtnOkClick(Sender: TObject);
begin
  if (Trim(dbFromDate.Text) = '') or (Trim(dbToDate.Text) = '') then
    raise Exception.Create('Both dates should be filled');

  FFromDate := StrToDate(dbFromDate.Text);
  FToDate   := StrToDate(dbToDate.Text);
  if FFromDate > FToDate then
    raise Exception.Create('''From Date'' must not be greater than the ''To Date''');

  ModalResult := mrOk;
end;

end.
