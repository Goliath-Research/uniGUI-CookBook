unit IQMS.WebVcl.FaxMan;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  DBCtrls,
  Db;

{....$DEFINE DEBUG_ON}
  
type
  TFaxMan = class
     FRecipients : TStringList;
     FSubject    : string;
     FFrom       : string;
     FCoversheet : string;
     FCoverNote  : string;
     FLetterHead : string;
     FAttachments: TStringList;
     FText       : string;

     FXMLText    : TStringList;
     ReportTempFileName: string;
     
     procedure CreateXML;
     procedure CopyFilesToFolder( ATrg_Dir_Name: string );
     procedure ValidateRecipient( ARecipient: string );
     
     constructor Create;
     destructor Destroy; override;
     procedure AddRecipient( ATo_Name, ATo_Organization, ATo_Fax: string );
     procedure AddAttachment( AFileName: string; AMoveOnSubmit: Boolean = FALSE );
     function SubmitXML: Boolean;
     class function GetPollPath: string;
  end;        

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  FileCtrl,
  IQMS.Common.DataLib,
  IQMS.WebVcl.ResourceStrings;

{ TFaxMan }

constructor TFaxMan.Create;
begin
  inherited Create;
  FRecipients := TStringList.Create;
  FAttachments:= TStringList.Create;
  FXMLText    := TStringList.Create;
  
  FCoversheet:= 'COVSHEET';  {make it default}
  ReportTempFileName:= IQGetLocalHomePath + ChangeFileExt( GetRandomName, '.pdf'); {changed to PDF on 08-12-05}
              
  {$IFDEF DEBUG_ON}
  ReportTempFileName:= IQGetLocalHomePath + 'ARIK.DOC';
  {$ENDIF}
end;

destructor TFaxMan.Destroy;
begin
  if Assigned(FRecipients) then FreeAndNil(FRecipients);
  if Assigned(FAttachments) then FreeAndNil(FAttachments);
  if Assigned(FXMLText) then FreeAndNil(FXMLText);
  inherited Destroy;
end;

procedure TFaxMan.AddRecipient( ATo_Name, ATo_Organization, ATo_Fax: string);
begin
  FRecipients.Add( Format( '%s'#9'%s'#9'%s', [ ATo_Name, ATo_Organization, ATo_Fax ]));
end;


procedure TFaxMan.AddAttachment( AFileName: string; AMoveOnSubmit: Boolean = FALSE );
var
  AFlag: Integer;
begin
  if AMoveOnSubmit then AFlag:= 1 else AFlag:= 0;
  FAttachments.AddObject( AFileName, Pointer( AFlag ));
end;

function TFaxMan.SubmitXML: Boolean;
var
  APoll_Dir_Name: string;
  ATrg_Dir_Name : string;
  ATrg_Dir_Temp : string;
begin
  {Get monitored folder path/name}
  APoll_Dir_Name:= GetPollPath;
  IQAssert( (APoll_Dir_Name > '') and DirectoryExists( APoll_Dir_Name ), Format( 'Invalid monitored fax path ''%s''', [ APoll_Dir_Name ]));
  APoll_Dir_Name:= IncludeTrailingBackslash( APoll_Dir_Name );
  
  {Create temporary target folder in the monitored subdirectory:  D:\outgoing\07_23_03 19_20_45 123.fax_temp}
  ATrg_Dir_Name:= APoll_Dir_Name + Format('%s.fax_temp', [ GetRandomName ]);
  ForceDirectories( ATrg_Dir_Name );
  
  {Create Submit.XML file}
  CreateXML;

  {Copy XML and attached files over to the temporary folder}
  CopyFilesToFolder( ATrg_Dir_Name );

  {Now when everything is copied to xxx.fax_temp - rename it to xxx.fax so IQFax could find it}
  ATrg_Dir_Temp:= ATrg_Dir_Name;
  ATrg_Dir_Name:= Copy( ATrg_Dir_Temp, 1, Length(ATrg_Dir_Temp)-5);
  if not RenameFile( ATrg_Dir_Temp, ATrg_Dir_Name ) then
     raise Exception.CreateFmt( cTXT0000096 {'Unable to rename dir %s to %s. Error Code = %d'}, [ ATrg_Dir_Temp, ATrg_Dir_Name, GetLastError ]);

end;


class function TFaxMan.GetPollPath: string;
begin
  Result:= '';
  
  if SecurityManager.EPlant_ID_AsFloat > 0 then
     Result := SelectValueFmtAsString('select fax_poll_path from eplant where id = %f', [ SecurityManager.EPlant_ID_AsFloat ]);

  if Result = '' then
     Result := SelectValueAsString('select fax_poll_path from params');
end;


procedure TFaxMan.CreateXML;
var
  I: Integer;

  procedure AddTag( ATagName, AValue: string; AType: string = '' );
  begin
    FXMLText.Add( Format( '<%s>', [ ATagName ]));
      
    if AType = 'CDATA' then
       FXMLText.Add( '<![CDATA[' );
    
    AValue:= StrTran( AValue, '&', '&amp;' );
    FXMLText.Add( AValue );

    if AType = 'CDATA' then
       FXMLText.Add( ']]>' );
      
    FXMLText.Add( Format( '</%s>', [ ATagName ]));
  end;                             
  
begin
  FXMLText.Clear;

  {Root}
  FXMLText.Add('<IQFax>');

  {From}                 
  if FFrom > '' then
     AddTag( 'From', FFrom );
  
  {Recipients}
  FXMLText.Add('<Recipients>');
  for I:= 0 to FRecipients.Count - 1 do
  begin
    ValidateRecipient( FRecipients[ I ]);
    FXMLText.Add('<Recipient>');
       AddTag( 'To',           GetToken( FRecipients[ I ], #9, 1 ));
       AddTag( 'Organisation', GetToken( FRecipients[ I ], #9, 2 ));
       AddTag( 'Fax',          GetToken( FRecipients[ I ], #9, 3 ));
    FXMLText.Add('</Recipient>');
  end;                        
  FXMLText.Add('</Recipients>');

  {Subject Line}
  AddTag( 'Subject', FSubject );

  {Coversheet}
  if not (StrInList( FCoversheet, [ 'None', '' ])) then
  begin
    AddTag( 'Coversheet', FCoversheet );
    if FCoverNote > '' then
       AddTag( 'Covernote', FCoverNote, 'CDATA' );
  end;

  {LetterHead}
  if FLetterHead > '' then
     AddTag( 'Letterhead', FLetterHead );

  {Optional Text}
  if FText > '' then
     AddTag( 'Text', FText, 'CDATA' );

  {Files attached}
  FXMLText.Add('<Files>');

  {First - the report if exists}
  if FileExists( ReportTempFileName ) then
     AddTag( 'File', ReportTempFileName );

  {Now Attachments}                                        
  for I:= 0 to FAttachments.Count - 1 do
      AddTag( 'File', FAttachments[ I ]);
  FXMLText.Add('</Files>');

  {Close}                        
  FXMLText.Add('</IQFax>');
end;

procedure TFaxMan.ValidateRecipient( ARecipient: string );
begin
  IQAssert( Trim(GetToken( ARecipient, #9, 1 )) > '', cTXT0000261 {'Missing recipient name.'});
  IQAssert( Trim(GetToken( ARecipient, #9, 3 )) > '', cTXT0000262 {'Missing recipient fax number.'});
end;

procedure TFaxMan.CopyFilesToFolder( ATrg_Dir_Name: string );
var
  I: Integer;
  Src: string;
  Trg: string;
begin
  ATrg_Dir_Name:= IncludeTrailingBackslash( ATrg_Dir_Name );

  {First - the report if exists}
  if FileExists( ReportTempFileName ) then
  begin
    Src:= ReportTempFileName;
    Trg:= ATrg_Dir_Name + ExtractFileName( Src );
    {prepare to move}
    DeleteFile( Trg );
    {move it over}
    if not MoveFile( PChar(Src), PChar(Trg)) then
       raise Exception.CreateFmt( cTXT0000097 {'Unable to move generated report file %s to %s. Error Code = %d'}, [ Src, Trg, GetLastError ]);
  end;
               
  {The attachments}
  for I:= 0 to FAttachments.Count - 1 do
  begin
    Src:= FAttachments[ I ];
    Trg:= ATrg_Dir_Name + ExtractFileName( FAttachments[ I ]);

    {check the flag to move or copy on submit}
    if LongInt(FAttachments.Objects[ I ]) = 1 then  
       {move}
       begin
         DeleteFile( Trg );
         if not MoveFile( PChar(Src), PChar(Trg)) then
            raise Exception.CreateFmt( cTXT0000265 {'Unable to move generated report file %s to %s. Error Code = %d'}, [ Src, Trg, GetLastError ]);
       end
    else
       {copy}
       begin
         if not CopyFile( PChar(Src), PChar(Trg), FALSE ) then
            raise Exception.CreateFmt( cTXT0000098 {'Unable to copy %s to %s. Error Code: %d'}, [ Src, Trg, GetLastError ]);
       end;
  end;

  {The XML file}
  FXMLText.SaveToFile( ATrg_Dir_Name + 'Submit.XML' );
end;

end.

