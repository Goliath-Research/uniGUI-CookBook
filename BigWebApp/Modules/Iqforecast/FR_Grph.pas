unit FR_Grph;

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
  DBCtrls,
  ExtCtrls,
  StdCtrls,
  Mask,
  Db,
  Wwdatsrc,
  ForeData,
  ComCtrls,
  CheckLst,
  Buttons,
  VclTee.TeeGDIPlus,
  VCLTee.TeeEdit,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniEdit,
  UniChart,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmForeGraphBase = class(TUniForm)
    wwQryOnOrder: TFDQuery;
    wwQryShipped: TFDQuery;
    wwSrcForecast: TDataSource;
    wwQryForecast: TFDQuery;
    PnlCarrier: TUniPanel;
    Chart1: TUniChart;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    sbtnUp: TUniSpeedButton;
    sbtnDwn: TUniSpeedButton;
    sbtnCheckAllMonths: TUniSpeedButton;
    sbtnUnCheckAllMonths: TUniSpeedButton;
    ed3D: TUniEdit;
    //UpDown1: TUpDown;
    lboxLegend: TUniListBox;
    Panel1: TUniPanel;
    splitForeGraph1: TUniSplitter;
    pnlToolBtns: TUniPanel;
    sbtnPrint: TUniSpeedButton;
    sbtnSaveToFile: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    SaveDialog1: TSaveDialog;
    ChartPreviewer1: TChartPreviewer;
    procedure wwQryForecastAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed3DChange(Sender: TObject);
    procedure lboxLegendDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure sbtnUpClick(Sender: TObject);
    procedure chkbMonthsClickCheck(Sender: TObject);
    procedure sbtnUnCheckAllMonthsClick(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure sbtnSaveToFileClick(Sender: TObject);
    procedure sbtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    FMonthsList: TStringList;
    procedure SetDataSource(const Value: TDataSource);
    procedure SetMonthsList(const Value: TStringList);
  protected
    FIsExecutive: Boolean;
    procedure AfterCreate;
    procedure ConstructQueries;
    procedure ConstructQuery( AQuery: TFDQuery; AForeDataObject: TForeBasClass; ADataSource: TDataSource );
    procedure BuildGraph( DataSet: TDataSet; ASeries: TLineSeries );
    procedure LoadMonthsList( DataSet: TDataSet ); overload;
    procedure LoadMonthsList( AMonthsList: TStringList ); overload;
    function SeriesByTitle( S: string ): TLineSeries;
    procedure AllMonthsChecked( Value: Boolean );
    procedure CheckMonthsFrom( S: string );
    procedure LoadSettingsFromRegistry;
  public
    { Public declarations }
    {constructor Create( AOwner: TComponent; ADataSource: TDataSource ); overload;
    constructor Create( AOwner: TComponent; AMonthsList: TStringList ); overload;}
    procedure ProcessList();
    procedure ProcessSource();
    property DataSource: TDataSource write SetDataSource;
    property MonthsList: TStringList write SetMonthsList;
  end;

procedure DoShowList(AMonthsList: TStringList);
procedure DoShowSource(ADataSource: TDataSource);

implementation

{$R *.DFM}

uses
  ForeBase,
  IQMS.Common.RegFrm,
  IQMS.Common.Tee,
  IQMS.Common.Numbers,
  IQMS.Common.Dialogs;


{constructor TFrmForeGraphBase.Create( AOwner: TComponent; ADataSource: TDataSource );
begin
  inherited Create( AOwner );
  FDataSource:= ADataSource;
  LoadMonthsList( ADataSource.DataSet );
  AfterCreate;
end;

constructor TFrmForeGraphBase.Create( AOwner: TComponent; AMonthsList: TStringList );
var
  FrmForeGraphBase: TFrmForeGraphBase;
begin
  inherited Create( AOwner );
  LoadMonthsList( AMonthsList );
  AfterCreate;
end;}

procedure DoShowList(AMonthsList: TStringList);
var
  FrmForeGraphBase: TFrmForeGraphBase;
begin
  FrmForeGraphBase := TFrmForeGraphBase.create(uniGUIApplication.UniApplication);
  FrmForeGraphBase.MonthsList:= AMonthsList;
  FrmForeGraphBase.ProcessList;
end;

procedure DoShowSource(ADataSource: TDataSource);
var
  FrmForeGraphBase: TFrmForeGraphBase;
begin
  FrmForeGraphBase := TFrmForeGraphBase.create(uniGUIApplication.UniApplication);
  FrmForeGraphBase.DataSource:= ADataSource;
  FrmForeGraphBase.ProcessSource;
end;

procedure TFrmForeGraphBase.ProcessList;
begin
  LoadMonthsList( FMonthsList );
  AfterCreate;
end;

procedure TFrmForeGraphBase.ProcessSource;
begin
  LoadMonthsList( FDataSource.DataSet );
  AfterCreate;
end;

procedure TFrmForeGraphBase.AfterCreate;
begin
  LoadSettingsFromRegistry;
  ConstructQueries;
end;

procedure TFrmForeGraphBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  S: string;
  I: Integer;
begin
  IQRegFormWrite(self, [ self ]);

  {3D Effect}
  { TODO -oSanketG -cWebConvert : Need to revisit :TUpDown}
  //IQRegIntegerScalarWrite( self, '3D-Effect', UpDown1.Position );

  {Checked months}
  S:= '';
  { TODO -oSanketG -cWebConvert : Need to revisit , TCheckListBox component}
  {with chkbMonths do
    for I:= 0 to Items.Count - 1 do
      if Checked[ I ] then
         S:= Format('%s_%s_', [ S, Items[ I ]]);
  IQRegStringScalarWrite( self, 'CheckedMonths', S );}
end;

procedure TFrmForeGraphBase.LoadSettingsFromRegistry;
var
  S: string;
  I: Integer;
begin
  IQRegFormRead(self, [ self ]);

  {3D effect}
  { TODO -oSanketG -cWebConvert : Need to revisit :TUpDown}
  //UpDown1.Position:= 10;
  if IQRegIntegerScalarRead( self, '3D-Effect', I ) and (I > 0) then
     { TODO -oSanketG -cWebConvert : Need to revisit :TUpDown}
     //UpDown1.Position:= I;

  {Checked months}
  if IQRegStringScalarRead( self, 'CheckedMonths', S ) and (S > '') then
     CheckMonthsFrom( S )
end;

procedure TFrmForeGraphBase.ConstructQueries;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] FR_Grph.pas(235): E2003 Undeclared identifier: 'LeftAxis'}
  //Chart1.LeftAxis.Title.Caption:= IIf( TFrmForecast(Owner).Qty_Amt = 0, 'Qty', '$ Amount' );

  ConstructQuery( wwQryForecast, TForeBasClass( TForeCurrent ), FDataSource );
  ConstructQuery( wwQryOnOrder,  TForeBasClass( TForeOnOrder ), FDataSource );
  ConstructQuery( wwQryShipped,  TForeBasClass( TForeShipped ), FDataSource );
end;

procedure TFrmForeGraphBase.ConstructQuery( AQuery: TFDQuery; AForeDataObject: TForeBasClass; ADataSource: TDataSource );
begin
  {When creating form - assign external datasource to be master source}
  with AQuery do
  begin
    Close;
    DataSource:= ADataSource;
    BeforeOpen:= (self.Owner as TFrmForecast).AssignParamsQuery;
  end;

  {Build SQL and open it}
  with AForeDataObject.Create( self.Owner as TFrmForecast, AQuery ) do
  try
    IsGraph:= TRUE;
    IsExecutive:= self.FIsExecutive;
    BuildSQL;
    Open;
  finally
    //Free;
  end;
end;

procedure TFrmForeGraphBase.wwQryForecastAfterScroll(DataSet: TDataSet);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] FR_Grph.pas(269): E2003 Undeclared identifier: 'Series1',
  [dcc32 Error] FR_Grph.pas(271): E2003 Undeclared identifier: 'Series2',
  [dcc32 Error] FR_Grph.pas(273): E2003 Undeclared identifier: 'Series3'}
  {if DataSet = wwQryForecast then
     BuildGraph( DataSet, Series1 )
  else if DataSet = wwQryOnOrder then
     BuildGraph( DataSet, Series2 )
  else
     BuildGraph( DataSet, Series3 );}
end;

procedure TFrmForeGraphBase.BuildGraph( DataSet: TDataSet; ASeries: TLineSeries );
var
  I, J: Integer;
begin
  ASeries.Clear;
  for I:= 0 to DataSet.FieldCount - 1 do
    if Pos('-', DataSet.Fields[ I ].FieldName) > 0 then
       with DataSet.Fields[ I ] do
       begin
         { TODO -oSanketG -cWebConvert : Need to revisit ,
         [dcc32 Error] FR_Grph.pas(285): E2003 Undeclared identifier: 'chkbMonths'}
         {J:= chkbMonths.Items.IndexOf( FieldName );
         if chkbMonths.Checked[ J ] then
            ASeries.AddY( AsFloat, DisplayLabel, clTeeColor );}
       end;
end;

procedure TFrmForeGraphBase.ed3DChange(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] FR_Grph.pas(291): E2003 Undeclared identifier: 'Chart3DPercent'}
  //Chart1.Chart3DPercent:= StrToIntDef(ed3D.Text, 1);
end;

procedure TFrmForeGraphBase.lboxLegendDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  DrawListBoxChartLegend( Control, Index, Rect, State );
end;

procedure TFrmForeGraphBase.Chart1AfterDraw(Sender: TObject);
var
  S: string;
begin
  with lboxLegend do
  begin
    if ItemIndex > -1 then
      S:= Items[ ItemIndex ]
   else
      S:= '';

    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] FR_Grph.pas(315): E2010 Incompatible types: 'TListBox' and 'TUniListBox'}
    //AssignListBoxChartLegend( lboxLegend, Chart1 );

    ItemIndex:= 0;
    if S > '' then
      ItemIndex:= Items.IndexOf( S );
  end;
end;

procedure TFrmForeGraphBase.sbtnUpClick(Sender: TObject);
begin
  if lboxLegend.ItemIndex = -1 then
     EXIT;

  if (Sender = sbtnDwn) and (lboxLegend.ItemIndex = lboxLegend.Items.Count - 1) then
     EXIT;

  if (Sender = sbtnUp) and (lboxLegend.ItemIndex = 0) then
     EXIT;

  with Chart1 do
    if Sender = sbtnDwn then
       { TODO -oSanketG -cWebConvert : Need to revisit ,
       [dcc32 Error] FR_Grph.pas(336): E2003 Undeclared identifier: 'SeriesDown'}
       //SeriesDown( Series[ lboxLegend.ItemIndex ])
    else
       { TODO -oSanketG -cWebConvert : Need to revisit ,
       [dcc32 Error] FR_Grph.pas(338): E2003 Undeclared identifier: 'SeriesUp'}
       //SeriesUp( Series[ lboxLegend.ItemIndex ]);
end;


procedure TFrmForeGraphBase.LoadMonthsList( DataSet: TDataSet );
var
  I, J: Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] FR_Grph.pas(358): E2003 Undeclared identifier: 'chkbMonths' : TCheckListBox}
  //chkbMonths.Items.Clear;
  for I:= 0 to DataSet.FieldCount - 1 do
    if Pos('-', DataSet.Fields[ I ].FieldName) > 0 then
       with DataSet.Fields[ I ] do
       begin
          { TODO -oSanketG -cWebConvert : Need to revisit , [dcc32 Error] FR_Grph.pas(358): E2003 Undeclared identifier: 'chkbMonths'}
          {J:= chkbMonths.Items.Add( FieldName );
          chkbMonths.Checked[ J ]:= TRUE;}
       end;
end;

procedure TFrmForeGraphBase.LoadMonthsList( AMonthsList: TStringList );
var
  I, J: Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] FR_Grph.pas(372): E2003 Undeclared identifier: 'chkbMonths'}
  //chkbMonths.Items.Clear;
  for I:= 0 to AMonthsList.Count - 1 do
  begin
     { TODO -oSanketG -cWebConvert : Need to revisit ,
     Undeclared identifier: 'chkbMonths' : TCheckListBox}
     {J:= chkbMonths.Items.Add( AMonthsList[ I ]);
     chkbMonths.Checked[ J ]:= TRUE;}
  end;
end;

function TFrmForeGraphBase.SeriesByTitle( S: string ): TLineSeries;
begin
  with lboxLegend do
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] FR_Grph.pas(377): E2003 Undeclared identifier: 'Series'}
    //Result:= Chart1.Series[ Items.IndexOf( S )] as TLineSeries;
end;

procedure TFrmForeGraphBase.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TFrmForeGraphBase.SetMonthsList(const Value: TStringList);
begin
  FMonthsList := Value;
end;

procedure TFrmForeGraphBase.chkbMonthsClickCheck(Sender: TObject);
begin
  BuildGraph( wwQryForecast, SeriesByTitle( 'Forecast' ));
  BuildGraph( wwQryOnOrder , SeriesByTitle( 'On Order' ));
  BuildGraph( wwQryShipped , SeriesByTitle( 'Shipped'  ));
end;


procedure TFrmForeGraphBase.sbtnUnCheckAllMonthsClick(Sender: TObject);
begin
 AllMonthsChecked( Sender = sbtnCheckAllMonths );
end;

procedure TFrmForeGraphBase.AllMonthsChecked( Value: Boolean );
var
  I: Integer;
begin
 { TODO -oSanketG -cWebConvert : Need to revisit ,
 [dcc32 Error] FR_Grph.pas(422): E2003 Undeclared identifier: 'chkbMonths'}
 {with chkbMonths do
   for I:= 0 to Items.Count - 1 do
      Checked[ I ]:= Value;}

 chkbMonthsClickCheck( NIL );
end;

procedure TFrmForeGraphBase.CheckMonthsFrom( S: string );
var
  I: Integer;
begin
 { TODO -oSanketG -cWebConvert : Need to revisit ,
 [dcc32 Error] FR_Grph.pas(433): E2003 Undeclared identifier: 'chkbMonths'}
 {with chkbMonths do
   for I:= 0 to Items.Count - 1 do
     Checked[ I ]:= Pos( Format('_%s_', [ Items[ I ]]), S ) > 0;}
end;

procedure TFrmForeGraphBase.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (ssCtrl in Shift) then
  with Series do
  begin
     MessageBeep(0);
     IQConfirm( Format('%s %s : %f', [ Title, XLabel[ ValueIndex ], DtoF( YValue[ ValueIndex ]) ]));
  end;
end;

procedure TFrmForeGraphBase.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    ConstructQueries;
    ABORT;
  end;
end;

procedure TFrmForeGraphBase.sbtnSaveToFileClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
     { TODO -oSanketG -cWebConvert : Need to revisit ,
     [dcc32 Error] FR_Grph.pas(448): E2003 Undeclared identifier: 'SaveToBitmapFile'}
     //Chart1.SaveToBitmapFile( SaveDialog1.FileName );
end;

procedure TFrmForeGraphBase.sbtnPrintClick(Sender: TObject);
begin
  ChartPreviewer1.Execute;
end;


end.
