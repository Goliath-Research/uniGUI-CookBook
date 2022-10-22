unit oe_uom_conversion;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmOeUomConversion = class(TUniForm)
    DataSource1: TDataSource;
    Query1: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDataset: TDataSet;
    FArinvt_ID: Real;
    FOrd_Detail_ID: Real;
    FOrdDetail: TDataSet;
    procedure InitOpenQuery;
    procedure SetOrdDetail(const Value: TDataSet);
  public
    { Public declarations }
    property OrdDetail: TDataSet write SetOrdDetail;
    class procedure DoShow(AOrdDetail: TDataSet );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmOeUomConversion }

class procedure TFrmOeUomConversion.DoShow(AOrdDetail: TDataSet);
var
  LFrmOeUomConversion : TFrmOeUomConversion;
begin
  LFrmOeUomConversion := TFrmOeUomConversion.Create(UniGUIApplication.UniApplication);
  LFrmOeUomConversion.OrdDetail := AOrdDetail;
  LFrmOeUomConversion.Show;
end;

procedure TFrmOeUomConversion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;


procedure TFrmOeUomConversion.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
{ TODO -oGPatil -cWebConvert : Access Violation Error
    ParamByName('blanket_qty').asFloat   := FDataSet.FieldByName('total_qty_ord').asFloat * FDataSet.FieldByName('uom_factor').asFloat;
    ParamByName('total_releases').asFloat:= FDataSet.FieldByName('Tot_Releases').asFloat * FDataSet.FieldByName('uom_factor').asFloat;
    ParamByName('qty_shipped').asFloat   := FDataSet.FieldByName('cumm_shipped').asFloat * FDataSet.FieldByName('uom_factor').asFloat;
    ParamByName('backlog_qty').asFloat   := FDataSet.FieldByName('BackLog').asFloat * FDataSet.FieldByName('uom_factor').asFloat;
    ParamByName('ord_detail_id').asFloat := FOrd_Detail_ID;   }
  end;
end;


procedure TFrmOeUomConversion.SetOrdDetail(const Value: TDataSet);
begin
  FDataset := Value;
  FArinvt_ID:= FDataset.FieldByName('arinvt_id').asFloat;
  FOrd_Detail_ID:= FDataset.FieldByName('id').asFloat;
end;

procedure TFrmOeUomConversion.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmOeUomConversion.UniFormShow(Sender: TObject);
begin
  InitOpenQuery;
end;

procedure TFrmOeUomConversion.InitOpenQuery;
var
  ADefaultUOM: string;
  ASQL : TStrings;
  AQryUom: TFDQuery;

  procedure _add_uom_qty( AUom: string; AQryUom: TFDQuery );
  var
    AText: string;
    ACaption : string;
    AAttribute: string;

    function _add( AAtribute, S: string): string;
    begin
      if AAttribute = '' then
         Result:= S
      else
         Result:= Format('%s, %s', [ AAtribute, S ]);
    end;

  begin
    AText:= Format(',  round(uom.iqconvert( a.unit, ''%s'', x.qty, a.id, ''Y''), 6) as "%s"',
                   [ AUOM, AUOM ]);
    ASQL.Add( AText );

    ACaption:= AUom;

    AAttribute:= '';
    if CompareText(AUom,ADefaultUOM) = 0 then
       AAttribute:= _add( AAttribute, 'Native');

    if Assigned( AQryUom ) then
    begin
      if AQryUom.FieldByName('default_oe').asString = 'Y' then
         AAttribute:=_add( AAttribute, 'Default OE');

      if AQryUom.FieldByName('default_po').asString = 'Y' then
         AAttribute:= _add( AAttribute, 'Default PO');
    end;

    if AAttribute <> '' then
       ACaption:= Format('%s~[%s]', [ ACaption, AAttribute ]);
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain Selected
    with wwDBGrid1.Selected do
      Add( Format('%s'#9'25'#9'%s', [ AUom, ACaption ]));   }
  end;

begin
  ADefaultUOM:= Trim(SelectValueByID('unit', 'arinvt', FArinvt_ID));

  Query1.Close;
  ASQL:= Query1.SQL;

  // static data
  ASQL.Clear;
  ASQL.Add('select d.arinvt_id, ');
  ASQL.Add('       x.caption,   ');
  ASQL.Add('       x.qty        ');

{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain Selected
  with wwDBGrid1.Selected do
  begin
    Clear;
    Add('CAPTION'#9'25'#9'Qty');
  end;  }

  _add_uom_qty( ADefaultUOM, nil );

  // user defined UOM
  AQryUom:= TFDQuery.Create(nil);
  with AQryUom do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select rtrim(uom) as uom,'+
                   '       default_oe,       '+
                   '       default_po        '+
                   '  from arinvt_uom_conv   '+
                   ' where arinvt_id = %.0f  '+
                   ' order by uom            ',
                   [ FArinvt_ID ]));
    Open;
    while not Eof do
    begin
      _add_uom_qty( FieldByName('uom').asString, AQryUom );
      Next;
    end;
  finally
    Free;
  end;

  { TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain ApplySelected
  wwDBGrid1.ApplySelected;    }

  ASQL.Add(' from ord_detail d,                        ');
  ASQL.Add('      arinvt a,                            ');
  ASQL.Add('      ( select :blanket_qty as qty,        ');
  ASQL.Add('               ''Blanket Qty'' as caption, ');
  ASQL.Add('               1 as seq                    ');
  ASQL.Add('          from dual                        ');
  ASQL.Add('                                           ');
  ASQL.Add('        union all                          ');
  ASQL.Add('        select :total_releases,            ');
  ASQL.Add('               ''Total Releases'',         ');
  ASQL.Add('               2                           ');
  ASQL.Add('          from dual                        ');
  ASQL.Add('                                           ');
  ASQL.Add('        union all                          ');
  ASQL.Add('        select :qty_shipped,               ');
  ASQL.Add('               ''Qty Shipped'',            ');
  ASQL.Add('               3                           ');
  ASQL.Add('          from dual                        ');
  ASQL.Add('                                           ');
  ASQL.Add('        union all                          ');
  ASQL.Add('        select :backlog_qty,               ');
  ASQL.Add('               ''Backlog Qty'',            ');
  ASQL.Add('               4                           ');
  ASQL.Add('          from dual ) x                    ');
  ASQL.Add(' where d.id = :ord_detail_id               ');
  ASQL.Add('   and d.arinvt_id = a.id(+)               ');
  ASQL.Add('order by x.seq                             ');

  Reopen( Query1 );
end;


end.
