unit IQMS.WebVcl.RepDefRemove;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Vcl.Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmRepDefRemove = class(TUniForm)
    rbtnRemove: TUniRadioButton;
    rbtnHide: TUniRadioButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    Label2: TUniLabel;
    Label1: TUniLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RepDefRemoveDialog( var AAction: string ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

function RepDefRemoveDialog(  var AAction: string ): Boolean;
begin
  with TFrmRepDefRemove.Create(uniGUIApplication.UniApplication) do
  try
    Result:= ShowModal = mrOK;
    if Result then
    begin
      if rbtnRemove.Checked then 
         AAction:= 'REMOVE'
      else
         AAction:= 'HIDE'
    end; 
  finally
    Free;
  end;
end;

procedure TFrmRepDefRemove.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmRepDefRemove.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;


end.




