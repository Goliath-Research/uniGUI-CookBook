unit RTCycles_Hist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.wwDataInspector,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  VclTee.TeeGDIPlus,
  VCLTee.TeEngine,
  VCLTee.Series,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, Vcl.ExtCtrls, Vcl.Controls,
  Vcl.Grids;

type
  TFrmRTCyclesArchive = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    SrcIllmCyclesHist: TDataSource;
    QryIllmCyclesHist: TFDQuery;
    QryIllmCyclesHistCYCLE_TIME: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    sbtnPage1: TUniSpeedButton;
    sbtnPagePrev: TUniSpeedButton;
    sbtnPageNext: TUniSpeedButton;
    sbtnPageLast: TUniSpeedButton;
    QryIllmCyclesHistSEQ: TFMTBCDField;
    Panel4: TUniPanel;
    sbtnRefresh: TUniSpeedButton;
    SrcDayprod: TDataSource;
    QryDayprod: TFDQuery;
    QryDayprodHIST_ILLUM_RT_ID: TBCDField;
    QryDayprodDAYPROD_ID: TBCDField;
    QryDayprodPROD_DATE: TDateTimeField;
    QryDayprodMFG_TYPE: TStringField;
    QryDayprodMFGCELL: TStringField;
    QryDayprodMFGNO: TStringField;
    QryDayprodFG_LOTNO: TStringField;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    QryDayprodSHIFT: TBCDField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    wwDataInspector1: TwwDataInspector;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure QryIllmCyclesHistBeforeOpen(DataSet: TDataSet);
    procedure sbtnPage1Click(Sender: TObject);
    procedure sbtnPageLastClick(Sender: TObject);
    procedure sbtnPagePrevClick(Sender: TObject);
    procedure sbtnPageNextClick(Sender: TObject);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDayprod_ID: Real;
    procedure PopulateDataInspector;
    function WhereIs( ADayprod_ID: Real ): string;
    procedure SetDayprod_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( ADayprod_ID: Real );
    property Dayprod_ID : Real write SetDayprod_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

{ TFrmRTCyclesArchive }

class procedure TFrmRTCyclesArchive.DoShow( ADayprod_ID: Real );
var
  LFrmRTCyclesArchive : TFrmRTCyclesArchive;
begin
  LFrmRTCyclesArchive := TFrmRTCyclesArchive.Create(UniGUIApplication.UniApplication);
  with LFrmRTCyclesArchive do
  begin
    Dayprod_ID := ADayprod_ID;
    Show;
  end;
end;

procedure TFrmRTCyclesArchive.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmRTCyclesArchive.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRTCyclesArchive.Print1Click(Sender: TObject);
begin
  IQRepdef1.Execute;
end;

procedure TFrmRTCyclesArchive.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRTCyclesArchive.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmRTCyclesArchive.QryIllmCyclesHistBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('dayprod_id').Value := FDayprod_ID;
  AssignQueryParamValue(DataSet, 'dayprod_id', FDayprod_ID, ftBCD);
end;

procedure TFrmRTCyclesArchive.sbtnPage1Click(Sender: TObject);
begin
  { TODO : TDBChart not converted yet }
  //DBChart1.Page:= 1;
end;

procedure TFrmRTCyclesArchive.sbtnPageLastClick(Sender: TObject);
begin
  { TODO : TDBChart not converted yet }
  //DBChart1.Page:= DBChart1.NumPages;
end;

procedure TFrmRTCyclesArchive.sbtnPagePrevClick(Sender: TObject);
begin
{ TODO : TDBChart not converted yet }
 // if DBChart1.Page > 1 then
 //    DBChart1.Page:= DBChart1.Page - 1;
end;

procedure TFrmRTCyclesArchive.sbtnPageNextClick(Sender: TObject);
begin
{ TODO : TDBChart not converted yet }
//  if DBChart1.Page < DBChart1.NumPages then
//     DBChart1.Page:= DBChart1.Page + 1;
end;

procedure TFrmRTCyclesArchive.sbtnRefreshClick(Sender: TObject);
begin
  Reopen( QryIllmCyclesHist );
  { TODO : TDBChart not converted yet }
 // DBChart1.RefreshData;
end;

procedure TFrmRTCyclesArchive.SetDayprod_ID(const Value: Real);
begin
  FDayprod_ID := Value;
end;

procedure TFrmRTCyclesArchive.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);

  PopulateDataInspector;
end;

procedure TFrmRTCyclesArchive.PopulateDataInspector;
const
  cSQL_CURRENT =  'select illum_rt.id as hist_illum_rt_id,                               '+
                  '       illum_rt.dayprod_id,                                           '+
                  '       v.prod_date,                                                   '+
                  '       v.prod_shift shift,                                            '+
                  '       h.mfg_type,                                                    '+
                  '       h.mfgcell,                                                     '+
                  '       h.mfgno,                                                       '+
                  '       s.fg_lotno                                                     '+
                  '  from illum_rt,                                                      '+
                  '       hist_illum_rt h,                                               '+
                  '       v_mfgcell_param_all v,                                         '+
                  '       standard s                                                     '+
                  ' where illum_rt.cntr_sched_id is not NULL                             '+
                  '   and h.id = illum_rt.id                                             '+
                  '   and NVL(RTrim(h.mfgcell), ''~'') = NVL(RTrim(v.mfgcell(+)), ''~'') '+
                  '   and h.standard_id = s.id(+)                                        '+
                  '   and illum_rt.dayprod_id = :dayprod_id';

  cSQL_XDAYPROD = 'select x.hist_illum_rt_id,       '+
                  '       x.id as dayprod_id,       '+
                  '       x.prod_date,              '+
                  '       x.shift,                  '+
                  '       h.mfg_type,               '+
                  '       h.mfgcell,                '+
                  '       h.mfgno,                  '+
                  '       x.fg_lotno                '+
                  '  from xdayprod x,               '+
                  '       hist_illum_rt h           '+
                  ' where                           '+
                  '       x.hist_illum_rt_id = h.id '+
                  '   and x.id = :dayprod_id';

  cSQL_DAYPROD  = 'select x.hist_illum_rt_id,       '+
                  '       x.id as dayprod_id,       '+
                  '       x.prod_date,              '+
                  '       x.shift,                  '+
                  '       h.mfg_type,               '+
                  '       h.mfgcell,                '+
                  '       h.mfgno,                  '+
                  '       x.fg_lotno                '+
                  '  from dayprod x,                '+
                  '       hist_illum_rt h           '+
                  ' where                           '+
                  '       x.hist_illum_rt_id = h.id '+
                  '   and x.id = :dayprod_id';

  cSQL_PDAYPROD = 'select x.hist_illum_rt_id,       '+
                  '       x.id as dayprod_id,       '+
                  '       x.prod_date,              '+
                  '       x.shift,                  '+
                  '       h.mfg_type,               '+
                  '       h.mfgcell,                '+
                  '       h.mfgno,                  '+
                  '       x.fg_lotno                '+
                  '  from pdayprod x,               '+
                  '       hist_illum_rt h           '+
                  ' where                           '+
                  '       x.hist_illum_rt_id = h.id '+
                  '   and x.id = :dayprod_id';
var
  AWhereIs: string;
  ASQL    : string;
begin
  AWhereIs:= WhereIs( FDayprod_ID );

  {Reassign SQL on fly depending where dayprod_id is found}
  if CompareText( AWhereIs, 'ILLUM_RT' ) = 0 then
     ASQL:= cSQL_CURRENT
  else if CompareText( AWhereIs, 'XDAYPROD' ) = 0 then
     ASQL:= cSQL_XDAYPROD
  else if CompareText( AWhereIs, 'DAYPROD' ) = 0 then
     ASQL:= cSQL_DAYPROD
  else if CompareText( AWhereIs, 'PDAYPROD' ) = 0 then
     ASQL:= cSQL_PDAYPROD
  else
     raise Exception.Create( Format('Unable to establish source of Dayprod_ID = %.0f', [ FDayprod_ID ]));

  with QryDayprod do
  begin
    Close;
    SQL.Clear;
    SQL.Add( ASQL );
    Open;
  end;
end;

function TFrmRTCyclesArchive.WhereIs( ADayprod_ID: Real ): string;
begin
  if SelectValueFmtAsFloat('select 1 from illum_rt where dayprod_id = %f', [ ADayprod_ID ]) = 1 then
  begin
    Result:= 'ILLUM_RT';
    EXIT;
  end;

  if SelectValueFmtAsFloat('select 1 from xdayprod where id = %f', [ ADayprod_ID ]) = 1 then
  begin
    Result:= 'XDAYPROD';
    EXIT;
  end;

  if SelectValueFmtAsFloat('select 1 from dayprod where id = %f', [ ADayprod_ID ]) = 1 then
  begin
    Result:= 'DAYPROD';
    EXIT;
  end;

  if SelectValueFmtAsFloat('select 1 from pdayprod where id = %f', [ ADayprod_ID ]) = 1 then
  begin
    Result:= 'PDAYPROD';
    EXIT;
  end;
end;


procedure TFrmRTCyclesArchive.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRTCyclesArchive.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
