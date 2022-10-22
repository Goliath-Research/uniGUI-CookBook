unit Paste_Rel_OE;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
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
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TPasteMode = ( pmCancel, pmAppend, pmOverwrite );

  TFrmPasteReleases_OE = class(TUniForm)
    Panel2: TUniPanel;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1PROMISE_DATE: TDateTimeField;
    Query1QUAN: TBCDField;
    Query1REQUEST_DATE: TDateTimeField;
    Panel1: TUniPanel;
    btnAppend: TUniButton;
    brnOverwrite: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure btnAppendClick(Sender: TObject);
  private
    { Private declarations }
    FDetail_ID: Real;
    FPasteMode: TPasteMode;
    procedure SetDetail_ID(const Value: Real);
  public
    { Public declarations }
    property PasteMode: TPasteMode read FPasteMode write FPasteMode;
    property Detail_ID : Real write SetDetail_ID;
  end;

function DoGetPasteReleasesMode_OE( ADetail_ID: Real ):TPasteMode;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;


function DoGetPasteReleasesMode_OE(ADetail_ID: Real ):TPasteMode;
var
  LFrmPasteReleases_OE : TFrmPasteReleases_OE;
begin
  LFrmPasteReleases_OE :=  TFrmPasteReleases_OE.Create(UniGUIApplication.UniApplication);
  LFrmPasteReleases_OE. Detail_ID := ADetail_ID;
  LFrmPasteReleases_OE.ShowModal;
  Result:= LFrmPasteReleases_OE.PasteMode;
end;

procedure TFrmPasteReleases_OE.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

procedure TFrmPasteReleases_OE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;


procedure TFrmPasteReleases_OE.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('detail_id').asFloat:= FDetail_ID;
end;

procedure TFrmPasteReleases_OE.SetDetail_ID(const Value: Real);
begin
  FDetail_ID := Value;
end;

procedure TFrmPasteReleases_OE.btnAppendClick(Sender: TObject);
begin
  if Sender = btnAppend then
     FPasteMode:= pmAppend
  else if Sender = brnOverwrite then
     FPasteMode:= pmOverwrite
  else
     FPasteMode:= pmCancel;
  Close;
end;

end.
