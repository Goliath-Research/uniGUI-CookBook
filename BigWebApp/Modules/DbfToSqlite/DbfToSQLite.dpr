program DbfToSQLite;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  dm_sqlite in '..\iqshare\dm_sqlite.pas' {sqlite_DM: TDataModule},
  IQMS.Data.SqliteLib in '..\iqshare\IQMS.Data.SqliteLib.pas';

begin
  try
    ConverDbfToSQLite;
    WriteLn('Process completed!');
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      WriteLn('Press the ENTER key to terminate the process.');
      ReadLn;
    end;
  end;
end.
