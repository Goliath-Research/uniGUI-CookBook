unit inv_customer_rma;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvCustomerRMA = class(TUniForm)
    SrcRMA: TDataSource;
    wwQryRMA: TFDQuery;
    wwQryRMARMANO: TStringField;
    wwQryRMARMA_DATE: TDateTimeField;
    wwQryRMACLOSED: TStringField;
    wwQryRMAQTYRETURNED: TFMTBCDField;
    wwQryRMACUSTNO: TStringField;
    wwQryRMACOMPANY: TStringField;
    wwQryRMAQTY_RECEIVED: TFMTBCDField;
    wwQryRMARMA_DETAIL_ID: TBCDField;
    wwQryRMAARINVT_ID: TBCDField;
    wwQryRMAUSERID: TStringField;
    wwQryRMAARCUSTO_ID: TBCDField;
    wwQryRMARMA_ID: TBCDField;
    IQSearch1: TIQUniGridControl;
    IQJumpCustomerRMA: TIQWebJump;
    popmRMA: TUniPopupMenu;
    JumpToRMA: TUniMenuItem;
    JumpToCustomerRMA: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryRMABeforeOpen(DataSet: TDataSet);
    procedure JumpToRMAClick(Sender: TObject);
    procedure JumpToCustomerRMAClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShow(AArinvt_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency
  rma_main;  }

{ TFrmInvCustomerRMA }

class procedure TFrmInvCustomerRMA.DoShow(AArinvt_ID: Real);
var
  LFrmInvCustomerRMA : TFrmInvCustomerRMA;
begin
  LFrmInvCustomerRMA := TFrmInvCustomerRMA.Create(UniGUIApplication.UniApplication);
  LFrmInvCustomerRMA.Arinvt_ID := AArinvt_ID;
  LFrmInvCustomerRMA.Show;
end;

procedure TFrmInvCustomerRMA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmInvCustomerRMA.JumpToCustomerRMAClick(Sender: TObject);
begin
  IQJumpCustomerRMA.Execute;
end;

procedure TFrmInvCustomerRMA.JumpToRMAClick(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency  rma_main
  rma_main.DoJumpToRMADetail(self, wwQryRMARMA_DETAIL_ID.asFloat);  }
end;

procedure TFrmInvCustomerRMA.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvCustomerRMA.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmInvCustomerRMA.wwQryRMABeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('arinvt_id').Value := FArinvt_ID;
end;

end.
