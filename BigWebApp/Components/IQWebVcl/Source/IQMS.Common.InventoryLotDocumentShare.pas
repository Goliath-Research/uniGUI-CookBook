unit IQMS.Common.InventoryLotDocumentShare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  FireDAC.Phys.Oracle;

/// <summary>Get the ID of the lot document that matches the parameters.
/// </summary>
/// <param name="AArinvtID">Real:  ID of the Inventory (ARINVT) item.
/// </param>
/// <param name="ALotNo">String:  Lot number
/// </param>
function GetInventoryLotDocumentID(const AArinvtID: Real;
  const ALotNo: string): Real;

/// <summary>Check whether an Inventory lot document exists for the given
/// inventory item and lot number; add it, if it does not exist.
/// </summary>
/// <param name="AArinvtID">Real:  ID of the Inventory (ARINVT) item.
/// </param>
/// <param name="ALotNo">String:  Lot number
/// </param>
/// <param name="ANewArinvtLotDocID">Real:  Returns ID of the new
/// ARINVT_LOT_DOCUMENT record.
/// </param>
/// <returns>True if the lot document was either found or added;
/// otherwise False if the lot document record could not be added.
/// </returns>
function AddInventoryLotDocument(const AArinvtID: Real; const ALotNo: string;
  var ANewArinvtLotDocID: Real): Boolean;

/// <summary>Check whether an Inventory lot document exists for the given
/// inventory item, lot number, and country; add it, if it does not exist.
/// </summary>
/// <param name="AArinvtID">Real:  ID of the Inventory (ARINVT) item.
/// </param>
/// <param name="ALotNo">String:  Lot number
/// </param>
/// <param name="ACountry">String:  Country
/// </param>
/// <param name="ANewArinvtLotDocID">Real:  Returns ID of the new
/// ARINVT_LOT_DOCUMENT record.
/// </param>
/// <returns>True if the lot document was either found or added;
/// otherwise False if the lot document record could not be added.
/// </returns>
function AddInventoryLotDocumentEx(const AArinvtID: Real;
  const ALotNo, ACountry: string; var ANewArinvtLotDocID: Real): Boolean;


/// <summary>Get the Country of the lot document that matches the parameters.
/// </summary>
/// <param name="AArinvtID">Real:  ID of the Inventory (ARINVT) item.
/// </param>
/// <param name="ALotNo">String:  Lot number
/// </param>
/// <returns>String: Country if the lot document was found 
/// and blank otherwise
/// </returns>
function GetInventoryLotDocumentCountry(const AArinvtID: Real;
  const ALotNo: string): string;
  

/// <summary>Update the Country of the lot document that matches the parameters.
/// </summary>
/// <param name="AArinvtLotDocs_ID">Real:  ID of the ARINVT_LOT_DOCS record.
/// </param>
/// <param name="ACountry">String:  Country
/// </param>
procedure UpdateInventoryLotDocumentCountry( AArinvtLotDocs_ID: Real; ACountry: string );


/// <summary>Copies Country of the lot document from one inventory item to another.
///  Inventory Lot Document (ARINVT_LOT_DOCS) is created if one does not exist.
/// </summary>
/// <param name="AFrom_Arinvt_ID">Real:  ID of the source ARINVT item
/// </param>
/// <param name="ATo_Arinvt_ID">Real:  ID of the target ARINVT item
/// </param>
/// <param name="ALotNo">String:  LotNo
/// </param>
///  <param name="ADefaultCountry">string: Optional
/// </param>
procedure CopyInventoryLotDocumentCountry( AFrom_Arinvt_ID, ATo_Arinvt_ID: Real; ALotNo: string; ADefaultCountry: string = '');
          
function GetInventoryEPlantCountry( AArinvt_ID: Real ): string;
  
implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;

procedure InsertInventoryLotDocument(const AArinvtID: Real;
  const ALotNo, ACountry: string; var ANewArinvtLotDocID: Real);
var
  ASQL: string;  
begin
  ANewArinvtLotDocID := GetNextID('arinvt_lot_docs');

  ASQL:= IQFormat('INSERT INTO arinvt_lot_docs(id, arinvt_id, lotno, country) ' +
                  'VALUES( %.0f, %.0f, ''%s'', ''%s'')',
                  [ANewArinvtLotDocID, AArinvtID, Trim(ALotNo), Trim(ACountry)]);
  
  ExecuteCommand( ASQL )
end;                             

function GetInventoryLotDocumentID(const AArinvtID: Real;
  const ALotNo: string): Real;
var
  ASQL: string;  
begin
  ASQL:= IQFormat('select id from arinvt_lot_docs where arinvt_id = %.0f and upper(rtrim(lotno)) = ''%s''', [ AArinvtID, FixStr(Trim(UpperCase( ALotNo ))) ]);
   
  Result:= SelectValueAsFloat( ASQL )
end;

function AddInventoryLotDocument(const AArinvtID: Real; const ALotNo: string;
  var ANewArinvtLotDocID: Real): Boolean;
begin
  ANewArinvtLotDocID := 0;
  if (AArinvtID = 0) or (ALotNo = '') then
    Exit(False);

  ANewArinvtLotDocID := GetInventoryLotDocumentID(AArinvtID, ALotNo);
  if ANewArinvtLotDocID = 0 then
    InsertInventoryLotDocument(AArinvtID, ALotNo, '', ANewArinvtLotDocID);
  Result := ANewArinvtLotDocID > 0;
end;

function AddInventoryLotDocumentEx(const AArinvtID: Real;
  const ALotNo, ACountry: string; var ANewArinvtLotDocID: Real): Boolean;
begin
  ANewArinvtLotDocID := 0;

  // Require values
  if (AArinvtID = 0) or (ALotNo = '') then
    Exit(False);

  // Get the existing record for this ARINVT_ID/LOTNO combination.
  ANewArinvtLotDocID := GetInventoryLotDocumentID(AArinvtID, ALotNo);
  // If the ARINVT_LOT_DOCS record does not exist, add it.
  if ANewArinvtLotDocID = 0 then
    InsertInventoryLotDocument(AArinvtID, ALotNo, ACountry, ANewArinvtLotDocID)
  // If the ARINVT_LOT_DOCS record does exist, then update the country.
  else
    UpdateInventoryLotDocumentCountry( ANewArinvtLotDocID, ACountry );
  // Return true if an ARINVT_LOT_DOCS record was either found or created.
  Result := ANewArinvtLotDocID > 0;
end;


function GetInventoryLotDocumentCountry(const AArinvtID: Real;
  const ALotNo: string): string;
var
  AArinvt_Lot_Docs_ID: Real;
  ASQL: string;  
begin
  Result:= '';
  AArinvt_Lot_Docs_ID:= GetInventoryLotDocumentID( AArinvtID, ALotNo );
  if AArinvt_Lot_Docs_ID = 0 then
     EXIT;

  ASQL:= IQFormat('select country from arinvt_lot_docs where id = %.0f', [ AArinvt_Lot_Docs_ID ]);
  
  Result:= SelectValueAsString( ASQL )
end;

procedure UpdateInventoryLotDocumentCountry( AArinvtLotDocs_ID: Real; ACountry: string );
var
  ASQL: string;  
begin           
  ASQL:= IQFormat('UPDATE arinvt_lot_docs SET country = ''%s'' WHERE id = %.0f',
                  [ACountry, AArinvtLotDocs_ID ]);
  
  ExecuteCommand( ASQL )
end;

procedure CopyInventoryLotDocumentCountry( AFrom_Arinvt_ID, ATo_Arinvt_ID: Real; ALotNo: string; ADefaultCountry: string = '');
var
  ACountry: string;
  ANewArinvtLotDocID: Real;
begin
  // 02-10-2015 used in ICT shipping and receiving
  if (ATo_Arinvt_ID = AFrom_Arinvt_ID) or (Trim(ALotNo) = '') then
     EXIT;

  ACountry:= GetInventoryLotDocumentCountry( AFrom_Arinvt_ID, ALotNo );  
  ACountry:= nz( ACountry, ADefaultCountry );
  if ACountry > '' then
  begin
    if AddInventoryLotDocument( ATo_Arinvt_ID, ALotNo, {var}ANewArinvtLotDocID ) then
       UpdateInventoryLotDocumentCountry( ANewArinvtLotDocID, ACountry );
  end;
end;

function GetInventoryEPlantCountry( AArinvt_ID: Real ): string;
var
  ASQL: string;  
begin
  ASQL:= IQFormat('select e.country from arinvt a, eplant e where a.id = %.0f and a.eplant_id = e.id', [ AArinvt_ID ]);

  Result:= SelectValueAsString( ASQL )
end;

end.
