unit RecvDays;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  Mask,
  IQMS.WebVcl.About,
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
  uniDBNavigator,
  uniMainMenu,
  IQUniGrid,
  uniGUIFrame;

type
  TFrmRecvDays = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    SrcRecvDays: TDataSource;
    TblRecvDays: TFDTable;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboDlgRecvDays: TUniEdit;
    TblRecvDaysID: TBCDField;
    TblRecvDaysEPLANT_ID: TBCDField;
    TblRecvDaysSUN_SHIP: TStringField;
    TblRecvDaysMON_SHIP: TStringField;
    TblRecvDaysTUE_SHIP: TStringField;
    TblRecvDaysWED_SHIP: TStringField;
    TblRecvDaysTHU_SHIP: TStringField;
    TblRecvDaysFRI_SHIP: TStringField;
    TblRecvDaysSAT_SHIP: TStringField;
    TblRecvDaysRecvDaysCount: TFloatField;
    TblRecvDaysSource: TStringField;
    TblRecvDaysOrigin: TStringField;
    wwDBComboDlgOrigin: TUniEdit;
    TblRecvDaysUSE_VENDOR_RECV_DAYS: TStringField;
    procedure TblRecvDaysCalcFields(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure TblRecvDaysBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgRecvDaysCustomDlg(Sender: TObject);
    procedure wwDBComboDlgOriginCustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CreateDefaultVendor_Recv_Days;
    procedure ResetVendor_Recv_Days;
  end;

procedure DoRecvDays;

//var
//  FrmRecvDays: TFrmRecvDays;

implementation
uses
  IQMS.Common.DataLib,
  //SetPlant,
  IQMS.Common.RegFrm,
  ShipDays;
{$R *.dfm}

procedure DoRecvDays;
var
  aFrmRecvDays : TFrmRecvDays;
begin
  aFrmRecvDays := TFrmRecvDays.Create(UniGUIApplication.UniApplication);
  aFrmRecvDays.ShowModal;
end;

procedure TFrmRecvDays.TblRecvDaysCalcFields(DataSet: TDataSet);
begin
  TblRecvDaysRecvDaysCount.asFloat:= 0;
  if TblRecvDaysSUN_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysMON_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysTUE_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysWED_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysTHU_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysFRI_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;
  if TblRecvDaysSAT_SHIP.asString = 'Y' then TblRecvDaysRecvDaysCount.asFloat:= TblRecvDaysRecvDaysCount.asFloat + 1;

  if TblRecvDaysEPLANT_ID.asFloat <> 0 then
  begin
    TblRecvDaysSource.asString := SelectValueFmtAsString('select name || '' ('' || id || '')'' from eplant where id = %f', [TblRecvDaysEPLANT_ID.asFloat]);
    TblRecvDaysOrigin.asString := 'EPlant';
  end
  else
  begin
    if SelectValueFmtAsFloat('select count(id) from RECV_DAYS where id <> %f and eplant_id is null', [TblRecvDaysID.asFloat]) <> 0 then
    begin
      TblRecvDaysSource.asString := '';
      TblRecvDaysOrigin.asString := '';
    end
    else
    begin
      TblRecvDaysSource.asString := 'System';
      TblRecvDaysOrigin.asString := 'Default';
    end;
  end;

end;

procedure TFrmRecvDays.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( Self, [Self, wwDBGrid1]);
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmRecvDays.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite( Self, [Self, wwDBGrid1]);
end;

procedure TFrmRecvDays.About1Click(Sender: TObject);
begin
 // IQAbout1.Execute;
end;

procedure TFrmRecvDays.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRecvDays.TblRecvDaysBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}

  //if TblRecvDaysUSE_VENDOR_RECV_DAYS.asString = 'Y' then
  //  ResetVendor_Recv_Days;

  if TblRecvDaysEPLANT_ID.asFloat = 0 then
    if SelectValueFmtAsFloat('select count(id) from RECV_DAYS where id <> %f and eplant_id is null', [TblRecvDaysID.asFloat]) <> 0 then
      raise Exception.Create('Only one default record allowed.')

end;

procedure TFrmRecvDays.wwDBComboDlgRecvDaysCustomDlg(Sender: TObject);
begin
  // IQAssert( TblRecvDaysUSE_VENDOR_RECV_DAYS.asString <> 'Y', capacity_rscstr.cTXT0000008); // '''Use Vendor Receive Days'' is on - operation aborted';

  if TblRecvDays.Eof and TblRecvDays.Bof then
    CreateDefaultVendor_Recv_Days;

  DoModalReceivingDays( TblRecvDays ); {ShipDays.pas}
end;

procedure TFrmRecvDays.CreateDefaultVendor_Recv_Days;
begin
  TblRecvDays.Insert;
  TblRecvDaysSUN_SHIP.asString:= 'N';
  TblRecvDaysMON_SHIP.asString:= 'Y';
  TblRecvDaysTUE_SHIP.asString:= 'Y';
  TblRecvDaysWED_SHIP.asString:= 'Y';
  TblRecvDaysTHU_SHIP.asString:= 'Y';
  TblRecvDaysFRI_SHIP.asString:= 'Y';
  TblRecvDaysSAT_SHIP.asString:= 'N';
  TblRecvDays.Post;
end;

procedure TFrmRecvDays.ResetVendor_Recv_Days;
begin
  TblRecvDaysSUN_SHIP.asString:= 'N';
  TblRecvDaysMON_SHIP.asString:= 'N';
  TblRecvDaysTUE_SHIP.asString:= 'N';
  TblRecvDaysWED_SHIP.asString:= 'N';
  TblRecvDaysTHU_SHIP.asString:= 'N';
  TblRecvDaysFRI_SHIP.asString:= 'N';
  TblRecvDaysSAT_SHIP.asString:= 'N';
end;

procedure TFrmRecvDays.wwDBComboDlgOriginCustomDlg(Sender: TObject);
begin
  //DoChangePlantID( self, TblRecvDays ); {SetPlant.pas}
end;

end.
