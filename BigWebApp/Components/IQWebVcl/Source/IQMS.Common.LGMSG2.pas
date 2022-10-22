unit IQMS.Common.LgMsg2;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.Common.Lgmsg1,
  Vcl.MPlayer,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  IQMS.Common.dataconst,
  uniGUIApplication,
  uniPanel, uniTimer, uniButton, uniBitBtn, uniLabel, Vcl.Controls;

type
  TFrmMsg2 = class(TFrmMsg1)
    Panel2: TUniPanel;
    Memo1: TUniMemo;
  private
    { Private declarations }
    FTimerInterval :integer;
    procedure CheckColorAndWAV;
  public
    { Public declarations }
    property ATimerInterval :integer read FTimerInterval write FTimerInterval ;
    constructor Create2( AMessage: String;
                ACaption: String; AEmpId:Real;  ATimerInterval:integer; AType:Integer; AError:boolean = false ); virtual;
  end;


procedure LrgMsgBox_TA( AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer =20; AType:Integer = 0 {0 - nothing, 1 - clock_in, 2 - clock_in/clock_out}  );
procedure LrgMsgBox_TA_Error( AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer =20; AType:Integer = 0 {0 - nothing, 1 - clock_in, 2 - clock_in/clock_out}  );



implementation
{$R *.DFM}
uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib;


procedure LrgMsgBox_TA( AMessage: String; ACaption: String; AEmpId:Real; ATimerInterval:integer=20;  AType:Integer = 0 );
begin
  TFrmMsg2.Create2( AMessage, ACaption, AEmpId, ATimerInterval, AType ).Show;
end;

procedure LrgMsgBox_TA_Error( AMessage: String; ACaption: String; AEmpId:Real;  ATimerInterval:integer=20; AType:Integer = 0 {0 - nothing, 1 - clock_in, 2 - clock_in/clock_out}  );
begin
  TFrmMsg2.Create2(  AMessage, ACaption, AEmpId, ATimerInterval, AType, true ).Show;
end;



constructor TFrmMsg2.Create2(  AMessage: String;
            ACaption: String; AEmpId:Real;  ATimerInterval:integer;  AType:Integer; AError:boolean = false );
var
  AInt:Real;
  AShiftId:Real;
  APaygroupId, ADivisionId, AEplantId, ASuperId:Real;
  AStr:String;
  AQry:TFDQuery;
  FrmMsg2: TFrmMsg2;
begin

  FrmMsg2     := TFrmMsg2.Create(uniGUIApplication.UniApplication);
  FrmMsg2.Msg := AMessage;
  FrmMsg2.Cpt := ACaption;

  Height := 600;
  if AError then
    CheckColorAndWAV;

  Panel2.Visible := False;
//  Height := 600;
  btnYes.Left   := Trunc((Width - btnYes.Width)/2);
//  Height := 197;
  Memo1.Lines.Clear;

  // 06/13/2012 Get the popup timer interval setting.  This follows a
  // hierarchy, starting with System Parameters and then the Registry.
  // The default interval is 20 seconds.

  if AEmpId <> 0 then
  begin
    if AType = 1 then
      AStr := ' and NVL(clock_in, '' '') = ''Y'' '
    else if AType = 2 then
      AStr := ' and NVL(clock_out, '' '') = ''Y'' '
    else
      AStr := '';

    AShiftId := SelectValueFmtAsFloat('select ta_shift_id from ta_emp_shift_sched ' +
                        ' where NVL(pr_emp_id, 0) = %f and sysdate between start_date and end_date', [AEmpId]);
    if AShiftId = 0 then
      AShiftId := SelectValueFmtAsFloat('select ta_shift_id from pr_emp where id = %f', [AEmpId]);


    AQry := TFDQuery.Create(nil);
    with AQry do
    try
      ConnectionName := cnstFDConnectionName;
      Sql.Add(IqFormat('select p.supervisor_id,            ' +
                       '        p.pr_paygroup_id,          ' +
                       '        g.division_id,             ' +
                       '        g.eplant_id                ' +
                       '   from pr_emp p,                  ' +
                       '        pr_paygroup g              ' +
                       '  where p.pr_paygroup_id = g.id(+) and p.id = %f', [AEmpId]));
       Open;
       APaygroupId := FieldByName('pr_paygroup_id').asFloat;
       ADivisionId := FieldByName('division_id').asFloat;
       AEplantId   := FieldByName('eplant_id').asFloat;
       ASuperId    := FieldByName('supervisor_id').asFloat;
    finally
      free;
    end;

    AQry := TFDQuery.Create(nil);
    with AQry do
    try
      ConnectionName := cnstFDConnectionName;


      Sql.Add(IqFormat('select distinct id from ta_messages where ta_shift_id = %f and pr_emp_id is null  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [AShiftId, AStr]));
      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where pr_emp_id = %f  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [AEmpId, AStr]));
      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where supervisor_id = %f and pr_emp_id is null  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [ASuperId, AStr]));
      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where pr_paygroup_id = %f and pr_emp_id is null  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [APaygroupId, AStr]));
      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where division_id = %f and pr_emp_id is null  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [ADivisionId, AStr]));
      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where eplant_id = %f and pr_emp_id is null  and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [AEplantId, AStr]));

      Sql.Add('union');
      Sql.Add(IqFormat('select distinct id from ta_messages where id in (select ta_messages_id from ta_messages_emp where pr_emp_id = %f) ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate and NVL(source, '' '') <> ''SNDOP_DISPATCH'' %s ', [AEmpId, AStr]));

      Open;
      while not eof do
      begin
        Memo1.Lines.Add(SelectValueFmtAsString('select ta_message from ta_messages where id = %f and NVL(source, '' '') <> ''SNDOP_DISPATCH'' ', [FieldByName('id').asFloat]));
        next;
      end;

    finally
      free;
    end;

{

    if AShiftId <> 0 then
    with TFDQuery.Create(self) do
    try
      Connection := MainModule.FDConnection;
      Sql.Add(IqFormat('select ta_message from ta_messages where ta_shift_id = %f ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [AShiftId, AStr]));
      Open;
      while not eof do
      begin
        Memo1.Lines.Add(FieldByName('ta_message').asString);
        next;
      end;
    finally
      free;
    end;

    with TFDQuery.Create(self) do
    try
      Connection := MainModule.FDConnection;
      Sql.Add(IqFormat('select ta_message from ta_messages where NVL(pr_emp_id, 0) = %f and NVL(ta_shift_id, 0) <> %f ' +
                       ' and NVL(inactive, ''N'') = ''N'' and NVL(expiry_date, sysdate + 40000) > sysdate %s ', [AEmpId, AShiftId, AStr]));
      Open;
      while not eof do
      begin
        Memo1.Lines.Add(FieldByName('ta_message').asString);
        next;
      end;

    finally
      free;
    end;

}

    if Memo1.Lines.Count > 0 then
    begin
//      Width         := 800;
//      Height        := 600;
      Panel2.Height := 200;
      btnYes.Left   := Trunc((Width - btnYes.Width)/2);
//      btnYes.Left   := 249;
      Panel2.Visible := True;

      AInt := SelectValueFmtAsFloat('select max(display_time) from ta_messages where pr_emp_id = %f or ta_shift_id = %f', [AEmpId, AShiftId]);
      if AInt = 0 then
        AInt := SelectValueFmtAsFloat('select max(display_time) from ta_messages m, ta_messages_emp e where e.pr_emp_id = %f and e.ta_messages_id = m.id', [AEmpId]);
      if AInt <> 0 then
        Timer1.Interval := Trunc(AInt) * 1000
      else
        Timer1.Interval := 20000;
    end
    else
    begin
      //if IQRegFloatScalarRead( application, 'CLOCKIO_TIMER_INTERVAL', Aint ) then
      //  Timer1.Interval := Trunc(AInt) * 1000
      //else
      //  Timer1.Interval := 2000;
      // 06/13/2012 Set the popup timer interval
      Timer1.Interval := ATimerInterval;
    end;
  end
  else
  begin

    //if IQRegFloatScalarRead( application, 'CLOCKIO_TIMER_INTERVAL', Aint ) then
    //  Timer1.Interval := Trunc(AInt) * 1000
    //else
    //  Timer1.Interval := 2000;
      // 06/13/2012 Set the popup timer interval
      Timer1.Interval := ATimerInterval;
  end;


end;


procedure TFrmMsg2.CheckColorAndWAV;
var
  AColor:Integer;
  AWavFile:String;
begin
  AColor := Trunc(SelectValueAsFloat('select ta_error_form_color from iqsys2 where rownum < 2'));
  if AColor <> 0 then
  begin
    Color := TColor( AColor );
    Panel1.Color := Color;
  end;

  AWavFile := SelectValueAsString('select ta_error_wav_file from iqsys2 where rownum < 2');

  if (AWavFile <> '') and FileExists(AWavFile) then
  begin
     UniSession.AddJS('var audio2 = document.createElement(''audio''); '+
     ' audio2.setAttribute(''src'', '''+AWavFile+''');  '+
     ' audio2.play();');
  end;

end;

end.
