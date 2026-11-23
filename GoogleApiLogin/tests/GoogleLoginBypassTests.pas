program GoogleLoginBypassTests;

{ Spec for the Google sign-in handler in this sample.

  These tests fail while the handler treats a client ajax event named
  success as proof of login. They pass once that event is not enough:
  an unverified name, email, image URL, or token must not establish a
  session, and the login form must not close with success.

  The suite compiles GoogleLoginForm.pas and MainModule.pas and calls
  TUniGoogleLoginForm.UniLoginFormAjaxEvent, the method the login form
  binds to OnAjaxEvent. Parameters are the name=value list the page
  script passes to ajaxRequest, plus the bookkeeping keys uniGUI places
  on that request. No Google account and no signed ID token is used. }

{$mode delphi}

uses
  SysUtils, Classes, Controls,
  uniGUIApplication, MainModule, GoogleLoginForm, uniGUITypes;

const
  AttackerName = 'Ada Attacker';
  AttackerEmail = 'ada@attacker.example';
  VictimEmail = 'victim@example.com';
  AttackerImage = 'https://attacker.example/a.png';
  PlainToken = 'not-a-google-id-token';

var
  Failed: Integer;
  ClientID: string;

procedure Check(Cond: Boolean; const Name, Detail: string);
begin
  if Cond then
    WriteLn('PASS ', Name)
  else
  begin
    Inc(Failed);
    WriteLn('FAIL ', Name, ': ', Detail);
  end;
end;

function Base64Encode(const Data: RawByteString): string;
const
  Alphabet: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I, Len, N: Integer;
  B: array[0..2] of Byte;
begin
  Result := '';
  Len := Length(Data);
  I := 1;
  while I <= Len do
  begin
    N := 0;
    FillChar(B, SizeOf(B), 0);
    while (N < 3) and (I <= Len) do
    begin
      B[N] := Byte(Data[I]);
      Inc(N);
      Inc(I);
    end;
    Result := Result + Alphabet[(B[0] shr 2) + 1];
    Result := Result + Alphabet[(((B[0] and 3) shl 4) or (B[1] shr 4)) + 1];
    if N < 2 then
      Result := Result + '='
    else
      Result := Result + Alphabet[(((B[1] and 15) shl 2) or (B[2] shr 6)) + 1];
    if N < 3 then
      Result := Result + '='
    else
      Result := Result + Alphabet[(B[2] and 63) + 1];
  end;
end;

function Base64Url(const Text: string): string;
begin
  Result := Base64Encode(RawByteString(Text));
  Result := StringReplace(Result, '+', '-', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '_', [rfReplaceAll]);
  Result := StringReplace(Result, '=', '', [rfReplaceAll]);
end;

function ForgedJwt(const Alg, Email, Name, Aud: string): string;
var
  Header, Payload: string;
begin
  Header := '{"alg":"' + Alg + '","typ":"JWT"}';
  Payload := '{"iss":"https://accounts.google.com","aud":"' + Aud +
    '","email":"' + Email + '","name":"' + Name +
    '","sub":"attacker-subject","exp":9999999999}';
  { The signature is not produced by Google's signing key. }
  Result := Base64Url(Header) + '.' + Base64Url(Payload) + '.forged';
end;

function ReadFileText(const Path: string): string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  try
    L.LoadFromFile(Path);
    Result := L.Text;
  finally
    L.Free;
  end;
end;

function DfmStringLiterals(const FormText: string): string;
var
  I, N: Integer;
  Body: string;
  Ch: Char;
begin
  Result := '';
  I := Pos('HTML.Strings', FormText);
  if I = 0 then
    Exit;
  Body := Copy(FormText, I, MaxInt);
  N := 1;
  while N <= Length(Body) do
  begin
    if Body[N] = '''' then
    begin
      Inc(N);
      while N <= Length(Body) do
      begin
        Ch := Body[N];
        if Ch = '''' then
        begin
          if (N < Length(Body)) and (Body[N + 1] = '''') then
          begin
            Result := Result + '''';
            Inc(N, 2);
          end
          else
          begin
            Inc(N);
            Break;
          end;
        end
        else
        begin
          Result := Result + Ch;
          Inc(N);
        end;
      end;
    end
    else
      Inc(N);
    { The HTML block ends at the component's Align property. }
    if Pos('Align =', Copy(Body, N, 40)) = 1 then
      Break;
  end;
end;

function PublishedClientID: string;
var
  HTML, Marker, Tail: string;
  StartAt, P, Q: Integer;
begin
  HTML := DfmStringLiterals(ReadFileText('../GoogleLoginForm.dfm'));
  Marker := 'google-signin-client_id';
  StartAt := Pos(Marker, HTML);
  Result := '';
  if StartAt = 0 then
    Exit;
  Tail := Copy(HTML, StartAt, MaxInt);
  P := Pos('content="', Tail);
  if P = 0 then
    Exit;
  Tail := Copy(Tail, P + Length('content="'), MaxInt);
  Q := Pos('"', Tail);
  if Q = 0 then
    Exit;
  Result := Copy(Tail, 1, Q - 1);
end;

procedure OpenLogin(out App: TUniGUIApplication; out Module: TUniMainModule;
  out Login: TUniGoogleLoginForm);
begin
  App := TUniGUIApplication.Create;
  SetUniApplication(App);
  Module := TUniMainModule.Create(nil);
  App.UniMainModule := Module;
  Login := TUniGoogleLoginForm.Create(nil);
end;

procedure CloseLogin(App: TUniGUIApplication; Module: TUniMainModule;
  Login: TUniGoogleLoginForm);
begin
  Login.Free;
  Module.Free;
  App.Free;
  SetUniApplication(nil);
end;

function AjaxParams(const Name, Email, ImageURL, Token: string): TUniStrings;
begin
  { Same shape as a uniGUI ajax event request: the event name travels in
    Evt, and each value the page script concatenated is its own line.
    _S_ID is the caller's own session id, not another user's. }
  Result := TUniStrings.Create;
  Result.Add('Ajax=1');
  Result.Add('IsEvent=1');
  Result.Add('Obj=UniGoogleLoginForm');
  Result.Add('Evt=success');
  Result.Add('Name=' + Name);
  Result.Add('Email=' + Email);
  Result.Add('ImageURL=' + ImageURL);
  Result.Add('Token=' + Token);
  Result.Add('_S_ID=TEST-SESSION');
  Result.Add('_seq_=1');
  Result.Add('_a_=1');
end;

type
  TLoginOutcome = record
    ModalResult: Integer;
    LoggedIn: Boolean;
    FullName, Email, ImageURL, Token: string;
    Raised: Boolean;
    Error: string;
  end;

function OutcomeOf(const EventName: string; Params: TUniStrings): TLoginOutcome;
var
  App: TUniGUIApplication;
  Module: TUniMainModule;
  Login: TUniGoogleLoginForm;
begin
  OpenLogin(App, Module, Login);
  try
    Result.Raised := False;
    Result.Error := '';
    try
      Login.UniLoginFormAjaxEvent(Login, EventName, Params);
    except
      on E: Exception do
      begin
        Result.Raised := True;
        Result.Error := E.ClassName + ': ' + E.Message;
      end;
    end;
    Result.ModalResult := Login.ModalResult;
    Result.LoggedIn := Module.LoggedIn;
    Result.FullName := Module.UserFullName;
    Result.Email := Module.UserEmail;
    Result.ImageURL := Module.UserImageURL;
    Result.Token := Module.UserIdToken;
  finally
    CloseLogin(App, Module, Login);
    Params.Free;
  end;
end;

function Describes(const O: TLoginOutcome): string;
begin
  Result := 'modal=' + IntToStr(O.ModalResult) +
    ' loggedIn=' + BoolToStr(O.LoggedIn, True) +
    ' name=' + O.FullName +
    ' email=' + O.Email +
    ' image=' + O.ImageURL +
    ' tokenLength=' + IntToStr(Length(O.Token));
  if O.Raised then
    Result := Result + ' raised=' + O.Error;
end;

procedure ExpectRejected(const TestName, EventName: string; Params: TUniStrings;
  const ForbiddenEmail, ForbiddenName: string);
var
  O: TLoginOutcome;
  Detail: string;
begin
  O := OutcomeOf(EventName, Params);
  Detail := Describes(O);
  Check(O.ModalResult <> mrOk, TestName + ' does not close the login form with success', Detail);
  Check(not O.LoggedIn, TestName + ' does not report logged in', Detail);
  Check(O.Token = '', TestName + ' does not keep the unverified token', Detail);
  Check(O.Email <> ForbiddenEmail, TestName + ' does not adopt the attacker email', Detail);
  Check(O.FullName <> ForbiddenName, TestName + ' does not adopt the attacker name', Detail);
  Check(O.ImageURL = '', TestName + ' does not keep the attacker image URL', Detail);
  if ForbiddenEmail <> VictimEmail then
    Check(O.Email <> VictimEmail, TestName + ' does not adopt an email from an unverified token', Detail);
end;

procedure TestFreshSessionIsLoggedOut;
var
  App: TUniGUIApplication;
  Module: TUniMainModule;
  Login: TUniGoogleLoginForm;
begin
  OpenLogin(App, Module, Login);
  try
    Check((not Module.LoggedIn) and (Module.UserEmail = '') and
      (Module.UserIdToken = '') and (Login.ModalResult <> mrOk),
      'fresh session is logged out',
      'loggedIn=' + BoolToStr(Module.LoggedIn, True));
  finally
    CloseLogin(App, Module, Login);
  end;
end;

procedure TestPlainToken;
begin
  ExpectRejected('plain token', 'success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage, PlainToken),
    AttackerEmail, AttackerName);
end;

procedure TestWhitespaceToken;
begin
  ExpectRejected('whitespace token', 'success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage, '   '),
    AttackerEmail, AttackerName);
end;

procedure TestEmptyTokenStillDoesNotOpenTheForm;
begin
  { The success event copies the client name and email and closes with
    success even when the token line is empty. Closing the login form
    is the session gate, so an empty token must not do that either. }
  ExpectRejected('empty token', 'success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage, ''),
    AttackerEmail, AttackerName);
end;

procedure TestAlgNoneJwt;
begin
  ExpectRejected('alg none jwt', 'success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage,
      ForgedJwt('none', AttackerEmail, AttackerName, ClientID)),
    AttackerEmail, AttackerName);
end;

procedure TestRs256WrongSignatureUsesParamIdentity;
begin
  ExpectRejected('rs256 forged signature', 'success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage,
      ForgedJwt('RS256', VictimEmail, AttackerName, ClientID)),
    AttackerEmail, AttackerName);
end;

procedure TestRs256WrongSignatureDoesNotUsePayloadIdentity;
var
  O: TLoginOutcome;
begin
  O := OutcomeOf('success',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage,
      ForgedJwt('RS256', VictimEmail, 'Payload Name', ClientID)));
  Check(O.Email <> VictimEmail,
    'rs256 forged signature does not adopt the token email', Describes(O));
  Check(O.FullName <> 'Payload Name',
    'rs256 forged signature does not adopt the token name', Describes(O));
  Check(O.ModalResult <> mrOk,
    'rs256 forged signature does not close with success', Describes(O));
  Check(not O.LoggedIn,
    'rs256 forged signature does not report logged in', Describes(O));
end;

procedure TestFailureEventDoesNotAuthenticate;
var
  Params: TUniStrings;
  O: TLoginOutcome;
begin
  Params := TUniStrings.Create;
  Params.Add('Ajax=1');
  Params.Add('IsEvent=1');
  Params.Add('Evt=failure');
  Params.Add('Error=popup_closed_by_user');
  Params.Add('_S_ID=TEST-SESSION');
  O := OutcomeOf('failure', Params);
  { mrCancel is what the real failure branch assigns. A harness that never
    reached that branch would leave ModalResult at its initial value. }
  Check(O.ModalResult = mrCancel,
    'failure event reaches the login form failure branch', Describes(O));
  Check((not O.LoggedIn) and (O.Email = '') and (O.Token = ''),
    'failure event does not authenticate', Describes(O));
end;

procedure TestOtherEventDoesNotAuthenticate;
var
  O: TLoginOutcome;
begin
  O := OutcomeOf('click',
    AjaxParams(AttackerName, AttackerEmail, AttackerImage, PlainToken));
  Check((not O.LoggedIn) and (O.Email = '') and (O.Token = '') and
    (O.ModalResult <> mrOk),
    'unrelated event does not authenticate', Describes(O));
end;

procedure TestClientIdWasRead;
begin
  Check(ClientID <> '',
    'published Google client id was read from the login form',
    'client id missing from GoogleLoginForm.dfm');
  Check(Pos(' ', ClientID) = 0,
    'published Google client id is a single token',
    ClientID);
end;

begin
  Failed := 0;
  ClientID := PublishedClientID;
  TestClientIdWasRead;
  TestFreshSessionIsLoggedOut;
  TestPlainToken;
  TestWhitespaceToken;
  TestEmptyTokenStillDoesNotOpenTheForm;
  TestAlgNoneJwt;
  TestRs256WrongSignatureUsesParamIdentity;
  TestRs256WrongSignatureDoesNotUsePayloadIdentity;
  TestFailureEventDoesNotAuthenticate;
  TestOtherEventDoesNotAuthenticate;
  if Failed = 0 then
  begin
    WriteLn('ALL PASSED');
    Halt(0);
  end
  else
  begin
    WriteLn(Failed, ' CHECK(S) FAILED');
    Halt(1);
  end;
end.
