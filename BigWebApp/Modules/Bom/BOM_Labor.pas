unit Bom_Labor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmBOM_Labor = class(TUniForm)
    wwSrcBom_Labor: TDataSource;
    wwQryBom_Labor: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    wwQryBom_LaborID: TBCDField;
    wwQryBom_LaborSTANDARD_ID: TBCDField;
    wwQryBom_LaborEMP_LEVEL_ID: TBCDField;
    wwQryBom_LaborOPERATOR: TBCDField;
    wwQryBom_LaborCode: TStringField;
    wwQryBom_LaborDescrip: TStringField;
    wwQryBom_LaborLabor_Rate: TFloatField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwQryLookupCode: TFDQuery;
    wwQryLookupCodeID: TBCDField;
    wwQryLookupCodeCODE: TStringField;
    wwQryLookupCodeDESCRIP: TStringField;
    wwQryLookupDescrip: TFDQuery;
    wwQryLookupDescripID: TBCDField;
    wwQryLookupDescripCODE: TStringField;
    wwQryLookupDescripDESCRIP: TStringField;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    UpdateSQL1: TFDUpdateSQL;
    SrcCode: TDataSource;
    SrcDescrip: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryBom_LaborAfterPost(DataSet: TDataSet);
    procedure wwQryBom_LaborNewRecord(DataSet: TDataSet);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TGridDrawState'
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush); }
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn); }
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwQryBom_LaborCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FStandard_ID: Real;
    procedure SetStandard_ID(const Value: Real);
  protected
    procedure DefaultStartUp;
    procedure RefreshOwner( DataSet: TDataSet ); virtual;
  public
    { Public declarations }
    procedure DoCreate( AMasterSource: TDataSource );
    procedure DoCreateEx( AwwQryBomLabor: TDataSet );
    procedure DoCreateExA( AStandard_ID: Real; AReadOnly: Boolean );

    class procedure DoShow( AMasterSource: TDataSource );
    class procedure DoShowEx( AwwQryBomLabor: TDataSet );
    class procedure DoShowExA( AStandard_ID: Real; AReadOnly: Boolean );

    property Standard_ID: Real write SetStandard_ID;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  IQSecIns, }
  IQMS.Common.JumpConstants;

{ TFrmBOM_Labor - class procedures}

class procedure TFrmBOM_Labor.DoShow( AMasterSource: TDataSource );
var
  LFrmBOM_Labor : TFrmBOM_Labor;
begin
  LFrmBOM_Labor := TFrmBOM_Labor.Create( uniGUIApplication.UniApplication );
  LFrmBOM_Labor.DoCreate( AMasterSource );
  LFrmBOM_Labor.Show;
end;

class procedure TFrmBOM_Labor.DoShowEx( AwwQryBomLabor: TDataSet );
var
  LFrmBOM_Labor : TFrmBOM_Labor;
begin
  LFrmBOM_Labor := TFrmBOM_Labor.Create( uniGUIApplication.UniApplication );
  LFrmBOM_Labor.DoCreateEx( AwwQryBomLabor );
  LFrmBOM_Labor.ShowModal;
end;

class procedure TFrmBOM_Labor.DoShowExA( AStandard_ID: Real; AReadOnly: Boolean );
var
  LFrmBOM_Labor : TFrmBOM_Labor;
begin
  IQAssert( AStandard_ID > 0, 'Mfg # is not assigned');

  LFrmBOM_Labor := TFrmBOM_Labor.Create( uniGUIApplication.UniApplication );
  LFrmBOM_Labor.Standard_ID := AStandard_ID;
  LFrmBOM_Labor.DoCreateExA( AStandard_ID, AReadOnly );
  LFrmBOM_Labor.ShowModal;
end;

{ TFrmBOM_Labor }

procedure TFrmBOM_Labor.DoCreate( AMasterSource: TDataSource );
begin
  wwQryBom_Labor.DataSource:= AMasterSource;
  IQSetTablesActive( TRUE, self );

  DefaultStartUp;
end;

procedure TFrmBOM_Labor.DoCreateEx( AwwQryBomLabor: TDataSet );
begin
  AwwQryBomLabor.First;
  wwSrcBom_Labor.DataSet:= AwwQryBomLabor;

  {remove refresh so it won't drop all the cached updates changes}
  { TODO -oathite -cWebConvert : Undeclared identifier: 'nbRefresh'
  DBNavigator1.VisibleButtons:= DBNavigator1.VisibleButtons - [nbRefresh]; }

  DefaultStartUp;
end;

procedure TFrmBOM_Labor.DoCreateExA( AStandard_ID: Real; AReadOnly: Boolean );
begin
  with wwQryBom_Labor do
  begin
    Close;
    CachedUpdates:= not AReadOnly;
    ParamByName('id').Value := AStandard_ID;
    Open;
  end;
  IQSetTablesActive( TRUE, self );

  DefaultStartUp;
end;

procedure TFrmBOM_Labor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmBOM_Labor.DefaultStartUp;
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmBOM_Labor.wwQryBom_LaborAfterPost(DataSet: TDataSet);
begin
  RefreshOwner( DataSet )
end;


procedure TFrmBOM_Labor.wwQryBom_LaborCalcFields(DataSet: TDataSet);
begin
  if wwQryBom_LaborEMP_LEVEL_ID.asFloat > 0 then
     wwQryBom_LaborLabor_Rate.asFloat:= SelectValueByID('labor_rate', 'emp_level', wwQryBom_LaborEMP_LEVEL_ID.asFloat );
end;

procedure TFrmBOM_Labor.RefreshOwner( DataSet: TDataSet );
var
  ID: Real;
begin
  if Owner is TUniForm then
  begin
     if Assigned( DataSet.FindField('ID')) then ID:= DataSet.FieldByName('ID').asFloat else ID:= 0;

     SendMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );

     if ID > 0 then DataSet.Locate('ID', ID, []);
  end;
end;


procedure TFrmBOM_Labor.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TFrmBOM_Labor.wwQryBom_LaborNewRecord(DataSet: TDataSet);
begin
  wwQryBom_LaborID.asFloat         := GetNextID('BOM_LABOR');

  if Assigned(wwQryBom_Labor.DataSource) and Assigned(wwQryBom_Labor.DataSource.DataSet) then
     wwQryBom_LaborSTANDARD_ID.asFloat:= wwQryBom_Labor.DataSource.DataSet.FieldByName('ID').asFloat

  else if FStandard_ID > 0 then
     wwQryBom_LaborSTANDARD_ID.asFloat:= FStandard_ID
end;

{ TODO -oathite -cWebConvert : Undeclared identifier: 'TGridDrawState'

procedure TFrmBOM_Labor.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight then
    ABrush.Color:= IIf( Field.ReadOnly, clBtnFace, clWindow );
end;}

{ TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
procedure TFrmBOM_Labor.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( wwDBGrid1.DataSource.DataSet );
    ABORT;
  end;
end;}


procedure TFrmBOM_Labor.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmBOM{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmBOM_Labor.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependent on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;

end.
