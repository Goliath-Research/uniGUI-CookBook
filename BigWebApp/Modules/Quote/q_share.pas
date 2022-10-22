unit Q_share;

interface

const
  pSTD_OPER   = 'OP';
  pOUTV_OPER  = 'OV';
  pBLEND_OPER = 'BL';
  pCOMP_OPER  = 'IN';
  pPACK_OPER  = 'PK';

  mrHeader              =  0;
  mrOptm_prcnt          =  1;
  mrCost                =  2;
  mrPrice               =  3;
  mrPrice1000           =  4;
  mrMargin              =  5;
  mrCost_prcnt          =  6;
  mrProd_prcnt          =  7;
  mrMtrl_prcnt          =  8;
  mrNetValue_Hr         =  9;
  mrYield_Hr            = 10;         
  mrBlank1              = 11;
  mrScrapByQty          = mrBlank1;

  mrProd_Hrs            = 12;
  mrOper_Hrs            = 13;  {operator hours}

  mrLabor_Cost          = 14;
  mrSetupLabor_Cost     = 15;
  mrOverhead_Cost       = 16;

  mrDry_Hrs             = 17;
  mrStart_Hrs           = 18;
  mrProd_Cost           = 19;
  mrOper_Cost           = 20;
  mrProd_Markup_Dollars = 21;
  mrProd_Total_Dollars  = 22;
  mrTbl_Fix_prcnt_Markup= 23;
  mrBlank2              = 24;

  mrLbs_Req             = 25;
  mrCost_Lb             = 26;

  mrPlastic_Cost        = 27;
  mrInsert_Cost         = 28;
  mrPkg_Cost            = 29;

  mrOutsource_Cost      = 30;
  mrMatl_Cost           = 31;
  mrMat_Markup          = 32;
  mrMat_Total_Dollars   = 33;
  mrTbl_Fix_Mat_Markup  = 34;
  mrBlank3              = 35;

  mrTotal_EXchrg        = 36;
  mrTotal_Commiss       = 37;
  mrBlank4              = 38;

  mrTotal_Dollars       = 39;
  mrTotal_Cost_Dollars  = 40;
  mrTotal_Profit        = 41;
  mrValue_Added_Profit  = 42;
  mrVGM                 = 43;  // variable gross margin

  mrByProductQty        = 44;
  mrSkeleton_Cost       = 45;

type
  TOptimizationKind = ( okPrice, okPercent, okMargin, okYield );

function GetSheetWeight( AQuote_ID: Real ): Real;
function GetBy_Product_QOpmat_ID_Of( AQInvt_ID: Real ): Real;
function GetBy_Product_QInvt_ID_Of_Quote( AQuote_ID: Real ): Real;
function GetSkeletonWeight( AQuote_ID: Real ): Real;
procedure Delete_Quote( AQuote_ID: Real );
function GetEffectiveScrapUsingMethod( AScrap: Real ): Real;


implementation

uses
  IQMS.Common.DataLib,
  Variants,
  IQMS.Common.MfgShare;

function GetSheetWeight( AQuote_ID: Real ): Real;
var
  AMfgType: string;
begin
  AMfgType:= IQMS.Common.MfgShare.Lookup_MfgType( SelectValueByID('mfg_type', 'quote', AQuote_ID ));
  if AMfgType = 'TFORM2' then
    Result:= SelectValueFmtAsFloat('select i.width * i.length * i.spg * nvl(rfq.gauge, i.gauge) '+   // * 0.0361 * 453.59 '+
                       '  from quote rfq, qinvt i where rfq.id = %f and rfq.qinvt_id_mat = i.id',
                       [ AQuote_ID ])

  else if AMfgType = 'THERMOFORM' then
    Result:= SelectValueFmtAsFloat('select (rfq.sheet_width + nvl(rfq.rail,0)) * (rfq.sheet_length + nvl(rfq.clamp,0)) * qinvt.spg * nvl(rfq.gauge, qinvt.gauge) '+ // * 0.0361 * 453.59 '+
                       '  from quote rfq, qinvt where rfq.id = %f and rfq.qinvt_id_mat = qinvt.id',
                       [ AQuote_ID ])
  else
    Result:= 0;

  if SelectValueFmtAsFloat('select uom.is_metric_sys_num( %f ) from dual', [ SelectValueFmtAsFloat('select eplant_id from quote where id = %f', [ AQuote_ID ])]) = 0 then  // not metric
     Result:= Result * 0.0361 * 453.59;
end;


function GetBy_Product_QOpmat_ID_Of( AQInvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select qopmat.id                            '+
                     '  from qptoper, qopmat, qinvt               '+
                     ' where qptoper.qinvt_id = %f                '+
                     '   and qptoper.qsndop_id = qopmat.qsndop_id '+
                     '   and qopmat.qinvt_id = qinvt.id           '+
                     '   and qinvt.is_by_product = ''Y''          ',
                     [ AQInvt_ID ]);
end;


function GetBy_Product_QInvt_ID_Of_Quote( AQuote_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select o.qinvt_id                            '+
                     '  from qinvt a, qptoper p, qopmat o, qinvt b '+
                     ' where a.quote_id = %f                       '+
                     '   and p.qinvt_id = a.id                     '+
                     '   and p.qsndop_id = o.qsndop_id             '+
                     '   and o.qinvt_id = b.id                     '+
                     '   and b.is_by_product = ''Y''               ',
                     [ AQuote_ID ]);
end;


function GetSkeletonWeight( AQuote_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select appdef_quote_thermoform.get_skeleton_weight( %f ) from dual', [ AQuote_ID ]);
end;


procedure Delete_Quote( AQuote_ID: Real );

  procedure DeleteUniqueQSndOpsForQuote;
  begin
    ExecuteCommandFmt('begin                                                                                 '+
              '    for v in (select id as qinvt_id from qinvt where quote_id = %f)                   '+
              '    loop                                                                              '+
              '       for x in ( select qsndop_id                                                    '+
              '                    from qptoper                                                      '+
              '                   where qinvt_id = v.qinvt_id                                        '+
              '                     and qsndop_id not in                                             '+
              '                         ( select qsndop_id from qptoper p2                           '+
              '                          where p2.qinvt_id <> qptoper.qinvt_id ))                    '+
              '       loop                                                                           '+
              '         delete from qptoper where qinvt_id = v.qinvt_id and qsndop_id = x.qsndop_id; '+
              '         delete from qopmat where qsndop_id = x.qsndop_id;                            '+
              '         delete from qsndop where id = x.qsndop_id;                                   '+
              '       end loop;                                                                      '+
              '    end loop;                                                                         '+
              'end;                                                                                ',
              [ AQuote_ID ]);

    ExecuteCommandFmt( 'delete from qptoper where qinvt_id in (select id from qinvt where quote_id = %f)', [ AQuote_ID ]);
  end;


  procedure Delete_QOpmat_QSndOp_QPtOper;
  begin
    ExecuteCommandFmt( 'declare                                                                     '+
               '  v_tmp number;                                                             '+
               'begin                                                                       '+
               '  for v in (select id, qsndop_id from qopmat m                              '+
               '             where m.qinvt_id in (select id from qinvt                      '+
               '                                   where quote_id = %f ))                   '+
               '  loop                                                                      '+
               '     delete from qopmat where id = v.id;                                    '+
               '                                                                            '+
               '     select count(id) into v_tmp from qopmat where qsndop_id = v.qsndop_id; '+
               '     if v_tmp = 0 then                                                      '+
               '        delete from qptoper where qsndop_id = v.qsndop_id;                  '+
               '        delete from qsndop where id = v.qsndop_id;                          '+
               '     end if;                                                                '+
               '  end loop;                                                                 '+
               'end;                                                                        ',
               [ AQuote_ID ]);
  end;

begin
  {Delete from QOpmat what this item consumed}
  DeleteUniqueQSndOpsForQuote;

  ExecuteCommandFmt('update standard set rfq = '''', quote_id = null where rfq = ''%s''', [ SelectValueByID('rfq', 'quote', AQuote_ID) ]);

  {Delete Quote!}
  ExecuteCommandFmt('delete from quote where id = %f', [ AQuote_ID ]);

  {Delete this item from QOpmat (consumed by others) }
  Delete_QOpmat_QSndOp_QPtOper;

  {Delete Qinvt!}
  ExecuteCommandFmt('delete from qinvt where quote_id = %f', [ AQuote_ID ]);
end;

function GetEffectiveScrapUsingMethod( AScrap: Real ): Real;
var
  AMethod: string;
begin
  {Note: AScrap represents scrap/100. Example: nPtsPer * GetEffectiveScrapUsingMethod( TblQOpmatSCRAP.asFloat / 100 ) * nQuan}
  AMethod:= SelectValueAsString('select nvl(scrap_calc_method, ''0'') from qparams');
  if AMethod = '1' then
     begin
       if AScrap = 0 then
          Result:= 1
       else if AScrap = 1 then
          Result:= 1
       else
          Result:= 1/( 1 - AScrap )
     end
  else
     Result:= (1 + AScrap)
end;


end.
