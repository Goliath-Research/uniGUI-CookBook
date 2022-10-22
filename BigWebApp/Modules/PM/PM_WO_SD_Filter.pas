unit PM_WO_SD_Filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  pm_types,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, Vcl.ExtCtrls;

type
  // TPM_WO_Filter_Type = (wfNone, wfOpen, wfClosed);

  TFrmPM_WO_SD_Filter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    GroupBox1: TUniGroupBox;
    Panel3: TUniPanel;
    sbtnAll: TUniSpeedButton;
    sbtnOpen: TUniSpeedButton;
    sbtnClosed: TUniSpeedButton;
    procedure Help1Click(Sender: TObject);
    procedure DoOptionBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetSelectedIndex: Integer;
    procedure SetSelectedIndex(const Value: Integer);

  public
    { Public declarations }
    property SelectedIndex: Integer read GetSelectedIndex write SetSelectedIndex;
  end;

function GetPM_WO_SD_Filter(var AFilter: TPMWOFilterType): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Numbers;

function GetPM_WO_SD_Filter(var AFilter: TPMWOFilterType): Boolean;
var
  frm: TFrmPM_WO_SD_Filter;
begin
  frm := TFrmPM_WO_SD_Filter.Create(uniGUIApplication.UniApplication);
  frm.SelectedIndex := Ord(AFilter);

  Result := (frm.ShowModal = mrOK);
  if Result then
    AFilter := TPMWOFilterType(frm.SelectedIndex);

end;

procedure TFrmPM_WO_SD_Filter.UniFormCreate(Sender: TObject);
begin
//  IQMS.Common.Controls.PrepareButtonFrames([sbtnAll, sbtnOpen, sbtnClosed]);
//  IQMS.Common.Controls.FrameButtonsIfDown([sbtnAll, sbtnOpen, sbtnClosed]);
//  IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmPM_WO_SD_Filter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Action := caFree;
end;

procedure TFrmPM_WO_SD_Filter.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmPM_WO_SD_Filter.DoOptionBtnClick(Sender: TObject);
begin
//  IQMS.Common.Controls.FrameButtonsIfDown([sbtnAll, sbtnOpen, sbtnClosed]);
end;

function TFrmPM_WO_SD_Filter.GetSelectedIndex: Integer;
begin
  if sbtnAll.Down then
    Result := 0
  else if sbtnOpen.Down then
    Result := 1
  else if sbtnClosed.Down then
    Result := 2
  else
    Result := 0;
end;

procedure TFrmPM_WO_SD_Filter.SetSelectedIndex(const Value: Integer);
begin
  sbtnAll.Down := (Value = 0);
  sbtnOpen.Down := (Value = 1);
  sbtnClosed.Down := (Value = 2);
end;

end.
