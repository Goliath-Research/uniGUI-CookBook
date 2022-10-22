unit ForeShare;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls;

type
   TCopyPasteParams = record
     Arinvt_ID_Src : Real;
     Arinvt_ID_Trg : Real;
     Ship_To_ID    : Real;
     CutOffDate    : TDateTime;
     Delete_Src    : string;
     Fore_Head_ID  : Real;
   end;

function ColumnCaptionToDate( ACaption: string ): TDateTime;
procedure AssignSessionForeHead_ID( AFore_Head_ID, AArinvt_ID: Real; AStartDate, AEndDate: TDateTime );
          
implementation

uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

function ColumnCaptionToDate( ACaption: string ): TDateTime;
var
  sMM, sYY: string;
  mm, yy: Integer;
  ADate  : TDateTime;
  AMonths: string;
begin
  sMM:= GetToken( UpperCase( ACaption ), '-', 1 );
  sYY:= GetToken( UpperCase( ACaption ), '-', 2 );

  mm:= IQMonthStrToMonth( sMM );  {IQNLS}
  yy:= StrToInt( sYY );

  {Min and Max dates}
  if mm = 12 then
     Result:= EncodeDate( yy + 1, 1, 1) - 1
  else
     Result:= EncodeDate( yy, mm + 1, 1) - 1;
end;

procedure AssignSessionForeHead_ID( AFore_Head_ID, AArinvt_ID: Real; AStartDate, AEndDate: TDateTime );
begin
  // this will affect how views are filtering forecast information
  if AFore_Head_ID > 0  then
     ExecuteCommandFmt('declare                                              '+
                       '  v_pit_hdr_id number:= %f;                          '+
                       '  v_arinvt_id  number:= %f;                          '+
                       '  v_start      date:= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''); '+
                       '  v_end        date:= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''); '+
                       'begin                                                '+
                       '  fore_ctx_manager.set_fore_head_id( v_pit_hdr_id ); '+
                       '  fore_ctx_manager.set_arinvt_id( v_arinvt_id );     '+
                       '  fore_ctx_manager.set_req_date_start( v_start );    '+
                       '  fore_ctx_manager.set_req_date_end( v_end  );       '+
                       'end;',
                       [ AFore_Head_ID,
                         AArinvt_ID,
                         FormatDateTime('mm/dd/yyyy hh:nn:ss', AStartDate), 
                         FormatDateTime('mm/dd/yyyy hh:nn:ss', AEndDate) ])
  else                         
     ExecuteCommand('begin                                         '+
                    '  fore_ctx_manager.set_fore_head_id( 0 );     '+
                    '  fore_ctx_manager.set_arinvt_id( null );     '+
                    '  fore_ctx_manager.set_req_date_start( null );'+
                    '  fore_ctx_manager.set_req_date_end( null  ); '+
                    'end; ');
end;  


end.
