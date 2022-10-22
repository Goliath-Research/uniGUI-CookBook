unit Q_WrkSht;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmWeightWorkSheet = class(TUniForm)
    SrcQinvt: TDataSource;
    TblQinvt: TFDTable;
    TblQinvtID: TBCDField;
    TblQinvtSPG: TFMTBCDField;
    TblQinvtITEMNO: TStringField;
    TblQinvtREV: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel11: TUniPanel;
    Panel13: TUniPanel;
    sbtnVolume: TUniSpeedButton;
    lblVolumeUOM: TUniLabel;
    DBEdit1: TUniDBEdit;
    edVolume: TUniEdit;
    Panel14: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Splitter4: TUniSplitter;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnVolumeClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FMetricUOM: Boolean;
    FWeight   : Real;
    FQInvt_Eplant_ID: Real;
    FQuote_ID: Real;
    FQinvt_Mat_ID: Real;
    function GetVol: Real;
    procedure SetVol( AValue: Real );
    procedure SetQinvt_ID(const Value: Real);
    procedure SetQinvt_Mat_ID(const Value: Real);
    procedure SetQuote_ID(const Value: Real);
  protected
    FQinvt_ID : Real;
  public
    { Public declarations }
    property Weight: Real read FWeight write FWeight;
    property Vol:Real read GetVol write SetVol;
    class function CalcWeight( AVolume, ASPG: Real; AEplant_ID: Real = 0 ): Real;
    property Qinvt_Mat_ID : Real read FQinvt_Mat_ID  write SetQinvt_Mat_ID;
    property Qinvt_ID : Real write SetQinvt_ID;
    property Quote_ID : Real write SetQuote_ID;
  end;

function GetQPartWeightFromWorkSheet( AQinvt_Mat_ID: Real; var AWeight, AVol: Real; AQinvt_ID, AQuote_ID: Real ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.UOM,
  main_vol,
  quote_rscstr;

function GetQPartWeightFromWorkSheet( AQinvt_Mat_ID: Real; var AWeight, AVol: Real;  AQinvt_ID, AQuote_ID: Real ): Boolean;
var
  LFrm: TFrmWeightWorkSheet;
begin
  LFrm := TFrmWeightWorkSheet.Create(UniGUIApplication.UniApplication);
  LFrm.Qinvt_Mat_ID := AQinvt_Mat_ID;
  LFrm.Qinvt_ID := AQinvt_ID;
  LFrm.Quote_ID := AQuote_ID;
  Result:= LFrm.ShowModal = mrOK;
  if Result then
  begin
    AWeight:= LFrm.Weight;
    AVol   := LFrm.Vol;
  end;
end;

procedure TFrmWeightWorkSheet.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);

  FMetricUOM:= IsMetricSys( FQInvt_Eplant_ID );

  if FMetricUOM then
    lblVolumeUOM.Caption:= quote_rscstr.cTXT000000184 // '(Cu. Cm)'
  else
    lblVolumeUOM.Caption:= quote_rscstr.cTXT000000185; // '(Cu. In)'
end;

procedure TFrmWeightWorkSheet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self ]);
end;

function TFrmWeightWorkSheet.GetVol: Real;
begin
  try
    Result:= StrToFloat( edVolume.Text );
  except
    Result:= 0;
  end;
end;

procedure TFrmWeightWorkSheet.SetQinvt_ID(const Value: Real);
begin
  FQinvt_ID := Value;
end;

procedure TFrmWeightWorkSheet.SetQinvt_Mat_ID(const Value: Real);
begin
  FQinvt_Mat_ID := Value;
end;

procedure TFrmWeightWorkSheet.SetQuote_ID(const Value: Real);
begin
  FQuote_ID := Value;
end;

procedure TFrmWeightWorkSheet.SetVol( AValue: Real );
begin
  edVolume.Text:= Format( '%.8f', [ AValue ]);
end;

procedure TFrmWeightWorkSheet.UniFormShow(Sender: TObject);
begin
  FQInvt_Eplant_ID:= SelectValueByID('eplant_id', 'quote', FQuote_ID );
  IQSetTablesActiveEx( TRUE, self, quote_rscstr.cTXT000000212 {'Accessing database.  Please wait.'} );

  if not TblQinvt.Locate('ID', FQinvt_Mat_ID, []) then
     // 'Cannot find Quote Inventory item [ID = %.0f]';
     raise Exception.CreateFmt(quote_rscstr.cTXT000000062, [ FQinvt_Mat_ID ]);

  //'Weight WorkSheet (%s %s)'
  Caption  := Format(quote_rscstr.cTXT000000183, [ Trim(TblQinvtITEMNO.asString), Trim(TblQinvtREV.asString)]);
end;

procedure TFrmWeightWorkSheet.btnOKClick(Sender: TObject);
var
  AVolume: Real;
begin
  // Formula => PtWt := SpG * .0361 * Pt_Vol * 453.59   for vol in cubic inches.
  TblQinvt.CheckBrowseMode;

  AVolume:= StrToFloat( edVolume.Text );

  Weight:= CalcWeight( AVolume, TblQinvtSPG.asFloat, FQInvt_EPlant_ID );

  ModalResult:= mrOK;
end;

class function TFrmWeightWorkSheet.CalcWeight( AVolume, ASPG: Real; AEplant_ID: Real = 0 ): Real;
begin
  // if not IsMetricSys( AEPlant_ID ) then
  //    Result:= ASPG * 0.0361 * AVolume * 453.59
  // else
  //    Result:= ASPG * 0.0361 * AVolume;

  if not IsMetricSys( AEPlant_ID ) then
     // translate cu.in * SPG to grams because we store in grams (eventhough we are imperical)
     Result:= ASPG * AVolume * 16.387
  else
     // metric - straight forward
     Result:= ASPG * AVolume;
end;

procedure TFrmWeightWorkSheet.sbtnVolumeClick(Sender: TObject);
var
  AVolume: Real;
  AUomIndex: Integer;

  function _uom_index_to_string: string;
  begin
    {AUomIndex:  0-'Cubic inches', 1-'Cubic centimeters', 2-'Cubic millimeters.'}
    case AUomIndex of
       0: Result:= 'IN';
       1: Result:= 'CM';
       2: Result:= 'MM';
    end;
  end;

begin
  // if GetVolumeFormWorkSheet( AVolume, FQinvt_ID ) then   { main_vol.pas }
  //    edVolume.Text:= Format( '%.8f', [ AVolume ]);

  if GetVolumeFormWorkSheetEx( AVolume, FQinvt_ID, AUomIndex ) then
  begin
    if FMetricUOM then
       AVolume:= SelectValueFmtAsFloat('select UOM.IQConvertCube( ''%s'', ''CM'', %.8f, 0, ''Y'') from dual', [ _uom_index_to_string, AVolume ])
    else
       AVolume:= SelectValueFmtAsFloat('select UOM.IQConvertCube( ''%s'', ''IN'', %.8f, 0, ''Y'') from dual', [ _uom_index_to_string, AVolume ]);

    edVolume.Text:= Format( '%.8f', [ AVolume ]);
  end;
end;

end.
