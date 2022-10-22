unit IQMS.Common.DatesDlg2;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
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
  uniLabel, uniRadioGroup;

type
  TFrmDatesDialog2 = class(TUniForm)
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    PnlDates: TUniPanel;
    gbDates: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    dtpFromDate: TUniDateTimePicker;
    dtpToDate: TUniDateTimePicker;
    PnlOption: TUniPanel;
    rgOption: TUniRadioGroup;
    procedure btnOKClick(Sender: TObject);
    procedure rgOptionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    //constructor Create( AOwner:Tcomponent; AShowAll: Boolean; AFrom, ATo: TDateTime );

    class function GetDatesDialog2( var AShowAll: Boolean; var AFrom, ATo: TDateTime ): Boolean;

  end;

var
  FrmDatesDialog2: TFrmDatesDialog2;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dates,
  IQMS.Common.ResStrings;

class function TFrmDatesDialog2.GetDatesDialog2( var AShowAll: Boolean; var AFrom, ATo: TDateTime ): Boolean;
var
  frm : TFrmDatesDialog2;
begin

  frm := TFrmDatesDialog2.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    if AFrom <> 0 then
       dtpFromDate.DateTime:= AFrom
    else
       dtpFromDate.DateTime:= IQOracleAdjustedDate;
    {To Date}
    if ATo <> 0 then
       dtpToDate.DateTime:= ATo
    else
       dtpToDate.DateTime:= dtpFromDate.DateTime;
    {Group Option}
    if AShowAll = TRUE then
       rgOption.ItemIndex := 0
    else
       rgOption.ItemIndex := 1;
  end;

  Result := frm.ShowModal = mrOk;

  if Result then
  begin
    AShowAll := (frm.rgOption.ItemIndex = 0);
    AFrom    := Trunc(frm.dtpFromDate.DateTime);
    ATo      := Trunc(frm.dtpToDate.DateTime);
  end;

end;

procedure TFrmDatesDialog2.FormCreate(Sender: TObject);
begin
     ///IQRegFormRead( Self, [ Self ] );
end;

procedure TFrmDatesDialog2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //  IQRegFormWrite( Self, [ Self ] );
end;

procedure TFrmDatesDialog2.FormShow(Sender: TObject);
begin
     rgOptionClick( NIL );
end;

procedure TFrmDatesDialog2.btnOKClick(Sender: TObject);
begin
  if dtpFromDate.DateTime > dtpToDate.DateTime then
     raise Exception.Create(  IQMS.Common.ResStrings.cTXT0000030 { 'The "From Date" is greater than the "To Date."  Please select different values.' } );
  ModalResult:= mrOK;
end;

procedure TFrmDatesDialog2.rgOptionClick(Sender: TObject);
begin
     Application.ProcessMessages;
     case rgOption.ItemIndex of
          0 :
            begin
                 dtpFromDate.Enabled := FALSE;
                 dtpToDate.Enabled   := FALSE;
                 dtpFromDate.Color   := clBtnFace;
                 dtpToDate.Color     := clBtnFace;
            end;
          1 :
            begin
                 dtpFromDate.Enabled := TRUE;
                 dtpToDate.Enabled   := TRUE;
                 dtpFromDate.Color   := clWindow;
                 dtpToDate.Color     := clWindow;
            end;
     end;
end;

end.
