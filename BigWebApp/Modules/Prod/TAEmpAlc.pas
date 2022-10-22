unit TAEmpAlc;

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
  Emp_Aloc,
  Db,
  Wwdatsrc,
  ComCtrls,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Mask,
  StdCtrls,
  Grids,
  Buttons,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniStatusBar, uniDBNavigator, uniEdit,
  uniDBEdit, uniCheckBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniButton, uniGUIClasses, uniBasicGrid, uniStringGrid,
  uniLabel, uniBitBtn, uniSpeedButton, IQUniGrid, uniGUIFrame, uniPanel,
  uniSplitter, uniPageControl, uniGUIBaseClasses,
  uniGUIApplication;

type
  TFrmTAEmpAllocLabor = class(TFrmEmpAllocLabor)
    procedure UniFormShow(Sender: TObject);
  private
    FPR_Emp_Id: Real;
    FDay_Part_ID: Real;
    { Private declarations }
    procedure AssignItemInfoFromProd( ADay_Part_ID: Real ); override;
    procedure SetPR_Emp_Id(const Value: Real);
  public
    { Public declarations }
    property PR_Emp_Id: Real write SetPR_Emp_Id;
  end;

procedure DoTAEmployeeLaborAllocation( ADay_Part_ID, APR_Emp_Id: Real );



implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  Variants,
  prod_rscstr;

procedure DoTAEmployeeLaborAllocation( ADay_Part_ID, APR_Emp_Id: Real );
var
  FrmTAEmpAllocLabor: TFrmTAEmpAllocLabor;
begin
  FrmTAEmpAllocLabor := TFrmTAEmpAllocLabor.Create( uniGUIApplication.uniApplication );
  FrmTAEmpAllocLabor.Day_Part_ID := ADay_Part_ID;
  FrmTAEmpAllocLabor.PR_Emp_Id := APR_Emp_Id;
  FrmTAEmpAllocLabor.ShowModal;
end;

procedure TFrmTAEmpAllocLabor.SetPR_Emp_Id(const Value: Real);
begin
  FPR_Emp_Id := Value;
end;

procedure TFrmTAEmpAllocLabor.UniFormShow(Sender: TObject);
begin
  inherited;
  wwQryEmp.Locate('ID', FPR_Emp_Id, []);
  wwComboEmp.Text :=wwQryEmpEmpno.asString;
  wwComboEmpCloseUp(nil, wwQryEmp, nil, true);
end;

procedure TFrmTAEmpAllocLabor.AssignItemInfoFromProd( ADay_Part_ID: Real );
var
  A: Variant;
begin
  FDay_Part_ID:= ADay_Part_ID;
  FArinvt_ID  := 0;
  FStandard_ID:= 0;
  FProdDate   := 0;

  A:= SelectValueArrayFmt( 'select d.prod_date,                '+
                      '       h.standard_id,              '+
                      '       n.arinvt_id,                '+
                      '       t.itemno,                   '+
                      '       t.rev,                      '+
                      '       h.mfgno,                    '+
                      '       d.prod_hrs,                 '+
                      '       p.good_pts                  '+
                      '  from dayprod d,                  '+
                      '       day_part p,                 '+
                      '       hist_illum_rt h,            '+
                      '       hist_illum_part t,          '+
                      '       partno n                    '+
                      ' where p.id = %f                   '+   // position day_part
                      '   and p.dayprod_id = d.id         '+   // link dayprod to get prod_date and illum_rt_id
                      '   and h.id = d.hist_illum_rt_id   '+   // link hist_illum_rt for standard_id
                      '   and p.hist_illum_part_id = t.id '+   // link hist_illum_part for partno_id
                      '   and n.id = t.partno_id          ',   // link partno to get arinvt_id
                      [ FDay_Part_ID ]);

  if VarArrayDimCount( A ) > 0 then
  begin
    FProdDate   := A[ 0 ];
    FStandard_ID:= A[ 1 ];
    FArinvt_ID  := A[ 2 ];
    FProdHrs    := A[ 6 ];
    FGoodPts    := A[ 7 ];

    StatusBar1.Panels[ 0 ].Text := Format(prod_rscstr.cTXT0000020 {'Manufacturing # %s'}, [A[5]]);
    StatusBar1.Panels[ 1 ].Text := Format(prod_rscstr.cTXT0000021 {'Production Date %s'}, [DateToStr( FProdDate )]);
    StatusBar1.Panels[ 2 ].Text := Format(prod_rscstr.cTXT0000022 {'Item # %s'}         , [Trim(A[ 3 ]) + sIIf( Trim(A[ 4 ]) = '', '', ' / '+ A[ 4 ])]);
    StatusBar1.Update;

  end
  else
  begin

    A:= SelectValueArrayFmt( 'select d.prod_date,                '+
                        '       h.standard_id,              '+
                        '       n.arinvt_id,                '+
                        '       t.itemno,                   '+
                        '       t.rev,                      '+
                        '       h.mfgno,                    '+
                        '       d.prod_hrs,                 '+
                        '       p.good_pts                  '+
                        '  from pdayprod d,                  '+
                        '       pday_part p,                 '+
                        '       hist_illum_rt h,            '+
                        '       hist_illum_part t,          '+
                        '       partno n                    '+
                        ' where p.id = %f                   '+   // position day_part
                        '   and p.dayprod_id = d.id         '+   // link dayprod to get prod_date and illum_rt_id
                        '   and h.id = d.hist_illum_rt_id   '+   // link hist_illum_rt for standard_id
                        '   and p.hist_illum_part_id = t.id '+   // link hist_illum_part for partno_id
                        '   and n.id = t.partno_id          ',   // link partno to get arinvt_id
                        [ FDay_Part_ID ]);

    if VarArrayDimCount( A ) > 0 then
    begin
      FProdDate   := A[ 0 ];
      FStandard_ID:= A[ 1 ];
      FArinvt_ID  := A[ 2 ];
      FProdHrs    := A[ 6 ];
      FGoodPts    := A[ 7 ];

      StatusBar1.Panels[ 0 ].Text := Format(prod_rscstr.cTXT0000020 {'Manufacturing # %s'}, [A[5]]);
      StatusBar1.Panels[ 1 ].Text := Format(prod_rscstr.cTXT0000021 {'Production Date %s'}, [DateToStr( FProdDate )]);
      StatusBar1.Panels[ 2 ].Text := Format(prod_rscstr.cTXT0000022 {'Item # %s'}         , [Trim(A[ 3 ]) + sIIf( Trim(A[ 4 ]) = '', '', ' / '+ A[ 4 ])]);
      StatusBar1.Update;
    end;


  end

end;



end.
