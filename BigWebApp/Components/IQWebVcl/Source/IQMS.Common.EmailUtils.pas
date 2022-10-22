unit IQMS.Common.EmailUtils;

(* *****************************************************************************
 *                        *** E-Mail Utility Methods ***
 * *****************************************************************************

   This unit contains primary e-mail libary methods for sending e-mails.

   E-Mail addresses must either be valid e-mail addresses or e-mail
   contact names recognizable by the groupware server.  For
   instance, if showing or sending through Lotus Notes, the e-mail
   address may be a contact name, and not an e-mail address because
   the user name must exist as a registered contact on the server.
   For Outlook or SMTP, a valid e-mail address will suffice.  If
   you provide more than one e-mail address, delimate each address
   with a semicolon.

   Please Note:
    - HTML content in an e-mail editor is available only through
      Microsoft Outlook, not Lotus Notes or the default, Windows editor.
    - HTML content in immediately sent e-mails is available only through
      Microsoft Outlook and SMTP, not Lotus Notes.

   Example 1:

      procedure TForm1.MyProcedure;
      var
         AParams: TIQSendEmailParams;
      begin
        // Intialize parameter record to default values
        InitSendEmailParams(AParams);
        // Provide e-mail data
        AParams.Recipients := 'bupchurch@iqms.com;jslater@iqms.com';
        AParams.Subject := 'Test E-Mail';
        AParams.BodyText := 'This is a test.  Please disregard.';
        AParams.SendNow := False; // display the e-mail editor
        // Show the e-mail
        IQSendMail(AParams, NIL {Attachments});
      end;

  Example 2:
     // Send e-mail immediately, using the default method
     IQSendMailA('bupchurch@iqms.com', // Recipient
                 'Test E-Mail',        // Subject
                 'This is a test.',    // BodyText
                 NIL,                  // Attachments
                 True);                // SendNow

 * ************************************************************************* *)

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Controls, Data.DB, Vcl.DBCtrls,IQMS.Common.Registry, UniDbGrid; // , Vcl.DBGrids, Vcl.Grids,
// (*UG_rem_AMB*)  IQRgstry,
  // Vcl.Wwdbgrid, Vcl.Wwdbigrd, Vcl.Wwdotdot;

type
  { TIQEmailMethod }
  TIQEmailMethod = (emDefault,    // System Parameters determines method (default)
                    emWindows,    // E-mail client registered in Windows
                    emOutlook,    // Microsoft Outlook
                    emLotusNotes, // IBM Lotus Notes
                    emGroupWise); // Novell GroupWise

  { TIQEmailContentType }
  TIQEmailContentType = (btText, btHTML);

  { TIQSendEmailParams }
  TIQSendEmailParams = packed record
   SenderName: String;
   SenderAddress: String;
   Recipients: String;
   Subject: String;
   BodyText: String;
   Copy: String;
   BlindCopy: String;
   HTMLContent: Boolean;
   ShowStatus: Boolean;
   SendNow: Boolean;
   Method: TIQEmailMethod;
   ShowErrors: Boolean;
   SoftErrors: Boolean;
end;

  {----------------------------------------------------------------------------
                     ** Primary E-Mail Send/Show Methods **
   ----------------------------------------------------------------------------}
  // Intialize e-mail params to default values
  procedure InitSendEmailParams(var AParams: TIQSendEmailParams);

  // Primary e-mail method
  function IQSendMail(const AParams: TIQSendEmailParams;
                      AAttachments: TStringList = NIL): Boolean;

  function IQSendMailA(ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; ASendNow: Boolean): Boolean;

  function IQSendMailB(ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; AHTML: Boolean; ASendNow: Boolean): Boolean;

  // Send mail using SMTP.
  // If the AShowStatus param = True, then a status window will display while
  // the e-mail is being sent.
  function IQSendMailSmtp(ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; AHTML: Boolean; AShowStatus: Boolean = False): Boolean;

  function IQSendMailSmtpB(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; AHTML: Boolean): Boolean;

  function IQSendMailSmtpC(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; AHTML: Boolean; ALogFileName: String): Boolean;

  function IQSendCRMMassMailItem(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
   AAttachments: TStringList; AHTML: Boolean; ACRMMailingRecipientID: Integer): Boolean;


  // Indicates whether groupware supports HTML e-mails
  function CanShowHTMLEMail: Boolean;

  {----------------------------------------------------------------------------
                        ** E-Mail Address Methods **
   ----------------------------------------------------------------------------}
  // checks the validity of one e-mail address
  function EMailValid(const AEmailAddress: string): Boolean;
  // checks the validity of one or more e-mail addresses, delimited by a space,
  // a comma or a semi-colon.  If the result is FALSE, then AInvalidEMail holds
  // the invalid e-mail address.
  function EMailValidEx(const AEmailAddress: string;
                        var AInvalidEMail: String): Boolean;
  // checks the validatity of a URL
  function URLValid(const AURL: string): Boolean;

  { Separates an e-mail address containing a display name:
      Example:
        IN:
           ADisplayAddress = 'Byron Upchurch <byron@iqms.com>'
        OUT:
           AName = 'Byron Upchurch'
           AAddr = 'byron@iqms.com'

   If the input value contains only an e-mail address, then the AName
   variable will be empty.}
  procedure ExtractEMailAddress(const ADisplayAddress: String;
                                var AName: String;
                                var AAddr: String);

  {Formats an e-mail address that also contains a display name:
    IN:
      AName = 'Byron Upchurch'
      AAddress = 'bupchurch@iqms.com'
    OUT:
      Result = 'Byron Upchurch <bupchurch@iqms.com>'  }
  function FormatEMailDisplay(const AName,
                                    AAddress: String): String;

  {E-Mail Controls - grids and edit controls}
  procedure AssignCursorOnMouseMove( Sender: TObject );
  procedure AssignCursorOnMouseMove_Grid( Sender: TObject; X, Y: Integer;
    AEMailFieldName:String; AURLFieldName:String = '' );
  procedure PromptAssignURLField( ATitle, APrompt: string; AField: TField );
  procedure PromptAssignEmailField(AField: TField);
  procedure DoURLClick( Sender: TObject );
  procedure DoEMailClick( Sender: TObject );

const
  // E-Mail addresses can have these characters only
  C_VALID_EMAIL_CHAR = ['a'..'z','A'..'Z','0'..'9','+','-','.','_','!',
   '#','$','%','&','''','*','/','=','?','^','`','{','|','}','~'];

implementation

uses
  IQMS.Common.DotNetCOMShared,
(*UG_rem_AMB*)
  IQMS.Common.ApplicationSet,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
(*UG_rem_AMB*)
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils;

procedure InitSendEmailParams(var AParams: TIQSendEmailParams);
begin
   AParams.SenderName := '';
   AParams.SenderAddress := '';
   AParams.Recipients := '';
   AParams.Subject := '';
   AParams.BodyText := '';
   AParams.Copy := '';
   AParams.BlindCopy := '';
   AParams.HTMLContent := False;
   AParams.ShowStatus := False;
   AParams.SendNow := False;
   AParams.Method := emDefault;
   AParams.ShowErrors := True;
   AParams.SoftErrors := True;
end;

(*
function IQSendMail(ARecipient: String; // Send To
                    ASubject: String;
                    ABodyText: String;
                    ASendNow: Boolean; // Send immediately (False = show editor)
                    AAttachments: TStringList = NIL; // Attachment list
                    ACopy: String = ''; // CC
                    ABlindCopy: String = ''; // BCC
                    AHTML: Boolean = False; // HTML content type
                    AShowSendStatus: Boolean = False;
                    AMethod: TIQEmailMethod = emDefault): // System settings
                    Boolean;
*)

function IQSendMail(const AParams: TIQSendEmailParams;
                    AAttachments: TStringList = NIL): Boolean;
var
   AAttachmentString, ASender: String;
begin
  AAttachmentString := '';
  if Assigned(AAttachments) then
     AAttachmentString := IQMS.Common.StringUtils.StringListToStr(AAttachments);

(*UG_rem_AMB*)
  if AParams.SendNow and ((AParams.Method = emWindows) or IsCGI) then
     begin
       // Get the formatted sender name
       if (AParams.SenderName > '') and (AParams.SenderName <> AParams.SenderAddress) then
           ASender := Format('%s <%s>', [AParams.SenderName, AParams.SenderAddress])
       else
           ASender := AParams.SenderAddress;
       // Send SMTP
       Result := IQMS.Common.DotNetCOMShared.TDNetEMailUtils.SendSMTP(ASender,
         AParams.Recipients, AParams.Copy, AParams.BlindCopy,
         AParams.Subject, AParams.BodyText, AAttachmentString,
         AParams.HTMLContent)
     end
  else if AParams.SendNow then
     Result := TDNetEMailUtils.Send(
       AParams.SenderName,
       AParams.SenderAddress,
       AParams.Recipients,
       AParams.Copy,
       AParams.BlindCopy,
       AParams.Subject,
       AParams.BodyText,
       AAttachmentString,
       AParams.HTMLContent)
  else
     begin
       TDNetEMailUtils.Show(
       AParams.SenderName,
       AParams.SenderAddress,
       AParams.Recipients,
       AParams.Copy,
       AParams.BlindCopy,
       AParams.Subject,
       AParams.BodyText,
       AAttachmentString,
       AParams.HTMLContent);
       Result := True;
     end;
end;

function IQSendMailA(ARecipient, ASubject, ABodyText: String;
 AAttachments: TStringList; ASendNow: Boolean): Boolean;
var
   AParams: TIQSendEmailParams;
begin
  InitSendEmailParams(AParams);
  AParams.Recipients := ARecipient;
  AParams.Subject := ASubject;
  AParams.BodyText := ABodyText;
  AParams.SendNow := ASendNow;
  AParams.ShowErrors := False;
  Result := IQSendMail(AParams, AAttachments);
end;

function IQSendMailB(ARecipient, ASubject, ABodyText: String;
 AAttachments: TStringList; AHTML: Boolean; ASendNow: Boolean): Boolean;
var
   AParams: TIQSendEmailParams;
begin
  InitSendEmailParams(AParams);
  AParams.Recipients := ARecipient;
  AParams.Subject := ASubject;
  AParams.BodyText := ABodyText;
  AParams.SendNow := ASendNow;
  AParams.HTMLContent := AHTML;
  AParams.ShowErrors := False;
  Result := IQSendMail(AParams, AAttachments);
end;

function IQSendMailSmtp(ARecipient, ASubject, ABodyText: String;
 AAttachments: TStringList; AHTML, AShowStatus: Boolean): Boolean;
begin
  Result := IQSendMailSmtpB('', '', ARecipient, ASubject, ABodyText,
    AAttachments, AHTML);
end;

function IQSendMailSmtpB(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
 AAttachments: TStringList; AHTML: Boolean): Boolean;
var
   AAttachmentString, AFormattedEMail: String;
begin
  AAttachmentString := '';
  if Assigned(AAttachments) then
     AAttachmentString := IQMS.Common.StringUtils.StringListToStr(AAttachments);
  // 07/29/2014 Format the e-mail address (Byron)
  AFormattedEMail := FormatEMailDisplay(ASenderName,ASenderEMail);
  Result := IQMS.Common.DotNetCOMShared.TDNetEMailUtils.SendSMTP(AFormattedEMail, ARecipient, '',
    '', ASubject, ABodyText, AAttachmentString, AHTML);
end;

function IQSendMailSmtpC(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
 AAttachments: TStringList; AHTML: Boolean; ALogFileName: String): Boolean;
var
   AAttachmentString, AFormattedEMail: String;
begin
  AAttachmentString := '';
  if Assigned(AAttachments) then
     AAttachmentString := IQMS.Common.StringUtils.StringListToStr(AAttachments);
  // 01/30/2012 Format the e-mail address (Byron)
  AFormattedEMail := FormatEMailDisplay(ASenderName,ASenderEMail);
  Result := TDNetEMailUtils.SendSMTPEx(AFormattedEMail, ARecipient, '', '',
    ASubject, ABodyText, AAttachmentString, AHTML, rmLog, ALogFileName);
end;

function IQSendCRMMassMailItem(ASenderEMail, ASenderName, ARecipient, ASubject, ABodyText: String;
  AAttachments: TStringList; AHTML: Boolean; ACRMMailingRecipientID: Integer): Boolean;
var
   AAttachmentString, AFormattedEMail: String;
begin
  AAttachmentString := '';
  if Assigned(AAttachments) then
     AAttachmentString := IQMS.Common.StringUtils.StringListToStr(AAttachments);
  // 01/30/2012 Format the e-mail address (Byron)
  AFormattedEMail := FormatEMailDisplay(ASenderName,ASenderEMail);
  Result := TDNetEMailUtils.SendCRMMassMailItem(AFormattedEMail, ARecipient, '', '',
    ASubject, ABodyText, AAttachmentString, AHTML, ACRMMailingRecipientID);
end;

function CanShowHTMLEMail: Boolean;
begin
  Result := TDNetEMailUtils.CanShowHTMLEMail;
end;

function EMailValid(const AEmailAddress: string): Boolean;
var
   AAddr, AName, ATempStr: string;
   i, iAtPos: integer;

   ALocal, ADomain: String;

   function _HasInvalidChar(const S: String): Boolean;
   var
      j: Integer;
   begin
     Result := False;
     for j := 1 to Length(S) do
      if not (S[j] in C_VALID_EMAIL_CHAR) then
         begin
           Result := True;
           Break;
         end;
   end;

begin
  //Initialization
  Result := False;

  // Validation
  if AEmailAddress = '' then
     Exit;

  // Get E-Mail part
  ExtractEMailAddress( AEmailAddress, AName, AAddr ); // see below
  if AAddr = '' then
     AAddr := AEmailAddress;

  // We should only have 1 at sign
(*UG_rem_AMB - Occurances is not implemented, so this was remmed for now.*)
  if IQMS.Common.StringUtils.Occurances('@', AAddr) > 1 then
     Exit;

  // We should have no double periods
  if Pos('..', AAddr) > 0 then
     Exit;

  // Get the @ sign position
  iAtPos := Pos('@', AAddr);
  if iAtPos = 0 then Exit;

  // Get parts
  ALocal  := Copy(AAddr, 1, iAtPos-1);
  ADomain := Copy(AAddr, iAtPos+1, Length(AAddr));

  // If no local address or domain, then exit
  if (ALocal = '') or (ADomain = '') then
     Exit;

  // Check domain
  // Example: x.net
  // And must be a period in domain name
  Result := (Length(ADomain) >= 5) and
            (Pos('.', ADomain) > 0);
  if not Result then
     Exit;

  // Check local
  // A period cannot be either the first or the last character.
  Result := (Length(ALocal) >= 1) and
            (ALocal[1] <> '.') and
            (ALocal[Length(ALocal)] <> '.');
  if not Result then
     Exit;

  // Check for invalid characters
  Result := not _HasInvalidChar(ALocal) and
            not _HasInvalidChar(ADomain);

end;

function EMailValidEx(const AEmailAddress: string; var AInvalidEMail: String): Boolean;
var
   AList: TStringList;
   i: Integer;
   S: String;
begin
  // checks the validity of one or more e-mail addresses, delimited by a space,
  // a comma or a semi-colon
  try
     AList := TStringList.Create;
     AList.Sorted := TRUE;
     AList.Duplicates := dupIgnore;

     // convert delimiters
     S := AEmailAddress;
     S := IQMS.Common.StringUtils.StrTran(S, '; ', ';'); // ensure commas are turned into semicolons
     S := IQMS.Common.StringUtils.StrTran(S, ',', ';'); // ensure commas are turned into semicolons
     S := IQMS.Common.StringUtils.StrTran(S, ' ', ';'); // ensure commas are turned into semicolons

     // get a list of e-mail addresses, even if there is only one
     IQMS.Common.StringUtils.StrToStringList(Trim(S), AList);

     for i := 0 to AList.Count - 1 do
      if AList.Strings[i] > '' then
      begin
       // check the validity of this e-mail address
       Result := EMailValid(AList.Strings[i]); // see above
       // if invalid, return false and stop checking; we're done.
       if not Result then
          begin
            AInvalidEMail := AList.Strings[i];
            BREAK;
          end;
      end;
  finally
     if Assigned(AList) then AList.Free;
  end;

end;


function URLValid(const AURL: string): Boolean;
var
    ATempStr: string;
    i: integer;
begin
  // Is the URL or Internet hyperlink valid?

  Result := TRUE;
  if Trim( AURL ) = '' then Exit;
  Result := (Trim(AURL) > '') and
            ( Pos( '''', AURL ) = 0 ) and
            ( Pos( 'ä', AURL ) = 0 ) and
            ( Pos( 'ö', AURL ) = 0 ) and
            ( Pos( 'ü', AURL ) = 0 ) and
            ( Pos( 'ß', AURL ) = 0 ) and
            ( Pos( '[', AURL ) = 0 ) and
            ( Pos( ']', AURL ) = 0 ) and
            ( Pos( '(', AURL ) = 0 ) and
            ( Pos( ')', AURL ) = 0 );
end;

procedure ExtractEMailAddress( const ADisplayAddress: String;
 var AName: String; var AAddr: String );
     // Example:
     //   IN:
     //      ADisplayAddress = 'Byron Upchurch <byron@iqms.com>'
     //   OUT:
     //      AName = 'Byron Upchurch'
     //      AAddr = 'byron@iqms.com'
     //
var
   i: Integer;
   iStart, iEnd, iAtPos: Integer;
   c: Char;
begin
  // Initialization
  AName := '';
  AAddr := '';

  // Validation
  if Trim(ADisplayAddress) = '' then Exit;

  // Get the @ sign position
  iAtPos := Pos('@', ADisplayAddress);
  if iAtPos = 0 then Exit;

  // Get the placement of the "comments"
  // 1.) Parentheses
  iStart := Pos('(', ADisplayAddress);
  iEnd := Pos(')', ADisplayAddress);
  // 2.) Carret
  if (iStart = 0) and (iEnd = 0) then
     begin
       iStart := Pos('<', ADisplayAddress);
       iEnd := Pos('>', ADisplayAddress);
     end;

  // 1.) Method 1
  if (iStart > 0) and (iEnd > 0)
  (*UG_rem_AMB*)
    and IsBetween(iAtPos,iStart,iEnd)
  then
     begin
       AName := Trim(Copy(ADisplayAddress, 1, iStart-1));
       AAddr := Trim(Copy(ADisplayAddress, iStart+1, iEnd-iStart-1));
     end

  // 2.) Method 2
  else
    begin
      // Initialize
      iStart := 0;
      iEnd := 0;
      // Get start position
      for i := iAtPos-1 downto 1 do
       begin
         c := ADisplayAddress[i];
         if not (c in C_VALID_EMAIL_CHAR) then
            Break;
         iStart := i;
       end;
      // Get end position
      for i := iAtPos+1 to Length(ADisplayAddress) do
       begin
         c := ADisplayAddress[i];
         if not (c in C_VALID_EMAIL_CHAR) then
            Break;
          iEnd := i;
       end;
      // Extract parts
      if (iStart > 0) and (iEnd > 0) then
         begin
           AName := Trim(Copy(ADisplayAddress, 1, iStart-1));
           AAddr := Trim(Copy(ADisplayAddress, iStart, iEnd-iStart+1));
         end;
    end;
end;

function FormatEMailDisplay(const AName,
                                  AAddress: String): String;
begin
  // Pass address as result by default
  Result := AAddress;
  if (Result > '') and (AName > '') then
     Result := Format('%s <%s>', [AName, AAddress]);
end;

procedure AssignCursorOnMouseMove(Sender: TObject);
begin
  if (Sender is TDBEdit) then
    with Sender as TDBEdit do
      begin
        if Assigned(DataSource) and Assigned(DataSource.DataSet) then
        (*UG_rem_AMB*)
          Cursor := IIf(Trim(DataSource.DataSet.FieldByName(DataField).asString)
            > '', crHandPoint, crDefault);
      end;
end;

procedure AssignCursorOnMouseMove_Grid(Sender: TObject; X, Y: Integer;
  AEMailFieldName: string; AURLFieldName: string = '');
//var
//  Acoord: TGridCoord;
begin
//  if (Sender is TDBGrid) then
//    with Sender as TDBGrid do
//      begin
//        Acoord := MouseCoord(X, Y);
//        if (Acoord.X > 1) and
//          ((Columns[Acoord.X - 1].FieldName = AEMailFieldName) or
//          (Columns[Acoord.X - 1].FieldName = AURLFieldName)) then
//          (*UG_rem_AMB*)
////          Cursor := IIf
////            (Trim(DataSource.DataSet.FieldByName(Columns[Acoord.X - 1]
////            .FieldName).asString) > '', crHandPoint, crDefault)
//        else
//          Cursor := crDefault
//      end
//  else if (Sender is TwwDBGrid) then
//    with Sender as TwwDBGrid do
//      begin
//        Acoord := MouseCoord(X, Y);
//        if (Acoord.X > 1) and
//          ((Columns[Acoord.X - 1].FieldName = AEMailFieldName) or
//          (Columns[Acoord.X - 1].FieldName = AURLFieldName)) then
//          (*UG_rem_AMB*)
////          Cursor := IIf
////            (Trim(DataSource.DataSet.FieldByName(Columns[Acoord.X - 1]
////            .FieldName).asString) > '', crHandPoint, crDefault)
//        else
//          Cursor := crDefault
//      end;
end;


procedure PromptAssignURLField( ATitle, APrompt: string; AField: TField );
var
  S: string;

  function _FixEmailWording( S: string ): string;
  begin
    Result:= StringReplace( S,      'email',  IQMS.Common.ResStrings.cTXT0000441 {'Email'}, [rfReplaceAll, rfIgnoreCase]);
    Result:= StringReplace( Result, 'e-mail', IQMS.Common.ResStrings.cTXT0000441 {'Email'}, [rfReplaceAll, rfIgnoreCase]);
  end;

begin
  S:= AField.asString;

  // fix on fly references to variations of E-mail, eMail etc
  ATitle := _FixEmailWording( ATitle  );
  APrompt:= _FixEmailWording( APrompt );

  // 08/07/2012 Changed to IQInputQuery because the Vcl.Dialogs.InputQuery
  // cuts off the prompt text.

(*UG_rem_AMB*)
  if IQInputQuery( ATitle, APrompt, S ) then
  begin
    AField.DataSet.Edit;
    AField.asString:= S;
  end;
end;

procedure PromptAssignEmailField(AField: TField);
var
  AValue: string;
  ADataSet: TDataSet;
begin
  if Assigned(AField) then
    begin
      ADataSet := AField.DataSet;
      if Assigned(ADataSet) then
        begin
          AValue := AField.asString;
          // IQMS.Common.ResourceStrings.cTXT0000043 = 'Edit'
          // IQMS.Common.ResourceStrings.cTXT0000443 = 'Edit email address:'
          (*UG_rem_AMB*)
          if IQInputQuery(IQMS.Common.ResStrings.cTXT0000043,
            IQMS.Common.ResStrings.cTXT0000443, AValue) then

            begin
              if not (ADataSet.State in [dsEdit, dsInsert]) then
                ADataSet.Edit;
              AField.asString := AValue;
            end;
        end;
    end;
end;

procedure DoURLClick( Sender: TObject );
var
  AStr:String;
begin
//  if (Sender is TDBEdit) then with Sender as TDBEdit do
//    AStr := Text
//  else if (Sender is TUniDBGrid) then with Sender as TUniDBGrid do
//    AStr := DataSource.DataSet.FieldByName(Columns[ SelectedIndex ].FieldName).asString;
//  else if (Sender is TwwDBGrid) then with Sender as TwwDBGrid do
//    AStr := DataSource.DataSet.FieldByName(Columns[ SelectedIndex ].FieldName).asString;

  if AStr > '' then
  (*UG_rem_AMB*)
    ExecuteProgram( AStr, SW_SHOWDEFAULT, '' );
end;

procedure DoEMailClick(Sender: TObject);
var
  AEmailAddress: String;
  AField: TField;
begin
  // Initialize
  AField := nil;
  AEmailAddress := '';
  // Get the e-mail address and TField
  if (Sender is TDBEdit) then
    begin
      AField := TDBEdit(Sender).Field;
      AEmailAddress := Trim(TDBEdit(Sender).Text);
    end
//  else if (Sender is TwwDBComboDlg) then
//    begin
//      AField := TwwDBComboDlg(Sender).Field;
//      AEmailAddress := Trim(TwwDBComboDlg(Sender).Text);
//    end
//  else if (Sender is TDBGrid) then
//    begin
//      with TDBGrid(Sender) do
//        if Assigned(DataSource) and Assigned(DataSource.DataSet) then
//          begin
//            AField := DataSource.DataSet.FieldByName
//              (Columns[SelectedIndex].FieldName);
//            if Assigned(AField) then
//              AEmailAddress := Trim(AField.asString);
//          end;
//    end
//  else if (Sender is TwwDBGrid) then
//    begin
//      with TwwDBGrid(Sender) do
//        if Assigned(DataSource) and Assigned(DataSource.DataSet) then
//          begin
//            AField := DataSource.DataSet.FieldByName
//              (Columns[SelectedIndex].FieldName);
//            if Assigned(AField) then
//              AEmailAddress := Trim(AField.asString);
//          end
//    end
  else
    Exit;

  // 02/19/2014 If there is no email address, then don't raise any errors.
  // If a field is associated with the control, then go ahead an prompt
  // for the email address.  After prompting, just populate the field
  // value and exit without doing anything.
  if (AEmailAddress = '') and Assigned(AField) then
    begin
      // Prompt for an email address
      PromptAssignEmailField(AField);
      // Don't do anything else; just exit.
      Exit;
    end;

  // Display the e-mail editor
  IQSendMailA(AEmailAddress, // recipient
    '', // subject
    '', // body text
    NIL, // attachment list
    False); // send now? (display editor)
end;

end.
