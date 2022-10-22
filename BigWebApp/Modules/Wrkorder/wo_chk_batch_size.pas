unit wo_chk_batch_size;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel;

type
  TFrmWorkorderBatchSizeException = class(TFrmStatusException)
    Label4: TUniLabel;
    DBEdit4: TUniDBEdit;
    Label5: TUniLabel;
    DBEdit5: TUniDBEdit;
  private
    { Private declarations }
    FQuan: Real;
    FID: Real;
    procedure SetAID(const Value: Real);
    procedure SetAQuan(const Value: Real);
  protected
    procedure PrepareQuery( AID: Real ); override;
  public
    { Public declarations }

    property ID : Real write SetAID;
    property Quan : Real write SetAQuan;
  end;

procedure CheckWorkorderMaxBatchSize( AWorkorder_ID, AQuan: Real );

var
  FrmWorkorderBatchSizeException: TFrmWorkorderBatchSizeException;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure CheckWorkorderMaxBatchSize( AWorkorder_ID, AQuan: Real );
var
  AMaxWoBatchSize: Real;
begin
  AMaxWoBatchSize:= SelectValueFmtAsFloat('select s.batch_size            '+
                              '  from workorder w, standard s '+
                              ' where w.id = %f               '+
                              '   and w.standard_id = s.id    ',
                              [ AWorkorder_ID ]);


  if (AMaxWoBatchSize > 0) and (AQuan > AMaxWoBatchSize) then
  begin
    FrmWorkorderBatchSizeException := TFrmWorkorderBatchSizeException.Create(UniGUIApplication.UniApplication);
    FrmWorkorderBatchSizeException.Quan:= AQuan;
    FrmWorkorderBatchSizeException.id := AWorkorder_ID;
     with FrmWorkorderBatchSizeException do
     try
       if not (ShowModal = mrOK) then
          raise TIQNotAuthorizedException.Create;  //raise Exception.Create('Status exception has not been authorized - unable to proceed');
     finally
       Release;
     end;
  end;
end;

{ TFrmWorkorderBatchSizeException }

procedure TFrmWorkorderBatchSizeException.PrepareQuery(AID: Real);
begin
  inherited;

  AssignQueryParamValue(Query1, 'quan', FQuan);
end;


procedure TFrmWorkorderBatchSizeException.SetAID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmWorkorderBatchSizeException.SetAQuan(const Value: Real);
begin
  FQuan := Value;
end;

end.
