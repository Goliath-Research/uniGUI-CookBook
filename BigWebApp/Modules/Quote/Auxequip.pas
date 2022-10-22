unit AuxEquip;

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
  TFrmAuxEquip = class(TUniForm)
    SrcAux2: TDataSource;
    TblAux2: TFDTable;
    TblAux2ID: TBCDField;
    TblAux2AUX_DESC: TStringField;
    TblAux2AUX_RATE: TBCDField;
    TblAux2HOW_MANY: TBCDField;
    TblAux2EPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    Bevel1: TUniPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure TblAux2BeforePost(DataSet: TDataSet);
    procedure TblAux2BeforeOpen(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    procedure SetTable(const Value: TFDTable);
    { Private declarations }
  public
    { Public declarations }
    property Table:TFDTable write SetTable;
  end;

procedure DoAuxEquip( aTable:TFDTable);

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib;

procedure DoAuxEquip(aTable:TFDTable);
begin
  with TFrmAuxEquip.Create(uniGUIApplication.UniApplication ) do
  begin
    Table:=aTable;
    ShowModal;
  end;

end;


procedure TFrmAuxEquip.FormCreate(Sender: TObject);
begin
  inherited;
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmAuxEquip.SetTable(const Value: TFDTable);
begin
  if Value <> nil then SrcAux2.DataSet := Value;
end;

procedure TFrmAuxEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmAuxEquip.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAuxEquip.TblAux2BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmAuxEquip.UniFormShow(Sender: TObject);
begin
  //if Table <> nil then SrcAux2.DataSet := Table;
end;

procedure TFrmAuxEquip.TblAux2BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

end.
