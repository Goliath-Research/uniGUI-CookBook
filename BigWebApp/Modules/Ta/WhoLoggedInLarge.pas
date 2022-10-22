unit WhoLoggedInLarge;

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
  StdCtrls,
  Buttons,
  DBCtrls,
  ExtCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  Mask,
  ComCtrls,
  DB,
  Wwdatsrc,
  IQMS.WebVcl.LargeGrid,
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
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmWhoLoggedInLarge = class(TUniForm)
    Panel3: TUniPanel;
    Nav: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    Panel1: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    DBEdit7: TUniDBEdit;
    TabGrid: TUniTabSheet;
    Src: TDataSource;
    QryEmpl: TFDQuery;
    QryEmplEMPNO: TStringField;
    QryEmplEMP_NAME: TStringField;
    QryEmplSOURCE: TStringField;
    QryEmplTIME_IN: TDateTimeField;
    QryEmplELAPSED_TIME_STR: TStringField;
    QryEmplWORKORDER_ID: TStringField;
    QryEmplEPLANT_ID: TBCDField;
    QryEmplPR_EMP_ID: TBCDField;
    QryEmplSOURCE_ID: TBCDField;
    QryEmplELAPSED_DAYS: TFMTBCDField;
    QryEmplELAPSED_HOURS: TFMTBCDField;
    QryEmplELAPSED_MINUTES: TFMTBCDField;
    QryEmplELAPSED_TIME: TFMTBCDField;
    QryEmplTA_LABOR_ID: TBCDField;
    QryEmplSNDOP_ID: TBCDField;
    wwGrid: TIQWebTouchScreenGrid;
    PkEmpl: TIQWebHPick;
    PkEmplSOURCE: TStringField;
    PkEmplWORKORDER_ID: TStringField;
    PkEmplTIME_IN: TDateTimeField;
    PkEmplELAPSED_TIME_STR: TStringField;
    PkEmplEMP_NAME: TStringField;
    PkEmplEMPNO: TStringField;
    PkEmplTA_LABOR_ID: TBCDField;
    Panel2: TUniPanel;
    btnMainCancel: TUniBitBtn;
    PkEmplPROCESS: TStringField;
    QryEmplPROCESSNUM: TStringField;
    Label8: TUniLabel;
    DBEdit8: TUniDBEdit;
    Label9: TUniLabel;
    DBEdit9: TUniDBEdit;
    QryEmplEQNO: TStringField;
    QryEmplMFGNO: TStringField;
    procedure btnMainCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryEmplCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FPArgs: array of string;
    procedure SetPArgs(index: Integer; const value: string);
    function GetPArgs(index: Integer): string;
    { Private declarations }
  public
    { Public declarations }
    property PArgs[index: Integer] : string read GetPArgs write SetPArgs;
  end;

procedure FindWhoLoggedInLarge(const Args : array of string);

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;
{$R *.dfm}

procedure FindWhoLoggedInLarge(const Args : array of string);
var
  LFrmWhoLoggedInLarge : TFrmWhoLoggedInLarge;
  i: Integer;
begin
  LFrmWhoLoggedInLarge := TFrmWhoLoggedInLarge.Create(UniGUIApplication.UniApplication);
  for i := 0 to (length(Args)-1) do
    LFrmWhoLoggedInLarge.PArgs[i] := Args[i];
  LFrmWhoLoggedInLarge.Show;
end;

procedure TFrmWhoLoggedInLarge.btnMainCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmWhoLoggedInLarge.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, wwGrid]);
end;

function TFrmWhoLoggedInLarge.GetPArgs(index: Integer): string;
begin
  Result := FPArgs[Index];
end;

procedure TFrmWhoLoggedInLarge.QryEmplCalcFields(DataSet: TDataSet);
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

procedure TFrmWhoLoggedInLarge.sbtnSearchClick(Sender: TObject);
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

procedure TFrmWhoLoggedInLarge.SetPArgs(index: Integer; const value: string);
begin
  FPArgs[index] := Value;
end;

procedure TFrmWhoLoggedInLarge.SpeedButton1Click(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) then
    PC.ActivePage := TabForm
  else
    PC.ActivePage := TabGrid;
end;

procedure TFrmWhoLoggedInLarge.UniFormShow(Sender: TObject);
var
  AStr:String;
  ASource:String;
  ACaption:String;
  I:Integer;
begin
  QryEmpl.Close;
  if High(FPArgs) < 0 then
  begin
    Caption := 'Employees Currently Logged Into All Tasks';
    QryEmpl.Open;
  end
  else
  begin
    AStr := ' and source in ( ';
    ACaption := '';

    for i := 0 to High(FPArgs) do
    begin
      ASource := '''' + FPArgs[I] + ''', ';
      AStr := AStr + ASource;
      ACaption := ACaption + ASource;
    end;
    AStr := Copy(AStr, 1, Length(AStr) - 2) + ')';
    Caption := 'Employees Currently Logged Into ' + Copy(ACaption, 1, Length(ACaption) - 2);
    QryEmpl.Sql.Add(AStr);
    PkEmpl.Sql.Add(AStr);
    QryEmpl.Open;
  end;
  PC.ActivePage := TabForm;
  IQRegFormRead( self, [self, wwGrid]);
end;

end.
