unit FrAssign;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  IQMS.WebVcl.Search,
  DBCtrls,
  Menus,
  Db,
  Wwdatsrc,
  IQMS.WebVcl.About,
  Buttons,
  wwDialog,
  Wwfltdlg,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
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
  uniLabel, IQunigrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TFrmFrAssign = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryFr: TFDQuery;
    QryFrID: TBCDField;
    QryFrCODE: TStringField;
    QryFrDESCRIP: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtITEMNO: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCODE: TStringField;
    QryArinvtFR_DESCRIP: TStringField;
    IQAbout1: TIQWebAbout;
    wwFilterDialog1: TwwFilterDialog;
    sbtnFilter: TUniSpeedButton;
    AssignFrCode1: TUniMenuItem;
    N1: TUniMenuItem;
    QryArinvtID: TBCDField;
    ClearFrCode1: TUniMenuItem;
    PopupMenu1: TUniPopupMenu;
    AssignFrCode2: TUniMenuItem;
    ClearFrCode2: TUniMenuItem;
    QryArinvtEPLANT_ID: TBCDField;
    dbFr: TUniDBLookupComboBox;
    Label1: TUniLabel;
    SBAssign: TUniSpeedButton;
    Contents1: TUniMenuItem;
    QryArinvtCUSTNO: TStringField;
    QryArinvtCOMPANY: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure ClearFrCode1Click(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure SBAssignClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoFrGroupAssign();



implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook;

procedure DoFrGroupAssign();
var
  FrmFrAssign: TFrmFrAssign;
begin
  FrmFrAssign := TFrmFrAssign.Create(uniGUIApplication.uniApplication);
  FrmFrAssign.ShowModal;
end;

procedure TFrmFrAssign.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmFrAssign.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmFrAssign.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFrAssign.sbtnFilterClick(Sender: TObject);
begin
  wwFilterDialog1.Execute;
end;

procedure TFrmFrAssign.UniFormCreate(Sender: TObject);
begin

  IQRegFormRead( self, [self]);
end;

procedure TFrmFrAssign.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( True, self );
  dbFr.keyValue := QryFrID.asString;
end;

procedure TFrmFrAssign.ClearFrCode1Click(Sender: TObject);
var
  I:Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  {if IqSearch1.wwDBGrid.SelectedList.Count = 0 then
    IqSearch1.wwDBGrid.SelectRecord;}

  if not IqConfirmYN(Format('Do you wish to clear the Forecast Group Code(s) from the selected inventory items?',
     [QryFrCODE.AsString])) then Exit;

  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  {with IqSearch1.wwDBGrid, datasource.dataset do
  for I:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);
    ExecuteCommandFmt('update arinvt set fr_group_id = '''' where id = %f',
              [FieldByname('ID').asFloat]);
  end;}

  QryArinvt.Close;
  QryArinvt.Open;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  //IqSearch1.wwDBGrid.UnSelectAll;
end;

procedure TFrmFrAssign.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmFrAssign.SBAssignClick(Sender: TObject);
var
  I:Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  {if IqSearch1.wwDBGrid.SelectedList.Count = 0 then
    IqSearch1.wwDBGrid.SelectRecord;}

  if not IqConfirmYN(Format('Do you wish to assign the %s code to the selected inventory items?',
     [QryFrCODE.AsString])) then Exit;

  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  {with IqSearch1.wwDBGrid, IqSearch1.wwDBGrid.datasource.dataset do
  for I:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);
    ExecuteCommandFmt('update arinvt set fr_group_id = %f where id = %f',
              [QryFRID.asFloat, FieldByname('ID').asFloat]);
  end;}

  QryArinvt.Close;
  QryArinvt.Open;
  { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
  //IqSearch1.wwDBGrid.UnSelectAll;
end;

procedure TFrmFrAssign.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1000081 );
end;

procedure TFrmFrAssign.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
