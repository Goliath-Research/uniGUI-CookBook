unit crm_groupwise;

(* *****************************************************************************
  Novell GroupWise

  This unit provides access to Novell GroupWise.

  "Groupware" is software that allows centralized administration of
  communications.  "Groupware" mainly provides access to e-mail and
  calendaring, but also may include voice mail, faxing, newsgroups,
  message boards, and even video conferencing and chat.  Microsoft
  Exchange, Novell GroupWise and IBM's Lotus Notes are considered
  "groupware."

  **************************************************************************** *)

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Winapi.ActiveX,
  System.SysUtils,
  System.Win.ComObj,
  Winapi.ShellAPI,
  Vcl.OleCtrls,
  System.Variants;

procedure CheckGroupWiseObjectCreated;
procedure RaiseInvalidGroupWise;

type
  TNovellGroupWise = class(TComponent)
  private
    { Private declarations }
    FConnected: Boolean;
    FUserID: String;
    procedure SetConnected(const Value: Boolean);
  protected
    { Protected declarations }

  public
    { Public declarations }
    GroupWise,
      RAObj: OLEVariant;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure SendMail(AAddress,
      ASubject,
      ABodyText: String;
      AAttachments: TStringList;
      ASendImmediate: Boolean = False);
  published
    { Published declarations }
    property UserID: String read FUserID write FUserID;
    property Connected: Boolean read FConnected write SetConnected;
  end;

const
  NOVELL_GROUPWISE_APPLICATION = 'NovellGroupWareSession';

var
  NovellGroupWise: TNovellGroupWise;
  hNovellGroupWiseValid: Boolean;
  hNovellGroupWiseExists: Boolean; // used mainly for crmoption

implementation

procedure CheckGroupWiseObjectCreated;
begin
  if not Assigned(NovellGroupWise) then
    NovellGroupWise := TNovellGroupWise.Create(Application);
end;

procedure RaiseInvalidGroupWise;
begin
end;

{ ---------------------------------------------------------------------------- }
{ TNovellGroupWise }
{ ---------------------------------------------------------------------------- }

constructor TNovellGroupWise.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TNovellGroupWise.Destroy;
begin

  inherited Destroy;
end;

procedure TNovellGroupWise.SetConnected(const Value: Boolean);
// --------------------------------------------------------------------------
  function _NovellGroupWiseAlreadyOpen: Boolean;
  begin
    try
      Result := TRUE; // Assign TRUE value first
      GroupWise := GetActiveOleObject(NOVELL_GROUPWISE_APPLICATION); // comobj
    except
      Result := False;
    end;
  end;

// --------------------------------------------------------------------------
begin
  if Value then
    begin
      // Logon (connect)
      FConnected := _NovellGroupWiseAlreadyOpen;
      if not FConnected then
        try
          GroupWise := CreateOleObject(NOVELL_GROUPWISE_APPLICATION);
          RAObj := GroupWise.Login(UserID, '/ph-?' { ACommandLine } );
          FConnected := TRUE;
          hNovellGroupWiseValid := TRUE;
        except
          on E: EOLESysError do
            begin
              FConnected := False;
              hNovellGroupWiseValid := False;
              raise Exception.Create('Could not connect to Novell GroupWise.');
            end;
        end;
    end
  else
    begin
      GroupWise := Unassigned;
      RAObj := Unassigned;
      FConnected := False;
    end;
end;

procedure TNovellGroupWise.SendMail(AAddress, ASubject, ABodyText: String;
  AAttachments: TStringList; ASendImmediate: Boolean);
const
  BUFFER_TEXT =
    '                                                                             ';
var
  Msg, Recpt, MailMsg: OLEVariant;
  i: Integer;
begin
  if not Connected then
    Exit;

  // Add message subtype "internet" to match the GroupWise SMTP gateway
  MailMsg := RAObj.MailBox.Messages.Add('GW.MESSAGE.MAIL.Internet');

  MailMsg.Subject := ASubject;
  MailMsg.BodyText := ABodyText;

  // Changed the viewname to match the GroupWise SMTP gateway viewname
  MailMsg.ViewName := 'Internet';
  // MailMsg.FromText := RAobj.Owner.EmailAddress + BUFFER_TEXT;
  if Assigned(AAttachments) then
    for i := 0 to AAttachments.Count - 1 do
      begin
        Recpt := MailMsg.Recipients.Add(AAttachments.Strings[i]);
        { Send message to owner }
        Recpt.Resolve;
      end;

  if ASendImmediate then
    begin
      Msg := MailMsg.Send;
      Msg.Delete; // Delete outbox message item
    end
  else
    Msg.Show; // ?

end;

end.
