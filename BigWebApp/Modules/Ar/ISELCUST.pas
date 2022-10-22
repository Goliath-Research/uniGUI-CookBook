unit ISelCust;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniRadioGroup,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmCustSelect = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    RGSelect: TUniRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }

    function GetSelection: Integer;
  public
    { Public declarations }

    property Selection : integer read GetSelection;
  end;

function DoSelectCustomer : Integer;

implementation

uses
  IQMS.Common.RegFrm;

{$R *.DFM}

function DoSelectCustomer : Integer;
var
  aFrmCustSelect : TFrmCustSelect;
begin
  aFrmCustSelect := TFrmCustSelect.Create(UniGUIApplication.UniApplication);
  aFrmCustSelect.ShowModal;
  Result := aFrmCustSelect.Selection;
end;

procedure TFrmCustSelect.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmCustSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

function TFrmCustSelect.GetSelection: Integer;
begin
  Result := RgSelect.ItemIndex;
end;

end.

