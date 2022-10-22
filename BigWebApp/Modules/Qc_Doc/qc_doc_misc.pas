unit qc_doc_misc;

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
  ExtCtrls;

  procedure check_del_doc_used( ASource: string; ASource_ID: Real );

type
  TExternalDocumentFileReference = class
    FExternal_Doc_ID : Real;
    FLibPath         : string;
    FFileName        : string;
    FIsDispPDF       : Boolean;
    FStatus          : string;
    FIsKeepRev       : Boolean;
    FDoc_Revision_ID : Real;
    FIsRepository    : Boolean;
    FResultFileName  : string;
    FExceptionMesg   : string;
    FDNetRepository  : Variant;
    FRepositoryAlias : string;
    FRepositoryData  : string;
    FRevisionPath    : string;
    FKeepRevisions   : Boolean;

    function CheckUseConvertPDFRedirectFileName( AOriginalFileName: string ): string;
    function GetPdfFileName( AFileName: string ): string;
    function SaveRepositoryToLocalFile( var AFileName: string; APrev_Doc_Revision_ID: Real ): Boolean;

    constructor Create( AExternal_Doc_ID: Real );
    function Execute: Boolean;
  private
    function FindPreviousVerFullFileName(var APrevFileName: string): Boolean;
  end;

implementation

uses
  IQMS.Common.DataLib,
  Variants,
  IQMS.Qc_Doc.qc_doc_const,
  IQMS.Qc_Doc.qc_doc_share,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Miscellaneous,
  IQMS.Qc_Doc.qc_doc_dnet;

procedure check_del_doc_used( ASource: string; ASource_ID: Real );
begin
  ExecuteCommandFmt('begin qc_doc_misc.check_del_doc_used( ''%s'', %f ); end;', [ ASource, ASource_ID ]);
end;


{ TExternalDocumentFileReference }

constructor TExternalDocumentFileReference.Create( AExternal_Doc_ID: Real );
var
  A: Variant;
begin
  FExternal_Doc_ID:= AExternal_Doc_ID;

  A:= SelectValueArrayFmt('select lib_path, filename, convert_to_pdf_display, status, keep_revisions, doc_revision_id, type, '+
                     '       repository_alias, repository_data, revision_path, keep_revisions                           '+
                     ' from v_external_docs where external_doc_id = %f',
                     [ AExternal_Doc_ID ]);
  if VarArrayDimCount( A ) = 0 then  {s/n happen}
     EXIT;

  FLibPath         := A[ 0 ];
  FFileName        := A[ 1 ];
  FResultFileName  := A[ 1 ];
  FIsDispPDF       := A[ 2 ] = 'Y';
  FStatus          := A[ 3 ];
  FIsKeepRev       := A[ 4 ] = 'Y';
  FDoc_Revision_ID := A[ 5 ];
  FIsRepository    := CompareText( A[ 6 ], 'Repository' ) = 0;
  FRepositoryAlias := A[ 7 ];
  FRepositoryData  := A[ 8 ];
  FKeepRevisions   := A[ 9 ] = 'Y';
end;

function TExternalDocumentFileReference.GetPdfFileName( AFileName: string ): string;
begin
  Result:= ChangeFileExt( AFileName, '.PDF' );
end;

function TExternalDocumentFileReference.CheckUseConvertPDFRedirectFileName( AOriginalFileName: string ): string;
begin
  Result:= AOriginalFileName;
  if FIsDispPDF and FileExists( GetPdfFileName( AOriginalFileName )) then
     Result:= GetPdfFileName( AOriginalFileName );
end;

function TExternalDocumentFileReference.Execute: Boolean;
begin
  Result:= FALSE;

  FResultFileName:= CheckUseConvertPDFRedirectFileName( FResultFileName );

  {Default lib}
//  if not FIsRepository and (Trim(FLibPath) = '') then
//     EXIT;

  {special state - pending status}
  if  ((FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_PENDING)
     or
       (FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_AUTHORIZED)
     or
       (FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_CHECKED_OUT )
     or
       (FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_NEW )) then
  begin
    if not FIsKeepRev then
    begin
      FExceptionMesg:= 'The document is in the Pending Review/Authorization stage.'#13'Unable to proceed';
      EXIT;
    end;

    if not FindPreviousVerFullFileName( FResultFileName ) then
    begin
      FExceptionMesg:= 'No previous version was found – unable to proceed.'#13'Document must have ''Released'' status.';
      EXIT;
    end;

    EXIT;
  end;

  {all others}
  if FIsRepository then
     begin
       if not SaveRepositoryToLocalFile( FResultFileName, FDoc_Revision_ID ) then
          EXIT
     end
  else
     begin
       if Trim(FLibPath) = '' then
         FResultFileName:= FFileName
       else
         FResultFileName:= IncludeTrailingPathDelimiter( FLibPath ) + FFileName;
       FResultFileName:= CheckUseConvertPDFRedirectFileName( FResultFileName );
     end;

  Result:= FileExists( FResultFileName );
end;

function TExternalDocumentFileReference.SaveRepositoryToLocalFile( var AFileName: string; APrev_Doc_Revision_ID: Real ): Boolean;
var
  ADoc_Repository_ID: Real;
begin
  Result:= FALSE;

  ADoc_Repository_ID:= SelectValueByID('doc_repository_id', 'doc_revision', APrev_Doc_Revision_ID );

  if ADoc_Repository_ID = 0 then
  begin
    FExceptionMesg:= 'Repository record ID is not assigned';
    EXIT;
  end;

  if not IQMS.Qc_Doc.qc_doc_share.EstablishRepositoryAccess( FDNetRepository, FRepositoryAlias, CharXor(FRepositoryData)) then
  begin
    FExceptionMesg:= 'Unable to establish repository access';
    EXIT;
  end;

  {store the repository file in a temp folder c:\iqwin\temp\arik\123.txt}
  if (SecurityManager <> nil) then
     AFileName:= Format('%s\temp\%s\%s', [ ExcludeTrailingBackslash( IQGetLocalHomePath ), SecurityManager.UserName, AFileName ])
  else
     AFileName:= Format('%s\temp\%s', [ ExcludeTrailingBackslash( IQGetLocalHomePath ), AFileName ]);

  IQMS.Qc_Doc.qc_doc_share.AssignFileReadOnly( AFileName, FALSE {readonly});

  case FIsDispPDF of
    TRUE:  begin
             if not IQMS.Qc_Doc.qc_doc_dnet.DNET_SaveToPDF( FDNetRepository, ADoc_Repository_ID, GetPdfFileName( AFileName )) then
             begin
               FExceptionMesg:= 'Unable to save PDF blob repository to a temp pdf file';
               EXIT;
             end;

             Result:= FileExists( GetPdfFileName( AFileName ));
             if Result then
                AFileName:= GetPdfFileName( AFileName );
           end;

    FALSE: begin
             if not IQMS.Qc_Doc.qc_doc_dnet.DNET_SaveToFile( FDNetRepository, ADoc_Repository_ID, AFileName ) then
             begin
               FExceptionMesg:= 'Unable to save a blob repository to a temp file';
               EXIT;
             end;

             Result:= FileExists( AFileName );
           end;
  end;
end;

function TExternalDocumentFileReference.FindPreviousVerFullFileName( var APrevFileName: string ): Boolean;
var
  APrev_Doc_Revision_ID: Real;
begin
  Result:= FALSE;

  {Ensure pending state}
  if not ( (( FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_PENDING)
            or
            ( FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_AUTHORIZED)
            or
            ( FStatus = IQMS.Qc_Doc.qc_doc_const.QC_DOC_CHECKED_OUT))

          and
            ( FIsRepository or (Trim( FRevisionPath ) > ''))

          and
            ( FKeepRevisions )) then
    EXIT;

  {Previous revison}
  APrev_Doc_Revision_ID:= SelectValueFmtAsFloat('select max(id) from doc_revision where external_doc_id = %f and hist = ''Y''', [ FExternal_Doc_ID ]);
  if APrev_Doc_Revision_ID = 0 then
     EXIT;

  {File name}
  APrevFileName:= SelectValueByID('filename', 'doc_revision', APrev_Doc_Revision_ID );

  if APrevFileName > '' then
  begin
    if FIsRepository then
       SaveRepositoryToLocalFile( APrevFileName, APrev_Doc_Revision_ID )
    else
       begin
         APrevFileName:= IncludeTrailingPathDelimiter( FRevisionPath ) + ExtractFileName( APrevFileName );
         APrevFileName:= CheckUseConvertPDFRedirectFileName( APrevFileName );
       end;
  end;

  Result:= TRUE;
end;



end.
