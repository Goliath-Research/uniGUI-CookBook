unit PRGLdate;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFRMPRGLDate = class(TUniForm)
    btnOk: TUniButton;
    btnCancel: TUniButton;
    DT: TUniDateTimePicker;
    Label1: TUniLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoGetGLPrepostDate(var ADate:TDateTime):Boolean;

implementation
uses
  IQMS.Common.DataLib;
{$R *.DFM}

function DoGetGLPrepostDate(var ADate:TDateTime):Boolean;
var
  frm : TFRMPRGLDate;
begin
  frm := TFRMPRGLDate.Create(uniGUIApplication.UniApplication);
  frm.DT.DateTime := Date;

  Result := frm.ShowModal = mrOk;

  if Result then
     ADate := frm.DT.DateTime;
end;

procedure TFRMPRGLDate.btnOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
  close;
end;

end.
