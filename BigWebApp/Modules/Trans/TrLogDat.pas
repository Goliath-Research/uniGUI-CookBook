unit TrLogDat;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Trlogitm,
  Data.DB,
  Mask,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniStatusBar, uniGUIClasses, uniEdit, uniDBNavigator,
  uniButton, uniBitBtn, uniSpeedButton, uniLabel, IQMS.WebVcl.UserDefinedLabel,
  IQUniGrid, uniGUIFrame, System.Classes, Vcl.Controls, uniGUIBaseClasses,
  uniPanel,
  UniGUIApplication;

type
  TFrmTransLogBetweenDates = class(TFrmTransLogSingle)
    procedure FormShow(Sender: TObject);
    procedure QryTransLogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FDateStart: TDateTime;
    FDateEnd  : TDateTime;
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetDateEnd(const Value: TDateTime);
    procedure SetDateStart(const Value: TDateTime);
  protected
  public
    { Public declarations }
    property Arinvt_ID:Real write SetArinvt_ID;
    property DateStart: TDateTime write SetDateStart;
    property DateEnd: TDateTime write SetDateEnd;
  end;

procedure DoTransLogBetweenDates( AArinvt_ID:Real; ADateStart, ADateEnd: TDateTime );



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure DoTransLogBetweenDates( AArinvt_ID:Real; ADateStart, ADateEnd: TDateTime );
var
  FrmTransLogBetweenDates: TFrmTransLogBetweenDates;
begin
  FrmTransLogBetweenDates := TFrmTransLogBetweenDates.Create(AArinvt_ID);
  with FrmTransLogBetweenDates do
  begin
    DateStart:= ADateStart;
    DateEnd  := ADateEnd  ;
    Arinvt_ID:= AArinvt_ID;
  end;
  FrmTransLogBetweenDates.Show;
end;

procedure TFrmTransLogBetweenDates.FormShow(Sender: TObject);
begin
  inherited;
  Caption:= Caption + Format(' between %s and %s', [ DateToStr( FDateStart ), DateToStr( FDateEnd )]);
end;

procedure TFrmTransLogBetweenDates.QryTransLogBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', FArinvt_ID);
  AssignQueryParamValue(DataSet, 'date_start', FDateStart);
  AssignQueryParamValue(DataSet, 'date_end', FDateEnd);
  inherited;
end;

procedure TFrmTransLogBetweenDates.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmTransLogBetweenDates.SetDateEnd(const Value: TDateTime);
begin
  FDateEnd := Value;
end;

procedure TFrmTransLogBetweenDates.SetDateStart(const Value: TDateTime);
begin
  FDateStart := Value;
end;

end.

