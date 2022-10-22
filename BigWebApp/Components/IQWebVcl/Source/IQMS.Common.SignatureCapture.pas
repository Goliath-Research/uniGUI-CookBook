unit IQMS.Common.SignatureCapture;

interface

function DoSignatureCapture(ATableName, AColumnName:String; AID:Real):Boolean;

implementation

uses
  IQMS.Common.DotNetCOMInterOp, Vcl.Controls,
  IQMS.WebVcl.SecurityManager, IQMS.Common.Miscellaneous;

// Returns true if the signature was written to the database, otherwise false
function DoSignatureCapture(ATableName, AColumnName:String; AID:Real):Boolean;
var
  CW:Word;
  ASigDLL:Variant;
begin
  DisableFPUExceptions(CW);
  try
    CreateDNetCom( ASigDLL,
                   'SignatureCapture',
                   'IQMS.SignatureCapture.FormSignatureMain' );

    ASigDLL.OracleAlias:= IQGetServerName( 'IQ' );
    ASigDLL.Password   := IQGetPassword( 'IQ' );
    ASigDLL.TableName  := ATableName;
    ASigDLL.ColumnName := AColumnName;
    ASigDLL.IDofRow    := Integer( Trunc( AID ) );

    Result:= ASigDLL.ShowDialog = mrOk;
  finally
    FreeDNetObject(ASigDLL);

    RestoreFPU(CW);
  end;
end;

end.

