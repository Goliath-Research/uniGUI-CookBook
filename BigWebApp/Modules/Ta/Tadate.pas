unit Tadate;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ComCtrls,
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDateTimePicker,
  uniButton;

type
  TFrmGetProddate = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    Panel1: TUniPanel;
    Label2: TUniLabel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    dtDate: TUniDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTimeCarddate(var ADate:TDateTime):Boolean;

implementation

uses
 MainModule,
  IQMS.Common.Regfrm;

{$R *.DFM}

function GetTimeCarddate(var ADate:TDateTime):Boolean;
var
  aFrmGetProddate : TFrmGetProddate;
begin
  aFrmGetProddate := UniMainModule.GetFormInstance(TFrmGetProddate) as TFrmGetProddate;
  with aFrmGetProddate do
  begin
    dtDate.DateTime := Date;
    ShowModal;
    Result := ModalResult = mrOK;
    ADate := dtDate.DateTime;
  end
end;

procedure TFrmGetProddate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLeft01]);
end;

procedure TFrmGetProddate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, PnlLeft01]);
end;

end.
