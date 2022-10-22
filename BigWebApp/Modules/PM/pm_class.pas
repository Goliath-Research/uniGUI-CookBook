unit pm_class;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { TFrmPMClass }
  TFrmPMClass = class(TUniForm)
    SrcPMClass: TDataSource;
    wwDBGrid1: TIQUniGridControl;
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    PnlButtonsRight: TUniPanel;
    btnOK: TUniButton;
    QryPMClass: TFDQuery;
    UpdateSQL_Class: TFDUpdateSQL;
    QryPMClassID: TBCDField;
    QryPMClassCLASS: TStringField;
    QryPMClassDESCRIP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure QryPMClassAfterPost(DataSet: TDataSet);
    procedure QryPMClassBeforeDelete(DataSet: TDataSet);
    procedure Help1Click(Sender: TObject);
    procedure QryPMClassNewRecord(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
  private
    { Private declarations }
    procedure EnsureMainPMClassesExist;
  public
    { Public declarations }
    class procedure EnsureClassExists(const AClass: String;
      ADefaultDescrip: String = '');
  end;

procedure DoPMClassList;
function DoPMClassListSelectOnDoubleClick: String;
procedure PopulatePMClass(var AList: TStringList);
procedure DoEnsureMainPMClassesExist;

implementation

{$R *.DFM}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  pm_rscstr;

procedure PopulatePMClass(var AList: TStringList);
begin
  if AList = NIL then
    Exit;

  AList.Clear;

  with TFDQuery.Create(NIL) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('select distinct class from pm_class');
      SQL.Add('order by class');
      Open;
      while not Eof do
        begin
          AList.Add(Fields[0].AsString);
          Next;
        end;
    finally
      Free;
    end;
end;

procedure DoPMClassList;
var
  LFrmPMClass : TFrmPMClass;
begin
  LFrmPMClass :=  TFrmPMClass.Create(UniGUIApplication.UniApplication);
  LFrmPMClass.ShowModal;
end;

function DoPMClassListSelectOnDoubleClick: String;
var
  LFrmPMClass : TFrmPMClass;
begin
  LFrmPMClass :=  TFrmPMClass.Create(UniGUIApplication.UniApplication);
  if (LFrmPMClass.ShowModal = mrOK) and not (LFrmPMClass.QryPMClass.Eof and LFrmPMClass.QryPMClass.Bof) then
    Result := LFrmPMClass.QryPMClassCLASS.AsString
  else
    Result := '';
end;

procedure DoEnsureMainPMClassesExist;
var
  LFrmPMClass : TFrmPMClass;
begin
  LFrmPMClass :=  TFrmPMClass.Create(UniGUIApplication.UniApplication);
  LFrmPMClass.EnsureMainPMClassesExist;
end;

{ TFrmPMClass }

procedure TFrmPMClass.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self, wwDBGrid1]);
  EnsureMainPMClassesExist;
end;

procedure TFrmPMClass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (QryPMClass.State in [dsEdit, dsInsert]) then
    if IQWarningYN(pm_rscstr.cTXT0000121 { 'Save changes?' } ) then
      QryPMClass.Post
    else
      QryPMClass.Cancel;
  EnsureMainPMClassesExist;
  IQRegFormWrite(self, [self, wwDBGrid1]);
end;

procedure TFrmPMClass.EnsureMainPMClassesExist;
begin
  EnsureClassExists('MT', pm_rscstr.cTXT0000187 { 'Maintenance' } );
  // Maintenance
  EnsureClassExists('TL', pm_rscstr.cTXT0000188 { 'Tools' } ); // Tool
  EnsureClassExists('QC', pm_rscstr.cTXT0000189 { 'Gages/Devices' } );
  // Quality Control

  if (QryPMClass <> NIL) and (self.Showing) then
    QryPMClass.Refresh;
end;

class procedure TFrmPMClass.EnsureClassExists(const AClass: String;
  ADefaultDescrip: String);
begin
  if ADefaultDescrip = '' then
    ADefaultDescrip := AClass + ' - MRO';
  if SelectValueFmtAsInteger(
    'SELECT 1 FROM pm_class WHERE TRIM(UPPER(class)) = TRIM(UPPER(''%s'')) AND ROWNUM < 2',
    [AClass]) = 0 then
    ExecuteCommandFmt(
      'INSERT INTO pm_class( class, descrip ) VALUES ( ''%s'', ''%s'' ) ',
      [AClass, IQMS.Common.StringUtils.FixStr(ADefaultDescrip)]);
end;

procedure TFrmPMClass.QryPMClassNewRecord(DataSet: TDataSet);
begin
  QryPMClassID.AsLargeInt := GetNextID('PM_CLASS');
end;

procedure TFrmPMClass.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM { CHM } , iqhtmPM { HTM } ); { IQMS.Common.HelpHook.pas }
end;

procedure TFrmPMClass.btnOKClick(Sender: TObject);
begin
  if not (QryPMClass.Eof and QryPMClass.Bof) then
    ModalResult := mrOK
  else
    raise Exception.Create(pm_rscstr.cTXT0000186 { 'No class found' } );
end;

procedure TFrmPMClass.QryPMClassAfterPost(DataSet: TDataSet);
begin
  // Is this still necessary?
  RefreshDataSetByID(QryPMClass);
end;

procedure TFrmPMClass.QryPMClassBeforeDelete(DataSet: TDataSet);
var
  AEqno: String;
begin
  AEqno := SelectValueFmtAsString(
    'SELECT eqno FROM pmeqmt WHERE class = ''%s'' AND ROWNUM < 2',
    [QryPMClassCLASS.AsString]);

  if (AEqno > '') then
    // 'Class, %s, is currently referenced by Equipment # %s.  Cannot delete.'
    raise Exception.CreateFmt(pm_rscstr.cTXT0000190,
      [QryPMClassCLASS.AsString, AEqno]);
end;

procedure TFrmPMClass.Help1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmPMClass.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;   }

end.
