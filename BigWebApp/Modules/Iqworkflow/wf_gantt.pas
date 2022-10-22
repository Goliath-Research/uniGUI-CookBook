unit wf_gantt;

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
  ExtCtrls,
  DB,
  Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  VclTee.TeeGDIPlus,
  VCLTee.TeeEdit,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.GanttCh,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  UniChart,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer;

type
  TCustomElementDescription = procedure( AElement_ID: Real; var ADescription: string ) of object;

  TWFGanttCargo = class
  public
    FRequired : TDateTime;
    FCompleted: TDateTime;
    constructor Create( ARequired, ACompleted: TDateTime );
  end;

  TFrmWFGantt = class(TUniForm)
    DBChart1: TUniChart;
    Panel1: TUniPanel;
    sbtnPrintGraph: TUniSpeedButton;
    PrintDialog1: TPrintDialog;
    ChartTimer: TUniTimer;
    sbtnPreviewGantt: TUniSpeedButton;
    sbtnCopyChart: TUniSpeedButton;
    ChartPreviewer1: TChartPreviewer;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnPrintGraphClick(Sender: TObject);
    procedure ChartTimerTimer(Sender: TObject);
    procedure DBChart1Scroll(Sender: TObject);
    procedure sbtnPreviewGanttClick(Sender: TObject);
    procedure sbtnCopyChartClick(Sender: TObject);
    procedure DBChart1BeforeDrawSeries(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FList: TStringList;
    FElementTableName: string;
    FHeaderTableName: string;
    FElementParentFieldName: string;
    FParent_ID: Real;
    FCustomElementDescription: TCustomElementDescription;
    FDateWorkflowWasStarted: TDateTime;
    FChartIsLoading: Boolean;
    procedure BuildGanttChart;
    procedure LoadDataFromDataSet;
    procedure AddGantChart( ASeries: TGanttSeries; AKind: string );
    function GetDateWorkflowWasStarted: TDateTime;
    procedure LoadGanttTodayBar;
    procedure SetElementTableName(const Value: String);
    procedure SetHeaderTableName(const Value: String);
    procedure SetElementParentFieldName(const Value: String);
    procedure SetParent_ID(const Value: Real);
    procedure SetCustomElementDescription(const Value: TCustomElementDescription);
  public
    { Public declarations }
    class procedure DoShowModal(AElementTableName,
                                 AHeaderTableName,
                                 AElementParentFieldName: string;
                                 AParent_ID: Real;
                                 ACustomElementDescription: TCustomElementDescription = NIL );
    property ElementTableName : String write SetElementTableName;
    property HeaderTableName : String write  SetHeaderTableName;
    property ElementParentFieldName : String write SetElementParentFieldName;
    property Parent_ID : Real write SetParent_ID;
    property CustomElementDescription : TCustomElementDescription write SetCustomElementDescription;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.Tee;


{ TWFGanttCargo }

constructor TWFGanttCargo.Create( ARequired, ACompleted: TDateTime );
begin
  FRequired := ARequired;
  FCompleted:= ACompleted;
end;

{ TFrmWFGantt }

class procedure TFrmWFGantt.DoShowModal( AElementTableName,
                                         AHeaderTableName,
                                         AElementParentFieldName: string;
                                         AParent_ID: Real;
                                         ACustomElementDescription: TCustomElementDescription = NIL );
var
   LFrmWFGantt : TFrmWFGantt;
begin
  LFrmWFGantt := TFrmWFGantt.Create(UniGUIApplication.UniApplication);
  LFrmWFGantt.ElementTableName        := AElementTableName;
  LFrmWFGantt.HeaderTableName         := AHeaderTableName;
  LFrmWFGantt.ElementParentFieldName  := AElementParentFieldName;
  LFrmWFGantt.Parent_ID               := AParent_ID;
  LFrmWFGantt.CustomElementDescription:= ACustomElementDescription;
  LFrmWFGantt.ShowModal;
end;

procedure TFrmWFGantt.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQMS.Common.Screen.ApplySystemFont(Self);
  FList:= TStringList.Create;
end;

procedure TFrmWFGantt.UniFormShow(Sender: TObject);
begin
  FDateWorkflowWasStarted  := GetDateWorkflowWasStarted;
  Caption:= Format('Workflow chart. Start date: %s', [ DateTimeToStr( FDateWorkflowWasStarted )]);
  BuildGanttChart;
end;

procedure TFrmWFGantt.FormDestroy(Sender: TObject);
begin
  ClearStringListOfObjects( FList );
  FList.Free;
end;

procedure TFrmWFGantt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmWFGantt.BuildGanttChart;
begin
  if not FChartIsLoading then
  try
    FChartIsLoading := True;
{ TODO -oGPatil -cWebConvert : TUniChart does not contain respective members
    DBChart1.Title.Font.Name := IQMS.Common.Screen.SystemFontName;
    DBChart1.Legend.Font.Name := IQMS.Common.Screen.SystemFontName;
    DBChart1.LeftAxis.Title.Font.Name := IQMS.Common.Screen.SystemFontName;
    DBChart1.BottomAxis.Title.Font.Name := IQMS.Common.Screen.SystemFontName;
    LoadDataFromDataSet;
    AddGantChart( SeriesRequired,  'REQUIRED' );
    AddGantChart( SeriesCompleted, 'COMPLETED');  }
  finally
    FChartIsLoading := False;
  end;
end;

procedure TFrmWFGantt.LoadDataFromDataSet;
var
  ADescription: string;
begin
  ClearStringListOfObjects( FList );

  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat('select id, descrip, required_date, complete_date from %s '+
                      ' where %s = %f order by seq',
                      [ FElementTableName,
                        FElementParentFieldName,
                        FParent_ID ]));
    Open;
    while not Eof do
    begin
      if Assigned( FCustomElementDescription ) then
         FCustomElementDescription( FieldByName('id').asFloat, ADescription )
      else
         ADescription:= FieldByName('descrip').asString;

      FList.AddObject( ADescription, TWFGanttCargo.Create( FieldByName('required_date').asDateTime,
                                                           FieldByName('complete_date').asDateTime ));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmWFGantt.AddGantChart( ASeries: TGanttSeries; AKind: string );
var
  I            : Integer;
  ANextBar     : LongInt;
  ABar         : LongInt;
  APrevEndDate : TDateTime;
  ANewStartDate: TDateTime;
  ANewEndDate  : TDateTime;
begin
  ASeries.Clear;
  ASeries.XValues.Order:= loNone;

  APrevEndDate:= FDateWorkflowWasStarted;
  ABar        := -1;
  for I:= 0 to FList.Count - 1 do with TWFGanttCargo(FList.Objects[ I ]) do
  begin
    ANewStartDate:= APrevEndDate;
    if AKind = 'REQUIRED' then
       ANewEndDate:= FRequired
    else
       ANewEndDate:= FCompleted;

    if ANewEndDate = 0 then
       ANewEndDate:= ANewStartDate;

    ANextBar:= ASeries.AddGantt( ANewStartDate,
                                 ANewEndDate,
                                 - I,           {note negative numbering to start bars from the top}
                                 FList[ I ]);
    if ABar > -1 then
       ASeries.NextTask[ ABar ]:= ANextBar;

    APrevEndDate:= ANewEndDate;
    ABar        := ANextBar;
  end;
end;

procedure TFrmWFGantt.LoadGanttTodayBar;
begin
  IQMS.Common.Tee.DrawBottomAxisTodayBar(DBChart1, True);
end;

function TFrmWFGantt.GetDateWorkflowWasStarted: TDateTime;
begin
  Result:= SelectValueFmtAsFloat('select start_date from %s where id = %f',
                    [ FHeaderTableName,
                      FParent_ID ]);
  if Result = 0 then
  begin
    IQWarning('Unable to determine when workflow was started. Defaulting start date to current date.');
    Result:= Date;
  end;
end;


procedure TFrmWFGantt.sbtnCopyChartClick(Sender: TObject);
begin
  // 12/13/2013 Copy Gantt chart to clipboard
{ TODO -oGPatil -cWebConvert : TUniChart does not contain a member named CopyToClipboardBitmap
  DBChart1.CopyToClipboardBitmap;   }
end;

procedure TFrmWFGantt.sbtnPreviewGanttClick(Sender: TObject);
begin
  ChartPreviewer1.Execute;
end;

procedure TFrmWFGantt.sbtnPrintGraphClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
  with DBChart1 do
  try
     Screen.Cursor:= crHourGlass;
     Title.Text.Add( self.Caption );
{ TODO -oGPatil -cWebConvert : TUniChart.Title does not contain a member named Visible
     Title.Visible:= TRUE;
     PrintLandscape;  }
  finally
{ TODO -oGPatil -cWebConvert : TUniChartTitle does not contain a member named Visible
     Title.Visible:= FALSE;  }
     Screen.Cursor:= crDefault;
  end;
end;

procedure TFrmWFGantt.SetCustomElementDescription(const Value: TCustomElementDescription);
begin
  FCustomElementDescription := Value;
end;

procedure TFrmWFGantt.SetElementParentFieldName(const Value: String);
begin
  FElementParentFieldName := Value;
end;

procedure TFrmWFGantt.SetElementTableName(const Value: String);
begin
  FElementTableName := Value;
end;

procedure TFrmWFGantt.SetHeaderTableName(const Value: String);
begin
  FHeaderTableName := Value;
end;

procedure TFrmWFGantt.SetParent_ID(const Value: Real);
begin
  FParent_ID := Value;
end;

procedure TFrmWFGantt.ChartTimerTimer(Sender: TObject);
begin
  if Showing and not FChartIsLoading then
  LoadGanttTodayBar;
end;

procedure TFrmWFGantt.DBChart1BeforeDrawSeries(Sender: TObject);
begin
  LoadGanttTodayBar;
end;

procedure TFrmWFGantt.DBChart1Scroll(Sender: TObject);
begin
  if Showing and not FChartIsLoading then
    LoadGanttTodayBar;
end;

end.
