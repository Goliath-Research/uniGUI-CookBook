unit IQMS.Common.RollBack;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.UI.Intf,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmRollBack = class(TUniForm)
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    grid: TIQUniGridControl;
    SrcRollBack: TDataSource;
    TblRollBack: TFDTable;
    QryTblSpaceName: TFDQuery;
    cmbTableSpaceName: TUniDBLookupComboBox;
    QryTblSpaceNameTABLESPACE_NAME: TStringField;
    TblRollBackID: TBCDField;
    TblRollBackSEGMENT_NAME: TStringField;
    TblRollBackTABLESPACE_NAME: TStringField;
    TblRollBackINIT_SIZE: TBCDField;
    TblRollBackNEXT_EXT: TBCDField;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    cmbSegmentName: TUniDBLookupComboBox;
    wwRBNames: TFDQuery;
    wwRBNamesMODULE: TStringField;
    wwRBNamesACTION: TStringField;
    wwRBNamesSEGMENT_NAME: TStringField;
    SrcTblSpaceName: TDataSource;
    SrcRBNames: TDataSource;
    procedure TblRollBackBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoIqRollBack;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoIqRollBack;
begin
  with TFrmRollBack.Create(uniGUIApplication.UniApplication) do Show;
end;

{ TFrmRollBack }

procedure TFrmRollBack.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, grid]);
end;

procedure TFrmRollBack.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, grid]);
end;

procedure TFrmRollBack.TblRollBackBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmRollBack.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( true, self );
end;

procedure TFrmRollBack.SRAfterApply(Sender: TObject);
begin
//  IQMS.Common.Controls.AutoSizeNavBar(Nav);
  cmbSegmentName.Visible := False;
  cmbTableSpaceName.Visible := False;
end;

procedure TFrmRollBack.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmRollBack.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRollBack.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRollBack.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
