unit IQMS.Common.PrintRaw;

interface

uses System.Classes;

function PrintBinaryMemoryStream(AMemoryStream: TMemoryStream; ATitle: String = ''; APrinter: String = '' ): Boolean;
function IQSetPrinter( APrinterName:String ): Boolean;

implementation

uses System.Types, Vcl.Printers, System.SysUtils, IQMS.Common.ResStrings, WinSpool, IQMS.Common.Dialogs, Vcl.Forms;

function IQSetPrinter( APrinterName:String ): Boolean;
var
  hDm     : THandle;
  cPrinter, cDriver, cPort: PChar;
  I       : Integer;
begin
  Result:= False;

  I:= Printer.Printers.IndexOf( APrinterName );
  if I = -1 then
    EXIT;

  // Aug-21-06 - Jason - this was reinstated in order to prevent invalid printer error
  // The issue was this - within a single instance of the application (ie. b/c Vcl.Printers object is global),
  // after the TPrintDialog set the printer settings, the next time we printed(without closing/reopening application),
  // we'd retreive the printer using the name stored in registry from above.  This would result in additional printer
  // objects being created in the global Vcl.Printers list b/c the TPrinterDialog created a TPrinter that differed from
  // our TPrinter.  Long story short - the error you'd get was invalid printer specified b/c the printer name now included the
  // word ' on ' at the end.  Trimming the printer name does not solve the problem!
  // ----- IMPORTANT ------ it was suspected(not for sure) that accessing the printer index caused memory leak.

  cPrinter:= StrAlloc(255);
  cDriver := StrAlloc(255);
  cPort   := StrAlloc(255);

  try
    Printer.PrinterIndex:= I;
    Printer.GetPrinter( cPrinter, cDriver, cPort, hDm );  // this is trick to
    Printer.SetPrinter( cPrinter, cDriver, cPort, hDm );  // avoid possible memory leak
  finally
    StrDispose(cPrinter);
    StrDispose(cDriver);
    StrDispose(cPort);
  end;
  Result:= TRUE;
  // Aug-21-2006 - reimplemented a little differently above
  // Nov-19-2004
  // I:= Printer.Printers.IndexOf( cPrinter );
  // if I > -1 then
  //    Printer.PrinterIndex:= I;

  // Aug-21-06 re-comment out for change above. see same date // {Reinstated Jan-24-2005. Suspected that above code caused Out Of Memory while printing labels}
  //Printer.SetPrinter(PChar(cPrinter), PChar(''), PChar(''), 0);
end;

function PrintBinaryMemoryStream(AMemoryStream: TMemoryStream; ATitle: String = ''; APrinter: String = '' ): Boolean;
type
  TDoc_Info_1 = record
    pDocName: pChar;
    pOutputFile: pChar;
    pDataType: pChar;
  end;
const
  BufferSize = (1024*1024);
var
  Count, BytesWritten : DWORD;
  hPrinter: THandle;
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port : array[0..255] of char;
  hDeviceMode: THandle;
  DocInfo: TDoc_Info_1;

//  iBlock,iBlockTotal : integer;

  Buffer : pointer;
begin
  Result := Assigned(AMemoryStream);
  if not Result then
    EXIT;

  //try // try..except
    GetMem(Buffer,BufferSize);
    if (not IQSetPrinter(APrinter)) then
    begin
      IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'
      Result:= FALSE;
      Exit;
    end;

    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);

    if not WinSpool.OpenPrinter(@Device, hPrinter, nil) then
       begin
        IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000345 + #13#13 + APrinter); // 'Printer not found.'
        Result := FALSE;
        Exit;
       end; // end if

    DocInfo.pDocName := PChar(ATitle);
    DocInfo.pOutputFile := nil;
    DocInfo.pDatatype := 'RAW';

    AMemoryStream.Position := 0;
    try
      if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
      begin
        //WinSpool.ClosePrinter(hPrinter);
        Exit;
      end;

      // Start printing
      if not StartPagePrinter(hPrinter) then
      begin
        //EndDocPrinter(hPrinter);
        //WinSpool.ClosePrinter(hPrinter);
        Result := FALSE;
        Exit;
      end;

//      iBlock := 0;
//      iBlockTotal := AMemoryStream.Size div BufferSize;

      // while not eof...
      while (AMemoryStream.Position < AMemoryStream.Size) do
        begin
          Count := AMemoryStream.Read(Buffer^,BufferSize);
          // Current position may also be measured by iBlock
//          inc(iBlock);

          if Count > 0 then
          begin
            if not WritePrinter(hPrinter,
                                Buffer,
                                Count,
                                BytesWritten) then
            begin
              EndPagePrinter(hPrinter);

              raise Exception.CreateFmt( 'Failure attempting to print binary memory stream to %s. Error code = %d', [ APrinter, GetLastError ]);
            end; // end if not WritePrinter()..
          end; // end if Count > 0 then ...
          Application.ProcessMessages;

      end; // end while

    finally
      FreeMem(Buffer);
      EndDocPrinter(hPrinter);
      WinSpool.ClosePrinter(hPrinter);
    end; // try..finally
  //except
  //  Result := FALSE;
  //end; // try..except
end;

end.
