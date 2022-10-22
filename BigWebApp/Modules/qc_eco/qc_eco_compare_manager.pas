unit qc_eco_compare_manager;

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
  DB,
  qc_eco_icompare,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  {This class handles comparison of a simple table that has primary key ID such as OPMAT}
  TQCEcoCompareManager = class
  private
    {I used interfaces so I can call owner methods such as AddSummary and CompareUseExclude}
    FOwner: ICompareInterface;
    FSourceTable: string;
    FDB: string;

    procedure ProcessTableForDelete( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
    procedure ProcessTableForAppend( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
    procedure ProcessTableForUpdate( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
    function  GetSourceTablebyECOKind( const AKind : string ) : string;
  public
    constructor Create( AOwner: ICompareInterface; ADB: string );
    procedure Execute( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
  end;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers;

constructor TQCEcoCompareManager.Create( AOwner: ICompareInterface; ADB: string );
begin
  inherited Create;
  FOwner:= AOwner;
  FDB:= ADB;
  FSourceTable := GetSourceTableByECOKind( SelectValueFmtAsString('select kind from eco where id = %f ', [FOwner.GetEco_ID], FDB ));
end;

procedure TQCEcoCompareManager.Execute( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
begin
  ProcessTableForDelete( ATableName, AParentFKeyFieldName, AEco_Mapping_Parent_ID, AParentFKey_ID, ASummaryType, ASummaryCaption );
  ProcessTableForAppend( ATableName, AParentFKeyFieldName, AEco_Mapping_Parent_ID, AParentFKey_ID, ASummaryType, ASummaryCaption );
  ProcessTableForUpdate( ATableName, AParentFKeyFieldName, AEco_Mapping_Parent_ID, AParentFKey_ID, ASummaryType, ASummaryCaption );
end;

function TQCEcoCompareManager.GetSourceTablebyECOKind(
  const AKind: string): string;
begin
  if AnsiCompareText      ( AKind, 'BOM' )  = 0 then
    Result := 'STANDARD'
  else if AnsiCompareText ( AKind, 'ITEM' ) = 0 then
    Result := 'OPMAT'
  else if AnsiCompareText ( AKind, 'PM' )   = 0 then
    Result := 'PMEQMT'
  else if AnsiCompareText ( AKind, 'JOBSHOP' ) = 0 then
    Result := 'JOBSHOP_RFQ'
  else if AnsiCompareText ( AKind, 'PROJECT' ) = 0 then
    Result := 'TOOL_RFQ';
end;

procedure TQCEcoCompareManager.ProcessTableForDelete( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB;

    if AnsiCompareText( ATableName, 'DOC_USED') <> 0 then
      SQL.Add( IQFormat('select map.bom_value               '+     {select map.bom_value               }
                        '  from eco_mapping map,            '+     {  from eco_mapping map,            }
                        '       %s child                    '+     {       OPMAT child                 }
                        ' where map.eco_id = %f             '+     { where map.eco_id = 123            }
                        '   and map.eco_bom_id = %f         '+     {   and map.table_name = 456        }
                        '   and map.table_name = ''%s''     '+     {   and map.table_name = 'OPMAT'    }
                        '   and map.field_name = ''ID''     '+     {   and map.field_name = 'ID'       }
                        '   and map.parent_id = %f          '+     {   and map.parent_id = 999         }
                        '   and map.eco_value = child.ID(+) '+     {   and map.eco_value = child.ID(+) }
                        '   and child.rowid is NULL         ',     {   and child.rowid is NULL         }
               [ ATableName,
                 FOwner.GetEco_ID,
                 FOwner.GetEco_Bom_ID,
                 UpperCase(ATableName),
                 AEco_Mapping_Parent_ID ]))
    else
      //EIQ-2774 ECO web summary - incorrectly displays Ext Document being added with matching doc_used.source_IDs AB 04-21-14
      SQL.Add( IQFormat('select map.bom_value               '+     {select map.bom_value               }
                        '  from eco_mapping map,            '+     {  from eco_mapping map,            }
                        '       %s child                    '+     {       DOC_USED child              }
                        ' where map.eco_id = %f             '+     { where map.eco_id = 123            }
                        '   and map.eco_bom_id = %f         '+     {   and map.table_name = 456        }
                        '   and map.table_name = ''%s''     '+     {   and map.table_name = 'OPMAT'    }
                        '   and map.field_name = ''ID''     '+     {   and map.field_name = 'ID'       }
                        '   and map.parent_id = %f          '+     {   and map.parent_id = 999         }
                        '   and map.eco_value = child.ID(+) '+     {   and map.eco_value = child.ID(+) }
                        '   and child.rowid is NULL         '+     {   and child.rowid is NULL         }
                        '   and child.source = ''%s''       ',     {   and child.source = 'STANDARD'   }
               [ ATableName,
                 FOwner.GetEco_ID,
                 FOwner.GetEco_Bom_ID,
                 UpperCase(ATableName),
                 AEco_Mapping_Parent_ID,
                 FSourceTable ]));


    Open;
    while not Eof do
    begin
      FOwner.AddSummary( ASummaryType,                          { type       }
                         ATableName,                            { table_name }
                         'ID',                                  { field_name }
                         ASummaryCaption,                       { caption    }
                         FieldByName('bom_value').asString,     { old_value  }
                         '',                                    { new_value  }
                         'Delete',                              { action     }
                         FieldByName('bom_value').asFloat,      { old_id     }
                         0 );                                   { new_id     }
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompareManager.ProcessTableForAppend( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB;
      SQL.Add( IQFormat('select id from %s              '+   {select id from OPMAT               }
                        ' where %s = %f                 '+   { where SNDOP_ID = 123              }
                          SIIf( ATableName = 'DOC_USED', ' and SOURCE = ''STANDARD''', '') +      //EIQ-2774 ECO web summary - incorrectly displays Ext Document being added with matching doc_used.source_IDs AB 04-21-14
                        ' MINUS                         '+   { MINUS                             }
                        'select map.eco_value           '+   {select map.bom_value               }
                        '  from eco_mapping map         '+   {  from eco_mapping map             }
                        ' where map.eco_id = %f         '+   { where map.eco_id = 999            }
                        '   and map.eco_bom_id = %f     '+   {   and map.table_name = 456        }
                        '   and map.table_name = ''%s'' '+   {   and map.table_name = 'OPMAT'    }
                        '   and map.field_name = ''ID'' '+   {   and map.field_name = 'ID'       }
                        '   and map.parent_id = %f      ',   {   and map.parent_id = 555         }
               [ UpperCase(ATableName),
                 AParentFKeyFieldName,
                 AParentFKey_ID,
                 FOwner.GetEco_ID,
                 FOwner.GetEco_BOM_ID,
                 UpperCase(ATableName),
                 AEco_Mapping_Parent_ID ]));
    Open;
    while not Eof do
    begin
      FOwner.AddSummary( ASummaryType,                     { type       }
                         ATableName,                       { table_name }
                         'ID',                             { field_name }
                         ASummaryCaption,                  { caption    }
                         '',                               { old_value  }
                         FieldByName('id').asString,       { new_value  }
                         'Add',                            { action     }
                         0,                                { old_id     }
                         FieldByName('id').asFloat );      { new_id     }
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TQCEcoCompareManager.ProcessTableForUpdate( ATableName, AParentFKeyFieldName: string; AEco_Mapping_Parent_ID, AParentFKey_ID: Real; ASummaryType, ASummaryCaption: string );
begin
  with TFDQuery.Create(nil) do
  try
    ConnectionName:= FDB;
    if AnsiCompareText( ATableName, 'DOC_USED') <> 0 then
      SQL.Add( IQFormat('select map.bom_value,            '+     {select map.bom_value,              }
                        '       map.eco_value             '+     {       map.eco_value               }
                        '  from eco_mapping map,          '+     {  from eco_mapping map,            }
                        '       %s child                  '+     {       OPMAT child                 }
                        ' where map.eco_id = %f           '+     { where map.eco_id = 123            }
                        '   and map.eco_bom_id = %f       '+     {   and map.table_name = 456        }
                        '   and map.table_name = ''%s''   '+     {   and map.table_name = 'OPMAT'    }
                        '   and map.field_name = ''ID''   '+     {   and map.field_name = 'ID'       }
                        '   and map.parent_id = %f        '+     {   and map.parent_id = 999         }
                        '   and map.eco_value = child.ID  ',     {   and map.eco_value = child.ID    }
               [ ATableName,
                 FOwner.GetEco_ID,
                 FOwner.GetEco_Bom_ID,
                 UpperCase(ATableName),
                 AEco_Mapping_Parent_ID ]))
    else
      //EIQ-2774 ECO web summary - incorrectly displays Ext Document being added with matching doc_used.source_IDs AB 04-21-14
      SQL.Add( IQFormat('select map.bom_value,            '+     {select map.bom_value,              }
                        '       map.eco_value             '+     {       map.eco_value               }
                        '  from eco_mapping map,          '+     {  from eco_mapping map,            }
                        '       %s child                  '+     {       OPMAT child                 }
                        ' where map.eco_id = %f           '+     { where map.eco_id = 123            }
                        '   and map.eco_bom_id = %f       '+     {   and map.table_name = 456        }
                        '   and map.table_name = ''%s''   '+     {   and map.table_name = 'OPMAT'    }
                        '   and map.field_name = ''ID''   '+     {   and map.field_name = 'ID'       }
                        '   and map.parent_id = %f        '+     {   and map.parent_id = 999         }
                        '   and map.eco_value = child.ID  '+     {   and map.eco_value = child.ID    }
                        '   and child.source = ''%s''     ',
               [ ATableName,
                 FOwner.GetEco_ID,
                 FOwner.GetEco_Bom_ID,
                 UpperCase(ATableName),
                 AEco_Mapping_Parent_ID,
                 FSourceTable ]));

    Open;
    while not Eof do
    begin
      FOwner.CompareUseExclude( ATableName,
                                ASummaryType,
                                ['ID', AParentFKeyFieldName ],
                                FieldByName('bom_value').asFloat,
                                FieldByName('eco_value').asFloat );
      Next;
    end;
  finally
    Free;
  end;
end;


end.
