unit IQMS.Common.DATESDLG;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmDatesDialog = class(TUniForm)
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    Label2: TUniLabel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create( AOwner:Tcomponent; AFrom, ATo: TDateTime );
    class function GetDatesDialog( var FFrom, FTo: TDateTime ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.ResStrings;

class function TFrmDatesDialog.GetDatesDialog( var FFrom, FTo: TDateTime ): Boolean;
var
  frm : TFrmDatesDialog;
begin
  frm := TFrmDatesDialog.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    if FFrom <> 0 then
       DateTimePicker1.DateTime:= FFrom
    else
       DateTimePicker1.DateTime:= Date;

    if FTo <> 0 then
       DateTimePicker2.DateTime:= FTo
    else
       DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
  end;

  Result := frm.ShowModal = mrOK;
  if Result then
  begin
     FFrom:= Trunc(frm.DateTimePicker1.DateTime);
     FTo  := Trunc(frm.DateTimePicker2.DateTime);
   end;
end;


procedure TFrmDatesDialog.btnOKClick(Sender: TObject);
begin
  if DateTimePicker1.DateTime > DateTimePicker2.DateTime then
     raise Exception.Create( IQMS.Common.ResStrings.cTXT0000029 {'Invalid Scope.  Please reenter.'} );
  ModalResult:= mrOK;
end;

end.
