unit ven_rfq_source_dlg;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMultiItem,
  uniComboBox;

type
  TFrmVendorRFQSourceDlg = class(TUniForm)
    Label1: TUniLabel;
    wwDBComboBox1: TUniComboBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
  private
    function GetSource: string;
    procedure SetSource(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var ASource: string):Boolean;
    property Source:string read GetSource write SetSource;
  end;

implementation

{$R *.dfm}

{ TFrmVendorRFQSourceDlg }

class function TFrmVendorRFQSourceDlg.DoShowModal(var ASource: string): Boolean;
var
  frm:TFrmVendorRFQSourceDlg;
begin
  frm:=TFrmVendorRFQSourceDlg.Create(uniGUIApplication.UniApplication);
  //frm.Source := ASource;

  Result:= frm.ShowModal = mrOK;
  if Result then
     ASource:= frm.Source;
end;

function TFrmVendorRFQSourceDlg.GetSource: string;
begin
  Result:=wwDBComboBox1.Items.Strings[wwDBComboBox1.ItemIndex];
end;

procedure TFrmVendorRFQSourceDlg.SetSource(const Value: string);
var 
  i:Integer;
begin
  for i := 0 to wwDBComboBox1.Count-1 do
    if wwDBComboBox1.Items.Strings[i]=Value then
       wwDBComboBox1.ItemIndex:=i;
end;

end.
