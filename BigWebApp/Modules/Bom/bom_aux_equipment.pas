unit bom_aux_equipment;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
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
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniMainMenu, uniComboBox, uniDBComboBox,
  uniGUIFrame;

type
  TFrmAuxiliaryEquipment = class(TUniForm)
    SrcAux: TDataSource;
    wwQryAux: TFDQuery;
    wwQryAuxAUX_DESC: TStringField;
    wwQryAuxAUX_RATE: TBCDField;
    wwQryAuxHOW_MANY: TBCDField;
    wwQryAuxEPLant_ID_Disp: TFloatField;
    wwQryAuxEPLANT_ID: TBCDField;
    wwQryAuxDivisionName: TStringField;
    wwQryAuxDIVISION_ID: TBCDField;
    wwQryAuxID: TBCDField;
    wwQryAuxDIVISION_NAME: TStringField;
    UpdateSQLAux: TFDUpdateSQL;
    Panel1: TUniPanel;
    Panel6: TUniPanel;
    srchAux: TIQUniGridControl;
    QryDivisionLookup: TFDQuery;
    QryDivisionLookupNAME: TStringField;
    QryDivisionLookupDESCRIP: TStringField;
    QryDivisionLookupID: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SecurityRegister1: TIQWebSecurityRegister;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    SrcQryDivisionLookup: TDataSource;
    //IQWebSecurityRegister1: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryAuxBeforePost(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  Sys_Share;

{constructor TFrmAuxiliaryEquipment.Create(AOwner: TComponent);
begin
  inherited;
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  Sys_Share.CheckReplaceDivisionOfWWSelected( srchAux.Selected );
  Sys_Share.CheckReplaceDivisionOfWWSelected( wwDBLookupComboDivision.Selected );
end;      }

class procedure TFrmAuxiliaryEquipment.DoShow;
var
  LFrmAuxiliaryEquipment:TFrmAuxiliaryEquipment;
begin
  LFrmAuxiliaryEquipment := TFrmAuxiliaryEquipment.create(UniGUIApplication.UniApplication);
  LFrmAuxiliaryEquipment.Show;
end;

procedure TFrmAuxiliaryEquipment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;


procedure TFrmAuxiliaryEquipment.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  { TODO -oysingh -cWebConvert : No such property for datasource and combo box }
  //Sys_Share.CheckReplaceDivisionOfWWSelected( srchAux.Selected );
  //Sys_Share.CheckReplaceDivisionOfWWSelected( wwDBLookupComboDivision.Selected );
end;

procedure TFrmAuxiliaryEquipment.wwQryAuxBeforePost(DataSet: TDataSet);
begin
  IQAssignNewID( wwQryAuxID, 'AUX' );
end;

procedure TFrmAuxiliaryEquipment.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);
  RefreshDataSetByID(DataSet);  // to refresh eplant_id
end;

(*procedure TFrmAuxiliaryEquipment.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end; *)

procedure TFrmAuxiliaryEquipment.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAuxiliaryEquipment.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

end.
