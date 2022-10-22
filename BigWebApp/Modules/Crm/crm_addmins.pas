unit crm_addmins;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniBitBtn, uniSpinEdit, Vcl.Menus, uniMainMenu;

type
  TFrmCRMAddTime = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    edtMinutes: TUniSpinEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }

    function ValidateSelection: Boolean;
    function  GetMinutes : integer;
    procedure SetMinutes (aValue : integer);
  public
    { Public declarations }

    property Minutes : integer read GetMinutes write SetMinutes;
  end;

function DoCRMAddMinutes(var AValue: Integer): Boolean;

implementation

{$R *.DFM}

uses
 MainModule,
  crm_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

function DoCRMAddMinutes(var AValue: Integer): Boolean;
var
  FrmCRMAddTime : TFrmCRMAddTime;
begin
  FrmCRMAddTime := TFrmCRMAddTime.Create(uniGUIApplication.UniApplication);
   with FrmCRMAddTime do
   begin
    Minutes := AValue;
    Result := ShowModal = mrOk;
    if Result then
      AValue := Minutes;
   end;
end;

{ TFrmCRMAddTime }

procedure TFrmCRMAddTime.UniFormCreate(Sender: TObject);
begin
   IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMAddTime.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

function TFrmCRMAddTime.GetMinutes: integer;
begin
  Result := edtMinutes.Value;
end;

procedure TFrmCRMAddTime.SetMinutes(aValue: integer);
begin
  edtMinutes.Value := aValue;
end;

function TFrmCRMAddTime.ValidateSelection: Boolean;
begin
  if Trim(edtMinutes.Text) = '' then
  begin
    // crm_rscstr.cTXT0000260 = 'Please enter a valid number, from 0 to 3000'
    IQError(crm_rscstr.cTXT0000260);
    Result := false;
  end
  else
    Result := true;
end;

procedure TFrmCRMAddTime.btnOKClick(Sender: TObject);
begin
  if ValidateSelection then
    ModalResult := mrOk;
end;

end.
