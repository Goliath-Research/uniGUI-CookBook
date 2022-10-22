unit cc_logfilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  cc_log,
  Data.DB,
  Vcl.CheckLst,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, Vcl.StdCtrls, uniComboBox, uniDBComboBox;

type
  TLogFilter = record
    LogClasses: TLogClasses;
    LogSources: TLogSources;
    AllClasses: Boolean;
    AllSources: Boolean;
    UserID: string;
    HideArchived: Boolean;
  end;

type
  TFrmCCLogFilter = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    lblUserID: TUniLabel;
    SrcUsers: TDataSource;
    QryUsers: TFDQuery;
    QryUsersUSER_ID: TStringField;
    cmbUserID: TUniDBLookupComboBox;
    chkAllUsers: TUniCheckBox;
    chkPkHide: TUniCheckBox;
    chkAllSources: TUniCheckBox;
    chkAllClasses: TUniCheckBox;
    PList: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    UnselectAll1: TUniMenuItem;
    lstClass: TCheckListBox;
    lstSource: TCheckListBox;
    procedure chkAllUsersClick(Sender: TObject);
    procedure chkAllSourcesClick(Sender: TObject);
    procedure chkAllClassesClick(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure UnselectAll1Click(Sender: TObject);
    procedure PListPopup(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FLogFilter: TLogFilter;
    { Private declarations }
    procedure LoadLists;
    procedure SetControls;
    procedure UpdateFilterRec(var ALogFilter: TLogFilter);
    procedure ApplyFilterRecToScreen(ALogFilter: TLogFilter);
    procedure SetLogFilter(const Value: TLogFilter);
  public
    { Public declarations }
    property LogFilter: TLogFilter write SetLogFilter;
  end;

function GetLogFilter(var ALogFilter: TLogFilter): Boolean;

implementation

{$R *.dfm}

uses
  cc_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

function GetLogFilter(var ALogFilter: TLogFilter): Boolean;
var
  LFrmCCLogFilter : TFrmCCLogFilter;
begin
  LFrmCCLogFilter := TFrmCCLogFilter.Create(UniGUIApplication.UniApplication);
  with LFrmCCLogFilter do
  begin
    LogFilter := ALogFilter;
    Result := ShowModal = mrOk;
    if Result then
      UpdateFilterRec(ALogFilter);
    end;
end;

procedure TFrmCCLogFilter.FormShow(Sender: TObject);
begin
  LoadLists;
  ReOpen(QryUsers);
  ApplyFilterRecToScreen(FLogFilter);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlClient02);
  SetControls;
  { TODO : Incompatible types: 'TForm' and 'TFrmCCLogFilter' }
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmCCLogFilter.LoadLists;
var
  i: Integer;
begin
{ TODO : TCheckListBox not yet converted }
  {lstSource.Items.Clear;
  for i := 1 to Ord(high(LogSourceStr)) do
    lstSource.Items.Add(LogSourceStr[TLogSource(i)]);  }
  { TODO : TCheckListBox not yet converted }
  {lstClass.Items.Clear;
  for i := 1 to Ord(high(LogClassStr)) do
    lstClass.Items.Add(LogClassStr[TLogClass(i)]);   }
end;

procedure TFrmCCLogFilter.SetControls;
begin
  IQMS.Common.Controls.IQEnableControl([lblUserID, cmbUserID], not chkAllUsers.Checked);
  { TODO : TCheckListBox not yet converted }
 { if chkAllSources.Checked then
    IQMS.Common.Controls.CheckItems(lstSource, True);
  IQMS.Common.Controls.IQEnableControl(lstSource, not chkAllSources.Checked);   }

  { TODO : TCheckListBox not yet converted }
  {if chkAllClasses.Checked then
    IQMS.Common.Controls.CheckItems(lstClass, True);
  IQMS.Common.Controls.IQEnableControl(lstClass, not chkAllClasses.Checked); }

end;

procedure TFrmCCLogFilter.SetLogFilter(const Value: TLogFilter);
begin
  FLogFilter := Value;
end;

procedure TFrmCCLogFilter.chkAllUsersClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCCLogFilter.UpdateFilterRec(var ALogFilter: TLogFilter);
var
  i: Integer;
begin
  // Get the user selections

  // Update the source filter
  ALogFilter.LogSources := [];
  ALogFilter.AllSources := chkAllSources.Checked;
  { TODO : TCheckListBox not yet converted }
  {for i := 0 to lstSource.Count - 1 do
    if lstSource.Checked[i] then
      Include(ALogFilter.LogSources, TLogSource(i + 1));   }

  // Update the class filter
  ALogFilter.LogClasses := [];
  ALogFilter.AllClasses := chkAllClasses.Checked;
  { TODO : TCheckListBox not yet converted }
 { for i := 0 to lstClass.Count - 1 do
    if lstClass.Checked[i] then
      Include(ALogFilter.LogClasses, TLogClass(i + 1));      }

  ALogFilter.UserID := IQMS.Common.Numbers.sIIf(chkAllUsers.Checked, '', cmbUserID.Text);
  ALogFilter.HideArchived := not chkPkHide.Checked;
end;

procedure TFrmCCLogFilter.ApplyFilterRecToScreen(ALogFilter: TLogFilter);
var
  i: Integer;
begin
  { TODO : TCheckListBox not yet converted }
  //IQMS.Common.Controls.CheckItems(lstClass, False);
  chkAllClasses.Checked := ALogFilter.AllClasses;
  { TODO : TCheckListBox not yet converted }
  {if not ALogFilter.AllClasses then
    for i := 1 to Ord(high(TLogClass)) do
      if (TLogClass(i) in ALogFilter.LogClasses) then
        lstClass.Checked[i - 1] := True;   }
  { TODO : TCheckListBox not yet converted }
  //IQMS.Common.Controls.CheckItems(lstSource, False);
  chkAllSources.Checked := ALogFilter.AllSources;
  { TODO : TCheckListBox not yet converted }
  {if not ALogFilter.AllSources then
    for i := 1 to Ord(high(TLogSource)) do
      if (TLogSource(i) in ALogFilter.LogSources) then
        lstSource.Checked[i - 1] := True;     }

  cmbUserID.Text := ALogFilter.UserID;
  chkPkHide.Checked := not ALogFilter.HideArchived;

  SetControls;
end;

procedure TFrmCCLogFilter.chkAllSourcesClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCCLogFilter.chkAllClassesClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCCLogFilter.SelectAll1Click(Sender: TObject);
begin
  if (PList.PopupComponent is TCheckListBox) then
    with (PList.PopupComponent as TCheckListBox) do
      if Enabled then
        IQMS.Common.Controls.CheckItems(PList.PopupComponent as TCheckListBox, True);
end;

procedure TFrmCCLogFilter.UnselectAll1Click(Sender: TObject);
begin
  if (PList.PopupComponent is TCheckListBox) then
    with (PList.PopupComponent as TCheckListBox) do
      if Enabled then
        IQMS.Common.Controls.CheckItems(PList.PopupComponent as TCheckListBox, False);
end;

procedure TFrmCCLogFilter.PListPopup(Sender: TObject);
begin
  if (PList.PopupComponent is TCheckListBox) then
    with (PList.PopupComponent as TCheckListBox) do
      begin
        SelectAll1.Enabled := Enabled;
        UnselectAll1.Enabled := Enabled;
      end;
end;

procedure TFrmCCLogFilter.btnOkClick(Sender: TObject);
begin
  { TODO : TCheckListBox not yet converted }
  {if (IQMS.Common.Controls.CheckedItems(lstSource) = 0) and not chkAllSources.Checked then
    // cc_rscstr.cTXT0000713 = 'Please select a source filter.';
    raise Exception.Create(cc_rscstr.cTXT0000713); }

    { TODO : TCheckListBox not yet converted }
  {if (IQMS.Common.Controls.CheckedItems(lstClass) = 0) and not chkAllClasses.Checked then
    // cc_rscstr.cTXT0000714 = 'Please select a class filter.';
    raise Exception.Create(cc_rscstr.cTXT0000714);  }

  ModalResult := mrOk;
end;

end.
