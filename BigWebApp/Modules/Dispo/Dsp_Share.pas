unit Dsp_Share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Mask,
  { TODO -oSanketG -cWC : Need to revisit }
  //prw_jc_main,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TCalcActCostCargo = record
    Workorder_ID: Real;
    Arinvt_ID   : Real;
    FGMulti_ID  : Real;
    TransQuan   : Real;
    Sub_Batch   : Real;
    ActCost     : Real;
  end;


procedure UpdateRollingAverageActCost( AFGMulti_ID, ATransQuan, ATransCost, ASub_Batch : Real );
procedure UpdateArinvtAverageCost( AArinvt_ID: Real );

{process cost calc}
procedure AssignProcCostParamsTable( AWorkorder_ID: Real );
{ TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
{function CreateJobCosting( AWorkorder_ID: Real ): TFrmPrwJCMain;
function ExecuteJobCosting( AJobCosting: TFrmPrwJCMain; AArinvt_ID: Real ): Real;}
procedure CalcSaveActCost( ACargo: TCalcActCostCargo );

implementation

uses
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager;

procedure UpdateRollingAverageActCost( AFGMulti_ID, ATransQuan, ATransCost, ASub_Batch : Real );
begin
  ExecuteCommandFmt('declare                                                                            '+
            '  v_fgmulti_id        number::= %.0f;                                              '+
            '  v_trans_quan        number::= %.6f;                                              '+
            '  v_trans_act_cost    number::= %.6f;                                              '+
            '  v_fgmulti_onhand    number;                                                      '+
            '  v_fgmulti_act_cost  number;                                                      '+
            '  v_sub_batch         number::= %.0f;                                              '+
            'begin                                                                              '+

               // calc rolled act cost
            '  select nvl(onhand, 0), nvl(act_cost,0) into v_fgmulti_onhand, v_fgmulti_act_cost '+
            '    from fgmulti                                                                   '+
            '   where id = v_fgmulti_id;                                                        '+
            '                                                                                   '+
            '  v_fgmulti_onhand::= v_fgmulti_onhand - v_trans_quan;                             '+
            '                                                                                   '+
            '  if v_fgmulti_onhand > 0 and v_fgmulti_act_cost > 0 and (v_fgmulti_onhand + v_trans_quan <> 0) then                                      '+
            '     v_fgmulti_act_cost::= (v_fgmulti_onhand * v_fgmulti_act_cost + v_trans_quan * v_trans_act_cost) / (v_fgmulti_onhand + v_trans_quan); '+
            '  else                                                                             '+
            '     v_fgmulti_act_cost::= v_trans_act_cost;                                       '+
            '  end if;                                                                          '+

               // update fgmulti calc rolled act_cost
            '  update fgmulti set act_cost = v_fgmulti_act_cost where id = v_fgmulti_id;        '+

               // update translog act_cost
            '  if nvl(v_trans_act_cost,0) <> 0 then                                             '+
            '     update translog set act_cost = v_trans_act_cost                               '+
            '      where sub_batch = v_sub_batch                                                '+
            '        and fgmulti_id = v_fgmulti_id;                                             '+
            '  end if;                                                                          '+

            'exception when no_data_found then                                                  '+
            '  return;                                                                          '+
            'end;                                                                               ',
            [ AFGMulti_ID,
              ATransQuan,
              ATransCost,
              ASub_Batch ]);
end;


procedure UpdateArinvtAverageCost( AArinvt_ID: Real );
begin
  ExecuteCommandFmt('begin inventory_trans.update_arinvt_avg_cost_ex( %f ); end;', [ AArinvt_ID ]);
end;


procedure AssignProcCostParamsTable( AWorkorder_ID: Real );
begin
  ExecuteCommandFmt('declare                                                      '+
            '  v_workorder_id number::= %f;                               '+
            '  v_userid       varchar2(50)::= ''%s'';                     '+
            'begin                                                        '+
            '  update c_process_cost_hdr                                  '+
            '     set date_start   = sysdate-365,                         '+
            '         date_end     = sysdate,                             '+
            '         orderno      = null,                                '+
            '         mfgno        = null,                                '+
            '         workorder_id = v_workorder_id,                      '+
            '         lotno        = null                                 '+
            '  where userid = v_userid;                                   '+

            '  if sql%%notfound then                                      '+
            '     insert into c_process_cost_hdr                          '+
            '         ( date_start, date_end, workorder_id, userid )      '+
            '      values                                                 '+
            '         ( sysdate-365, sysdate, v_workorder_id, v_userid ); '+
            '  end if;                                                    '+
            'end;                                                         ',
            [ AWorkorder_ID,
              SecurityManager.UserName ]);
end;

{ TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
{function CreateJobCosting( AWorkorder_ID: Real ): TFrmPrwJCMain;
begin
  dsp_share.AssignProcCostParamsTable( AWorkorder_ID );   // this unit

  Result:= TFrmPrwJCMain.Create( nil );
  with TFrmPrwJCMain( Result ) do
  begin
    Arinvt_ID    := 0;
    Workorder_ID := AWorkorder_ID;
  end;
end;

function ExecuteJobCosting( AJobCosting: TFrmPrwJCMain; AArinvt_ID: Real ): Real;
begin
  with AJobCosting do
  try
    OpenQuery;
    InitCriteria;
    // DoShowProcessCost;

    Execute;

    Result:= GetItemCalculatedActualCost( AArinvt_ID );
  except on E: Exception do
    raise Exception.Create('Unable to calculate actual costing. Error: ' + E.Message );
  end;
end;}


procedure CalcSaveActCost( ACargo: TCalcActCostCargo );
{ TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
{var
  AJobCosting: TFrmPrwJCMain;}
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
  //AJobCosting:= CreateJobCosting( ACargo.Workorder_ID );
  try
    try
      { TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
      //ACargo.ActCost:= ExecuteJobCosting( AJobCosting, ACargo.Arinvt_ID );

      if ACargo.ActCost > 0 then
         UpdateRollingAverageActCost( ACargo.FGMulti_ID, ACargo.TransQuan, ACargo.ActCost, ACargo.Sub_Batch );

    except on E: Exception do
      raise Exception.Create('Unable to calculate actual costing. Error: ' + E.Message );
    end;
  finally
    { TODO -oSanketG -cWC : Need to revisit , dependent on prw_jc_main}
    //AJobCosting.Release;
    Application.ProcessMessages;
  end;
end;





end.
