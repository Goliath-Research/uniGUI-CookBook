unit inv_trans_alert_base;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl;

type
  TFrmInvTransAlertBase = class(TUniForm)
    pnlCarrier: TUniPanel;
    pgctrlMain: TUniPageControl;
    TabSheet1: TUniTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure EnableTimer(Value: Boolean = True);
  public
    { Public declarations }

    procedure RefreshDataSets; virtual;
  end;

var
  FrmInvTransAlertBase: TFrmInvTransAlertBase;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;
 // inv_trans_alert;

procedure TFrmInvTransAlertBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmInvTransAlertBase.RefreshDataSets;
begin
end;

procedure TFrmInvTransAlertBase.UniFormCreate(Sender: TObject);
begin
    pgctrlMain.ActivePageIndex:= 0;
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmInvTransAlertBase.EnableTimer(Value: Boolean = True);
begin
 // TFrmInvTransAlert(self.Owner).EnableTimer(Value);
end;


end.
