unit oe_cancel_drop_ship_dlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmCancelDropShipDlg = class(TUniForm)
    rbtnDeletePO: TUniRadioButton;
    Panel1: TUniPanel;
    rbtnCancelDropShip: TUniRadioButton;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Validate;
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Integer;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
  IQSecIns;  }


class function TFrmCancelDropShipDlg.DoShowModal: Integer;
var
  LFrmCancelDropShipDlg : TFrmCancelDropShipDlg;
begin
  LFrmCancelDropShipDlg := TFrmCancelDropShipDlg.Create(UniGUIApplication.UniApplication);
  if LFrmCancelDropShipDlg.ShowModal <> mrOk then
     Result:= 0

  else if LFrmCancelDropShipDlg.rbtnDeletePO.Checked then
     Result:= 1

  else if LFrmCancelDropShipDlg.rbtnCancelDropShip.Checked then
     Result:= 2

  else
     Result:= 0;
end;

procedure TFrmCancelDropShipDlg.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmCancelDropShipDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCancelDropShipDlg.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmCancelDropShipDlg.Validate;
begin
  if rbtnDeletePO.Checked or rbtnCancelDropShip.Checked then
     EXIT;

  raise Exception.Create('Please make a selection and then press OK button');
end;


procedure TFrmCancelDropShipDlg.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Iqsecins.pas File
  EnsureSecurityInspectorOnTopOf( self );    }
end;

end.
