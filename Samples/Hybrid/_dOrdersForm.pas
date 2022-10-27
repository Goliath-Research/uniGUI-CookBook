unit _dOrdersForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPageControl, uniPanel,
  uniBasicGrid, uniDBGrid, uniDBNavigator, uniSplitter, uniToolBar;

type
  TdOrdersForm = class(TUniForm)
    pc: TUniPageControl;
    tsOrdersItems: TUniTabSheet;
    pnlItems: TUniPanel;
    dbnItems: TUniDBNavigator;
    dbgItems: TUniDBGrid;
    pnlOrders: TUniPanel;
    dbgOrders: TUniDBGrid;
    tsCustomers: TUniTabSheet;
    dbnCustomers: TUniDBNavigator;
    dbgCustomers: TUniDBGrid;
    barCustomers: TUniToolBar;
    barOrders: TUniToolBar;
    btnPaid: TUniToolButton;
    barItems: TUniToolBar;
    tsProducts: TUniTabSheet;
    barProducts: TUniToolBar;
    dbnProducts: TUniDBNavigator;
    dbgProducts: TUniDBGrid;
    cntOrders: TUniToolButton;
    dbnOrders: TUniDBNavigator;
    cntItems: TUniToolButton;
    btnItems: TUniToolButton;
    btnCustomers: TUniToolButton;
    cntCustomers: TUniToolButton;
    btnProducts: TUniToolButton;
    cntProducts: TUniToolButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function dOrdersForm: TdOrdersForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function dOrdersForm: TdOrdersForm;
begin
  Result := TdOrdersForm(UniMainModule.GetFormInstance(TdOrdersForm));
end;

procedure TdOrdersForm.UniFormCreate(Sender: TObject);
begin
  uniMainModule.OnCreateOrdersEditor(Sender);
end;

procedure TdOrdersForm.UniFormDestroy(Sender: TObject);
begin
  uniMainModule.OnDestroyOrdersEditor(Sender);
end;

end.
