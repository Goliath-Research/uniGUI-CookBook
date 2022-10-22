unit cc_encrypt;

interface

// Advanced Encryption Standard (AES)
//
// Credit Cards uses AES.  The Advanced Encryption Standard (AES), also known
// as Rijndael (pronounced, "Rain Dahl"), originated in the late 1990's and
// became the U.S. government standard in 2001.  It uses a 128-bit key.
// The algorithm was considered top secret information, but has recently
// become public domain.  In the last couple of years, hackers were able to
// crack it through “side-channel attacks” (whatever that is), but the
// probability of that happening in the real world are so remote that the
// government still considers it secure enough for its most sensitive data.

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  Data.DB;

procedure ResetPackage;
function HasEncryption: Boolean;

procedure GetEncryptionKeys(var AKey1, AKey2, AKey3: string);
procedure SaveEncryptionKeys(const AKey1, AKey2, AKey3: string);

// function IsOldKey(const AKey: string): Boolean;
procedure SaveAsOldKey(const AKey: string);

function CCKeyEncrypt(const AText: string): string;
function CCKeyEncryptClob(const AText: string): string;
function CCKeyDecrypt(const AText: string): string;
function CCKeyDecryptClob(const AText: string): string;

implementation

uses
  cc_const,
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

procedure ResetPackage;
begin
  { 06/19/2012  Update the credit card package.  The hash secret
    below is required for the methods in package, CC_ENCRYPT, to be
    of any use.  We do this to prevent unauthorized use of the
    package functions. Also, we use a parameterized query so that
    the value cannot be intercepted. }
  ExecuteCommandParam(
    'BEGIN'#13 +
    '   iqms.cc_encrypt.reset;'#13 +
    '   iqms.cc_encrypt.set_iqms_hash_secret('#13 +
    '      :HASH_SECRET);'#13 +
    'END;',
    ['HASH_SECRET;S'],
    [cc_const.CC_ENCRYPT_HASH_KEY]);
  IQMS.DBTrans.dbtdbexp.DBX_RunSQLParam(
    'BEGIN'#13 +
    '   iqms.cc_encrypt.reset;'#13 +
    '   iqms.cc_encrypt.set_iqms_hash_secret('#13 +
    '      :HASH_SECRET);'#13 +
    'END;',
    ['HASH_SECRET;S'],
    [cc_const.CC_ENCRYPT_HASH_KEY]);
  // 10/21/2014
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('BEGIN');
      SQL.Add('   iqms.cc_encrypt.reset;');
      SQL.Add('   iqms.cc_encrypt.set_iqms_hash_secret(');
      SQL.Add('      :HASH_SECRET);');
      SQL.Add('END;');
      with Params.ParamByName('HASH_SECRET') do
      begin
        DataType := ftString;
        ParamType := ptInput;
        AsString := cc_const.CC_ENCRYPT_HASH_KEY;
      end;
      Execute;
    finally
      Free;
    end;
end;

function HasEncryption: Boolean;
begin
  Result := IQMS.DBTrans.dbtdbexp.DBX_GetValInt(
    'SELECT cc_encrypt.has_encryption FROM DUAL') = 1;
end;

procedure GetEncryptionKeys(var AKey1, AKey2, AKey3: string);
var
  AValue: string;
begin
  // Initialize var params
  AKey1 := '';
  AKey2 := '';
  AKey3 := '';

  // Get the full, concatenated encryption key
  AValue := IQMS.DBTrans.dbtdbexp.DBX_GetValStrParam
    ('SELECT iqms.iqcrypto.get_decrypted(:PASSWORD,hash_key) AS hash_key ' +
    'FROM credit_card_setting WHERE ROWNUM < 2', ['PASSWORD;S'],
    [cc_const.CCENCRYPT_PASSWORD]);

  AKey1 := IQMS.Common.StringUtils.GetToken(AValue, #13, 1);
  AKey2 := IQMS.Common.StringUtils.GetToken(AValue, #13, 2);
  AKey3 := IQMS.Common.StringUtils.GetToken(AValue, #13, 3);
end;

procedure SaveEncryptionKeys(const AKey1, AKey2, AKey3: string);
var
  ANewKey: string;
begin
  ANewKey := Format('%s'#13'%s'#13'%s', [AKey1, AKey2, AKey3]);

  // Note:  Do not use the DBExpress because this SQL is run using
  // a rollback segment.
  ExecuteCommandParam
    ('UPDATE credit_card_setting SET hash_key = iqms.iqcrypto.get_encrypted(' +
    ':PASSWORD, :NEW_KEY)', ['PASSWORD;S', 'NEW_KEY;S'],
    [cc_const.CCENCRYPT_PASSWORD, ANewKey]);
end;

function CCKeyEncrypt(const AText: string): string;
begin
  // Initialize
  Result := '';
  if not AText.IsEmpty then
    Result := IQMS.DBTrans.dbtdbexp.DBX_GetValStrParam
      ('SELECT iqms.cc_encrypt.get_encrypted(:VALUE) FROM DUAL ',
      ['VALUE;S'], [AText]);
end;

function CCKeyEncryptClob(const AText: string): string;
begin
  // Initialize
  Result := '';
  if not AText.IsEmpty then
    Result := IQMS.DBTrans.dbtdbexp.DBX_GetValStrParam
      ('SELECT iqms.cc_encrypt.get_encrypted_clob(:VALUE) AS some_val FROM DUAL ',
      ['VALUE;S'], [AText]);
end;

function CCKeyDecrypt(const AText: string): string;
begin
  // Initialize
  Result := '';
  if not AText.IsEmpty then
    Result := IQMS.DBTrans.dbtdbexp.DBX_GetValStrParam
      ('SELECT iqms.cc_encrypt.get_decrypted(:VALUE) FROM DUAL ',
      ['VALUE;S'], [AText]);
end;

function CCKeyDecryptClob(const AText: string): string;
begin
  // Initialize
  Result := '';
  if not AText.IsEmpty then
    Result := IQMS.DBTrans.dbtdbexp.DBX_GetValStrParam
      ('SELECT iqms.cc_encrypt.get_decrypted_clob(:VALUE) FROM DUAL ',
      ['VALUE;S'], [AText]);
end;

procedure SaveAsOldKey(const AKey: string);
begin

  // Do not attempt to add the value, if it already exists
  if (Trim(AKey) = '') { or IsOldKey(AKey) } then
    Exit;

  // Save the encrypted key.  We pass the unencrypted value to the
  // SQL, and let the package encrypt it.  Since we are using
  // params, this SQL cannot be intercepted by SQL Monitor.
  IQMS.DBTrans.dbtdbexp.DBX_RunSQLParam(
    'INSERT INTO credit_card_key (id, key) ' +
    'VALUES (s_credit_card_key.NEXTVAL, iqms.iqcrypto.get_encrypted(:PASSWORD,:KEY))',
    ['PASSWORD;S', 'KEY;S'], [cc_const.CCENCRYPT_PASSWORD, AKey]);
  // Purge the credit card key table so that it contains only 4 records
  IQMS.DBTrans.dbtdbexp.DBX_RunSQL(
    'DELETE FROM credit_card_key'#13 +
    '      WHERE id < (SELECT MIN(id)'#13 +
    '                    FROM (  SELECT id'#13 +
    '                              FROM credit_card_key'#13 +
    '                          ORDER BY id DESC)'#13 +
    '                   WHERE ROWNUM < 5)');
end;

end.
