unit IQMS.Qc_Doc.qc_doc_dnet;

interface

uses
  Classes,
  StdCtrls,
  SysUtils,
  Windows;

const
   DOTNETDLL     = 'IQDocRepository';
   DOTNETCOMTYPE = 'IQMS.IQDocRepository.Engine';

{DNET object create/free}   
function CheckCreateDNetCOM( var ADotNetObject: Variant ): Boolean;
procedure CheckFreeDNetCOM( var ADotNetObject: Variant );

{Wrappers to DNET}
{connect to the server using connect string and password}
function DNET_ConnectToDataBase( ADotNetObject: Variant; AConnectString, APassword: string ): Boolean;

{update blob from file. ASourceFileName includes path+name. ATargetFileName is just a file name for doc_repository.filename}
function DNET_LoadFromFile( ADotNetObject: Variant; ADoc_Repository_ID: Real; ASourceFileName: string; ATargetFileName: string ): Boolean;

{update PDF blob from file. ASourceFileName includes path+name}
function DNET_LoadFromPDF( ADotNetObject: Variant; ADoc_Repository_ID: Real; ASourceFileName: string ): Boolean;

{dump blob to file. ATargetFileName includes path+name}
function DNET_SaveToFile( ADotNetObject: Variant; ADoc_Repository_ID: Real; ATargetFileName: string ): Boolean; 

{dump PDF blob to file. ATargetFileName includes path+name}
function DNET_SaveToPDF( ADotNetObject: Variant; ADoc_Repository_ID: Real; ATargetFileName: string ): Boolean;

{create new record in doc_repository and update blob from file. ASourceFileName includes path+name. ATargetFileName is just a file name for doc_repository.filename}
function DNET_AppendFromFile( ADotNetObject: Variant;  ADoc_Library_ID, AExternal_Doc_ID: Real; var ATraget_Doc_Repository_ID: Real; ASourceFileName: string; ATargetFileName: string ): Boolean;
         
{duplicate doc_repository record and return new record doc_repository.id}
function DNET_Copy( ADotNetObject: Variant; ASource_Doc_Repository_ID: Real; ATargetFileName: string; var ATarget_Doc_Repository_ID: Real ): Boolean;

{update doc_repository.filename}
function DNET_UpdateFileName( ADotNetObject: Variant; ADoc_Repository_ID: Real; AFileName: string ): Boolean;

{update hist field}
function DNET_UpdateHistFlag( ADotNetObject: Variant; ADoc_Repository_ID: Real; AValue: string ): Boolean;

{delete doc_repository record}
function DNET_Delete( ADotNetObject: Variant; ADoc_Repository_ID: Real ): Boolean;

{check if .net is connected to the database}
function DNET_IsConnected( ADotNetObject: Variant ): Boolean;

{get version #}         
function DNET_GetVersion( ADotNetObject: Variant ): string;
function DNET_RecordExists( ADotNetObject: Variant; ADoc_Repository_ID: Real ): Boolean;
         
{build index}
procedure DNET_BuildExternalIndex( ADoc_Library_ID: Real; AIndexPath, AOraAlias, AUser, APassword: string; AIsSilentReindex: Boolean );
procedure DNET_BuildKnowledgeCenterIndex( AOraAlias, AUser, APassword: string );
function DNET_BuildRepositoryIndex( ADotNetObject: Variant; ADoc_Library_ID: Real; AIndexPath: string; AIsSilentReindex: Boolean  ): Boolean;

{delete all records associated with external_doc_id}
function DNET_Delete_Document_Revisions( ADotNetObject: Variant; AExternal_Doc_ID: Real ): Boolean;
         
              
implementation

uses
  IQMS.Common.DotNetCOMInterOp,
  Variants,
  IQMS.Common.Miscellaneous,
  IQMS.Common.ErrorDialog;

var
  CW: Word;
  
procedure ReportError( E: Exception; AProcName, ADetail: string; ADoAbort: Boolean = True ); forward;
  
{------------------------------------------------------------------------------}
{creation of the dnet object}
function CheckCreateDNetCOM( var ADotNetObject: Variant ): Boolean;                    
begin
  Result:= TRUE;
  if VarIsEmpty( ADotNetObject ) then
  try
    DisableFPUExceptions( CW );
    try
      CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );
    except on E: Exception do
      begin
        Result:= FALSE;
        // Application.ShowException(E);
        ReportError( E, 
                     'CheckCreateDNetCOM',
                     '');
      end;
    end;
  finally
    RestoreFPU( CW );
  end;
end;

procedure CheckFreeDNetCOM( var ADotNetObject: Variant );
begin
  if not VarIsEmpty( ADotNetObject ) then
  try
    DisableFPUExceptions( CW );
    FreeDNetObject( ADotNetObject );
  finally
    RestoreFPU( CW );
  end;
end;

function DNET_ConnectToDataBase( ADotNetObject: Variant; AConnectString, APassword: string ): Boolean;
begin
  DisableFPUExceptions( CW );
  try
    try
      ADotNetObject.ConnectToDataBase( AConnectString, 'IQMS', APassword );
      Result:= ADotNetObject.IsConnected;
    except on E: Exception do
      begin
        Result:= FALSE;

        if IsConsole then
          raise;

        // Application.ShowException(E);
        ReportError( E, 
                     'DNET_ConnectToDataBase',
                     '',
                     False );
      end; 
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


{------------------------------------------------------------------------------}
{wrappers}
function DNET_LoadFromFile( ADotNetObject: Variant; ADoc_Repository_ID: Real; ASourceFileName {full path and name}: string; ATargetFileName: string ): Boolean;
begin
  Result:= FALSE;
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.LoadFromFile( ADoc_Repository_ID, ASourceFileName, ATargetFileName );
      Result:= TRUE;
    except on E: Exception do
      //Application.ShowException(E);
      ReportError( E, 
                   'DNET_LoadFromFile',
                   Format('Doc_Repository_ID = %.0f, SourceFileName = ''%s'', TargetFileName = ''%s''', [ ADoc_Repository_ID, ASourceFileName, ATargetFileName ]));
    end;
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_LoadFromPDF( ADotNetObject: Variant; ADoc_Repository_ID: Real; ASourceFileName: string ): Boolean;
begin
  Result:= FALSE;
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.LoadFromPDF( ADoc_Repository_ID, ASourceFileName );
      Result:= TRUE;
    except on E: Exception do
      //Application.ShowException(E);
        ReportError( E, 
                     'DNET_LoadFromPDF',
                     Format('Doc_Repository_ID = %.0f, SourceFileName = ''%s''', [ ADoc_Repository_ID, ASourceFileName ]));
    end;
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_SaveToFile( ADotNetObject: Variant; ADoc_Repository_ID: Real; ATargetFileName: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.SaveToFile( ADoc_Repository_ID, ATargetFileName );
      Result:= TRUE;
    except on E: Exception do
      begin
        if IsConsole then
          raise;

        // Application.ShowException(E);
        ReportError( E, 
                     'DNET_SaveToFile',
                     Format('Doc_Repository_ID = %.0f, TargetFileName = ''%s''', [ ADoc_Repository_ID, ATargetFileName ]));
      end; 
    end;
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_SaveToPDF( ADotNetObject: Variant; ADoc_Repository_ID: Real; ATargetFileName: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;

  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.SaveToPDF( ADoc_Repository_ID, ATargetFileName );
      Result:= TRUE;
    except on E: Exception do
      begin
        if IsConsole then
          raise;

        // Application.ShowException(E);
        ReportError( E, 
                     'DNET_SaveToPDF',
                     Format('Doc_Repository_ID = %.0f, TargetFileName = ''%s''', [ ADoc_Repository_ID, ATargetFileName ]));
      end;
    end;
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_AppendFromFile( ADotNetObject: Variant;  ADoc_Library_ID, AExternal_Doc_ID: Real; var ATraget_Doc_Repository_ID: Real; ASourceFileName: string; ATargetFileName: string ): Boolean;
var
  AID: integer;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      AID:= ADotNetObject.AppendFromFile( ADoc_Library_ID, AExternal_Doc_ID, ASourceFileName, ATargetFileName );
      ATraget_Doc_Repository_ID:= AID;
      Result:= AID > 0;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_AppendFromFile',
                   Format('Doc_Library_ID = %.0f, External_Doc_ID = %.0f, SourceFileName = ''%s''', [ ADoc_Library_ID, AExternal_Doc_ID, ASourceFileName ]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_Copy( ADotNetObject: Variant; ASource_Doc_Repository_ID: Real; ATargetFileName: string; var ATarget_Doc_Repository_ID: Real ): Boolean;
var
  AID: integer;
begin                  
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then  EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      AID:= ADotNetObject.Copy( ASource_Doc_Repository_ID, ATargetFileName );
      ATarget_Doc_Repository_ID:= AID;
      Result:= AID > 0;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_Copy',
                   Format('Source_Doc_Repository_ID = %.0f, TargetFileName = ''%s''', [ ASource_Doc_Repository_ID, ATargetFileName ]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_UpdateFileName( ADotNetObject: Variant; ADoc_Repository_ID: Real; AFileName: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.UpdateFileName( ADoc_Repository_ID, AFileName );
      Result:= TRUE;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_UpdateFileName',
                   Format('Doc_Repository_ID = %.0f, FileName = ''%s''', [ ADoc_Repository_ID, AFileName ]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_UpdateHistFlag( ADotNetObject: Variant; ADoc_Repository_ID: Real; AValue: string ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      Result:= ADotNetObject.UpdateHistFlag( ADoc_Repository_ID, AValue );
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_UpdateHistFlag',
                   Format('Doc_Repository_ID = %.0f', [ ADoc_Repository_ID]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_Delete( ADotNetObject: Variant; ADoc_Repository_ID: Real ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.Delete( ADoc_Repository_ID );
      Result:= TRUE;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_Delete',
                   Format('Doc_Repository_ID = %.0f', [ ADoc_Repository_ID]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_IsConnected( ADotNetObject: Variant ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );         
  try
    try
      if ADotNetObject.IsConnected then
         Result:= TRUE;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_IsConnected',
                   '');
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


function DNET_GetVersion( ADotNetObject: Variant ): string;
begin
  Result:= 'N/A';
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );         
  try
    try
      if ADotNetObject.IsConnected then
         Result:= ADotNetObject.GetVersion;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_GetVersion',
                   '');
    end;        
  finally
    RestoreFPU( CW );
  end;
end;
 

function DNET_RecordExists( ADotNetObject: Variant; ADoc_Repository_ID: Real ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      Result:= ADotNetObject.RecordExists( ADoc_Repository_ID );
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_RecordExists',
                   Format('Doc_Repository_ID = %.0f', [ ADoc_Repository_ID]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;
 

function DNET_BuildRepositoryIndex( ADotNetObject: Variant; ADoc_Library_ID: Real; AIndexPath: string; AIsSilentReindex: Boolean ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.ShowProgressBar:= not AIsSilentReindex;
      ADotNetObject.BuildRepositoryIndex( ADoc_Library_ID, AIndexPath );
      Result:= TRUE;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_BuildRepositoryIndex',
                   Format('Doc_Library_ID = %.0f, IndexPath = %s', [ ADoc_Library_ID, AIndexPath ]));
    end;  
  finally
    RestoreFPU( CW );
  end;
end;


procedure DNET_BuildExternalIndex( ADoc_Library_ID: Real; AIndexPath, AOraAlias, AUser, APassword: string; AIsSilentReindex: Boolean );
var
  oDNET: Variant;
begin
  if not CheckCreateDNetCOM( oDNET ) then     {qc_doc_net.pas}
    EXIT;

  DisableFPUExceptions( CW );
  try
    oDNET.ConnectToDataBase( AOraAlias, AUser, APassword );
    if oDNET.IsConnected then
    try
      oDNET.ShowProgressBar:= not AIsSilentReindex;
      oDNET.BuildExternalIndex( ADoc_Library_ID, AIndexPath );
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 
                   'DNET_BuildExternalIndex',
                   Format('Doc_Library_ID = %.0f, IndexPath = %s, OraAlias = %s, User = %s', [ ADoc_Library_ID, AIndexPath, AOraAlias, AUser ]));
    end;     
  finally
    CheckFreeDNetCOM( oDNET );
  end;
end;


procedure DNET_BuildKnowledgeCenterIndex( AOraAlias, AUser, APassword: string );
var                                          
  oDNET: Variant;
begin
  if not CheckCreateDNetCOM( oDNET ) then     {qc_doc_net.pas}
    EXIT;

  DisableFPUExceptions( CW );
  try
    try
      oDNET.ConnectToDataBase( AOraAlias, AUser, APassword );
      oDNET.RebuildKnowledgeCenter;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 'DNET_BuildKnowledgeCenterIndex', Format('OraAlias = %s, User = %s', [ AOraAlias, AUser ]));
    end; 
  finally
    CheckFreeDNetCOM( oDNET );
  end;
end;


function DNET_Delete_Document_Revisions( ADotNetObject: Variant; AExternal_Doc_ID: Real ): Boolean;
begin
  Result:= FALSE;
  if VarIsEmpty( ADotNetObject ) then EXIT;
  
  DisableFPUExceptions( CW );
  try
    if ADotNetObject.IsConnected then
    try
      ADotNetObject.DeleteDocumentRevisions( AExternal_Doc_ID );
      Result:= TRUE;
    except on E: Exception do
      // Application.ShowException(E);
      ReportError( E, 'DNET_Delete_Document_Revisions', Format('External_Doc_ID = %.0f', [AExternal_Doc_ID]));
    end;              
  finally
    RestoreFPU( CW );
  end;
end;

procedure ReportError( E: Exception; AProcName, ADetail: string; ADoAbort: Boolean = True );
begin
  ShowIQErrorMessage( Format('An error encountered calling %s procedure ''%s''', [ DOTNETDLL,  AProcName ]),
                      E.Message,
                      ADetail,
                      ADoAbort );
end;

end.
 
