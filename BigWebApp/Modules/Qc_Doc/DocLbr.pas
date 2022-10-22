unit DocLbr;

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
  IQMS.WebVcl.SecurityRegister,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  Db,
  Wwdatsrc,
  DBCtrls,
  ExtCtrls,
  Menus,
  Buttons,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmDocLbr = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    SrcDocLbr: TDataSource;
    TblDocLbr: TFDTable;
    Grid: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    SBSearch: TUniSpeedButton;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    wwPath: TUniEdit;
    wwRevPath: TUniEdit;
    TblDocLbrID: TBCDField;
    TblDocLbrDESCRIP: TStringField;
    TblDocLbrPATH: TStringField;
    TblDocLbrDEFAULT_EXT: TStringField;
    TblDocLbrTYPE: TStringField;
    TblDocLbrREVISION_PATH: TStringField;
    TblDocLbrKEEP_REVISIONS: TStringField;
    wwType: TUniDBComboBox;
    IQAbout1: TIQWebAbout;
    PkDocLbr: TIQWebHPick;
    PkDocLbrID: TBCDField;
    PkDocLbrDESCRIP: TStringField;
    PkDocLbrPATH: TStringField;
    PkDocLbrDEFAULT_EXT: TStringField;
    PkDocLbrTYPE: TStringField;
    PkDocLbrREVISION_PATH: TStringField;
    PkDocLbrKEEP_REVISIONS: TStringField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure wwPathCustomDlg(Sender: TObject);
    procedure wwRevPathCustomDlg(Sender: TObject);
    procedure wwPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwRevPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TblDocLbrBeforePost(DataSet: TDataSet);
    procedure TblDocLbrBeforeDelete(DataSet: TDataSet);
    procedure TblDocLbrBeforeEdit(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDescrip:String;
    FId:Real;
  public
    { Public declarations }
  end;

procedure DoDocLibrary;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Directory,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  qc_doc_share,  }
  IQMS.Common.Controls,
  IQMS.Common.HelpHook;

procedure DoDocLibrary;
var
  LFrmDocLbr : TFrmDocLbr;
begin
  LFrmDocLbr := TFrmDocLbr.Create(UniGUIApplication.UniApplication);
  LFrmDocLbr.Show;
end;

procedure TFrmDocLbr.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, Grid]);
end;

procedure TFrmDocLbr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmDocLbr.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDocLbr.wwPathCustomDlg(Sender: TObject);
var
  s:String;
begin
  if TblDocLbrPATH.asString <> '' then
    S := TblDocLbrPATH.asString;
  if DirBrowse( s ) then
  with TblDocLbr do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    TblDocLbrPATH.asString := ExpandUNCFileName( S );
  end;
end;

procedure TFrmDocLbr.wwRevPathCustomDlg(Sender: TObject);
var
  s:String;
begin
  if TblDocLbrREVISION_PATH.asString <> '' then
    S := TblDocLbrREVISION_PATH.asString;
  if DirBrowse( s ) then
  with TblDocLbr do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    TblDocLbrREVISION_PATH.asString := ExpandUNCFileName( S );
  end;
end;

procedure TFrmDocLbr.wwPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  with TblDocLbr do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    TblDocLbrPATH.Clear;
    Key:= 0;
  end;
end;

procedure TFrmDocLbr.wwRevPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  with TblDocLbr do
  begin
    if not (State in [dsEdit, dsInsert]) then Edit;
    TblDocLbrREVISION_PATH.Clear;
    Key:= 0;
  end;
end;

procedure TFrmDocLbr.TblDocLbrBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
  if (FDescrip = 'DEFAULT LIBRARY') and (Uppercase(TblDocLbrDESCRIP.asString) <> 'DEFAULT LIBRARY') then
    raise Exception.Create('Cannot change defaults record');
  if (Uppercase(TblDocLbrDESCRIP.asString) = 'DEFAULT LIBRARY')
    and (SelectValueFmtAsFloat('select id from doc_library where upper(descrip) = ''DEFAULT LIBRARY'' ' +
                  'and id <> %f', [TblDocLbrID.asFloat]) <> 0) then
    raise Exception.Create(Format('One %s record already exists', [TblDocLbrDESCRIP.asString]));
end;

procedure TFrmDocLbr.UniFormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Files
  FId := EnsureDefaultLibraryIDExists  { qc_doc_share };

  IQSetTablesActive( TRUE, self );

//  IQMS.Common.Controls.ResizeNavBar(Grid.Controls);
end;

procedure TFrmDocLbr.TblDocLbrBeforeDelete(DataSet: TDataSet);
begin
  if Uppercase(TblDocLbrDESCRIP.asString) = 'DEFAULT LIBRARY' then
    raise Exception.Create(Format('Cannot delete %s record', [TblDocLbrDESCRIP.asString]));
end;

procedure TFrmDocLbr.TblDocLbrBeforeEdit(DataSet: TDataSet);
begin
  if TblDocLbrID.asFloat = FId then
    FDescrip := Uppercase(TblDocLbrDESCRIP.asString);
end;

procedure TFrmDocLbr.SBSearchClick(Sender: TObject);
begin
  with PkDocLbr do
  if Execute then
    TblDocLbr.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmDocLbr.SRAfterApply(Sender: TObject);
begin
  wwPath.Visible := False;
  wwRevPath.Visible := False;
  wwType.Visible := False;
//  IQMS.Common.Controls.AutoSizeNavBar(Grid.Controls);
end;

procedure TFrmDocLbr.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmDocLbr.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.HelpContext(1097145);
end;

end.
