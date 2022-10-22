unit inv_trans_rule_xml_imp_exp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Vcl.ExtDlgs,
  inv_trans_rule_xml_types,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Data.DB;

type
  {----------------------------------------------------------------------------}
  TInvTransRuleExport = class
    FXMLFileName: string;
    FRules: IXMLInv_trans_ruleType;
    QryRule: TFDQuery;
    QryDetail: TFDQuery;
  private
    function AssignFileName: Boolean;
    function ExportRule: Boolean;
  public
    constructor Create( AOwner: TComponent; ATransRulesList: TStringList );
    function Execute: Boolean;
    destructor Destroy;
  end;

  {----------------------------------------------------------------------------}
  TInvTransRuleImport = class
    FXMLFileName: string;
    FRules: IXMLInv_trans_ruleType;
  private
    function AssignFileName: Boolean;
    procedure ImportRule( ARule: IXMLRow_ruleType );
  public
    constructor Create( AOwner: TComponent );
    function Execute: Boolean;
  end;


implementation

{$REGION 'Manually Generated XML Structure'}
{ Note!
  1. The file \INV\inv_trans_rule_xml_types.pas was generated based on an example InvTransRuleStru.XML that I manually put together.
     This unit is using the above inv_trans_rule_xml_types where all the types are declared.

  2. In case we need to add more fields just
     * open InvTransRuleStru.xml found in INV folder and  add required field(s)
     * edit InvTransRuleStru.xdb file. For instance I had to add wms_inv_group_id - all I had to do is to add the line
<xs:element name="wms_inv_group_id" type="xs:string"/>
     * File-> New-> Other-> XML-> XML Data Binding Wizard. This will create InvTransRuleStru.pas - override the existing inv_trans_rule_xml_types.pas.
     You may need to delete it from the project first.  After that you can refer to the new field like this: ARule.MyNewField

<inv_trans_rule>
   <row>
     <id>                 1          </id>
     <name>               Arik       </name>
     <descrip>            Desc Arik  </descrip>
     etc...

     <inv_trans_rule_detail>
       <row>
         <id>                     7    </id>
         <inv_trans_rule_id>      8    </inv_trans_rule_id>
         <seq>                    9    </seq>
         etc ....
       </row>

       <row>
         <id>                     7    </id>
         <inv_trans_rule_id>      8    </inv_trans_rule_id>
         etc...
       </row>

     </inv_trans_rule_detail>
   </row>

   <row>
     <id>                 1          </id>
     etc...
   </row>
</inv_trans_rule>
}
{$ENDREGION}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils;


{ TInvTransRuleExport }

constructor TInvTransRuleExport.Create( AOwner: TComponent; ATransRulesList: TStringList );
begin
  QryRule:= TFDQuery.Create(nil);
  QryRule.Connection := UniMainModule.FDConnection1;

  QryRule.SQL.Add(IQFormat('select * from inv_trans_rule where id in (%s)', [ IQMS.Common.StringUtils.StringListToStr( ATransRulesList, ',')]));

  QryDetail:= TFDQuery.Create(nil);
  QryDetail.Connection := UniMainModule.FDConnection1;

  QryDetail.SQL.Add('select * from inv_trans_rule_detail where inv_trans_rule_id = :id order by id');
  QryDetail.Params.ParamByName('id').DataType:= ftFloat;

end;

destructor TInvTransRuleExport.Destroy;
begin
  QryDetail.Free;
  QryRule.Free;
  inherited;
end;

function TInvTransRuleExport.AssignFileName: Boolean;
begin
  with TFileSaveDialog.Create(nil) do
  try
    Options:= [fdoOverWritePrompt];
    with FileTypes.Add do
    begin
      DisplayName:='xml';
      FileMask:= '*.xml';
    end;
    with FileTypes.Add do
    begin
      DisplayName:='Any File';
      FileMask:= '*.*';
    end;
    FileName:= FXMLFileName;

    Result:= Execute;

    if Result then
       FXMLFileName:= FileName;
  finally
    Free;
  end;
end;


function TInvTransRuleExport.Execute: Boolean;
begin
  Result:= FALSE;

  // get save to file name
  if not AssignFileName() then
     EXIT;

  // create empty XML
  FRules:= inv_trans_rule_xml_types.NewInv_trans_rule();

  QryRule.Open;
  while not QryRule.Eof do
  begin
    ExportRule();
    QryRule.Next;
  end;

  FRules.OwnerDocument.SaveToFile( FXMLFileName );
  Result:= TRUE;
end;

function TInvTransRuleExport.ExportRule: Boolean;
var
  ARule: IXMLRow_ruleType;
  ADetail: IXMLRow_detailType;
begin
  ARule:= FRules.Add();
  ARule.Id                  := QryRule.FieldByName('Id').asString;
  ARule.Name                := QryRule.FieldByName('Name').asString;
  ARule.Descrip             := QryRule.FieldByName('Descrip').asString;
  ARule.Kind                := QryRule.FieldByName('Kind').asString;
  ARule.Eplant_id           := QryRule.FieldByName('Eplant_id').asString;
  ARule.Division_id         := QryRule.FieldByName('Division_id').asString;
  ARule.Source_module       := QryRule.FieldByName('Source_module').asString;
  ARule.Inv_move_class_id   := QryRule.FieldByName('Inv_move_class_id').asString;
  ARule.Trouble_locations_id:= QryRule.FieldByName('Trouble_locations_id').asString;
  ARule.Arinvt_group_id     := QryRule.FieldByName('Arinvt_group_id').asString;
  ARule.Wms_inv_group_id    := QryRule.FieldByName('Wms_inv_group_id').asString;

  QryDetail.Close;
  QryDetail.ParamByName('id').Value := QryRule.FieldByName('Id').asFloat;
  QryDetail.Open;
  while not QryDetail.Eof do
  begin
    ADetail:= ARule.Inv_trans_rule_detail.Add();
    ADetail.Id                   := QryDetail.FieldByName('Id').asString;
    ADetail.Inv_trans_rule_id    := QryDetail.FieldByName('Inv_trans_rule_id').asString;
    ADetail.Seq                  := QryDetail.FieldByName('Seq').asString;
    ADetail.Max_locations        := QryDetail.FieldByName('Max_locations').asString;
    ADetail.Min_pk_units         := QryDetail.FieldByName('Min_pk_units').asString;
    ADetail.Max_pk_units         := QryDetail.FieldByName('Max_pk_units').asString;
    ADetail.Inv_zone_id          := QryDetail.FieldByName('Inv_zone_id').asString;
    ADetail.Location_type_id     := QryDetail.FieldByName('Location_type_id').asString;
    ADetail.Pk_unit_type         := QryDetail.FieldByName('Pk_unit_type').asString;
    ADetail.Loc_status           := QryDetail.FieldByName('Loc_status').asString;
    ADetail.Al_inv_zone_id       := QryDetail.FieldByName('Al_inv_zone_id').asString;
    ADetail.Req_qty              := QryDetail.FieldByName('Req_qty').asString;
    ADetail.Alloc_partial_case   := QryDetail.FieldByName('Alloc_partial_case').asString;
    ADetail.Alloc_partial_pallet := QryDetail.FieldByName('Alloc_partial_pallet').asString;
    ADetail.Alloc_partial_lp     := QryDetail.FieldByName('Alloc_partial_lp').asString;
    ADetail.Inv_type             := QryDetail.FieldByName('Inv_type').asString;

    QryDetail.Next;
  end;
end;

{ TInvTransRuleImport }

constructor TInvTransRuleImport.Create(AOwner: TComponent);
begin
end;

function TInvTransRuleImport.AssignFileName: Boolean;
begin
  with TOpenTextFileDialog.Create(nil) do
  try
    Options:= [ofEnableSizing];
    DefaultExt:= '.xml';
    FileName:= FXMLFileName;

    Result:= Execute;

    if Result then
       FXMLFileName:= FileName;
  finally
    Free;
  end;
end;


function TInvTransRuleImport.Execute: Boolean;
var
  I: Integer;
begin
  Result:= FALSE;
  if not IQWarningYN('This option imports inventory transaction rules. Are you sure you want to continue?') then
     EXIT;

  // get save to file name
  if not AssignFileName() then
     EXIT;

  // load XML
  FRules:= inv_trans_rule_xml_types.Loadinv_trans_rule( FXMLFileName );

  // Import
  for I:= 0 to FRules.Count - 1 do
  try
    ImportRule( FRules[ I ]);
  except on E: Exception do
    IQError( E.Message );
  end;
  Result:= TRUE;
end;

procedure TInvTransRuleImport.ImportRule(ARule: IXMLRow_ruleType);
var
  ARule_ID: Real;
  I: Integer;

  // ---------------------------------------------------------------------------
  function _get_inv_trans_rule_id: Real;
  begin
    Result:= SelectValueFmtAsFloat('select id from inv_trans_rule                               '+
                       ' where nvl(eplant_id,0) = to_number(nvl(''%s'', 0))         '+
                       '   and nvl(division_id,0) = to_number(nvl(''%s'', 0))       '+
                       '   and nvl(source_module,''*'') = nvl(''%s'', ''*'')        '+
                       '   and nvl(kind,''*'') = nvl(''%s'', ''*'')                 '+
                       '   and nvl(inv_move_class_id,0) = to_number(nvl(''%s'', 0)) '+
                       '   and nvl(wms_inv_group_id,0) = to_number(nvl(''%s'', 0))  '+
                       '   and nvl(arinvt_group_id,0) = to_number(nvl(''%s'', 0))   ',
                       [ ARule.Eplant_id,
                         ARule.Division_id,
                         ARule.Source_module,
                         ARule.Kind,
                         ARule.Inv_move_class_id,
                         ARule.Wms_Inv_Group_ID,
                         ARule.Arinvt_Group_ID ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _update_rule( ARule_ID: Real );
  begin
    ExecuteCommandFmt('update inv_trans_rule                             '+
              '    set name = ''%s'',                            '+
              '        descrip = ''%s'',                         '+
              '        trouble_locations_id = to_number(''%s'')  '+
              '  where id = %f                                   ',
              [ ARule.Name,
                ARule.Descrip,
                ARule.Trouble_locations_ID,
                ARule_ID ]);
  end;


  // --------------------------------------------------------------------------
  function _append_rule: Real;
  begin
    Result:= GetNextID('inv_trans_rule');
    ExecuteCommandFmt('insert into inv_trans_rule                              '+
              '     ( id, eplant_id, division_id, source_module,       '+
              '       kind, inv_move_class_id, arinvt_group_id,        '+
              '       wms_inv_group_id )                               '+
              'values                                                  '+
              '     ( %f, to_number(''%s''), to_number(''%s''), ''%s'','+
              '       ''%s'', to_number(''%s''), to_number(''%s''),    '+
              '       to_number(''%s''))                               ',
              [ Result,
                ARule.Eplant_id,
                ARule.Division_id,
                ARule.Source_module,
                ARule.Kind,
                ARule.Inv_move_class_id,
                ARule.Arinvt_Group_ID,
                ARule.Wms_Inv_Group_ID ]);

    _update_rule( Result );
  end;


  procedure _import_detail( ARule_ID: Real; ADetail: IXMLRow_detailType );
  begin
    ExecuteCommandFmt('insert into inv_trans_rule_detail                                   '+
              '      ( inv_trans_rule_id, seq, max_locations, min_pk_units,        '+
              '        max_pk_units, inv_zone_id, location_type_id, pk_unit_type,  '+
              '        loc_status, al_inv_zone_id, req_qty,                        '+
              '        alloc_partial_case, alloc_partial_pallet, alloc_partial_lp, '+
              '        inv_type )                                                  '+
              ' values                                                             '+
              '      ( %f,                                                         '+    // inv_trans_rule_id
              '        to_number(''%s''),                                          '+    // seq,
              '        to_number(''%s''),                                          '+    // max_locations,
              '        to_number(''%s''),                                          '+    // min_pk_units,
              '        to_number(''%s''),                                          '+    // max_pk_units,
              '        to_number(''%s''),                                          '+    // inv_zone_id,
              '        to_number(''%s''),                                          '+    // location_type_id,
              '        ''%s'',                                                     '+    // pk_unit_type,
              '        ''%s'',                                                     '+    // loc_status,
              '        to_number(''%s''),                                          '+    // al_inv_zone_id,
              '        to_number(''%s''),                                          '+    // req_qty,
              '        ''%s'',                                                     '+    // alloc_partial_case,
              '        ''%s'',                                                     '+    // alloc_partial_pallet,
              '        ''%s'',                                                     '+    // alloc_partial_lp,
              '        ''%s'' )                                                    ',    // inv_type
              [ ARule_ID,
                ADetail.seq,
                ADetail.max_locations,
                ADetail.min_pk_units,
                ADetail.max_pk_units,
                ADetail.inv_zone_id,
                ADetail.location_type_id,
                ADetail.pk_unit_type,
                ADetail.loc_status,
                ADetail.al_inv_zone_id,
                ADetail.req_qty,
                ADetail.alloc_partial_case,
                ADetail.alloc_partial_pallet,
                ADetail.alloc_partial_lp,
                ADetail.inv_type ]);
  end;

begin
  // MAIN
  ARule_ID:= _get_inv_trans_rule_id();
  if ARule_ID = 0 then
     ARule_ID:= _append_rule
  else
     _update_rule( ARule_ID );

  ExecuteCommandFmt('delete from inv_trans_rule_detail where inv_trans_rule_id = %f', [ ARule_ID ]);

  for I:= 0 to ARule.Inv_trans_rule_detail.Count - 1 do
  begin
    _import_detail( ARule_ID, ARule.Inv_trans_rule_detail[ I ]);
  end;
end;

end.


