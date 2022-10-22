unit runs_best_docs;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Documents,
  Data.DB,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, uniPanel;

type
  TFrmRunsTheBestDocs = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    IQDocs1: TIQWebDocs;
    IQExtDoc1: TIQWebExtDoc;
    SR: TIQWebSecurityRegister;
    SrcLocalRunsBest: TDataSource;
    QryLocalRunsBest: TFDQuery;
    QryLocalRunsBestID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IQDocs1NewRecord(DataSet: TDataSet);
    procedure IQDocs1GetMasterTableName(Sender: TObject;
      var AMasterTableName: String);
    procedure IQDocs1GetIndexFieldNames(Sender: TObject;
      var AIndexFieldNames: string);
  private
    { Private declarations }
    FStandard_ID: Real;
    FWork_Center_ID: Real;
    FUsingLocalDataSet: Boolean;

    procedure AssignDataSource; overload;
    procedure AssignDataSource( AStandard_ID, AWork_Center_ID: Real ); overload;
    procedure SetStandard_ID(const Value: Real);
    procedure SetWork_Center_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow;
    class procedure DoShowEx( AStandard_ID, AWork_Center_ID: Real );

    property Standard_ID: Real write SetStandard_ID;
    property Work_Center_ID: Real write SetWork_Center_ID;
  end;

implementation

uses
  RunsBest,
  IQMS.Common.RegFrm,
  { TODO -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  IQMS.Common.DataLib;

{$R *.DFM}

class procedure TFrmRunsTheBestDocs.DoShow;
var
  LFrmRunsTheBestDocs : TFrmRunsTheBestDocs;
begin
  LFrmRunsTheBestDocs := TFrmRunsTheBestDocs.Create(uniGUIApplication.UniApplication);
  LFrmRunsTheBestDocs.AssignDataSource;
  LFrmRunsTheBestDocs.Show;
end;

class procedure TFrmRunsTheBestDocs.DoShowEx( AStandard_ID, AWork_Center_ID: Real);
var
  LFrmRunsTheBestDocs : TFrmRunsTheBestDocs;
begin
  LFrmRunsTheBestDocs := TFrmRunsTheBestDocs.Create( uniGUIApplication.UniApplication);

  LFrmRunsTheBestDocs.Standard_ID   := AStandard_ID;
  LFrmRunsTheBestDocs.Work_Center_ID:= AWork_Center_ID;
  LFrmRunsTheBestDocs.FUsingLocalDataSet:= TRUE;

  LFrmRunsTheBestDocs.AssignDataSource( AStandard_ID, AWork_Center_ID );
  LFrmRunsTheBestDocs.Show;
end;

procedure TFrmRunsTheBestDocs.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex:= 0;
  IQRegFormRead( self, [ self, PageControl1 ]);
  FormStyle:= fsNormal;
end;

procedure TFrmRunsTheBestDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PageControl1 ]);
end;

procedure TFrmRunsTheBestDocs.FormShow(Sender: TObject);
begin
  { TODO -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self );  }
end;

procedure TFrmRunsTheBestDocs.AssignDataSource;
var
  I: Integer;
begin
  if not (Owner is TFrmRunsTheBest) then
     EXIT;

  for I:= 0 to ComponentCount - 1 do
    if Components[ I ] is TIQWebDocs then
       begin
         TIQWebDocs(Components[ I ]).MasterSource:= TFrmRunsTheBest(Owner).wwSrcRuns_Best;
         TIQWebDocs(Components[ I ]).Active := True;
       end
    else if Components[ I ] is TIQWebExtDoc then
       begin
         TIQWebExtDoc(Components[ I ]).MasterSource:= TFrmRunsTheBest(Owner).wwSrcRuns_Best;
         TIQWebExtDoc(Components[ I ]).Active := True;
       end;
end;


procedure TFrmRunsTheBestDocs.AssignDataSource( AStandard_ID, AWork_Center_ID: Real );
var
  I         : Integer;
  AMfgNo    : string;
  AEqno     : string;
  ACntr_Desc: string;
begin
  AMfgNo    := Trim(SelectValueByID('mfgno', 'standard', FStandard_ID ));
  AEqno     := Trim(SelectValueByID('eqno', 'work_center', FWork_Center_ID ));
  ACntr_Desc:= Trim(SelectValueByID('cntr_desc', 'work_center', FWork_Center_ID ));
  Caption:= Format('Runs The Best Documents [WorkCenter # %s, %s. MFG # %s]', [ AEqno, ACntr_Desc, AMfgNo ]);

  QryLocalRunsBest.Close;
  QryLocalRunsBest.ParamByName('standard_id').Value := FStandard_ID;
  QryLocalRunsBest.ParamByName('work_center_id').Value := FWork_Center_ID;
  QryLocalRunsBest.Open;

  for I:= 0 to ComponentCount - 1 do
    if Components[ I ] is TIQWebDocs then
       begin
         TIQWebDocs(Components[ I ]).Active:= FALSE;
         TIQWebDocs(Components[ I ]).MasterSource:= SrcLocalRunsBest;
         TIQWebDocs(Components[ I ]).Active:= TRUE;
       end
    else if Components[ I ] is TIQWebExtDoc then
       begin
         TIQWebExtDoc(Components[ I ]).MasterSource:= SrcLocalRunsBest;
         TIQWebExtDoc(Components[ I ]).Active := True;
       end;
end;

procedure TFrmRunsTheBestDocs.IQDocs1NewRecord(DataSet: TDataSet);
begin
  if DataSet.FieldByName('runs_best_id').asFloat > 0 then
     EXIT;

  DataSet.FieldByName('id').asFloat:= GetNextID('runs_best_docs');

  if FUsingLocalDataSet then
     DataSet.FieldByName('runs_best_id').asFloat:= QryLocalRunsBestID.asFloat
  else
     DataSet.FieldByName('runs_best_id').asFloat:= TFrmRunsTheBest(Owner).wwQryRuns_Best.FieldByName('id').asFloat;
end;

procedure TFrmRunsTheBestDocs.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TFrmRunsTheBestDocs.SetWork_Center_ID(const Value: Real);
begin
  FWork_Center_ID := Value;
end;

procedure TFrmRunsTheBestDocs.IQDocs1GetIndexFieldNames(Sender: TObject;
  var AIndexFieldNames: string);
begin
   AIndexFieldNames:= 'RUNS_BEST_ID;DOCSEQ';
end;

procedure TFrmRunsTheBestDocs.IQDocs1GetMasterTableName(Sender: TObject; var AMasterTableName: String);
begin
  AMasterTableName:= 'RUNS_BEST';
end;

end.
