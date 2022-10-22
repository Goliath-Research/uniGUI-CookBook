unit pr_main;

interface

uses
  Vcl.Forms,
  Vcl.Menus,
  Mask,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniTreeView,
  uniSplitter,
  uniPanel,
  uniPageControl,
  uniMainMenu,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, MainModule;

type
  TForm2 = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    DBNavigator1: TUniDBNavigator;
    Options1: TUniMenuItem;
    Print1: TUniMenuItem;
    New1: TUniMenuItem;
    TreeView1: TUniTreeView;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    TabSheet3: TUniTabSheet;
    TabSheet4: TUniTabSheet;
    TabSheet5: TUniTabSheet;
    TabSheet6: TUniTabSheet;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label42: TUniLabel;
    Label56: TUniLabel;
    Label58: TUniLabel;
    Label59: TUniLabel;
    Label65: TUniLabel;
    dbeEmpAddr1: TUniDBEdit;
    dbeEmpAddr2: TUniDBEdit;
    dbeEmpCity: TUniDBEdit;
    dbeEmpZIP: TUniDBEdit;
    dbeEmpState: TUniDBComboBox;
    dbeEmpCountry: TUniDBEdit;
    dbeEmpPhone: TUniDBEdit;
    dbeEmpFax: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    dbeEmpFName: TUniDBEdit;
    dbeEmpLastName: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    Middle: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}



end.
