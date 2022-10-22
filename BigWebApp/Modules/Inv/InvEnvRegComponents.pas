unit InvEnvRegComponents;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Buttons,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvEnvRegComponents = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcArinvtCAS: TDataSource;
    QryArinvtCAS: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    sbtnCAS: TUniSpeedButton;
    QryArinvtCASCOMMENT1: TStringField;
    QryArinvtCASCasName: TStringField;
    QryArinvtCASCasDescrip: TStringField;
    wwDBComboDlgCAS: TUniEdit;
    PkCAS: TIQWebHPick;
    PkCASID: TFloatField;
    PkCASCASNO: TStringField;
    PkCASDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    QryArinvtCASPERCENT: TFMTBCDField;
    QryArinvtCASID: TBCDField;
    QryArinvtCASARINVT_ID: TBCDField;
    QryArinvtCASCAS_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvtCASBeforePost(DataSet: TDataSet);
    procedure QryArinvtCASNewRecord(DataSet: TDataSet);
    procedure sbtnCASClick(Sender: TObject);
    procedure wwDBComboDlgCASCustomDlg(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryArinvtCASBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryArinvtCASCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShowModal(AArinvt_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  InvCAS,
{ TODO -oGPatil -cWebConvert : Dependency
  IQSecIns,  }
  IQMS.Common.HelpHook;

class procedure TFrmInvEnvRegComponents.DoShowModal(AArinvt_ID: Real);
var
  LFrmInvEnvRegComponents : TFrmInvEnvRegComponents;
begin
  LFrmInvEnvRegComponents := TFrmInvEnvRegComponents.Create(UniGUIApplication.UniApplication);
  LFrmInvEnvRegComponents.Arinvt_ID := AArinvt_ID;
  LFrmInvEnvRegComponents.ShowModal;
end;

procedure TFrmInvEnvRegComponents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBgrid1 ]);
end;

procedure TFrmInvEnvRegComponents.QryArinvtCASBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( QryArinvtCAS, 'arinvt_cas');
end;

procedure TFrmInvEnvRegComponents.QryArinvtCASNewRecord(DataSet: TDataSet);
begin
  TFDQuery(Dataset).FieldByName('arinvt_id').asFloat:= FArinvt_ID;
end;

procedure TFrmInvEnvRegComponents.sbtnCASClick(Sender: TObject);
begin
  TFrmInvCAS.DoShow;  // InvCAS.pas
end;

procedure TFrmInvEnvRegComponents.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvEnvRegComponents.UniFormCreate(Sender: TObject);
begin
 IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvEnvRegComponents.wwDBComboDlgCASCustomDlg(
  Sender: TObject);
begin
  if PkCAS.Execute then
  begin
    QryArinvtCAS.Edit;
    QryArinvtCasCAS_ID.asFloat:= PkCAS.GetValue('id');
  end;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvEnvRegComponents.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button );
end;   }

procedure TFrmInvEnvRegComponents.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmInvEnvRegComponents.QryArinvtCASBeforeOpen(
  DataSet: TDataSet);
begin
  TFDQuery(Dataset).ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmInvEnvRegComponents.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  EnsureSecurityInspectorOnTopOf( self );   }
end;

procedure TFrmInvEnvRegComponents.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmInvEnvRegComponents.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmInvEnvRegComponents.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmInvEnvRegComponents.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvEnvRegComponents.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvEnvRegComponents.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvEnvRegComponents.QryArinvtCASCalcFields(DataSet: TDataSet);
begin
  if QryArinvtCASCAS_ID.asFloat > 0 then
  begin
     QryArinvtCASCasName.asString:= SelectValueByID('CASNO', 'CAS', QryArinvtCASCAS_ID.asFloat);
     QryArinvtCASCasDescrip.asString:= SelectValueByID('DESCRIP', 'CAS', QryArinvtCASCAS_ID.asFloat);
  end;

end;

end.
