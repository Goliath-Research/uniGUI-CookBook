unit IQMS.Common.EmailDialog;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.Controls;

type
  TFrmEmailDialog = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    PnlDestEMailLeft01: TUniPanel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Splitter3: TUniSplitter;
    pnlEmailRight: TUniPanel;
    sbtnAssignEmail: TUniSpeedButton;
    pnlEMailClient: TUniPanel;
    edEmailTo: TUniEdit;
    edSubject: TUniEdit;
    memoEmail: TUniMemo;
    lblOtherAttachments: TUniLabel;
    edOtherAttachments: TUniEdit;
    sbtnOtherAttachments: TUniSpeedButton;
    procedure sbtnAssignEmailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnOtherAttachmentsClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FEmailAttachments: TStringList;
    procedure ShowAttachmentsNames;
  public
    { Public declarations }
    procedure AddAttachment( AFileName: string );
  end;

var
  FrmEmailDialog: TFrmEmailDialog;

implementation

{$R *.dfm}

uses
  IQMS.Common.EmailUtils,
  IQMS.Common.RegFrm,
//  mailto_pick,
  IQMS.Common.PrnOtherAttachments;

procedure TFrmEmailDialog.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEmailDialog.btnOKClick(Sender: TObject);
begin
  IQMS.Common.EmailUtils.IQSendMailA( edEmailTo.Text,       // ARecipient (String)
                          edSubject.Text,       // ASubject (String)
                          memoEmail.Lines.Text, // ABodyText (String)
                          FEmailAttachments,    // AAttachments (TStringList)
                          True); // Send Now
  Close;
end;

procedure TFrmEmailDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FEmailAttachments.Free;
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmEmailDialog.sbtnAssignEmailClick(Sender: TObject);
var
  S: string;
begin
  S:= edEmailTo.Text;
//  if mailto_pick.GetMailToString( self, S ) then // in mailto_pick.pas
//     edEmailTo.Text:= S;
end;

procedure TFrmEmailDialog.sbtnOtherAttachmentsClick(Sender: TObject);
begin
  if TFrmPrnOtherAttachments.DoShowModal( self, FEmailAttachments ) then //  IQMS.Common.PrnOtherAttachments.pas
     ShowAttachmentsNames;
end;

procedure TFrmEmailDialog.ShowAttachmentsNames;
var
  I: Integer;
begin
  edOtherAttachments.Text:= '';
  for I:= 0 to FEmailAttachments.Count - 1 do
  begin
    if I > 0 then
       edOtherAttachments.Text:= edOtherAttachments.Text + '; ';
    edOtherAttachments.Text:= edOtherAttachments.Text + ExtractFileName( FEmailAttachments[ I ]);
  end;
end;

procedure TFrmEmailDialog.UniFormCreate(Sender: TObject);
begin
  FEmailAttachments:= TStringList.Create;

  IQRegFormRead(self, [ self ]);
end;

procedure TFrmEmailDialog.AddAttachment(AFileName: string);
begin
  FEmailAttachments.Add( AFileName );
  ShowAttachmentsNames;
end;


end.
