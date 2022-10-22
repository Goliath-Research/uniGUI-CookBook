unit bom_pts_per_check;

interface

uses
  Winapi.Windows,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
  Mask,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client, uniButton, uniCheckBox, uniPanel, uniGUIClasses, uniEdit,
  uniDBEdit, uniLabel, uniPageControl, uniGUIBaseClasses,uniGUIApplication;

type
  TFrmBOMPtsPerException = class(TFrmStatusException)
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FSndop_ID : Real;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
  public
    { Public declarations }
    property Sndop_ID : Real write SetSndop_ID;
    property Arinvt_ID : Real write SetArinvt_ID;
  end;

procedure CheckBOMPtsPerIsZero( AOpmat_ID: Real; APtsPer: Real ); overload;
procedure CheckBOMPtsPerIsZero( ASndop_ID, AArinvt_ID: Real; APtsPer: Real ); overload;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckBOMPtsPerIsZero( AOpmat_ID: Real; APtsPer: Real );
var
  ASndop_ID : Real;
  AArinvt_ID: Real;
  A: Variant;
begin
  if not (Abs(APtsPer) <= 0.000001) then
     EXIT;

  A:= SelectValueArrayFmt('select sndop_id, arinvt_id from opmat where id = %f', [ AOpmat_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;
  ASndop_ID := A[0];
  AArinvt_ID:= A[1];

  CheckBOMPtsPerIsZero( ASndop_ID, AArinvt_ID, APtsPer );
end;


procedure CheckBOMPtsPerIsZero( ASndop_ID, AArinvt_ID: Real; APtsPer: Real );
var
  LFrmBOMPtsPerException : TFrmBOMPtsPerException;
begin
  if not (Abs(APtsPer) <= 0.000001) then
     EXIT;

  LFrmBOMPtsPerException := TFrmBOMPtsPerException.Create(UniGUIApplication.UniApplication);
  LFrmBOMPtsPerException.Sndop_ID := ASndop_ID;
  LFrmBOMPtsPerException.Arinvt_ID:= AArinvt_ID;
  if not (LFrmBOMPtsPerException.ShowModal = mrOK) then
     raise TIQNotAuthorizedException.Create;
end;

procedure TFrmBOMPtsPerException.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;  // n

  // with Query1 do
  // begin
  //   ParamByName('ID').Value := FSndop_ID;
  //   ParamByName('arinvt_id').Value := FArinvt_ID;
  // end;
  AssignQueryParamValue(DataSet, 'id', FSndop_ID);
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmBOMPtsPerException.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmBOMPtsPerException.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

end.
