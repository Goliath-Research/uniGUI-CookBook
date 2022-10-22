unit tax_classes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmTaxClasses = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    qryTaxClass: TFDQuery;
    srcTaxClass: TDataSource;
    qryTaxClassID: TBCDField;
    qryTaxClassCODE: TStringField;
    qryTaxClassDESCRIPTION: TStringField;
    FDUpdateTaxClass: TFDUpdateSQL;
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    sbtnAddDefault: TUniSpeedButton;
    qryTaxClassINFORMATION: TStringField;
    qryTaxClassSST: TStringField;
    wwDBComboDlgInfo: TUniEdit;
    sbtnWebTaxCode: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAddDefaultClick(Sender: TObject);
    procedure wwDBComboDlgInfoCustomDlg(Sender: TObject);
    procedure sbtnWebTaxCodeClick(Sender: TObject);
    procedure qryTaxClassBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

procedure DoTaxClasses(AOwner: TComponent);

var
  FrmTaxClasses: TFrmTaxClasses;

implementation

uses
  EditMemoStr,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  PanelMsg,
  IQMS.Common.Miscellaneous;

{$R *.dfm}
procedure DoTaxClasses(AOwner: TComponent);
begin
  with TFrmTaxClasses.Create(AOwner) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

{ TFrmTaxUsageTypes }

constructor TFrmTaxClasses.Create(AOwner: TComponent);
begin
  inherited;
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmTaxClasses.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  Action:= caFree;
end;

procedure TFrmTaxClasses.qryTaxClassBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'TAX_CLASS');
end;

procedure TFrmTaxClasses.sbtnAddDefaultClick(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
    hMsg := hPleaseWait('Populating defaults.  Please wait...');
    try
      ExecuteCommand('begin tax_code.populate_default_tax_classes; end;');
      ReOpen(qryTaxClass);
    finally
     if Assigned(hMsg) then FreeAndNil(hMsg);
    end;
end;

procedure TFrmTaxClasses.sbtnWebTaxCodeClick(Sender: TObject);
begin
  ExecuteProgram( 'https://taxcode.avatax.avalara.com', SW_SHOWDEFAULT, '' ); {IQMisc}
end;

procedure TFrmTaxClasses.wwDBComboDlgInfoCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= qryTaxClassINFORMATION.AsString;
  if DoEditMemoStr( self, S, 1000, qryTaxClassINFORMATION.DisplayLabel ) then    {EditMemoStr.pas}
  begin
    qryTaxClass.Edit;
    qryTaxClassINFORMATION.asString:= S;
  end;
end;

end.
