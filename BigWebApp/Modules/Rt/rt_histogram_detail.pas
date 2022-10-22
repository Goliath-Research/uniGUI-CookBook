unit rt_histogram_detail;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
//  IQMS.Common.UserMessages,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Controls,
  Vcl.Grids;

type
  TTFrmRTHistogramDetail = class(TUniForm)
    pnlDetails: TUniPanel;
//    wwDataInspector1: TwwDataInspector;
    SrcHistogram: TDataSource;
    QryHistogram: TFDQuery;
    QryHistogramID: TBCDField;
    QryHistogramDAYPROD_ID: TBCDField;
    QryHistogramPROD_DATE: TDateTimeField;
    QryHistogramSHIFT: TBCDField;
    QryHistogramSTART_TIME: TDateTimeField;
    QryHistogramEND_TIME: TDateTimeField;
    QryHistogramEVENT: TStringField;
    QryHistogramSTATE: TStringField;
    QryHistogramHIST_ILLUM_RT_ID: TBCDField;
    QryHistogramRAW_END_TIME: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryHistogramBeforeOpen(DataSet: TDataSet);
    procedure QryHistogramAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FHist_Illum_Log_ID: Real;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    constructor Create( AHist_Illum_Log_ID: Real );
    class procedure DoShow( AHist_Illum_Log_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

{ TTFrmRTHistogramDetail }

constructor TTFrmRTHistogramDetail.Create( AHist_Illum_Log_ID: Real );
begin
  FHist_Illum_Log_ID:= AHist_Illum_Log_ID;
  inherited Create(uniGUIApplication.UniApplication);
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  FormStyle:= fsStayOnTop;
end;

class procedure TTFrmRTHistogramDetail.DoShow( AHist_Illum_Log_ID: Real );
begin
  if IQMS.Common.Controls.FindFormByClassType( self ) <> nil then
     PostMessageToForm(self,iq_notify, 0, Trunc(AHist_Illum_Log_ID))
  else
     self.Create(AHist_Illum_Log_ID).Show;
end;

procedure TTFrmRTHistogramDetail.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TTFrmRTHistogramDetail.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    0: begin
         FHist_Illum_Log_ID:= Msg.LParam;
         Reopen(QryHistogram);
       end;
  end;
end;

procedure TTFrmRTHistogramDetail.QryHistogramBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('hist_illum_log_id').Value := FHist_Illum_Log_ID;
  AssignQueryParamValue( DataSet, 'hist_illum_log_id', FHist_Illum_Log_ID )
end;

procedure TTFrmRTHistogramDetail.QryHistogramAfterOpen(DataSet: TDataSet);
begin
  IQMS.Common.Controls.ForceForegroundWindowB( self.Handle ); {IQMS.Common.Controls.pas}
end;

end.
