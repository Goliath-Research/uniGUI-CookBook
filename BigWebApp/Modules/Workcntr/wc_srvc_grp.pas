unit wc_srvc_grp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
  MainModule,
  uniDBGrid, // TUniDBGridColumn
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmServiceGroups = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Table1: TFDTable;
    Table1ID: TBCDField;
    Table1DESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class procedure TFrmServiceGroups.DoShowModal;
var
  frm: TFrmServiceGroups;
begin
  frm := TFrmServiceGroups.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmServiceGroups.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmServiceGroups.wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if Column.Field = Table1ID then
    Attribs.Color:= clBtnFace;
end;

procedure TFrmServiceGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmServiceGroups.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;


end.
