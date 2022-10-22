unit QC_Archive_Share;

{ ** Instructions **

  1.  Declare qc_archive_share in uses clause.

  2.  Under the File menu, add 2 menus.  Use the exact captions and object
      names as follows:

        "Archive" (Archive1)
        "Restore from Archive" (RestoreFromArchive1).

      The menus events are as follows:

      Archive1OnClick:
      qc_archive_share.QC_Archive(ADataSet);

      RestoreFromArchive1Click:
      qc_archive_share.QC_Restore(ADataSet);

      Note:  QC_Restore() contains an additional parameter, AFieldName,
             which may be used as an alternative to the default "ARCHIVED"
             field.

  3.  Under the Options menu, add 3 menus.  Use the exact captions and object
      names as follows:

        "View All" (ViewAll1),
        "View Open Only" (ViewOpenOnly1)
        "View Archived Only" (ViewArchivedOnly1)

      The menu events are as follows:

      ViewAll1:
      qc_archive_share.QC_CheckMark( Self, ViewAll1, 0 , ADataSet );

      ViewOpenOnly1:
      qc_archive_share.QC_CheckMark( Self, ViewOpenOnly1, 1, ADataSet );

      ViewArchivedOnly1:
      qc_archive_share.QC_CheckMark( Self, ViewArchivedOnly1, 2, ADataSet );

  4.  On the main datasource OnDataSourceChange event, add the following:

      if ADataSet.State = dsBrowse then
         begin
           Archive1.Enabled := qc_archive_share.QC_GetArchiveOptionEnabled( ADataSet, SR );
           RestoreFromArchive1.Enabled := qc_archive_share.QC_GetRestoreOptionEnabled( ADataSet, SR );
         end;

      Note:  These methods contain the alternative, AFieldName, parameter.

  5.  In FormCreate or the constructor, add the following to ensure the
      selected menu is initialized:

       qc_archive_share.QC_RestoreFilter( Self, ADataSet, ViewAll1,
        ViewOpenOnly1, ViewArchivedOnly1 );

  6.  Modify the main pick list SQL.  If the main dataset is a TFDQuery, this
      will also apply. Add the following to the "where" clause:

      Option 1:
        iqms.misc.pk_hide_filter(qc_process.pk_hide, :SELECTED_VIEW ) = 1

      In the, OnBeforeOpen, event of the pick list, populate the parameter
      value:

      ParamByName('SELECTED_VIEW').AsInteger := qc_archive_share.QC_MenuChoiceToInteger(
        ViewAll1, ViewOpenOnly1, ViewArchivedOnly1 ); // 0-all, 1-open, 2-archived

      Option 2:

      and (:ARCHIVE_FILTER = 0
           or
           :ARCHIVE_FILTER = 1 and NVL(archived, 'N') = 'N'
           or
           :ARCHIVE_FILTER = 2 and NVL(archived, 'N') = 'Y')

      In the, OnBeforeOpen, event of the pick list, populate the parameter
      value:

      ParamByName('ARCHIVE_FILTER').AsInteger := qc_archive_share.QC_MenuChoiceToInteger(
        ViewAll1, ViewOpenOnly1, ViewArchivedOnly1 ); // 0-all, 1-open, 2-archived

  7.  If the main dataset is a TFDTable, add a FilterRecord event with the
      following:

      Accept:= qc_archive_share.QC_AcceptFilterArchivedRecord(DataSet,
        ViewAll1, ViewOpenOnly1, ViewArchivedOnly1 );

      Note:  This method contains an alternative, AFieldName, parameter.

  8.  In the main, add the following to the OnBeforePost event to prevent
      editing archived records:

      qc_archive_share.CheckArchived(DataSet);

      You may wish to add this also to detail dataset events:  OnBeforePost,
      OnBeforeDelete, OnBeforeEdit, and OnBeforeInsert.

      Note:  This methods contain alternative, ATableName and
             AFieldName, parameters.


  ** History **

  04/13/2010
    Unit added by Arik for filtering by ARCHIVED consistently throughout
    Quality modules.

  06/15/2010
    Added parameter, AFieldName, to seven methods to accommodate filtering
    by PK_HIDE, instead of ARCHIVED.  This is part of SCR # 1096, requested
    by Randy. Changed by Byron.

}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  IQMS.WebVcl.SecurityRegister,
  DB,
  Menus,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Documents,
  IQMS.WebVcl.EmailCorrespondence,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniMainMenu;

type
  TArchiveFilter = (afAll, afOpen, afArchived);

  function QC_GetArchiveOptionEnabled( ADataSet: TDataSet;
    SR: TIQWebSecurityRegister; AFieldName: String = 'ARCHIVED' ): Boolean;
  function QC_GetRestoreOptionEnabled( ADataSet: TDataSet;
    SR: TIQWebSecurityRegister; AFieldName: String = 'ARCHIVED' ): Boolean;

  procedure QC_Archive( ADataSet: TDataSet; AFieldName: String = 'ARCHIVED' );
  procedure QC_Restore( ADataSet: TDataSet; AFieldName: String = 'ARCHIVED' );

  procedure QC_RestoreFilter( AOwner: TComponent; ADataSet: TDataSet;
    ViewAll, ViewOpen, ViewArchived: TUniMenuItem );
  function QC_GetSavedFilter(AOwner: TComponent): TArchiveFilter;
  procedure QC_SetSavedFilter(AOwner: TComponent; AArchiveFilter: TArchiveFilter);

  procedure QC_CheckMark( AOwner: TComponent; AMenuOption: TUniMenuItem;
    ARegValue: Integer; ADataSet: TDataSet );

  function QC_AcceptFilterArchivedRecord( ADataSet: TDataSet;
    ViewAll, ViewOpen, ViewArchived: TUniMenuItem;
    AFieldName: String = 'ARCHIVED' ): Boolean; overload;
  function QC_AcceptFilterArchivedRecord( ADataSet: TDataSet;
    AArchiveFilter: TArchiveFilter;
    AFieldName: String = 'ARCHIVED' ): Boolean; overload;

  function QC_MenuChoiceToInteger( ViewAll, ViewOpen,
    ViewArchived: TUniMenuItem ): Integer;

  procedure CheckArchived( AHeaderDataSet: TDataSet; ATableName: string = '';
   AFieldName: String = 'ARCHIVED' );

  // Set document controls read only based on the Archived switch,
  // and also accounting for security rights.
  procedure CheckDocumentControlsReadOnly(AInternalDocs: TIQWebDocs;
    AExternalDocs: TIQWebExtDoc; AEMailCorr: TIQWebEMailCorrespondence;
    ASecurityRegister: TIQWebSecurityRegister; ADataSet: TDataSet;
    AFieldName: String = 'ARCHIVED');

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  Qc_rscstr;

function QC_GetArchiveOptionEnabled( ADataSet: TDataSet; SR: TIQWebSecurityRegister;
 AFieldName: String ): Boolean;
begin
  Result:= (ADataSet.FieldByName(AFieldName).asString <> 'Y') and
           not (ADataSet.Eof and ADataSet.Bof) and SR.Enabled['Archive1'];
end;

function QC_GetRestoreOptionEnabled( ADataSet: TDataSet; SR: TIQWebSecurityRegister;
  AFieldName: String ): Boolean;
begin
  Result:= (ADataSet.FieldByName(AFieldName).asString = 'Y') and
    not (ADataSet.Eof and ADataSet.Bof) and SR.Enabled['RestoreFromArchive1'];
end;

procedure QC_Archive( ADataSet: TDataSet; AFieldName: String );
begin
  // 'Are you sure you want to archive this record?'
  if IQConfirmYN(Qc_rscstr.cTXT000001) then
     with ADataSet do
     begin
       Edit;
       FieldByName(AFieldName).asString:= 'Y';
       Post;
       RefreshDataSetByID(ADataSet);
     end;
end;

procedure QC_Restore( ADataSet: TDataSet; AFieldName: String );
begin
  // 'Are you sure you want to restore this record?'
  if IQConfirmYN(Qc_rscstr.cTXT000002) then
     with ADataSet do
     begin
       Edit;
       FieldByName(AFieldName).asString:= 'N';
       Post;
       RefreshDataSetByID(ADataSet);
     end;
end;

procedure QC_RestoreFilter( AOwner: TComponent; ADataSet: TDataSet;
 ViewAll, ViewOpen, ViewArchived: TUniMenuItem);
var
  ASelectedFilterOption: TArchiveFilter;
begin
  ASelectedFilterOption := QC_GetSavedFilter(AOwner);

  case ASelectedFilterOption of
    afAll: if Assigned(ViewAll) then ViewAll.Checked := True;
    afOpen: if Assigned(ViewOpen) then ViewOpen.Checked := True;
    afArchived: if Assigned(ViewArchived) then ViewArchived.Checked := True;
  end;

  if Assigned(ADataSet) and ADataSet.Active then
     Reopen(ADataSet);
end;

function QC_GetSavedFilter(AOwner: TComponent): TArchiveFilter;
var
   ASelectedFilterOption: Integer;
begin
  if IQRegIntegerScalarRead( AOwner, 'ArchiveFilter', ASelectedFilterOption ) then
     case ASelectedFilterOption of
       0: Result := afAll;
       1: Result := afOpen;
       2: Result := afArchived;
     end
  else
     Result := afAll;
end;

procedure QC_SetSavedFilter(AOwner: TComponent; AArchiveFilter: TArchiveFilter);
begin
  IQRegIntegerScalarWrite(AOwner, 'ArchiveFilter', Ord(AArchiveFilter));
end;

procedure QC_CheckMark( AOwner: TComponent; AMenuOption: TUniMenuItem;
 ARegValue: Integer; ADataSet: TDataSet);
begin
  AMenuOption.Checked := True;

  if (ARegValue in [Ord(Low(TArchiveFilter))..Ord(High(TArchiveFilter))]) then
     QC_SetSavedFilter(AOwner, TArchiveFilter(ARegValue));

  if Assigned(ADataSet) then
     Reopen(ADataSet);
end;

function QC_AcceptFilterArchivedRecord( ADataSet: TDataSet; ViewAll,
 ViewOpen, ViewArchived: TUniMenuItem; AFieldName: String ): Boolean;
begin
  if ViewAll.Checked then
     Result:= TRUE
  else if ViewOpen.Checked then
     Result:= (ADataSet.FieldByName(AFieldName).asString = '') or
              (ADataSet.FieldByName(AFieldName).asString = 'N')
  else if ViewArchived.Checked then
     Result:= (ADataSet.FieldByName(AFieldName).asString = 'Y')
  else
     Result:= TRUE
end;

function QC_AcceptFilterArchivedRecord( ADataSet: TDataSet;
  AArchiveFilter: TArchiveFilter; AFieldName: String ): Boolean;
begin
  case AArchiveFilter of
  afAll:
    Result := True;
  afOpen:
    Result := (ADataSet.FieldByName(AFieldName).asString = '') or
              (ADataSet.FieldByName(AFieldName).asString = 'N');
  afArchived:
     Result := (ADataSet.FieldByName(AFieldName).asString = 'Y');
  else
     Result := True;
  end;
end;

function QC_MenuChoiceToInteger( ViewAll, ViewOpen, ViewArchived: TUniMenuItem ): Integer;
begin
  if ViewAll.Checked then
    Result:= 0
  else if ViewOpen.Checked then
    Result:= 1
  else if ViewArchived.Checked then
    Result:= 2
  else
    Result:= 0
end;


procedure CheckArchived( AHeaderDataSet: TDataSet; ATableName,
 AFieldName: string);
var
  AOldValue: string;
begin
  if (ATableName = '') and (AHeaderDataSet is TFDTable) then
     ATableName:= TFDTable(AHeaderDataSet).TableName;
  IQAssert( ATableName <> '', 'Application Error:  Table name is not ' +
   'specified.  Unable to verify "archived" flag.' );

  AOldValue:= SelectValueByID(AFieldName, ATableName, AHeaderDataSet.FieldByName('ID').asFloat );

  if AOldValue <> AHeaderDataSet.FieldByName(AFieldName).asString then
     EXIT;

  if AHeaderDataSet.FieldByName(AFieldName).asString = 'Y' then
     // This record is archived.  Changes are not allowed.
     raise Exception.Create(Qc_rscstr.cTXT000003);
end;

procedure CheckDocumentControlsReadOnly(AInternalDocs: TIQWebDocs;
  AExternalDocs: TIQWebExtDoc; AEMailCorr: TIQWebEMailCorrespondence;
  ASecurityRegister: TIQWebSecurityRegister; ADataSet: TDataSet;
  AFieldName: String);
var
   AArchived: Boolean;
begin
  if ADataSet.FindField(AFieldName) = NIL then Exit;
  if not Assigned(ASecurityRegister) then Exit;

  AArchived := ADataSet.FieldByName(AFieldName).AsString = 'Y';

  if Assigned(AInternalDocs) then
     with AInternalDocs do
     begin
       IsReadOnly := False;
       ASecurityRegister.ApplySecurity(Name);
       if AArchived and ASecurityRegister.Enabled[Name] then
          IsReadOnly := True;
     end;

  if Assigned(AExternalDocs) then
     with AExternalDocs do
     begin
       IsReadOnly := False;
       ASecurityRegister.ApplySecurity(Name);
       if AArchived and ASecurityRegister.Enabled[Name] then
          IsReadOnly := True;
     end;

  if Assigned(AEMailCorr) then
     with AEMailCorr do
     begin
       IsReadOnly := False;
       ASecurityRegister.ApplySecurity(Name);
       if AArchived and ASecurityRegister.Enabled[Name] then
          IsReadOnly := True;
     end;
end;

end.
