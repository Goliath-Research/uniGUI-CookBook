unit _mOrdersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniDBNavigator, unimDBNavigator, uniBasicGrid, uniDBGrid,
  unimDBListGrid, unimDBGrid, uniToolBar, unimToolbar, unimCarousel,
  MainModule;

type
  TmOrdersForm = class(TUnimForm)
    dbgOrders: TUnimDBGrid;
    barOrders: TUnimToolBar;
    btnMarkAsPaid: TUnimToolButton;
    UnimCarousel1: TUnimCarousel;
    cpOrders: TUnimCarouselPage;
    pnlOrders: TUnimContainerPanel;
    pnlItems: TUnimContainerPanel;
    barItems: TUnimToolBar;
    dbgItems: TUnimDBGrid;
    cpCustomers: TUnimCarouselPage;
    barCustomers: TUnimToolBar;
    dbgCustomers: TUnimDBGrid;
    cpProducts: TUnimCarouselPage;
    barProducts: TUnimToolBar;
    dbgProducts: TUnimDBGrid;
    cntOrders: TUnimToolButton;
    dbnOrders: TUnimDBNavigator;
    UnimToolButton2: TUnimToolButton;
    cntItems: TUnimToolButton;
    dbnItems: TUnimDBNavigator;
    UnimToolButton4: TUnimToolButton;
    cntProducts: TUnimToolButton;
    dbnProducts: TUnimDBNavigator;
    UnimToolButton6: TUnimToolButton;
    cntCustomers: TUnimToolButton;
    dbnCustomers: TUnimDBNavigator;
    procedure UnimFormCreate(Sender: TObject);
    procedure UnimFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function mOrdersForm: TmOrdersForm;

implementation

{$R *.dfm}

uses
  uniGUIApplication;

function mOrdersForm: TmOrdersForm;
begin
  Result := TmOrdersForm(UniMainModule.GetFormInstance(TmOrdersForm));
end;

procedure TmOrdersForm.UnimFormCreate(Sender: TObject);
begin
  uniMainModule.OnCreateOrdersEditor(Sender);
end;

procedure TmOrdersForm.UnimFormDestroy(Sender: TObject);
begin
  uniMainModule.OnDestroyOrdersEditor(Sender);
end;

end.
