unit ForeData;

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
  ComCtrls,
  ExtCtrls,
  Db,
  Wwdbigrd,
  Wwdbgrid,
  Wwdatsrc,
  ForeBase,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  MainModule,
  IQUniGrid;

type
  TForeBasClass = class of TForeBas;

  { TForeBas }
  TForeBas = class(TObject)
  private
    FOwner      : TFrmForecast;
    FwwQuery    : TFDQuery;
    FwwDBGrid   : TwwDBGrid;
    FIsGraph    : Boolean;
    FIsExecutive: Boolean;

    function GetFromDate  : TDateTime;
    function GetToDate    : TDateTime;
    function GetArcusto_ID: Real;
    function GetIsQty     : Boolean;
    function GetFullItemInfo: Boolean;
    function GetExcludeNonSalable: Boolean;

  protected
    procedure AddSelectSum;
    procedure AddSelectFrom; virtual; abstract;
    function ColExpr: string; virtual;
    procedure AddWhere; virtual;

  public
    constructor Create( AOwner: TFrmForecast; AwwQuery: TFDQuery );
    procedure BuildSQL;
    procedure Open;

    property wwQuery    : TFDQuery  read FwwQuery write FwwQuery;
    property wwGrid     : TwwDBGrid read FwwDBGrid write FwwDBGrid;
    property FromDate   : TDateTime read GetFromDate;
    property ToDate     : TDateTime read GetToDate;
    property Arcusto_ID : Real      read GetArcusto_ID;
    property IsQty      : Boolean   read GetIsQty;
    property IsGraph    : Boolean   read FIsGraph write FIsGraph;
    property IsExecutive: Boolean   read FIsExecutive write FIsExecutive;
    property FullItemInfo: Boolean  read GetFullItemInfo;
    property ExcludeNonSalable: Boolean read GetExcludeNonSalable;
  end;

  { TForeOnOrd }

  TForeOnOrder = class( TForeBas )
    procedure AddSelectFrom; override;
  end;

  { TForeShipped }

  TForeShipped = class( TForeBas )
    procedure AddSelectFrom; override;
  end;

  { TForeCurrent }

  TForeCurrent = class( TForeBas )
    procedure AddSelectFrom; override;
    function ColExpr: string; override;
    procedure AddWhere; override;
  end;


implementation

uses
  IQMS.Common.PanelMsg,
  IQMS.Common.NLS,
  IQMS.Common.DataLib;

constructor TForeBas.Create( AOwner: TFrmForecast; AwwQuery: TFDQuery );
var
  AComponent: TComponent;
begin
  FOwner     := AOwner;
  FwwQuery   := AwwQuery;
  FIsGraph   := FALSE;
  IsExecutive:= FALSE;
  AComponent:= FOwner.FindComponent('DBGrid1');
  if Assigned(AComponent) then
     { TODO -oSanketG -cWebConvert : Need to revisit
     [dcc32 Error] ForeData.pas(107): E2010 Incompatible types: 'TwwDBGrid' and 'TIQUniGridControl'}
     //FwwDBGrid := AComponent as TIQUniGridControl;
end;

function TForeBas.GetFromDate: TDateTime;
begin
  Result:= FOwner.FromDate
end;

function TForeBas.GetFullItemInfo: Boolean;
begin
  Result:= FOwner.FullItemInfo;
end;

function TForeBas.GetToDate: TDateTime;
begin
  Result:= FOwner.ToDate
end;

function TForeBas.GetArcusto_ID: Real;
begin
  Result:= FOwner.Arcusto_ID;
end;

function TForeBas.GetExcludeNonSalable: Boolean;
begin
  Result:= FOwner.ExcludeNonSalable;
end;

function TForeBas.GetIsQty: Boolean;
begin
  Result:= FOwner.Qty_Amt = 0;  {Qty}
end;

procedure TForeBas.BuildSQL;
var
  AParam1: TFDParam;
begin
  wwQuery.Close;

  if not IsGraph then with wwGrid.Selected do
  begin
    Clear;
    if FullItemInfo then
       Add('CLASS'#9'2'#9'Class'               );
    Add('ITEMNO'#9'20'#9'Item #'               );
    if FullItemInfo then
       Add('DESCRIP'#9'25'#9'Description'      );
    if FullItemInfo then
       Add('DESCRIP2'#9'25'#9'Ext Description' );
    if FullItemInfo then
       Add('REV'#9'5'#9'Rev'                   );
    if FullItemInfo then
       Add('UNIT'#9'10'#9'Unit'                );
    Add('EPLANT_ID'#9'9'#9'EPlant ID'          );
    Add('MFGNO'#9'25'#9'Mfg#'                  );
    Add('CODE'#9'10'#9'Group'                  );
  end;

  with wwQuery.SQL do
  begin
    Clear;
    Add('select');

    if not FIsExecutive then
    begin
      Add(       '       a.id,              ');
      Add(       '       a.id as arinvt_id, ');
      Add(       '       a.class,           ');
      Add(       '       a.itemno,          ');
      Add(       '       a.descrip,         ');
      Add(       '       a.descrip2,        ');
      Add(       '       a.rev,             ');
      Add(       '       a.unit,            ');
      Add(       '       g.code,            ');
      Add(       '       a.eplant_id,       ');
      Add(       '       nvl(v.fore_item_standard_id, a.standard_id) as standard_id,     ');
      Add(       '       substr(forecast.lookup_mfgno( a.id, v.fore_item_standard_id),1,25) as mfgno, ');
      Add(       '       v.has_level,       ');
    end;


    AddSelectSum;

    AddSelectFrom;

    AddWhere;

    if not FIsExecutive then
    begin
      Add(       ' group by a.id,                 ');
      Add(       '          a.class,              ');
      Add(       '          a.itemno,             ');
      Add(       '          a.descrip,            ');
      Add(       '          a.descrip2,           ');
      Add(       '          a.rev,                ');
      Add(       '          a.unit,               ');
      Add(       '          g.code,               ');
      Add(       '          a.eplant_id,          ');
      Add(       '          nvl(v.fore_item_standard_id, a.standard_id),           ');
      Add(       '          substr(forecast.lookup_mfgno( a.id, v.fore_item_standard_id),1,25), ');
      Add(       '          v.has_level           ');
    end;

    // order by
    if not FIsExecutive then
    begin
       Add('-- do not remove these lines' );
       Add('-- HPICK_PROPAGATE_SORT_START');
       Add(' order by a.itemno           ');
       Add('-- HPICK_PROPAGATE_SORT_END'  );
    end;
  end;

  wwGrid.ApplySelected;

//  wwQuery.ControlType.Clear;
//  wwQuery.ControlType.Add('MFGNO;CustomEdit;wwDBComboDlgMfgNo;F');
end;


procedure TForeBas.AddWhere;
begin
  with wwQuery.SQL do
  begin
    {Filter by Arcusto_ID? Note- the only diff in SQL is outer or inner join}
    if Arcusto_ID = 0 then
       Add(' where a.id = v.arinvt_id(+)')
    else
       Add(' where a.id = v.arinvt_id   ');

    {Only Mfg items}
    Add(   '   and (a.standard_id is not NULL or NVL(a.fr_include, ''N'') = ''Y'')');

    if not IsExecutive then
       Add('   and a.fr_group_id = g.id(+)');

    {pk_hide}
    Add('   and NVL(a.pk_hide, ''N'') <> ''Y'' ');

    {non for sale}
    if ExcludeNonSalable then
       Add('   and NVL(a.non_salable, ''N'') <> ''Y'' ');

    {in case of a graph the dataset is looking up the grid's query arinvt_id}
    if Assigned( wwQuery.DataSource ) and IsGraph then
       begin
         Add(     ' and a.id = :arinvt_id');
         Add(     ' and (:any_group = 1 or g.id = :group_id)' );
       end
    else if IsExecutive then
       begin
         Add(     ' and (a.id = :arinvt_id or :all_items = 1)' );
         Add(     ' and Misc.EPlant_Filter_Param ( :eplant_id, 0, a.eplant_id ) = 1' );
       end
    else
       begin
         Add(     ' and (:any_group = 1 or g.id = :group_id)' );
         Add(     ' and Misc.EPlant_Filter_Param( :eplant_id, 0, a.eplant_id ) = 1' );
       end;
  end;
end;

procedure TForeBas.AddSelectSum;
var
  ADate : TDateTime;
  MM_YY : string;
  MM, YY: string;
  MM_English: string;
  MM_YY_NorthAmerica: string;
begin
  ADate:= FromDate;
  while ADate <= ToDate do
  begin
     MM_YY:= FormatDateTime( 'mmm-yyyy', ADate );

     {English}
     MM:= FormatDateTime( 'mmm', ADate );
     YY:= FormatDateTime( 'yyyy', ADate );
     MM_YY_NorthAmerica:= IQEnglishMonth( IQMonthStrToMonth( MM )) + '-' + YY;  {IQMS.Common.NLS. Pass month 3 letters - get back english representation}

     { sum( decode( v.mm_yy, 'APR-1997', v.qty, NULL )) as "Apr-1997", }
     wwQuery.SQL.Add( Format( 'sum( decode( v.mm_yy, ''%s'', %s, NULL )) as "%s" ', [ UpperCase( MM_YY_NorthAmerica ), {'APR-1997'}
                                                                                      ColExpr,                         {v.qty     }
                                                                                      MM_YY ] ));                      {Apr-1997  }

     if Assigned(wwGrid) and not IsGraph then
        wwGrid.Selected.Add(Format('%s'#9'10'#9'%s', [ MM_YY, MM_YY ]));

     ADate:= IncMonth( ADate, 1 );
     if ADate <= ToDate then with wwQuery do
        SQL[ SQL.Count - 1 ]:= SQL[ SQL.Count - 1 ] + ', ';
  end;

  // Row Total
  if Assigned(wwGrid) and not IsGraph and (GetSwitch('FR_SHOW_TOTAL', 'params') = 'Y') then
  begin
     wwQuery.SQL.Add( Format( ', SUM( case                                             '+
                              '         when v.mm_yy is null                           '+
                              '              then 0                                    '+
                              '         when v.mm_yy=''-''                             '+
                              '              then 0                                    '+
                              '         when to_date(''01-''||v.mm_yy, ''dd-mm-yyyy'') '+
                              '              between to_date(''%s'', ''mm/dd/yyyy'')   '+
                              '                  and to_date(''%s'', ''mm/dd/yyyy'')   '+
                              '              then %s                                   '+
                              '       end ) as grand_total                             ',
                              [ FormatDateTime( 'mm/dd/yyyy', FromDate ),
                                FormatDateTime( 'mm/dd/yyyy', ToDate ),
                                ColExpr ]));
     wwGrid.Selected.Add(Format('%s'#9'15'#9'%s', [ 'GRAND_TOTAL', 'Grand Total' ]));
  end;
end;

function TForeBas.ColExpr: string;
begin
  if IsQty then Result:= 'v.qty' else Result:= 'v.qty * v.price'
end;

procedure TForeBas.Open;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait(Format('Accessing %s...', [ wwQuery.Name ]));
  try
     wwQuery.Open;
  finally
     hMsg.Free;
  end;
end;

{ TForeOnOrder }

procedure TForeOnOrder.AddSelectFrom;
begin
  with wwQuery.SQL do
  begin
     Add(' from ( select                                                             ' );
     Add('               decode( IQCalendar.MonthOf( promise_date_forecast_use ),    ' );
     Add('                       01, ''JAN'',                                    ' );
     Add('                       02, ''FEB'',                                    ' );
     Add('                       03, ''MAR'',                                    ' );
     Add('                       04, ''APR'',                                    ' );
     Add('                       05, ''MAY'',                                    ' );
     Add('                       06, ''JUN'',                                    ' );
     Add('                       07, ''JUL'',                                    ' );
     Add('                       08, ''AUG'',                                    ' );
     Add('                       09, ''SEP'',                                    ' );
     Add('                       10, ''OCT'',                                    ' );
     Add('                       11, ''NOV'',                                    ' );
     Add('                       12, ''DEC'',                                    ' );
     Add('                       NULL ) || ''-'' || to_char( IQCalendar.YearOf( promise_date_forecast_use ) ) as MM_YY, ' );
     Add('               unit_price_native as price,                                 ' );
     Add('               ship_quan_native as qty,                                    ' );
     Add('               arinvt_id,                                                  ' );
     Add('               to_number(null) as has_level,                               ' );   // only applicable to forecast
     Add('               to_number(null) as fore_item_standard_id                    ' );   // only applicable to forecast
     Add('          from v_releases_qk_ex                                            ' );
     Add('         where arcusto_id = :aarcusto_id or :all_customers = 1 ) v,        ' );
     Add('      arinvt a                                                             ' );
     if not IsExecutive then
        Add('     , fr_group g                                                       ' );
  end;
end;


{ TForeShipped }

procedure TForeShipped.AddSelectFrom;
begin
  with wwQuery.SQL do
  begin
    Add(       ' from ( select                                                             ');
    Add(       '               decode( s.month,                                            ');
    Add(       '                       01, ''JAN'',                                        ');
    Add(       '                       02, ''FEB'',                                        ');
    Add(       '                       03, ''MAR'',                                        ');
    Add(       '                       04, ''APR'',                                        ');
    Add(       '                       05, ''MAY'',                                        ');
    Add(       '                       06, ''JUN'',                                        ');
    Add(       '                       07, ''JUL'',                                        ');
    Add(       '                       08, ''AUG'',                                        ');
    Add(       '                       09, ''SEP'',                                        ');
    Add(       '                       10, ''OCT'',                                        ');
    Add(       '                       11, ''NOV'',                                        ');
    Add(       '                       12, ''DEC'',                                        ');
    Add(       '                       NULL ) || ''-'' || to_char( s.year ) as MM_YY,      ');

    Add(       '               s.unit_price / IQMisc.No_Zero( NVL(s.uom_factor,1)) as price,   ');
    Add(       '               s.qtyshipped * IQMisc.No_Zero( NVL(s.uom_factor,1)) as qty,     ');
    Add(       '               s.arinvt_id,                                                    ');
    Add(       '               to_number(null) as has_level,                                   ');   // only applicable to forecast
    Add(       '               to_number(null) as fore_item_standard_id                        ');   // only applicable to forecast
    Add(       '           from                                                                ');
    Add(       '                ( select shipdate, year, month, unit_price, qtyshipped, arinvt_id, ');
    Add(       '                         arcusto_id,  shipment_type, ord_detail_id, uom_factor ');
    Add(       '                    from c_ship_hist                                           ');
    Add(Format('                   where shipdate between to_date(''%s'', ''mm/dd/yyyy'')      ', [ FormatDateTime('mm/dd/yyyy', FromDate) ]));
    Add(Format('                                      and to_date(''%s'', ''mm/dd/yyyy'')) s,  ', [ FormatDateTime('mm/dd/yyyy', ToDate)   ]));
    Add(       '                arcusto a,                                                     ');
    Add(       '                ord_detail d                                                   ');

    Add(       '          where (s.arcusto_id = :aarcusto_id or :all_customers = 1)            ');
    Add(       '            and s.arcusto_id = a.id(+)                                         ');
    Add(       '            and nvl(a.is_intercomp, ''N'') <> ''Y''                            ');
    Add(       '            and nvl(rtrim(s.shipment_type), ''*'') <> ''CUM SHIP ADJUSTMENT''  ');

    Add(       '            and s.ord_detail_id = d.id(+)                                      ');
    Add(       '            and d.ship_to_id_from is null                                      ');
    Add(       '            and d.in_transit_partno_id is null ) v,                            ');

    Add(       '       arinvt a                                                                ');
    if not IsExecutive then
       Add(    '     , fr_group g                                                              ');
  end;
end;


{ TForeCurrent }

procedure TForeCurrent.AddSelectFrom;
begin
  with wwQuery.SQL do
    if Arcusto_ID = 0 then
       begin
          Add(   '  from v_fore_item v,  ');
          Add(   '       arinvt a        ');
          if not IsExecutive then
             Add('     , fr_group g      ');
       end
    else
       begin
          Add(   ' from ( select mm_yy,                         ');
          Add(   '               qty,                           ');
          Add(   '               ext_price,                     ');
          Add(   '               arinvt_id,                     ');
          Add(   '               kind,                          ');
          Add(   '               has_level,                     ');
          Add(   '               fore_item_standard_id,         ');
          Add(   '               fore_head_id                   ');
          Add(   '           from v_fore_cust                   ');
          Add(   '          where arcusto_id = :aarcusto_id ) v,');
          Add(   '       arinvt a                               ');
          if not IsExecutive then
             Add('      , fr_group g                            ');
       end
end;


procedure TForeCurrent.AddWhere;
begin
  inherited;

  {fore_head_id}
  wwQuery.SQL.Add('   and ( v.fore_head_id(+) = :fore_head_id ) ');
end;

function TForeCurrent.ColExpr: string;
begin
  if IsQty then Result:= 'v.qty' else Result:= 'v.ext_price'
end;

end.


