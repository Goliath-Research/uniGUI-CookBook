unit inv_calc_uom_factor;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmCalcUOMFactor = class(TUniForm)
    Label1: TUniLabel;
    edSPG: TUniEdit;
    Label2: TUniLabel;
    edLength: TUniEdit;
    Label3: TUniLabel;
    edWidth: TUniEdit;
    Label4: TUniLabel;
    edGauge: TUniEdit;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource: TDataSource;
    procedure SetDataSource(Value: TDataSource);
  public
    { Public declarations }
    property DataSource : TDataSource read FDataSource write SetDataSource;
    class function DoShowModal(ADataSource: TDataSource {arinvt}): Boolean;
  end;


implementation

uses
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  MainModule,
  FireDAC.Comp.Client;

{$R *.dfm}

{ TFrmCalcUOMFactor }

class function TFrmCalcUOMFactor.DoShowModal(ADataSource: TDataSource): Boolean;
var
  frm: TFrmCalcUOMFactor;
begin
  frm := TFrmCalcUOMFactor.Create(uniGUIApplication.UniApplication);
  frm.FDataSource := ADataSource;
  Result:= (frm.ShowModal = mrOK);
end;

procedure TFrmCalcUOMFactor.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmCalcUOMFactor.UniFormShow(Sender: TObject);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select length, width, gauge, spg from arinvt where id = %f', [ FDataSource.DataSet.FieldByName('id').asFloat ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    edLength.Text:= FloatToStr( A[ 0 ]);
    edWidth.Text := FloatToStr( A[ 1 ]);
    edGauge.Text := FloatToStr( A[ 2 ]);
    edSPG.Text   := FloatToStr( A[ 3 ]);
  end;
end;


procedure TFrmCalcUOMFactor.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmCalcUOMFactor.SetDataSource(Value: TDataSource);
begin
  FDataSource := Value;
end;


procedure TFrmCalcUOMFactor.btnOKClick(Sender: TObject);
begin
  with TFDStoredProc.Create(nil) do
  {PROCEDURE set_inv_uom_calc_factor_dims
  ( p_arinvt_id IN NUMBER,
    p_length    IN NUMBER,
    p_width     IN NUMBER,
    p_gauge     IN NUMBER,
    p_spg       IN NUMBER )}
  try
    ConnectionName := cnstFDConnectionName;
    StoredProcName:= 'IQMS.INV_MISC.SET_INV_UOM_CALC_FACTOR_DIMS';
    Params.CreateParam( ftFMTBcd, 'p_arinvt_id', ptInput ).AsFMTBCD := Trunc( FDataSource.DataSet.FieldByName('id').AsFloat );
    Params.CreateParam( ftFMTBcd, 'p_length', ptInput ).AsFMTBCD := StrToFloat( edLength.Text );
    Params.CreateParam( ftFMTBcd, 'p_width', ptInput ).AsFMTBCD := StrToFloat( edWidth.Text );
    Params.CreateParam( ftFMTBcd, 'p_gauge', ptInput ).AsFMTBCD := StrToFloat( edGauge.Text );
    Params.CreateParam( ftFMTBcd, 'p_spg', ptInput ).AsFMTBCD := StrToFloat( edSPG.Text );
    Prepare;
    Execute;
  finally
    Free;
  end;

  (* Migrated to SP 07-28-15 AMB HTML5 Refactor

  procedure Validate(AEdit: TEdit; AFieldName: string );
  begin
    try
      IQAssert( StrToFloat( AEdit.Text ) > 0, Format('Field %s must have value.', [ AFieldName ]));
    except on E: Exception do
      raise Exception.CreateFmt('Field %s: %s', [ AFieldName, E.Message ]);
    end;
  end;

begin
  Validate(edLength, 'Length');
  Validate(edWidth,  'Width' );
  Validate(edGauge,  'Gauge' );
  Validate(edSPG,    'SPG'   );

  ExecuteCommandFmt('update arinvt         '+
            '   set length = %.6f, '+
           '        width  = %.6f, '+
           '        gauge  = %.6f, '+
           '        spg    = %.6f  '+
           '  where id = %f        ',
           [ StrToFloat( edLength.Text ),
             StrToFloat( edWidth.Text  ),
             StrToFloat( edGauge.Text   ),
             StrToFloat( edSPG.Text    ),
             FDataSource.DataSet.FieldByName('id').asFloat ]);
  *)

  ModalResult:= mrOK;
end;


end.
