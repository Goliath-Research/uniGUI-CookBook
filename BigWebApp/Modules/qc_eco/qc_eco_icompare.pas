unit qc_eco_icompare;

interface

type
  ICompareInterface = interface
    function GetEco_ID: Real;
    procedure SetEco_ID( AValue: Real );
    function GetEco_Bom_ID: Real;
    procedure SetEco_Bom_ID( AValue: Real );
    procedure AddSummary( AType, ATableName, AFieldName, ACaption, AOldValue, ANewValue, AAction: string; AOld_ID, ANew_ID: Real );
    {compare rows in a table}
    procedure Compare   ( ATableName, AType, ACols: string; AOld_ID, ANew_ID: Real );
    {same but with excluding list of columns}
    procedure CompareUseExclude( ATableName, AType: string; const AExcludeCols: array of string; AOld_ID, ANew_ID: Real );
    {same but with including list of columns}
    procedure CompareUseInclude( ATableName, AType: string; const AIncludeCols: array of string; AOld_ID, ANew_ID: Real );
  end;

implementation

end.
