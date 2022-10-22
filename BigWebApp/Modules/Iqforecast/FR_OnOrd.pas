unit FR_OnOrd;

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
  Grids,
  DBGrids,
  Db,
  DBCtrls,
  ExtCtrls,
  IQMS.WebVcl.Jump,
  Menus,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu;

type
  TFrmFrShowOnOrder = class(TUniForm)
    DataSource1: TDataSource;
    Query1: TFDQuery;
    DBGrid1: TUniDBGrid;
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    PopupMenu1: TUniPopupMenu;
    JumptoOrder1: TUniMenuItem;
    IQJump1: TIQWebJump;
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoOrder1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID : Real;
    FARCusto_ID: Real;
    FDate1, FDate2: TDateTime;
    Frgs: Variant;
    procedure AssignParamsOpenQuery( Args: Variant );
    procedure Setrgs(const Value: Variant);
  public
    { Public declarations }
    property rgs: Variant write Setrgs;
  end;

procedure DoForecastShowOnOrder( Args: Variant );



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Cursor,
  ForeEdit;

procedure DoForecastShowOnOrder( Args: Variant );
var
  FrmFrShowOnOrder: TFrmFrShowOnOrder;
begin
  FrmFrShowOnOrder := TFrmFrShowOnOrder.Create(uniGUIApplication.uniApplication);
  FrmFrShowOnOrder.rgs := Args;
  FrmFrShowOnOrder.ShowModal;
end;

procedure TFrmFrShowOnOrder.UniFormShow(Sender: TObject);
begin
  AssignParamsOpenQuery( Frgs );
  IQRegFormRead( self, [ self, DBGrid1 ]);
  DBGrid1.Cursor:= crJump;
end;

procedure TFrmFrShowOnOrder.AssignParamsOpenQuery( Args: Variant );
var
  AMM_YY: string;
  ACust : string;
  AItem : string;

  MM: Integer;
  YY: Integer;
begin
  AMM_YY     := Args[ 0 ];  {Aug-2000}
  FArinvt_ID := Args[ 1 ];
  FARcusto_ID:= Args[ 2 ];

  AItem:= 'N/A';
  if FArinvt_ID > 0 then
     AItem:= SelectValueByID( 'itemno', 'arinvt', FArinvt_ID );

  ACust:= 'ALL';
  if FARcusto_ID > 0 then
     ACust:= SelectValueByID( 'company', 'arcusto', FARcusto_ID );

  {decode dates}
  // FDate1:= StrToDate( Format('%d/01/%s', [ MM, YY ]));
  // MM    := ShortMonthToInt( Copy( AMM_YY, 1, 3 ));
  // YY    := StrToInt( Copy( AMM_YY, 5, 4 ));
  // FDate1:= EncodeDate( YY, MM, 1);

  TFrmEditForecast.InitDateTime( AMM_YY, FDate1, FDate2 ); {ForeEdit.pas}

  self.Caption:= Format('Date: %s, Customer: %s, Item: %s', [ AMM_YY, ACust, AItem ]);

  with Query1 do
  begin
    Close;
//    ParamByName('arinvt_id').asFloat := FArinvt_ID;
//    ParamByName('arcusto_id').asFloat:= FARcusto_ID;
//    ParamByName('date1').asDateTime  := FDate1;
//    ParamByName('date2').asDateTime  := FDate2;
    AssignQueryParamValue(Query1, 'arinvt_id' , FArinvt_ID);
    AssignQueryParamValue(Query1, 'arcusto_id', FARcusto_ID);
    AssignQueryParamValue(Query1, 'date1'     , FDate1);
    AssignQueryParamValue(Query1, 'date2'     , FDate2);
    Open;
  end;
end;

procedure TFrmFrShowOnOrder.AssignEPlantFilter(DataSet: TDataSet);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit, dependent on TSecurityManager}
  //IQAssignEPlantFilter(DataSet);
end;

procedure TFrmFrShowOnOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFrmFrShowOnOrder.JumptoOrder1Click(Sender: TObject);
begin
  IQJump1.Execute;
end;


procedure TFrmFrShowOnOrder.Setrgs(const Value: Variant);
begin
  Frgs := Value;
end;

end.
