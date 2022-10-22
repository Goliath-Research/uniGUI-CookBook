unit InvRolup;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
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
  uniBasicGrid,
  uniDBGrid,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmCostElem_Rollup = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    StatusBar1: TUniStatusBar;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ARINVT_ID: TBCDField;
    Query1ELEM_DESCRIP: TStringField;
    Query1ARINVT_STD_COST: TFMTBCDField;
    Query1ROLLUP_STD_COST: TFMTBCDField;
    Query1ELEM_TYPE: TStringField;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetArinvt_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
  end;

procedure DoShowCostElem_Rollup( AArinvt_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoShowCostElem_Rollup( AArinvt_ID: Real );
var
  LFrmCostElem_Rollup : TFrmCostElem_Rollup;
begin
  LFrmCostElem_Rollup := TFrmCostElem_Rollup.Create(UniGUIApplication.UniApplication);
  LFrmCostElem_Rollup.ShowModal;
end;

procedure TFrmCostElem_Rollup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;


procedure TFrmCostElem_Rollup.SetArinvt_ID(const Value: Real);
begin
 with Query1 do
  begin
    Close;
    Query1.ParamByName('arinvt_id').Value := Value;
    Open;
  end;
{ TODO -oGPatil -cWebConvert : TUniStatusBar does not contain SimpleText
  StatusBar1.SimpleText:= SelectValueFmtAsString( 'select ''Item # '' || RTrim(itemno) || '', Description: '' || RTrim(descrip) from arinvt where id = %f', [ Value ]);
  }
end;

procedure TFrmCostElem_Rollup.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

procedure TFrmCostElem_Rollup.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmCosting6{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
