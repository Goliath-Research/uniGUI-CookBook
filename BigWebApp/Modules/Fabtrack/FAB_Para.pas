unit FAB_Para;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniPageControl;

type
  TFrmFAB_Parameters = class(TUniForm)
    DataSource1: TDataSource;
    Table1: TFDTable;
    dbchkDelFirmWo: TUniDBCheckBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel2: TUniPanel;
    Panel1: TUniPanel;
    PageControl1: TUniPageControl;
    tabGeneral: TUniTabSheet;
    Table1DEL_FIRM_WO: TStringField;
    Table1ID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

{ TFrmFAB_Parameters }

class procedure TFrmFAB_Parameters.DoShowModal;
var
  frm: TFrmFAB_Parameters;
begin
  frm := TFrmFAB_Parameters.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmFAB_Parameters.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  dbchkDelFirmWo.Hint:= 'When checked, firm work orders that'#13     +
                        'have been completed & that are no longer'#13+
                        'on the schedule will be deleted upon'#13    +
                        'running update schedule. This setting'#13   +
                        'can be overridden on each work order.';
end;

procedure TFrmFAB_Parameters.btnOKClick(Sender: TObject);
begin
  Table1.CheckBrowseMode;
  ModalResult:= mrOK;
end;

end.
