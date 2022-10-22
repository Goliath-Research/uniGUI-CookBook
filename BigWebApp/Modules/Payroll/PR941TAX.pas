unit PR941tax;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniBasicGrid,
  uniDBGrid;

type
  TFrm941DetailTaxes = class(TUniForm)
    Panel2: TUniPanel;
    Nav: TUniDBNavigator;
    grid: TUniDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
   FSrc:TDataSource;
    procedure SetSrc(const Value: TDataSource);
    { Private declarations }
  public
   property Src:TDataSource read FSrc write SetSrc;
    { Public declarations }
  end;

procedure DoDisc941DetailTaxes(ASrc:TDataSource);


implementation
{$R *.DFM}

uses
 mainmodule,
  IQMS.Common.RegFrm;

procedure DoDisc941DetailTaxes(ASrc:TDataSource);
var
  Frm941DetailTaxes : TFrm941DetailTaxes;
begin
  Frm941DetailTaxes := TFrm941DetailTaxes.Create(UniApplication);
  with Frm941DetailTaxes do
   begin
    Src:=ASrc;
    ShowModal;
   end;
end;

procedure TFrm941DetailTaxes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrm941DetailTaxes.SetSrc(const Value: TDataSource);
begin
   FSrc := Value;
  if FSrc.Name = 'Src17a' then
    Caption := 'Box 17a taxes breakdown by checkdate (first month)'
  else if FSrc.Name = 'Src17b' then
    Caption := 'Box 17b taxes breakdown by checkdate (second month)'
  else if FSrc.Name = 'Src17c' then
    Caption := 'Box 17c taxes breakdown by checkdate (third month)';
  Nav.DataSource  := FSrc;
  Grid.DataSource := FSrc;
end;

procedure TFrm941DetailTaxes.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
end;

end.
