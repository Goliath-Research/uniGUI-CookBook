unit MCBasic;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Wwtable,
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
  uniLabel, uniMainMenu, uniComboBox, uniDBComboBox;

type
  TFrmMCBasic = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    tblCurrency: TFDTable;
    Panel2: TUniPanel;
    cbCurrency: TUniDBLookupComboBox;
    Label1: TUniLabel;
    tblCurrencyID: TBCDField;
    tblCurrencyCURR_CODE: TStringField;
    tblCurrencyDESCRIP: TStringField;
    tblCurrencyGLVALUE: TStringField;
    tblCurrencySPOT_RATE: TFMTBCDField;
    tblCurrencyCURR_SYMBOL: TStringField;
    tblCurrencyECODE: TStringField;
    tblCurrencyEID: TBCDField;
    tblCurrencyEDATE_TIME: TDateTimeField;
    tblCurrencyECOPY: TStringField;
    tblCurrencyNATIVE_CURR: TStringField;
    SrcCurrency: TDataSource;
    procedure cbCurrencyEnter(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure cbCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);virtual;
    procedure UniFormShow(Sender: TObject);
  private
    FID: Real;
    { Private declarations }
    procedure AssignFilter(AFilter:String);
    procedure SetID(const Value: Real);
  protected
    procedure Recalculate;virtual;
  public
    { Public declarations }
    FRate:Real;
    Factor:Real;
    FBanchRate:Real;
    procedure RefreshDataSet(AId, ATag:Integer);virtual;
    procedure RefreshCaption;virtual;
    property ID : Real write SetID;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Mcshare;

procedure TFrmMCBasic.cbCurrencyEnter(Sender: TObject);
begin
  FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
end;

procedure TFrmMCBasic.Recalculate;
begin
//
end;

procedure TFrmMCBasic.RefreshDataSet(AId, ATag:Integer);
var
  AEPlantCurID :Real;
  AFilter:String;
begin
    if (AID <> 0) and ((Tag = 0) or (ATag = Tag)) then
  begin
    AEPlantCurID := GetEplantCurrencyId(AId, AFilter);
    AssignFilter(AFilter);
    if AEPlantCurID <> 0 then
      tblCurrency.Locate('ID', AEPlantCurID, [])
    else
      tblCurrency.Locate('ID', AID, []);
    cbCurrency.Text := tblCurrency.FieldByName('Descrip').asString;
    { TODO : TUniDBLookupComboBox has no member LookUpValue }
    //cbCurrency.LookUpValue := IntToStr(AID);
    FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
    FBanchRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  end;
  cbCurrencyCloseUp(nil, nil, nil, True);
  RefreshCaption;
end;

procedure TFrmMCBasic.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmMCBasic.UniFormShow(Sender: TObject);
var
  AEPlantCurID:Real;
  AFilter :String;
begin
  IQSetTablesActive( TRUE, self );
  if FID = 0 then FID := SelectValueAsFloat('select currency_id from iqsys');
  AEPlantCurID := GetEplantCurrencyId(FId, AFilter);
  AssignFilter(AFilter);
//  if AEPlantCurID <> 0 then
//    AId := AEPlantCurID;
  tblCurrency.Locate('ID', FID, []);
  cbCurrency.Text := tblCurrency.FieldByName('Descrip').asString;
  { TODO : TUniDBLookupComboBox has no member LookUpValue }
 // cbCurrency.LookUpValue := IntToStr(Trunc(FID));

  // 11/26/2008 Compensate for localization (Byron)
  cbCurrency.Left := Label1.Left + Label1.Width + 8;
  // ensure the combo box does not extend beyond the panel width; sometimes
  // other controls will be on the toolbar, which is why we check first.
  if cbCurrency.Width > (Panel2.ClientWidth - (cbCurrency.Left + cbCurrency.Width + 1)) then
     cbCurrency.Width := (Panel2.ClientWidth - (cbCurrency.Left + 4));

  FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  FBanchRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
  Factor := 1;
end;

procedure TFrmMCBasic.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMCBasic.cbCurrencyCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  // 02/09/2009 Initialize
  Factor := 0;
  // 02/09/2009 Avoid div by zero
  if tblCurrency.FieldByName('SPOT_RATE').asFloat > 0 then
     Factor := FBanchRate/tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  Factor := FRate/tblCurrency.FieldByName('SPOT_RATE').asFloat;
  Recalculate;
//  try
//  finally
//    FRate := tblCurrency.FieldByName('SPOT_RATE').asFloat;
//  end;
end;

procedure TFrmMCBasic.RefreshCaption;
begin
//
end;

procedure TFrmMCBasic.AssignFilter(AFilter:String);
begin
  if AFilter <> '' then
  begin
    tblCurrency.Filter   := Format('NATIVE_CURR=''%s''', [AFilter]);
    tblCurrency.Filtered := True;
  end
  else
    tblCurrency.Filtered := False;
end;



end.
