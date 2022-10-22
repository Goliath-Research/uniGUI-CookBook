unit IQMS.Common.UserFields;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.UserDefinedLabel,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UDComboBox,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu, uniMultiItem, uniComboBox, uniDBComboBox, uniLabel, Vcl.Controls;

type
  TFrmUserFields = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Src: TDataSource;
    PopupUserDefLabel: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    PnlMain: TUniPanel;
    sbMain: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    IQUserDefLabel1UserFields: TIQWebUserDefLabel;
    IQUserDefLabel2UserFields: TIQWebUserDefLabel;
    IQUserDefLabel3UserFields: TIQWebUserDefLabel;
    IQUserDefLabel4UserFields: TIQWebUserDefLabel;
    IQUserDefLabel5UserFields: TIQWebUserDefLabel;
    IQUserDefLabel6UserFields: TIQWebUserDefLabel;
    IQUserDefLabel7UserFields: TIQWebUserDefLabel;
    IQUserDefLabel8UserFields: TIQWebUserDefLabel;
    IQUserDefLabel9UserFields: TIQWebUserDefLabel;
    IQUserDefLabel10UserFields: TIQWebUserDefLabel;
    IQUserDefLabel11UserFields: TIQWebUserDefLabel;
    PnlClient02: TUniPanel;
    dbeNote1: TIQWebUDComboBox;
    dbeNote2: TIQWebUDComboBox;
    dbeNote3: TIQWebUDComboBox;
    dbeNote4: TIQWebUDComboBox;
    dbeNote5: TIQWebUDComboBox;
    dbeNote6: TIQWebUDComboBox;
    dbeValue1: TUniDBEdit;
    dbeValue2: TUniDBEdit;
    dbeValue3: TUniDBEdit;
    dbeValue4: TUniDBEdit;
    dbeValue5: TUniDBEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure IQUserDefLabel1UserFieldsGetOwnerName(Sender: TObject;
      var AOwnerName: String);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Close1Click(Sender: TObject);
  private
    { Private declarations }
    FParentAppName: string;
    FOwnerName: string;
    FTableName: string;
    FTable: TDataSet;
    procedure SetParentAppName(const Value: string);
  public
    { Public declarations }
    constructor Create(ATable: TDataSet);
    procedure RefreshLabels;
    property ParentAppName: string read FParentAppName write SetParentAppName;
    property OwnerName: string read FOwnerName write FOwnerName;
    property TableName: string read FTableName write FTableName;
  end;

procedure DoUserFields( ATable: TDataSet);


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.RegFrm;

procedure DoUserFields(ATable: TDataSet);
begin
  TFrmUserFields.Create(ATable).Show;
end;

{ TFrmUserFields }

constructor TFrmUserFields.Create(ATable: TDataSet);
begin
  FTable := ATable;
  inherited Create(uniGUIApplication.UniApplication);
  ATable.CheckBrowseMode;
  Src.DataSet := ATable;
end;

procedure TFrmUserFields.FormCreate(Sender: TObject);
begin
//  IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead(Self, [Self]);
//  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);

  if (FTable is TFDTable) then
    FTableName := TFDTable(FTable).TableName
  else if (FTable is TFDQuery) then
    FTableName := TFDQuery(FTable).UpdateOptions.UpdateTableName
  else
    PostMessage(Handle, WM_COMMAND, Close1.Command, 0);

  if FTableName > '' then
    begin
      SR.SecurityCode := Format('%s_%s', [Name, FTableName]);
      SR.Refresh;
    end;
end;

procedure TFrmUserFields.FormShow(Sender: TObject);
begin
  RefreshLabels;
end;

procedure TFrmUserFields.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmUserFields.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUserFields.IQUserDefLabel1UserFieldsGetOwnerName(Sender: TObject;
  var AOwnerName: String);
begin
  if Trim(FOwnerName) > '' then
    AOwnerName := FOwnerName
  else
    AOwnerName := Format('%s_%s', [Name, FTableName]);
end;

procedure TFrmUserFields.RefreshLabels;
var
  i: Integer;
begin
  for i := 0 to PnlLeft01.ControlCount - 1 do
    if PnlLeft01.Controls[i] is TIQWebUserDefLabel then
      TIQWebUserDefLabel(PnlLeft01.Controls[i]).AssignFromTable;
end;

procedure TFrmUserFields.SetParentAppName(const Value: string);
var
  i: Integer;
begin
  FParentAppName := Value;
  if Trim(Value) > '' then
    for i := 0 to PnlLeft01.ControlCount - 1 do
      if PnlLeft01.Controls[i] is TIQWebUserDefLabel then
        TIQWebUserDefLabel(PnlLeft01.Controls[i]).ParentAppName := Value;
end;

procedure TFrmUserFields.btnOkClick(Sender: TObject);
begin
  FTable.CheckBrowseMode;
  Close;
end;

procedure TFrmUserFields.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
  Close;
end;

procedure TFrmUserFields.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmUserFields.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } ); { IQMS.Common.HelpHook.pas }
end;

end.
