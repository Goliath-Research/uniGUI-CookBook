unit edimngr_main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, IQRepDef, IQAbout, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  Db, Wwquery, Wwdatsrc, IQSearch, Buttons, DBCtrls, wwDialog,
  Wwfltdlg, IQSecReg;


const FInboundSql = 'select e1.id as detail_id,                                                               ' +
             '        h1.edi_file_id as header_id,                                                            ' +
             '        t1.transaction_set_id,                                                                  ' +
             '        decode(e1.converted_date_time, null, ''Parsed'', ''Converted/Complete'') as internal_status,     ' +
             '        e1.aka_ptno as itemno, ' +
             '        '' '' as user_name,                                                                     ' +
             '        0 as edi_out_log_id,                                                                      ' +
             '        o.orderno as documentno                                                                 ' +
             '   from v_edi_ord_detail e1,                                                                      ' +
             '        v_edi_ts_hdr t1,                                                                          ' +
             '        v_edi_isa_header h1,                                                                      ' +
             '        orders o                                                                                ' +
             '  where e1.edi_ts_hdr_id = t1.id                                                                ' +
             '    and t1.edi_isa_header_id = h1.id                                                            ' +
             '    and e1.orders_id = o.id(+)                                                                  ' +
             '    and t1.id = %f ';

const FOutboundSql = 'select id as detail_id,    ' +
             '         id as header_id, ' +
             '         id as edi_out_log_id, ' +
             '         '' ''  as itemno, ' +
             '         transaction_set_id, ' +
             '         user_name, ' +
             '         ''Sent'' as internal_status,    ' +
             '         doc_number as documentno ' +
             '   from edi_out_log            ' +
             '  where id = %f';

type
  TFrmEDIManager = class(TForm)
    PnlMain: TPanel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Options1: TMenuItem;
    Reports1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Print1: TMenuItem;
    PrinterSetup1: TMenuItem;
    IQAbout1: TIQAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQRepDef;
    PnlToolbar: TPanel;
    StatusBar1: TStatusBar;
    PnlGrid: TPanel;
    SrcData: TwwDataSource;
    QryData: TwwQuery;
    Refresh1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Bevel1: TBevel;
    wwDBGrid1: TwwDBGrid;
    SrcDtl: TwwDataSource;
    QryDtl: TwwQuery;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    PM1: TPopupMenu;
    JumptoOutboundLog1: TMenuItem;
    ViewFile1: TMenuItem;
    QryDataHEADER_ID: TFloatField;
    QryDataINTERCHANGE_CODE: TStringField;
    QryDataEDI_ISA_HEADER_ID: TFloatField;
    QryDataEDI_PARTNERS_ID: TFloatField;
    QryDataFILE_NAME: TStringField;
    QryDataTYPE: TStringField;
    QryDataFILE_STATUS: TStringField;
    QryDataTRANS_DATE_TIME: TDateTimeField;
    QryDataARCUSTO_ID: TFloatField;
    QryDataTRADING_PARTNER: TStringField;
    QryDtlDETAIL_ID: TFloatField;
    QryDtlTRANSACTION_SET_ID: TStringField;
    QryDtlDOCUMENTNO: TStringField;
    QryDtlHEADER_ID: TFloatField;
    QryDtlUSER_NAME: TStringField;
    QryDtlEDI_OUT_LOG_ID: TFloatField;
    QryDtlINTERNAL_STATUS: TStringField;
    QryDtlStatus: TStringField;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    SrcRej: TwwDataSource;
    QryRej: TwwQuery;
    QryRejREJECTED_CODES: TStringField;
    PM2: TPopupMenu;
    ShowRejects1: TMenuItem;
    JumptoTradingPartner2: TMenuItem;
    MD: TwwMemoDialog;
    StartTimer1: TMenuItem;
    StopTimer1: TMenuItem;
    N1: TMenuItem;
    SetInterval1: TMenuItem;
    Timer1: TTimer;
    sbtnStart: TSpeedButton;
    sbtnStop: TSpeedButton;
    QryDtlITEMNO: TStringField;
    Grid: TIQSearch;
    QryDataTRANSACTION_SET_ID: TStringField;
    QryDataEDI_TS_HDR_ID: TFloatField;
    Shape7: TShape;
    QryDataDATE_ACK: TStringField;
    SrcErr: TwwDataSource;
    QryErr: TwwQuery;
    ShowErrors1: TMenuItem;
    QryErrEDI_ERROR: TStringField;
    wwFilterDialog1: TwwFilterDialog;
    SR: TSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryDataAfterOpen(DataSet: TDataSet);
    procedure Refresh1Click(Sender: TObject);
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure QryDtlCalcFields(DataSet: TDataSet);
    procedure ShowRejects1Click(Sender: TObject);
    procedure PM2Popup(Sender: TObject);
    procedure JumptoOutboundLog1Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
    procedure ViewFile1Click(Sender: TObject);
    procedure JumptoTradingPartner2Click(Sender: TObject);
    procedure StartTimer1Click(Sender: TObject);
    procedure StopTimer1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SetInterval1Click(Sender: TObject);
    procedure SrcDataDataChange(Sender: TObject; Field: TField);
    procedure ShowErrors1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FInterval:Integer;
    procedure SetStatus( S: String; APanel: Integer );
    procedure Reopen( ADataSet: TDataSet );
  public
    { Public declarations }
//    constructor Create(AOwner:TComponent);override;
  end;

var
  FrmEDIManager: TFrmEDIManager;

implementation

{$R *.DFM}

uses
    edimngr_rscstr,
    iqappset,
    iqcursor,
    iqctrl,
    IQMS.Data.Lib,
    iqmesg,
    IQMS.Common.RegFrm,  //iqregfrm,
    IQMS.Common.screen,//    iqscreen,
    IQMS.Common.Numbers, //iqnumber,
    EDIMRejects,
    EDIConst, IQComExe,
    EDMErrors;



procedure TFrmEDIManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RestoreForm(Self);
  IQRegFormWrite( Self, [ Self, wwDBGrid1, Grid.wwDBGrid ] ); // iqregfrm.pas
  Action := caFree;
end;

procedure TFrmEDIManager.FormCreate(Sender: TObject);
var
  ASeconds:Integer;
begin
  inherited;
  CenterForm(Self); // iqctrl.pas
  AssignApplicationSettings(Application); // iqappset.pas
  ReOpen(QryData);
  ReOpen( QryDtl );
  IQRegFormRead( Self, [ Self, wwDBGrid1, Grid.wwDBGrid ] ); // iqregfrm.pas


  ASeconds := 0;

  if IQRegIntegerScalarRead( self, 'EDI_MNGR_INTERVAL', ASeconds ) then
  begin
    if ASeconds = 0 then
      FInterval := 1000 * 60 // 1 minutes
    else
      FInterval := ASeconds * 1000;
  end
  else
    FInterval := 1000 * 60; // 1 minutes

  Timer1.Interval := FInterval;
  StartTimer1Click(nil);


end;

procedure TFrmEDIManager.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEDIManager.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmEDIManager.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmEDIManager.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmEDIManager.SetStatus(S: String; APanel: Integer);
begin
  StatusBar1.Panels[APanel].Text := S;
  StatusBar1.Update;
end;

procedure TFrmEDIManager.QryDataAfterOpen(DataSet: TDataSet);
begin
  SetStatus( Format( 'Last refresh:  %s', [FormatDateTime( 'ddddd tt', Now )] ), 0 );
end;

procedure TFrmEDIManager.Refresh1Click(Sender: TObject);
begin
  ReOpen( QryData ); // iqlib
  QryDataAfterOpen(nil);
end;

procedure TFrmEDIManager.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then Exit;
  if ( UpperCase( Field.FieldName ) = 'FILE_STATUS' ) then
  begin
    if Uppercase(QryDataFILE_STATUS.asString) = 'PARSED' then
       ABrush.Color := clYellow
    else if UpperCase(QryDataFILE_STATUS.asString) = 'SENT' then
      ABrush.Color := clLime
    else if UpperCase(QryDataFILE_STATUS.asString) = 'REJECTED' then
    begin
      ABrush.Color := clRed;
      AFont.Color := clWhite;
    end
    else if UpperCase(QryDataFILE_STATUS.asString) = 'ACCEPTED' then
      ABrush.Color := clLime
    else if UpperCase(QryDataFILE_STATUS.asString) = 'AWAITING ACKNOWLEDGEMENT' then
      ABrush.Color := clYellow
    else if UpperCase(QryDataFILE_STATUS.asString) = 'NOT PARSED' then
    begin
      ABrush.Color := clRed;
      AFont.Color := clWhite;
    end
    else if UpperCase(QryDataFILE_STATUS.asString) = 'FAILED' then
    begin
      ABrush.Color := clRed;
      AFont.Color := clWhite;
    end
    else if UpperCase(QryDataFILE_STATUS.asString) = 'IN PROCESS' then
      ABrush.Color := clAqua
    else if UpperCase(QryDataFILE_STATUS.asString) = 'CONVERTED/COMPLETE' then
      ABrush.Color := clLime
  end;
end;

procedure TFrmEDIManager.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then Exit;
  if ( UpperCase(QryDtlSTATUS.AsString) = 'SENT' ) or (UpperCase(QryDtlSTATUS.AsString) = 'CONVERTED/COMPLETE') then
    ABrush.Color := clLime
  else if ( UpperCase(QryDtlSTATUS.AsString) = 'PARSED' ) then
    ABrush.Color := clYellow
  else if ( UpperCase(QryDtlSTATUS.AsString) = 'ACCEPTED' ) then
    ABrush.Color := clLime
  else if ( UpperCase(QryDtlSTATUS.AsString) = 'REJECTED' ) then
  begin
    ABrush.Color := clRed;
    AFont.Color  := clWhite;
  end
end;

procedure TFrmEDIManager.QryDtlCalcFields(DataSet: TDataSet);
begin
  QryDtlSTATUS.asString := QryDtlINTERNAL_STATUS.asString;
  if UpperCase(QryDtlINTERNAL_STATUS.asString) = 'SENT' then
  begin
   if UpperCase(QryDataFILE_STATUS.asString) = 'REJECTED' then
//    if GetValFmt('select count(id) from edi_out_log_dtl where edi_out_log_id = %f ' +
//                 ' and (RTrim(Upper(rej_acc_code)) = ''R'' or RTrim(Upper(rej_acc_code)) = ''4'') ', [QryDtlEDI_OUT_LOG_ID.asFloat]) <> 0 then
      QryDtlSTATUS.asString := 'Rejected'
    else if GetValFmt('select count(id) from edi_out_log where id = %f and in_filename is not null', [QryDtlEDI_OUT_LOG_ID.asFloat]) <> 0 then
      QryDtlSTATUS.asString := 'Accepted';
  end;
end;

procedure TFrmEDIManager.ShowRejects1Click(Sender: TObject);
begin
  QryRej.Close;
  QryRej.Open;
  DoShowRejects(self); {in Rejects.pas}
end;

procedure TFrmEDIManager.PM2Popup(Sender: TObject);
begin
  ShowRejects1.Enabled := (GetValFmt('select count(id) from edi_out_log_dtl where edi_out_log_id = %f', [QryDtlEDI_OUT_LOG_ID.asFloat]) <> 0)
end;

procedure TFrmEDIManager.JumptoOutboundLog1Click(Sender: TObject);
begin
  if QryDtlEDI_OUT_LOG_ID.asFloat <> 0 then
    Com_Exec( 'IQEDI', [ SHOW_EDI_OUTBOUND_LOG, '', QryDtlEDI_OUT_LOG_ID.asFloat, 0, 0 ]);    {EDIConst, IQComExe.pas}
end;

procedure TFrmEDIManager.PM1Popup(Sender: TObject);
begin
  TMenuItem(TPopupMenu(Sender).Items[0]).Enabled := (QryDtlEDI_OUT_LOG_ID.asFloat <> 0);
  TMenuItem(TPopupMenu(Sender).Items[1]).Enabled := (QryDataEDI_PARTNERS_ID.asFloat <> 0);
  TMenuItem(TPopupMenu(Sender).Items[2]).Enabled := FileExists(QryDataFILE_NAME.asString);
  TMenuItem(TPopupMenu(Sender).Items[3]).Enabled := (UpperCase(QryDataFILE_STATUS.asString) = 'FAILED');
end;

procedure TFrmEDIManager.ViewFile1Click(Sender: TObject);
var
  AFile:String;
begin
  if QryDataTYPE.asString = 'INBOUND' then
  begin
    AFile := SelectValueFmtAsString('select edi_print_file from edi_ts_hdr where id = %f', [QryDataEDI_TS_HDR_ID.asFloat]);
    if FileExists(AFile) then
    begin
      MD.Caption := AFile;
      MD.Lines.Clear;
      MD.Lines.LoadFromFile(AFile);
      MD.Execute;
      Exit;
    end
  end;
  MD.Caption := QryDataFILE_NAME.asString;
  MD.Lines.Clear;
  MD.Lines.LoadFromFile(QryDataFILE_NAME.asString);
  MD.Execute;
end;

procedure TFrmEDIManager.JumptoTradingPartner2Click(Sender: TObject);
begin
  Com_Exec( 'IQEDI', [ SHOW_EDI_PARTNERS_ID, '', QryDataEDI_PARTNERS_ID.asFloat, 0, 0 ]);    {EDIConst, IQComExe.pas}
end;

procedure TFrmEDIManager.StartTimer1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  StartTimer1.Enabled := False;
  sbtnStart.Enabled   := False;
  sbtnStop.Enabled    := True;
  StopTimer1.Enabled  := True;
  Timer1Timer(nil);
end;

procedure TFrmEDIManager.StopTimer1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  StartTimer1.Enabled := True;
  sbtnStart.Enabled   := True;
  sbtnStop.Enabled    := False;
  StopTimer1.Enabled  := False;
  SetStatus( 'Timer Stopped', 1 );
end;

procedure TFrmEDIManager.Timer1Timer(Sender: TObject);
var
  AId:Real;
begin
  if  Trunc(FInterval/1000  - (Trunc(FInterval/(1000 * 60)) * 60)) <> 0 then
    SetStatus( Format( 'Refresh Interval: %d min. %d sec.', [Trunc(FInterval/(1000 * 60)), Trunc(FInterval/1000  - (Trunc(FInterval/(1000 * 60)) * 60))  ] ), 1 )
  else
    SetStatus( Format( 'Refresh Interval: %d min.', [Trunc(FInterval/(1000 * 60))] ), 1 );

  AId := QryDataHEADER_ID.asFloat;
  IQRegFormWrite( Self, [ Self, wwDBGrid1, Grid.wwDBGrid ] ); // iqregfrm.pas
  Refresh1Click(nil);
  IQRegFormRead( Self, [ Self, wwDBGrid1, Grid.wwDBGrid ] ); // iqregfrm.pas
  QryData.Locate('HEADER_ID', AId, []);
end;

procedure TFrmEDIManager.SetInterval1Click(Sender: TObject);
var
  AInterval:String;
  AInt:Integer;
begin
  AInterval := IntToStr(Trunc(FInterval/1000));
  if not Inputquery('Set Inteval', 'Set Interval (sec.)', AInterval) then
    exit;
  try
    AInt := Trunc(StrToFloat(AInterval));
  except
    raise exception.create('Invalid Interval');
  end;

  IQRegIntegerScalarWrite( self, 'EDI_MNGR_INTERVAL', AInt );
  FInterval := AInt * 1000;

  StopTimer1Click(nil);
  Timer1.Interval := FInterval;
  StartTimer1Click(nil);

end;

procedure TFrmEDIManager.SrcDataDataChange(Sender: TObject; Field: TField);
begin
  QryDtl.Close;
  QryDtl.Sql.Clear;
  if QryDataTYPE.asString = 'INBOUND' then
    QryDtl.Sql.Add(Format(FInboundSql, [QryDataEDI_TS_HDR_ID.asFloat]))
  else
    QryDtl.Sql.Add(Format(FOutboundSql, [QryDataHEADER_ID.asFloat]));
  QryDtl.Open;
end;

procedure TFrmEDIManager.Reopen( ADataSet: TDataSet );
var
  AId:Real;
begin
 with ADataSet do
 try
   AId := TQuery(ADataSet).FieldByName('header_id').asFloat;
//   DisableControls;  {commented out to prevent access violation}
   Close;
   Open;
   TQuery(ADataSet).Locate('HEADER_ID', AId, []);
 finally
//   EnableControls;
 end;
end;



procedure TFrmEDIManager.ShowErrors1Click(Sender: TObject);
begin
   if UpperCase(QryDataFILE_STATUS.asString) = 'FAILED' then
   begin
     QryErr.Close;
     QryErr.Open;
     DoShowErrors(self); {EDMErrors.pas}
   end;
end;

end.
