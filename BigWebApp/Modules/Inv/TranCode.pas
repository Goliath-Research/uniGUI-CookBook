unit TranCode;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniComboBox,
  uniDBComboBox,
  IQUniGrid,
  uniGUIFrame;

type
  TFrmTransCodes = class(TUniForm)
    DataSource1: TDataSource;
    QryGlAcct: TFDQuery;
    QryGlAcctACCT: TStringField;
    QryGlAcctDESCRIP: TStringField;
    QryGlAcctEPLANT_ID: TBCDField;
    QryGlAcctID: TBCDField;
    DBGrid1: TIQUniGridControl;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    wwDBComboDlgEPlant_ID: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    AssignAcctviaPickList1: TUniMenuItem;
    PKAcct: TIQWebHPick;
    PKAcctID: TBCDField;
    PKAcctACCT: TStringField;
    PKAcctDESCRIP: TStringField;
    PKAcctTYPE: TStringField;
    PKAcctEPLANT_ID: TBCDField;
    FDQryTransCode: TFDQuery;
    FDQryTransCodeCODE: TStringField;
    FDQryTransCodeDESCRIP: TStringField;
    FDQryTransCodeEPLANT_ID: TBCDField;
    FDQryTransCodeID: TBCDField;
    FDQryTransCodeGLACCT_ID: TBCDField;
    FDQryTransCodeAcct: TStringField;
    SrcQryGlAcct: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure QryGlAcctBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure wwDBComboDlgEPlant_IDCustomDlg(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Table1BeforeOpen(DataSet: TDataSet);
    procedure AssignAcctviaPickList1Click(Sender: TObject);
    procedure Table1CalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
    { TODO -oSanketG -cWebConvert : Need to revisit after correcting OnCloseUp event paramter list of wwDBLookupCombo1}
//    procedure wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
//      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTransCodes;



implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoTransCodes;
var
  FrmTransCodes: TFrmTransCodes;
begin
  FrmTransCodes := TFrmTransCodes.Create(uniGUIApplication.UniApplication);
  FrmTransCodes.ShowModal;
end;

procedure TFrmTransCodes.FormCreate(Sender: TObject);
begin
  { TODO -oSanketG -cWeb : Need to revisit: Incompatible Types: 'TForm' and 'TFrmTransCodes' }
  //CenterForm(Self); // IQMS.Common.Controls.pas; default position
  IQRegFormRead(self, [ self, DBGrid1 ]);
end;

procedure TFrmTransCodes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, DBGrid1 ]);
end;

procedure TFrmTransCodes.Table1BeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet, TRUE );
end;

procedure TFrmTransCodes.Table1BeforePost(DataSet: TDataSet);
begin
  FDQryTransCodeCODE.asString:= UpperCase( FDQryTransCodeCODE.asString );
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmTransCodes.Table1CalcFields(DataSet: TDataSet);
begin
  if FDQryTransCodeGLACCT_ID.asFloat <> 0 then
    FDQryTransCodeAcct.asString :=  SelectValueFmtAsString('select acct from glacct ' +
                                      ' where id = plugins.get_glacct_no_name(%f, misc.geteplantid)', [FDQryTransCodeGLACCT_ID.asFloat]);
end;

procedure TFrmTransCodes.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmTransCodes.wwDBComboDlgEPlant_IDCustomDlg(Sender: TObject);
begin
  { TODO -oSanketG -cWeb : Need to revisit after SetPlant file conversion}
  //DoChangePlantID( self, FDQryTransCode ); // SetPlant.pas
end;

{ TODO -oSanketG -cWebConvert : Need to revisit after correcting OnCloseUp event paramter list of wwDBLookupCombo1}
{procedure TFrmTransCodes.wwDBLookupCombo1CloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
    if not (FDQryTransCode.State in [dsInsert, dsEdit]) then
      FDQryTransCode.Edit;
    FDQryTransCodeGLACCT_ID.asFloat := QryGlAcctID.AsFloat;
  end;
end;}

procedure TFrmTransCodes.QryGlAcctBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmTransCodes.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTransCodes.AssignAcctviaPickList1Click(Sender: TObject);
begin
  IQPickAndReplace( FDQryTransCodeGLACCT_ID, PkAcct, 'ID' )
end;

procedure TFrmTransCodes.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTransCodes.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
