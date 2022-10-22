unit q_where_used;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
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
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmQuoteWhereUsed = class(TUniForm)
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    JumpToRFQ1: TUniMenuItem;
    wwQuery1RFQ: TStringField;
    wwQuery1PROJECT: TStringField;
    wwQuery1QUOTE_DATE: TDateTimeField;
    wwQuery1QUOTE_REV: TBCDField;
    wwQuery1DESCRIP: TStringField;
    wwQuery1ITEMNO: TStringField;
    wwQuery1SOURCE: TStringField;
    wwQuery1DESCRIP2: TStringField;
    wwQuery1COMPANY: TStringField;
    wwQuery1ID: TBCDField;
    wwQuery1EPLANT_ID: TBCDField;
    wwQuery1MFG_TYPE: TStringField;
    wwQuery1ARCHIVED: TStringField;
    wwQuery1REV: TStringField;
    wwQuery1CLASS: TStringField;
    IQJumpQuote: TIQWebJump;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure JumpToRFQ1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FQinvt_ID: Real;
    procedure SetQinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(AQinvt_ID: Real);
    property Qinvt_ID : Real write SetQinvt_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  inv_rscstr;

{ TFrmQuoteWhereUsed }

class procedure TFrmQuoteWhereUsed.DoShow(AQinvt_ID: Real);
var
  LFrmQuoteWhereUsed : TFrmQuoteWhereUsed;
begin
  LFrmQuoteWhereUsed := TFrmQuoteWhereUsed.Create(UniGuiApplication.UniApplication);
  LFrmQuoteWhereUsed.Qinvt_ID := AQinvt_ID;
  LFrmQuoteWhereUsed.Show;
end;

procedure TFrmQuoteWhereUsed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmQuoteWhereUsed.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('qinvt_id').Value := FQInvt_ID;
end;

procedure TFrmQuoteWhereUsed.JumpToRFQ1Click(Sender: TObject);
begin
  IQJumpQuote.Execute
end;

procedure TFrmQuoteWhereUsed.SetQinvt_ID(const Value: Real);
begin
    FQinvt_ID:= Value;
end;

procedure TFrmQuoteWhereUsed.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);

  self.Caption:= Format(inv_rscstr.cTXT0000124 {'Where %s is Used'}, [SelectValueFmtAsString('select RTRim(class) || ''.'' || RTRim(itemno) '+
                                            '|| ''.'' || RTrim(descrip) from qinvt where id = %f', [FQinvt_ID ])]);
end;

end.
