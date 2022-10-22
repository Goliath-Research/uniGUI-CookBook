unit ProdProp;

interface

uses

  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPageControl,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniCheckBox,
  uniBitBtn,
  uniPanel,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms;

type

  TProperties = record
    LaborReporting : boolean;
  end;

  TFrmProperty = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    GroupBox1: TUniGroupBox;
    CheckBox1: TUniCheckBox;
    CheckBox2: TUniCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    GroupBox2: TUniGroupBox;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Edit1: TUniEdit;
    Edit2: TUniEdit;
    Edit3: TUniEdit;
    Edit4: TUniEdit;
    Edit5: TUniEdit;
    TabSheet3: TUniTabSheet;
    CheckBox3: TUniCheckBox;
    BitBtn1: TUniBitBtn;
    BitBtn2: TUniBitBtn;
    CheckBox12: TUniCheckBox;
    GroupBox3: TUniGroupBox;
    CheckBox4: TUniCheckBox;
    CheckBox5: TUniCheckBox;
    CheckBox6: TUniCheckBox;
    CheckBox7: TUniCheckBox;
    CheckBox8: TUniCheckBox;
    CheckBox9: TUniCheckBox;
    CheckBox10: TUniCheckBox;
    CheckBox11: TUniCheckBox;
    GroupBox4: TUniGroupBox;
    Label6: TUniLabel;
    Edit6: TUniEdit;
    Button1: TUniButton;
    Label7: TUniLabel;
    Edit7: TUniEdit;
  private
    function GetLaborReporting: boolean;
    { Private declarations }
  public
    { Public declarations }

    property LaborReporting : boolean read GetLaborReporting;
  end;

function DoProdProp(var aProperties : TProperties) : boolean;

implementation

{$R *.DFM}

function DoProdProp(var aProperties : TProperties) : boolean;
var
  frm : TFrmProperty;
begin
  frm := TFrmProperty.Create(UniApplication);
  Result := frm.ShowModal = mrOk;
  if Result then
  begin
    aProperties.LaborReporting := frm.LaborReporting;
  end;
end;

function TFrmProperty.GetLaborReporting: boolean;
begin
  Result := CheckBox1.Checked;
end;

end.