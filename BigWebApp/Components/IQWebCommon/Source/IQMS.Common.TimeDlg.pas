unit IQMS.Common.TimeDlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.DATESDLG,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniDateTimePicker,
  uniGUIApplication,
  uniButton,
  uniPanel,
  uniLabel,
  uniGroupBox,
  uniGuiForm;

type
  TFrmTimeDialog = class(TFrmDatesDialog)
    DateTimePicker1Time: TUniDateTimePicker;
    DateTimePicker2Time: TUniDateTimePicker;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function GetDateTimeDialog(var FFrom, FTo: TDateTime ): Boolean;
  end;


var
  FrmTimeDialog: TFrmTimeDialog;

implementation

{$R *.DFM}

uses
  IQMS.Common.ResStrings;

class function TFrmTimeDialog.GetDateTimeDialog(var FFrom, FTo: TDateTime ): Boolean;
 var frm : TFrmTimeDialog;
begin

  frm := TFrmTimeDialog.create(uniGUIApplication.UniApplication);
  begin
    if FFrom <> 0 then
       frm.DateTimePicker1Time.DateTime:= Frac(FFrom)
    else
       frm.DateTimePicker1.DateTime:= Now;
    if FTo <> 0 then
       frm.DateTimePicker2Time.DateTime:= Frac(FTo)
    else
       frm.DateTimePicker2.DateTime:= frm.DateTimePicker1.DateTime;
  end;

  Result := frm.ModalResult = mrOk;

  if Result then
  begin
     FFrom:= Trunc(frm.DateTimePicker1.DateTime) + Frac(frm.DateTimePicker1Time.DateTime);
     FTo  := Trunc(frm.DateTimePicker2.DateTime) + Frac(frm.DateTimePicker2Time.DateTime);
  end;

end;

procedure TFrmTimeDialog.btnOKClick(Sender: TObject);
begin
  if Trunc(DateTimePicker1.DateTime) + Frac(DateTimePicker1Time.DateTime) > Trunc(DateTimePicker2.DateTime) + Frac(DateTimePicker2Time.DateTime) then
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000029 {'Invalid scope.  Please reenter'});
  ModalResult:= mrOK;
end;

end.
