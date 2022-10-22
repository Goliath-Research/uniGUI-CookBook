unit qc_eco_caption;

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
  IQMS.WebVcl.AppDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TQCEcoCaptionManager = class
  private
    FEoc_ID     : Real;
    FEco_Bom_ID : Real;
    FMfgType    : string;
    FStandard_ID: Real;
    AppDef1     : TAppDef;
    function CaptionByFieldNameFromStandard( AFieldName: string ): string;
    function CaptionByFieldNameFromPartno  ( AFieldName: string ): string;
    function CaptionByFieldNameFromSndOp   ( AFieldName: string ): string;
    function CaptionByFieldNameFromOpMat   ( AFieldName: string ): string;
    function CaptionByFieldNameFromPtoper  ( AFieldName: string; ANewID: Real ): string;
  public
    constructor Create( AEoc_ID, AEco_Bom_ID: Real );
    destructor Destroy; override;
    function CaptionByFieldName( ATableName, AFieldName: string; ANewID: Real = -1 ): string;
  end;

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  Variants;

constructor TQCEcoCaptionManager.Create( AEoc_ID: Real; AEco_Bom_ID: Real );
var
  A: Variant;
begin
  inherited Create;
  FEoc_ID := AEoc_ID;
  FEco_Bom_ID:= AEco_Bom_ID;

  A:= SelectValueArrayFmt( 'select s.mfg_type, s.id from standard s, eco_bom e where e.id = %f and s.id = e.standard_id', [ FEco_Bom_ID ]);
  if VarArrayDimCount( A ) = 0 then
     raise Exception.CreateFmt('Unable to locate standard for ECO_BOM_ID = %.0f', [ FEco_Bom_ID ]);

  FMfgType    := A[ 0 ];
  FStandard_ID:= A[ 1 ];

  { TODO -omugdha -cWebConvert : Dependency
  AppDef1:= IQMS.WebVcl.AppDef.Create( Application );
  AppDef1.AppCode:= 'BOM';
  AppDef1.MfgType:= FMfgType;
  }
end;

destructor TQCEcoCaptionManager.Destroy;
begin
  Appdef1.Free;
  inherited;
end;

function TQCEcoCaptionManager.CaptionByFieldName( ATableName, AFieldName: string; ANewID: Real = -1 ): string;
begin
  if      ATableName = 'STANDARD' then  Result:= CaptionByFieldNameFromStandard( AFieldName )
  else if ATableName = 'PARTNO'   then  Result:= CaptionByFieldNameFromPartno  ( AFieldName )
  else if ATableName = 'PTOPER'   then  Result:= CaptionByFieldNameFromPtoper  ( AFieldName, ANewID )
  else if ATableName = 'SNDOP'    then  Result:= CaptionByFieldNameFromSndOp   ( AFieldName )
  else if ATableName = 'OPMAT'    then  Result:= CaptionByFieldNameFromOpMat   ( AFieldName )
  else
       Result:= Format('%s %s', [ ProperCase(ATableName), ProperCase( AFieldName )]);
end;

function TQCEcoCaptionManager.CaptionByFieldNameFromStandard( AFieldName: string ): string;
begin
  if      CompareText( AFieldName, 'sets_disp'          ) = 0 then Result:= AppDef1.Execute( 'Lbl_Unit_Cycle', [ FMfgType ]).asString
  else if CompareText( AFieldName, 'cycletm_disp'       ) = 0 then Result:= AppDef1.Execute( 'Lbl_Cycle_Sec' , [ FMfgType ]).asString
  else if CompareText( AFieldName, 'sprue_disp'         ) = 0 then Result:= AppDef1.Execute( 'Lbl_Sprue'     , [ FMfgType ]).asString
  else if CompareText( AFieldName, 'scrap'              ) = 0 then Result:= 'Scrap %'
  else if CompareText( AFieldName, 'regrind'            ) = 0 then Result:= 'Allow Reg %'
  else if CompareText( AFieldName, 'operator'           ) = 0 then Result:= 'Labor'
  else if CompareText( AFieldName, 'setuphrs'           ) = 0 then Result:= 'SetUp Hrs 1'
  else if CompareText( AFieldName, 'fg_lotno'           ) = 0 then Result:= 'FG Lot#'
  else if CompareText( AFieldName, 'runscope'           ) = 0 then Result:= 'Mfg Run Size'
  else if CompareText( AFieldName, 'rg_dispo'           ) = 0 then Result:= 'RG Dispo'
  else if CompareText( AFieldName, 'reuse'              ) = 0 then Result:= 'Reuse'
  else if CompareText( AFieldName, 'cntr_type'          ) = 0 then Result:= AppDef1.Execute( 'Lbl_Press_Size', [ FMfgType ]).asString
  else if CompareText( AFieldName, 'arinvt_id_mat'      ) = 0 then Result:= 'Material'
  else if CompareText( AFieldName, 'userid'             ) = 0 then Result:= 'User'
  else if CompareText( AFieldName, 'arcusto_id'         ) = 0 then Result:= 'Customer'
  else if CompareText( AFieldName, 'rfq'                ) = 0 then Result:= 'From RFQ#'
  else if CompareText( AFieldName, 'first_article_date' ) = 0 then Result:= '1st Article Date'
  else if CompareText( AFieldName, 'uom'                ) = 0 then Result:= 'UOM'
  else if CompareText( AFieldName, 'cntr_cost'          ) = 0 then Result:= 'Center Cost'
  else if CompareText( AFieldName, 'pmeqmt_id'          ) = 0 then Result:= 'Tool Equipment#'
  else if CompareText( AFieldName, 'eff_factor'         ) = 0 then Result:= 'Eff. Factor'
  else if CompareText( AFieldName, 'descrip'            ) = 0 then Result:= 'BOM Description'
  else if CompareText( AFieldName, 'labor_rate'         ) = 0 then Result:= 'Labor Rate'
  else if CompareText( AFieldName, 'cuser1'             ) = 0 then Result:= 'User Defined Chr 1'
  else if CompareText( AFieldName, 'cuser2'             ) = 0 then Result:= 'User Defined Chr 2'
  else if CompareText( AFieldName, 'cuser3'             ) = 0 then Result:= 'User Defined Chr 3'
  else if CompareText( AFieldName, 'cuser4'             ) = 0 then Result:= 'User Defined Chr 4'
  else if CompareText( AFieldName, 'cuser5'             ) = 0 then Result:= 'User Defined Chr 5'
  else if CompareText( AFieldName, 'cuser6'             ) = 0 then Result:= 'User Defined Chr 6'
  else if CompareText( AFieldName, 'nuser1'             ) = 0 then Result:= 'User Defined Num 1'
  else if CompareText( AFieldName, 'nuser2'             ) = 0 then Result:= 'User Defined Num 2'
  else if CompareText( AFieldName, 'nuser3'             ) = 0 then Result:= 'User Defined Num 3'
  else if CompareText( AFieldName, 'nuser4'             ) = 0 then Result:= 'User Defined Num 4'
  else if CompareText( AFieldName, 'nuser5'             ) = 0 then Result:= 'User Defined Num 5'
  else if CompareText( AFieldName, 'currency_id'        ) = 0 then Result:= 'Currency'
  else if CompareText( AFieldName, 'with_assy_at_press' ) = 0 then Result:= 'Assy @ Mach'
  else if CompareText( AFieldName, 'batch_type'         ) = 0 then Result:= 'Batch Production'
  else if CompareText( AFieldName, 'eplant_id'          ) = 0 then Result:= 'EPlant ID'
  else if CompareText( AFieldName, 'mfgcell_id'         ) = 0 then Result:= 'Cell'
  else if CompareText( AFieldName, 'runs_best_from_date') = 0 then Result:= 'Runs Best From'
  else if CompareText( AFieldName, 'flat_cycletm'       ) = 0 then Result:= 'Flat Ratio'
  else if CompareText( AFieldName, 'effect_date'        ) = 0 then Result:= 'Eff. Date'
  else if CompareText( AFieldName, 'deactive_date'      ) = 0 then Result:= 'Deactive Date'
  else if CompareText( AFieldName, 'planning_fence'     ) = 0 then Result:= 'Mfg Planning Fence'
  else if CompareText( AFieldName, 'route_seq'          ) = 0 then Result:= 'Routing Seq'
  else if CompareText( AFieldName, 'reuse_sprue'        ) = 0 then Result:= 'Reuse Sprue'
  else if CompareText( AFieldName, 'chk_avail_rg_prcnt' ) = 0 then Result:= 'Check Avail RG %'
  else if CompareText( AFieldName, 'model_header_id'    ) = 0 then Result:= 'Configurator Model'
  else if CompareText( AFieldName, 'setuphrs2'          ) = 0 then Result:= 'SetUp Hrs2'
  else
       Result:= ProperCase( AFieldName );
end;

function TQCEcoCaptionManager.CaptionByFieldNameFromPartno  ( AFieldName: string ): string;
begin
  if      CompareText( AFieldName, 'arinvt_id') = 0 then Result:= 'Mfg Item'
  else if CompareText( AFieldName, 'id'       ) = 0 then Result:= 'PartNo ID'
  else if CompareText( AFieldName, 'stdcav'   ) = 0 then
          begin
            if SelectValueByID( 'with_assy_at_press', 'standard', FStandard_ID ) = 'Y' then
               Result:= 'Std Multiplier'
            else
               Result:= AppDef1.Execute( 'Lbl_StdCav', [ NIL ]).asString
          end
  else if CompareText( AFieldName, 'actcav'         ) = 0 then
          begin
            if SelectValueByID( 'with_assy_at_press', 'standard', FStandard_ID ) = 'Y' then
               Result:= 'Act Multiplier'
            else
               Result:= AppDef1.Execute( 'Lbl_ActCav', [ NIL ]).asString
          end
  else if CompareText( AFieldName, 'ptwt_disp'     ) = 0 then Result:= AppDef1.Execute( 'Lbl_Part_Wt', [ FMfgType ]).asString
  else if CompareText( AFieldName, 'boxno'         ) = 0 then Result:= 'Box #'
  else if CompareText( AFieldName, 'mfg_seq'       ) = 0 then Result:= 'Mfg Seq'
  else if CompareText( AFieldName, 'mfg_threshold' ) = 0 then Result:= 'Mfg Threshold'
  else if CompareText( AFieldName, 'mfg_percent'   ) = 0 then Result:= 'Mfg %'
  else if CompareText( AFieldName, 'nuser1'        ) = 0 then Result:= 'User Defined Num 1'
  else
       Result:= ProperCase( AFieldName );
end;

function TQCEcoCaptionManager.CaptionByFieldNameFromSndOp( AFieldName: string ): string;
begin
  if      CompareText( AFieldName, 'id'       ) = 0 then Result:= 'Operation ID'
  else if CompareText( AFieldName, 'op_class' ) = 0 then Result:= 'Operation class'
  else if CompareText( AFieldName, 'opno'     ) = 0 then Result:= 'Operation #'
  else if CompareText( AFieldName, 'opdesc'   ) = 0 then Result:= 'Operation Description'
  else
       Result:= ProperCase( AFieldName );
end;

function TQCEcoCaptionManager.CaptionByFieldNameFromPtoper  ( AFieldName: string; ANewID: Real ): string;
begin
  if      CompareText( AFieldName, 'id'           ) = 0 then Result:= SelectValueFmtAsString('select s.opdesc from ptoper p, sndop s where p.id = %f and p.sndop_id = s.id', [ ANewID ])
  else if CompareText( AFieldName, 'cycletm_disp' ) = 0 then Result:= 'Process Cycle Time'
  else if CompareText( AFieldName, 'scrap_disp'   ) = 0 then Result:= 'Process Yield %'
  else if CompareText( AFieldName, 'opseq'        ) = 0 then Result:= 'Seq'
  else
       Result:= ProperCase( AFieldName );
end;


function TQCEcoCaptionManager.CaptionByFieldNameFromOpMat( AFieldName: string ): string;
begin
  if      CompareText( AFieldName, 'arinvt_id'           ) = 0 then Result:= 'Item ID'
  else if CompareText( AFieldName, 'id'                  ) = 0 then Result:= 'Item Description'
  else if CompareText( AFieldName, 'ptsper'              ) = 0 then Result:= 'Parts Per'
  else if CompareText( AFieldName, 'weight'              ) = 0 then Result:= 'Gross weight'
  else if CompareText( AFieldName, 'seq'                 ) = 0 then Result:= 'Seq#'
  else if CompareText( AFieldName, 'dispo_cycles_based'  ) = 0 then Result:= 'Dispo by cycles'
  else if CompareText( AFieldName, 'scrap'               ) = 0 then Result:= 'Scrap#'
  else if CompareText( AFieldName, 'standard_id'         ) = 0 then Result:= 'Apply Mfg#'
  else if CompareText( AFieldName, 'exclude_scrap_dispo' ) = 0 then Result:= 'Exclude from calc'
  else if CompareText( AFieldName, 'overlap_hrs'         ) = 0 then Result:= 'Overlap Hrs'
  else if CompareText( AFieldName, 'let_down_ratio'      ) = 0 then Result:= 'Let Down Ratio'
  else if CompareText( AFieldName, 'exclude_backflush'   ) = 0 then Result:= 'Exclude From Backflush'
  else if CompareText( AFieldName, 'tare_weight'         ) = 0 then Result:= 'Tare Weight'
  else if CompareText( AFieldName, 'returnable_container') = 0 then Result:= 'Returnable Container'
  else if CompareText( AFieldName, 'cuser1'              ) = 0 then Result:= 'User Defined Chr 1'
  else if CompareText( AFieldName, 'cuser2'              ) = 0 then Result:= 'User Defined Chr 2'
  else if CompareText( AFieldName, 'cuser3'              ) = 0 then Result:= 'User Defined Chr 3'
  else if CompareText( AFieldName, 'nuser1'              ) = 0 then Result:= 'User Defined Num 1'
  else if CompareText( AFieldName, 'nuser2'              ) = 0 then Result:= 'User Defined Num 2'
  else if CompareText( AFieldName, 'nuser3'              ) = 0 then Result:= 'User Defined Num 3'
  else
       Result:= ProperCase( AFieldName );
end;


end.
