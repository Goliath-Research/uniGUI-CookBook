unit tag_xfgmulti;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmTagXFgMulti = class(TUniForm)
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    wwDBGrid2: TIQUniGridControl;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery1TAGHEAD_ID: TBCDField;
    FDQuery1FGMULTI_ID: TBCDField;
    FDQuery1NEWREC: TStringField;
    FDQuery1ARINVT_ID: TBCDField;
    FDQuery1NON_CONFORM_ID: TBCDField;
    FDQuery1LOC_DESC: TStringField;
    FDQuery1LOTNO: TStringField;
    FDQuery1QUAN: TBCDField;
    FDQuery1RG_QUAN: TBCDField;
    FDQuery1NEW_QUAN: TBCDField;
    FDQuery1NEW_RG_QUAN: TBCDField;
    FDQuery1EPLANT_ID: TBCDField;
    FDQuery1PROCESSED: TStringField;
    FDQuery1ORIGIN: TStringField;
    FDQuery1NOT_COUNTED: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQuery1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FTagHead_ID: Real;
  public
    { Public declarations }
    class procedure DoShowModal( ATagHead_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmTagXFgMulti }

procedure TFrmTagXFgMulti.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1, wwDBGrid2 ]);
end;

procedure TFrmTagXFgMulti.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  Caption:= Format('XFGMULTI [ Taghead ID = %.0f]', [ FTagHead_ID ]);
end;

class procedure TFrmTagXFgMulti.DoShowModal(ATagHead_ID: Real);
var
  frm: TFrmTagXFgMulti;
begin
   frm := TFrmTagXFgMulti.Create(uniGUIApplication.UniApplication);
   frm.FTagHead_ID:= ATagHead_ID;
   frm.ShowModal;
end;

procedure TFrmTagXFgMulti.FDQuery1BeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('taghead_id').Value := FTagHead_ID;
end;

procedure TFrmTagXFgMulti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, wwDBGrid2 ]);
end;

end.
