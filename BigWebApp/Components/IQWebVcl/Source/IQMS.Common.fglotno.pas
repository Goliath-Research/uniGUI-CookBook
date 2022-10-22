unit IQMS.Common.fglotno;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox;

type
  TFrmIQFGLotno = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcFinished: TDataSource;
    QryFinished: TFDQuery;
    QryFinishedLOTNO: TStringField;
    GroupBox1: TUniGroupBox;
    rbtnCurrent: TUniRadioButton;
    rbtnPast: TUniRadioButton;
    cmbLotno: TUniDBLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure DoRadioButtonClick(Sender: TObject);
    procedure QryFinishedBeforeOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFGLotno: string;
    //function GetCurrentLotno: String;
  public
    { Public declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(AArinvt_ID: Real);
    property Arinvt_ID: Real read FArinvt_ID write SetArinvt_ID;
  end;

function GetCurrentLotno(const AArinvtID: Real): string;
function IQGetFGLotNumber(AArinvt_ID: Real;var AFGLotno: string): Boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings;

function GetCurrentLotno(const AArinvtID: Real): string;
begin
  Result := SelectValueFmtAsString(
    'select s.fg_lotno from arinvt a, standard s ' +
    'where a.id = %.0f and s.id = a.standard_id ',
    [AArinvtID]);
  if Result = '' then
    Result := SelectValueAsString('select fg_lotno from params'); //iqlib
end;

function IQGetFGLotNumber(AArinvt_ID: Real;
  var AFGLotno: string): Boolean;
var
  FrmIQFGLotno: TFrmIQFGLotno;
begin
  FrmIQFGLotno:= TFrmIQFGLotno.Create(uniGUIApplication.UniApplication);
  with FrmIQFGLotno do
    begin
      Arinvt_ID:=AArinvt_ID;
      if ShowModal = mrOk then
      begin
        Result := TRUE;
        AFGLotno := FFGLotno;
      end
      else
        Result := FALSE;
    end;
end;

{ TFrmIQFGLotno }

procedure TFrmIQFGLotno.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]);
end;

procedure TFrmIQFGLotno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmIQFGLotno.btnOkClick(Sender: TObject);
begin
  if rbtnPast.Checked then
    if Trim(cmbLotno.Text) = '' then
      // IQMS.Common.ResStrings.cTXT0000492 = 'Please select a Lot number.';
      raise Exception.Create(IQMS.Common.ResStrings.cTXT0000492);
  ModalResult := mrOk;

  if rbtnCurrent.Checked then
    FFGLotno := GetCurrentLotno(FArinvt_ID)
  else
    FFGLotno := QryFinishedLOTNO.AsString;
end;

procedure TFrmIQFGLotno.DoRadioButtonClick(Sender: TObject);
begin
  IQEnableControl(cmbLotno, rbtnPast.Checked);
end;

procedure TFrmIQFGLotno.QryFinishedBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARINVT_ID', FArinvt_ID);
end;

procedure TFrmIQFGLotno.SetArinvt_ID(AArinvt_ID: Real);
var
  S: string;
begin
  FArinvt_ID := AArinvt_ID;
  S := GetCurrentLotno(AArinvt_ID);
  if S > '' then
    rbtnCurrent.Caption := Format('%s (%s)', [rbtnCurrent.Caption, S]);
  QryFinished.Close;
  QryFinished.Open;
  DoRadioButtonClick(nil);
end;

procedure TFrmIQFGLotno.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    btnOkClick(nil);
  end;

end;

end.
