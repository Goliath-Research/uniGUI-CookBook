unit Wo_Gantt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.GanttCh,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  UniChart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TPTAllocCargo = class
    FStart_Time          : TDateTime;
    FEnd_Time            : TDateTime;
    FMfgNo               : string;
    FProdHrs             : Real;
    FWorkorder_ID        : Real;
    FParent_Workorder_ID : Real;
    FStandard_ID         : Real;

    FHintHeader          : string;
  public
    constructor Create( AQuery:TFDQuery ); virtual;
    function HintString: string; virtual;
  end;

  TFrmPtAllocGantt = class(TUniForm)
    QryPtAllocParentChild: TFDQuery;
    SrcPtAllocParentChild: TDataSource;
    QryPtAllocParentChildWORKORDER_ID: TBCDField;
    QryPtAllocParentChildSTART_TIME: TDateTimeField;
    QryPtAllocParentChildEND_TIME: TDateTimeField;
    QryPtAllocParentChildMFGNO: TStringField;
    QryPtAllocParentChildSTANDARD_ID: TBCDField;
    QryPtAllocParentChildTREE_LEVEL: TFMTBCDField;
    QryPtAllocParentChildNODES_ORDER: TFMTBCDField;
    QryPtAllocParentChildBUCKET: TBCDField;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    GanttChart1: TUniChart;
    Series1: TGanttSeries;
    gridPtAllocate: TUniDBGrid;
    QryPtAllocParentChildPRODHRS: TFMTBCDField;
    QryPtAllocParentChildSTR_WORKORDER_ID: TStringField;
    QryPtAllocParentChildPARENT_WORKORDER_ID: TBCDField;
    procedure GanttChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcPtAllocParentChildDataChange(Sender: TObject;
      Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FDataSource: TDataSource;
    { Private declarations }
    function GetGanttBarByWorkorder_ID( AWorkorder_ID: Real; AGanttBars: TList ):LongInt;
    procedure EstablishNextTasks( ASeries: TGanttSeries; AGanttBars: TList );
    procedure DeleteGanttCargo( AGanttBars:TList );
    procedure LoadFromDataSet( ASeries: TGanttSeries; AQuery: TFDQuery; AGanttBars: TList );
    function AddGanttCalc( ASeries: TGanttSeries; AQuery: TFDQuery ):LongInt;
    function Flat_Item_Descrip( AWorkorder_ID: Real ): string;
    procedure SetDataSource(const Value: TDataSource);

  protected
    FPTAllocQry1Param :Real;
    FBarsCalc: TList;
    procedure BuildGanttChart( ASeries: TGanttSeries; AQry: TFDQuery; AGanttBars: TList );

  public
    { Public declarations }
    property DataSource : TDataSource write SetDataSource;
    class procedure DoShowModal(ADataSource:TDataSource );
  end;

procedure DoShowItemGantt(ADataSource:TDataSource );
procedure DoShowItemGanttEx(ADataSource:TDataSource );

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  wo_rscstr;

{ TPTAllocCargo }
constructor TPTAllocCargo.Create( AQuery:TFDQuery );
begin
  // wo_rscstr.cTXT0000033 = 'Calculated:';
  FHintHeader:= wo_rscstr.cTXT0000033;
  with AQuery do
  begin
     FStart_Time          := FieldByName('start_time').asDateTime;
     FEnd_Time            := FieldByName('end_time').asDateTime;
     FMfgNo               := FieldByName('MfgNo').asString;
     FWorkorder_ID        := FieldByName('Workorder_ID').asFloat;
     FParent_Workorder_ID := FieldByName('parent_workorder_id').asFloat;
     FStandard_ID         := FieldByName('Standard_ID').asFloat;
     FProdHrs             := FieldByName('prodhrs').asFloat;
   end;
end;


function TPTAllocCargo.HintString: string;
begin
 Result:= Format( wo_rscstr.cTXT0000034,
                   [
                     FloatToStr(FWorkorder_ID),
                     FMfgNo,
                     FormatDateTime( FormatSettings.ShortDateFormat + ' hh:nn', FStart_Time ),
                     FormatDateTime( FormatSettings.ShortDateFormat + ' hh:nn', FEnd_Time   ),
                     FProdHrs ]);

end;



{ TFrmPtAllocGantt }

procedure DoShowItemGantt(ADataSource:TDataSource );
var
  LFrmPtAllocGantt : TFrmPtAllocGantt;
begin
  LFrmPtAllocGantt := TFrmPtAllocGantt.Create(UniGUIApplication.UniApplication);
  LFrmPtAllocGantt.DataSource := ADataSource;
  LFrmPtAllocGantt.Show;
end;

procedure DoShowItemGanttEx(ADataSource:TDataSource );
begin
  TFrmPtAllocGantt.DoShowModal(ADataSource);
end;

class procedure TFrmPtAllocGantt.DoShowModal(ADataSource: TDataSource);
var
  LFrmPtAllocGantt : TFrmPtAllocGantt;
begin
  LFrmPtAllocGantt := TFrmPtAllocGantt.Create( UniGUIApplication.UniApplication);
  LFrmPtAllocGantt.DataSource := ADataSource;
  LFrmPtAllocGantt.showModal;
end;

procedure TFrmPtAllocGantt.FormShow(Sender: TObject);
var
  ADataChangeEvent: TDataChangeEvent;
begin
  IQSetTablesActive( TRUE, self );

  ADataChangeEvent:= SrcPtAllocParentChild.OnDataChange;
  SrcPtAllocParentChild.OnDataChange:= NIL;

  QryPtAllocParentChild.DataSource:= FDataSource;
  SrcPtAllocParentChild.OnDataChange:= ADataChangeEvent;
  SrcPtAllocParentChild.OnDataChange( SrcPtAllocParentChild, NIL );  {trigger gantt charts rebuild process}
  IQRegFormRead( self, [ self, gridPtAllocate ]);
end;

procedure TFrmPtAllocGantt.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPtAllocGantt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, gridPtAllocate ]);

  DeleteGanttCargo( FBarsCalc );
  FBarsCalc.Free;
end;

procedure TFrmPtAllocGantt.DeleteGanttCargo( AGanttBars:TList );
var
  I:Integer;
begin
  for I:= AGanttBars.Count - 1 downto 0 do
  begin
    TObject(AGanttBars[ I ]).Free;
    AGanttBars.Delete( I );
  end;
end;

procedure TFrmPtAllocGantt.SetDataSource(const Value: TDataSource);
begin
  FDataSource := Value;
end;

procedure TFrmPtAllocGantt.SrcPtAllocParentChildDataChange(Sender: TObject; Field: TField);
begin
  with QryPtAllocParentChild do
    if (State = dsBrowse) and (ParamByName('ptallocate_id').asFloat <> FPTAllocQry1Param) then
    begin
      FPTAllocQry1Param := ParamByName('ptallocate_id').asFloat;
      BuildGanttChart( Series1, QryPtAllocParentChild, FBarsCalc );
    end
end;

procedure TFrmPtAllocGantt.UniFormCreate(Sender: TObject);
begin
  FBarsCalc:= TList.Create;

  FPTAllocQry1Param:= 0;
end;

procedure TFrmPtAllocGantt.BuildGanttChart( ASeries: TGanttSeries; AQry: TFDQuery; AGanttBars: TList );
begin
  LoadFromDataSet( ASeries, AQry, AGanttBars );
  EstablishNextTasks( ASeries, AGanttBars );
end;

procedure TFrmPtAllocGantt.LoadFromDataSet( ASeries: TGanttSeries; AQuery: TFDQuery; AGanttBars: TList );
var
  ABookMark    : TBookMark;
  ABar         : LongInt;
begin
  DeleteGanttCargo( AGanttBars );

  ASeries.Clear;
  ASeries.XValues.Order:= loNone;

  with ASeries, AQuery do
  begin
     ABookMark:= BookMark;
     First;

     while not Eof do
     begin
       ABar:= AddGanttCalc( ASeries, AQuery );
       AGanttBars.Insert( ABar, TPTAllocCargo.Create( AQuery ));

       Next;
     end;
     BookMark:= ABookMark;
  end;
end;

function TFrmPtAllocGantt.AddGanttCalc( ASeries: TGanttSeries; AQuery: TFDQuery ):LongInt;
begin
  with ASeries, AQuery do
    Result:= AddGantt( FieldByName('start_time').asDateTime,
                       FieldByName('end_time').asDateTime,
                       - FieldByName('nodes_order').asInteger,
                       // FieldByName('mfgno').asString )
                       Flat_Item_Descrip( FieldByName('workorder_id').asFloat ));
end;

function TFrmPtAllocGantt.Flat_Item_Descrip( AWorkorder_ID: Real ): string;
begin
  Result:= '';
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( IQFormat( 'select arinvt.descrip                '+
                       '  from ptorder, partno, arinvt       '+
                       ' where ptorder.workorder_id = %f     '+
                       '   and ptorder.partno_id = partno.id '+
                       '   and partno.arinvt_id = arinvt.id  ',
                       [ AWorkorder_ID ]));
    Open;
    while not Eof do
    begin
      if Result = '' then
         Result:= FieldByName('descrip').asString
      else
         Result:= Format('%s, %s', [ Result, FieldByName('descrip').asString ]);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmPtAllocGantt.EstablishNextTasks( ASeries: TGanttSeries; AGanttBars: TList );
var
  ABar: LongInt;
  I   : Integer;
begin
  with ASeries do
  for I:= 0 to AGanttBars.Count - 1 do with TPTAllocCargo( AGanttBars[ I ]) do
  begin
    ABar:= GetGanttBarByWorkorder_ID( FParent_Workorder_ID, AGanttBars );
    if ABar > -1 then
       NextTask[ I ]:= ABar;
  end;
end;

function TFrmPtAllocGantt.GetGanttBarByWorkorder_ID( AWorkorder_ID: Real; AGanttBars: TList ):LongInt;
var
  I:Integer;
begin
  for I:= 0 to AGanttBars.Count - 1 do
    if TPTAllocCargo( AGanttBars[ I ]).FWorkorder_ID = AWorkorder_ID then
    begin
      Result:= I;
      EXIT;
    end;
  Result:= -1;
end;

procedure TFrmPtAllocGantt.GanttChart1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  ATask: Longint;
  I    : Integer;
begin
  with Sender as TUniChart do
  begin
    ShowHint := False;
    { TODO : Revisit }
   (* for I:= 0 to SeriesCount - 1 do
      with Series[ I ] as TGanttSeries do
      begin
        ATask:= Clicked( X, Y );
        if ATask > -1 then
        begin
          {Bars TList has the same # of elements and order }
          Hint:= TPTAllocCargo( FBarsCalc[ ATask ]).HintString;
          ShowHint := True;
          EXIT;
        end;
      end;   *)
  end;
end;

end.
