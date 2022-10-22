unit SalInvIn;

interface

uses
  System.Classes, Vcl.Forms, Mask, Vcl.wwDataInspector, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniGUITypes, uniGUIAbstractClasses, uniGUIForm, uniGUIApplication, Vcl.Controls, Vcl.Grids;

type
  TFrmCommInvoiceInfo = class(TUniForm)
    Panel1: TUniPanel;
    diSummary: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AssignDataSource;
  public
    { Public declarations }
    //constructor create(AOwner:TComponent); override;
  end;

function FrmCommInvoiceInfo: TFrmCommInvoiceInfo;

function DoShowCommInvoiceInfo:TFrmCommInvoiceInfo;

implementation
{$R *.DFM}

uses
  IQMS.Common.RegFrm, MainModule;//, mainsale;

function FrmCommInvoiceInfo: TFrmCommInvoiceInfo;
begin
  Result := TFrmCommInvoiceInfo(UniMainModule.GetFormInstance(TFrmCommInvoiceInfo));
end;

function DoShowCommInvoiceInfo:TFrmCommInvoiceInfo;
begin
  Result := FrmCommInvoiceInfo;
  Result.Show;
end;

procedure TFrmCommInvoiceInfo.AssignDataSource;
begin
  //if Owner is TFrmSalesPeople then
   // diSummary.DataSource := TFrmSalesPeople(Owner).SrcArinvoice;
end;

procedure TFrmCommInvoiceInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
  Action := caFree;
end;

procedure TFrmCommInvoiceInfo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  AssignDataSource;
end;

end.


