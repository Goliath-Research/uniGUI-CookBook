unit inv_loc_qty_by_uom;

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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmInvLocQtyByUOM = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    QryFGMulti: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFGMultiBeforeOpen(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure InitOpenQuery;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal( AArinvt_ID: Real );
    property Arinvt_ID: Real write SetArinvt_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;


{ TFrmInvLocQtyByUOM }
class procedure TFrmInvLocQtyByUOM.DoShowModal(AArinvt_ID: Real);
var
  LFrmInvLocQtyByUOM : TFrmInvLocQtyByUOM;
begin
  LFrmInvLocQtyByUOM:= TFrmInvLocQtyByUOM.Create(uniGUIApplication.UniApplication);
  LFrmInvLocQtyByUOM.Arinvt_ID := AArinvt_ID;
  LFrmInvLocQtyByUOM.ShowModal;
end;


procedure TFrmInvLocQtyByUOM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmInvLocQtyByUOM.QryFGMultiBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('arinvt_id').Value := FArinvt_ID;
  end;
end;

procedure TFrmInvLocQtyByUOM.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvLocQtyByUOM.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  InitOpenQuery;
end;

procedure TFrmInvLocQtyByUOM.InitOpenQuery;
var
  ADefaultUOM: string;
  ASQL : TStrings;

  procedure _add_uom_qty( AUom: string );
  var
    AText: string;
    ACaption : string;
  begin
    AText:= Format(',  round(uom.iqconvert( a.unit, ''%s'', f.onhand, a.id, ''Y''), 6) as "%s"',
                   [ AUOM, AUOM ]);
    ASQL.Add( AText );

    ACaption:= AUom;
    if CompareText(AUom,ADefaultUOM) = 0 then
       ACaption:= Format('%s~(Native)', [ACaption]);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'Selected'
    with wwDBGrid1.Selected do
      Add( Format('%s'#9'18'#9'%s', [ AUom, ACaption ]));            }
  end;

begin
  ADefaultUOM:= Trim(SelectValueByID('unit', 'arinvt', FArinvt_ID));

  QryFGMulti.Close;
  ASQL:= QryFGMulti.SQL;

  // static data
  ASQL.Clear;
  ASQL.Add('select');
  ASQL.Add('       f.id,        ');
  ASQL.Add('       l.loc_desc,  ');
  ASQL.Add('       f.lotno      ');
  { TODO -oathite -cWebConvert : Undeclared identifier: 'Selected'
  with wwDBGrid1.Selected do
  begin
    Clear;
    Add('LOC_DESC'#9'35'#9'Location');
    Add('LOTNO'#9'15'#9'Lot #');
  end; }

  _add_uom_qty( ADefaultUOM );

  // user defined UOM
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
//    DataBaseName:= 'IQ';
    SQL.Add(Format('select rtrim(uom) as uom '+
                   '  from arinvt_uom_conv   '+
                   ' where arinvt_id = %.0f  '+
                   ' order by uom            ',
                   [ FArinvt_ID ]));
    Open;
    while not Eof do
    begin
      _add_uom_qty( FieldByName('uom').asString );
      Next;
    end;
  finally
    Free;
  end;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'ApplySelected'
  wwDBGrid1.ApplySelected;  }

  ASQL.Add('  from arinvt a,          ');
  ASQL.Add('       fgmulti f,         ');
  ASQL.Add('       locations l        ');
  ASQL.Add(' where a.id = :arinvt_id  ');
  ASQL.Add('   and a.id = f.arinvt_id ');
  ASQL.Add('   and f.loc_id = l.id    ');
  ASQL.Add(' order by                 ');
  ASQL.Add('       f.in_date,         ');
  ASQL.Add('       f.id               ');

  Reopen( QryFgMulti );
end;


end.
