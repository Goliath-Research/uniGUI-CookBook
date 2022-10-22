unit scanid_share;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  MMSystem,
  MainModule;

  procedure Alarm_Fatal;
  procedure Alarm_General;
  procedure ProcessBeep;

  procedure WriteLineToLog(AText, AFileName: String);

implementation

uses
  IQMS.Common.MultimediaSounds,
  scanid_settings;

procedure Alarm_Fatal;
begin
     if FileExists( ScanIDSettings.AlarmFile_Fatal ) then IQPlaySoundFile( ScanIDSettings.AlarmFile_Fatal ) // iqmm
     else
        begin
             IQPlayBeep(1755, 800, 127) {iqmm}; Application.ProcessMessages;
             IQPlayBeep(1150, 1000, 127) {iqmm}; Application.ProcessMessages;
        end;
end;

procedure Alarm_General;
begin
     if FileExists( ScanIDSettings.AlarmFile_General ) then IQPlaySoundFile( ScanIDSettings.AlarmFile_General ) // iqmm
     else
     MessageBeep( MB_ICONEXCLAMATION );
end;

procedure ProcessBeep;
begin
     Winapi.Windows.Beep( 3000, 200 );
end;

procedure WriteLineToLog(AText, AFileName: String);
var
   AFile : TextFile;
begin
  {$I-}
  AssignFile( AFile, AFileName  );
  if ( not FileExists( AFileName )) then {Does the file already exist?}
     begin
          Rewrite( AFile );        {if not, create it}
     end;

  if ioresult = 0 then              {return status of the last I/O operation performed}
  try
     Append( AFile );
     Writeln( AFile, AText );  {write an end-of-line marker to the file}
  finally
    {Finish}
    Flush( AFile );           {empty buffer of the file opened for output}
    CloseFile( AFile );       {terminate association between file variable and an external disk file}
  end;
end;

end.
