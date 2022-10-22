unit OEAutoMark;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmAutoMarShippedOrds = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    CheckBox1: TUniCheckBox;
    Label1: TUniLabel;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:boolean;
  public
    { Public declarations }
  end;

  function GetOEAutoMark( var ADate:TDateTime; var AChecked:boolean ):boolean;

implementation
uses
  IQMS.Common.RegFrm;
{$R *.dfm}

function GetOEAutoMark( var ADate:TDateTime; var AChecked:boolean):boolean;
var
  form : TFrmAutoMarShippedOrds;
  AType:Integer;
begin
  form := TFrmAutoMarShippedOrds.Create(uniGUIApplication.UniApplication);
  form.FResult := false;
  AType := 0;

  if IQRegIntegerScalarRead( form, 'OE_EXCL_ORDS_SHIPPERD_AFTER', AType ) then
  begin
    if AType = 0 then
      form.CheckBox1.Checked := False
    else
      form.CheckBox1.Checked := True;
  end
  else
  begin
    form.CheckBox1.Checked := False;
    IQRegIntegerScalarWrite( form, 'OE_EXCL_ORDS_SHIPPERD_AFTER', 0);
  end;

  form.wwDBDateTimePicker1.DateTime := Date;
  form.wwDBDateTimePicker1.Enabled := form.CheckBox1.Checked;
  form.ShowModal;

  Result  := form.FResult;
  AChecked:= form.CheckBox1.Checked;
  ADate   := form.wwDBDateTimePicker1.DateTime;

end;


procedure TFrmAutoMarShippedOrds.BtnOkClick(Sender: TObject);
begin
  if CheckBox1.Checked then
    IQRegIntegerScalarWrite( self, 'OE_EXCL_ORDS_SHIPPERD_AFTER', 1)
  else
    IQRegIntegerScalarWrite( self, 'OE_EXCL_ORDS_SHIPPERD_AFTER', 0);

  FResult := true;
  Close;
end;

procedure TFrmAutoMarShippedOrds.BtnCancelClick(Sender: TObject);
begin
  FResult := false;
  Close;
end;

procedure TFrmAutoMarShippedOrds.CheckBox1Click(Sender: TObject);
begin
  wwDBDateTimePicker1.Enabled := CheckBox1.Checked;
end;

procedure TFrmAutoMarShippedOrds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmAutoMarShippedOrds.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

end.
