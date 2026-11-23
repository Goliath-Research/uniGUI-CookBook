unit GoogleIdToken;

{ Server-side verification of Google Sign-In ID tokens.

  Everything the browser sends is untrusted. A token is accepted only when
  its RS256 signature verifies against one of Google's published signing
  keys and its iss, aud, exp, iat, sub and email_verified claims are valid.
  The session identity must be taken from the returned TGoogleIdentity,
  never from other request parameters. }

interface

uses
  SysUtils, Classes;

type
  TGoogleIdentity = record
    Subject  : string;
    Email    : string;
    FullName : string;
    ImageURL : string;
    IdToken  : string;
  end;

  TGoogleTokenCheck = (gtValid, gtMalformed, gtUnknownKey, gtBadSignature, gtBadClaims);

{ Verifies IdToken against Google's current signing keys, fetched from
  GoogleCertsURL and cached. Returns False for any token that is not a
  valid, unexpired Google ID token issued to ClientId. }
function VerifyGoogleIdToken(const IdToken, ClientId: string;
  out Identity: TGoogleIdentity): Boolean;

{ Same checks against an explicit JWKS document and clock. }
function CheckGoogleIdToken(const IdToken, ClientId, CertsJson: string;
  NowUnix: Int64; out Identity: TGoogleIdentity): TGoogleTokenCheck;

const
  GoogleCertsURL = 'https://www.googleapis.com/oauth2/v3/certs';

implementation

{$Q-}
{$R-}

uses
  SyncObjs, DateUtils,
  {$IFDEF FPC}
  fpjson, jsonparser, fphttpclient, opensslsockets;
  {$ELSE}
  System.JSON, System.Net.URLClient, System.Net.HttpClient;
  {$ENDIF}

const
  MaxTokenLength     = 16384;
  ClockSkewSeconds   = 300;
  DefaultCertsMaxAge = 3600;
  MinCertsRefetch    = 60;

{$IFDEF FPC}
type
  TJsonNode = TJSONData;
{$ELSE}
type
  TJsonNode = TJSONValue;
{$ENDIF}

{ ---- JSON access ------------------------------------------------------- }

function ParseJsonText(const Text: string): TJSONObject;
var
  Node: TJsonNode;
begin
  Result := nil;
  try
    {$IFDEF FPC}
    Node := GetJSON(Text);
    {$ELSE}
    Node := TJSONObject.ParseJSONValue(Text);
    {$ENDIF}
  except
    Exit;
  end;
  if Node is TJSONObject then
    Result := TJSONObject(Node)
  else
    Node.Free;
end;

function ParseJsonBytes(const Data: TBytes): TJSONObject;
{$IFDEF FPC}
var
  Text: UTF8String;
begin
  SetLength(Text, Length(Data));
  if Length(Data) > 0 then
    Move(Data[0], Text[1], Length(Data));
  Result := ParseJsonText(Text);
end;
{$ELSE}
begin
  try
    Result := ParseJsonText(TEncoding.UTF8.GetString(Data));
  except
    Result := nil;
  end;
end;
{$ENDIF}

function JsonMember(Obj: TJSONObject; const Name: string): TJsonNode;
begin
  {$IFDEF FPC}
  Result := Obj.Find(Name);
  {$ELSE}
  Result := Obj.GetValue(Name);
  {$ENDIF}
end;

function JsonString(Obj: TJSONObject; const Name: string; out Value: string): Boolean;
var
  Node: TJsonNode;
begin
  Value := '';
  Node := JsonMember(Obj, Name);
  {$IFDEF FPC}
  Result := (Node <> nil) and (Node.JSONType = jtString);
  if Result then
    Value := Node.AsString;
  {$ELSE}
  Result := (Node is TJSONString) and not (Node is TJSONNumber);
  if Result then
    Value := TJSONString(Node).Value;
  {$ENDIF}
end;

function JsonInt64(Obj: TJSONObject; const Name: string; out Value: Int64): Boolean;
var
  Node: TJsonNode;
begin
  Value := 0;
  Node := JsonMember(Obj, Name);
  try
    {$IFDEF FPC}
    Result := (Node <> nil) and (Node.JSONType = jtNumber);
    if Result then
      Value := Node.AsInt64;
    {$ELSE}
    Result := Node is TJSONNumber;
    if Result then
      Value := TJSONNumber(Node).AsInt64;
    {$ENDIF}
  except
    Result := False;
  end;
end;

function JsonTrue(Obj: TJSONObject; const Name: string): Boolean;
var
  Node: TJsonNode;
  S: string;
begin
  Node := JsonMember(Obj, Name);
  {$IFDEF FPC}
  Result := (Node <> nil) and (Node.JSONType = jtBoolean) and Node.AsBoolean;
  {$ELSE}
  Result := (Node is TJSONBool) and TJSONBool(Node).AsBoolean;
  {$ENDIF}
  if not Result and JsonString(Obj, Name, S) then
    Result := S = 'true';
end;

function JsonArray(Obj: TJSONObject; const Name: string; out Value: TJSONArray): Boolean;
var
  Node: TJsonNode;
begin
  Node := JsonMember(Obj, Name);
  Result := Node is TJSONArray;
  if Result then
    Value := TJSONArray(Node)
  else
    Value := nil;
end;

{ ---- Encoding ---------------------------------------------------------- }

function Base64UrlDecode(const S: string; out Data: TBytes): Boolean;
var
  I, V, N, BitCount: Integer;
  Bits: Cardinal;
begin
  Result := False;
  SetLength(Data, (Length(S) * 6) div 8);
  if Length(S) mod 4 = 1 then
    Exit;
  N := 0;
  Bits := 0;
  BitCount := 0;
  for I := 1 to Length(S) do
  begin
    case S[I] of
      'A'..'Z': V := Ord(S[I]) - Ord('A');
      'a'..'z': V := Ord(S[I]) - Ord('a') + 26;
      '0'..'9': V := Ord(S[I]) - Ord('0') + 52;
      '-': V := 62;
      '_': V := 63;
    else
      Exit;
    end;
    Bits := (Bits shl 6) or Cardinal(V);
    Inc(BitCount, 6);
    if BitCount >= 8 then
    begin
      Dec(BitCount, 8);
      Data[N] := Byte(Bits shr BitCount);
      Inc(N);
      Bits := Bits and ((Cardinal(1) shl BitCount) - 1);
    end;
  end;
  { Non-canonical encodings (unused trailing bits set) are rejected. }
  if Bits <> 0 then
    Exit;
  SetLength(Data, N);
  Result := True;
end;

function StripLeadingZeros(const Data: TBytes): TBytes;
var
  I: Integer;
begin
  I := 0;
  while (I < Length(Data)) and (Data[I] = 0) do
    Inc(I);
  Result := Copy(Data, I, Length(Data) - I);
end;

{ ---- SHA-256 (FIPS 180-4) ---------------------------------------------- }

const
  Sha256K: array[0..63] of Cardinal = (
    $428a2f98, $71374491, $b5c0fbcf, $e9b5dba5, $3956c25b, $59f111f1, $923f82a4, $ab1c5ed5,
    $d807aa98, $12835b01, $243185be, $550c7dc3, $72be5d74, $80deb1fe, $9bdc06a7, $c19bf174,
    $e49b69c1, $efbe4786, $0fc19dc6, $240ca1cc, $2de92c6f, $4a7484aa, $5cb0a9dc, $76f988da,
    $983e5152, $a831c66d, $b00327c8, $bf597fc7, $c6e00bf3, $d5a79147, $06ca6351, $14292967,
    $27b70a85, $2e1b2138, $4d2c6dfc, $53380d13, $650a7354, $766a0abb, $81c2c92e, $92722c85,
    $a2bfe8a1, $a81a664b, $c24b8b70, $c76c51a3, $d192e819, $d6990624, $f40e3585, $106aa070,
    $19a4c116, $1e376c08, $2748774c, $34b0bcb5, $391c0cb3, $4ed8aa4a, $5b9cca4f, $682e6ff3,
    $748f82ee, $78a5636f, $84c87814, $8cc70208, $90befffa, $a4506ceb, $bef9a3f7, $c67178f2);

function Ror32(X: Cardinal; N: Integer): Cardinal;
begin
  Result := Cardinal((X shr N) or (X shl (32 - N)));
end;

function Sha256(const Data: TBytes): TBytes;
var
  H: array[0..7] of Cardinal;
  W: array[0..63] of Cardinal;
  Msg: TBytes;
  Len, Blk, I: Integer;
  BitLen: UInt64;
  A, B, C, D, E, F, G, HH, S0, S1, T1, T2: Cardinal;
begin
  H[0] := $6a09e667; H[1] := $bb67ae85; H[2] := $3c6ef372; H[3] := $a54ff53a;
  H[4] := $510e527f; H[5] := $9b05688c; H[6] := $1f83d9ab; H[7] := $5be0cd19;

  Len := Length(Data);
  SetLength(Msg, ((Len + 9 + 63) div 64) * 64);
  FillChar(Msg[0], Length(Msg), 0);
  if Len > 0 then
    Move(Data[0], Msg[0], Len);
  Msg[Len] := $80;
  BitLen := UInt64(Len) * 8;
  for I := 0 to 7 do
    Msg[Length(Msg) - 1 - I] := Byte(BitLen shr (8 * I));

  Blk := 0;
  while Blk < Length(Msg) do
  begin
    for I := 0 to 15 do
      W[I] := (Cardinal(Msg[Blk + 4 * I]) shl 24) or (Cardinal(Msg[Blk + 4 * I + 1]) shl 16) or
              (Cardinal(Msg[Blk + 4 * I + 2]) shl 8) or Cardinal(Msg[Blk + 4 * I + 3]);
    for I := 16 to 63 do
    begin
      S0 := Ror32(W[I - 15], 7) xor Ror32(W[I - 15], 18) xor (W[I - 15] shr 3);
      S1 := Ror32(W[I - 2], 17) xor Ror32(W[I - 2], 19) xor (W[I - 2] shr 10);
      W[I] := Cardinal(W[I - 16] + S0 + W[I - 7] + S1);
    end;

    A := H[0]; B := H[1]; C := H[2]; D := H[3];
    E := H[4]; F := H[5]; G := H[6]; HH := H[7];
    for I := 0 to 63 do
    begin
      S1 := Ror32(E, 6) xor Ror32(E, 11) xor Ror32(E, 25);
      T1 := Cardinal(HH + S1 + ((E and F) xor ((not E) and G)) + Sha256K[I] + W[I]);
      S0 := Ror32(A, 2) xor Ror32(A, 13) xor Ror32(A, 22);
      T2 := Cardinal(S0 + ((A and B) xor (A and C) xor (B and C)));
      HH := G; G := F; F := E;
      E := Cardinal(D + T1);
      D := C; C := B; B := A;
      A := Cardinal(T1 + T2);
    end;
    H[0] := Cardinal(H[0] + A); H[1] := Cardinal(H[1] + B);
    H[2] := Cardinal(H[2] + C); H[3] := Cardinal(H[3] + D);
    H[4] := Cardinal(H[4] + E); H[5] := Cardinal(H[5] + F);
    H[6] := Cardinal(H[6] + G); H[7] := Cardinal(H[7] + HH);
    Inc(Blk, 64);
  end;

  SetLength(Result, 32);
  for I := 0 to 7 do
  begin
    Result[4 * I]     := Byte(H[I] shr 24);
    Result[4 * I + 1] := Byte(H[I] shr 16);
    Result[4 * I + 2] := Byte(H[I] shr 8);
    Result[4 * I + 3] := Byte(H[I]);
  end;
end;

{ ---- RSA public-key operation (Montgomery arithmetic) ------------------ }

type
  TLimbs = array of Cardinal;

function BytesToLimbs(const Data: TBytes; Count: Integer): TLimbs;
var
  I, J: Integer;
begin
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
    Result[I] := 0;
  for I := 0 to High(Data) do
  begin
    J := High(Data) - I;
    Result[J div 4] := Result[J div 4] or (Cardinal(Data[I]) shl (8 * (J mod 4)));
  end;
end;

function LimbsToBytes(const L: TLimbs; ByteLen: Integer): TBytes;
var
  J: Integer;
begin
  SetLength(Result, ByteLen);
  for J := 0 to ByteLen - 1 do
    Result[ByteLen - 1 - J] := Byte(L[J div 4] shr (8 * (J mod 4)));
end;

function CompareLimbs(const A, B: TLimbs): Integer;
var
  I: Integer;
begin
  for I := High(A) downto 0 do
    if A[I] <> B[I] then
    begin
      if A[I] > B[I] then
        Result := 1
      else
        Result := -1;
      Exit;
    end;
  Result := 0;
end;

procedure SubtractLimbs(var A: TLimbs; const B: TLimbs);
var
  I: Integer;
  Borrow, Diff: Int64;
begin
  Borrow := 0;
  for I := 0 to High(A) do
  begin
    Diff := Int64(A[I]) - Int64(B[I]) - Borrow;
    if Diff < 0 then
    begin
      Diff := Diff + $100000000;
      Borrow := 1;
    end
    else
      Borrow := 0;
    A[I] := Cardinal(Diff);
  end;
end;

{ Returns A * B * 2^(-32*Count) mod N for A, B < N, N odd. }
function MontMul(const A, B, N: TLimbs; NPrime: Cardinal): TLimbs;
var
  T: array of Cardinal;
  I, J, K: Integer;
  S, Carry: UInt64;
  M: Cardinal;
begin
  K := Length(N);
  SetLength(T, K + 2);
  for J := 0 to K + 1 do
    T[J] := 0;
  for I := 0 to K - 1 do
  begin
    Carry := 0;
    for J := 0 to K - 1 do
    begin
      S := UInt64(T[J]) + UInt64(A[J]) * UInt64(B[I]) + Carry;
      T[J] := Cardinal(S);
      Carry := S shr 32;
    end;
    S := UInt64(T[K]) + Carry;
    T[K] := Cardinal(S);
    T[K + 1] := Cardinal(S shr 32);

    M := Cardinal(UInt64(T[0]) * UInt64(NPrime));
    S := UInt64(T[0]) + UInt64(M) * UInt64(N[0]);
    Carry := S shr 32;
    for J := 1 to K - 1 do
    begin
      S := UInt64(T[J]) + UInt64(M) * UInt64(N[J]) + Carry;
      T[J - 1] := Cardinal(S);
      Carry := S shr 32;
    end;
    S := UInt64(T[K]) + Carry;
    T[K - 1] := Cardinal(S);
    T[K] := Cardinal(UInt64(T[K + 1]) + (S shr 32));
  end;
  SetLength(Result, K);
  for J := 0 to K - 1 do
    Result[J] := T[J];
  if (T[K] <> 0) or (CompareLimbs(Result, N) >= 0) then
    SubtractLimbs(Result, N);
end;

{ Base^Exponent mod N, with Base < N and N odd. }
function ModPow(const Base: TLimbs; const Exponent: TBytes; const N: TLimbs): TLimbs;
var
  K, I, Bit: Integer;
  Inv, Y: Cardinal;
  NPrime: Cardinal;
  R2, One, BaseM, Acc: TLimbs;
  Carry: Boolean;
begin
  K := Length(N);

  Inv := 1;
  for I := 1 to 5 do
  begin
    Y := Cardinal(UInt64(N[0]) * UInt64(Inv));
    Y := Cardinal(UInt64(2) - UInt64(Y));
    Inv := Cardinal(UInt64(Inv) * UInt64(Y));
  end;
  NPrime := Cardinal(UInt64($100000000) - UInt64(Inv));

  { R2 = 2^(64*K) mod N, by repeated doubling from 1. }
  SetLength(R2, K);
  for I := 0 to K - 1 do
    R2[I] := 0;
  R2[0] := 1;
  for Bit := 1 to 64 * K do
  begin
    Carry := (R2[K - 1] shr 31) <> 0;
    for I := K - 1 downto 1 do
      R2[I] := Cardinal((R2[I] shl 1) or (R2[I - 1] shr 31));
    R2[0] := Cardinal(R2[0] shl 1);
    if Carry or (CompareLimbs(R2, N) >= 0) then
      SubtractLimbs(R2, N);
  end;

  SetLength(One, K);
  for I := 0 to K - 1 do
    One[I] := 0;
  One[0] := 1;

  BaseM := MontMul(Base, R2, N, NPrime);
  Acc := MontMul(One, R2, N, NPrime);
  for I := 0 to High(Exponent) do
    for Bit := 7 downto 0 do
    begin
      Acc := MontMul(Acc, Acc, N, NPrime);
      if (Exponent[I] shr Bit) and 1 <> 0 then
        Acc := MontMul(Acc, BaseM, N, NPrime);
    end;
  Result := MontMul(Acc, One, N, NPrime);
end;

{ RSASSA-PKCS1-v1_5 with SHA-256 (RFC 8017, section 8.2.2). }
function RsaVerifySha256(const Modulus, Exponent, Signature, Message: TBytes): Boolean;
const
  DigestInfo: array[0..18] of Byte = (
    $30, $31, $30, $0d, $06, $09, $60, $86, $48, $01, $65, $03, $04, $02, $01, $05, $00, $04, $20);
var
  N, E, Expected, Actual, Digest: TBytes;
  ByteLen, Limbs, I, PadEnd: Integer;
  NL, SL: TLimbs;
begin
  Result := False;
  N := StripLeadingZeros(Modulus);
  E := StripLeadingZeros(Exponent);
  ByteLen := Length(N);
  if (ByteLen < 256) or (ByteLen > 1024) or ((N[ByteLen - 1] and 1) = 0) then
    Exit;
  if (Length(E) = 0) or (Length(E) > 4) or ((E[High(E)] and 1) = 0) or
     ((Length(E) = 1) and (E[0] < 3)) then
    Exit;
  if Length(Signature) <> ByteLen then
    Exit;

  Limbs := (ByteLen + 3) div 4;
  NL := BytesToLimbs(N, Limbs);
  SL := BytesToLimbs(Signature, Limbs);
  if CompareLimbs(SL, NL) >= 0 then
    Exit;
  Actual := LimbsToBytes(ModPow(SL, E, NL), ByteLen);

  Digest := Sha256(Message);
  SetLength(Expected, ByteLen);
  PadEnd := ByteLen - Length(DigestInfo) - Length(Digest) - 1;
  Expected[0] := $00;
  Expected[1] := $01;
  for I := 2 to PadEnd - 1 do
    Expected[I] := $FF;
  Expected[PadEnd] := $00;
  for I := 0 to High(DigestInfo) do
    Expected[PadEnd + 1 + I] := DigestInfo[I];
  for I := 0 to High(Digest) do
    Expected[PadEnd + 1 + Length(DigestInfo) + I] := Digest[I];

  for I := 0 to ByteLen - 1 do
    if Actual[I] <> Expected[I] then
      Exit;
  Result := True;
end;

{ ---- Token checks ------------------------------------------------------ }

function SplitToken(const IdToken: string; out SigningInput, Payload, Signature: TBytes;
  out Kid: string): Boolean;
var
  I, Dot1, Dot2: Integer;
  HeaderBytes: TBytes;
  Header: TJSONObject;
  Alg: string;
begin
  Result := False;
  Kid := '';
  if (Length(IdToken) = 0) or (Length(IdToken) > MaxTokenLength) then
    Exit;
  Dot1 := 0;
  Dot2 := 0;
  for I := 1 to Length(IdToken) do
    case IdToken[I] of
      'A'..'Z', 'a'..'z', '0'..'9', '-', '_': ;
      '.':
        if Dot1 = 0 then
          Dot1 := I
        else if Dot2 = 0 then
          Dot2 := I
        else
          Exit;
    else
      Exit;
    end;
  if (Dot1 <= 1) or (Dot2 <= Dot1 + 1) or (Dot2 = Length(IdToken)) then
    Exit;
  if not Base64UrlDecode(Copy(IdToken, 1, Dot1 - 1), HeaderBytes) or
     not Base64UrlDecode(Copy(IdToken, Dot1 + 1, Dot2 - Dot1 - 1), Payload) or
     not Base64UrlDecode(Copy(IdToken, Dot2 + 1, MaxInt), Signature) then
    Exit;

  SetLength(SigningInput, Dot2 - 1);
  for I := 1 to Dot2 - 1 do
    SigningInput[I - 1] := Byte(Ord(IdToken[I]));

  Header := ParseJsonBytes(HeaderBytes);
  if Header = nil then
    Exit;
  try
    Result := JsonString(Header, 'alg', Alg) and (Alg = 'RS256') and
              JsonString(Header, 'kid', Kid) and (Kid <> '') and
              (JsonMember(Header, 'crit') = nil);
  finally
    Header.Free;
  end;
end;

function FindSigningKey(const CertsJson, Kid: string; out Modulus, Exponent: TBytes): Boolean;
var
  Certs, Key: TJSONObject;
  Keys: TJSONArray;
  Node: TJsonNode;
  I: Integer;
  S, NS, ES: string;
begin
  Result := False;
  if CertsJson = '' then
    Exit;
  Certs := ParseJsonText(CertsJson);
  if Certs = nil then
    Exit;
  try
    if not JsonArray(Certs, 'keys', Keys) then
      Exit;
    for I := 0 to Keys.Count - 1 do
    begin
      Node := Keys.Items[I];
      if not (Node is TJSONObject) then
        Continue;
      Key := TJSONObject(Node);
      if not (JsonString(Key, 'kid', S) and (S = Kid)) then
        Continue;
      if (JsonString(Key, 'kty', S) and (S = 'RSA')) and
         ((JsonMember(Key, 'alg') = nil) or (JsonString(Key, 'alg', S) and (S = 'RS256'))) and
         ((JsonMember(Key, 'use') = nil) or (JsonString(Key, 'use', S) and (S = 'sig'))) and
         JsonString(Key, 'n', NS) and JsonString(Key, 'e', ES) and
         Base64UrlDecode(NS, Modulus) and Base64UrlDecode(ES, Exponent) then
      begin
        Result := True;
        Exit;
      end;
    end;
  finally
    Certs.Free;
  end;
end;

function CheckClaims(const Payload: TBytes; const ClientId: string; NowUnix: Int64;
  var Identity: TGoogleIdentity): Boolean;
var
  Claims: TJSONObject;
  Iss, Aud: string;
  Exp, Iat: Int64;
begin
  Result := False;
  Claims := ParseJsonBytes(Payload);
  if Claims = nil then
    Exit;
  try
    if not (JsonString(Claims, 'iss', Iss) and
            ((Iss = 'accounts.google.com') or (Iss = 'https://accounts.google.com'))) then
      Exit;
    if not (JsonString(Claims, 'aud', Aud) and (Aud = ClientId)) then
      Exit;
    if not (JsonInt64(Claims, 'exp', Exp) and JsonInt64(Claims, 'iat', Iat)) then
      Exit;
    if (Exp <= NowUnix) or (Iat > NowUnix + ClockSkewSeconds) or (Iat >= Exp) then
      Exit;
    if not (JsonString(Claims, 'sub', Identity.Subject) and (Identity.Subject <> '')) then
      Exit;
    if not (JsonString(Claims, 'email', Identity.Email) and (Identity.Email <> '') and
            JsonTrue(Claims, 'email_verified')) then
      Exit;
    JsonString(Claims, 'name', Identity.FullName);
    JsonString(Claims, 'picture', Identity.ImageURL);
    Result := True;
  finally
    Claims.Free;
  end;
end;

procedure ClearIdentity(out Identity: TGoogleIdentity);
begin
  Identity.Subject  := '';
  Identity.Email    := '';
  Identity.FullName := '';
  Identity.ImageURL := '';
  Identity.IdToken  := '';
end;

function CheckGoogleIdToken(const IdToken, ClientId, CertsJson: string;
  NowUnix: Int64; out Identity: TGoogleIdentity): TGoogleTokenCheck;
var
  SigningInput, Payload, Signature, Modulus, Exponent: TBytes;
  Kid: string;
  Claims: TGoogleIdentity;
begin
  ClearIdentity(Identity);
  if (ClientId = '') or not SplitToken(IdToken, SigningInput, Payload, Signature, Kid) then
    Exit(gtMalformed);
  if not FindSigningKey(CertsJson, Kid, Modulus, Exponent) then
    Exit(gtUnknownKey);
  if not RsaVerifySha256(Modulus, Exponent, Signature, SigningInput) then
    Exit(gtBadSignature);
  ClearIdentity(Claims);
  if not CheckClaims(Payload, ClientId, NowUnix, Claims) then
    Exit(gtBadClaims);
  Claims.IdToken := IdToken;
  Identity := Claims;
  Result := gtValid;
end;

{ ---- Google signing keys ----------------------------------------------- }

var
  CertsLock      : TCriticalSection;
  CachedCerts    : string;
  CertsFetchedAt : Int64;
  CertsExpireAt  : Int64;

function UnixNow: Int64;
begin
  Result := DateTimeToUnix(Now, False);
end;

function CacheMaxAge(const CacheControl: string): Integer;
var
  P, I: Integer;
  Digits: string;
begin
  Result := DefaultCertsMaxAge;
  P := Pos('max-age=', LowerCase(CacheControl));
  if P = 0 then
    Exit;
  I := P + Length('max-age=');
  Digits := '';
  while (I <= Length(CacheControl)) and CharInSet(CacheControl[I], ['0'..'9']) and (Length(Digits) < 7) do
  begin
    Digits := Digits + CacheControl[I];
    Inc(I);
  end;
  Result := StrToIntDef(Digits, DefaultCertsMaxAge);
  if Result < MinCertsRefetch then
    Result := MinCertsRefetch;
  if Result > 86400 then
    Result := 86400;
end;

function FetchGoogleCerts(out Json: string; out MaxAge: Integer): Boolean;
{$IFDEF FPC}
var
  Client: TFPHTTPClient;
begin
  Result := False;
  Json := '';
  MaxAge := DefaultCertsMaxAge;
  Client := TFPHTTPClient.Create(nil);
  try
    try
      Json := Client.Get(GoogleCertsURL);
      MaxAge := CacheMaxAge(TFPHTTPClient.GetHeader(Client.ResponseHeaders, 'Cache-Control'));
      Result := Client.ResponseStatusCode = 200;
    except
      Result := False;
    end;
  finally
    Client.Free;
  end;
end;
{$ELSE}
var
  Client: THTTPClient;
  Response: IHTTPResponse;
begin
  Result := False;
  Json := '';
  MaxAge := DefaultCertsMaxAge;
  Client := THTTPClient.Create;
  try
    try
      Response := Client.Get(GoogleCertsURL);
      if Response.StatusCode = 200 then
      begin
        Json := Response.ContentAsString(TEncoding.UTF8);
        MaxAge := CacheMaxAge(Response.HeaderValue['Cache-Control']);
        Result := True;
      end;
    except
      Result := False;
    end;
  finally
    Client.Free;
  end;
end;
{$ENDIF}

function GoogleCerts(Refresh: Boolean): string;
var
  NowUnix: Int64;
  Json: string;
  MaxAge: Integer;
begin
  CertsLock.Acquire;
  try
    NowUnix := UnixNow;
    if (CachedCerts = '') or (NowUnix >= CertsExpireAt) or
       (Refresh and (NowUnix - CertsFetchedAt >= MinCertsRefetch)) then
    begin
      CertsFetchedAt := NowUnix;
      if FetchGoogleCerts(Json, MaxAge) then
      begin
        CachedCerts := Json;
        CertsExpireAt := NowUnix + MaxAge;
      end
      else if NowUnix >= CertsExpireAt then
        CachedCerts := '';
    end;
    Result := CachedCerts;
  finally
    CertsLock.Release;
  end;
end;

function VerifyGoogleIdToken(const IdToken, ClientId: string;
  out Identity: TGoogleIdentity): Boolean;
var
  SigningInput, Payload, Signature: TBytes;
  Kid: string;
  Check: TGoogleTokenCheck;
begin
  ClearIdentity(Identity);
  Result := False;
  if (ClientId = '') or not SplitToken(IdToken, SigningInput, Payload, Signature, Kid) then
    Exit;
  Check := CheckGoogleIdToken(IdToken, ClientId, GoogleCerts(False), UnixNow, Identity);
  if Check = gtUnknownKey then
    Check := CheckGoogleIdToken(IdToken, ClientId, GoogleCerts(True), UnixNow, Identity);
  Result := Check = gtValid;
end;

initialization
  CertsLock := TCriticalSection.Create;

finalization
  CertsLock.Free;

end.
