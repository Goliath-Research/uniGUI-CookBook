unit pm_user_fields_dlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.UserDefinedLabel,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
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
  uniMainMenu, uniLabel;

type
  TFrmPMUserFields = class(TUniForm)
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
    PnlClient02: TUniPanel;
    dbeNote1: TUniDBEdit;
    dbeNote2: TUniDBEdit;
    dbeNote3: TUniDBEdit;
    dbeNote4: TUniDBEdit;
    dbeNote5: TUniDBEdit;
    dbeNote6: TUniDBEdit;
    dbeValue1: TUniDBEdit;
    dbeValue2: TUniDBEdit;
    dbeValue3: TUniDBEdit;
    dbeValue4: TUniDBEdit;
    dbeValue5: TUniDBEdit;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    IQUserDefLabel4: TIQWebUserDefLabel;
    IQUserDefLabel5: TIQWebUserDefLabel;
    IQUserDefLabel6: TIQWebUserDefLabel;
    IQUserDefLabel7: TIQWebUserDefLabel;
    IQUserDefLabel8: TIQWebUserDefLabel;
    IQUserDefLabel9: TIQWebUserDefLabel;
    IQUserDefLabel10: TIQWebUserDefLabel;
    IQUserDefLabel11: TIQWebUserDefLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DoGetOwnerName(Sender: TObject; var AOwnerName: string);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOwnerName: string;
    procedure RefreshLabels;
  public
    { Public declarations }
    FDataSet: TDataSet;
    property OwnerName: string read FOwnerName write FOwnerName;
  end;

procedure DoPMUserFields(ADataSet: TDataSet; AOwnerName: string);

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.RegFrm;

procedure DoPMUserFields(ADataSet: TDataSet; AOwnerName: string);
var
  FrmPMUserFields: TFrmPMUserFields;
begin
  FrmPMUserFields := TFrmPMUserFields.Create(uniGUIApplication.uniApplication);
  with FrmPMUserFields do
  begin
    FDataSet := ADataSet;
    Src.DataSet := ADataSet;
    OwnerName := AOwnerName;
    Show;
  end;
end;

procedure TFrmPMUserFields.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPMUserFields.FormCreate(Sender: TObject);
begin
  FDataSet.CheckBrowseMode;
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] pm_user_fields_dlg.pas(122): E2010 Incompatible types: 'TForm' and 'TFrmPMUserFields'}
  //IQMS.Common.Controls.CenterForm(self);
  IQRegFormRead(self, [self]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;

procedure TFrmPMUserFields.FormShow(Sender: TObject);
begin
  RefreshLabels;
end;

procedure TFrmPMUserFields.RefreshLabels;
var
  i: Integer;
begin
  for i := 0 to PnlLeft01.ControlCount - 1 do
    if PnlLeft01.Controls[i] is TIQWebUserDefLabel then
      TIQWebUserDefLabel(PnlLeft01.Controls[i]).AssignFromTable;
end;

procedure TFrmPMUserFields.DoGetOwnerName(Sender: TObject;
  var AOwnerName: string);
begin
  if Trim(FOwnerName) > '' then
    AOwnerName := FOwnerName
  else
    AOwnerName := Format('%s_%s', [name, 'PMEQMT']);
end;

procedure TFrmPMUserFields.btnOkClick(Sender: TObject);
begin
  FDataSet.CheckBrowseMode;
  Close;
end;

procedure TFrmPMUserFields.btnCancelClick(Sender: TObject);
begin
  FDataSet.Cancel;
  Close;
end;

procedure TFrmPMUserFields.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

procedure TFrmPMUserFields.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmBOM { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

end.
