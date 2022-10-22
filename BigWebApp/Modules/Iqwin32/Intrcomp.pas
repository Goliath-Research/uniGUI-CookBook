unit Intrcomp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  Mask,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmIntercompany = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    SrcIntercomp: TDataSource;
    TblIntercomp: TFDTable;
    Grid: TIQUniGridControl;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    TblIntercompID: TBCDField;
    TblIntercompFROM_EPLANT_ID: TBCDField;
    TblIntercompTO_EPLANT_ID: TBCDField;
    TblIntercompGLACCT_ID: TBCDField;
    TblIntercompOFFSET_GLACCT_ID: TBCDField;
    TblIntercompDESCRIP: TStringField;
    QryGlacct: TFDQuery;
    QryGlacctOffset: TFDQuery;
    PKEplant: TIQWebHPick;
    PkGlacct: TIQWebHPick;
    QryGlacctID: TBCDField;
    QryGlacctACCT: TStringField;
    QryGlacctOffsetID: TBCDField;
    QryGlacctOffsetACCT: TStringField;
    TblIntercompGlacct: TStringField;
    TblIntercompGlacctIdOffset: TStringField;
    wwFromEplant: TUniEdit;
    wwToEplant: TUniEdit;
    wwGlacct: TUniEdit;
    wwOffsetGlacct: TUniEdit;
    PKEplantID: TBCDField;
    PKEplantNAME: TStringField;
    PkGlacctID: TBCDField;
    PkGlacctACCT: TStringField;
    PkGlacctEPLANT_ID: TBCDField;
    Contents1: TUniMenuItem;
    PkGlacctDESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TblIntercompBeforePost(DataSet: TDataSet);
    procedure wwFromEplantCustomDlg(Sender: TObject);
    procedure wwFromEplantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwToEplantCustomDlg(Sender: TObject);
    procedure wwToEplantKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwGlacctCustomDlg(Sender: TObject);
    procedure wwGlacctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwOffsetGlacctCustomDlg(Sender: TObject);
    procedure wwOffsetGlacctKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CheckSameGlYear;
  public
    { Public declarations }
  end;

procedure DoIntercompany;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoIntercompany;
begin
  with TFrmIntercompany.Create(UniGUIApplication.UniApplication) do Show;
end;

procedure TFrmIntercompany.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Grid ]);
end;

procedure TFrmIntercompany.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIntercompany.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmIntercompany.TblIntercompBeforePost(DataSet: TDataSet);
begin
  if (TblIntercompOFFSET_GLACCT_ID.AsFloat = 0) or (TblIntercompGLACCT_ID.AsFloat = 0) then
    raise exception.create('Both accounts must be filled');

  if TblIntercompTO_EPLANT_ID.AsFloat = 0 then
    raise exception.create('To Eplant ID must be filled');

  CheckSameGlYear;

  IQAssignIDBeforePost( DataSet);
end;

procedure TFrmIntercompany.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, Grid ]);
end;

procedure TFrmIntercompany.CheckSameGlYear;
var
  AFromId, AToId:Real;
  AFromStartDate, AFromEndDate, AToStartDate, AToEndDate:TDateTime;
begin
  AFromId := SelectValueFmtAsFloat('select id from glyear where eplant_id = %f and trunc(sysdate) between start_date and end_date', [TblIntercompFROM_EPLANT_ID.AsFloat]);
  if AFromId = 0 then
    AFromId := SelectValueAsFloat('select id from glyear where eplant_id is null  and trunc(sysdate) between start_date and end_date');

  AToId := SelectValueFmtAsFloat('select id from glyear where eplant_id = %f and trunc(sysdate) between start_date and end_date', [TblIntercompTO_EPLANT_ID.AsFloat]);
  if AToId = 0 then
    AToId := SelectValueAsFloat('select id from glyear where eplant_id is null  and trunc(sysdate) between start_date and end_date');
  if (AFromId = 0) or (AToId = 0) then exit;

  AFromStartDate := SelectValueFmtAsFloat('select start_date from glyear where id = %f', [AFromId]);
  AFromEndDate := SelectValueFmtAsFloat('select end_date from glyear where id = %f', [AFromId]);

  AToStartDate := SelectValueFmtAsFloat('select start_date from glyear where id = %f', [AToId]);
  AToEndDate := SelectValueFmtAsFloat('select end_date from glyear where id = %f', [AToId]);

//  if not ((AFromStartDate = AToStartDate) and (AFromEndDate = AToEndDate)) then
//    raise exception.create('Intercompany cannot affect accounts of companies that have different GL years.');
end;

procedure TFrmIntercompany.wwFromEplantCustomDlg(Sender: TObject);
begin
  with PKEplant do
  if execute then
  begin
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompFROM_EPLANT_ID.AsFloat := GetValue('ID');
  end
end;

procedure TFrmIntercompany.wwFromEplantKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    Key := 0;
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompFROM_EPLANT_ID.Clear;
  end;
end;

procedure TFrmIntercompany.wwToEplantCustomDlg(Sender: TObject);
begin
  with PKEplant do
  if execute then
  begin
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompTO_EPLANT_ID.AsFloat := GetValue('ID');
  end
end;

procedure TFrmIntercompany.wwToEplantKeyDown(Sender: TObject;  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    Key := 0;
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompTO_EPLANT_ID.Clear;
  end;
end;

procedure TFrmIntercompany.wwGlacctCustomDlg(Sender: TObject);
begin
  with PkGlacct do
  if execute then
  begin
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompGLACCT_ID.AsFloat := GetValue('ID');
  end
end;

procedure TFrmIntercompany.wwGlacctKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    Key := 0;
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompGLACCT_ID.Clear;
  end;
end;

procedure TFrmIntercompany.wwOffsetGlacctCustomDlg(Sender: TObject);
begin
  with PkGlacct do
  if execute then
  begin
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompOFFSET_GLACCT_ID.AsFloat := GetValue('ID');
  end
end;

procedure TFrmIntercompany.wwOffsetGlacctKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    Key := 0;
    if not(TblIntercomp.State in [dsEdit, dsInsert]) then TblIntercomp.Edit;
    TblIntercompOFFSET_GLACCT_ID.Clear;
  end;
end;

procedure TFrmIntercompany.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1124278 );
end;

procedure TFrmIntercompany.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
