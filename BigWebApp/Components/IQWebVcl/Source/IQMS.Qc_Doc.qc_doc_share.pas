unit IQMS.Qc_Doc.qc_doc_share;

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
  IQMS.Common.DataConst;

procedure IQDocIncrementSemaphore( var ALockHandle: string; ALockName: string );
procedure IQDocDecrementSemaphore( ALockHandle: string );

function IsFileInFolder( AFileName, AFolder: string ): Boolean;
function IsSameFiles( AFileName1, AFileName2: string ): Boolean;
function IsSameFileNameDifferentFolders( AFileName1, AFileName2: string ): Boolean;
procedure AddDocLog( AExternal_Doc_ID, ADoc_Revision_ID: Real; ANote: string; AInOut: string; AName: string; ADataBaseName: string = cnstFDConnectionName );

function EnsureDefaultLibraryIDExists: Real;
function IsDocControlLicensed: Boolean;

function EstablishRepositoryAccess( var oDNET: Variant; AAlias, APassword: string; AKeepObjectReference: Boolean = TRUE ): Boolean;
procedure EstablishRepositoryAccessEx( var oDNET: Variant; AAlias, APassword: string );

procedure CheckLibraryTeamMembersOnly( ADoc_Library_ID: Real; AIsAccessOnlyEnough: Boolean = TRUE );
procedure AssignFileReadOnly( AFileName: string; IsRO: Boolean );

function FindExternalDocumentByFileName( ADoc_Revision_ID: Real; APath, AFileName: string ): Real;
function FindExternalDocumentByFileNameInLibrary( ADoc_Library_ID: Real; AFileName: string ): Real;

function GetRevisionTitle( ARevision_ID: Real ): string;
function CanAccessLibrary( ADoc_Library_ID: Real ): Boolean;

function GetRegisteredExternalDocID(const ADoc_Library_ID: Real;
  const AFileName: string ): Real;
function DocumentLibraryPath(const ADoc_Library_ID: Real): string;

function AllowAccessToLibraryTeamMembersOnly( ADoc_Library_ID: Real; AIsAccessOnlyEnough: Boolean = TRUE ): Boolean;

function GetDocMaintUserDefinedLabelCaption(const AFieldName: string;
 const ADocumentLibraryID: Int64): string;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Numbers,
  IQMS.Common.Locks,
  IQMS.Common.Dialogs,
  IQMS.Common.Applications,
  IQMS.Qc_Doc.qc_doc_dnet,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.Qc_Doc.qc_doc_const;

function IsFileInFolder( AFileName, AFolder: string ): Boolean;
var
  AFilePath: string;
  AFolderPath: string;
begin
  AFilePath  := ExtractFilePath( ExpandUNCFileName( AFileName ));
  AFolderPath:= IncludeTrailingBackslash( AFolder );

  Result:= CompareText( AFilePath, AFolderPath ) = 0;
end;

function IsSameFiles( AFileName1, AFileName2: string ): Boolean;
var
  APath1: string;
  APath2: string;
  AFile1: string;
  AFile2: string;
begin
  APath1:= ExtractFilePath( ExpandUNCFileName( AFileName1 ));
  APath2:= ExtractFilePath( ExpandUNCFileName( AFileName2 ));

  AFile1:= ExtractFileName( AFileName1 );
  AFile2:= ExtractFileName( AFileName2 );

  Result:= (CompareText( APath1, APath2 ) = 0) and (CompareText( AFile1, AFile2 ) = 0);
end;

function IsSameFileNameDifferentFolders( AFileName1, AFileName2: string ): Boolean;
var
  APath1: string;
  APath2: string;
  AFile1: string;
  AFile2: string;
begin
  APath1:= ExtractFilePath( ExpandUNCFileName( AFileName1 ));
  APath2:= ExtractFilePath( ExpandUNCFileName( AFileName2 ));

  AFile1:= ExtractFileName( AFileName1 );
  AFile2:= ExtractFileName( AFileName2 );

  Result:= (CompareText( APath1, APath2 ) <> 0) and (CompareText( AFile1, AFile2 ) = 0);
end;

procedure AddDocLog( AExternal_Doc_ID, ADoc_Revision_ID: Real; ANote: string; AInOut: string; AName: string; ADataBaseName: string = cnstFDConnectionName );
begin
  if ANAme = '' then
     AName:= SelectValueFmtAsString('select t.name from team_member t, external_doc d where d.id = %f and d.team_member_id = t.id', [ AExternal_Doc_ID ], ADataBaseName);
  if AName = '' then
     AName:= SecurityManager.UserName;

  ExecuteCommandFmt('insert into doc_log( external_doc_id, doc_revision_id, trans_date, trans_in_out, name, change_note ) '+
            'values( %f, %s, sysdate, ''%s'', ''%s'', ''%s'')',
            [ AExternal_Doc_ID,
              IIf( ADoc_Revision_ID = 0, 'NULL', FloatToStr( ADoc_Revision_ID )),
              AInOut,
              AName,
              IQMS.Common.StringUtils.FixStr( ANote )],
            ADataBaseName);
end;

procedure IQDocIncrementSemaphore( var ALockHandle: string; ALockName: string );
begin
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'DB_DataModule'
  with DB_DataModule do
    if not AcquireIQLock( ALockHandle, ALockName, IQLOCK_SHARED ) then
    begin
      ALockHandle:= '';
      raise Exception.Create('Failed to acquire shared lock.'#13#13'''Update Doc Library Header'' process is currently in progress. Please try again later');
    end;
  }
end;

procedure IQDocDecrementSemaphore( ALockHandle: string );
var
  S:string;
begin
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'DB_DataModule'
  with DB_DataModule do
    if ALockHandle > '' then
    begin
      S:= IQUnLock( ALockHandle );
      if S <> '' then
         IQWarning( S + ' - Unable to unlock existing lock. Terminate to allow other users to run the same applicaiton');
    end;
    }
end;

function EnsureDefaultLibraryIDExists: Real;
var
  ALockHandle: string;
begin
  Result:= SelectValueAsFloat('select id from doc_library where upper(descrip) = ''DEFAULT LIBRARY''');
  if Result > 0 then
     EXIT;

  IQDocIncrementSemaphore( ALockHandle, IQMS_DOC_LIBRARY );
  try
    Result:= SelectValueAsFloat('select id from doc_library where upper(descrip) = ''DEFAULT LIBRARY''');
    if Result = 0 then
    begin
      Result:= SelectValueAsFloat('select s_doc_library.nextval from dual');
      ExecuteCommandFmt('insert into doc_library(id, descrip, type ) '+
                'values( %f, ''Default Library'', ''No Restriction'')', [ Result ]);
    end;
  finally
     IQDocDecrementSemaphore( ALockHandle );
  end;
end;

function IsDocControlLicensed: Boolean;
begin
  if (SecurityManager <> nil) then
     Result:= SecurityManager.SetVisibleIfLicensed( NIL {sbtn}, NIL{menu}, NIL{sep}, IQAppsNames[ apIQDoc ], NIL )
  else
     Result:= TRUE;
end;


function EstablishRepositoryAccess( var oDNET: Variant; AAlias, APassword: string; AKeepObjectReference: Boolean = TRUE ): Boolean;
begin
  try
    Result:= FALSE;

    if not CheckCreateDNetCOM( oDNET ) then                                     {qc_doc_net.pas}
    begin
      IQError(Format('Unable to create .NET object of type ''%s'' necessary to access database repository.', [ DOTNETCOMTYPE ]));
      EXIT;
    end;

    if not DNET_ConnectToDataBase( oDNET, AAlias, APassword ) then              {qc_doc_net.pas}
    begin
      IQError('Unable to establish connection to the remote database. Ensure remote instance is started, check DB alias, password and try again');
      EXIT;
    end;

  finally
    if not AKeepObjectReference then
       CheckFreeDNetCOM( oDNET );                                               {qc_doc_net.pas}
  end;

  Result:= TRUE;
end;

procedure EstablishRepositoryAccessEx( var oDNET: Variant; AAlias, APassword: string );
begin
  IQAssert( CheckCreateDNetCOM( oDNET ),                                     {qc_doc_net.pas}
            Format('Unable to create .NET object of type ''%s'' necessary to access database repository.', [ DOTNETCOMTYPE ]));

  IQAssert( DNET_ConnectToDataBase( oDNET, AAlias, APassword ),              {qc_doc_net.pas}
            'Unable to establish connection to the remote database. Ensure remote instance is started, check DB alias, password and try again');
end;


procedure CheckLibraryTeamMembersOnly( ADoc_Library_ID: Real; AIsAccessOnlyEnough: Boolean = TRUE );
begin
  IQAssert( AllowAccessToLibraryTeamMembersOnly( ADoc_Library_ID, AIsAccessOnlyEnough ),
            'Document access or modification is restricted to library team members only!' );
end;


function AllowAccessToLibraryTeamMembersOnly( ADoc_Library_ID: Real; AIsAccessOnlyEnough: Boolean = TRUE ): Boolean;
var
  AFlag: Real;
begin
  Result:= TRUE;

  if SelectValueByID('team_member_only', 'doc_library', ADoc_Library_ID) <> 'Y' then
     EXIT;

  if SelectValueFmtAsFloat('select count(*) from doc_team where doc_library_id = %f', [ ADoc_Library_ID ]) = 0 then
     EXIT;

   if (SecurityManager <> nil) and (SecurityManager.IsUserIQMS or SecurityManager.IsUserDBA) then
     EXIT;

   if AIsAccessOnlyEnough then
      AFlag:= SelectValueFmtAsFloat('select 1 from doc_team t, team_member m where t.doc_library_id = %f and t.team_member_id = m.id and m.userid = ''%s''',
                        [ ADoc_Library_ID,
                          UpperCase(SecurityManager.UserName) ])
   else
      AFlag:= SelectValueFmtAsFloat('select 1 from doc_team t, team_member m where t.doc_library_id = %f and t.team_member_id = m.id and m.userid = ''%s'' '+
                        '   and rtrim(upper(t.type)) in (''AUTHORIZE'', ''REVIEW'')',
                        [ ADoc_Library_ID,
                          UpperCase(SecurityManager.UserName) ]);

   Result:= AFlag = 1;
end;


procedure AssignFileReadOnly( AFileName: string; IsRO: Boolean );
var
  Attrs: Integer;
begin
  if not FileExists( AFileName ) then EXIT;

  Attrs:= FileGetAttr( AFileName );

  try
    if IsRO then
       begin
         if (Attrs and SysUtils.faReadOnly) = 0 then
            IQAssert( FileSetAttr(AFileName, Attrs + SysUtils.faReadOnly) > -1, 'Error Code = ' + FloatToStr( GetLastError ));
       end
    else
       begin
         if (Attrs and SysUtils.faReadOnly) <> 0 then
            IQAssert( FileSetAttr(AFileName, Attrs - SysUtils.faReadOnly) > -1, 'Error Code = ' + FloatToStr( GetLastError ));
       end
  except on E: Exception do
    raise Exception.CreateFmt('Unable to assign file %s ReadOnly property to %s.'#13'%s',
                              [ AFileName,
                                IIf( IsRO, 'True', 'False'),
                                E.Message ]);
  end;
end;


function FindExternalDocumentByFileName( ADoc_Revision_ID: Real; APath, AFileName: string ): Real;
begin
  APath:= FixStr(APath);
  AFileName:= ExtractFileName(AFileName);
  Result:= SelectValueFmtAsFloat('select ext.id                                    '+
                     '  from doc_revision doc,                         '+
                     '       external_doc ext,                         '+
                     '       doc_library lib                           '+
                     ' where upper(doc.filename) = ''%s''              '+
                     '   and NVL(doc.hist, ''N'') = ''N''              '+
                     '   and doc.id <> %f                              '+
                     '   and doc.external_doc_id = ext.id              '+
                     '   and ext.doc_library_id = lib.id               '+
                     '   and NVL(lib.path, ''*'') = NVL(''%s'', ''*'') ',
                     [ UpperCase(Trim(StrTran(AFileName, '''', ''''''))),
                       ADoc_Revision_ID,
                       APath ]);
end;

function FindExternalDocumentByFileNameInLibrary( ADoc_Library_ID: Real; AFileName: string ): Real;
var
  ALibPath: string;
begin
  ALibPath:= SelectValueByID('path', 'doc_library', ADoc_Library_ID);
  if ALibPath > '' then
     AFileName:= ExtractFileName(AFIleName);

  Result:= SelectValueFmtAsFloat('select ext.id                                    '+
                     '  from doc_revision doc,                         '+
                     '       external_doc ext,                         '+
                     '       doc_library lib                           '+
                     ' where upper(doc.filename) = ''%s''              '+
                     '   and NVL(doc.hist, ''N'') = ''N''              '+
                     '   and doc.external_doc_id = ext.id              '+
                     '   and ext.doc_library_id = lib.id               '+
                     '   and lib.id = %f                               ',
                     [ UpperCase(Trim(StrTran(AFileName, '''', ''''''))),
                       ADoc_Library_ID ]);
end;


function GetRevisionTitle( ARevision_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString('select ''Document "'' || rtrim(d.descrip) || ''", Rev: '' || rtrim(r.revision) '+
                        '  from doc_revision r, external_doc d       '+
                        'where r.id = %f and r.external_doc_id = d.id',
                        [ ARevision_ID ]);
end;


function CanAccessLibrary( ADoc_Library_ID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select qc_doc_misc.can_access_library( %f, ''%s'' ) from dual', [ ADoc_Library_ID, UpperCase(SecurityManager.UserName) ]) = 1;
end;

function GetRegisteredExternalDocID(const ADoc_Library_ID: Real;
  const AFileName: string ): Real;

  function _Get(const AValue: string): Real;
  begin
    Result := SelectValueFmtAsFloat(
      'select d.id from external_doc d, doc_revision r                    '#13 +
      ' where d.doc_library_id = %.0f                                     '#13 +
      '   and r.external_doc_id = d.id                                    '#13 +
      '   and NVL(r.hist, ''N'') = ''N''                                  '#13 +
      '   and upper(r.filename) = ''%s''                                  ',
      [ADoc_Library_ID, FixStr(UpperCase(AValue))]);
  end;

begin
  if DocumentLibraryPath( ADoc_Library_ID ) > '' then
    Result := _Get(ExtractFileName(AFileName))
  else
    begin
      Result := _Get(AFileName);

      if (Result = 0) then
        Result := _Get(ExtractFileName(AFileName));
    end;
end;

function DocumentLibraryPath(const ADoc_Library_ID: Real): string;
begin
  Result := SelectValueByID('path', 'doc_library', ADoc_Library_ID );
end;

function GetDocMaintUserDefinedLabelCaption(const AFieldName: string;
  const ADocumentLibraryID: Int64): string;
const
  cAppExe = 'IQQC.EXE';
  cForm = 'FrmQCDocMaint';
begin
  if CompareText(AFieldName, 'CUSER1') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid1_%d',
      [ADocumentLibraryID]),
      'User Text 1')
  else if CompareText(AFieldName, 'CUSER2') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid2_%d',
      [ADocumentLibraryID]),
      'User Text 2')
  else if CompareText(AFieldName, 'CUSER3') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid3_%d',
      [ADocumentLibraryID]),
      'User Text 3')
  else if CompareText(AFieldName, 'CUSER4') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid4_%d',
      [ADocumentLibraryID]),
      'User Text 4')
  else if CompareText(AFieldName, 'CUSER5') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid5_%d',
      [ADocumentLibraryID]),
      'User Text 5')
  else if CompareText(AFieldName, 'CUSER6') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid6_%d',
      [ADocumentLibraryID]),
      'User Text 6')
  else if CompareText(AFieldName, 'CUSER7') = 0 then
    Result := IQGetUDCaption(
      cAppExe,
      cForm,
      Format('IQUserDefLabelOnGrid7_%d',
      [ADocumentLibraryID]),
      'User Text 7')
  else
    Result := '';
end;

end.
