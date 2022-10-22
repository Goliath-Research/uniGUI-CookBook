unit TrLogKid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Trlogall,
  Data.DB,
  Mask,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniStatusBar, uniGUIClasses, uniEdit, uniDBNavigator,
  uniButton, uniBitBtn, uniSpeedButton, uniLabel, IQMS.WebVcl.UserDefinedLabel,
  IQUniGrid, Vcl.Forms, uniGUIFrame, Vcl.Controls, uniGUIBaseClasses, uniPanel;

type
  TFrmTransLogBatch = class(TFrmTransLogItems)
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FParent_Arinvt_ID: Real;
    FBatch: Real ;
    FSub_Batch: Real;
  public
    { Public declarations }
    constructor Create(  AParent_Arinvt_ID, ABatch: Real; ASub_Batch: Real = 0 );
  end;

procedure DoTransLogBatch(AParent_Arinvt_ID, ABatch: Real; ASub_Batch: Real = 0);


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers;

procedure DoTransLogBatch( AParent_Arinvt_ID, ABatch: Real; ASub_Batch: Real = 0);
begin
  TFrmTransLogBatch.Create( AParent_Arinvt_ID, ABatch, ASub_Batch ).Show;
end;

constructor TFrmTransLogBatch.Create(AParent_Arinvt_ID, ABatch: Real; ASub_Batch: Real = 0 );
var
  AItemNo: string;
begin
  FParent_Arinvt_ID:= AParent_Arinvt_ID;
  FBatch:= ABatch;
  FSub_Batch:= ASub_Batch;

  inherited Create( 0 );

  AItemNo:= SelectValueFmtAsString( 'select itemno from translog where arinvt_id = %f and sub_batch = %f', [ AParent_Arinvt_ID, ASub_Batch ]);
  if AItemNo = '' then
     AItemNo:= SelectValueFmtAsString( 'select itemno from translog where arinvt_id = %f order by id desc', [ AParent_Arinvt_ID ]);
  Caption:= Format('Dependent Transactions for %s', [ AItemNo ]);
end;


procedure TFrmTransLogBatch.QryTransLogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'Batch', FBatch);
  AssignQueryParamValue(DataSet, 'Parent_Arinvt_ID', fIIf(FParent_Arinvt_ID = 0, -1, FParent_Arinvt_ID));
  AssignQueryParamValue(DataSet, 'sub_batch', FSub_Batch);

  inherited;
end;

end.

