unit dbtformat;

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
  Variants,
  ComCtrls,
  Math;

procedure FormatEditor(AEditor: TRichEdit);
function GetWordAt(APos: Integer; AText: string;
  var AStart, AEnd: Integer): string;

type
  TCharSet = set of WideChar;

const
  // Colors
  constColor_Reserved = clBlue;
  constColor_String = clTeal;
  constColor_Comment = clGreen;
  constColor_Symbol = clRed;
  constColor_DataType = clPurple;

  // constNUMBERS: TCharSet = ['0' .. '9'];
  // constLOWER: TCharSet = ['a' .. 'z'];
  // constUPPER: TCharSet = ['A' .. 'Z'];
  // constSPECIAL: TCharSet = ['_'];
  // constCHARACTER: TCharSet = [',', '.', ';', ':', '>', '<', '=', '(', ')', '+',
  // '!', '@', '%', '*', '^', '&', '-', '/', '\', '|', '}', '{', '~'];
  // constVALID_CHARS: TCharSet = ['0' .. '9', 'a' .. 'z', 'A' .. 'Z', '_'];

  constSYMBOLS: TCharSet = [',', '.', ';', ':', '>', '<', '=', '(', ')', '+',
    '!', '@', '%', '*', '^', '&', '-', '/', '\', '|', '}', '{', '~'];
  constSTANDARD_CHARS: TCharSet = ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', '_'];

  AReservedSQL: array [0 .. 465] of string = ('ACCESS', 'ACCOUNT', 'ACTIVATE',
    'ADD', 'ADMIN', 'ADVISE', 'AFTER', 'ALL', 'ALL_ROWS', 'ALLOCATE', 'ALTER',
    'ANALYZE', 'AND', 'ANY', 'ARCHIVE', 'ARCHIVELOG', 'ARRAY', 'ARRAYLEN', 'AS',
    'ASC', 'AT', 'AUDIT', 'AUTHENTICATED', 'AUTHORIZATION', 'AUTOEXTEND',
    'AUTOMATIC', 'BACKUP', 'BECOME', 'BEFORE', 'BEGIN', 'BETWEEN', 'BITMAP',
    'BLOCK', 'BODY', 'BY', 'CACHE', 'CACHE_INSTANCES', 'CANCEL', 'CASCADE',
    'CFILE', 'CHAINED', 'CHANGE', 'CHAR_CS', 'CHARACTER', 'CHECK', 'CHECKPOINT',
    'CHOOSE', 'CHUNK', 'CLEAR', 'CLONE', 'CLOSE', 'CLOSE_CACHED_OPEN_CURSORS',
    'CLUSTER', 'COBOL', 'COLUMN', 'COLUMNS', 'COMMENT', 'COMMIT', 'COMMITTED',
    'COMPATIBILITY', 'COMPILE', 'COMPLETE', 'COMPOSITE_LIMIT', 'COMPRESS',
    'COMPUTE', 'CONNECT', 'CONNECT_TIME', 'CONSTRAINT', 'CONSTRAINTS',
    'CONTENTS', 'CONTINUE', 'CONTROLFILE', 'COST', 'CPU_PER_CALL',
    'CPU_PER_SESSION', 'CREATE', 'CURRENT', 'CURRENT_SCHEMA', 'CURRENT_USER',
    'CURSOR', 'CYCLE', 'DANGLING', 'DATABASE', 'DATAFILE', 'DATAFILES',
    'DATAOBJNO', 'DBA', 'DBHIGH', 'DBLOW', 'DBMAC', 'DEALLOCATE', 'DEBUG',
    'DEC', 'DECIMAL', 'DECLARE', 'DEFAULT', 'DEFERRABLE', 'DEFERRED', 'DEGREE',
    'DELETE', 'DESC', 'DIRECTORY', 'DISABLE', 'DISCONNECT', 'DISMOUNT',
    'DISTINCT', 'DISTRIBUTED', 'DML', 'DOUBLE', 'DROP', 'EACH', 'ELSE', 'ELSIF',
    'ENABLE', 'END', 'ENFORCE', 'ENTRY', 'ESCAPE', 'ESTIMATE', 'EVENTS',
    'EXCEPT', 'EXCEPTION', 'EXCEPTIONS', 'EXCHANGE', 'EXCLUDING', 'EXCLUSIVE',
    'EXEC', 'EXECUTE', 'EXISTS', 'EXIT', 'EXPIRE', 'EXPLAIN', 'EXTENT',
    'EXTENTS', 'EXTERNALLY', 'FAILED_LOGIN_ATTEMPTS', 'FALSE', 'FAST', 'FETCH',
    'FILE', 'FIRST_ROWS', 'FLAGGER', 'FLOB', 'FLUSH', 'FOR', 'FORCE', 'FOREIGN',
    'FORTRAN', 'FOUND', 'FREELIST', 'FREELISTS', 'FROM', 'FULL', 'FUNCTION',
    'GLOBAL', 'GLOBAL_NAME', 'GLOBALLY', 'GO', 'GOTO', 'GRANT', 'GROUP',
    'GROUPS', 'HASH', 'HASHKEYS', 'HAVING', 'HEADER', 'HEAP', 'IDENTIFIED',
    'IDGENERATORS', 'IDLE_TIME', 'IF', 'IMMEDIATE', 'IN', 'INCLUDING',
    'INCREMENT', 'IND_PARTITION', 'INDEX', 'INDEXED', 'INDEXES', 'INDICATOR',
    'INITIAL', 'INITIALLY', 'INITRANS', 'INSERT', 'INSTANCE', 'INSTANCES',
    'INSTEAD', 'INT', 'INTERMEDIATE', 'INTERSECT', 'INTO', 'IS', 'ISOLATION',
    'ISOLATION_LEVEL', 'KEEP', 'KEY', 'KILL', 'LABEL', 'LANGUAGE', 'LAYER',
    'LESS', 'LEVEL', 'LIBRARY', 'LIKE', 'LIMIT', 'LINK', 'LIST', 'LISTS', 'LOB',
    'LOCAL', 'LOCK', 'LOCKED', 'LOGFILE', 'LOGGING', 'LOGICAL_READS_PER_CALL',
    'LOGICAL_READS_PER_SESSION', 'LOOP', 'MANAGE', 'MANUAL', 'MASTER',
    'MAXARCHLOGS', 'MAXDATAFILES', 'MAXEXTENTS', 'MAXINSTANCES', 'MAXLOGFILES',
    'MAXLOGHISTORY', 'MAXLOGMEMBERS', 'MAXSIZE', 'MAXTRANS', 'MAXVALUE',
    'MEMBER', 'MINEXTENTS', 'MINIMUM', 'MINUS', 'MINVALUE', 'MLS_LABEL_FORMAT',
    'MODE', 'MODIFY', 'MODULE', 'MONITORING', 'MOUNT', 'MOVE',
    'MTS_DISPATCHERS', 'MULTISET', 'NATIONAL', 'NCHAR_CS', 'NEEDED', 'NESTED',
    'NETWORK', 'NEXTVAL', 'NEW', 'NEXT', 'NOARCHIVELOG', 'NOAUDIT', 'NOCACHE',
    'NOCOMPRESS', 'NOCYCLE', 'NOFORCE', 'NOLOGGING', 'NOMAXVALUE', 'NOMINVALUE',
    'NONE', 'NOORDER', 'NOOVERRIDE', 'NOPARALLEL', 'NORESETLOGS', 'NOREVERSE',
    'NORMAL', 'NOSORT', 'NOT', 'NOTFOUND', 'NOTHING', 'NOWAIT', 'NULL',
    'NUMERIC', 'OBJECT', 'OBJNO', 'OBJNO_REUSE', 'OF', 'OFF', 'OFFLINE', 'OID',
    'OIDINDEX', 'OLD', 'ON', 'ONLINE', 'ONLY', 'OPCODE', 'OPEN', 'OPTIMAL',
    'OPTIMIZER_GOAL', 'OPTION', 'OR', 'ORDER', 'ORGANIZATION', 'OSLABEL', 'OUT',
    'OVERFLOW', 'OWN', 'PACKAGE', 'PACKED', 'PARALLEL', 'PARTITION', 'PASSWORD',
    'PASSWORD_GRACE_TIME', 'PASSWORD_LIFE_TIME', 'PASSWORD_LOCK_TIME',
    'PASSWORD_REUSE_MAX', 'PASSWORD_REUSE_TIME', 'PASSWORD_VERIFY_FUNCTION',
    'PCTFREE', 'PCTINCREASE', 'PCTTHRESHOLD', 'PCTUSED', 'PCTVERSION',
    'PERCENT', 'PERMANENT', 'PLAN', 'PLI', 'PLSQL_DEBUG', 'POST_TRANSACTION',
    'PRAGMA', 'PRECISION', 'PRESERVE', 'PRIMARY', 'PRIOR', 'PRIVATE',
    'PRIVATE_SGA', 'PRIVILEGE', 'PRIVILEGES', 'PROCEDURE', 'PROFILE', 'PUBLIC',
    'PURGE', 'QUEUE', 'QUOTA', 'RANGE', 'RBA', 'READ', 'READUP', 'REAL',
    'REBUILD', 'RECOVER', 'RECOVERABLE', 'RECOVERY', 'REFERENCES',
    'REFERENCING', 'REFRESH', 'RENAME', 'REPLACE', 'RESET', 'RESETLOGS',
    'RESIZE', 'RESOURCE', 'RESTRICTED', 'RETURN', 'RETURNING', 'REUSE',
    'REVERSE', 'REVOKE', 'ROLE', 'ROLES', 'ROLLBACK', 'ROW', 'ROWID',
    'ROWLABEL', 'ROWNUM', 'ROWS', 'ROWTYPE', 'RULE', 'SAMPLE', 'SAVEPOINT',
    'SB4', 'SCAN_INSTANCES', 'SCHEMA', 'SCN', 'SCOPE', 'SD_ALL', 'SD_INHIBIT',
    'SD_SHOW', 'SECTION', 'SEG_BLOCK', 'SEG_FILE', 'SEGMENT', 'SELECT',
    'SEQUENCE', 'SERIALIZABLE', 'SESSION', 'SESSION_CACHED_CURSORS',
    'SESSIONS_PER_USER', 'SET', 'SHARE', 'SHARED', 'SHARED_POOL', 'SHRINK',
    'SIZE', 'SKIP', 'SKIP_UNUSABLE_INDEXES', 'SMALLINT', 'SNAPSHOT', 'SOME',
    'SORT', 'SPECIFICATION', 'SPLIT', 'SQL', 'SQL_TRACE', 'SQLBUF', 'SQLCODE',
    'SQLERROR', 'SQLSTATE', 'STANDBY', 'START', 'STATEMENT_ID', 'STATISTICS',
    'STOP', 'STORAGE', 'STORE', 'STRUCTURE', 'SUCCESSFUL', 'SWITCH', 'SYNONYM',
    'SYSDBA', 'SYSOPER', 'SYSTEM', 'TABLE', 'TABLES', 'TABLESPACE',
    'TABLESPACE_NO', 'TABNO', 'TEMPORARY', 'THAN', 'THE', 'THEN', 'THREAD',
    'TIME', 'TO', 'TOPLEVEL', 'TRACE', 'TRACING', 'TRANSACTION', 'TRANSITIONAL',
    'TRIGGER', 'TRIGGERS', 'TRUE', 'TRUNCATE', 'TX', 'TYPE', 'UB2', 'UBA',
    'UNARCHIVED', 'UNDER', 'UNDO', 'UNION', 'UNIQUE', 'UNLIMITED', 'UNLOCK',
    'UNPACKED', 'UNRECOVERABLE', 'UNTIL', 'UNUSABLE', 'UNUSED', 'UPDATABLE',
    'UPDATE', 'VALUES', 'WHEN', 'WHERE');
  AFunctionsPLSQL: array [0 .. 219] of string = ('ABS', 'ACOS', 'ADD_MONTHS',
    'APPENDCHILDXML', 'ASCII', 'ASCIISTR', 'ASIN', 'ATAN', 'ATAN2', 'AVG',
    'BFILENAME', 'BIN_TO_NUM', 'BITAND', 'CARDINALITY', 'CAST', 'CEIL',
    'CHARTOROWID', 'CHR', 'CLUSTER_ID', 'CLUSTER_PROBABILITY', 'CLUSTER_SET',
    'COALESCE', 'COLLECT', 'COMPOSE', 'CONCAT', 'CONVERT', 'CORR', 'CORR_K',
    'CORR_S', 'COS', 'COSH', 'COUNT', 'COVAR_POP', 'COVAR_SAMP', 'CUME_DIST',
    'CURRENT_DATE', 'CURRENT_TIMESTAMP', 'DBTIMEZONE', 'DECODE', 'DECOMPOSE',
    'DELETEXML', 'DENSE_RANK', 'DEPTH', 'DEREF', 'DUMP', 'EMPTY_BLOB',
    'EMPTY_CLOB', 'EXCEPTION_INIT', 'EXISTSNODE', 'EXP', 'EXTRACT',
    'EXTRACTVALUE', 'FEATURE_SET', 'FEATURE_VALUE', 'FIRST', 'FIRST_VALUE',
    'FLOOR', 'FROM_TZ', 'GREATEST', 'GROUPING', 'HEXTORAW', 'INITCAP',
    'INSERTCHILDXML', 'INSERTXMLBEFORE', 'INSTR', 'LAG', 'LAST', 'LAST_DAY',
    'LAST_VALUE', 'LEAD', 'LEAST', 'LENGTH', 'LN', 'LNNVL', 'LOCALTIMESTAMP',
    'LOG', 'LOWER', 'LPAD', 'LTRIM', 'MAKE_REF', 'MAX', 'MEDIAN', 'MIN', 'MOD',
    'MONTHS_BETWEEN', 'NANVL', 'NEW_TIME', 'NEXT_DAY', 'NLS_CHARSET_DECL_LEN',
    'NLS_CHARSET_ID', 'NLS_CHARSET_NAME', 'NLS_INITCAP', 'NLS_LOWER',
    'NLS_UPPER', 'NLSSORT', 'NTILE', 'NULLIF', 'NUMTODSINTERVAL',
    'NUMTOYMINTERVAL', 'NVL', 'NVL2', 'ORA_HASH', 'PATH', 'PERCENT_RANK',
    'PERCENTILE_CONT', 'PERCENTILE_DISC', 'POWER', 'POWERMULTISET',
    'POWERMULTISET_BY_CARDINALITY', 'PREDICTION', 'PREDICTION_COST',
    'PREDICTION_DETAILS', 'PREDICTION_PROBABILITY', 'PREDICTION_SET', 'RANK',
    'RATIO_TO_REPORT', 'RAWTOHEX', 'RAWTONHEX', 'REF', 'REFTOHEX',
    'REGEXP_INSTR', 'REGEXP_REPLACE', 'REGEXP_SUBSTR', 'REGR_AVGX', 'REGR_AVGY',
    'REGR_COUNT', 'REGR_INTERCEPT', 'REGR_R2', 'REGR_SLOPE', 'REGR_SXX',
    'REGR_SXY', 'REGR_SYY', 'REMAINDER', 'ROUND', 'ROW_NUMBER', 'ROWIDTOCHAR',
    'ROWIDTONCHAR', 'RPAD', 'RTRIM', 'SCN_TO_TIMESTAMP', 'SESSIONTIMEZONE',
    'SIGN', 'SIN', 'SINH', 'SOUNDEX', 'SQRT', 'STATS_BINOMIAL_TEST',
    'STATS_CROSSTAB', 'STATS_F_TEST', 'STATS_KS_TEST', 'STATS_MODE',
    'STATS_MW_TEST', 'STATS_ONE_WAY_ANOVA', 'STATS_T_TEST_', 'STATS_WSR_TEST',
    'STDDEV', 'STDDEV_POP', 'STDDEV_SAMP', 'SUBSTR', 'SUBSTRB', 'SUM',
    'SYS_CONTEXT', 'SYS_DBURIGEN', 'SYS_EXTRACT_UTC', 'SYS_GUID', 'SYS_TYPEID',
    'SYS_XMLAGG', 'SYS_XMLGEN', 'SYSDATE', 'SYSTIMESTAMP', 'TAN', 'TANH',
    'TIMESTAMP_TO_SCN', 'TO_BINARY_DOUBLE', 'TO_BINARY_FLOAT', 'TO_CHAR',
    'TO_CLOB', 'TO_DATE', 'TO_DSINTERVAL', 'TO_LOB', 'TO_MULTI_BYTE',
    'TO_NCHAR', 'TO_NCLOB', 'TO_NUMBER', 'TO_SINGLE_BYTE', 'TO_TIMESTAMP',
    'TO_TIMESTAMP_TZ', 'TO_YMINTERVAL', 'TRANSLATE', 'TREAT', 'TRIM', 'TRUNC',
    'TZ_OFFSET', 'UID', 'UNISTR', 'UPDATEXML', 'UPPER', 'USER', 'USERENV',
    'USING', 'VALUE', 'VAR_POP', 'VAR_SAMP', 'VARIANCE', 'VSIZE',
    'WIDTH_BUCKET', 'XMLAGG', 'XMLCDATA', 'XMLCOLATTVAL', 'XMLCOMMENT',
    'XMLCONCAT', 'XMLFOREST', 'XMLPARSE', 'XMLPI', 'XMLQUERY', 'XMLROOT',
    'XMLSEQUENCE', 'XMLSERIALIZE', 'XMLTABLE', 'XMLTRANSFORM');
  ADataTypesPLSQL: array [0 .. 26] of string = ('BFILE', 'BINARY_DOUBLE',
    'BINARY_FLOAT', 'BINARY_INTEGER', 'BLOB', 'BOOLEAN', 'CHAR', 'CLOB', 'DATE',
    'DAY', 'FLOAT', 'INTEGER', 'INTERVAL', 'LONG', 'MLSLABEL', 'MONTH', 'NCHAR',
    'NCLOB', 'NUMBER', 'NVARCHAR2', 'PLS_INTEGER', 'RAW', 'TIMESTAMP', 'UROWID',
    'VARCHAR', 'VARCHAR2', 'YEAR');
  AExceptionsPLSQL: array [0 .. 22] of string = ('ACCESS_INTO_NULL',
    'CASE_NOT_FOUND', 'COLLECTION_IS_NULL', 'CURSOR_ALREADY_OPEN',
    'DUP_VAL_ON_INDEX', 'INVALID_CURSOR', 'INVALID_NUMBER', 'LOGIN_DENIED',
    'NO_DATA_FOUND', 'NO_DATA_NEEDED', 'NOT_LOGGED_ON', 'PROGRAM_ERROR',
    'ROWTYPE_MISMATCH', 'SELF_IS_NULL', 'STORAGE_ERROR',
    'SUBSCRIPT_BEYOND_COUNT', 'SUBSCRIPT_OUTSIDE_LIMIT', 'SYS_INVALID_ROWID',
    'TIMEOUT_ON_RESOURCE', 'TOO_MANY_ROWS', 'USERENV_COMMITSCN_ERROR',
    'VALUE_ERROR', 'ZERO_DIVIDE');

implementation

uses
  Character, RichEdit, StrUtils;

procedure FormatEditor(AEditor: TRichEdit);

  procedure FormatChars(ASelStart, ASelLength: Integer; AColor: TColor;
    ABold, AItalic: Boolean);
  var
    cf: TCharFormat;
    tr: TTextRangeW;
  begin
    tr.chrg.cpMin := ASelStart;
    tr.chrg.cpMax := ASelStart + ASelLength;
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@tr.chrg));
    ZeroMemory(@cf, Sizeof(TCharFormat));
    cf.cbSize := Sizeof(cf);
    cf.dwMask := CFM_COLOR or CFM_BOLD or CFM_ITALIC;
    cf.crTextColor := AColor;
    if ABold then
      cf.dwEffects := cf.dwEffects or CFE_BOLD;
    if AItalic then
      cf.dwEffects := cf.dwEffects or CFE_ITALIC;
    SendMessage(AEditor.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@cf));
  end;

  procedure ClearFormatting;
  var
    cf: TCharFormat;
    tr: TTextRangeW;
    cr: TCharRange;
  begin
    tr.chrg.cpMin := 0;
    tr.chrg.cpMax := Length(AEditor.Text);
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@tr.chrg));
    ZeroMemory(@cf, Sizeof(TCharFormat));
    cf.cbSize := Sizeof(cf);
    cf.dwMask := CFM_COLOR or CFM_BOLD or CFM_ITALIC;
    cf.crTextColor := clBlack;
    SendMessage(AEditor.Handle, EM_SETCHARFORMAT, SCF_SELECTION, LPARAM(@cf));
    ZeroMemory(@cr, Sizeof(TCharRange));
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@cr));
  end;

  function FormatWordIfFound(const AWord: string;
    const AWordList: array of string; const AColor: TColor;
    const ABold, AItalics: Boolean; var ACurrentPos: Integer): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to high(AWordList) do
      if CompareText(AWord, AWordList[i]) = 0 then
        begin
          Result := True;
          FormatChars(ACurrentPos - 1, Length(AWord), AColor, ABold, AItalics);
          ACurrentPos := ACurrentPos + Length(AWord) - 1; // new position of i
          BREAK;
        end;
  end;

var
  i, x: Integer; // i = counter, x=temporary integer
  AText: string;
  ATextLength: Integer;
  chrgSave: TCharRange;
  AWord: string;
  AWordFound: Boolean;
  AAlignDisabled: Boolean;
  c: Char;
  c2: string[2];
  AStart, AEnd: Integer;

  AOnChange: TNotifyEvent;
  AOnSelectionChange: TNotifyEvent;
  AOnKeyDown: TKeyEvent;
begin
  // Get text
  AText := AEditor.Text;
  if Trim(AText) = '' then
    Exit;

  // Replace the end-of-line characters in the text that is used
  // for evaluation.  This is necessary for the current character
  // position in AText to match the position in the AEditor.
  AText := StringReplace(AText, #13#10, #13, [rfIgnoreCase, rfReplaceAll]);
  AText := StringReplace(AText, #10#13, #13, [rfIgnoreCase, rfReplaceAll]);
  AText := StringReplace(AText, #10, #13, [rfIgnoreCase, rfReplaceAll]);
  ATextLength := Length(AText);

  try
    AEditor.Lines.BeginUpdate; // begin updating
    // Clear events
    AOnChange := AEditor.OnChange;
    AOnSelectionChange := AEditor.OnSelectionChange;
    AOnKeyDown := AEditor.OnKeyDown;
    AEditor.OnChange := nil;
    AEditor.OnSelectionChange := nil;
    AEditor.OnKeyDown := nil;
    // Set drawing
    SendMessage(AEditor.Handle, WM_SETREDRAW, Integer(False), 0);
    SendMessage(AEditor.Handle, EM_EXGETSEL, 0, LPARAM(@chrgSave));

    // Clear the formatting.  Note:  it is important that we do this because
    // some characters can be missed as we examine the text.  This takes
    // care of alot of problems.
    ClearFormatting;
    i := 1; // initialize counter.  We use a "while" loop.

    while i <= ATextLength do
      begin
        c := AText[i];
        c2 := Copy(AText, i, 2);

        if (ATextLength < 2) or (c = #0) then
          begin
            Inc(i);
            Continue;
          end
          // Format block comments.  Check here first if our starting point
          // is the beginning of a block comment.  It makes things much faster.
        else if (c2 = '/*') then
          begin
            x := PosEx('*/', AText, i + 1);
            if (x = 0) then
              x := ATextLength;
            FormatChars(i - 1, (x - i) + 2, constColor_Comment, False, True);
            // Format it teal
            i := x + 2;
          end
          // Comments
        else if (c2 = '--') then
          begin
            // This will paint the characters Teal from the
            // comment characters to the end of the line
            x := PosEx(#13, AText, i);
            if (x > 0) and (x >= i) then
              begin
                FormatChars(i - 1, (x - i) + 1, constColor_Comment,
                  False, True);
                i := x;
              end
            else
              Inc(i);
          end
        else if (c = '''') then
          begin
            x := PosEx('''', AText, i + 1);
            if (x = 0) then
              x := ATextLength;
            FormatChars(i - 1, (x - i) + 1, constColor_String, False, False);
            i := x + 1;
          end
          // Symbols
        else if SysUtils.CharInSet(c, constSYMBOLS) then
          begin
            FormatChars(i - 1, 1, constColor_Symbol, False, False);
            Inc(i); // increment
          end
          // Words
          // else if SysUtils.CharInSet(c, constSTANDARD_CHARS) then
        else if Character.TCharacter.IsLetterOrDigit(c) then
          begin
            // Get the word
            AWord := UpperCase(GetWordAt(i, AText, AStart, AEnd));
            AWordFound := False; // reset for inner loops

            // Color Basic SQL terms
            AWordFound := FormatWordIfFound(AWord, AReservedSQL,
              constColor_Reserved { Color } , True { Bold } ,
              False { Italics } ,
              { var } i);

            // Functions
            if not AWordFound then
              AWordFound := FormatWordIfFound(AWord, AFunctionsPLSQL,
                clBlack { Color } , True { Bold } , False { Italics } ,
                { var } i);

            // Color data types
            if not AWordFound then
              AWordFound := FormatWordIfFound(AWord, ADataTypesPLSQL,
                constColor_DataType { Color } , True { Bold } ,
                False { Italics } ,
                { var } i);

            // Exceptions
            if not AWordFound then
              AWordFound := FormatWordIfFound(AWord, AExceptionsPLSQL,
                clBlack { Color } , False { Bold } , True { Italics } ,
                { var } i);

            // If we get here, it is an ordinary word (table, field, etc.)
            // Increment the counter
            if not AWordFound and (AWord > '') then
              i := i + Length(AWord)
              // new position of i
            else
              Inc(i); // increment
          end
        else
          Inc(i); // increment
      end;
  finally
    SendMessage(AEditor.Handle, EM_EXSETSEL, 0, LPARAM(@chrgSave));
    SendMessage(AEditor.Handle, WM_SETREDRAW, Integer(True), 0);
    // Restore events
    AEditor.OnChange := AOnChange;
    AEditor.OnSelectionChange := AOnSelectionChange;
    AEditor.OnKeyDown := AOnKeyDown;
    AEditor.Lines.EndUpdate; // end updating
  end;
end;

function GetWordAt(APos: Integer; AText: string;
  var AStart, AEnd: Integer): string;
const
  arrayWordDelimiters: set of AnsiChar = [#0 .. #255] - ['0' .. '9', 'A' .. 'Z',
    'a' .. 'z', '_'];
var
  ATextLength: Integer;
begin
  // Initialize
  Result := '';
  AStart := APos;
  AEnd := APos;
  try
    ATextLength := Length(AText);
    if (ATextLength > 0) and (AText[AStart] <> #32) and
      (ATextLength > AStart) then
      begin
        // Find beginning position of the word we want
        while (AStart > 1) and not SysUtils.CharInSet(AText[AStart],
          arrayWordDelimiters) do
          Dec(AStart);
        if not SysUtils.CharInSet(AText[AStart], constSTANDARD_CHARS) and
          (AStart + 1 < ATextLength) then
          Inc(AStart);

        // Find the end position of the word
        while (AEnd < ATextLength) and not SysUtils.CharInSet(AText[AEnd],
          arrayWordDelimiters) do
          Inc(AEnd);
        if not SysUtils.CharInSet(AText[AEnd], constSTANDARD_CHARS) and
          (AEnd - 1 > 0) then
          Dec(AEnd);
        // Return the word
        Result := Copy(AText, AStart, AEnd - AStart + 1);
      end;
  except // suppress
  end;
end;

end.
