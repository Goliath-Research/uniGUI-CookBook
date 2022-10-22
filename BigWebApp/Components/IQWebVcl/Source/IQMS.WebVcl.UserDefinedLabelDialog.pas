unit IQMS.WebVcl.UserDefinedLabelDialog;

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
  Mask,
  DBCtrls,
  Buttons,
  Menus,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  TFrmUserDefLabel = class(TUniForm)
    PopupMenu1: TUniPopupMenu;
    Details1: TUniMenuItem;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    PnlMain: TUniPanel;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    sbtnAsDefault: TUniSpeedButton;
    edDefault: TUniEdit;
    edNewCaption: TUniEdit;
    procedure sbtnAsDefaultClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Details1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function GetNewCaption: string;
    procedure SetNewCaption( const AValue:string );
    function GetDefaultCaption: string;
    procedure SetDefaultCaption( const AValue:string );
  public
    { Public declarations }
    property DefaultCaption: string read GetDefaultCaption write SetDefaultCaption;
    property NewCaption: string read GetNewCaption write SetNewCaption;

  end;

function UserLabelDlg( const ADefaultCaption: string;  var ACaption: string ):Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager;

function UserLabelDlg( const ADefaultCaption: string;  var ACaption: string ):Boolean;
var
  FrmUserDefLabel: TFrmUserDefLabel;
begin
  // EIQ-3434 Security Inspector - prevent users from modifying UD caption 06-19-14 AB
  if (SecurityManager <> nil) then
    if SelectValueFmtAsString('select nvl(ud_label_cant_change, ''N'') ' +
                    '  from s_user_general where user_name = ''%s''',[ SecurityManager.UserName ]) = 'Y' then
    begin
      IQWarning(IQMS.WebVcl.ResourceStrings.cTXT0000435);  // 'Editing User Defined Label captions has been restricted by your security profile.';
      Result := FALSE;
      Exit;
    end;

  FrmUserDefLabel:= TFrmUserDefLabel.Create(uniGUIApplication.UniApplication);
  with FrmUserDefLabel do
  begin
    DefaultCaption:= ADefaultCaption;
    NewCaption    := ACaption;
    Result:= (ShowModal = mrOK) and ( Trim(ACaption) <> Trim(NewCaption) );
    if Result then
       ACaption:= NewCaption;
  end;
end;

procedure TFrmUserDefLabel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

function TFrmUserDefLabel.GetNewCaption: string;
begin
  Result:= edNewCaption.Text;
end;

procedure TFrmUserDefLabel.SetNewCaption( const AValue:string );
begin
  if edNewCaption.Text <> AValue then
     edNewCaption.Text:= AValue;
end;

procedure TFrmUserDefLabel.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmUserDefLabel.UniFormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    PopupMenu1.Popup(x,y,sender);
end;

function TFrmUserDefLabel.GetDefaultCaption: string;
begin
  Result:= edDefault.Text;
end;

procedure TFrmUserDefLabel.SetDefaultCaption( const AValue:string );
begin
  if edDefault.Text <> AValue then
     edDefault.Text:= AValue;
end;

procedure TFrmUserDefLabel.sbtnAsDefaultClick(Sender: TObject);
begin
  NewCaption:= edDefault.Text;
end;

procedure TFrmUserDefLabel.Details1Click(Sender: TObject);
begin
  IQConfirm( Format( IQMS.WebVcl.ResourceStrings.cTXT0000099 {'Application: %s'#13'Owner Name: %s'#13'Component Name: %s'},
            [ ExtractFileName(Application.ExeName),
              Owner.Owner.Name,  {get label's owner - the form}
              Owner.Name ] ));   {get owner - the label}
end;

procedure TFrmUserDefLabel.btnOKClick(Sender: TObject);
begin
  if Trim( edNewCaption.Text ) = '' then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000100 {'Value cannot be blank'} );
  ModalResult:= mrOK;
end;

end.

