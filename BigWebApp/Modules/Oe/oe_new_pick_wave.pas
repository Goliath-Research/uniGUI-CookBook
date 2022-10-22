unit oe_new_pick_wave;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker;

type
  TFrmOENewPickWave = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    edBackDays: TUniEdit;
    edForwDays: TUniEdit;
    dtShipDate: TUniDBDateTimePicker;
    chkSkipOnPickTicket: TUniCheckBox;
    chkSkipOnPickWave: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrders_ID: Real;
    procedure Validate;
    procedure Process;
    procedure SetOrders_ID(const Value: Real);
    procedure SetWavePick_ID(const Value: Real);
  public
    { Public declarations }
    FWavePick_ID: Real;
    class function DoShowModal(AOrders_ID: Real; var AWavePick_ID: Real ): Boolean;
    property Orders_ID : Real write SetOrders_ID;
    property WavePick_ID : Real write SetWavePick_ID;
  end;

implementation

{$R *.dfm}

uses
  Data.DB,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  wave_pick_dlg,
  wave_share;

{ TFrmOENewPickWave }

class function TFrmOENewPickWave.DoShowModal(AOrders_ID: Real; var AWavePick_ID: Real ): Boolean;
var
  LFrmOENewPickWave : TFrmOENewPickWave;
begin
  LFrmOENewPickWave := TFrmOENewPickWave.Create(UniGUIApplication.UniApplication);
  with LFrmOENewPickWave do
  begin
    Orders_ID := AOrders_ID;
    Result:= ShowModal = mrOK;
    if Result then
       AWavePick_ID:= FWavePick_ID;
  end;
end;

procedure TFrmOENewPickWave.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, chkSkipOnPickTicket, chkSkipOnPickWave ]);
  //IQRegDateTimeScalarWrite( self, 'wave_shipping_date', dtShipDate.Date );    // maybe in the future
  IQRegFloatScalarWrite( self, 'back_days', StrToFloat(edBackDays.Text));
  IQRegFloatScalarWrite( self, 'forward_days', StrToFloat(edForwDays.Text ));
end;

procedure TFrmOENewPickWave.btnOKClick(Sender: TObject);
begin
  Validate;
  Process;
  ModalResult:= mrOK;
end;

procedure TFrmOENewPickWave.Validate;
begin
  IQAssert( dtShipDate.DateTime > 0, 'Invalid shipping date - operation aborted');
  IQAssert( StrToFloat(edBackDays.Text) >= 0, 'Invalid ''- Days'' field - operation aborted');
  IQAssert( StrToFloat(edForwDays.Text) >= 0, 'Invalid ''+ Days'' field - operation aborted');
end;


procedure TFrmOENewPickWave.Process;

  // ---------------------------------------------------------------------------
  procedure _create_wave_header;
  begin
    FWavePick_ID:= GetNextID('wave_pick');
    ExecuteCommandFmt('insert into wave_pick                  '+
             '     ( id,                              '+
             '       eplant_id,                       '+
             '       division_id,                     '+
             '       arcusto_id,                      '+
             '       ship_to_id,                      '+
             '       freight_id,                      '+
             '       ship_date )                      '+
             'select %f,                              '+
             '       eplant_id,                       '+
             '       division_id,                     '+
             '       arcusto_id,                      '+
             '       ship_to_id,                      '+
             '       freight_id,                      '+
             '       to_date(''%s'', ''mm/dd/yyyy'')  '+
             '  from orders                           '+
             ' where id = %f                          ',
             [ FWavePick_ID,
               FormatDateTime('mm/dd/yyyy', dtShipDate.DateTime ),
               FOrders_ID ]);
  end;

  // ---------------------------------------------------------------------------
  procedure _process_release( DataSet: TDataSet );
  var
    ACargo: TWaveSelectedRelease;   // wave_share.pas
  begin
    ACargo.Arinvt_ID     := DataSet.FieldByName('arinvt_id').asFloat;
    ACargo.Ord_Detail_ID := DataSet.FieldByName('ord_detail_id').asFloat;
    ACargo.Releases_ID   := DataSet.FieldByName('release_id').asFloat;
    ACargo.Ship_Quan     := DataSet.FieldByName('ship_quan').asFloat;
    ACargo.Must_Ship_Date:= DataSet.FieldByName('ship_date').asDateTime;
    ACargo.Pts_Per_Pkg   := SelectValueFmtAsFloat('select IQMS.Common.Miscellaneous.no_zero( decode( nvl(a.pk_unit_type, ''C''), '+
                                      '                               ''E'', 1,                   '+
                                      '                               ''C'', pk_ptsper,           '+
                                      '                               ''P'', pallet_ptsper ))     '+
                                      '  from arinvt a                                            '+
                                      ' where a.id = %f                                           ',
                                      [ ACargo.Arinvt_ID  ]);

    TFrmWavePickDlg.AddToWaveDetails( FWavePick_ID, 0 {wave_pick_ticket_id}, ACargo );  // wave_pick_dlg.pas
  end;

  // ---------------------------------------------------------------------------
  procedure _append_wave_details;
  var
    Qry: TFDQuery;
  begin
    Qry:= TFDQuery.Create(nil);
    with Qry do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(IQFormat('select arinvt_id,                                                                                  '+
                       '       ord_detail_id,                                                                              '+
                       '       release_id,                                                                                 '+
                       '       ship_quan,                                                                                  '+
                       '       must_ship_date as ship_date                                                                 '+
                       '  from v_backlog_releases_qk v                                                                     '+
                       ' where order_id = %f                                                                               '+
                       '   and must_ship_date between to_date(''%s'', ''mm/dd/yyyy'') - %f                                 '+
                       '                          and to_date(''%s'', ''mm/dd/yyyy'') + %f                                 '+
                       '   and (%f = 0                                                                                     '+
                       '        or                                                                                         '+
                       '        %f = 1 and not exists (select 1 from ps_ticket_dtl x where x.release_id = v.release_id ))  '+
                       '   and (%f = 0                                                                                     '+
                       '        or                                                                                         '+
                       '        %f = 1 and not exists (select 1 from wave_pick_dtl x where x.releases_id = v.release_id )) '+
                       ' order by must_ship_date                                                                           ',
                       [ FOrders_ID,
                         FormatDateTime('mm/dd/yyyy', dtShipDate.DateTime ),
                         StrToFloat(edBackDays.Text),
                         FormatDateTime('mm/dd/yyyy', dtShipDate.DateTime ),
                         StrToFloat(edForwDays.Text),
                         IQMS.Common.StringUtils.BoolToNum( chkSkipOnPickTicket.Checked ),
                         IQMS.Common.StringUtils.BoolToNum( chkSkipOnPickTicket.Checked ),
                         IQMS.Common.StringUtils.BoolToNum( chkSkipOnPickWave.Checked ),
                         IQMS.Common.StringUtils.BoolToNum( chkSkipOnPickWave.Checked )]));
      Open;
      while not Eof do
      begin
        _process_release( Qry );
        Next;
      end;
    finally
      Free;
    end;
  end;


// ---------------------------------------------------------------------------
begin
  _create_wave_header;
  _append_wave_details;
end;


procedure TFrmOENewPickWave.SetOrders_ID(const Value: Real);
begin
  FOrders_ID := Value;
end;

procedure TFrmOENewPickWave.SetWavePick_ID(const Value: Real);
begin
  FWavePick_ID := Value;
end;

procedure TFrmOENewPickWave.UniFormShow(Sender: TObject);
var
  ADate: TDateTime;
  AValue: Real;
begin
  IQRegFormRead( self, [ self, chkSkipOnPickTicket, chkSkipOnPickWave ]);
  //if IQRegDateTimeScalarRead( self, 'wave_shipping_date', ADate) and (ADate > 0) then  // maybe in the future
  dtShipDate.DateTime:= SelectValueAsFloat('select sysdate from dual');
  if IQRegFloatScalarRead( self, 'back_days', AValue ) then
     edBackDays.Text:= FloatToStr(AValue);
  if IQRegFloatScalarRead( self, 'forward_days', AValue ) then
     edForwDays.Text:= FloatToStr(AValue);
end;

end.



