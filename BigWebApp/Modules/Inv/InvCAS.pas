unit InvCAS;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvCAS = class(TUniForm)
    Panel1: TUniPanel;
    SrcCAS: TDataSource;
    QryCAS: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryCASCASNO: TStringField;
    QryCASDESCRIP: TStringField;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Panel3: TUniPanel;
    wwDBGrid2: TIQUniGridControl;
    Label1: TUniLabel;
    sbtnRegulations: TUniSpeedButton;
    SrcCasEnvReg: TDataSource;
    QryCasEnvReg: TFDQuery;
    UpdateSQL2: TFDUpdateSQL;
    QryCasEnvRegEnvRegName: TStringField;
    QryCasEnvRegEnvRegDescrip: TStringField;
    Splitter1: TUniSplitter;
    wwDBComboDlgRegNo: TUniEdit;
    PkEnvReg: TIQWebHPick;
    PkEnvRegID: TFloatField;
    PkEnvRegREGNO: TStringField;
    PkEnvRegDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    sbtnInvClassMSDS: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Options1: TUniMenuItem;
    InventoryClassMSDSSetup1: TUniMenuItem;
    MSDSTracking1: TUniMenuItem;
    QryCASID: TBCDField;
    QryCasEnvRegID: TBCDField;
    QryCasEnvRegCAS_ID: TBCDField;
    QryCasEnvRegENV_REG_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCASBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);   }
    procedure sbtnRegulationsClick(Sender: TObject);
    procedure QryCasEnvRegBeforePost(DataSet: TDataSet);
    procedure QryCasEnvRegNewRecord(DataSet: TDataSet);
    procedure wwDBComboDlgRegNoCustomDlg(Sender: TObject);
    procedure PostParents(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure sbtnInvClassMSDSClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure InventoryClassMSDSSetup1Click(Sender: TObject);
    procedure MSDSTracking1Click(Sender: TObject);
    procedure QryCasEnvRegCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMSDSTrackingEnabled: Boolean;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  InvEnvReg,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook,
  IQMS.Common.PanelMsg;
{ TODO -oGPatil -cWebConvert : Dependency
  ClassLstMSDS;  }

{ TFrmInvEnvRegulations }

class procedure TFrmInvCAS.DoShow;
var
  LFrmInvCAS : TFrmInvCAS;
begin
  LFrmInvCAS := TFrmInvCAS.Create(UniGUIApplication.UniApplication);
  LFrmInvCAS.Show;
end;

procedure TFrmInvCAS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormRead( self, [ self, wwDBgrid1 ]);
end;

procedure TFrmInvCAS.InventoryClassMSDSSetup1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  DoClassListMSDS;  }
end;

procedure TFrmInvCAS.MSDSTracking1Click(Sender: TObject);
var
   hMsg        : TPanelMesg; {PanelMsg}
begin
  if FMSDSTrackingEnabled then
    begin
      if IQMS.Common.Dialogs.IQConfirmYN('Are you sure you want to disable MSDS Tracking?') then
      begin
        ExecuteCommand('update iqsys2 set msds_tracking = ''N''');
        MSDSTracking1.Caption := 'Enable MSDS Tracking';
        FMSDSTrackingEnabled := false;
      end;
    end
  else
    begin
      if IQMS.Common.Dialogs.IQConfirmYN('Are you sure you want to enable MSDS Tracking? This could take a while.') then
      begin
        hMsg:= hPleaseWait('Enabling MSDS Tracking');
          try
            ExecuteCommand('update iqsys2 set msds_tracking = ''Y''');
            MSDSTracking1.Caption := 'Disable MSDS Tracking';
            FMSDSTrackingEnabled := true;
            ExecuteCommand('begin msds.enable_msds_tracking; end;');
          finally
            hMsg.Free;
          end;
      end;
    end;

end;

procedure TFrmInvCAS.QryCASBeforePost(DataSet: TDataSet);
begin
  QryCasCASNO.asString:= UpperCase(QryCasCASNO.asString);
  IQAssignIDBeforePost( QryCAS, 'cas');
end;

procedure TFrmInvCAS.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvCAS.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button );
end;   }

procedure TFrmInvCAS.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvCAS.sbtnInvClassMSDSClick(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  DoClassListMSDS;     }
end;

procedure TFrmInvCAS.sbtnRegulationsClick(Sender: TObject);
begin
  TFrmInvEnvRegulation.DoShow;  // InvEnvReg.pas
end;

procedure TFrmInvCAS.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  FMSDSTrackingEnabled := (SelectValueAsString('select msds_tracking from iqsys2') = 'Y');
  if FMSDSTrackingEnabled then
    MSDSTracking1.Caption := 'Disable MSDS Tracking'
  else
    MSDSTracking1.Caption := 'Enable MSDS Tracking';
end;

procedure TFrmInvCAS.QryCasEnvRegBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( QryCasEnvReg, 'cas_env_reg');
end;

procedure TFrmInvCAS.QryCasEnvRegNewRecord(DataSet: TDataSet);
begin
  QryCasEnvRegCAS_ID.asFloat:= QryCASID.asFloat;
end;

procedure TFrmInvCAS.wwDBComboDlgRegNoCustomDlg(Sender: TObject);
begin
  if PkEnvReg.Execute then
  begin
    QryCasEnvReg.Edit;
    QryCasEnvRegENV_REG_ID.asFloat:= PkEnvReg.GetValue('id');
  end;
end;

procedure TFrmInvCAS.PostParents(DataSet: TDataSet);
begin
  QryCAS.CheckBrowseMode;
end;

procedure TFrmInvCAS.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvCAS.QryCasEnvRegCalcFields(DataSet: TDataSet);
begin
  if QryCasEnvRegENV_REG_ID.asFloat > 0 then
  begin
     QryCasEnvRegEnvRegName.asString:= SelectValueByID('REGNO', 'ENV_REG', QryCasEnvRegENV_REG_ID.asFloat);
     QryCasEnvRegEnvRegDescrip.asString:= SelectValueByID('DESCRIP', 'ENV_REG', QryCasEnvRegENV_REG_ID.asFloat);
  end;
end;



end.
