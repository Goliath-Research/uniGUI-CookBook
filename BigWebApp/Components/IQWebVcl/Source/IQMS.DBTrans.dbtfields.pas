unit IQMS.DBTrans.dbtfields;

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
  IQMS.Common.Registry,
  DB,
  SqlExpr,
  DBClient,
  ADODB,
  Variants,
  IQMS.DBTrans.dbtdbexp;

type
  TBooleanType = (btYNString, btYesNo, btTrueFalse);

  // Can be a table or a view
  // Params:
  // AObjectName = The table or view whose fields should be returned
  // ADisplayObjectName = The object name used as the table or view name
  // in the list.  This usually is the same as the AObjectName, but
  // in case the AObjectName is a view, you can optionally display
  // a table name as the ADisplayObjectName.
function GetFields(const ASQLConnection: TSQLConnection;
  const AObjectName: string; ADisplayObjectName: string = ''): TStrings;
// Returns a list of field names in the supplied data set
procedure GetFieldListFromDataSet(ADataSet: TDataSet;
  var AFieldList: TStringList);
// Returns a list of params (:VALUE1, :VALUE2) from the supplied field list
procedure FieldListAsParamList(AFieldList: TStringList;
  var AParamList: TStringList);

function GetDataTypeString(AField: TField): string;
// returns Varchar2, Real,...

function GetDataTypeStringIQ(const ASQLConnection: TSQLConnection;
  const ATableName, AFieldName: string; var ADataType: string;
  var ADataLength, ADataPrecision: Integer;
  var ADisplayDataType: string): string;
function GetFieldTypeForOracleDataType(const ADataType: string): TFieldType;

procedure GetFieldDefForOracleDataType_FireDAC(
  const ADataType: string;
  const ADataLength,
    ADataPrecision,
    ADataScale: Integer;
  var AFieldType: TFieldType;
  var AFieldSize: Integer;
  var APrecision: Integer);
procedure GetFieldDefForOracleDataType_BDE(
  const ADataType: string;
  const ADataLength,
    ADataPrecision,
    ADataScale: Integer;
  var AFieldType: TFieldType;
  var AFieldSize: Integer;
  var APrecision: Integer);

{ function GetReturnFormattedString(AField: TField;
  AMaxStringLength: Integer): String;  // Returns the string of data in the field
  // String values have extra quotes.
  // Example:  '9', or ''My dog has fleas.''
}
// Returns the string of data in the field
// String values have extra quotes.
// Example:  '9', or ''My dog has fleas.''
function GetFormattedDataAsString(AField: TField; AMaxSize: Integer = 0;
  AReturnAsString: Boolean = False;
  ABooleanType: TBooleanType = btYNString): string;
function GetFormattedDataAsStringB(const AValue: string; AMaxSize: Integer;
  AFieldType: TFieldType): string;
function GetFormattedDataFor(const ADataSet: TDataSet): string;

function IsDateTimeFieldType(AField: TField): Boolean; overload;
function IsDateTimeFieldType(AFieldType: TFieldType): Boolean; overload;
function IsDateTimeFieldType(ADataType: string): Boolean; overload;
function IsStringFieldType(AField: TField): Boolean; overload;
function IsStringFieldType(AFieldType: TFieldType): Boolean; overload;
function IsFloatFieldType(AField: TField): Boolean; overload;
function IsFloatFieldType(AFieldType: TFieldType): Boolean; overload;
function IsIntegerFieldType(AField: TField): Boolean; overload;
function IsIntegerFieldType(AFieldType: TFieldType): Boolean; overload;

function IsLOBField(const AOracleDataType: string): Boolean; overload;
function IsLOBField(const AField: TField): Boolean; overload;

function IsJetReservedWord(const AWord: string): Boolean;
function IsSQLServerReservedWord(const AWord: string): Boolean;
function IsForbiddenFieldName(const AFieldName: string): Boolean;
function IsOracleReservedWord(const AWord: string): Boolean;

// Pass the table and column of the string field to get the size
function GetStringFieldSize(ATableName, AColumnName: string;
  ADefaultSize: Integer): Integer;

function IsFieldTypeIn(const AFieldType: TFieldType;
  const ATypeArray: array of TFieldType): Boolean;

const
  // Note:  This is the same as the array, FieldTypeNames, declared in
  // unit db.pas.  If TFieldType changes with a Delphi upgrade, then
  // grab the array from unit, db, and make the appropriate changes.
  // These text names are a bit more user-friendly than the array
  // in db.pas.
  iq_FieldTypeDisplayText: array [TFieldType] of string = ('Unknown', 'Text',
    'Number (Small Integer)', 'Number (Integer)', 'Number (Word)', 'Yes/No',
    'Number (Decimal)', 'Currency', 'Number (Decimal)', 'Date', 'Time',
    'Date and Time', 'Bytes (Binary)', 'Variant Bytes (Binary)',
    'Auto-Increment', 'Blob', 'Memo', 'Graphic (Binary)', 'Memo',
    'Paradox OLE (Binary)', 'dBase OLE (Binary)', 'Typed Binary', 'Cursor',
    'Fixed Character', 'Text (Unicode)', 'Number (Large Integer)',
    'Number (ADT)', 'Array', 'Reference', 'DataSet', 'Blob (Large)',
    'Clob (Large)', 'Variant', 'Interface', 'Dispatch', 'GUID', 'Date and Time',
    'Number (Decimal)', 'Fixed Character (Unicode)', 'Memo (Unicode)',
    'Date and Time', 'Text', 'Number (Long Word)', 'Number (Short Integer)',
    'Number (Byte)', 'Number (Extended Decimal)', 'Connection', 'Params',
    'Stream', 'SQL Time Stamp Offset', 'Object', 'Number (Single)');
  iq_FieldTypeSimpleNames: array [TFieldType] of string = ('Unknown', 'Text',
    'Integer', 'Integer', 'Integer', 'Yes/No', 'Number', 'Number', 'Number',
    'Date and Time', 'Date and Time', 'Date and Time', '(Binary)', '(Binary)',
    'Number', 'Blob', 'Memo', '(Binary)', 'Memo', '(Binary)', '(Binary)',
    '(Binary)', '(Binary)', 'Text', 'Text', 'Integer', 'Number', '(Binary)',
    '(Binary)', '(Binary)', 'Blob', 'Clob', '(Binary)', '(Binary)', '(Binary)',
    'Text', 'Date and Time', 'Number', 'Text', 'Memo', 'Date and Time', 'Text',
    'Integer', 'Integer', 'Byte', 'Number', '(Binary)', '(Binary)', '(Binary)',
    'Number', '(Binary)', 'Integer');
  cDateTypes: array [0 .. 4] of TFieldType = (ftDate, ftTime, ftDateTime,
    ftTimeStamp, ftOraTimeStamp);
  cStringTypes: array [0 .. 7] of TFieldType = (ftString, ftMemo, ftFmtMemo,
    ftFixedChar, ftWideString, ftFixedWideChar, ftWideMemo, ftGuid);
  cFloatTypes: array [0 .. 4] of TFieldType = (ftFloat, ftCurrency, ftBCD,
    ftFMTBcd, ftExtended);
  cIntegerTypes: array [0 .. 8] of TFieldType = (ftSmallint, ftInteger, ftWord,
    ftAutoInc, ftLargeint, ftLongWord, ftShortint, ftByte, ftSingle);
  cForbiddenFields: array [0 .. 5] of string = ('', 'ID', 'EID', 'ECOPY',
    'EDATE_TIME', 'ECODE');
  // For Microsoft Jet reserved words see:
  // http://support.microsoft.com/kb/321266
  cJetReservedWords: array [0 .. 291] of string = ('ABSOLUTE', 'ACTION', 'ADD',
    'ADMINDB', 'ALL', 'ALLOCATE', 'ALPHANUMERIC', 'ALTER', 'AND', 'ANY', 'ARE',
    'AS', 'ASC', 'ASSERTION', 'AT', 'AUTHORIZATION', 'AUTOINCREMENT', 'AVG',
    'BAND', 'BEGIN', 'BETWEEN', 'BINARY', 'BIT', 'BIT_LENGTH', 'BNOT', 'BOR',
    'BOTH', 'BXOR', 'BY', 'BYTE', 'CASCADE', 'CASCADED', 'CASE', 'CAST',
    'CATALOG', 'CHAR', 'CHAR_LENGTH', 'CHARACTER', 'CHARACTER_LENGTH', 'CHECK',
    'CLOSE', 'COALESCE', 'COLLATE', 'COLLATION', 'COLUMN', 'COMMIT', 'COMP',
    'COMPRESSION', 'CONNECT', 'CONNECTION', 'CONSTRAINT', 'CONSTRAINTS',
    'CONTAINER', 'CONTINUE', 'CONVERT', 'CORRESPONDING', 'COUNT', 'COUNTER',
    'CREATE', 'CREATEDB', 'CROSS', 'CURRENCY', 'CURRENT', 'CURRENT_DATE',
    'CURRENT_TIME', 'CURRENT_TIMESTAMP', 'CURRENT_USER', 'CURSOR', 'DATABASE',
    'DATE', 'DATETIME', 'DAY', 'DEALLOCATE', 'DEC', 'DECIMAL', 'DECLARE',
    'DEFAULT', 'DEFERRABLE', 'DEFERRED', 'DELETE', 'DESC', 'DESCRIBE',
    'DESCRIPTOR', 'DIAGNOSTICS', 'DISALLOW', 'DISCONNECT', 'DISTINCT', 'DOMAIN',
    'DOUBLE', 'DROP', 'ELSE', 'END', 'END-EXEC', 'ESCAPE', 'EXCEPT',
    'EXCEPTION', 'EXCLUSIVECONNECT', 'EXEC', 'EXECUTE', 'EXISTS', 'EXTERNAL',
    'EXTRACT', 'FALSE', 'FETCH', 'FIRST', 'FLOAT', 'FLOAT4', 'FLOAT8', 'FOR',
    'FOREIGN', 'FOUND', 'FROM', 'FULL', 'GENERAL', 'GET', 'GLOBAL', 'GO',
    'GOTO', 'GRANT', 'GROUP', 'GUID', 'HAVING', 'HOUR', 'IDENTITY',
    'IEEEDOUBLE', 'IEEESINGLE', 'IGNORE', 'IMAGE', 'IMMEDIATE', 'IN', 'INDEX',
    'INDICATOR', 'INHERITABLE', 'INITIALLY', 'INNER', 'INPUT', 'INSENSITIVE',
    'INSERT', 'INT', 'INTEGER', 'INTEGER1', 'INTEGER2', 'INTEGER4', 'INTERSECT',
    'INTERVAL', 'INTO', 'IS', 'ISOLATION', 'JOIN', 'KEY', 'LANGUAGE', 'LAST',
    'LEADING', 'LEFT', 'LEVEL', 'LIKE', 'LOCAL', 'LOGICAL', 'LOGICAL1', 'LONG',
    'LONGBINARY', 'LONGCHAR', 'LONGTEXT', 'LOWER', 'MATCH', 'MAX', 'MEMO',
    'MIN', 'MINUTE', 'MODULE', 'MONEY', 'MONTH', 'NAMES', 'NATIONAL', 'NATURAL',
    'NCHAR', 'NEXT', 'NO', 'NOT', 'NOTE', 'NULL', 'NULLIF', 'NUMBER', 'NUMERIC',
    'OBJECT', 'OCTET_LENGTH', 'OF', 'OLEOBJECT', 'ON', 'ONLY', 'OPEN', 'OPTION',
    'OR', 'ORDER', 'OUTER', 'OUTPUT', 'OVERLAPS', 'OWNERACCESS', 'PAD',
    'PARAMETERS', 'PARTIAL', 'PASSWORD', 'PERCENT', 'PIVOT', 'POSITION',
    'PRECISION', 'PREPARE', 'PRESERVE', 'PRIMARY', 'PRIOR', 'PRIVILEGES',
    'PROC', 'PROCEDURE', 'PUBLIC', 'READ', 'REAL', 'REFERENCES', 'RELATIVE',
    'RESTRICT', 'REVOKE', 'RIGHT', 'ROLLBACK', 'ROWS', 'SCHEMA', 'SCROLL',
    'SECOND', 'SECTION', 'SELECT', 'SELECTSCHEMA', 'SELECTSECURITY', 'SESSION',
    'SESSION_USER', 'SET', 'SHORT', 'SINGLE', 'SIZE', 'SMALLINT', 'SOME',
    'SPACE', 'SQL', 'SQLCODE', 'SQLERROR', 'SQLSTATE', 'STRING', 'SUBSTRING',
    'SUM', 'SYSTEM_USER', 'TABLE', 'TABLEID', 'TEMPORARY', 'TEXT', 'THEN',
    'TIME', 'TIMESTAMP', 'TIMEZONE_HOUR', 'TIMEZONE_MINUTE', 'TO', 'TOP',
    'TRAILING', 'TRANSACTION', 'TRANSFORM', 'TRANSLATE', 'TRANSLATION', 'TRIM',
    'TRUE', 'UNION', 'UNIQUE', 'UNIQUEIDENTIFIER', 'UNKNOWN', 'UPDATE',
    'UPDATEIDENTITY', 'UPDATEOWNER', 'UPDATESECURITY', 'UPPER', 'USAGE', 'USER',
    'USING', 'VALUE', 'VALUES', 'VARBINARY', 'VARCHAR', 'VARYING', 'VIEW',
    'WHEN', 'WHENEVER', 'WHERE', 'WITH', 'WORK', 'WRITE', 'YEAR',
    'YESNO', 'ZONE');
  // For Microsoft SQL Server reserved words see:
  // http://msdn.microsoft.com/en-us/library/aa238507(v=sql.80).aspx
  cSQLServerReservedWords: array [0 .. 367] of string = ('ABSOLUTE', 'ACTION',
    'ADD', 'ADMIN', 'AFTER', 'AGGREGATE', 'ALIAS', 'ALL', 'ALLOCATE', 'ALTER',
    'AND', 'ANY', 'ARE', 'ARRAY', 'AS', 'ASC', 'ASSERTION', 'AT',
    'AUTHORIZATION', 'BACKUP', 'BEFORE', 'BEGIN', 'BETWEEN', 'BINARY', 'BIT',
    'BLOB', 'BOOLEAN', 'BOTH', 'BREADTH', 'BREAK', 'BROWSE', 'BULK', 'BY',
    'CALL', 'CASCADE', 'CASCADED', 'CASE', 'CAST', 'CATALOG', 'CHAR',
    'CHARACTER', 'CHECK', 'CHECKPOINT', 'CLASS', 'CLOB', 'CLOSE', 'CLUSTERED',
    'COALESCE', 'COLLATE', 'COLLATION', 'COLUMN', 'COMMIT', 'COMPLETION',
    'COMPUTE', 'CONNECT', 'CONNECTION', 'CONSTRAINT', 'CONSTRAINTS',
    'CONSTRUCTOR', 'CONTAINS', 'CONTAINSTABLE', 'CONTINUE', 'CONVERT',
    'CORRESPONDING', 'CREATE', 'CROSS', 'CUBE', 'CURRENT', 'CURRENT_DATE',
    'CURRENT_PATH', 'CURRENT_ROLE', 'CURRENT_TIME', 'CURRENT_TIMESTAMP',
    'CURRENT_USER', 'CURSOR', 'CYCLE', 'DATA', 'DATABASE', 'DATE', 'DAY',
    'DBCC', 'DEALLOCATE', 'DEC', 'DECIMAL', 'DECLARE', 'DEFAULT', 'DEFERRABLE',
    'DEFERRED', 'DELETE', 'DENY', 'DEPTH', 'DEREF', 'DESC', 'DESCRIBE',
    'DESCRIPTOR', 'DESTROY', 'DESTRUCTOR', 'DETERMINISTIC', 'DIAGNOSTICS',
    'DICTIONARY', 'DISCONNECT', 'DISK', 'DISTINCT', 'DISTRIBUTED', 'DOMAIN',
    'DOUBLE', 'DROP', 'DUMMY', 'DUMP', 'DYNAMIC', 'EACH', 'ELSE', 'END',
    'END-EXEC', 'EQUALS', 'ERRLVL', 'ESCAPE', 'EVERY', 'EXCEPT', 'EXCEPTION',
    'EXEC', 'EXECUTE', 'EXISTS', 'EXIT', 'EXTERNAL', 'FALSE', 'FETCH', 'FILE',
    'FILLFACTOR', 'FIRST', 'FLOAT', 'FOR', 'FOREIGN', 'FOUND', 'FREE',
    'FREETEXT', 'FREETEXTTABLE', 'FROM', 'FULL', 'FUNCTION', 'GENERAL', 'GET',
    'GLOBAL', 'GO', 'GOTO', 'GRANT', 'GROUP', 'GROUPING', 'HAVING', 'HOLDLOCK',
    'HOST', 'HOUR', 'IDENTITY', 'IDENTITY_INSERT', 'IDENTITYCOL', 'IF',
    'IGNORE', 'IMMEDIATE', 'IN', 'INDEX', 'INDICATOR', 'INITIALIZE',
    'INITIALLY', 'INNER', 'INOUT', 'INPUT', 'INSERT', 'INT', 'INTEGER',
    'INTERSECT', 'INTERVAL', 'INTO', 'IS', 'ISOLATION', 'ITERATE', 'JOIN',
    'KEY', 'KILL', 'LANGUAGE', 'LARGE', 'LAST', 'LATERAL', 'LEADING', 'LEFT',
    'LESS', 'LEVEL', 'LIKE', 'LIMIT', 'LINENO', 'LOAD', 'LOCAL', 'LOCALTIME',
    'LOCALTIMESTAMP', 'LOCATOR', 'MAP', 'MATCH', 'MINUTE', 'MODIFIES', 'MODIFY',
    'MODULE', 'MONTH', 'NAMES', 'NATIONAL', 'NATURAL', 'NCHAR', 'NCLOB', 'NEW',
    'NEXT', 'NO', 'NOCHECK', 'NONCLUSTERED', 'NONE', 'NOT', 'NULL', 'NULLIF',
    'NUMERIC', 'OBJECT', 'OF', 'OFF', 'OFFSETS', 'OLD', 'ON', 'ONLY', 'OPEN',
    'OPENDATASOURCE', 'OPENQUERY', 'OPENROWSET', 'OPENXML', 'OPERATION',
    'OPTION', 'OR', 'ORDER', 'ORDINALITY', 'OUT', 'OUTER', 'OUTPUT', 'OVER',
    'PAD', 'PARAMETER', 'PARAMETERS', 'PARTIAL', 'PATH', 'PERCENT', 'PLAN',
    'POSTFIX', 'PRECISION', 'PREFIX', 'PREORDER', 'PREPARE', 'PRESERVE',
    'PRIMARY', 'PRINT', 'PRIOR', 'PRIVILEGES', 'PROC', 'PROCEDURE', 'PUBLIC',
    'RAISERROR', 'READ', 'READS', 'READTEXT', 'REAL', 'RECONFIGURE',
    'RECURSIVE', 'REF', 'REFERENCES', 'REFERENCING', 'RELATIVE', 'REPLICATION',
    'RESTORE', 'RESTRICT', 'RESULT', 'RETURN', 'RETURNS', 'REVOKE', 'RIGHT',
    'ROLE', 'ROLLBACK', 'ROLLUP', 'ROUTINE', 'ROW', 'ROWCOUNT', 'ROWGUIDCOL',
    'ROWS', 'RULE', 'SAVE', 'SAVEPOINT', 'SCHEMA', 'SCOPE', 'SCROLL', 'SEARCH',
    'SECOND', 'SECTION', 'SELECT', 'SEQUENCE', 'SESSION', 'SESSION_USER', 'SET',
    'SETS', 'SETUSER', 'SHUTDOWN', 'SIZE', 'SMALLINT', 'SOME', 'SPACE',
    'SPECIFIC', 'SPECIFICTYPE', 'SQL', 'SQLEXCEPTION', 'SQLSTATE', 'SQLWARNING',
    'START', 'STATE', 'STATEMENT', 'STATIC', 'STATISTICS', 'STRUCTURE',
    'SYSTEM_USER', 'TABLE', 'TEMPORARY', 'TERMINATE', 'TEXTSIZE', 'THAN',
    'THEN', 'TIME', 'TIMESTAMP', 'TIMEZONE_HOUR', 'TIMEZONE_MINUTE', 'TO',
    'TOP', 'TRAILING', 'TRAN', 'TRANSACTION', 'TRANSLATION', 'TREAT', 'TRIGGER',
    'TRUE', 'TRUNCATE', 'TSEQUAL', 'UNDER', 'UNION', 'UNIQUE', 'UNKNOWN',
    'UNNEST', 'UPDATE', 'UPDATETEXT', 'USAGE', 'USE', 'USER', 'USING', 'VALUE',
    'VALUES', 'VARCHAR', 'VARIABLE', 'VARYING', 'VIEW', 'WAITFOR', 'WHEN',
    'WHENEVER', 'WHERE', 'WHILE', 'WITH', 'WITHOUT', 'WORK', 'WRITE',
    'WRITETEXT', 'YEAR', 'ZONE');
  // For Oracle reserved words see:
  // http://docs.oracle.com/cd/B19306_01/em.102/b40103/app_oracle_reserved_words.htm
  cOracleReservedWords: array [0 .. 477] of string = ('ACCESS', 'ACCOUNT',
    'ACTIVATE', 'ADD', 'ADMIN', 'ADVISE', 'AFTER', 'ALL', 'ALL_ROWS',
    'ALLOCATE', 'ALTER', 'ANALYZE', 'AND', 'ANY', 'ARCHIVE', 'ARCHIVELOG',
    'ARRAY', 'AS', 'ASC', 'AT', 'AUDIT', 'AUTHENTICATED', 'AUTHORIZATION',
    'AUTOEXTEND', 'AUTOMATIC', 'BACKUP', 'BECOME', 'BEFORE', 'BEGIN', 'BETWEEN',
    'BFILE', 'BITMAP', 'BLOB', 'BLOCK', 'BODY', 'BY', 'CACHE',
    'CACHE_INSTANCES', 'CANCEL', 'CASCADE', 'CAST', 'CFILE', 'CHAINED',
    'CHANGE', 'CHAR', 'CHAR_CS', 'CHARACTER', 'CHECK', 'CHECKPOINT', 'CHOOSE',
    'CHUNK', 'CLEAR', 'CLOB', 'CLONE', 'CLOSE', 'CLOSE_CACHED_OPEN_CURSORS',
    'CLUSTER', 'COALESCE', 'COLUMN', 'COLUMNS', 'COMMENT', 'COMMIT',
    'COMMITTED', 'COMPATIBILITY', 'COMPILE', 'COMPLETE', 'COMPOSITE_LIMIT',
    'COMPRESS', 'COMPUTE', 'CONNECT', 'CONNECT_TIME', 'CONSTRAINT',
    'CONSTRAINTS', 'CONTENTS', 'CONTINUE', 'CONTROLFILE', 'CONVERT', 'COST',
    'CPU_PER_CALL', 'CPU_PER_SESSION', 'CREATE', 'CURREN_USER', 'CURRENT',
    'CURRENT_SCHEMA', 'CURSOR', 'CYCLE', 'DANGLING', 'DATABASE', 'DATAFILE',
    'DATAFILES', 'DATAOBJNO', 'DATE', 'DBA', 'DBHIGH', 'DBLOW', 'DBMAC',
    'DEALLOCATE', 'DEBUG', 'DEC', 'DECIMAL', 'DECLARE', 'DEFAULT', 'DEFERRABLE',
    'DEFERRED', 'DEGREE', 'DELETE', 'DEREF', 'DESC', 'DIRECTORY', 'DISABLE',
    'DISCONNECT', 'DISMOUNT', 'DISTINCT', 'DISTRIBUTED', 'DML', 'DOUBLE',
    'DROP', 'DUMP', 'EACH', 'ELSE', 'ENABLE', 'END', 'ENFORCE', 'ENTRY',
    'ESCAPE', 'EXCEPT', 'EXCEPTIONS', 'EXCHANGE', 'EXCLUDING', 'EXCLUSIVE',
    'EXECUTE', 'EXISTS', 'EXPIRE', 'EXPLAIN', 'EXTENT', 'EXTENTS', 'EXTERNALLY',
    'FAILED_LOGIN_ATTEMPTS', 'FALSE', 'FAST', 'FILE', 'FIRST_ROWS', 'FLAGGER',
    'FLOAT', 'FLOB', 'FLUSH', 'FOR', 'FORCE', 'FOREIGN', 'FREELIST',
    'FREELISTS', 'FROM', 'FULL', 'FUNCTION', 'GLOBAL', 'GLOBAL_NAME',
    'GLOBALLY', 'GRANT', 'GROUP', 'GROUPS', 'HASH', 'HASHKEYS', 'HAVING',
    'HEADER', 'HEAP', 'IDENTIFIED', 'IDGENERATORS', 'IDLE_TIME', 'IF',
    'IMMEDIATE', 'IN', 'INCLUDING', 'INCREMENT', 'IND_PARTITION', 'INDEX',
    'INDEXED', 'INDEXES', 'INDICATOR', 'INITIAL', 'INITIALLY', 'INITRANS',
    'INSERT', 'INSTANCE', 'INSTANCES', 'INSTEAD', 'INT', 'INTEGER',
    'INTERMEDIATE', 'INTERSECT', 'INTO', 'IS', 'ISOLATION', 'ISOLATION_LEVEL',
    'KEEP', 'KEY', 'KILL', 'LABEL', 'LAYER', 'LESS', 'LEVEL', 'LIBRARY', 'LIKE',
    'LIMIT', 'LINK', 'LIST', 'LOB', 'LOCAL', 'LOCK', 'LOCKED', 'LOG', 'LOGFILE',
    'LOGGING', 'LOGICAL_READS_PER_CALL', 'LOGICAL_READS_PER_SESSION', 'LONG',
    'MANAGE', 'MASTER', 'MAX', 'MAXARCHLOGS', 'MAXDATAFILES', 'MAXEXTENTS',
    'MAXINSTANCES', 'MAXLOGFILES', 'MAXLOGHISTORY', 'MAXLOGMEMBERS', 'MAXSIZE',
    'MAXTRANS', 'MAXVALUE', 'MEMBER', 'MIN', 'MINEXTENTS', 'MINIMUM', 'MINUS',
    'MINVALUE', 'MLS_LABEL_FORMAT', 'MLSLABEL', 'MODE', 'MODIFY', 'MOUNT',
    'MOVE', 'MTS_DISPATCHERS', 'MULTISET', 'NATIONAL', 'NCHAR', 'NCHAR_CS',
    'NCLOB', 'NEEDED', 'NESTED', 'NETWORK', 'NEW', 'NEXT', 'NOARCHIVELOG',
    'NOAUDIT', 'NOCACHE', 'NOCOMPRESS', 'NOCYCLE', 'NOFORCE', 'NOLOGGING',
    'NOMAXVALUE', 'NOMINVALUE', 'NONE', 'NOORDER', 'NOOVERRIDE', 'NOPARALLEL',
    'NOREVERSE', 'NORMAL', 'NOSORT', 'NOT', 'NOTHING', 'NOWAIT', 'NULL',
    'NUMBER', 'NUMERIC', 'NVARCHAR2', 'OBJECT', 'OBJNO', 'OBJNO_REUSE', 'OF',
    'OFF', 'OFFLINE', 'OID', 'OIDINDEX', 'OLD', 'ON', 'ONLINE', 'ONLY',
    'OPCODE', 'OPEN', 'OPTIMAL', 'OPTIMIZER_GOAL', 'OPTION', 'OR', 'ORDER',
    'ORGANIZATION', 'OSLABEL', 'OVERFLOW', 'OWN', 'PACKAGE', 'PARALLEL',
    'PARTITION', 'PASSWORD', 'PASSWORD_GRACE_TIME', 'PASSWORD_LIFE_TIME',
    'PASSWORD_LOCK_TIME', 'PASSWORD_REUSE_MAX', 'PASSWORD_REUSE_TIME',
    'PASSWORD_VERIFY_FUNCTION', 'PCTFREE', 'PCTINCREASE', 'PCTTHRESHOLD',
    'PCTUSED', 'PCTVERSION', 'PERCENT', 'PERMANENT', 'PLAN', 'PLSQL_DEBUG',
    'POST_TRANSACTION', 'PRECISION', 'PRESERVE', 'PRIMARY', 'PRIOR', 'PRIVATE',
    'PRIVATE_SGA', 'PRIVILEGE', 'PRIVILEGES', 'PROCEDURE', 'PROFILE', 'PUBLIC',
    'PURGE', 'QUEUE', 'QUOTA', 'RANGE', 'RAW', 'RBA', 'READ', 'READUP', 'REAL',
    'REBUILD', 'RECOVER', 'RECOVERABLE', 'RECOVERY', 'REF', 'REFERENCES',
    'REFERENCING', 'REFRESH', 'RENAME', 'REPLACE', 'RESET', 'RESETLOGS',
    'RESIZE', 'RESOURCE', 'RESTRICTED', 'RETURN', 'RETURNING', 'REUSE',
    'REVERSE', 'REVOKE', 'ROLE', 'ROLES', 'ROLLBACK', 'ROW', 'ROWID', 'ROWNUM',
    'ROWS', 'RULE', 'SAMPLE', 'SAVEPOINT', 'SB4', 'SCAN_INSTANCES', 'SCHEMA',
    'SCN', 'SCOPE', 'SD_ALL', 'SD_INHIBIT', 'SD_SHOW', 'SEG_BLOCK', 'SEG_FILE',
    'SEGMENT', 'SELECT', 'SEQUENCE', 'SERIALIZABLE', 'SESSION',
    'SESSION_CACHED_CURSORS', 'SESSIONS_PER_USER', 'SET', 'SHARE', 'SHARED',
    'SHARED_POOL', 'SHRINK', 'SIZE', 'SKIP', 'SKIP_UNUSABLE_INDEXES',
    'SMALLINT', 'SNAPSHOT', 'SOME', 'SORT', 'SPECIFICATION', 'SPLIT',
    'SQL_TRACE', 'STANDBY', 'START', 'STATEMENT_ID', 'STATISTICS', 'STOP',
    'STORAGE', 'STORE', 'STRUCTURE', 'SUCCESSFUL', 'SWITCH', 'SYNONYM',
    'SYS_OP_ENFORCE_NOT_NULL$', 'SYS_OP_NTCIMG$', 'SYSDATE', 'SYSDBA',
    'SYSOPER', 'SYSTEM', 'TABLE', 'TABLES', 'TABLESPACE', 'TABLESPACE_NO',
    'TABNO', 'TEMPORARY', 'THAN', 'THE', 'THEN', 'THREAD', 'TIME', 'TIMESTAMP',
    'TO', 'TOPLEVEL', 'TRACE', 'TRACING', 'TRANSACTION', 'TRANSITIONAL',
    'TRIGGER', 'TRIGGERS', 'TRUE', 'TRUNCATE', 'TX', 'TYPE', 'UB2', 'UBA',
    'UID', 'UNARCHIVED', 'UNDO', 'UNION', 'UNIQUE', 'UNLIMITED', 'UNLOCK',
    'UNRECOVERABLE', 'UNTIL', 'UNUSABLE', 'UNUSED', 'UPDATABLE', 'UPDATE',
    'USAGE', 'USE', 'USER', 'USING', 'VALIDATE', 'VALIDATION', 'VALUE',
    'VALUES', 'VARCHAR', 'VARCHAR2', 'VARYING', 'VIEW', 'WHEN', 'WHENEVER',
    'WHERE', 'WITH', 'WITHOUT', 'WORK', 'WRITE', 'WRITEDOWN', 'WRITEUP',
    'XID', 'YEAR');

implementation

uses
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Boolean;

{ Internal methods }
function GetFixedQuotedStr(const AStringIN: string): string;
begin
  // Initialize to default
  Result := AStringIN;

  // these characters cause big problems
  Result := StrTran(Result, #96, ''''); // apostrophe
  Result := StrTran(Result, '`', ''''); // in IQMS.Common.StringUtils.pas
  Result := StrTran(Result, '´', ''''); // in IQMS.Common.StringUtils.pas

  // 06/01/2009 Instead of replacing double quotation marks for all text,
  // only replace double quotation marks when we need to change
  // them.  If a colon exists in the text, then we have to
  // modify the text.  Otherwise, we leave it alone.
  if Pos(':', Result) > 0 then
    Result := StrTran(Result, '"', '''''');
  // must convert double-quotes to single-quotes

  // A single quote character (') is inserted at the beginning and end of
  // the text, and each single quote character in the string is repeated.
  Result := QuotedStr(Result);
end;

function GetFields(const ASQLConnection: TSQLConnection;
  const AObjectName: string; ADisplayObjectName: string): TStrings;
var
  ADispObj: string;
begin
  Result := TStringList.Create;
  if AObjectName = '' then
    Exit;

  // Assign the "display object name" that will be used
  ADispObj := ADisplayObjectName;
  if (ADisplayObjectName = '') then
    ADispObj := AObjectName;

  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      SQL.Add(Format
        ('SELECT column_name, data_type FROM cols WHERE table_name = TRIM(UPPER(''%s'')) ',
        [AObjectName]));
      Open;
      while not EOF do
        begin
          // 09/16/20009 We exclude LOB fields because the BDE cannot
          // work with them.
          if IsLOBField(FieldByName('DATA_TYPE').AsString) then
            begin
              Next;
              Continue;
            end;

          Result.Add(UpperCase(Format('%s.%s',
            [ADispObj, FieldByName('COLUMN_NAME').AsString])));
          Next;
        end;
    finally
      Free;
    end;
end;

function GetDataTypeString(AField: TField): string;
{ function _Eval(const ATypeArray: array of TFieldType): Boolean;
  var
  i: Integer;
  begin
  Result := False;
  for i := low(ATypeArray) to high(ATypeArray) do
  if AField.DataType = ATypeArray[i] then
  begin
  Result := True;
  Break;
  end;
  end;
}
begin
  // See above, this unit, for the const array.  This array
  // is based on the FieldTypeNames array declared in unit, DB.
  Result := iq_FieldTypeSimpleNames[AField.DataType];
  { if _Eval(cDateTypes) then
    Result := dbtrscstr.cTXT0000129 // 'Date and Time'
    else if _Eval(cStringTypes) then
    Result := dbtrscstr.cTXT0000130 // 'Text'
    else if _Eval(cFloatTypes) then
    Result := dbtrscstr.cTXT0000128 // 'Number'
    else if _Eval(cIntegerTypes) then
    Result := dbtrscstr.cTXT0000126 // 'Integer'
    else if AField.DataType = ftBoolean then
    Result := dbtrscstr.cTXT0000127 // 'Yes/No'
    else if AField.DataType = ftBlob then
    Result := dbtrscstr.cTXT0000131 // 'Blob'
    else
    // Result := dbtrscstr.cTXT0000125; // 'Unknown'
    Result := DB.FieldTypeNames[AField.DataType]; }
end;

function GetDataTypeStringIQ(const ASQLConnection: TSQLConnection;
  const ATableName, AFieldName: string; var ADataType: string;
  var ADataLength, ADataPrecision: Integer;
  var ADisplayDataType: string): string;
begin
  with TSQLQuery.Create(nil) do
    try
      SQLConnection := ASQLConnection;
      SQL.Add('SELECT data_type,                 ');
      SQL.Add('       data_length,               ');
      SQL.Add('       data_precision             ');
      SQL.Add('FROM all_tab_columns              ');
      SQL.Add('WHERE owner = ''IQMS''            ');
      SQL.Add(Format('  AND table_name = TRIM(UPPER(''%s'')) ', [ATableName]));
      SQL.Add(Format('  AND column_name = TRIM(UPPER(''%s'')) ', [AFieldName]));
      SQL.Add('  AND rownum < 2                  ');
      Open;

      if (BOF and EOF) then
        raise Exception.CreateFmt
          (cTXT0000080 { 'Table not found: %s } , [ATableName]);

      ADataType := FieldByName('DATA_TYPE').AsString;
      ADataLength := FieldByName('DATA_LENGTH').AsInteger;
      ADataPrecision := FieldByName('DATA_PRECISION').AsInteger;
    finally
      Free;
    end;

  // return friendly name
  if (ADataType = 'CHAR') or (ADataType = 'NCHAR') or (ADataType = 'VARCHAR2')
    or (ADataType = 'NVARCHAR2') then
    begin
      ADisplayDataType := cTXT0000078; // Text
      Result := Format('%s [%d]', [ADisplayDataType, ADataLength]);
    end
  else if (ADataType = 'LONG') or (ADataType = 'RAW') or
    (ADataType = 'LONG RAW') then
    begin
      ADisplayDataType := cTXT0000078; // Text
      Result := Format('%s [%d]', [ADisplayDataType, ADataLength]);
    end
  else if (ADataType = 'NUMBER') or (ADataType = 'FLOAT') or (ADataType = 'DEC')
    or (ADataType = 'DECIMAL') or (ADataType = 'REAL') or
    (ADataType = 'BINARY_DOUBLE') or (ADataType = 'BINARY_FLOAT') or
    (ADataType = 'INTEGER') or (ADataType = 'INT') or
    (ADataType = 'SMALLINT') then
    begin
      ADisplayDataType := cTXT0000076; // 'Number'
      if (ADataPrecision > 0) and (ADataLength > 0) then
        Result := Format('%s [%d, %d]', [ADisplayDataType, ADataLength,
          ADataPrecision])
      else if (ADataLength > 0) then
        Result := Format('%s [%d]', [ADisplayDataType, ADataLength])
      else
        Result := ADisplayDataType;
    end
  else if (ADataType = 'DATE') or (ADataType = 'TIMESTAMP') then
    begin
      ADisplayDataType := cTXT0000077; // 'Date and Time'
      Result := ADisplayDataType;
    end
    {
      else if (ADataType = 'CLOB') or
      (ADataType = 'NCLOB') then
      begin
      ADisplayDataType := dbtrscstr.cTXT0000078; // Text
      Result := ADisplayDataType;
      end

      else if (ADataType = 'BLOB') then
      begin
      ADisplayDataType := dbtrscstr.cTXT0000079; // Blob
      Result := ADisplayDataType;
      end

      else if (ADataType = 'BFILE') then
      begin
      ADisplayDataType := dbtrscstr.cTXT0000079; // Blob
      Result := ADisplayDataType;
      end
      else raise Exception.CreateFmt('This data type is unsupported: %s', [ADataType]);
    }
  else
    begin
      ADisplayDataType := ADataType;
      Result := ADataType;
    end
end;

function GetFieldTypeForOracleDataType(const ADataType: string): TFieldType;
begin
  // return field type
  if (ADataType = 'CHAR') or (ADataType = 'NCHAR') or (ADataType = 'VARCHAR2')
    or (ADataType = 'NVARCHAR2') then
    Result := ftString

  else if (ADataType = 'LONG') or (ADataType = 'RAW') or
    (ADataType = 'LONG RAW') then
    Result := ftString

  else if (ADataType = 'NUMBER') or (ADataType = 'FLOAT') or (ADataType = 'DEC')
    or (ADataType = 'DECIMAL') or (ADataType = 'REAL') or
    (ADataType = 'BINARY_DOUBLE') or (ADataType = 'BINARY_FLOAT') then
    Result := ftFMTBcd

  else if (ADataType = 'INTEGER') or (ADataType = 'INT') or
    (ADataType = 'SMALLINT') then
    Result := ftBCD

  else if (ADataType = 'DATE') or (ADataType = 'TIMESTAMP') then
    Result := ftTimeStamp

  else if (ADataType = 'CLOB') or (ADataType = 'NCLOB') then
    Result := ftOraClob

  else if (ADataType = 'BLOB') or (ADataType = 'BFILE') then
    Result := ftOraBlob

  else
    Result := ftString;
end;

function IsLOBField(const AOracleDataType: string): Boolean;
begin
  Result := (AOracleDataType = 'CLOB') or (AOracleDataType = 'NCLOB') or
    (AOracleDataType = 'BLOB') or (AOracleDataType = 'BFILE') or
    (Pos('LOB', AOracleDataType) > 0);
end;

function IsLOBField(const AField: TField): Boolean;
begin
  Result := False;
  if Assigned(AField) then
    Result := (AField.DataType in [ftBlob, ftGraphic, ftParadoxOle, ftDBaseOle,
      ftOraBlob, ftOraClob]);
end;

function GetFormattedDataFor(const ADataSet: TDataSet): string;
var
  i: Integer;
  S: string;
begin
  Result := '';
  if not Assigned(ADataSet) or not ADataSet.Active then
    Exit;

  for i := 0 to ADataSet.FieldCount - 1 do
    begin
      S := GetFormattedDataAsString(ADataSet.Fields[i],
        ADataSet.Fields[i].Size, False);
      if Result = '' then
        Result := S
      else
        Result := Result + ',' + S;
    end;

end;

function GetFormattedDataAsString(AField: TField; AMaxSize: Integer;
  AReturnAsString: Boolean; ABooleanType: TBooleanType): string;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function FixMaxSize_String(AValueIN: string): string;
  begin
    if AMaxSize > 0 then
      Result := LeftStr(Trim(AValueIN), AMaxSize)
    else
      Result := AValueIN;
  end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
var
  S: string;
begin

  // Just return 'NULL' if the field is NULL
  if AField.IsNull then
    begin
      Result := 'NULL';
      Exit;
    end;

  // Get the SQL text
  if IsIntegerFieldType(AField) then
    begin
      if not AReturnAsString then
        begin
          if (AMaxSize > 0) and (Length(AField.AsString) > AMaxSize) then
            Result := 'NULL'
          else
            Result := IQFormat('%d', [AField.AsInteger]);
        end
      else
        Result := IQFormat('''%d''', [AField.AsInteger]);
    end

  else if AField.DataType = ftBoolean then
    begin
      case ABooleanType of
        btYNString:
          Result := Format('''%s''', [BoolToYN(AField.AsBoolean)]); // iqbool
        btYesNo:
          Result := Format('%s', [IQMS.Common.Boolean.BoolToYesNo(AField.AsBoolean)]);
        btTrueFalse:
          Result := Format('%s', [SysUtils.BoolToStr(AField.AsBoolean, True)]);
      else
        // default - standard IQMS Oracle value
        Result := Format('''%s''', [BoolToYN(AField.AsBoolean)]); // iqbool
      end;
    end

  else if IsFloatFieldType(AField) then
    begin
      if not AReturnAsString then
        begin
          if ((AMaxSize > 0) and (Length(AField.AsString) > AMaxSize)) then
            Result := 'NULL'
          else
            Result := IQFormat('%.15f', [AField.AsFloat]);
        end
        // NOTE:  We do it this way to prevent extra zeros at end of the number
      else
        Result := IQFormat('''%.15f''', [AField.AsFloat]);
    end

  else if IsDateTimeFieldType(AField) then
    begin
      if (AField.AsDateTime = NULL) or (AField.AsDateTime <= 0) then
        Result := 'NULL'
      else
        begin
          // First check to see if there is a time value
          if Frac(AField.AsFloat) > 0 then
            S := FormatDateTime('mm/dd/yyyy hh:mm:ss', AField.AsDateTime)
          else
            S := FormatDateTime('mm/dd/yyyy', AField.AsDateTime);

          Result := Format('TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS'')', [S]);
        end;
    end

  else if IsStringFieldType(AField) then
    begin
      S := AField.AsString;
      S := FixMaxSize_String(S); // iqstring
      if S = '' then
        Result := 'NULL'
      else
        Result := GetFixedQuotedStr(S);
    end

  else if AField.DataType = ftBlob then
    raise Exception.Create
      (cTXT0000134 { 'Blob fields are unsupported.  Cannot import.' } )

  else
    try
      Result := Format('''%s''', [AField.AsString]);
    except
      raise Exception.CreateFmt
        (cTXT0000133 { 'Unknown or invalid data type [Field name: %s][Type: %s]' } ,
        [AField.FieldName, GetDataTypeString(AField)]);
    end;

  if AReturnAsString and (Result = '') then
    Result := '''''';

end;

function GetFormattedDataAsStringB(const AValue: string; AMaxSize: Integer;
  AFieldType: TFieldType): string;
var
  d: TDateTime;
  r: Real;
  i: Integer;
  S: string;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function FixMaxSize_String(AValueIN: string): string;
  begin
    if AMaxSize > 0 then
      Result := LeftStr(Trim(AValueIN), AMaxSize)
    else
      Result := AValueIN;
  end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function _ConvertFromJetDateTime: string;
  var
    i: Integer;
  begin
    Result := AValue;

    // Jet DateTime stamps can come in a different format, such as:
    // '2006-10-10T00:21:45'
    i := Pos('T', UpperCase(AValue));
    if i > 0 then
      Result := IQMS.Common.Dates.XMLDateStrToDateTimeStr(AValue)
  end;
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function _Eval(const ATypeArray: array of TFieldType): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := low(ATypeArray) to high(ATypeArray) do
      if AFieldType = ATypeArray[i] then
        begin
          Result := True;
          Break;
        end;
  end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
begin
  if AValue = '' then
    Result := 'NULL' // return the word NULL, not in quotes
  else
  // NOTE:  Because of International number formats, we return all data
  // (text and numeric) as a string.  Microsoft Word uses numbers,
  // formatted as text, without any visual differences to the
  // merge data.

    if _Eval(cStringTypes) then
    begin
      S := FixMaxSize_String(AValue);
      Result := Format('''%s''', [FixStr(S)]);
    end

  else if _Eval(cIntegerTypes) then
    begin
      if (AValue = '') or not IQMS.Common.Numbers.IsStringValidInteger(AValue, i) then
        Result := 'NULL' // return the word NULL, not in quotes
      else
        Result := Format('%d', [i]); // FloatToStr(AField.AsFloat);
    end

  else if _Eval(cFloatTypes) then
    begin
      if (AValue = '') or not IQMS.Common.Numbers.IsStringValidFloat(AValue, r) then
        Result := 'NULL' // return the word NULL, not in quotes
      else if (AFieldType in [ftCurrency { ,ftBCD } ]) then
        Result := Format('%.6f', [r])
      else
        Result := Format('%.15f', [r]);
    end

  else if (AFieldType = ftBoolean) then
    Result := Format('''%s''', [TIQBoolean.AsYN(TIQBoolean.AsBoolean(AValue))]) // iqbool

  else if _Eval(cDateTypes) then
    begin
      S := _ConvertFromJetDateTime;
      if (S = '') or not IQMS.Common.Dates.IsStringValidDate(S, d) then
        Result := 'NULL' // return the word NULL, not in quotes
      else
        Result := Format('TO_DATE(''%s'', ''MM/DD/RRRR HH24:MI:SS'')',
          [FormatDateTime('mm/dd/yyyy hh:nn:ss', d)]);
    end

  else
    Result := 'NULL'; // if all else fails

end;

function IsDateTimeFieldType(AField: TField): Boolean;
begin
  Result := False;
  if not Assigned(AField) then
    Exit;
  Result := IsDateTimeFieldType(AField.DataType);
end;

function IsDateTimeFieldType(AFieldType: TFieldType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cDateTypes) to high(cDateTypes) do
    if AFieldType = cDateTypes[i] then
      begin
        Result := True;
        Break;
      end;
end;

function IsDateTimeFieldType(ADataType: string): Boolean;
begin
  Result := (Pos('DATE', ADataType) > 0) or (Pos('TIME', ADataType) > 0);
end;

function IsStringFieldType(AField: TField): Boolean;
begin
  Result := False;
  if not Assigned(AField) then
    Exit;
  Result := IsStringFieldType(AField.DataType);
end;

function IsStringFieldType(AFieldType: TFieldType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cStringTypes) to high(cStringTypes) do
    if AFieldType = cStringTypes[i] then
      begin
        Result := True;
        Break;
      end;
end;

function IsFloatFieldType(AField: TField): Boolean;
begin
  Result := False;
  if not Assigned(AField) then
    Exit;
  Result := IsFloatFieldType(AField.DataType);
end;

function IsFloatFieldType(AFieldType: TFieldType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cFloatTypes) to high(cFloatTypes) do
    if AFieldType = cFloatTypes[i] then
      begin
        Result := True;
        Break;
      end;
end;

function IsIntegerFieldType(AField: TField): Boolean;
begin
  Result := False;
  if not Assigned(AField) then
    Exit;
  Result := IsIntegerFieldType(AField.DataType);
end;

function IsIntegerFieldType(AFieldType: TFieldType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cIntegerTypes) to high(cIntegerTypes) do
    if AFieldType = cIntegerTypes[i] then
      begin
        Result := True;
        Break;
      end;
end;

function GetStringFieldSize(ATableName, AColumnName: string;
  ADefaultSize: Integer): Integer;
begin
  Result := ADefaultSize;

  if (ATableName = '') or (AColumnName = '') then
    Exit;

  try
    Result := Trunc(DBX_GetValFmt('SELECT data_length FROM cols ' +
      'WHERE table_name = TRIM(UPPER(''%s'')) AND ' +
      'column_name = TRIM(UPPER(''%s''))', [ATableName, AColumnName]));
  except
  end;
end;

procedure GetFieldListFromDataSet(ADataSet: TDataSet;
  var AFieldList: TStringList);
var
  i: Integer;
begin
  if not Assigned(AFieldList) then
    Exit;

  for i := 0 to ADataSet.FieldCount - 1 do
    AFieldList.Add(ADataSet.Fields[i].FieldName);
end;

procedure FieldListAsParamList(AFieldList: TStringList;
  var AParamList: TStringList);
var
  i: Integer;
begin
  if not Assigned(AFieldList) or not Assigned(AParamList) then
    Exit;
  AParamList.Clear;
  for i := 0 to AFieldList.Count - 1 do
    AParamList.Add(':' + AFieldList.Strings[i]);
end;

function IsFieldTypeIn(const AFieldType: TFieldType;
  const ATypeArray: array of TFieldType): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(ATypeArray) to high(ATypeArray) do
    if AFieldType = ATypeArray[i] then
      begin
        Result := True;
        Break;
      end;
end;

function IsForbiddenFieldName(const AFieldName: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cForbiddenFields) to high(cForbiddenFields) do
    if CompareText(cForbiddenFields[i], AFieldName) = 0 then
      begin
        Result := True;
        Break;
      end;
end;

function IsJetReservedWord(const AWord: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cJetReservedWords) to high(cJetReservedWords) do
    if CompareText(cJetReservedWords[i], AWord) = 0 then
      begin
        Result := True;
        Break;
      end;
end;

function IsSQLServerReservedWord(const AWord: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cSQLServerReservedWords) to high(cSQLServerReservedWords) do
    if CompareText(cSQLServerReservedWords[i], AWord) = 0 then
      begin
        Result := True;
        Break;
      end;
end;

function IsOracleReservedWord(const AWord: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := low(cOracleReservedWords) to high(cOracleReservedWords) do
    if CompareText(cOracleReservedWords[i], AWord) = 0 then
      begin
        Result := True;
        Break;
      end;
end;

procedure GetFieldDefForOracleDataType_FireDAC(
  const ADataType: string;
  const ADataLength,
    ADataPrecision,
    ADataScale: Integer;
  var AFieldType: TFieldType;
  var AFieldSize: Integer;
  var APrecision: Integer);
begin
  if CompareText(ADataType, 'NUMBER') = 0 then
    begin
      if ADataScale = 0 then
        AFieldType := ftBcd
      else
        AFieldType := ftFMTBcd;
      APrecision := ADataPrecision;
      AFieldSize := ADataScale;
    end
  else if CompareText(ADataType, 'FLOAT') = 0 then
    begin
      AFieldType := ftFloat;
      APrecision := ADataPrecision;
      AFieldSize := 0;
    end
  else if CompareText(ADataType, 'CHAR') = 0 then
    begin
      AFieldType := ftString;
      APrecision := 0; // n/a
      AFieldSize := ADataLength;
      // FixedChar = True
    end
  else if CompareText(ADataType, 'VARCHAR2') = 0 then
    begin
      AFieldType := ftString;
      APrecision := 0; // n/a
      AFieldSize := ADataLength;
      // FixedChar = False
    end
  else if CompareText(ADataType, 'DATE') = 0 then
    begin
      AFieldType := ftDateTime;
      APrecision := 0; // n/a
      AFieldSize := 0; // n/a
    end
  else if CompareText(ADataType, 'CLOB') = 0 then
    begin
      AFieldType := ftOraClob;
      APrecision := 0; // n/a
      AFieldSize := 0;
    end
  else if CompareText(ADataType, 'BLOB') = 0 then
    begin
      AFieldType := ftOraBlob;
      APrecision := 0; // n/a
      AFieldSize := 0;
    end
  else
    raise Exception.CreateFmt(
      'Application Error: Unmapped Oracle data type (%s).',
      [ADataType]);
end;

procedure GetFieldDefForOracleDataType_BDE(
  const ADataType: string;
  const ADataLength,
    ADataPrecision,
    ADataScale: Integer;
  var AFieldType: TFieldType;
  var AFieldSize: Integer;
  var APrecision: Integer);
begin
  if CompareText(ADataType, 'NUMBER') = 0 then
    begin
      AFieldType := ftFloat;
      APrecision := 15;
      AFieldSize := 15;
    end
  else if CompareText(ADataType, 'FLOAT') = 0 then
    begin
      AFieldType := ftFloat;
      APrecision := ADataPrecision;
      AFieldSize := 0;
    end
  else if CompareText(ADataType, 'CHAR') = 0 then
    begin
      AFieldType := ftString;
      APrecision := 0; // n/a
      AFieldSize := ADataLength;
      // FixedChar = True
    end
  else if CompareText(ADataType, 'VARCHAR2') = 0 then
    begin
      if ADataLength > 255 then
        AFieldType := ftMemo
      else
        AFieldType := ftString;
      APrecision := 0; // n/a
      AFieldSize := ADataLength;
      // FixedChar = False
    end
  else if CompareText(ADataType, 'DATE') = 0 then
    begin
      AFieldType := ftDateTime;
      APrecision := 0; // n/a
      AFieldSize := 0; // n/a
    end
  else if CompareText(ADataType, 'CLOB') = 0 then
    begin
      AFieldType := ftOraClob;
      APrecision := 0; // n/a
      AFieldSize := 1;
    end
  else if CompareText(ADataType, 'BLOB') = 0 then
    begin
      AFieldType := ftOraBlob;
      APrecision := 0; // n/a
      AFieldSize := 1;
    end
  else
    raise Exception.CreateFmt(
      'Application Error: Unmapped Oracle data type (%s).',
      [ADataType]);
end;

end.
