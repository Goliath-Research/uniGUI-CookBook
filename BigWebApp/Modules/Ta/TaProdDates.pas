unit TaProdDates;

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
  TFrmProddates = class(TUniForm)
    wwDBMonthCalendar2: TwwDBMonthCalendar;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    wwFrom: TUniCalendar;
    wwTo: TUniCalendar;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    FResult:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

function GetProdDates(var AFrom:TDateTime; var ATo:TDateTime):boolean;


implementation
uses
  MainModule,
  IQMS.Common.RegFrm;
{$R *.dfm}

function GetProdDates(var AFrom:TDateTime; var ATo:TDateTime):boolean;
var
  FrmProddates : TFrmProddates;
begin
  FrmProddates := TFrmProddates.Create(UniApplication);
  with FrmProddates do
  begin
    FResult := false;
    wwFrom.Date := AFrom;
    wwTo.Date   := ATo;
    ShowModal;
    Result := FResult;
    AFrom := wwFrom.Date;
    ATo   := wwTo.Date;
  end;
end;
procedure TFrmProddates.BtnCancelClick(Sender: TObject);
begin
  FResult := false;
  Close;
end;

procedure TFrmProddates.BtnOkClick(Sender: TObject);
begin
  FResult := true;
  Close;
end;

procedure TFrmProddates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmProddates.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

end.
