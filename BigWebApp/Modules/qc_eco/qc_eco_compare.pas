unit qc_eco_compare;

interface

uses
  qc_eco_icompare,
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  qc_eco_caption,
  qc_eco_lookup,
  qc_eco_compare_manager,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TQCEcoCompare = class( TInterfacedObject, ICompareInterface )
  private
    FEco_ID: Real;
    FEco_Bom_ID: Real;
    Standard_ID: Real;
    ECO_Standard_ID: Real;
    Map_Standard_ID: Real;
    CaptionManager: TQCEcoCaptionManager;
    LookupManager : TQCEcoLookupManager;
    CompareManager: TQCEcoCompareManager;
    FDB: string;

    {Aux General}
    procedure Init;
    function  Get_Cols_Names( ATableName: string; const AExcludeCols: array of string ): string;
    function  CreateTQuery( ATableName, ACols, AWhere: string ): TFDQuery;

    {Interface support}
    function GetEco_ID: Real;
    procedure SetEco_ID( AValue: Real );
    procedure AddSummary( AType, ATableName, AFieldName, ACaption, AOldValue, ANewValue, AAction: string; AOld_ID, ANew_ID: Real );
    function GetEco_Bom_ID: Real;
    procedure SetEco_Bom_ID( AValue: Real );
    {compare rows in a table}
    procedure Compare   ( ATableName, AType, ACols: string; AOld_ID, ANew_ID: Real );
    {same but with excluding list of columns}
    procedure CompareUseExclude( ATableName, AType: string; const AExcludeCols: array of string; AOld_ID, ANew_ID: Real );
    {same but with including list of columns}
    procedure CompareUseInclude( ATableName, AType: string; const AIncludeCols: array of string; AOld_ID, ANew_ID: Real );

    {Engineering Changes}

    {Partno}
    procedure ProcessPartno;
    procedure ProcessPartnoForDelete;
    procedure ProcessPartnoForAdd;
    procedure ProcessPartnoForUpdate;

    {SndOp}
    procedure ProcessSndOpForUpdate( AEco_Mapping_ID, AEco_Ptoper_ID: Real );

    {Cost Changes}
    procedure Add_ECO_Arinvt( ABom_Arinvt_ID, AEco_Arinvt_ID: Real );
    procedure ProcessCost;
    procedure PopulateECO_ArinvtForDeletedPartno;
    procedure PopulateECO_ArinvtForAddedPartno;
    procedure PopulateECO_ArinvtForUpdatedPartno;
    procedure CopyBOM_Cost;
    procedure CalcECO_Cost;

    {Ptoper}
    procedure ProcessPtoper(AEco_Mapping_ID, AEco_Partno_ID: Real);
    procedure ProcessPtoperForUpdate(AEco_Mapping_ID, AEco_Partno_ID: Real);
    procedure ProcessPtoperForDelete(AEco_Mapping_ID, AEco_Partno_ID: Real);
    procedure ProcessPtoperForAdd(AEco_Mapping_ID, AEco_Partno_ID: Real);

  public
    constructor Create( AEco_ID, AEco_Bom_ID: Real; ADB: string );
    destructor Destroy; override;

    property Eco_ID: Real read GetEco_ID write SetEco_ID;
    property Eco_Bom_ID: Real read GetEco_Bom_ID write SetEco_Bom_ID;
    procedure Execute;
  end;

procedure DoExecuteCompare( AEco_ID: Real; ADB: string );

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers,
  Variants;

const
     C_HEADER              = 'Header';
     C_MFG_ITEM            = 'Mfg Item';
     C_INVENTORY_ITEM      = 'Inventory Item';
     C_SNDOP               = 'Operation';
     C_ATTACHED_COMPONENT  = 'Attached Component';
     C_ATTACHED_PACKAGING  = 'Attached Packaging';
     C_MFG_AUX             = 'Aux Equipment';
     C_BOM_LABOR           = 'BOM Labor';
     C_RUNS_BEST           = 'Runs Best';
     C_STANDARD_DOCS       = 'Internal Doc';
     C_DOC_USED            = 'External Doc';
     C_PMEQMT              = 'Tooling';
     C_PTOPER              = 'Process';


{ TQCEcoCompare }

procedure DoExecuteCompare( AEco_ID: Real; ADB: string );
var
  AList: TStringList;
  I: Integer;
begin
  if ADB = '' then ADB:= 'IQFD';

  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, Format('select id from eco_bom where eco_id = %.0f', [ AEco_ID ]), nil, True, ADB );

    ExecuteCommandFmt('delete from eco_arinvt where eco_id = %f', [ AEco_ID ], ADB);

    for I:= 0 to AList.Count - 1 do
      with TQCEcoCompare.Create( AEco_ID, StrToFloat(AList[ I ]), ADB ) do
      try
        Execute;
      finally
        {for some reason assigning NIL did NOT work - destructor destroy was not called}
        _Release;
      end;

  finally
    AList.Free;
  end;
end;

constructor TQCEcoCompare.Create( AEco_ID, AEco_Bom_ID: Real; ADB: string );
var
  A: Variant;
begin
  FDB:= ADB;
  inherited Create;
  Eco_ID:= AEco_ID;
  Eco_Bom_ID:= AEco_Bom_ID;
  CaptionManager:= TQCEcoCaptionManager.Create( AEco_ID, AEco_Bom_ID );
  LookupManager := TQCEcoLookupManager.Create( AEco_ID );
  CompareManager:= TQCEcoCompareManager.Create( self, FDB );
end;


destructor TQCEcoCompare.Destroy;
begin
  CaptionManager.Free;
  LookupManager.Free;
  CompareManager.Free;
  inherited;
end;



{ Aux functions -------------------------------------------------------------- }
function TQCEcoCompare.GetEco_ID: Real;
begin
  Result:= FEco_ID;
end;

procedure TQCEcoCompare.SetEco_ID( AValue: Real );
begin
 FEco_ID:= AValue;
end;

function TQCEcoCompare.Get_Cols_Names( ATableName: string; const AExcludeCols: array of string ): string;
const
  AAlwaysExcludeCols: array[ 0..3 ] of string = ( 'EID', 'ECODE', 'EDATE_TIME', 'ECOPY' );
begin
  Result:= '';
  with TFDQuery.Create(Application) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add( Format('select column_name from user_tab_columns where table_name = ''%s''', [ UpperCase( ATableName )]));
    Open;
    while not Eof do
    begin
      if not StrInList( Fields[ 0 ].asString, AExcludeCols ) and not StrInList( Fields[ 0 ].asString, AAlwaysExcludeCols ) then
      begin
        if Result = '' then
           Result:= Fields[ 0 ].asString
        else
           Result:= Result + ', ' + Fields[ 0 ].asString;
      end;
      Next;
    end;
  finally
    Free;
  end;
  IQAssert( Result > '',  'No columns found for ' + ATableName );
end;

procedure TQCEcoCompare.CompareUseExclude( ATableName, AType: string; const AExcludeCols: array of string; AOld_ID, ANew_ID: Real );
var
  ACols: string;
begin
  ACols:= Get_Cols_Names( ATableName, AExcludeCols );
  Compare( ATableName, AType, ACols, AOld_ID, ANew_ID );
end;

procedure TQCEcoCompare.CompareUseInclude( ATableName, AType: string; const AIncludeCols: array of string; AOld_ID, ANew_ID: Real );
var
  ACols: string;
  I    : Integer;
begin
  ACols:= '';
  for I:= 0 to High( AIncludeCols ) do
    if ACols = '' then
       ACols:= AIncludeCols[ I ]
    else
       ACols:= Format('%s, %s', [ ACols, AIncludeCols[ I ]]);

  Compare( ATableName, AType, ACols, AOld_ID, ANew_ID );
end;

procedure TQCEcoCompare.Compare( ATableName, AType, ACols: string; AOld_ID, ANew_ID: Real );
var
  Qry1      : TFDQuery;
  Qry2      : TFDQuery;
  I         : Integer;
  AIsChanged: Boolean;
  ANewValue : string;
begin
  Qry1:= CreateTQuery( ATableName, ACols, IQFormat('where id = %f', [ AOld_ID ]));
  Qry2:= CreateTQuery( ATableName, ACols, IQFormat('where id = %f', [ ANew_ID ]));
  try
    with Qry1 do
    for I:= 0 to Qry1.FieldCount - 1 do
    begin
      if Fields[ I ].DataType in [ ftSmallint, ftInteger, ftWord, ftFloat, ftBCD, ftFmtBCD ] then
         begin
           AIsChanged:= Fields[ I ].asFloat <> Qry2.Fields[ I ].asFloat;
           ANewValue := Qry2.Fields[ I ].asString;
         end

      else if Fields[ I ].DataType in [ ftDateTime ] then
         begin
           AIsChanged:= Fields[ I ].asString <> Qry2.Fields[ I ].asString;
           ANewValue := FormatDateTime('mm/dd/yyyy hh:nn:ss', Qry2.Fields[ I ].asDateTime );
         end

      else
         begin
           AIsChanged:= Fields[ I ].asString <> Qry2.Fields[ I ].asString;
           ANewValue := Qry2.Fields[ I ].asString;
         end;

      if AIsChanged then
        AddSummary( AType,                         { type       }
                    ATableName,                    { table_name }
                    Fields[ I ].FieldName,         { field_name }
                    Fields[ I ].FieldName,         { caption    }
                    Qry1.Fields[ I ].asString,     { old_value  }
                    ANewValue,                      // Qry2.Fields[ I ].asString,  { new_value  }
                    'Update',                      { action     }
                    AOld_ID,                       { old_id     }
                    ANew_ID );                     { new_id     }
    end;
  finally
    Qry1.Free;
    Qry2.Free;
  end;
end;

function TQCEcoCompare.CreateTQuery( ATableName, ACols, AWhere: string ): TFDQuery;
begin
  Result:= TFDQuery.Create(nil);
  with Result do
  begin
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add( Format('select %s from %s %s', [ ACols,  ATableName, AWhere ]));
    Open;
  end;
end;

procedure TQCEcoCompare.AddSummary( AType, ATableName, AFieldName, ACaption, AOldValue, ANewValue, AAction: string; AOld_ID, ANew_ID: Real );
var
  AEco_Summary_ID  : Real;
  AOld_Lookup_Value: string;
  ANew_Lookup_Value: string;
begin
  AEco_Summary_ID:= SelectValueAsFloat('select s_eco_summary.nextval from dual', FDB);
  ExecuteCommandFmt('insert into eco_summary                                     '+
            '      ( id, eco_id,  type, table_name, field_name, caption, '+
            '        old_value, new_value, action, old_id, new_id, eco_bom_id ) '+
            'values(                                                     '+
            '       %f    ,                                              '+     {id         }
            '       %f    ,                                              '+     {eco_id     }
            '       ''%s'',                                              '+     {type       }
            '       ''%s'',                                              '+     {table_name }
            '       ''%s'',                                              '+     {field_name }
            '       ''%s'',                                              '+     {caption    }
            '       ''%s'',                                              '+     {old_value  }
            '       ''%s'',                                              '+     {new_value  }
            '       ''%s'',                                              '+     {action     }
            '       %f    ,                                              '+     {old_id     }
            '       %f    ,                                              '+     {new_id     }
            '       %f    )                                              ',     {eco_bom_id }
            [
              AEco_Summary_ID,
              FEco_ID,
              AType,
              ATableName,
              AFieldName,
              CaptionManager.CaptionByFieldName( ATableName, AFieldName, ANew_ID ),
              FixStr(AOldValue),
              FixStr(ANewValue),
              AAction,
              AOld_ID,
              ANew_ID,
              Eco_Bom_ID ],
              FDB);

  if LookupManager.HasLookup( ATableName, AFieldName, AOldValue, ANewValue, AOld_Lookup_Value, ANew_Lookup_Value, AOld_ID, ANew_ID ) then
     ExecuteCommandFmt('update eco_summary set old_lookup_value = ''%s'', new_lookup_value = ''%s'' where id = %f',
               [ FixStr(AOld_Lookup_Value),
                 FixStr(ANew_Lookup_Value),
                 AEco_Summary_ID ],
                 FDB);
end;


{ Main engine ---------------------------------------------------------------- }

procedure TQCEcoCompare.Execute;
begin
  Init;

  {standard}
  CompareUseExclude( 'STANDARD',
                    C_HEADER,
                    // [ 'ID', 'MFGNO', 'BOM_CNTRL', 'TIMESTAMP', 'PK_HIDE', 'SPRUE_DISP', 'CYCLETM_DISP', 'SETS_DISP', 'MFGCELL', 'CYCLE', 'LBSK', 'SHOTWT' ],
                    [ 'ID', 'MFGNO', 'BOM_CNTRL', 'TIMESTAMP', 'PK_HIDE', 'SPRUE', 'CYCLETM', 'SETS', 'MFGCELL', 'CYCLE', 'LBSK', 'SHOTWT', 'FG_LOTNO' ],
                    Standard_ID,
                    Eco_Standard_ID );

  {partno, sndop and opmat}
  ProcessPartno;

  {mfg_aux}
  CompareManager.Execute( 'MFG_AUX',             { Table_name        }
                          'STANDARD_ID',         { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_MFG_AUX,             { ASummaryType      }
                          'Aux Equipment ID' );  { ASummaryCaption   }
  {bom_labor}
  CompareManager.Execute( 'BOM_LABOR',           { Table_name        }
                          'STANDARD_ID',         { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_BOM_LABOR,           { ASummaryType      }
                          'Bom Labor ID' );      { ASummaryCaption   }
  {runs_best}
  CompareManager.Execute( 'RUNS_BEST',           { Table_name        }
                          'STANDARD_ID',         { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_RUNS_BEST,           { ASummaryType      }
                          'Runs Best ID' );      { ASummaryCaption   }
  {standard docs}
  CompareManager.Execute( 'STANDARD_DOCS',       { Table_name        }
                          'STANDARD_ID',         { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_STANDARD_DOCS,       { ASummaryType      }
                          'Internal Doc ID' );   { ASummaryCaption   }
  {External docs}
  CompareManager.Execute( 'DOC_USED',            { Table_name        }
                          'SOURCE_ID',           { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_DOC_USED,            { ASummaryType      }
                          'External Doc ID' );   { ASummaryCaption   }

  {Tooling}
  CompareManager.Execute( 'STANDARD_PMEQMT',     { Table_name        }
                          'STANDARD_ID',         { Parent fk name    }
                          Map_Standard_ID,       { AEco_Map_Parent_ID}
                          Eco_Standard_ID,       { AParentFKey_ID    }
                          C_PMEQMT,              { ASummaryType      }
                          'Tooling ID' );        { ASummaryCaption   }

  {Cost}
  ProcessCost;

  {Summary Date}
  ExecuteCommandFmt('update eco set summary_date = sysdate where id = %f', [ Eco_ID ], FDB);
end;

procedure TQCEcoCompare.Init;
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select standard_id, eco_standard_id from eco_bom where id = %f', [ Eco_Bom_ID ], FDB);
  IQAssert(  VarArrayDimCount( A ) > 0, Format('Invalid ECO_BOM Id = %.0f', [ Eco_Bom_ID ]));

  Standard_ID    := A[ 0 ];
  ECO_Standard_ID:= A[ 1 ];

  IQAssert( SelectValueByID('ID', 'standard', Standard_ID, FDB )     = Standard_ID,     Format('Invalid Standard ID = %.0f', [ Standard_ID ]));
  IQAssert( SelectValueByID('ID', 'standard', Eco_Standard_ID, FDB ) = Eco_Standard_ID, Format('Invalid Eco Standard ID = %.0f', [ Eco_Standard_ID ]));


  Map_Standard_ID:= SelectValueFmtAsFloat('select id from eco_mapping where eco_id = %f             '+
                              '   and table_name = ''STANDARD'' and field_name = ''ID'' '+
                              '   and bom_value = %.0f and eco_value = %.0f             '+
                              '   and eco_bom_id = %.0f                                 ',
                              [ Eco_ID, Standard_ID, ECO_Standard_ID, ECO_Bom_ID ],
                              FDB);

  IQAssert( Map_Standard_ID > 0, Format('Unable to find ID of the BOM in the ECO Mapping table. Eco ID = %f', [ Eco_ID ]));

  ExecuteCommandFmt('delete from eco_summary where eco_id = %f and eco_bom_id = %f', [ Eco_ID, Eco_Bom_ID ], FDB);
  ExecuteCommandFmt('delete from eco_summary where eco_id = %f and eco_bom_id not in (select id from eco_bom where eco_id = %f)', [ Eco_ID, Eco_ID ], FDB);
  // ExecuteCommandFmt('delete from eco_arinvt  where eco_id = %f', [ Eco_ID ]);  -- 04-27-2012 moved outside to be executed once per eco_id
end;


{ PARTNO, SNDOP, OPMAT ------------------------------------------------------- }

procedure TQCEcoCompare.ProcessPartno;
begin
  ProcessPartnoForDelete;
  ProcessPartnoForAdd;
  ProcessPartnoForUpdate;
end;

procedure TQCEcoCompare.ProcessPartnoForDelete;
begin
  {Check what partno got deleted and write to eco_summary}
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select map.bom_value as bom_partno_id '+
                     '  from eco_mapping map,               '+
                     '       partno                         '+
                     ' where map.eco_id = %f                '+
                     '   and map.eco_bom_id = %f            '+
                     '   and map.table_name = ''PARTNO''    '+
                     '   and map.field_name = ''ID''        '+
                     '   and map.eco_value = partno.id(+)   '+
                     '   and partno.id is NULL              ', [ Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      AddSummary( C_MFG_ITEM,                            { type       }
                  'PARTNO',                              { table_name }
                  'ID',                                  { field_name }
                  'Bom Item',                            { caption    }
                  FieldByName('bom_partno_id').asString, { old_value  }
                  '',                                    { new_value  }
                  'Delete',                              { action     }
                  FieldByName('bom_partno_id').asFloat,  { old_id     }
                  0 );                                   { new_id     }

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.ProcessPartnoForAdd;
begin
  {Check what partno was added and write to eco_summary}
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select id                          '+
                     '  from partno                      '+
                     ' where standard_id in              '+
                     '      (select eco_standard_id      '+
                     '         from eco_bom              '+
                     '         where id = %f)            '+
                     'MINUS                              '+
                     'select map.eco_value               '+
                     '  from eco_mapping map             '+
                     ' where map.eco_id = %f             '+
                     '   and map.eco_bom_id = %f         '+
                     '   and map.table_name = ''PARTNO'' '+
                     '   and map.field_name = ''ID''     ', [ Eco_Bom_ID, Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      AddSummary( C_MFG_ITEM,                            { type       }
                  'PARTNO',                              { table_name }
                  'ID',                                  { field_name }
                  'Bom Item',                            { caption    }
                  '',                                    { old_value  }
                  FieldByName('id').asString,            { new_value  }
                  'Add',                                 { action     }
                  0,                                     { old_id     }
                  FieldByName('id').asFloat );           { new_id     }

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.ProcessPartnoForUpdate;
var
  A: Variant;

  procedure ProcessPartnoArinvt_ID( ABom_Arinvt_ID, AEco_Origin_Arinvt_ID, AEco_Current_Arinvt_ID, ABom_Partno_ID, AEco_Partno_ID: Real );
  begin
    if AEco_Origin_Arinvt_ID <> AEco_Current_Arinvt_ID then
       AddSummary( C_MFG_ITEM,                                  { type       }
                   'PARTNO',                                    { table_name }
                   'ARINVT_ID',                                 { field_name }
                   'Mfg Item',                                  { caption    }
                   FloatToStr(ABom_Arinvt_ID),                  { old_value  }
                   FloatToStr(AEco_Current_Arinvt_ID),          { new_value  }
                   'Update',                                    { action     }
                   ABom_Partno_ID,                              { old_id     }
                   AEco_Partno_ID )                             { new_id     }
    else
        CompareUseInclude( 'ARINVT',                                   {table_name}
                    C_INVENTORY_ITEM,                           {type}
                    ['ITEMNO', 'REV', 'DESCRIP', 'DESCRIP2'],   {included columns}
                    ABom_Arinvt_ID,                             {old_id}
                    AEco_Origin_Arinvt_ID );                    {new_id}
  end;

begin
  {Check what in partno was changed and write to eco_summary}
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select map.id as mapping_parent_id,      '+
                     '       map.bom_value as bom_partno_id,   '+
                     '       map.eco_value as eco_partno_id,   '+
                     '       partno.arinvt_id as eco_arinvt_id '+
                     '  from eco_mapping map,                  '+
                     '       partno                            '+
                     ' where map.eco_id = %f                   '+
                     '   and map.eco_bom_id = %f               '+
                     '   and map.table_name = ''PARTNO''       '+
                     '   and map.field_name = ''ID''           '+
                     '   and map.eco_value = partno.id         ', [ Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      {Check if other than arinvt_id fields have changed}
      CompareUseExclude( 'PARTNO', C_MFG_ITEM, ['ID', 'STANDARD_ID', 'ARINVT_ID', 'PTWT' ], FieldByName('bom_partno_id').asFloat, FieldByName('eco_partno_id').asFloat );

      {Process arinvt_id in partno}
      A:= SelectValueArrayFmt('select bom_value as bom_orig_arinvt_id, '+    {real arinvt_id in partno of "real" bom}
                         '       eco_value as eco_orig_arinvt_id  '+    {original created during cloning}
                         '  from eco_mapping                      '+
                         ' where eco_id = %f                      '+
                         '   and eco_bom_id = %f                  '+
                         '   and table_name = ''PARTNO''          '+
                         '   and field_name = ''ARINVT_ID''       '+
                         '   and parent_id = %f',
                         [ Eco_ID, Eco_Bom_ID, FieldByName('mapping_parent_id').asFloat ],
                         FDB);

      if VarArrayDimCount( A ) > 0 then
         ProcessPartnoArinvt_ID( A[ 0 ],                                 {arinvt_id of "real" partno     }
                                 A[ 1 ],                                 {original arinvt_id in eco partno created during cloning}
                                 FieldByName('eco_arinvt_id').asFloat,   {current arinvt_id in eco partno}
                                 FieldByName('bom_partno_id').asFloat,   {"real" partno_id               }
                                 FieldByName('eco_partno_id').asFloat ); {eco partno_id                  }

      // {Process SndOp}
      {03-19-2012 Process Ptoper}
      ProcessPtoper( FieldByName('mapping_parent_id').asFloat, FieldByName('eco_partno_id').asFloat );

      {Next partno}
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.ProcessPtoper( AEco_Mapping_ID, AEco_Partno_ID: Real );
begin
  ProcessPtoperForDelete( AEco_Mapping_ID, AEco_Partno_ID );
  ProcessPtoperForAdd   ( AEco_Mapping_ID, AEco_Partno_ID );
  ProcessPtoperForUpdate( AEco_Mapping_ID, AEco_Partno_ID );
end;


procedure TQCEcoCompare.ProcessPtoperForDelete( AEco_Mapping_ID, AEco_Partno_ID: Real );
begin
  {Check what sndop got deleted and write to eco_summary}
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add( IQFormat('select map.bom_value as bom_ptoper_id     '+
                      '  from eco_mapping map,                   '+
                      '       ptoper                             '+
                      ' where map.eco_id = %f                    '+
                      '   and map.eco_bom_id = %f                '+
                      '   and map.table_name = ''PTOPER''        '+
                      '   and map.field_name = ''ID''            '+
                      '   and map.parent_id = %f                 '+
                      '   and ptoper.id(+) = map.eco_value       '+
                      '   and ptoper.rowid is NULL               ',
             [ Eco_ID,
               Eco_Bom_ID,
               AEco_Mapping_ID,
               AEco_Partno_ID ]));
    Open;
    while not Eof do
    begin
      AddSummary( C_PTOPER,                              { type       }
                  'PTOPER',                              { table_name }
                  'ID',                                  { field_name }
                  'Process',                             { caption    }
                  FieldByName('bom_ptoper_id').asString, { old_value  }
                  '',                                    { new_value  }
                  'Delete',                              { action     }
                  FieldByName('bom_ptoper_id').asFloat,  { old_id     }
                  0 );                                   { new_id     }
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TQCEcoCompare.ProcessPtoperForAdd( AEco_Mapping_ID, AEco_Partno_ID: Real );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add( IQFormat('select id as ptoper_id         '+
                      '  from ptoper                  '+
                      ' where partno_id = %f          '+
                      ' MINUS                         '+
                      'select eco_value               '+
                      '  from eco_mapping             '+
                      ' where eco_id = %f             '+
                      '   and eco_bom_id = %f         '+
                      '   and table_name = ''PTOPER'' '+
                      '   and field_name = ''ID''     '+
                      '   and parent_id = %f          ',
             [ AEco_Partno_ID,
               Eco_ID,
               Eco_Bom_ID,
               AEco_Mapping_ID ]));
    Open;
    while not Eof do
    begin
      AddSummary( C_PTOPER,                              { type       }
                  'PTOPER',                              { table_name }
                  'ID',                                  { field_name }
                  'Process',                             { caption    }
                  '',                                    { old_value  }
                  FieldByName('ptoper_id').asString,     { new_value  }
                  'Add',                                 { action     }
                  0,                                     { old_id     }
                  FieldByName('ptoper_id').asFloat );    { new_id     }
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TQCEcoCompare.ProcessPtoperForUpdate( AEco_Mapping_ID, AEco_Partno_ID: Real );
begin
  {Check what in ptoper was changed and write to eco_summary}
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select map.id as mapping_parent_id,      '+
                     '       map.bom_value as bom_ptoper_id,   '+
                     '       map.eco_value as eco_ptoper_id    '+
                     '  from eco_mapping map,                  '+
                     '       ptoper                            '+
                      ' where map.eco_id = %f                  '+
                      '   and map.eco_bom_id = %f              '+
                      '   and map.table_name = ''PTOPER''      '+
                      '   and map.field_name = ''ID''          '+
                      '   and map.parent_id = %f               '+
                      '   and ptoper.id = map.eco_value        ',
                     [ Eco_ID,
                       Eco_Bom_ID,
                       AEco_Mapping_ID ]));
    Open;
    while not Eof do
    begin
      {Check if other than arinvt_id fields have changed}
      CompareUseExclude( 'PTOPER', C_PTOPER, ['ID', 'PARTNO_ID', 'SNDOP_ID', 'CYCLETM', 'SCRAP'], FieldByName('bom_ptoper_id').asFloat, FieldByName('eco_ptoper_id').asFloat );

      ProcessSndOpForUpdate( FieldByName('mapping_parent_id').asFloat, FieldByName('eco_ptoper_id').asFloat );

      {Next ptoper}
      Next;
    end;
  finally
    Free;
  end;
end;



procedure TQCEcoCompare.ProcessSndOpForUpdate( AEco_Mapping_ID, AEco_Ptoper_ID: Real );
  function _get_summary_type( ASndop_ID: Real ): string;
  begin
    if SelectValueByID('op_class', 'sndop', ASndop_ID, FDB ) = 'PK' then
       Result:= C_ATTACHED_PACKAGING
    else
       Result:= C_ATTACHED_COMPONENT
  end;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add( IQFormat('select map.bom_value as bom_sndop_id,     '+
                      '       map.eco_value as eco_sndop_id,     '+
                      '       map.id        as map_parent_id     '+
                      '  from eco_mapping map,                   '+
                      '       ptoper                             '+
                      ' where map.eco_id = %f                    '+
                      '   and map.eco_bom_id = %f                '+
                      '   and map.table_name = ''SNDOP''         '+
                      '   and map.field_name = ''ID''            '+
                      '   and map.parent_id = %f                 '+
                      '   and ptoper.id = %f                     ',
             [ Eco_ID,
               Eco_Bom_ID,
               AEco_Mapping_ID,
               AEco_Ptoper_ID ]));
    Open;
    if not Eof then
    begin
      CompareUseExclude( 'SNDOP', C_SNDOP, ['ID', 'OPNO', 'OPDESC' ], FieldByName('bom_sndop_id').asFloat, FieldByName('eco_sndop_id').asFloat );

      {OPMAT}
      CompareManager.Execute( 'OPMAT',
                              'SNDOP_ID',
                              FieldByName('map_parent_id').asFloat,
                              FieldByName('eco_sndop_id').asFloat,
                              _get_summary_type( FieldByName('bom_sndop_id').asFloat ),  // SelectValueByID('opdesc', 'sndop', FieldByName('bom_sndop_id').asFloat ),  // C_ATTACHED_COMPONENT
                              'Attached Item ID' );
    end;
  finally
    Free;
  end;
end;


{ COST ----------------------------------------------------------------------- }

procedure TQCEcoCompare.ProcessCost;
begin
  {populate eco_arinvt table so we could easily calculate, populate and present cost elements in eco_cost_summary}
  PopulateECO_ArinvtForDeletedPartno;
  PopulateECO_ArinvtForAddedPartno;
  PopulateECO_ArinvtForUpdatedPartno;

  {just copy over existing cost_elements for existing "real" bom arinvt - goes in std_cost column}
  CopyBOM_Cost;

  {match and put on top what cost elements are found for eco item - goes in eco_cost column}
  CalcECO_Cost;
end;

procedure TQCEcoCompare.Add_ECO_Arinvt( ABom_Arinvt_ID, AEco_Arinvt_ID: Real );
begin
  ExecuteCommandFmt('insert into eco_arinvt( eco_id, bom_arinvt_id, eco_arinvt_id, eco_bom_id ) values (%f, %s, %s, %s)',
            [ Eco_ID,
              IIf( ABom_Arinvt_ID = 0, 'NULL', FloatToStr( ABom_Arinvt_ID )),
              IIf( AEco_Arinvt_ID = 0, 'NULL', FloatToStr( AEco_Arinvt_ID )),
              IIf( Eco_Bom_ID = 0, 'NULL', FloatToStr( Eco_Bom_ID )) ],
            FDB);
end;

procedure TQCEcoCompare.PopulateECO_ArinvtForDeletedPartno;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select p.arinvt_id from partno p                    '+
                     ' where id in (select map.bom_value as bom_partno_id '+
                     '                from eco_mapping map,               '+
                     '                     partno                         '+
                     '               where map.eco_id = %f                '+
                     '                 and map.eco_bom_id = %f            '+
                     '                 and map.table_name = ''PARTNO''    '+
                     '                 and map.field_name = ''ID''        '+
                     '                 and map.eco_value = partno.id(+)   '+
                     '                 and partno.id is NULL )            ', [ Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      Add_ECO_Arinvt( FieldByName('arinvt_id').AsFloat, 0 );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.PopulateECO_ArinvtForAddedPartno;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select p.arinvt_id from partno p         '+
                     'where id in (                            '+
                     '      select id                          '+
                     '        from partno                      '+
                     '       where standard_id in              '+
                     '            (select eco_standard_id      '+
                     '               from eco_bom              '+
                     '               where id = %f)            '+
                     '      MINUS                              '+
                     '      select map.eco_value               '+
                     '        from eco_mapping map             '+
                     '       where map.eco_id = %f             '+
                     '         and map.eco_bom_id = %f         '+
                     '         and map.table_name = ''PARTNO'' '+
                     '         and map.field_name = ''ID'')    ', [ Eco_Bom_ID, Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      Add_ECO_Arinvt( 0, FieldByName('arinvt_id').AsFloat );
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.PopulateECO_ArinvtForUpdatedPartno;
var
  ABom_Arinvt_ID: Real;
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB; // MainModule.FDConnection;
    SQL.Add(IQFormat('select map.id as mapping_parent_id,      '+
                     '       partno.arinvt_id as eco_arinvt_id '+
                     '  from eco_mapping map,                  '+
                     '       partno                            '+
                     ' where map.eco_id = %f                   '+
                     '   and map.eco_bom_id = %f               '+
                     '   and map.table_name = ''PARTNO''       '+
                     '   and map.field_name = ''ID''           '+
                     '   and map.eco_value = partno.id         ', [ Eco_ID, Eco_Bom_ID ]));
    Open;
    while not Eof do
    begin
      ABom_Arinvt_ID:= SelectValueFmtAsFloat('select bom_value as bom_arinvt_id '+
                                 '  from eco_mapping                '+
                                 ' where eco_id = %f                '+
                                 '   and eco_bom_id = %f            '+
                                 '   and table_name = ''PARTNO''    '+
                                 '   and field_name = ''ARINVT_ID'' '+
                                 '   and parent_id = %f',
                                 [ Eco_ID, Eco_Bom_ID, FieldByName('mapping_parent_id').asFloat ],
                                 FDB);

      Add_ECO_Arinvt( ABom_Arinvt_ID, FieldByName('eco_arinvt_id').AsFloat );

      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompare.CopyBOM_Cost;
begin
  ExecuteCommandFmt('begin                                                                                                      '+
            '  for v in (select id, bom_arinvt_id from eco_arinvt where eco_id = %f and eco_bom_id = %f )               '+
// 08-06-14 '               and exists (select 1 from arinvt where id = eco_arinvt.bom_arinvt_id and standard_id = %f)) '+ // limit to just 1 eco_arinvt record per processed Standard_ID
            '  loop                                                                                                     '+
            '     insert into eco_cost_summary                                                                          '+
            '          ( eco_arinvt_id, elements_id, std_cost, eco_cost )                                               '+
            '     select v.id,                                                                                          '+
            '            a.elements_id,                                                                                 '+
            '            a.std_cost,                                                                                    '+
            '            decode( NVL(e.del_on_roll_over, ''N''), ''N'', a.std_cost, null )                              '+   // notice we update the eco_cost for del_on_roll_over = N
            '       from arinvt_elements a,                                                                             '+
            '            elements e                                                                                     '+
            '      where a.arinvt_id = v.bom_arinvt_id                                                                  '+
            '        and a.elements_id = e.id;                                                                          '+
            '  end loop;                                                                                                '+
            'end;                                                                                                       ',
            [ Eco_ID,
              Eco_BOM_ID ],
            FDB);
// 08-06-14   Standard_ID ]);
end;

procedure TQCEcoCompare.CalcECO_Cost;
begin
  ExecuteCommandFmt('begin                                                            '+
            '  for v in (select e.id, e.eco_arinvt_id, a.standard_id, e.bom_arinvt_id '+
            '              from eco_arinvt e, arinvt a                        '+
            '             where e.eco_id = %f and e.eco_arinvt_id is not NULL '+
            '               and a.id = e.eco_arinvt_id )                      '+
            '  loop                                                           '+
            '     inv_cost.calc_item( v.eco_arinvt_id, v.standard_id, 0, 0 ); '+  {recalc w/o subitem recalc and w/o optimization}
            '                                                                 '+
            '     for x in ( select u.elements_id,                            '+
            '                       t.std_cost                                '+
            '                  from                                           '+
            '                       arinvt_cost_tmp t,                        '+
            '                      ( select a.elements_id                     '+
            '                         from arinvt_elements a,                 '+
            '                              elements e                         '+
            '                         where a.arinvt_id = v.bom_arinvt_id     '+ // notice bom_arinvt_id - we are looking at original cost elements
            '                           and a.elements_id = e.id              '+
            '                           and e.del_on_roll_over = ''Y''        '+ // notice the del_on_roll_over = N already taken into account in the above CopyBOM_Cost
            '                       UNION                                     '+
            '                       select elements_id                        '+
            '                         from arinvt_cost_tmp                    '+
            '                         where arinvt_id = v.eco_arinvt_id ) u   '+ // notice eco_arinvt_id - comparing eco future cost against bom original cost elements
            '                 where                                           '+
            '                       t.arinvt_id(+) = v.eco_arinvt_id          '+
            '                   and u.elements_id = t.elements_id(+))         '+
            '     loop                                                        '+
            '       update eco_cost_summary                                   '+
            '           set eco_cost = x.std_cost                             '+
            '         where eco_arinvt_id = v.id                              '+
            '           and elements_id = x.elements_id;                      '+
            '                                                                 '+
            '        if sql%%notfound then                                    '+
            '         insert into eco_cost_summary                            '+
            '               ( eco_arinvt_id, elements_id, eco_cost )          '+
            '         values( v.id,                                           '+
            '                 x.elements_id,                                  '+
            '                 x.std_cost );                                   '+
            '        end if;                                                  '+
            '     end loop;                                                   '+

            '  end loop;                                                      '+
            'end;                                                             ',
            [ Eco_ID ],
            FDB);
end;

function TQCEcoCompare.GetEco_Bom_ID: Real;
begin
  Result:= FEco_Bom_ID;
end;

procedure TQCEcoCompare.SetEco_Bom_ID(AValue: Real);
begin
  FEco_Bom_ID:= AValue;
end;

end.
