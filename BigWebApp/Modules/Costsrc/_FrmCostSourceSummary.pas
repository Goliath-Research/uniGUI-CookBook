unit _FrmCostSourceSummary;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwrcdpnl,
  IQMS.WebVcl.RecordViewPanel,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Menus,
  Generics.Collections,
  IQMS.CostSource.Types,
  Vcl.ActnList,
  System.Actions,
  Vcl.Controls,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniGUIBaseClasses, uniPanel, IQMS.WebVcl.AppDef;

type
  TFrmCostSourceSummary = class(TUniForm)
    IQRecordViewPanel1: TIQWebRecordViewPanel;
    PMain: TUniPopupMenu;
    ActionList1: TActionList;
    AppDef1: TIQWebAppDef;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private type
    TCreateMenuItem = reference to function(ACaption: string; AEvent: TNotifyEvent): TUniMenuItem;
  private
    { Private declarations }
    procedure AddJumps(AJumpMenuList: TList<TAction>);
    procedure AddJumpMenu(ACaption: string; AOnJump: TNotifyEvent);
    procedure CheckOpenDataSet;
    procedure SetADataSource(const Value: TDataSource);
    procedure SetJumpMenuList(const Value: TList<TAction>);
    procedure SetCostSourceMenuType(const Value: TCostSourceMenuType);
  public
    { Public declarations }
    function HasData: Boolean;
    class procedure DoShowModal(
      ADataSource: TDataSource;
      AJumpMenuList: TList<TAction>;
      ACostSourceMenuType: TCostSourceMenuType);
    property ADataSource: TDataSource write SetADataSource;
    property JumpMenuList: TList<TAction> write SetJumpMenuList;
    property CostSourceMenuType: TCostSourceMenuType write SetCostSourceMenuType;
  end;

implementation

{$R *.dfm}


uses
  costsrc_rscstr,
  IQMS.Common.RegFrm;

{ TFrmCostSourceSummary }

class procedure TFrmCostSourceSummary.DoShowModal(ADataSource: TDataSource;
  AJumpMenuList: TList<TAction>;
  ACostSourceMenuType: TCostSourceMenuType);
var
  LFrmCostSourceSummary: TFrmCostSourceSummary;
begin
  if Assigned(ADataSource) then
  begin
    LFrmCostSourceSummary := TFrmCostSourceSummary.Create(UniGUIApplication.UniApplication);

    LFrmCostSourceSummary.ADataSource := ADataSource;
    LFrmCostSourceSummary.JumpMenuList := AJumpMenuList;

    LFrmCostSourceSummary.CostSourceMenuType := ACostSourceMenuType;

    if LFrmCostSourceSummary.HasData then
       LFrmCostSourceSummary.ShowModal;

  end;
end;

procedure TFrmCostSourceSummary.FormShow(Sender: TObject);
begin
  CheckOpenDataSet;
  IQRegFormRead(Self, [Self]);
end;

function TFrmCostSourceSummary.HasData: Boolean;
begin
  Result := Assigned(IQRecordViewPanel1.DataSource) and
    Assigned(IQRecordViewPanel1.DataSource.DataSet) and
    IQRecordViewPanel1.DataSource.DataSet.Active and
    not (IQRecordViewPanel1.DataSource.DataSet.Bof and
    IQRecordViewPanel1.DataSource.DataSet.Eof);
end;

procedure TFrmCostSourceSummary.SetCostSourceMenuType(
  const Value: TCostSourceMenuType);
begin
  Caption := Format(costsrc_rscstr.cTXT0000017,
    [CostSourceCaption[Value]]);
end;

procedure TFrmCostSourceSummary.SetADataSource(const Value: TDataSource);
begin
  IQRecordViewPanel1.DataSource := Value;
end;

procedure TFrmCostSourceSummary.SetJumpMenuList(const Value: TList<TAction>);
begin
  AddJumps(Value);
end;

procedure TFrmCostSourceSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmCostSourceSummary.AddJumps(AJumpMenuList: TList<TAction>);
var
  i: Integer;
begin
  if Assigned(AJumpMenuList) then
    for i := 0 to AJumpMenuList.Count - 1 do
      AddJumpMenu(AJumpMenuList[i].Caption, AJumpMenuList[i].OnExecute);
end;

procedure TFrmCostSourceSummary.AddJumpMenu(ACaption: string;
  AOnJump: TNotifyEvent);
var
  ACreateMenuItem: TCreateMenuItem;
begin
  ACreateMenuItem := function(ACaption: string; AEvent: TNotifyEvent): TUniMenuItem
    begin
      Result := TUniMenuItem.Create(PMain);
      Result.Caption := ACaption;
      Result.OnClick := AEvent;
    end;

  PMain.Items.Add(ACreateMenuItem(ACaption, AOnJump));
end;

procedure TFrmCostSourceSummary.CheckOpenDataSet;
begin
  if Assigned(IQRecordViewPanel1.DataSource) and
    Assigned(IQRecordViewPanel1.DataSource.DataSet) then
    IQRecordViewPanel1.DataSource.DataSet.Active := True;
end;

end.
