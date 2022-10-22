unit dm_crmword;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  MainModule;

type
  TCRMWORD_DM = class(TDataModule)
    SrcCRMWordCriteria: TDataSource;
    TblCRMWordCriteria: TFDQuery;
    SrcCRMWordDoc: TDataSource;
    TblCRMWordDoc: TFDQuery;
    TblCRMWordDocID: TBCDField;
    TblCRMWordDocUSERID: TStringField;
    TblCRMWordDocNAME: TStringField;
    TblCRMWordDocDESCRIPTION: TStringField;
    TblCRMWordDocFILENAME: TStringField;
    TblCRMWordDocLAST_PRINTED: TDateTimeField;
    TblCRMWordDocDATASET_INDEX: TFMTBCDField;
    TblCRMWordCriteriaID: TBCDField;
    TblCRMWordCriteriaCRM_WORD_DOC_ID: TBCDField;
    TblCRMWordCriteriaSEQ: TBCDField;
    TblCRMWordCriteriaCOL_NAME: TStringField;
    TblCRMWordCriteriaDESCRIP: TStringField;
    TblCRMWordCriteriaUNARY_OPERATOR: TStringField;
    TblCRMWordCriteriaBINARY_OPERATOR: TStringField;
    TblCRMWordCriteriaRANGE_END: TStringField;
    TblCRMWordCriteriaRANGE_START: TStringField;
    TblCRMWordCriteriaINCLUDE_NULLS: TStringField;
    SrcCRMWordCriteria_QK: TDataSource;
    TblCRMWordCriteria_QK: TFDQuery;
    TblCRMWordCriteria_QKID: TBCDField;
    TblCRMWordCriteria_QKCRM_WORD_DOC_ID: TBCDField;
    TblCRMWordCriteria_QKSEQ: TBCDField;
    TblCRMWordCriteria_QKCOL_NAME: TStringField;
    TblCRMWordCriteria_QKDESCRIP: TStringField;
    TblCRMWordCriteria_QKUNARY_OPERATOR: TStringField;
    TblCRMWordCriteria_QKBINARY_OPERATOR: TStringField;
    TblCRMWordCriteria_QKRANGE_END: TStringField;
    TblCRMWordCriteria_QKRANGE_START: TStringField;
    TblCRMWordCriteria_QKINCLUDE_NULLS: TStringField;
    TblCRMWordDocTEMPLATENAME: TStringField;
    TblCRMWordDocDatasetDescrip: TStringField;
    SrcSortBy: TDataSource;
    QrySortBy: TFDQuery;
    QrySortByID: TBCDField;
    QrySortByCRM_WORD_DOC_ID: TBCDField;
    QrySortBySEQ: TBCDField;
    QrySortByTEXT: TStringField;
    TblCRMWordDocDATAFILENAME: TStringField;
    TblCRMWordDocDATATABLENAME: TStringField;
    TblCRMWordDocMASSMAIL: TStringField;
    TblCRMWordDocEMAIL_FIELD_NAME: TStringField;
    TblCRMWordDocPUBLISHED: TStringField;
    TblCRMWordDocDATATABLETYPE: TFMTBCDField;
    SrcCampaign: TDataSource;
    QryCampaign: TFDQuery;
    QryCampaignCAMPAIGN_NO: TStringField;
    QryCampaignCODE: TStringField;
    QryCampaignDESCRIPTION: TStringField;
    QryCampaignID: TFMTBCDField;
    TblCRMWordDocCAMPAIGN_ID: TBCDField;
    FDUpdateSQL_Doc: TFDUpdateSQL;
    FDUpdateSQL_Criteria: TFDUpdateSQL;
    FDUpdateSQL_CriteriaQK: TFDUpdateSQL;
    procedure QryCRMWordDocBeforeOpen(DataSet: TDataSet);
    procedure TblCRMWordDocBeforePost(DataSet: TDataSet);
    procedure TblCRMWordDocNewRecord(DataSet: TDataSet);
    procedure TblCRMWordCriteriaBeforePost(DataSet: TDataSet);
    procedure TblCRMWordCriteriaNewRecord(DataSet: TDataSet);
    procedure TblCRMWordCriteriaCOL_NAMEChange(Sender: TField);
    procedure TblCRMWordDocCalcFields(DataSet: TDataSet);
    procedure DoAfterPost(DataSet: TDataSet);
    procedure QrySortByBeforeDelete(DataSet: TDataSet);
    procedure DoBeforeEdit(DataSet: TDataSet);
    procedure QrySortByUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QrySortByNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FWordSQL_ID: Real;
  public
    { Public declarations }
    function GetNextCriteriaSeq( ACRMWordDocID: Real ): Integer;
    procedure AutoFillCriteriaLabel( AFieldName: String = '' ); // if empty, use cur value

    procedure FixBinaryOperators( ACRMWordDocID, ACRMWordCriteriaID: Real );
  end;
implementation

{$R *.DFM}

uses
  crm_rscstr,
  crm_settings,
  { TODO -omugdha : Dependancy
  crmword_query,    }
  crmword_share,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;
   { TODO -omugdha : dependancy
  crmword_query;    }

function TCRMWORD_DM.GetNextCriteriaSeq( ACRMWordDocID: Real ): Integer;
begin
     Result := Round( SelectValueFmtAsFloat( 'select NVL( max( seq ), 0 ) from crm_word_criteria where crm_word_doc_id = %.0f',
                                 [ ACRMWordDocID ] )) + 1;
end;

procedure TCRMWORD_DM.QryCRMWordDocBeforeOpen(DataSet: TDataSet);
begin
     with DataSet as TFDQuery do
          ParamByName( 'userid' ).AsString := SecurityManager.UserName;
end;

procedure TCRMWORD_DM.TblCRMWordDocBeforePost(DataSet: TDataSet);
var
   S : String;
begin
  // crm_rscstr.cTXT0000809 =
  // 'The Document Name is required.  ' +
  // 'Please enter a document name that should appear on lists and picklists.'
  IQMS.Common.Miscellaneous.IQAssert(Trim(TblCRMWordDocNAME.AsString) > '', crm_rscstr.cTXT0000809);
end;

procedure TCRMWORD_DM.TblCRMWordDocNewRecord(DataSet: TDataSet);
begin
  TblCRMWordDocID.AsLargeInt := GetNextID('CRM_WORD_DOC');
  TblCRMWordDocUSERID.AsString := SecurityManager.UserName;
  TblCRMWordDocNAME.AsString := crm_rscstr.cTXT0000810; // '<My New Document>'
  TblCRMWordDocDATASET_INDEX.AsInteger := 1;
  TblCRMWordDocDATATABLETYPE.AsInteger := IQMS.Common.Numbers.iIIf(
    CRMSettings.MailMergeOptions.DefaultDataFormat >= 1,
    CRMSettings.MailMergeOptions.DefaultDataFormat,
    5);
end;

procedure TCRMWORD_DM.TblCRMWordCriteriaBeforePost(DataSet: TDataSet);
var
  { TODO -omugdha : dependancy
  Column : TColInfo; // declared in crmword_query.pas
  }
  AView, S: String;
begin
  // IMPORTANT NOTE:
  // This method is shared by two datasets.  Use DataSet.FieldByName().

  // crm_rscstr.cTXT0000811 =
  // 'The Label for this criteria is empty.  Please enter a Label.'
  IQMS.Common.Miscellaneous.IQAssert(Trim(DataSet.FieldByName('DESCRIP').AsString) > '',
    crm_rscstr.cTXT0000811);

     // Ensure text is the correct date format
     if (TblCRMWordDocDATASET_INDEX.AsInteger>0) and (DataSet.FieldByName('COL_NAME').AsString>'') then
        begin
          AView := MailMergeViewNameEx(TblCRMWordDocID.AsLargeInt);
          { TODO -omugdha -cWEBIQ : dependancy
          Column := crmword_query.GetColInfo(AView, DataSet.FieldByName('COL_NAME').AsString ); // crmword_share.pas

          if Column.DataType = dtDate then
             begin
               if ConvertToIQDateStr(DataSet.FieldByName('RANGE_START').AsString, S) then // crmword_share.pas
                  DataSet.FieldByName('RANGE_START').AsString := S;
               if ConvertToIQDateStr(DataSet.FieldByName('RANGE_END').AsString, S) then // crmword_share.pas
                  DataSet.FieldByName('RANGE_END').AsString := S;
             end;
            }
        end;

     // Fixes null BINARY_OPERATORS
     FixBinaryOperators( DataSet.FieldByName('CRM_WORD_DOC_ID').AsLargeInt,
                 DataSet.FieldByName('ID').AsLargeInt );
end;

procedure TCRMWORD_DM.TblCRMWordCriteriaNewRecord(DataSet: TDataSet);
begin
 TblCRMWordCriteriaID.AsLargeInt := GetNextID('CRM_WORD_CRITERIA');
 TblCRMWordCriteriaCRM_WORD_DOC_ID.AsLargeInt := TblCRMWordDocID.AsLargeInt;
 TblCRMWordCriteriaSEQ.AsInteger := GetNextCriteriaSeq(TblCRMWordDocID.AsLargeInt);
 TblCRMWordCriteriaUNARY_OPERATOR.AsString := '=';
 TblCRMWordCriteriaBINARY_OPERATOR.AsString := 'AND';
end;

procedure TCRMWORD_DM.FixBinaryOperators( ACRMWordDocID, ACRMWordCriteriaID: Real );
begin
     ExecuteCommandFmt( 'update crm_word_criteria ' +
                'set binary_operator = ''AND'' ' +
                'where crm_word_doc_id = %.0f and binary_operator is null',
                [ ACRMWordDocID ] );

end;

procedure TCRMWORD_DM.TblCRMWordCriteriaCOL_NAMEChange(Sender: TField);
begin
     AutoFillCriteriaLabel;
end;

procedure TCRMWORD_DM.AutoFillCriteriaLabel( AFieldName: String = '' );
var
   ADisplayLabel: String;
begin
     // We use this method, instead of just checking the field value, because
     // this is also called by the OnCloseUp event of the combo box for the
     // criteria grid.  When the combo box closes and the record is in insert
     // mode, then there will never be anything in the field.  So, we allow
     // the value to be passed.  The method, TblCRMWordCriteriaCOL_NAMEChange,
     // also call this, but it relies on whatever is in the field.
     if AFieldName = '' then AFieldName := TblCRMWordCriteriaCOL_NAME.AsString;

     if ( TblCRMWordCriteria.State in [ dsEdit, dsInsert ] ) and ( AFieldName > '' ) and
        ( TblCRMWordCriteriaDESCRIP.AsString = '' ) then // do not us "IsNull"
        begin
             ADisplayLabel := FieldDisplayLabel( AFieldName );
             TblCRMWordCriteriaDESCRIP.AsString := ADisplayLabel;
        end;
end;

procedure TCRMWORD_DM.TblCRMWordDocCalcFields(DataSet: TDataSet);
begin
     case TblCRMWordDocDATASET_INDEX.AsInteger of
        0: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000812; // 'Customers and Prospects';
        1: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000813; // 'Contacts';
        2: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000814; // 'Vendors';
        3: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000815; // 'Vendor Contacts';
        4: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000816; // 'Partners';
        5: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000817; // 'Partner Contacts';
        6: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000818; // 'Employees';
        7: TblCRMWordDocDatasetDescrip.AsString := crm_rscstr.cTXT0000819; // 'CRM Group';
     end;
end;

procedure TCRMWORD_DM.DoAfterPost(DataSet: TDataSet);
begin
     with DataSet as TFDRDBMSDataSet do
          try
             ApplyUpdates;
             CommitUpdates;
          except on E:Exception do
             begin
                  CancelUpdates;
                  raise;
             end;
          end;
     FWordSQL_ID := 0;
end;

procedure TCRMWORD_DM.QrySortByBeforeDelete(DataSet: TDataSet);
begin
     FWordSQL_ID := QrySortByID.AsFloat;
end;

procedure TCRMWORD_DM.DoBeforeEdit(DataSet: TDataSet);
begin
  if (TblCRMWordDoc.State in [dsEdit, dsInsert]) then
    TblCRMWordDoc.Post;

  IQPostParentsBeforeEdit( DataSet ); // in IQlib
end;

procedure TCRMWORD_DM.QrySortByUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
var
   AID: Real;
   ASeq: Integer;
begin

     AID := QrySortByID.AsFloat;
     if AID = 0 then AID := GetNextID( 'CRM_WORD_SQL' );

     if ARequest = arInsert then
        begin
//             ASeq := Round( SelectValueFmtAsFloat( 'select max( distinct seq) from crm_word_sql where sort_field = ''Y'' and crm_word_doc_id = %.0f',
//                                [TblCRMWordDocID.AsFloat] )) + 1;
             ExecuteCommandFmt( 'insert into crm_word_sql ' +
                        '( id, crm_word_doc_id, seq, sort_field, text ) ' +
                        'values ( %.0f, %.0f, %d, ''Y'', ''%s'' ) ',
                        [ AID, TblCRMWordDocID.AsFloat, QrySortBySEQ.AsInteger,
                          FixStr( QrySortByTEXT.AsString ) ] );
        end
     else if ARequest = arUpdate then
        begin
            ExecuteCommandFmt( 'update crm_word_sql set seq = %d, text = ''%s'' where id = %.0f',
                       [ QrySortBySEQ.AsInteger, FixStr( QrySortByTEXT.AsString ), QrySortByID.AsFloat ] );
        end
     else if ARequest = arDelete then
        begin
             if FWordSQL_ID > 0 then
                ExecuteCommandFmt( 'delete from crm_word_sql where id = %.0f', [FWordSQL_ID]);
             FWordSQL_ID := 0;
        end;

     AAction := eaApplied;
end;

procedure TCRMWORD_DM.QrySortByNewRecord(DataSet: TDataSet);
var
   ASeq: Integer;
begin
     ASeq := Round( SelectValueFmtAsFloat( 'select max( distinct seq) from crm_word_sql where sort_field = ''Y'' and crm_word_doc_id = %.0f',
                        [TblCRMWordDocID.AsFloat] )) + 1;
     QrySortBySEQ.AsInteger := ASeq;
end;

end.
