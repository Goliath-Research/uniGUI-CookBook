unit RTSetup;

interface

uses
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniButton, MainModule, System.Classes, Vcl.Controls;

type
  TRTserialCom = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    ComboBox1: TUniComboBox;
    ComboBox2: TUniComboBox;
    ComboBox3: TUniComboBox;
    ComboBox4: TUniComboBox;
    Label5: TUniLabel;
    ComboBox5: TUniComboBox;
    Label6: TUniLabel;
    Edit1: TUniEdit;
    Button1: TUniButton;
    Button2: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.

