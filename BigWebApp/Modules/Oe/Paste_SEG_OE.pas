unit Paste_SEG_OE;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
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
  TPasteMode = ( pmEDICancel, pmEDIAppend, pmEDIOverwrite );

  TFRMPasteEDISegs = class(TUniForm)
    Panel2: TUniPanel;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1ORD_DETAIL_ID: TBCDField;
    Query1SEG: TStringField;
    Panel1: TUniPanel;
    btnAppend: TUniButton;
    brnOverwrite: TUniButton;
    btnCancel: TUniButton;
    Query1SegStr: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure btnAppendClick(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDetail_ID: Real;
    FPasteMode: TPasteMode;
  public
    { Public declarations }
    property PasteMode: TPasteMode read FPasteMode write FPasteMode;
  end;

function DoGetPasteReleasesMode_SEG( ADetail_ID: Real ):TPasteMode;

implementation

{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

function DoGetPasteReleasesMode_SEG( ADetail_ID: Real ):TPasteMode;
var
  frm: TFRMPasteEDISegs;
begin
  frm := TFRMPasteEDISegs.Create(uniGUIApplication.UniApplication);
  with frm do
  begin
    FDetail_ID:= ADetail_ID;
    FPasteMode:= pmEDICancel;
    ShowModal;
    Result:= PasteMode;
  end;
end;

procedure TFRMPasteEDISegs.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1 ]);
end;

procedure TFRMPasteEDISegs.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFRMPasteEDISegs.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFRMPasteEDISegs.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('detail_id').asFloat:= FDetail_ID;
end;

procedure TFRMPasteEDISegs.Query1CalcFields(DataSet: TDataSet);
begin
  Query1SegStr.asString := SelectValueFmtAsString('select seg_string from Ord_Detail_seg where id = %f', [Query1ID.asFloat]);
end;

procedure TFRMPasteEDISegs.btnAppendClick(Sender: TObject);
begin
  if Sender = btnAppend then
     FPasteMode:= pmEDIAppend
  else if Sender = brnOverwrite then
     FPasteMode:= pmEDIOverwrite
  else
     FPasteMode:= pmEDICancel;
  Close;
end;

end.
