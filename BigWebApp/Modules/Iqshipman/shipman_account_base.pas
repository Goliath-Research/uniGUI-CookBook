unit shipman_account_base;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Mask,
  shipman_params,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,IQMS.Common.Regfrm, Vcl.Forms;

type
  TFrmShipManAccountBase = class(TUniForm)
    PnlMain: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlLabels: TUniPanel;
    Splitter1: TUniSplitter;
    PnlEditBoxes: TUniPanel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FModified: Boolean;
    FIsDefault: Boolean;
    FCarrierOptions: TCarrierOptions;
    procedure DoBeforeGetValues;
    procedure SetCarrierID(const Value: Real);
  protected
    { Protected declarations }
    procedure LoadOptions; virtual; abstract;
    procedure SaveOptions; virtual; abstract;
    procedure SetControls; virtual;
    procedure ValidateOptions; virtual;
  public
    { Public declarations }
    FCarrierID: Real;
  published
    { Published declarations }
    property Modified: Boolean read FModified;
    property IsDefault: Boolean read FIsDefault write FIsDefault;

    property CarrierOptions: TCarrierOptions read FCarrierOptions write FCarrierOptions;
    property CarrierID : Real write SetCarrierID;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  shipman_common,
  zipcode;

{ TFrmShipManAccountBase }


procedure TFrmShipManAccountBase.FormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditBoxes, 8);
  FCarrierOptions := TCarrierOptions.Create(Self, FCarrierID);
  FCarrierOptions.OnBeforeGetValues := DoBeforeGetValues;
  DoBeforeGetValues;
  //FCarrierOptions.Refresh;
  LoadOptions;

  SetControls;
end;

procedure TFrmShipManAccountBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 IQRegFormWrite(Self,[]);

 if Assigned(FCarrierOptions) then
    FreeAndNil(FCarrierOptions);
end;

procedure TFrmShipManAccountBase.SetCarrierID(const Value: Real);
begin
  FCarrierID := Value;
end;

procedure TFrmShipManAccountBase.SetControls;
begin
  // virtual method
end;

procedure TFrmShipManAccountBase.btnOkClick(Sender: TObject);
begin
  ValidateOptions;
  SaveOptions;
  ModalResult := mrOk;
end;

procedure TFrmShipManAccountBase.DoBeforeGetValues;
begin
  shipman_common.CheckAccountCreated(FCarrierID);
end;

procedure TFrmShipManAccountBase.ValidateOptions;
begin
  //
end;

end.
