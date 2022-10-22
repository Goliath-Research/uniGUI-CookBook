unit Rt_RejRep;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  VclTee.TeeGDIPlus,
  VCLTee.Series,
  VCLTee.TeEngine,
  VCLTee.TeeProcs,
  VCLTee.Chart,
  VCLTee.DBChart,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, Vcl.ExtCtrls, Vcl.Controls,
  Vcl.Grids, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmRT_RejRep = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    MainMenu1: TUniMainMenu;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Splitter1: TUniSplitter;
    File2: TUniMenuItem;
    Exit2: TUniMenuItem;
    StatusBar1: TUniStatusBar;
    Splitter2: TUniSplitter;
    Panel3: TUniPanel;
    SrcHeader: TDataSource;
    QryHeader: TFDQuery;
    QryHeaderITEMNO: TStringField;
    QryHeaderDESCRIP: TStringField;
    QryHeaderEQNO: TStringField;
    QryHeaderMFGNO: TStringField;
    QryHeaderCLASS: TStringField;
    QryHeaderREV: TStringField;
    Panel4: TUniPanel;
    QryHeaderDESCRIP2: TStringField;
    QryTrend: TFDQuery;
    QryTrendTIME_STAMP: TDateTimeField;
    QryTrendTOTAL_REJECTS: TFMTBCDField;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QryPareto: TFDQuery;
    QryParetoREJECT_CODE: TStringField;
    QryParetoTOTAL_REJECTS: TFMTBCDField;
    QryTrendTimeDisp: TStringField;
    tmRefresh: TUniTimer;
    Panel5: TUniPanel;
    Label5: TUniLabel;
    Panel6: TUniPanel;
    Label3: TUniLabel;
    Contents1: TUniMenuItem;
    QryHeaderCNTR_DESC: TStringField;
    Panel9: TUniPanel;
    Panel7: TUniPanel;
    Bevel1: TUniPanel;
    Panel8: TUniPanel;
    Bevel3: TUniPanel;
    chkFilterOneItem: TUniCheckBox;
    Splitter3: TUniSplitter;
    PkMfg: TIQWebHPick;
    PkMfgMFGNO: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgCOMPANY: TStringField;
    PkMfgID: TBCDField;
    PkMfgMFG_TYPE: TStringField;
    PkMfgDESCRIP2: TStringField;
    PkMfgDIVISION_ID: TBCDField;
    PkMfgEPLANT_ID: TBCDField;
    PkMfgPK_HIDE: TStringField;
    PkMfgSTANDARD_DESCRIP: TStringField;
    PkWorkCenter: TIQWebHPick;
    PkWorkCenterID: TBCDField;
    PkWorkCenterEQNO: TStringField;
    PkWorkCenterCNTR_DESC: TStringField;
    Panel10: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    wwDBDateTimePickerProdDate: TUniDBDateTimePicker;
    ComboBoxShift: TUniComboBox;
    Label4: TUniLabel;
    Label6: TUniLabel;
    wwDBComboDlgMfg: TUniEdit;
    wwDBComboDlgWorkCenter: TUniEdit;
    Panel11: TUniPanel;
    Bevel2: TUniPanel;
    Label7: TUniLabel;
    sbtnApply: TUniSpeedButton;
    Bevel4: TUniPanel;
    SecurityRegister1: TIQWebSecurityRegister;
    DBChartTrend: TDBChart;
    Series1: TLineSeries;
    DBChartPareto: TDBChart;
    Series2: TBarSeries;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApplyClick(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure QryTrendCalcFields(DataSet: TDataSet);
    procedure tmRefreshTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure wwDBComboDlgMfgCustomDlg(Sender: TObject);
    procedure CheckDeleteKey(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwDBComboDlgWorkCenterCustomDlg(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryTrendBeforeOpen(DataSet: TDataSet);
    procedure QryParetoBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FIllum_Part_ID  : Real;
    FProd_Date      : TDateTime;
    FShift          : Real;
    FRT_Refresh_Time: Integer;
    FStandard_ID    : Real;
    FWork_Center_ID : Real;
    procedure RefreshDataSets;
  public
    { Public declarations }
    class procedure DoShow( AProd_Date: TDateTime; AShift, AIllum_Part_ID: Real );
  end;



implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.Dates,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWC : Need to revisit }
  //iqsecins,
  RT_rscstr;

{ TFrmRT_RejRep }

class procedure TFrmRT_RejRep.DoShow(  AProd_Date: TDateTime; AShift, AIllum_Part_ID: Real );
var
  FrmRT_RejRep: TFrmRT_RejRep;
begin
  FrmRT_RejRep := self.Create(UniGUIApplication.UniApplication );
  with FrmRT_RejRep do
  begin
    FIllum_Part_ID:= AIllum_Part_ID;
    FProd_Date    := AProd_Date;
    FShift        := AShift;
  end;
  FrmRT_RejRep.Show;
end;

procedure TFrmRT_RejRep.UniFormCreate(Sender: TObject);
begin
  {timer}
  FRT_Refresh_Time:= Trunc(SelectValueAsFloat('select rt_refresh_time from params'));
  if FRT_Refresh_Time >= 5 then
    tmRefresh.Interval:= FRT_Refresh_Time * 1000;
  tmRefresh.Enabled:= TRUE;
end;

procedure TFrmRT_RejRep.FormShow(Sender: TObject);
begin

  wwDBDateTimePickerProdDate.DateTime:= FProd_Date;
  with ComboBoxShift do ItemIndex:= Items.IndexOf( FloatToStr( FShift ));

  IQSetTablesActiveEx(TRUE, self, '');
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormRead( self, [self])
  else
    { TODO -oSanketG -cWC : Need to revisit ,
    [dcc32 Error] Rt_RejRep.pas(223): E2010 Incompatible types: 'TForm' and 'TFrmRT_RejRep'}
    //IQMS.Common.Controls.CenterForm(Self, True);
  { TODO -oSanketG -cWC : Need to revisit , dependent on iqsecins}
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmRT_RejRep.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRT_RejRep.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormWrite( self, [self]);
end;

procedure TFrmRT_RejRep.sbtnApplyClick(Sender: TObject);
begin
  FProd_Date:= wwDBDateTimePickerProdDate.DateTime;

  with ComboBoxShift do
    if Text > '' then
       FShift:= StrToFloat( Text )
    else
       FShift:= 0;

  RefreshDataSets;
end;

procedure TFrmRT_RejRep.Exit2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRT_RejRep.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmRT_RejRep.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmRT_RejRep.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmRT_RejRep.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'Illum_Part_ID', Trunc(FIllum_Part_ID))
end;

procedure TFrmRT_RejRep.QryParetoBeforeOpen(DataSet: TDataSet);
begin
  // 11/11/2015 (Byron, EIQ-9250) Original issue reported slowness for QryTrend.
  // Found that if params were used and assigned before opening query,
  // that slowness occurred.  The solution is not to use params, but rebuild
  // the SQL.
  with QryPareto do
   begin
     SQL.Clear;
     Params.Clear;
     SQL.Add('  SELECT r.reject_code,                                       ');
     SQL.Add('         SUM(r.rejects) AS total_rejects                      ');
     SQL.Add('    FROM hist_illum_rt rt,                                    ');
     SQL.Add('         hist_illum_part p,                                   ');
     SQL.Add('         rejects r,                                           ');
     // work_center is used to get eplant_id
     SQL.Add('         work_center w                                        ');
     SQL.Add('   WHERE rt.id = p.hist_illum_rt_id AND                       ');
     SQL.Add('         p.id = r.hist_illum_part_id AND                      ');
     SQL.Add('         rt.work_center_id = w.id(+) AND                      ');

     // Filter
     if chkFilterOneItem.Checked and (Trunc(FIllum_Part_ID) > 0) then
     SQL.Add(Format('          r.hist_illum_part_id = %d AND                ',[Trunc(FIllum_Part_ID)]));
     if IQMS.Common.Dates.ValidDate(FProd_Date) then
     SQL.Add(Format('          r.prod_date = TO_DATE(''%s'', ''MM/DD/RRRR'') AND ',[FormatDateTime('mm/dd/yyyy', FProd_Date)]));
     if Trunc(FShift) > 0 then
     SQL.Add(Format('          r.shift = %d AND                             ', [Trunc(FShift)]));
     if Trunc(FStandard_ID) > 0 then
     SQL.Add(Format('          rt.standard_id = %d AND                      ',[Trunc(FStandard_ID)]));
     if Trunc(FWork_Center_ID) > 0 then
     SQL.Add(Format('          rt.work_center_id = %d AND                   ',[Trunc(FWork_Center_ID)]));

     // Additional
     SQL.Add('         misc.eplant_filter(w.eplant_id) = 1                  ');
     SQL.Add('GROUP BY r.reject_code                                        ');
     SQL.Add('ORDER BY 2 DESC                                               ');
     // For debugging:
     // editmemostr.DoViewMemoStr(Self, SQL.Text);
   end;
end;

procedure TFrmRT_RejRep.QryTrendBeforeOpen(DataSet: TDataSet);
begin
  // 11/11/2015 (Byron, EIQ-9250) Original issue reported slowness for QryTrend.
  // Found that if params were used and assigned before opening query,
  // that slowness occurred.  The solution is not to use params, but rebuild
  // the SQL.
  with QryTrend do
   begin
     SQL.Clear;
     Params.Clear;
     SQL.Add('  SELECT r1.time_stamp,                                       ');
     SQL.Add('         SUM(r2.rejects) AS total_rejects                     ');
     SQL.Add('    FROM v_report_rejects r1, v_report_rejects r2             ');
     SQL.Add('   WHERE                                                      ');
     // filter on v_report_rejects r1
     if chkFilterOneItem.Checked and (Trunc(FIllum_Part_ID) > 0) then
     SQL.Add(Format('          r1.hist_illum_part_id = %d AND               ',[Trunc(FIllum_Part_ID)]));
     if IQMS.Common.Dates.ValidDate(FProd_Date) then
     SQL.Add(Format('          r1.prod_date = TO_DATE(''%s'', ''MM/DD/RRRR'') AND ',[FormatDateTime('mm/dd/yyyy', FProd_Date)]));
     if Trunc(FShift) > 0 then
     SQL.Add(Format('          r1.shift = %d AND                            ', [Trunc(FShift)]));
     if Trunc(FStandard_ID) > 0 then
     SQL.Add(Format('          r1.standard_id = %d AND                      ',[Trunc(FStandard_ID)]));
     if Trunc(FWork_Center_ID) > 0 then
     SQL.Add(Format('          r1.work_center_id = %d AND                   ',[Trunc(FWork_Center_ID)]));
     // filter on v_report_rejects r2
     if chkFilterOneItem.Checked and (Trunc(FIllum_Part_ID) > 0) then
     SQL.Add(Format('          r2.hist_illum_part_id = %d AND               ',[Trunc(FIllum_Part_ID)]));
     if IQMS.Common.Dates.ValidDate(FProd_Date) then
     SQL.Add(Format('          r2.prod_date = TO_DATE(''%s'', ''MM/DD/RRRR'') AND ',[FormatDateTime('mm/dd/yyyy', FProd_Date)]));
     if Trunc(FShift) > 0 then
     SQL.Add(Format('          r2.shift = %d AND                            ', [Trunc(FShift)]));
     if Trunc(FStandard_ID) > 0 then
     SQL.Add(Format('          r2.standard_id = %d AND                      ',[Trunc(FStandard_ID)]));
     if Trunc(FWork_Center_ID) > 0 then
     SQL.Add(Format('          r2.work_center_id = %d AND                   ',[Trunc(FWork_Center_ID)]));
     // Other filter
     SQL.Add('         r2.time_stamp <= r1.time_stamp AND                   ');
     SQL.Add('         misc.eplant_filter(r1.eplant_id) = 1 AND             ');
     SQL.Add('         misc.eplant_filter(r2.eplant_id) = 1                 ');
     SQL.Add('GROUP BY r1.time_stamp                                        ');
     // For debugging:
     // editmemostr.DoViewMemoStr(Self, SQL.Text);
   end;
end;

procedure TFrmRT_RejRep.QryTrendCalcFields(DataSet: TDataSet);
begin
  QryTrendTimeDisp.asString:= TimeToStr( QryTrendTIME_STAMP.asDateTime )
end;

procedure TFrmRT_RejRep.RefreshDataSets;
begin
  if Showing then
    //rt_rscstr.cTXT000026 = 'Refreshing data ...'
    IQMS.Common.Controls.SetStatus(StatusBar1, rt_rscstr.cTXT000026);

  Reopen(QryHeader);

  Reopen(QryTrend);
  DBChartTrend.RefreshData;

  Reopen(QryPareto);
  DBChartPareto.RefreshData;

  if Showing then
    // rt_rscstr.cTXT000027 = 'Last updated at %s';
    IQMS.Common.Controls.SetStatus(StatusBar1,
      Format(rt_rscstr.cTXT000027, [DateTimeToStr(Now)]));
end;

procedure TFrmRT_RejRep.tmRefreshTimer(Sender: TObject);
begin
  tmRefresh.Enabled := False;
  RefreshDataSets;
  tmRefresh.Enabled := True;
end;

procedure TFrmRT_RejRep.wwDBComboDlgMfgCustomDlg(Sender: TObject);
begin
  with PkMfg do
    if Execute then
    begin
       FStandard_ID:= GetValue('ID');
       wwDBComboDlgMfg.Text:= GetValue('mfgno');
    end;
end;

procedure TFrmRT_RejRep.wwDBComboDlgWorkCenterCustomDlg(Sender: TObject);
begin
  with PkWorkCenter do
    if Execute then
    begin
       FWork_Center_ID:= GetValue('ID');
       wwDBComboDlgWorkCenter.Text:= GetValue('eqno');
    end;
end;

procedure TFrmRT_RejRep.CheckDeleteKey(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Sender is TUniEdit) then
  begin
    if Sender = wwDBComboDlgMfg then
       begin
         wwDBComboDlgMfg.Text:= '';
         FStandard_ID:= 0;
       end

    else if Sender = wwDBComboDlgWorkCenter then
       begin
         wwDBComboDlgWorkCenter.Text:= '';
         FWork_Center_ID:= 0;
       end;

    Key:= 0;
  end;
end;

procedure TFrmRT_RejRep.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
