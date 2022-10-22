unit assy_location_data;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
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
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmAssyLocationData = class(TUniForm)
    Panel13: TUniPanel;
    Panel14: TUniPanel;
    btnCancel: TUniBitBtn;
    btnFinish: TUniBitBtn;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    wwDBComboDlgLocation: TUniEdit;
    Label2: TUniLabel;
    wwDBComboDlgFGLotNo: TUniEdit;
    Label3: TUniLabel;
    wwDBComboDlgNonConf: TUniEdit;
    PkLocations: TIQWebHPick;
    PkLocationsID: TBCDField;
    PkLocationsLOCATION: TStringField;
    PkLocationsDESCRIPTION: TStringField;
    PkLocationsEPLANT_NAME: TStringField;
    PkLocationsDIVISION: TStringField;
    PkNonConform: TIQWebHPick;
    PkNonConformID: TBCDField;
    PkNonConformCODE: TStringField;
    PkNonConformDESCRIP: TStringField;
    procedure wwDBComboDlgLocationCustomDlg(Sender: TObject);
    procedure wwDBComboDlgFGLotNoCustomDlg(Sender: TObject);
    procedure wwDBComboDlgNonConfCustomDlg(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
  private
    { Private declarations }
    FLocations_ID: Real;
    FNon_Conform_ID: Real;
  public
    { Public declarations }
    class function DoShowModal( AOwner: TComponent; var ALocations_ID, ANon_Conform_ID: Real; var ALotNo: string ): TModalResult;
  end;


implementation

{$R *.dfm}

uses
{ TODO : Dependecy }
  //TouchScrn,
  IQMS.Common.Miscellaneous;

{ TFrmTouchScreenLocationData }

class function TFrmAssyLocationData.DoShowModal(AOwner: TComponent; var ALocations_ID, ANon_Conform_ID: Real; var ALotNo: string ): TModalResult;
Var
LFrmAssyLocationData : TFrmAssyLocationData;
begin
  LFrmAssyLocationData := TFrmAssyLocationData.Create(UniGUIApplication.UniApplication);
  with LFrmAssyLocationData do
  Begin
    Result:= ShowModal();
    if Result = mrOK then
    begin
      ALocations_ID  := FLocations_ID;
      ANon_Conform_ID:= FNon_Conform_ID;
      ALotNo         := wwDBComboDlgFGLotNo.Text;
    end;
  end;
end;

procedure TFrmAssyLocationData.wwDBComboDlgLocationCustomDlg(Sender: TObject);
begin
  with PkLocations do
    if Execute then
    begin
      FLocations_ID:= GetValue('id');
      wwDBComboDlgLocation.Text:= GetValue('location');
    end;
end;

procedure TFrmAssyLocationData.wwDBComboDlgFGLotNoCustomDlg(Sender: TObject);
var
  S: string;
begin
  S:= wwDBComboDlgFGLotNo.Text;
//  if TouchScreen_Keyboard( self,  S, 25, 'Enter Lot#') then  {TouchScrn.pas}
//     wwDBComboDlgFGLotNo.Text:= S;
end;

procedure TFrmAssyLocationData.wwDBComboDlgNonConfCustomDlg(Sender: TObject);
begin
 with PkNonConform do
    if Execute then
    begin
      FNon_Conform_ID:= GetValue('id');
      wwDBComboDlgNonConf.Text:= GetValue('descrip');
    end;
end;

procedure TFrmAssyLocationData.btnFinishClick(Sender: TObject);
begin
  IQAssert( FLocations_ID > 0, 'Location must be specified' );
  IQAssert( FNon_Conform_ID > 0, 'Non-conform reason must be specified' );
  ModalResult:= mrOK;
end;

end.
