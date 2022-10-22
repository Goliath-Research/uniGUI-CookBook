unit ProdSum;

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
  ComCtrls,
  DB,
  IQMS.WebVcl.AppDef,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniPanel;

type
  TProdSummary = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Edit1: TUniEdit;
    Edit2: TUniEdit;
    Edit3: TUniEdit;
    Edit4: TUniEdit;
    Edit5: TUniEdit;
    Button1: TUniButton;
    AppDef1: TIQWebAppDef;
    Query1: TFDQuery;
    DataSource1: TDataSource;
    Query1MFG_TYPE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDayProdID: Real;
    procedure SetDayprodID(const Value: Real);
  public
    { Public declarations }
    property DayprodID: Real write SetDayprodID;
  end;

  // var
  // ProdSummary: TProdSummary;

procedure DoProdSummary(ADayprodID: Real);

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook;

procedure DoProdSummary(ADayprodID: Real);
var
  ProdSummary: TProdSummary;
begin
  ProdSummary := TProdSummary.Create(uniGUIApplication.uniApplication);
  ProdSummary.DayprodID := ADayprodID;
  ProdSummary.ShowModal;
end;

procedure TProdSummary.FormCreate(Sender: TObject);
begin
  with Query1 do
  begin
    Close;
    Params[0].asFloat := FDayprodID;
    Open;
  end;

  with AppDef1 do
  begin
    Execute('PROD_SHORT_SUMMARY', [FDayprodID]);
    Edit1.Text := Format('%f', [ParamByName('v_Rec_SPH').asFloat]);
    Edit2.Text := Format('%f', [ParamByName('v_Eff_SPH').asFloat]);
    Edit3.Text := Format('%f', [ParamByName('v_Std_SPH').asFloat]);
    Edit4.Text := Format('%f', [ParamByName('v_Pcnt_Scrap').asFloat]);
    Edit5.Text := Format('%f', [ParamByName('v_Pcnt_Eff').asFloat]);
    // MfgType added as an arguement for SLITTING mfg type
    Label1.Caption := Execute('Lbl_Rec_CPH', [MfgType]).asString;
    Label2.Caption := Execute('Lbl_Eff_CPH', [MfgType]).asString;
    Label3.Caption := Execute('Lbl_Std_Cycle', [MfgType]).asString;
  end;
end;

procedure TProdSummary.SetDayprodID(const Value: Real);
begin
  FDayProdID := Value;
end;

procedure TProdSummary.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmPROD_REP { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

end.
