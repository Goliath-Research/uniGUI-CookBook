unit dbtemptables;

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
  SqlExpr,
  DBClient;

  function GetTempTableName(const ASQLConnection: TSQLConnection): String;

  // drops the temp tables created during this session
  procedure DropTempTablesForSession(const ASQLConnection: TSQLConnection);

var
   TempTableList: array of String;

implementation

uses
  IQMS.DBTrans.dbtshare,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils;

function GetTempTableName(const ASQLConnection: TSQLConnection): String;
var
   ATableName, AStub, AUserName: String;
   i, x: Integer;
begin
     // Returns a unique temporary table name.
     // This method also keeps a list of temporary tables created for this
     // instance.  Call DropTempTablesForSession (below) to remove the
     // temporary tables when the application closes.

     // The basic stub of the temporary table name
     AUserName := 'TEMPUSER';
     if (SecurityManager <> nil) then
        AUserName := SecurityManager.UserName;

     AStub  := Copy( 'TMP_' + FormatDateTime( 'mmddyyyy', Date ) + AUserName, 0, 23 );

     // Initialize counter
     i := 1;

     // Cycle Oracle database to ensure a unique table name
     // NOTE:  We also check the list of previously created temp tables for
     //        this application instance, so there is no overlapping.  
     repeat
        ATableName := UpperCase( Format( '%s_%d', [AStub, i] ));
        Inc( i );
     until not IQTableExists(ASQLConnection, ATableName ) and 
           not StrInList( ATableName, TempTableList ); // in IQMS.Data.Lib; iqstring

     // Return the resulting table name
     Result := ATableName;

     // Add table name to list
     x := High(TempTableList);
     SetLength(TempTableList,x+2);
     TempTableList[x+1] := ATableName;
end;

procedure DropTempTablesForSession(const ASQLConnection: TSQLConnection);
var
   i: Integer;
   ATableName: String;
begin
  // Drops temporary tables created during this application instance.
  // Sometimes users might create multiple temporary tables.  This can
  // happen when users click the back button to load a different dataset
  // on an import/export wizard.
  for i := 0 to High(TempTableList) do
   begin
     ATableName := Trim( TempTableList[i] );
     if ( ATableName > '' ) and
        IQMS.DBTrans.dbtshare.TableExists(ASQLConnection, ATableName ) then
        IQMS.DBTrans.dbtshare.DropTable(ASQLConnection, ATableName );
   end;
end;



end.
