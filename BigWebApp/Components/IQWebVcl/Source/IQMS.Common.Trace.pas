unit IQMS.Common.Trace;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Phys,uniGUIApplication;
//      db_dm;

procedure CreateReplaceT2Trigger( ATableName: string );
procedure DropT2Trigger( ATableName: string );
procedure DisableT2Trigger( ATableName: string );

implementation

uses
  IQMS.Common.ErrorDialog,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils;

procedure ReCreateT2Trigger( ATableName: string; ATR_Tab_ID: Real ); forward;
function TR2_Name( ATableName: string ): string; forward;
procedure AddHeader( ATableName: string ); forward;
procedure AddBody( ATableName, AColumnName: string; AAfterInsert, AAfterUpdate, AAfterDelete: Boolean ); forward;
procedure AddFooter; forward;
procedure CompileTrigger; forward;
function CheckTriggerValid( ATableName: string ): Boolean; forward;

var
  FList: TStringList;

{ ---------------------------------------------------------------------------- }
{ MAIN                                                                         }
{ ---------------------------------------------------------------------------- }
procedure CreateReplaceT2Trigger( ATableName: string );
var
  ATR_Tab_ID: Real;
begin
  ATR_Tab_ID:= SelectValueFmtAsFloat('select id from tr_tab where table_name = ''%s''', [ ATableName ]);

  if ATR_Tab_ID = 0 then
     DropT2Trigger( ATableName )
  else
     ReCreateT2Trigger( ATableName, ATR_Tab_ID );
end;

function TR2_Name( ATableName: string ): string;
begin
  Result:= Format('T2_%s', [ Trim(UpperCase( ATableName )) ]);
end;

procedure DropT2Trigger( ATableName: string );
begin
  try
    ExecuteCommandFmt( 'drop trigger %s', [ TR2_Name(ATableName) ]);
  except
//    on E: Exception do IQError('Unable to drop trigger'#13 + E.Message)
  end;
end;

procedure DisableT2Trigger( ATableName: string );
begin
  try
    ExecuteCommandFmt( 'alter trigger %s disable', [ TR2_Name(ATableName) ]);
  except
  end;
end;

procedure ReCreateT2Trigger( ATableName: string; ATR_Tab_ID: Real );
begin
  FList:= TStringList.Create;
  try
    AddHeader( ATableName );

    with TFDQuery.Create(uniGUIApplication.UniApplication) do
    try
      ConnectionName := 'IQFD';
      SQL.Add(IQFormat('select col_name, after_insert, after_update, after_delete from tr_col where tr_tab_id = %f', [ ATR_Tab_ID ]));
      Open;
      while not Eof do
      begin
        AddBody( ATableName,
                 FieldByName('col_name').asString,
                 FieldByName('after_insert').asString = 'Y',
                 FieldByName('after_update').asString = 'Y',
                 FieldByName('after_delete').asString = 'Y' );
        Next;
      end;
    finally
      Free;
    end;

    AddFooter;

    CompileTrigger;

    CheckTriggerValid( ATableName );
  finally
    FList.Free;
  end;
end;

procedure AddHeader( ATableName: string );
begin
  FList.Add(Format('CREATE OR REPLACE TRIGGER %s        ', [ TR2_Name( ATableName )]));
  FList.Add(       'AFTER INSERT OR DELETE OR UPDATE    '  );
  FList.Add(Format('ON %s                ', [ ATableName ] ));
  FList.Add(       'FOR EACH ROW         '  );
  FList.Add(       'declare              '  );
  FList.Add(       '  v_batch_id number; '  );
  FList.Add(       '  v_id       number; '  );
  FList.Add(       'Begin                '  );
  FList.Add(       '  if DELETING then   '  );
  FList.Add(       '     v_id:= :old.id; '  );
  FList.Add(       '  else               '  );
  FList.Add(       '     v_id:= :new.id; '  );
  FList.Add(       '  end if;            '  );
end;

procedure AddBody( ATableName, AColumnName: string; AAfterInsert, AAfterUpdate, AAfterDelete: Boolean );
var
  S: string;
begin
 // IQTrace.RecordChanged( 'MyTableName', 'ITEMNO', v_batch_id, v_id, :old.itemno, :new.itemno )

 {May-04-2005 - allow trace on any column. Truncate anything over 60 chars in the trigger. Done for MPC}
 //  {Ensure AColumnName is less than 60 chars}
 //  if SelectValueFmtAsFloat('select data_length from user_tab_columns where table_name = ''%s'' and column_name = ''%s''', [ ATableName, AColumnName ]) > 60 then
 //     // 'Unable to trace a column that is more than 60 chars long. Table Name = %s, Column Name = %s'
 //     raise Exception.CreateFmt( IQMS.Common.ResourceStrings.cTXT0000174, [ ATableName, AColumnName ]);

  S:= '';
  if AAfterInsert then
     S:= AddToStringWithDelimiter( S, 'INSERTING', 'or');
  if AAfterUpdate then
     S:= AddToStringWithDelimiter( S, 'UPDATING', 'or');
  if AAfterDelete then
     S:= AddToStringWithDelimiter( S, 'DELETING', 'or');

  if S = '' then
     EXIT;

  FList.Add(Format('  if %s then ',   // ex: if updating or deleting then
                      [ S ]));
  FList.Add(Format('     IQTrace.RecordChanged( ''%s'', ''%s'', v_batch_id, v_id, :old.%s, :new.%s ); ',
                      [ ATableName,
                        AColumnName,
                        AColumnName,
                        AColumnName ]));
  FList.Add(      '  end if; ');
end;

procedure AddFooter;
begin
  FList.Add('end;');
end;

procedure CompileTrigger;
begin
  with TFDQuery.Create( uniGUIApplication.UniApplication ) do
  try
    try
      ConnectionName := 'IQFD';
      SQL.Add( StrTran( FList.Text, #13#10, #32#10 ));
      ExecSQL;
    except on E: Exception do
      ShowIQErrorMessage( IQMS.Common.ResStrings.cTXT0000175 {'Unable to compile trigger'}, E.Message, FList.Text );
    end;
  finally
    Free;
  end;
end;

function CheckTriggerValid( ATableName: string ): Boolean;
const
  CRLF = #13#10;
var
  S: string;
begin
  with TFDQuery.Create( Application ) do
  try
    ConnectionName := 'IQFD';
    SQL.Add(        'select line, substr( text,1,255 ) text from user_errors ');
    SQL.Add( Format('where name = ''%s'' and type = ''TRIGGER'' order by sequence', [ TR2_Name( ATableName )]));
    Open;

    Result:= Bof and Eof;

    if not Result then
    begin
      S:= 'BODY:' + CRLF + CRLF;
      S:= S + StrTran( FList.Text, #32#10, CRLF );

      S:= S + CRLF + CRLF;
      S:= S + 'ERROR:' + CRLF + CRLF;

      while not Eof do
      begin
        S:= S + Format('%s %6.0f - %s'+CRLF, [ cTXT0000176 {'Line:'}, Fields[ 0 ].asFloat, Fields[ 1 ].asString ]);
        Next;
      end;

      ShowIQErrorMessage( cTXT0000177 {'Error compiling trigger'},
                          cTXT0000178 {'The trigger has been dropped because of a compilation error.  See detail section.'},
                          S );
    end;
  finally
    Free;
    if not Result then
       DropT2Trigger( ATableName );
  end;
end;

end.


{

CREATE OR REPLACE TRIGGER tu_aaa
BEFORE INSERT  OR DELETE  OR UPDATE
ON aaa
FOR EACH ROW
declare
  v_batch_id number;
  v_id       number;
Begin
  if DELETING then
     v_id:= :old.id;
  else
     v_id:= :new.id;
  end if;
  IQTrace.RecordChanged( 'AAA', 'ITEMNO',    v_batch_id, v_id, :old.name,      :new.name );
  IQTrace.RecordChanged( 'AAA', 'TIMESTAMP', v_batch_id, v_id, :old.timestamp, :new.timestamp );
  IQTrace.RecordChanged( 'AAA', 'SEQ',       v_batch_id, v_id, :old.seq,       :new.seq);
End;

}

