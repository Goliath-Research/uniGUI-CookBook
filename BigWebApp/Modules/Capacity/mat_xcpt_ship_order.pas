unit mat_xcpt_ship_order;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  vcl.Wwdbdatetimepicker,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniDateTimePicker,
  uniDBDateTimePicker;

type
  TMatExcepShipOrderCargo = record
    Qty: Real;
    PromiseDate: TDateTime;
    constructor Create(ADummy: Integer);
  end;

  TFrmMatExcepShipOrder = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edQty: TUniEdit;
    wwDBDateTimePicker1: TUniDBDateTimePicker;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   class function DoShowModal(var ACargo: TMatExcepShipOrderCargo): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{ TMatExcepShipOrderCargo }

constructor TMatExcepShipOrderCargo.Create(ADummy: Integer);
begin
  Qty:= 0;
  PromiseDate:= Date;
end;

{ TFrmMatExcepShipOrder }

class function TFrmMatExcepShipOrder.DoShowModal(var ACargo: TMatExcepShipOrderCargo): Boolean;
var
  FrmMatExcepShipOrder : TFrmMatExcepShipOrder;
begin
  FrmMatExcepShipOrder := TFrmMatExcepShipOrder.Create(uniGUIApplication.UniApplication);
  with FrmMatExcepShipOrder do
   begin
      edQty.Text:= FloatToStr(ACargo.Qty);
      wwDBDateTimePicker1.DateTime:= ACargo.PromiseDate;
      Result:= ShowModal = mrOK;
      if Result then
        begin
          ACargo.Qty:= StrToFloat(edQty.Text);
          ACargo.PromiseDate:= wwDBDateTimePicker1.DateTime;
        end;
   end;
end;

procedure TFrmMatExcepShipOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmMatExcepShipOrder.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmMatExcepShipOrder.btnOKClick(Sender: TObject);
begin
  IQAssert( StrToFloat(edQty.Text) <> 0, 'Qty must be entered - operation aborted' );
  IQAssert( wwDBDateTimePicker1.DateTime <> 0, 'Date must be entered - operation aborted' );

  ModalResult:= mrOK;
end;

end.
