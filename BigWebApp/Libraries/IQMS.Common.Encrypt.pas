unit IQMS.Common.Encrypt;


interface

uses
  Windows, Forms, SysUtils, Variants, Classes, Controls,
  LbClass, LbCipher, LbString, uCSharpZeroPadding,
  uTPLb_CryptographicLibrary, uTPLb_Codec;


function AESCSharpCompatibleDecrypt(const AText: String): String;

implementation

// Decryption using AES-128, ECB, ISO 9797-1 method 2 padding, no IV, no nonce, no salt
function AESCSharpCompatibleDecrypt(const AText: String): String;
const
  KEY: array [0 .. 15] of byte =
  ($4C, $A1, $47, $76, $F1, $80, $45, $55, $5C, $7F, $FA, $E1, $E8, $63, $3C, $2D);
var
  AMemoryStream: TMemoryStream;
  AInput,
  AOutput   : ansistring;
  ACryptLib : TCryptographicLibrary;
  ACodec    : TCodec;
begin
  ACryptLib := TCryptographicLibrary.Create(Application);
  try
    ACodec := TCodec.Create(Application);
    try
      with ACodec do
      begin
        AsymetricKeySizeInBits:= 1024;
        CryptoLibrary         := ACryptLib;
        StreamCipherId        := 'native.StreamToBlock';
        BlockCipherId         := 'native.AES-128';
        ChainModeId           := 'native.ECB';
      end;

      ACryptLib.RegisterStreamCipher(TCSharpZeroPadding.Create);
      ACodec.StreamCipherId := 'Sedgwick.StreamToBlock';
      ACodec.Reset;

      AMemoryStream := TMemoryStream.Create;
      with AMemoryStream do
      try
        Write(KEY, 16);
        Position := 0;
        ACodec.InitFromStream(AMemoryStream);
      finally
        Free;
      end;

      AInput:= ansistring(AText);

      ACodec.DecryptAnsiString({var} AOutput, AInput);
    finally
      ACodec.Free;
    end;
  finally
    ACryptLib.Free;
  end;
  Result:= AOutput;
end;

end.
