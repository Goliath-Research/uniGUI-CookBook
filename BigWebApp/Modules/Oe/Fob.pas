unit Fob;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Param,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFob = class(TUniForm)
    Panel1: TUniPanel;
    SrcFob: TDataSource;
    UpdateSQL1: TFDUpdateSQL;
    QryFOB: TFDQuery;
    QryFOBID: TBCDField;
    QryFOBDESCRIP: TStringField;
    QryFOBEXCLUDE_UPS_FREIGHT: TStringField;
    QryFOBDED_FROM_INV_TOT: TStringField;
    IQSearch1: TIQUniGridControl;
    QryFOBCODE: TStringField;
    QryFOBTHIRD_PARTY_BILLING: TStringField;
    SBSearchPurch: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryFOBSUBJECT_TO_FREIGHT_REV: TStringField;
    Contents1: TUniMenuItem;
    QryFOBPK_HIDE: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure QryFOBBeforePost(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    procedure IQSearch1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SBSearchPurchClick(Sender: TObject);
    procedure QryFOBNewRecord(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);

  private
    { Private declarations }
    FDataSet:TDataSet;
    FHint: string;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
                            var HintInfo: THintInfo );
    procedure SetDataSet(const Value: TDataset);
  public
    { Public declarations }
    property Dataset : TDataset write SetDataSet;
  end;

procedure DoFob(ADataSet:TDataSet);
procedure DoFobModal(ADataSet:TDataSet);

implementation
{$R *.DFM}
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  Fob3rdParty;

procedure DoFob(ADataSet:TDataSet);
var
  LFrmFob : TFrmFob;
begin
  LFrmFob := TFrmFob.Create(UniGUIApplication.UniApplication);
  LFrmFob.Dataset := ADataSet;
  LFrmFob.Show;
end;

procedure DoFobModal(ADataSet:TDataSet);
var
  LFrmFob : TFrmFob;
begin
  LFrmFob := TFrmFob.Create(UniGUIApplication.UniApplication);
  LFrmFob.Dataset := ADataSet;
  LFrmFob.ShowModal;
end;

procedure TFrmFob.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self]);
  IqSearch1.ShowHint := true;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwDBGrid
  IqSearch1.wwDBgrid.ShowHint := true; }
end;

procedure TFrmFob.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmFob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
  IQRegFormWrite( self, [ self]);
  if FDataSet <> nil then
  begin
    if FDataSet is TFDQuery then
    begin
      TFDQuery(FDataSet).Close;
      TFDQuery(FDataSet).Open;
    end
    else if FDataSet is TFDTable then
      TFDTable(FDataSet).Refresh;
  end;
end;

procedure TFrmFob.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmFob.DoOnShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
begin
  with HintInfo do
  begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwDBGrid
    if HintControl = IqSearch1.wwDBGrid then
    begin
      ReshowTimeout:= 200;
      HintStr:= FHint;
    end;  }
  end;
end;

procedure TFrmFob.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFob.QryFOBBeforePost(DataSet: TDataSet);
begin
  QryFob.FieldByName('DESCRIP').asString := UpperCase(QryFob.FieldByName('DESCRIP').asString);
  if QryFOBID.asFloat = 0 then
    QryFOBID.asFloat := GetNextID('FOB');
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmFob.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  aId:Real;
begin
  if Button = nbRefresh then
  begin
    aId := QryFOBID.asFloat;
    QryFOB.Close;
    QryFOB.Open;
    QryFOB.Locate('ID', AId, []);
    Abort;
  end;
end;   }

procedure TFrmFob.IQSearch1MouseMove(Sender: TObject; Shift: TShiftState;  X, Y: Integer);
{ TODO -oGPatil -cWebConvert : TGridCoord -- Undeclared Identifier
var
  AGridCoord: TGridCoord;    }
begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member named wwDBGrid
  AGridCoord:= IqSearch1.wwDBgrid.MouseCoord(X, Y);
}
  FHint:= 'FOB';
{ TODO -oGPatil -cWebConvert : AGridCoord does not contain a member named X
  if AGridCoord.X in [ 1..2 ] then
  begin
    if IqSearch1.wwDBgrid.Fields[ AGridCoord.X - 1 ] = QryFobEXCLUDE_UPS_FREIGHT then
       FHint:= 'Check this box to exclude Packing Slips associated with this FOB '#13'from being applied a freight charge in UPS Link'
    else
       FHint:= 'Edit FOB Description';
  end; }
end;

procedure TFrmFob.QryFOBNewRecord(DataSet: TDataSet);
begin
  QryFobID.AsLargeInt := GetNextID('fob');
  if SelectValueAsInteger('select count(id) from FOB where descrip = ''THIRD PARTY''') = 0 then
  begin
    QryFobDESCRIP.asString := 'THIRD PARTY';
    QryFOBTHIRD_PARTY_BILLING.asString := 'Y';
  end;
end;

procedure TFrmFob.SBSearchPurchClick(Sender: TObject);
begin
  Do3rdPartyBilling();
end;

procedure TFrmFob.SetDataSet(const Value: TDataset);
begin
  FDataSet := Value;
end;

procedure TFrmFob.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1098509 );
end;

end.
