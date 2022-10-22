unit budgcomp;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.DBGrids,
  Vcl.Menus,
  Spin,
  Data.DB,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniPageControl,
  uniMainMenu,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniBasicGrid,
  uniDBGrid,
  uniComboBox,
  uniDBComboBox;

type
  TFrmBudgComp = class(TUniForm)
    MainMenu1: TUniMainMenu;
    Options1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Reports1: TUniMenuItem;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    DBGrid2: TUniDBGrid;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label9: TUniLabel;
    DBLookupComboBox1: TUniDBLookupComboBox;
    DBLookupComboBox5: TUniDBLookupComboBox;
    ComboBox1: TUniComboBox;
    ComboBox2: TUniComboBox;
    btnUpdateView: TUniButton;
    ComboBox3: TUniComboBox;
    btnGraph2: TUniBitBtn;
    Label4: TUniLabel;
    DBGrid1: TUniDBGrid;
    btnGraph1: TUniBitBtn;
    ComboBox4: TUniComboBox;
    Label3: TUniLabel;
    ComboBox6: TUniComboBox;
    Label6: TUniLabel;
    SpeedButton1: TUniSpeedButton;
    SpeedButton2: TUniSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
