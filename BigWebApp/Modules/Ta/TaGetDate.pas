unit TaGetDate;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  wwmonthcalendar,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniCalendar;

type
  TFrmSelProdDate = class(TUniForm)
    Panel1: TUniPanel;
    btnLast: TUniButton;
    btnProd: TUniButton;
    btnCancel: TUniButton;
    wwDate: TUniCalendar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnProdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:integer;
  public
    { Public declarations }
  end;

function GetCalcDate(var ADate:TDateTime):integer;


implementation
uses
 MainModule,
  IQMS.Common.RegFrm;

{$R *.dfm}

function GetCalcDate( var ADate:TDateTime):integer;
var
  FrmSelProdDate : TFrmSelProdDate;
begin
  FrmSelProdDate := TFrmSelProdDate.Create(UniApplication);
  with FrmSelProdDate do
  begin
    FResult := 0;
    wwDate.Date := ADate;
    ShowModal;
    Result := FResult;
    ADate := wwDate.Date;
  end;
end;

procedure TFrmSelProdDate.btnCancelClick(Sender: TObject);
begin
  FResult := 0;
  Close;
end;

procedure TFrmSelProdDate.btnLastClick(Sender: TObject);
begin
  FResult := 1;
  Close;
end;

procedure TFrmSelProdDate.btnProdClick(Sender: TObject);
begin
  FResult := 2;
  Close;
end;

procedure TFrmSelProdDate.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmSelProdDate.UniFormCreate(Sender: TObject);
begin
    IQRegFormRead( self, [self]);
end;

end.
