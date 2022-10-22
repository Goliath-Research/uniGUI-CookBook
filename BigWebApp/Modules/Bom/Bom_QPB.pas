unit Bom_QPB;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmBOM_QPB = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    SrcPartNo_Qty_Breaks: TDataSource;
    TblPartNo_Qty_Breaks: TFDTable;
    TblPartNo_Qty_BreaksPARTNO_ID: TBCDField;
    TblPartNo_Qty_BreaksQUAN: TBCDField;
    TblPartNo_Qty_BreaksQPRICE: TFMTBCDField;
    TblPartNo_Qty_BreaksPRICE_DATE: TDateTimeField;
    TblPartNo_Qty_BreaksEFFECT_DATE: TDateTimeField;
    TblPartNo_Qty_BreaksDEACTIVE_DATE: TDateTimeField;
    SrcPartNo: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcPartNo_Qty_BreaksDataChange(Sender: TObject;
      Field: TField);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMasterFieldName: string;
    FPartno_ID:Real;
    procedure SetMasterFieldName(const Value: String);
  public
    { Public declarations }
    property MasterFieldName : String write SetMasterFieldName;
  end;

procedure DoPartNoQtyBreaks(ADataSet: TDataSet; AMasterFieldName: string = 'ID' );

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  Variants;

procedure DoPartNoQtyBreaks(ADataSet: TDataSet; AMasterFieldName: string = 'ID' );
var
  LFrmBOM_QPB : TFrmBOM_QPB;
begin
  LFrmBOM_QPB := TFrmBOM_QPB.Create(UniGUIApplication.UniApplication);
  LFrmBOM_QPB.MasterFieldName := AMasterFieldName;
  LFrmBOM_QPB.SrcPartNo.DataSet:= ADataSet;
  LFrmBOM_QPB.Show;
end;

procedure TFrmBOM_QPB.UniFormCreate(Sender: TObject);
begin
  FPartno_ID:= 0;

  IQRegFormRead( self, [self, DBGrid1]);

  IQSetTablesActive( TRUE, self );
end;

procedure TFrmBOM_QPB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, DBGrid1]);
end;

procedure TFrmBOM_QPB.SetMasterFieldName(const Value: String);
begin
  FMasterFieldName := Value;
end;

procedure TFrmBOM_QPB.SrcPartNo_Qty_BreaksDataChange(Sender: TObject; Field: TField);
var
  A: Variant;
begin
  with TblPartNo_Qty_Breaks do
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) then
     if (State = dsBrowse) and (MasterSource.DataSet.FieldByName( FMasterFieldName ).asFloat <> FPartno_ID) then
     begin
       FPartno_ID:= MasterSource.DataSet.FieldByName( FMasterFieldName ).asFloat;

       A:= SelectValueArrayFmt('select a.itemno, a.descrip from partno p, arinvt a where p.id = %f and a.id = p.arinvt_id', [ FPartno_ID ]);
       if VarArrayDimCount( A ) > 0 then
          Caption:= Format('%s %s - Qty Breaks', [ A[0], A[1] ])
       else
          Caption:= 'Qty Price Breaks';
     end;
end;

end.
