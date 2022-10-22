unit CAR_ECO_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
  Mask,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  IQMS.WebVcl.SecurityRegister,
  CAR_ECO_Exist,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniLabel, uniCheckBox, uniPanel, uniPageControl,
  UniGUIApplication;

type
  TFrmCar_Eco_ExistsException = class(TFrmStatusException)
    Query1STATUS_ID: TStringField;
    Query1CAR_Count: TFloatField;
    Query1ECO_Count: TFloatField;
    btnDetails: TUniButton;
    Query1MRB_Count: TFloatField;
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Query1DEV_Count: TFloatField;
    Label5: TUniLabel;
    DBEdit5: TUniDBEdit;
    Query1PPAP_Count: TFloatField;
    Label6: TUniLabel;
    DBEdit6: TUniDBEdit;
    lblItemNo: TUniLabel;
    Label7: TUniLabel;
    dbeItemDescrip: TUniDBEdit;
    dbeItemno: TUniDBEdit;
    Query1ArinvtItemno: TStringField;
    Query1ArinvtDescrip: TStringField;
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure btnDetailsClick(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FCarCount : Real;
    FEcoCount : Real;
    FMrbCount : Real;
    FDevCount : Real;
    FPPapCount: Real;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetCarCount(const Value: Real);
    procedure SetDevCount(const Value: Real);
    procedure SetEcoCount(const Value: Real);
    procedure SetMrbCount(const Value: Real);
    procedure SetPPapCount(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }
    class function Count_Open_CAR( AArinvt_ID: Real ): Real;
    class function Count_Open_ECO( AArinvt_ID: Real ): Real;
    class function Count_Open_MRB( AArinvt_ID: Real ): Real;
    class function Count_Open_DEV( AArinvt_ID: Real ): Real;
    class function Count_Open_PPAP(AArinvt_ID: Real): Real;

    property Arinvt_ID : Real write SetArinvt_ID;
    property CarCount : Real write SetCarCount;
    property EcoCount : Real write SetEcoCount;
    property MrbCount : Real write SetMrbCount;
    property DevCount : Real write SetDevCount;
    property PPapCount : Real write SetPPapCount;

  end;

procedure CheckCAR_ECO_Exists( AArinvt_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Applications,
  IQMS.Common.DataLib;

procedure CheckCAR_ECO_Exists( AArinvt_ID: Real );
var
   ACarCount: Real;
   AEcoCount: Real;
   AMrbCount: Real;
   ADevCount: Real;
   APPapCount: Real;
   AModalResult: TModalResult;
   AShowDialog: Boolean;
   LFrmCar_Eco_ExistsException : TFrmCar_Eco_ExistsException;
begin
  if AArinvt_ID = 0 then
     EXIT;

{ TODO -oGPatil -cWebConvert : Dependency on SecurityManager.Value is nil
  if not (   SecurityManager.IsModuleLicensed( IQAppsNames[ apIQCar ])
          or SecurityManager.IsModuleLicensed( IQAppsNames[ apIQEco ])
          or SecurityManager.IsModuleLicensed( IQAppsNames[ apIQPPap ])
          or SecurityManager.IsModuleLicensed( IQAppsNames[ apQuality ])) then
     EXIT;      }

  ACarCount:= TFrmCar_Eco_ExistsException.Count_Open_CAR( AArinvt_ID );
  AEcoCount:= TFrmCar_Eco_ExistsException.Count_Open_ECO( AArinvt_ID );
  AMrbCount:= TFrmCar_Eco_ExistsException.Count_Open_MRB( AArinvt_ID );
  ADevCount:= TFrmCar_Eco_ExistsException.Count_Open_DEV( AArinvt_ID );
  APPapCount:= TFrmCar_Eco_ExistsException.Count_Open_PPAP( AArinvt_ID );

  if (ACarCount = 0) and (AEcoCount = 0) and (AMrbCount = 0) and (ADevCount = 0) and (APPapCount = 0) then
     EXIT;

  LFrmCar_Eco_ExistsException := TFrmCar_Eco_ExistsException.Create(UniGUIApplication.UniApplication);
  LFrmCar_Eco_ExistsException.Arinvt_ID:= AArinvt_ID;
  LFrmCar_Eco_ExistsException.CarCount := ACarCount;
  LFrmCar_Eco_ExistsException.EcoCount := AEcoCount;
  LFrmCar_Eco_ExistsException.MrbCount := AMrbCount;
  LFrmCar_Eco_ExistsException.DevCount := ADevCount;
  LFrmCar_Eco_ExistsException.PPapCount:= APPapCount;
  LFrmCar_Eco_ExistsException.GetLastDialogResult({var} AModalResult, {var} AShowDialog);
  if not AShowDialog then
    LFrmCar_Eco_ExistsException.ModalResult := AModalResult
  else if not (LFrmCar_Eco_ExistsException.ShowModal = mrOK) then
    raise TIQNotAuthorizedException.Create;
end;

class function TFrmCar_Eco_ExistsException.Count_Open_CAR( AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from car_item item, car where item.arinvt_id = %f and item.car_id = car.id and car.close_date is NULL and misc.eplant_filter( car.eplant_id ) = 1', [ AArinvt_ID ]);
end;

class function TFrmCar_Eco_ExistsException.Count_Open_ECO( AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from eco, eco_item item where item.arinvt_id = %f and item.eco_id = eco.id and eco.close_date is NULL and misc.eplant_filter( eco.eplant_id ) = 1', [ AArinvt_ID ]);
end;

class function TFrmCar_Eco_ExistsException.Count_Open_MRB( AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select count( distinct h.id ) from wf_header h, wf_deviation_item i where i.arinvt_id = %f and h.kind = ''MRB'' and i.wf_header_id = h.id and h.close_date is NULL and misc.eplant_filter( h.eplant_id ) = 1', [ AArinvt_ID ]);
end;

class function TFrmCar_Eco_ExistsException.Count_Open_DEV( AArinvt_ID: Real): Real;
begin
  Result:= SelectValueFmtAsFloat('select count( distinct h.id ) from wf_header h, wf_deviation_item i where i.arinvt_id = %f and h.kind = ''DEV'' and i.wf_header_id = h.id and h.complete_date is NULL and misc.eplant_filter( h.eplant_id ) = 1', [ AArinvt_ID ]);
end;

class function TFrmCar_Eco_ExistsException.Count_Open_PPAP( AArinvt_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select count(*) from ppap where arinvt_id = %f and approval_date is NULL and misc.eplant_filter( eplant_id ) = 1', [ AArinvt_ID ]);
end;

procedure TFrmCar_Eco_ExistsException.PrepareQuery( AID: Real );
begin
  with Query1 do
  begin
    Close;
    ParamByName('ID').asFloat:= 1;  {dummy param}
  end;
end;

procedure TFrmCar_Eco_ExistsException.Query1CalcFields(DataSet: TDataSet);
begin
  Query1CAR_Count.asFloat:= FCarCount;
  Query1ECO_Count.asFloat:= FEcoCount;
  Query1MRB_Count.asFloat:= FMrbCount;
  Query1DEV_Count.asFloat:= FDevCount;
  Query1PPap_Count.asFloat:= FPPapCount;

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(       'SELECT itemno,              ');
    SQL.Add(       '       descrip              ');
    SQL.Add(       '  FROM arinvt               ');
    SQL.Add(Format(' WHERE id = %.0f            ',[FArinvt_ID]));
    Open;
    Query1ArinvtItemno.AsString := Fields[0].AsString;
    Query1ArinvtDescrip.AsString := Fields[1].AsString;
  finally
    Free;
  end;
end;

procedure TFrmCar_Eco_ExistsException.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID:= Value;
end;

procedure TFrmCar_Eco_ExistsException.SetCarCount(const Value: Real);
begin
  FCarCount := Value;
end;

procedure TFrmCar_Eco_ExistsException.SetDevCount(const Value: Real);
begin
  FDevCount := Value;
end;

procedure TFrmCar_Eco_ExistsException.SetEcoCount(const Value: Real);
begin
  FEcoCount := Value;
end;

procedure TFrmCar_Eco_ExistsException.SetMrbCount(const Value: Real);
begin
  FMrbCount := Value;
end;

procedure TFrmCar_Eco_ExistsException.SetPPapCount(const Value: Real);
begin
    FPPapCount:= Value;
end;

procedure TFrmCar_Eco_ExistsException.btnDetailsClick(Sender: TObject);
begin
  inherited; {nothing}
  ShowCAR_ECO_Exist(FArinvt_ID ); {CAR_ECO_Exist.pas}
end;


end.
