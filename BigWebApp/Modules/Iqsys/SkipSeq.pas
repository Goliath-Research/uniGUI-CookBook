unit SkipSeq;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Controls;

type
  TFrmSkippedSeq = class(TUniForm)
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ACTION: TStringField;
    Query1ORIGINAL_VALUE: TStringField;
    Query1NEW_VALUE: TStringField;
    Query1DATETIME_STAMP: TDateTimeField;
    Query1USERID: TStringField;
    Bevel1: TUniPanel;
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FModule_Name: string;
    FTable_Name : string;
    FField_Name : string;
    procedure SetField_Name(const Value: string);
    procedure SetModule_Name(const Value: string);
    procedure SetTable_Name(const Value: string);
  public
    { Public declarations }
    property Module_Name: string write SetModule_Name;
    property Table_Name : string write SetTable_Name;
    property Field_Name : string write SetField_Name;
  end;

procedure ShowSkippedSeq( AModule, ATable, AField: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  iqsys_rscstr;

procedure ShowSkippedSeq( AModule, ATable, AField: string );
var
  LFrm: TFrmSkippedSeq;
begin
  LFrm:= TFrmSkippedSeq.Create( UniGuiApplication.UniApplication );
  LFrm.Module_Name := AModule;
  LFrm.Table_Name := ATable;
  LFrm.Field_Name := AField;
  LFrm.ShowModal;
end;

procedure TFrmSkippedSeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFrmSkippedSeq.Query1BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'module_name', FModule_Name);
  AssignQueryParamValue(DataSet, 'table_name', FTable_Name);
  AssignQueryParamValue(DataSet, 'field_name', FField_Name);
end;

procedure TFrmSkippedSeq.SetField_Name(const Value: string);
begin
  FField_Name:= Value;
end;

procedure TFrmSkippedSeq.SetModule_Name(const Value: string);
begin
  FModule_Name:= Value;
end;

procedure TFrmSkippedSeq.SetTable_Name(const Value: string);
begin
  FTable_Name:= Value;
end;

procedure TFrmSkippedSeq.UniFormShow(Sender: TObject);
begin
  //'Skipped Sequences [Module = %s, Table = %s, Field = %s]'
  Caption:= Format(iqsys_rscstr.cTXT0000075, [ FModule_Name, FTable_Name,  FField_Name ]);
  IQRegFormRead( self, [ self, DBGrid1 ]);

  Reopen( Query1 );
end;

end.
