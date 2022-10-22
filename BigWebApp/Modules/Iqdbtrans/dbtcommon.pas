unit dbtcommon;

(* *****************************************************************************

   *** DBTrans Global Variables ***

   This unit contains global variables used by the IQDBTRANS system.
   When the entry methods, contained in "\IQDBTrans.pas," are
   called, one or more objects must be created, initialized and
   shared between multiple units during the import/export process.
   Apart from creating a large component class, which contains the
   objects internally, we rely on the shared declarations in this
   unit.

 **************************************************************************** *)

interface

uses
  Windows,
  Forms,
  SysUtils,
  Variants,
  DB,
  SqlExpr,
  uniGUIApplication,
  FireDAC.Comp.Client,
  IQMS.Common.DataConst,
  IQMS.DBTrans.dbttypes;

  // *** SQL Connection Object ***
  // Prepare the global, SQLConnection object.  The function will
  // return True if the object exists and it connected successfully.
  function PrepareSQLConnection: Boolean;
  // Disconnect and free the SQLConnection object.
  procedure FreeSQLConnection;

var
   // *** Gobal variables.  ***
   // These are set in the IQDBTrans unit, and are shared among the smaller,
   // import/export units.
   SQLConnection: TSQLConnection;

implementation

uses
  IQMS.DBTrans.dbtdbexp;

function PrepareSQLConnection: Boolean;
begin

  result:= (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).Connected;
  exit;


  // If no SQLConnection has been assigned, then create one.
  // This object will be used globally until it is freed by
  // the application.
  if not Assigned(SQLConnection) then
    SQLConnection := TSQLConnection.Create(Application);

  // If the object has not yet connected to the database, then
  // ensure that it has been properly configured.
  if not SQLConnection.Connected then
     begin
       // Configure the connection for the IQMS database instance.
       IQMS.DBTrans.dbtdbexp.DBX_ConfigureSQLConnection(SQLConnection);
       // Open the connection now!
       SQLConnection.Open;
     end;
  // Pass result based on connection state.
  Result := SQLConnection.Connected;
end;

procedure FreeSQLConnection;
begin

  exit;

  // Disconnect and free the SQLConnection object
  if Assigned(SQLConnection) then
     begin
       SQLConnection.Connected := False;
       FreeAndNil(SQLConnection);
     end;
end;

end.
