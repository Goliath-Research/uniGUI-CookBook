unit IQMS.Common.LgMsg3;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.LGMSG2,
  Data.DB,
  IQMS.WebVcl.LargeGrid,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniTimer, uniMemo, uniButton, uniBitBtn,
  uniLabel, Vcl.Controls;

type
  TFrmMsg3 = class(TFrmMsg2)
    DataSourceASSY1: TDataSource;
    StoredProcASSY1: TFDStoredProc;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    StoredProcDate_To_Shift: TFDStoredProc;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FEmpId:Real;
    FType:Integer;
  public
    { Public declarations }
    constructor Create3( AMessage: String;
                ACaption: String; AEmpId:Real; ATimerInterval:integer; AType:Integer );

  end;

procedure LrgMsgBox_TA2( AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer=20; AType:Integer = 0 {0 - nothing, 1 - clock_in, 2 - clock_in/clock_out}  );


implementation
{$R *.dfm}
uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib,
  IQMS.Common.Print;

procedure LrgMsgBox_TA2( AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer=20; AType:Integer = 0 );
begin
  TFrmMsg3.Create3(  AMessage, ACaption, AEmpId, ATimerInterval, AType ).Show;
end;

constructor TFrmMsg3.Create3(  AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer; AType:Integer );
var
  AShiftId, AInt:Real;
begin
  inherited Create2(  AMessage, ACaption, AEmpId, ATimerInterval, AType );
  FEmpId := AEmpId;
  FType  := AType;
  if Memo1.Lines.Count = 0 then
    Panel2.Visible := False;



    AShiftId := SelectValueFmtAsFloat('select ta_shift_id from ta_emp_shift_sched ' +
                        ' where NVL(pr_emp_id, 0) = %f and sysdate between start_date and end_date', [AEmpId]);
    if AShiftId = 0 then
      AShiftId := SelectValueFmtAsFloat('select ta_shift_id from pr_emp where id = %f', [AEmpId]);



      AInt := SelectValueFmtAsFloat('select max(display_time) from ta_messages where pr_emp_id = %f or ta_shift_id = %f', [AEmpId, AShiftId]);
      if AInt = 0 then
        AInt := SelectValueFmtAsFloat('select max(display_time) from ta_messages m, ta_messages_emp e where e.pr_emp_id = %f and e.ta_messages_id = m.id', [AEmpId]);
      if AInt <> 0 then
        Timer1.Interval := Trunc(AInt) * 1000
      else
      begin
        AInt := SelectValueAsFloat('select assy1_ta_mesg_disp_time from iqsys2');
        if AInt <> 0 then
          Timer1.Interval := Trunc(AInt) * 1000
        else
        begin
          //if IQRegFloatScalarRead( application, 'CLOCKIO_TIMER_INTERVAL', Aint ) then
          //  Timer1.Interval := Trunc(AInt) * 1000
          //else
          //  Timer1.Interval := 20000;
          // 06/13/2012 Set the popup timer interval
          Timer1.Interval := ATimerInterval;
        end;

      end;



  PostMessage( Handle, iq_AfterShowMessage, 0, 0);


end;

procedure TFrmMsg3.UniFormShow(Sender: TObject);
var
  AReport:String;
  SelectionList:TStringList;
  AParams:TStringList;
  AMfgCellId:Real;
  AProdDate:TDateTime;
  AShift:Real;
begin
  StoredProcASSY1.Close;
  StoredProcASSY1.ParamByName('v_pr_emp_id').Value := FEmpId;
  StoredProcASSY1.Open;
  Panel4.Visible := False;
  if not (StoredProcASSY1.Eof and StoredProcASSY1.Bof) then
  begin
      if SelectValueAsString('select NVL(assy1_print_sched_on_login, ''N'') from iqsys2 where rownum < 2') = 'Y' then
      begin
        if FType = 1 then
        begin
          AReport:= SelectValueAsString('select cr_ta_msg_report from iqsys2 where rownum < 2');
          if AReport <> '' then
          try
            SelectionList := TStringList.Create;
            AParams := TStringList.Create;
            AParams.Add(IqFormat('V_PR_EMP_ID=%d', [Trunc(FEmpId)]));
            AMfgCellId := SelectValueFmtAsFloat('select mfgcell_id from pr_emp where id = %f', [FEmpId]);

            AProdDate := SelectValueFmtAsFloat('select IQCalendar.prod_date( sysdate, %f ) from dual', [AMfgCellId]);
            AParams.Add('V_PROD_DATE_IN=' + FormatDateTime('YYYY,MM,DD ', AProdDate) + '00:00:00');
            StoredProcDate_To_Shift.ParamByName('v_date').asDateTime:= SelectValueAsFloat('select sysdate from dual');
            StoredProcDate_To_Shift.ParamByName('v_shift').Clear;
            StoredProcDate_To_Shift.ParamByName('v_time_left').Clear;
            StoredProcDate_To_Shift.ParamByName('v_mfgcell_id').Value := AMfgCellId;
            StoredProcDate_To_Shift.ExecProc;

            AShift := StoredProcDate_To_Shift.ParamByName('v_shift').asFloat;

            AParams.Add(IqFormat('V_SHIFT_IN=%d', [Trunc(AShift)]));

            PrintDefaultReportExE( AReport, SelectionList, 1, false, AParams );
          finally
            SelectionList.Free;
            AParams.Free;
          end;
        end;
      end;
//    Width         := 726;
    btnYes.Left   :=  Trunc((Width - btnYes.Width)/2);
    Panel4.Height := 300;

    Panel4.Visible := True;
    if Panel2.Visible then
    begin
//      Height        := 700;
      Panel2.Height := 150;
    end
    else
    begin
//      Height        := 550;
    end;
  end;

  Timer1.Enabled := true;
end;

end.
