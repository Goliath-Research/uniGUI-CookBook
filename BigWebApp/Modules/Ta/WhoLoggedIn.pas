unit WhoLoggedIn;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  Wwdatsrc,
  IQMS.WebVcl.About,
  Menus,
  ComCtrls,
  Buttons,
  ExtCtrls,
  StdCtrls,
  Mask,
  DBCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
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
  uniDBEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmWhoLoggedIn = class(TUniForm)
    Src: TDataSource;
    QryEmpl: TFDQuery;
    QryEmplEPLANT_ID: TBCDField;
    QryEmplPR_EMP_ID: TBCDField;
    QryEmplSOURCE: TStringField;
    QryEmplSOURCE_ID: TBCDField;
    QryEmplTIME_IN: TDateTimeField;
    QryEmplELAPSED_DAYS: TFMTBCDField;
    QryEmplELAPSED_HOURS: TFMTBCDField;
    QryEmplELAPSED_MINUTES: TFMTBCDField;
    QryEmplELAPSED_TIME_STR: TStringField;
    QryEmplELAPSED_TIME: TFMTBCDField;
    QryEmplEMP_NAME: TStringField;
    QryEmplEMPNO: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Panel3: TUniPanel;
    sbtnSearch1: TUniSpeedButton;
    SBGridView: TUniSpeedButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    QryEmplTA_LABOR_ID: TBCDField;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    QryEmplWORKORDER_ID: TStringField;
    QryEmplSNDOP_ID: TBCDField;
    wwGrid: TIQUniGridControl;
    PkEmpl: TIQWebHPick;
    PkEmplSOURCE: TStringField;
    PkEmplWORKORDER_ID: TStringField;
    PkEmplTIME_IN: TDateTimeField;
    PkEmplELAPSED_TIME_STR: TStringField;
    PkEmplEMP_NAME: TStringField;
    PkEmplEMPNO: TStringField;
    PkEmplTA_LABOR_ID: TBCDField;
    Nav: TUniDBNavigator;
    PkEmplPROCESS: TStringField;
    QryEmplPROCESSNUM: TStringField;
    Contents1: TUniMenuItem;
    QryEmplEQNO: TStringField;
    QryEmplMFGNO: TStringField;
    Label8: TUniLabel;
    Label9: TUniLabel;
    DBEdit8: TUniDBEdit;
    DBEdit9: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryEmplCalcFields(DataSet: TDataSet);
    procedure SBGridViewClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnSearch1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    Frgs: array[0..3] of string;
    procedure Setrgs(Index : Integer; const Value: string);
    function Getrgs(Index: Integer): string;
    { Private declarations }
  public
    { Public declarations }
    property rgs[Index : Integer]: string read Getrgs write Setrgs;
  end;

procedure FindWhoLoggedIn(const Args : array of string);

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure FindWhoLoggedIn( const Args : array of string);
var
  FrmWhoLoggedIn: TFrmWhoLoggedIn;
  I:Integer;
begin
  FrmWhoLoggedIn := TFrmWhoLoggedIn.Create(uniGUIApplication.uniApplication);
  with FrmWhoLoggedIn do
  begin
    for I:= 0 to (Length(Args)-1) do
      rgs[I] := Args[I];
    Show;
  end;
end;

procedure TFrmWhoLoggedIn.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmWhoLoggedIn.UniFormCreate(Sender: TObject);
begin
  PC.ActivePage := TabForm;
  IQRegFormRead( self, [self, wwGrid]);
end;

procedure TFrmWhoLoggedIn.UniFormShow(Sender: TObject);
var
  AStr:String;
  ASource:String;
  ACaption:String;
  I:Integer;
begin

  QryEmpl.Close;
  if High(Frgs) < 0 then
  begin
    Caption := 'Employees Currently Logged Into All Tasks';
    QryEmpl.Open;
  end
  else
  begin
    AStr := ' and source in ( ';
    ACaption := '';

    for i := 0 to High(Frgs) do
    begin
      ASource := '''' + Frgs[I] + ''', ';
      AStr := AStr + ASource;
      ACaption := ACaption + ASource;
    end;
    AStr := Copy(AStr, 1, Length(AStr) - 2) + ')';
    Caption := 'Employees Currently Logged Into ' + Copy(ACaption, 1, Length(ACaption) - 2);
    QryEmpl.Sql.Add(AStr);
    PkEmpl.Sql.Add(AStr);
    QryEmpl.Open;
  end;
end;

procedure TFrmWhoLoggedIn.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWhoLoggedIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwGrid]);
end;

function TFrmWhoLoggedIn.Getrgs(Index: Integer): string;
begin
  Result := Frgs[Index];
end;

procedure TFrmWhoLoggedIn.QryEmplCalcFields(DataSet: TDataSet);
begin
{
  if QryEmplSOURCE.asString = 'WO' then
  begin
    QryEmplprocessnum.asString := SelectValueFmtAsString('select o.opno ' +
                    '  from ta_labor t,                   ' +
                    '       workorder w,                  ' +
                    '       standard s,                   ' +
                    '       sndop o,                      ' +
                    '       partno p,                     ' +
                    '       arinvt a                      ' +
                    ' where t.id = %f                     ' +
                    '   and source_id = w.id              ' +
                    '   and w.standard_id = s.id          ' +
                    '   and t.sndop_id = o.id             ' +
                    '   and t.partno_id = p.id            ' +
                    '   and p.arinvt_id = a.id ', [QryEmplTA_LABOR_ID.asfloat]);

  end
  else if QryEmplSOURCE.asString = 'JS' then
  begin
    QryEmplprocessnum.asString := SelectValueFmtAsString('select opno from sndop where id = %f', [QryEmplSNDOP_ID.asFloat]);
  end
  else
  begin
    QryEmplprocessnum.asString := '';
  end;
}
end;

procedure TFrmWhoLoggedIn.SBGridViewClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) then
    PC.ActivePage := TabForm
  else
    PC.ActivePage := TabGrid;
end;

procedure TFrmWhoLoggedIn.sbtnSearch1Click(Sender: TObject);
var
  AId:Real;
begin
  with PkEmpl do
  if Execute then
  begin
    AId := GetValue('TA_LABOR_ID');
    QryEmpl.Locate('TA_LABOR_ID', AId, []);
  end;

end;

procedure TFrmWhoLoggedIn.Setrgs(Index: Integer;const Value:string);
begin
  Frgs[Index] := Value;
end;

procedure TFrmWhoLoggedIn.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmWhoLoggedIn.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmTA{CHM}, iqhtmTA{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
