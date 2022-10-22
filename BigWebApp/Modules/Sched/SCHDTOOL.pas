unit SchdTool;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmToolConflict = class(TUniForm)
    Panel1: TUniPanel;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    DBNavigator1: TUniDBNavigator;
    Query1PMEQMT_ID: TBCDField;
    Query1TOOL: TStringField;
    Query1TOOL_DESCRIP: TStringField;
    Query1CNTR_SEQ: TBCDField;
    Query1EQNO: TStringField;
    Query1PROD_START_TIME: TDateTimeField;
    Query1PROD_END_TIME: TDateTimeField;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Button1: TUniButton;
    Button2: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
   procedure SetProperties(AWorkorder_ID:Real; AStartTime, AEndTime: TDateTime);
    { Private declarations }
  public
    { Public declarations }
  end;

function DoShowToolConflict( AWorkorder_ID:Real; AStartTime, AEndTime: TDateTime ): TModalResult;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

function DoShowToolConflict( AWorkorder_ID:Real; AStartTime, AEndTime: TDateTime ): TModalResult;
var
  FrmToolConflict : TFrmToolConflict;
begin
  FrmToolConflict := TFrmToolConflict.Create(UniApplication);
  with FrmToolConflict do
  begin
    SetProperties(AWorkorder_ID, AStartTime, AEndTime);
    Result:= ShowModal;
  end;
end;
procedure TFrmToolConflict.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, DBGrid1 ]);
end;

procedure TFrmToolConflict.SetProperties(AWorkorder_ID: Real; AStartTime,
  AEndTime: TDateTime);
begin
  with Query1 do
    begin
      Close;
      ParamByName('workorder_id').Value := AWorkorder_ID;
      ParamByName('start_time').asDateTime:= AStartTime;
      ParamByName('end_time').asDateTime  := AEndTime;
      Open;
    end;
    Panel1.Caption:= Format('Attempt to schedule WO# %.0f running from %s to %s',
                            [ AWorkorder_ID, DateTimeToStr( AStartTime ), DateTimeToStr( AEndTime )]);
end;

procedure TFrmToolConflict.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self, DBGrid1 ]);
end;

end.
