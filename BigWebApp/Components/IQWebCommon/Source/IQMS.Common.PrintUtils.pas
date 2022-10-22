unit IQMS.Common.PrintUtils;

interface

uses Winapi.Windows, // Vcl.Forms,
     System.Classes, Vcl.Printers,
     FireDAC.Comp.Client;
  // db_dm;

resourcestring
   {Printer status}
   cPrnRsc000134 = 'Paused';
   cPrnRsc000135 = 'Error';
   cPrnRsc000136 = 'Pending Deletion';
   cPrnRsc000137 = 'Paper Jam';
   cPrnRsc000138 = 'Paper Out';
   cPrnRsc000139 = 'Manual Feed';
   cPrnRsc000140 = 'Paper Problem';
   cPrnRsc000141 = 'Offline';
   cPrnRsc000142 = 'IO Active';
   cPrnRsc000143 = 'Busy';
   cPrnRsc000144 = 'Printing';
   cPrnRsc000145 = 'Output Bin Full';
   cPrnRsc000146 = 'Not Available';
   cPrnRsc000147 = 'Waiting';
   cPrnRsc000148 = 'Processing';
   cPrnRsc000149 = 'Initializing';
   cPrnRsc000150 = 'Warming Up';
   cPrnRsc000151 = 'Toner Low';
   cPrnRsc000152 = 'No Toner';
   cPrnRsc000153 = 'Page Punt';
   cPrnRsc000154 = 'User Intervention';
   cPrnRsc000155 = 'Out Of Memory';
   cPrnRsc000156 = 'Door Open';
   cPrnRsc000157 = 'Server Unknown';
   cPrnRsc000158 = 'Power Save';
   cPrnRsc000159 = 'Ready';

   cPrnRsc000160 = '%s on %s';

{   cPrnRsc000161 = '';
   cPrnRsc000162 = '';
   cPrnRsc000163 = '';
   cPrnRsc000164 = '';
   cPrnRsc000165 = '';
   cPrnRsc000166 = '';
   cPrnRsc000167 = '';
   cPrnRsc000168 = '';
   cPrnRsc000169 = '';
   cPrnRsc000170 = '';
   cPrnRsc000171 = '';
   cPrnRsc000172 = '';
   cPrnRsc000173 = '';
   cPrnRsc000174 = '';
   cPrnRsc000175 = '';
   cPrnRsc000176 = '';
   cPrnRsc000177 = '';
   cPrnRsc000178 = '';
   cPrnRsc000179 = '';
   cPrnRsc000180 = '';
   cPrnRsc000181 = '';
   cPrnRsc000182 = '';
   cPrnRsc000183 = '';
   cPrnRsc000184 = '';
   cPrnRsc000185 = '';
   cPrnRsc000186 = '';
   cPrnRsc000187 = '';
   cPrnRsc000188 = '';
   cPrnRsc000189 = '';
   cPrnRsc000190 = '';
   cPrnRsc000191 = '';
   cPrnRsc000192 = '';
   cPrnRsc000193 = '';
   cPrnRsc000194 = '';
   cPrnRsc000195 = '';
   cPrnRsc000196 = '';
   cPrnRsc000197 = '';
   cPrnRsc000198 = '';
   cPrnRsc000199 = '';
   cPrnRsc000200 = '';

}

Type
  TPaperName = Array [0..63] of Char;
  TPaperInfo = packed Record
    papername: TPapername; { display name of the paper }
    paperID : Word; { DMPAPER_* ID }
    papersize: TPoint; { Size in 0.1 mm }
  end;
  TPaperInfos = Array of TPaperInfo;
  TPaperSizes = Array Of TPoint;
  TPageInfo = record
    width, height: Integer; { physical width and height, in dots }
    offsetX, offsetY: Integer;{ nonprintable margin, in dots }
    resX, resY: Integer; { logical resolution, dots per inch }
  end;

type
 TDoublePoint = packed record
    X: Double;
    Y: Double;
end;

type
  TPrinterInfo = packed record
   PrinterName,
   Description,
   Status,
   PrinterType,
   DriverName,
   Location,
   PortName,
   ServerName,
   Summary: String;
   Fax,
   Network,
   Shared,
   Hidden: Boolean;
end;

{Return the names, IDs, and sizes for all paper formats supported
 by a printer. Index is the index of the printer in the Printers
 array, or -1 if the default printer should be examined. }
procedure GetPaperInfo( var infos: TPaperInfos; index: Integer = -1 );
{Return the names and IDs for all bins supported by a printer.
 The IDs are returned in the strings Objects property.
 Index is the index of the printer in the Printers
 array, or -1 if the default printer should be examined. }
procedure GetBinNames( sl: TStrings; index: Integer = -1 );
{Return the names and IDs for all paper formats supported
 by a printer. The IDs are returned in the strings Objects property.
 Index is the index of the printer in the Printers
 array, or -1 if the default printer should be examined. }
procedure GetPaperNames( sl: TStrings; index: Integer = -1 );
{Return page information for the selected printer. }
procedure GetPageInfo( var info: TPageInfo; index: Integer = -1 );

{Convert a page-relative position in mm to a printer canvas
 position in dots. The page coordinate system is oriented the same
 as the MM_TEXT canvas coordinate system, origin at top left of
 page, positive Y axis downwards. }
function PointMMtoDots( const pt: TDoublePoint; const info: TPageInfo ):
TPoint;
{Convert a printer canvas position in dots to a page-relative
 position in mm. The page coordinate system is oriented the same
 as the MM_TEXT canvas coordinate system, origin at top left of
 page, positive Y axis downwards. }
function PointDotsToMM( const pt: TPoint; const info: TPageInfo ):
TDoublePoint;
{Convert a page-relative position in inch to a printer canvas
 position in dots. The page coordinate system is oriented the same
 as the MM_TEXT canvas coordinate system, origin at top left of
 page, positive Y axis downwards. }
function PointInchtoDots( const pt: TDoublePoint; const info: TPageInfo ):
TPoint;
{Convert a printer canvas position in dots to a page-relative
 position in inch. The page coordinate system is oriented the same
 as the MM_TEXT canvas coordinate system, origin at top left of
 page, positive Y axis downwards. }
function PointDotsToInch( const pt: TPoint; const info: TPageInfo ):
TDoublePoint;
{Convert inches to mm }
function InchToMM( const value: Double ): Double;
{Convert mm to inches }
function MMToInch( const value: Double ): Double;

{Return the default printer}
function GetDefaultPrinterName: String;
function GetDefaultPrinterIndex: Integer;
{Find the printers for a server specific on the network}
procedure GetPrintServers(const ServerName: string; var Printers: TStringList);
{Set basic printer settings.  The current printer becomes the printer
 specified by the printer index.}
procedure SetPrinterSettings(printerIndex: Integer;
 binID: SmallInt; paperID: SmallInt; AOrientation: TPrinterOrientation);
{Get basic printer settings.}
procedure GetPrinterSettings(const printerIndex: Integer;
 var binID: SmallInt; var paperID: SmallInt;
 var AOrientation: TPrinterOrientation; var AOrientationSupported: Boolean);
{Select printer.  Select a printer by name.}
procedure SelectPrinter(printerName: String); overload;
{Select printer.  Select a printer by index.  The index must match the
 index as found in the global printer list.}
procedure SelectPrinter(printerIndex: Integer); overload;
{Select a printer bin. The parameter is the DMBIN_* index to use.
 The current printer is always used. }
procedure SelectPrinterBin( binID: SmallInt );
{Select a standard paper size. The parameter is the DMPAPER_* index to use.
 The current printer is always used. }
procedure SelectPaper( paperID: SmallInt );
{Select orientation. Specify orientation for the current printer.}
procedure SelectOrientation( AOrientation: TPrinterOrientation );
{Reload a printers DEVMODE record. }
procedure ResetPrinter;

procedure GetPrinterInfo(const pPrinterName: PChar; var APrinterInfo: TPrinterInfo);
function GetPrinterStatus(const AStatus: Cardinal): String;
procedure ShowPrinterProperties(const index: Integer);

implementation

uses WinSpool,
     System.SysUtils,
     IQMS.Common.StringUtils;

procedure GetBinNames( sl: TStrings ; index: Integer);
Type
  TBinName = Array [0..23] of Char;
  TBinNameArray = Array [1..High(Integer) div Sizeof( TBinName )] of
                      TBinName;
  PBinnameArray = ^TBinNameArray;
  TBinArray = Array [1..High(Integer) div Sizeof(Word)] of Word;
  PBinArray = ^TBinArray;
var
  Device, Driver, Port: Array [0..255] of Char;
  hDevMode: THandle;
  i, numBinNames, numBins, temp: Integer;
  pBinNames: PBinnameArray;
  pBins: PBinArray;
begin
  Assert( Assigned( sl ));
  Printer.PrinterIndex := index;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  numBinNames :=
    WinSpool.DeviceCapabilities( Device, Port, DC_BINNAMES, NIL, NIL );
  numBins :=
    WinSpool.DeviceCapabilities( Device, Port, DC_BINS, NIL, NIL );
  if numBins <> numBinNames then begin
    raise Exception.Create(
            'DeviceCapabilities reports different number of bins and '+
            'bin names!');
  end; { if }

  if numBinNames > 0 then begin
    GetMem( pBinNames, numBinNames * Sizeof( TBinname ));
    GetMem( pBins, numBins * Sizeof(Word));
    try
      WinSpool.DeviceCapabilities( Device, Port, DC_BINNAMES,
                                   Pchar( pBinNames ), NIL);
      WinSpool.DeviceCapabilities( Device, Port, DC_BINS,
                                   Pchar( pBins ), NIL );
      sl.clear;
      for i:= 1 to numBinNames do begin
        temp := pBins^[i];
        sl.addObject( pBinNames^[i], TObject( temp ));
      end;
    finally
      FreeMem( pBinNames );
      if pBins <> NIL then
        FreeMem( pBins );
    end;
  end;
end;

procedure GetPaperNames( sl: TStrings; index: Integer );
Type
  TPaperNameArray = Array [1..High(Integer) div Sizeof( TPaperName )] of
                      TPaperName;
  PPapernameArray = ^TPaperNameArray;
  TPaperArray = Array [1..High(Integer) div Sizeof(Word)] of Word;
  PPaperArray = ^TPaperArray;
var
  Device, Driver, Port: Array [0..255] of Char;
  hDevMode: THandle;
  i, numPaperNames, numPapers, temp: Integer;
  pPaperNames: PPapernameArray;
  pPapers: PPaperArray;
begin
  Assert( Assigned( sl ));
  Printer.PrinterIndex := index;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  numPaperNames :=
    WinSpool.DeviceCapabilities( Device, Port, DC_PAPERNAMES, NIL, NIL );
  numPapers :=
    WinSpool.DeviceCapabilities( Device, Port, DC_PAPERS, NIL, NIL );
  if numPapers <> numPaperNames then begin
    raise Exception.Create(
            'DeviceCapabilities reports different number of papers and '+
            'paper names!');
  end; { if }

  if numPaperNames > 0 then
  begin
    GetMem( pPaperNames, numPaperNames * Sizeof( TPapername ));
    GetMem( pPapers, numPapers * Sizeof(Word));
    try
      WinSpool.DeviceCapabilities( Device, Port, DC_PAPERNAMES,
                                   Pchar( pPaperNames ), NIL);
      WinSpool.DeviceCapabilities( Device, Port, DC_PAPERS,
                                   Pchar( pPapers ), NIL );
      sl.clear;
      for i:= 1 to numPaperNames do
      begin
        temp := pPapers^[i];
        sl.addObject( pPaperNames^[i], TObject( temp ));
      end;
    finally
      FreeMem( pPaperNames );
      if pPapers <> NIL then
        FreeMem( pPapers );
    end;
  end;
end;

procedure GetPapersizes( var sizes: TPaperSizes; index: Integer );
var
  Device, Driver, Port: Array [0..255] of Char;
  hDevMode: THandle;
  numPapers: Integer;
begin
  Printer.PrinterIndex := index;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  numPapers :=
    WinSpool.DeviceCapabilities( Device, Port, DC_PAPERS, NIL, NIL );
  SetLength( sizes, numPapers );
  if numPapers > 0 then
    WinSpool.DeviceCapabilities( Device, Port, DC_PAPERSIZE,
                                 PChar( @sizes[0] ), NIL );
end;

procedure GetPaperInfo( var infos: TPaperInfos; index: Integer );
var
  sizes: TPaperSizes;
  sl: TStringlist;
  i: Integer;
begin
  sl:= Tstringlist.Create;
  try
     GetPaperNames( sl, index );
     GetPaperSizes( sizes, index );
     Assert( sl.count = Length( sizes ));
     SetLength( infos, sl.count );
     for i := 0 to sl.count-1 do begin
       StrPLCopy( infos[i].papername, sl[i], Sizeof( TPapername )-1);
       infos[i].paperID := LoWord( Longword( sl.Objects[i] ));
       infos[i].papersize := sizes[i];
     end; { for }
  finally
     sl.Free;
  end; { Try finally }
end;

procedure GetPageInfo( var info: TPageInfo; index: Integer = -1 );
begin
  if index > -1 then
    Printer.PrinterIndex := index;
  with Printer do begin
    info.resX := GetDeviceCaps( handle, LOGPIXELSX );
    info.resY := GetDeviceCaps( handle, LOGPIXELSY );
    info.offsetX := GetDeviceCaps( handle, PHYSICALOFFSETX );
    info.offsetY := GetDeviceCaps( handle, PHYSICALOFFSETY );
    info.width := GetDeviceCaps( handle, PHYSICALWIDTH );
    info.height := GetDeviceCaps( handle, PHYSICALHEIGHT );
  end; { with }
end;

function PointMMtoDots( const pt: TDoublePoint; const info: TPageInfo ):
TPoint;
var
  dp: TDoublePoint;
begin
  dp.X := MMToInch( pt.X );
  dp.Y := MMToInch( pt.Y );
  Result := PointInchtoDots( dp, info );
end;

function PointDotsToMM( const pt: TPoint; const info: TPageInfo ):
TDoublePoint;
begin
  Result := PointDotsToInch( pt, info );
  Result.X := InchToMM( Result.X );
  Result.Y := InchToMM( Result.Y );
end;

function PointInchtoDots( const pt: TDoublePoint; const info: TPageInfo ):
TPoint;
begin
  Result.X := Round( pt.X * info.resX ) - info.offsetX;
  Result.Y := Round( pt.Y * info.resY ) - info.offsetY;
end;

function PointDotsToInch( const pt: TPoint; const info: TPageInfo ):
TDoublePoint;
begin
  Result.X := ( pt.X + info.offsetX ) / info.resX;
  Result.Y := ( pt.Y + info.offsetY ) / info.resY;
end;

const
  mmPerInch = 25.4;

function InchToMM( const value: Double ): Double;
begin
  Result := value * mmPerInch;
end;

function MMToInch( const value: Double ): Double;
begin
  Result := value / mmPerInch;
end;

function GetDefaultPrinterName: String;
begin
  try
     Result := Printer.Printers.Strings[GetDefaultPrinterIndex];
  except
     // on some machines, if a default printer has not been configured,
     // then an exception will be raised.  We don't need to raise any
     // errors.  Just return empty string.
     Result := '';
  end;
end;

function GetDefaultPrinterIndex: Integer;
begin
  // Note: Using this method will also change the currently selected
  //       printer to the default printer.
  try
    Printer.PrinterIndex := -1;
    Result := Printer.PrinterIndex;
  except
    // on some machines, if a default printer has not been configured,
    // then an exception will be raised.  We don't need to raise any
    // errors.
    Result := -1;
  end;
end;

// Find the Printers for a server specific on the network
procedure GetPrintServers(const ServerName: string; var Printers: TStringList);
var
  lpBuffer,lpPrinterInfo: PChar;
  lcCount,lcNumCount : DWord ;
  liCount,liAux:integer;
  tmpList: TStringList;
  // ---------------------------------------------------------------------------
  function _getContexts(pctipo: cardinal; ppName: PChar ): TStringlist;
  var
    liCont : integer;
    lsNome:string;
    lbPode:boolean;
  begin
    lbPode := False;
    Result := TStringList.Create;
    case pcTipo of
      8: lbPode :=
        EnumPrinters(pctipo,ppName,1,PByte(lpBuffer),lcCount,lcCount,
          lcNumCount);
      16: lbPode :=
        EnumPrinters(pctipo,nil,1,PByte(lpBuffer),lcCount,lcCount,
          lcNumCount);
    end;
    if not lbPode then
      Exit;
    lpPrinterInfo := lpBuffer;
    for licont := 0 to lcNumCount - 1 do
    begin
      with PPrinterInfo1(lpPrinterInfo)^ do
      begin
        if pcTipo = 8 then
        begin
          liAux:=Pos(',',pDescription);
          lsNome := copy(pDescription,liAux+1,Length(pDescription));
          Result.Add(lsNome);
        end
        else
        begin
          liAux  := Pos(ppName,pName);
          lsNome := copy(pName,liAux,Length(pName));
          if lsNome = ppName then
          begin
            Result.Add(string(pName));
            Exit;
          end;
        end;
      end;
      Inc(lpPrinterInfo, sizeof(TPrinterInfo1));
    end;
  end;
  // ---------------------------------------------------------------------------
begin
  if not Assigned(Printers) then Exit;

  try
     try
        Printers.Clear;
        tmpList := TStringList.Create;
        lcCount := 0;
        EnumPrinters(PRINTER_ENUM_REMOTE,nil,1,nil,0,lcCount,lcNumCount);
        GetMem(lpBuffer,lcCount);
        tmpList := _getContexts(16,PChar(ServerName));
        if tmpList.Count <> 0   then
           tmpList := _getContexts(8,PChar(tmpList.Strings[0]));

        Printers.Assign(tmpList);

     finally
        if Assigned(tmpList) then FreeAndNil(tmpList);
     end;
  except
  end;
end;

procedure SetPrinterSettings(printerIndex: Integer;
 binID: SmallInt; paperID: SmallInt; AOrientation: TPrinterOrientation);
var
  Device, Driver, Port : array[0..127] of char;
  hDeviceMode: THandle;
  pDevMode: PDeviceMode;
begin
  with Printer do
  begin
    PrinterIndex := printerIndex;
    GetPrinter(Device, Driver, Port, hDeviceMode);
    SetPrinter(Device, Driver, Port, hDeviceMode);
    pDevMode := GlobalLock( hDevicemode );
    if pDevMode <> nil then
    try
      with pDevMode^ do
      begin
        // BIN
        dmFields := dmFields or DM_DEFAULTSOURCE;
        dmDefaultSource := binID;
        // Paper
        dmFields := dmFields or DM_PAPERSIZE;
        dmPapersize := paperID;
        // Orientation
        dmFields := dmFields or DM_ORIENTATION;
        dmOrientation := Ord(AOrientation) + 1;
      end;

      SetPrinter(Device, Driver, Port, hDeviceMode);

    finally
      GlobalUnlock( hDevicemode );
    end;
  end; { with }
end;

procedure GetPrinterSettings(const printerIndex: Integer;
 var binID: SmallInt; var paperID: SmallInt;
 var AOrientation: TPrinterOrientation;
 var AOrientationSupported: Boolean);
var
   Device, Driver, Port: array [0..255] of Char;
   hDevMode: THandle;
   pDevMode: PDeviceMode;
   iOrientation: Integer;
begin
  Printer.PrinterIndex := printerIndex;
  Printer.GetPrinter(Device, Driver, Port, hDevmode);
  AOrientationSupported := (pcOrientation in Printer.Capabilities);
  if hDevmode <> 0 then
     begin
       // lock it to get pointer to DEVMODE record
       pDevMode := GlobalLock(hDevMode);

       if (pDevmode <> NIL) then
       try
          // select the current paper size in the list
          paperID := pDevmode^.dmPapersize;
          binID := pDevmode^.dmDefaultSource;
          iOrientation := pDevmode^.dmOrientation;
          // set the orientation
          if (iOrientation in [1,2]) then
             AOrientation := TPrinterOrientation(iOrientation-1);
      finally
        // unlock devmode handle.
        GlobalUnlock(hDevmode);
      end;
     end;
end;

procedure SelectPrinter(printerName: String);
var
  Device, Driver, Port: array[0..127] of char;
  hDeviceMode: THandle;
  printerIndex: Integer;
begin
  printerIndex := Printer.Printers.IndexOf(printerName);
  if printerIndex = -1 then Exit;
  // initialize
  hDeviceMode := 0;
  // set values
  Printer.PrinterIndex:= printerIndex;
  Printer.GetPrinter( Device, Driver, Port, hDeviceMode );  // this is trick to
  Printer.SetPrinter( Device, Driver, Port, hDeviceMode );  // avoid possible memory leak
end;

procedure SelectPrinter(printerIndex: Integer);
var
  Device, Driver, Port: array[0..127] of char;
  hDeviceMode: THandle;
  iPrnIndex: Integer;
begin
  if (printerIndex < 0) or (printerIndex >= Printer.Printers.Count) then
     Exit;
  // initialize
  hDeviceMode := 0;
  // set values
  Printer.PrinterIndex:= printerIndex;
  Printer.GetPrinter( Device, Driver, Port, hDeviceMode );  // this is trick to
  Printer.SetPrinter( Device, Driver, Port, hDeviceMode );  // avoid possible memory leak
end;

procedure SelectPrinterBin( binID: SmallInt );
var
  Device, Driver, Port: array[0..127] of char;
  hDeviceMode: THandle;
  pDevMode: PDeviceMode;
begin
  with Printer do
  begin
    GetPrinter(Device, Driver, Port, hDeviceMode);
    pDevMode := GlobalLock( hDevicemode );
    if pDevMode <> nil then
    try
      with pDevMode^ do begin
        dmFields := dmFields or DM_DEFAULTSOURCE;
        dmDefaultSource := binID;
      end; { with }
    finally
      GlobalUnlock( hDevicemode );
    end;
  end; { with }
end;

procedure SelectPaper( paperID: SmallInt );
var
  Device, Driver, Port : array[0..127] of char;
  hDeviceMode: THandle;
  pDevMode: PDeviceMode;
begin
  with Printer do
  begin
    GetPrinter(Device, Driver, Port, hDeviceMode);
    pDevMode := GlobalLock( hDevicemode );
    if pDevMode <> nil then
    try
      with pDevMode^ do
      begin
        dmFields := dmFields or DM_PAPERSIZE;
        dmPapersize := paperID;
      end; { with }
    finally
      GlobalUnlock( hDevicemode );
    end;
  end; { with }
end;

procedure SelectOrientation( AOrientation: TPrinterOrientation );
var
  Device, Driver, Port : array[0..127] of char;
  hDeviceMode: THandle;
  pDevMode: PDeviceMode;
begin
  with Printer do
  begin
    GetPrinter(Device, Driver, Port, hDeviceMode);
    pDevMode := GlobalLock( hDevicemode );
    if pDevMode <> nil then
    try
      with pDevMode^ do
      begin
        dmFields := dmFields or DM_ORIENTATION;
        dmOrientation := Ord(AOrientation) + 1;
      end; { with }
    finally
      GlobalUnlock( hDevicemode );
    end;
  end; { with }
end;

procedure ResetPrinter;
var
  Device, Driver, Port: array[0..80] of Char;
  DevMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, DevMode);
  Printer.SetPrinter(Device, Driver, Port, 0)
end;

procedure GetPrinterInfo(const pPrinterName: PChar; var APrinterInfo: TPrinterInfo);
var
  HPrinter : THandle;
  InfoSize,
  BytesNeeded: Cardinal;
  PI2: PPrinterInfo2;
  PrinterDefaults: TPrinterDefaults;
  tmpPrinterName,tmpServerName: String;

  // ---------------------------------------------------------------------------
  function _fixPrinterName(const AName: String): String;
  var
     n: Integer;
  begin
    Result := AName;
    if Pos('\\', Result) = 1 then
       Result := Copy(AName, 3, Length(AName));
    Result := Trim(Result);

    n := NumToken(Result, '\');
    if n > 0 then
       Result := GetToken(Result, '\', n);
  end;
  // ---------------------------------------------------------------------------
  function _fixServerName(const AName: String): String;
  var
     n: Integer;
  begin
    Result := AName;
    if Pos('\\', Result) = 1 then
       Result := Copy(AName, 3, Length(AName));
    Result := Trim(Result);
  end;
  // ---------------------------------------------------------------------------


begin

  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ACCESS_USE;
    pDatatype := nil;
    pDevMode := nil;
  end;

  if OpenPrinter(pPrinterName, HPrinter, @PrinterDefaults) then
  try
     SetLastError(0);
     //Determine the number of bytes to allocate for the PRINTER_INFO_2 construct...
     if not GetPrinter(HPrinter, 2, nil, 0, @BytesNeeded) then
     begin
       //Allocate memory space for the PRINTER_INFO_2 pointer (PrinterInfo2)...
       PI2 := AllocMem(BytesNeeded);
       try
         InfoSize := SizeOf(TPrinterInfo2);
         if GetPrinter(HPrinter, 2, PI2, BytesNeeded, @BytesNeeded) then
         begin
           PI2.pSecurityDescriptor := nil;
           // Apply settings to the printer
           if DocumentProperties(0, hPrinter, pPrinterName, PI2.pDevMode^,
                                 PI2.pDevMode^, DM_IN_BUFFER or DM_OUT_BUFFER) = IDOK then
           begin
             APrinterInfo.PrinterName := PI2.pPrinterName;
             APrinterInfo.Location := PI2.pLocation;
             APrinterInfo.PrinterType := PI2.pDriverName;
             APrinterInfo.Status := GetPrinterStatus(PI2.Status); // local method, this unit
             APrinterInfo.DriverName := PI2.pDriverName;
             APrinterInfo.PortName := PI2.pPortName;
             APrinterInfo.Summary := PI2.pComment;
             APrinterInfo.ServerName := PI2.pServerName;

             APrinterInfo.Network :=
               (PI2.Attributes and PRINTER_ATTRIBUTE_NETWORK) = PRINTER_ATTRIBUTE_NETWORK;
             APrinterInfo.Shared :=
               (PI2.Attributes and PRINTER_ATTRIBUTE_SHARED) = PRINTER_ATTRIBUTE_SHARED;
             APrinterInfo.Hidden :=
               (PI2.Attributes and PRINTER_ATTRIBUTE_HIDDEN) = PRINTER_ATTRIBUTE_HIDDEN;
             // Note: The PRINTER_ATTRIBUTE_DEFAULT attribute does not seem to work.

             // Further information may be obtained by referencing
             // PI2.pDevMode^

             // Get the printer description -- display name -- for lists.
             tmpServerName := _fixServerName(APrinterInfo.ServerName);
             tmpPrinterName := _fixPrinterName(APrinterInfo.PrinterName);
             APrinterInfo.Description := tmpPrinterName;
             if APrinterInfo.Network and (tmpPrinterName > '') and (tmpServerName > '') then
                APrinterInfo.Description := Format(cPrnRsc000160, // '%s on %s'
                   [tmpPrinterName, tmpServerName]);

           end;
         end;
       finally
         FreeMem(PI2, BytesNeeded);
       end;
     end;
  finally
    ClosePrinter(HPrinter);
  end;
end;

function GetPrinterStatus(const AStatus: Cardinal): String;
  // ---------------------------------------------------------------------------
  function _Eval(const ACheckValue: Cardinal): Boolean;
  begin
    Result := (AStatus and ACheckValue) <> 0;
  end;
  // ---------------------------------------------------------------------------
begin
       if _Eval(WinSpool.PRINTER_STATUS_PAUSED)            then Result := cPrnRsc000134  // 'Paused'
  else if _Eval(WinSpool.PRINTER_STATUS_ERROR)             then Result := cPrnRsc000135  // 'Error'
  else if _Eval(WinSpool.PRINTER_STATUS_PENDING_DELETION)  then Result := cPrnRsc000136  // 'Pending Deletion'
  else if _Eval(WinSpool.PRINTER_STATUS_PAPER_JAM)         then Result := cPrnRsc000137  // 'Paper Jam'
  else if _Eval(WinSpool.PRINTER_STATUS_PAPER_OUT)         then Result := cPrnRsc000138  // 'Paper Out'
  else if _Eval(WinSpool.PRINTER_STATUS_MANUAL_FEED)       then Result := cPrnRsc000139  // 'Manual Feed'
  else if _Eval(WinSpool.PRINTER_STATUS_PAPER_PROBLEM)     then Result := cPrnRsc000140  // 'Paper Problem'
  else if _Eval(WinSpool.PRINTER_STATUS_OFFLINE)           then Result := cPrnRsc000141  // 'Offline'
  else if _Eval(WinSpool.PRINTER_STATUS_IO_ACTIVE)         then Result := cPrnRsc000142  // 'IO Active'
  else if _Eval(WinSpool.PRINTER_STATUS_BUSY)              then Result := cPrnRsc000143  // 'Busy'
  else if _Eval(WinSpool.PRINTER_STATUS_PRINTING)          then Result := cPrnRsc000144  // 'Printing'
  else if _Eval(WinSpool.PRINTER_STATUS_OUTPUT_BIN_FULL)   then Result := cPrnRsc000145  // 'Output Bin Full'
  else if _Eval(WinSpool.PRINTER_STATUS_NOT_AVAILABLE)     then Result := cPrnRsc000146  // 'Not Available'
  else if _Eval(WinSpool.PRINTER_STATUS_WAITING)           then Result := cPrnRsc000147  // 'Waiting'
  else if _Eval(WinSpool.PRINTER_STATUS_PROCESSING)        then Result := cPrnRsc000148  // 'Processing'
  else if _Eval(WinSpool.PRINTER_STATUS_INITIALIZING)      then Result := cPrnRsc000149  // 'Initializing'
  else if _Eval(WinSpool.PRINTER_STATUS_WARMING_UP)        then Result := cPrnRsc000150  // 'Warming Up'
  else if _Eval(WinSpool.PRINTER_STATUS_TONER_LOW)         then Result := cPrnRsc000151  // 'Toner Low'
  else if _Eval(WinSpool.PRINTER_STATUS_NO_TONER)          then Result := cPrnRsc000152  // 'No Toner'
  else if _Eval(WinSpool.PRINTER_STATUS_PAGE_PUNT)         then Result := cPrnRsc000153  // 'Page Punt'
  else if _Eval(WinSpool.PRINTER_STATUS_USER_INTERVENTION) then Result := cPrnRsc000154  // 'User Intervention'
  else if _Eval(WinSpool.PRINTER_STATUS_OUT_OF_MEMORY)     then Result := cPrnRsc000155  // 'Out Of Memory'
  else if _Eval(WinSpool.PRINTER_STATUS_DOOR_OPEN)         then Result := cPrnRsc000156  // 'Door Open'
  else if _Eval(WinSpool.PRINTER_STATUS_SERVER_UNKNOWN)    then Result := cPrnRsc000157  // 'Server Unknown'
  else if _Eval(WinSpool.PRINTER_STATUS_POWER_SAVE)        then Result := cPrnRsc000158  // 'Power Save'
  else Result := cPrnRsc000159; // 'Ready'
end;

procedure ShowPrinterProperties(const index: Integer);
const
  {
   The TPrinterDefaults structure specifies the default data type,
   environment, initialization data, and access rights for a printer.
  }
  Defaults: TPrinterDefaults = (pDatatype: nil;
    pDevMode: nil;
    //DesiredAccess: STANDARD_RIGHTS_REQUIRED or PRINTER_ACCESS_USE);
    DesiredAccess: STANDARD_RIGHTS_READ or STANDARD_RIGHTS_WRITE or
      STANDARD_RIGHTS_EXECUTE or PRINTER_ACCESS_USE);

var
  hPrinter: THandle;
  Device: array[0..255] of char;
  Driver: array[0..255] of char;
  Port: array[0..255] of char;
  hDeviceMode: THandle;
  RetVal: Boolean;
begin
  // get the currently selected printer
  if index = -1 then Exit;

  Printer.PrinterIndex := index;

  { Retrieve information about the specified printer }
  Printer.GetPrinter(Device,
    Driver,
    Port,
    hDeviceMode);
  { Retrieve a handle identifying the specified printer or print }
  if not OpenPrinter(@Device, hPrinter, @Defaults) then
    RaiseLastWin32Error;
  try
    { Display a printer-properties property sheet for the specified printer }
//    PrinterProperties(Application.Handle, hPrinter);
  finally
    { Close the specified printer object }
    ClosePrinter(hPrinter);
  end;
end;

end.

{== DblRect ===========================================================}
{: This unit defines point and rect types which store their boundaries
as doubles, plus some routines to work with these types.
@author Dr. Peter Below
@desc Version 1.0 created 22.02.1997<BR>
        Version 1.01 created 04.12.2001, added InflateDoubleRect and
          modified comments for Time2Help.<BR>
        Current revision 1.01<BR>
        Last modified 4 Dezember 2001<P>
}
{======================================================================}
{$BOOLEVAL OFF}{Unit depends on shortcut boolean evaluation}
Unit DblRect;
Interface

uses WinTypes;

Type
  TDoublePoint = Record
    X, Y: Double;
  end;
  TDoubleRect = Record
    Case Byte Of
      0 : (Left, Top, Right, Bottom: Double);
      1 : (topleft, bottomright: TDoublePoint);
      2 : (X1, Y1, X2, Y2: Double);
  end;

const
  EmptyDoubleRect: TDoubleRect
    =(Left: 0.0; Top: 0.0; Right: 0.0; Bottom: 0.0);
  EmptyPoint : TDoublePoint = (X: 0.0; Y: 0.0);

{$IFDEF WIN32}
var
{$ENDIF}
  DefaultEpsilon : Double = 1.0e-8;


function DoublePoint(const aX, aY: Double): TDoublePoint;
function AreDoublePointsEqual(const P1, P2: TDoublePoint): Boolean;
procedure OffsetDoublePoint(var P: TDoublePoint; dx, dy: Double);
procedure ScaleDoublePoint(var P: TDoublePoint; factor: DOuble);
function DoublePointDistance(const P1, P2: TDoublePoint): Double;
function PointFromDoublePoint(const P: TDoublePoint): TPoint;
function DoublePointFromPoint(const P: TPoint): TDoublePoint;

function DoubleRect( const L,T,R,B: Double): TDoubleRect;
procedure VerifyDoubleRect(var R: TDoubleRect);
function AreDoubleRectsEqual(const R1, R2:TDoubleRect): Boolean;
procedure OffsetDoubleRect(var R: TDoubleRect; dx, dy: Double);
procedure ScaleDoubleRect(var R: TDoubleRect; cx, cy: Double);
procedure InflateDoubleRect(var R: TDoubleRect; dx, dy: Double);
procedure IntersectDoubleRect(const R1,R2: TDoubleRect; var isect:
TDoubleRect);
function IsDoubleRectEmpty(const R: TDoubleRect): Boolean;
function RectFromDoubleRect(const R: TDoubleRect): TRect;
function DoubleRectFromRect(const R: TRect): TDoubleRect;

function DoublePointInRect(const P: TDOublePoint; const R: TDoubleRect):
Boolean;

function ULeft(const R: TDoubleRect): TDoublePoint;
function URight(const R: TDoubleRect): TDoublePoint;
function LLeft(const R: TDoubleRect): TDoublePoint;
function LRight(const R: TDoubleRect): TDoublePoint;

Implementation

{: Returns a TDoublePoint constructed from the passed coordinates. }
function DoublePoint(const aX, aY: Double): TDoublePoint;
  begin
    with Result do begin
      X := aX;
      Y := aY;
    end; { with }
  end; { function DoublePoint }

{: Compares the two passed points and returns true if they are
  considered equal, false otherwise. The points are equal if their
  coordinates differ less than the DefaultEpsilon. }
function AreDoublePointsEqual(const P1, P2: TDoublePoint): Boolean;
  begin
    Result := (Abs(P1.X - P2.X) < DefaultEpsilon) and
              (Abs(P1.Y - P2.Y) < DefaultEpsilon);
  end; { function AreDoublePointsEqual }

{: Moves the passed point by the passed increments. }
procedure OffsetDoublePoint(var P: TDoublePoint; dx, dy: Double);
  begin
    with P do begin
      X := X + dx;
      Y := Y + dy;
    end; { with }
  end; { procedure OffsetDoublePoint }

{: Multiplies the passed points coordinates by factor. }
procedure ScaleDoublePoint(var P: TDoublePoint; factor: DOuble);
  begin
    with P do begin
      X := X * factor;
      Y := Y * factor;
    end; { with }
  end; { procedure ScaleDoublePoint }

{:Returns the distance between the passed points. This will always
  be a positive number.}
function DoublePointDistance(const P1, P2: TDoublePoint): Double;
  begin
    Result := Sqrt(Sqr(P1.X - P2.X) + Sqr(P1.Y - P2.Y));
  end; { function DoublePointDistance }

{: Converts the passed TDoublePoint to a TPoint and returns the
   result.}
function PointFromDoublePoint(const P: TDoublePoint): TPoint;
  begin
    with Result do begin
      X := Round(P.X);
      Y := Round(P.Y);
    end; { with }
  end; { function PointFromDoublePoint }

{:Converts the passed TPoint to a TDoublePoint and returns the
  result. }
function DoublePointFromPoint(const P: TPoint): TDoublePoint;
  begin
    with Result do begin
      X := P.X;
      Y := P.Y;
    end; { with }
  end; { function DoublePointFromPoint }


{:Returns a TDoubleRect made from the passed parameters.
  Makes certain that the resulting rect meets the
  criteria Left < Right and Top < Bottom, boundaries may be
  swapped to achieve this. }
function DoubleRect( const L,T,R,B: Double): TDoubleRect;
  begin
    with result do begin
      if L <= R then begin
        Left := L;
        Right := R;
      end { if }
      else begin
        Left := R;
        Right := L;
      end; { else }
      if T <= B then begin
        Top := T;
        Bottom := B;
      end { if }
      else begin
        Top := B;
        Bottom := T;
      end; { else }
    end; { with }
  end; { function DoubleRect }

{:Makes sure the passed rectangle meets the constraints Left < Right
  and Top < Bottom, if needed, boundaries will be swapped.}
procedure VerifyDoubleRect(var R: TDoubleRect);
  var
    temp: Double;
  begin
    with R do begin
      if Left > Right then begin
        temp := Left;
        Left := right;
        Right := temp;
      end; { if }
      if Top > Bottom then begin
        temp := Top;
        Top := Bottom;
        Bottom := temp;
      end; { if }
    end; { with }
  end; { procedure VerifyDoubleRect }



{:Returns True if the two passed rects R1 and R2 are equal, false
  otherwise. Equal in this case means that each of the four coordinates
  of P1 has a difference of less than DefaultEpsilon from the corresponding
  coordinate of P2 }
function AreDoubleRectsEqual(const R1, R2:TDoubleRect): Boolean;
  begin
    Result := (Abs(R1.X1 - R2.X1) < DefaultEpsilon) and
              (Abs(R1.Y1 - R2.Y1) < DefaultEpsilon) and
              (Abs(R1.X2 - R2.X2) < DefaultEpsilon) and
              (Abs(R1.Y2 - R2.Y2) < DefaultEpsilon);
  end; { AreDoubleRectsEqual }

{:Moves the passed rectangle by the given increments.}
procedure OffsetDoubleRect(var R: TDoubleRect; dx, dy: Double);
  begin
    with R do begin
      X1 := X1 + dx;
      Y1 := Y1 + dy;
      X2 := X2 + dx;
      Y2 := Y2 + dy;
    end; { with }
  end; { procedure OffsetDoubleRect }

{:Scales the passed rectangle by the factors given. This changes
  only the size of the rectangle, the upper left corner coordinates
  stay fixed.}
procedure ScaleDoubleRect(var R: TDoubleRect; cx, cy: Double);
  begin
    with R do begin
      X2 := (X2-X1)*cx + X1;
      Y2 := (Y2-Y1)*cy + Y1;
    end; { with }
  end; { procedure ScaleDoubleRect }

{-- InflateDoubleRect -------------------------------------------------}
{: Change the size of a double rect.
@Param R is the rect to change
@Param dx is the horizontal size increment to apply
@Param dy is the vertical size increment to apply
@Desc Like the API function InflateRect this procedure will subtract dx
  from the r.left, add dx to r.right, subtract dy from r.top and add
  dy to r.bottom. So the rectangle width and height changes by 2 times
  the increment.
}{ Created 4.12.2001 by P. Below
-----------------------------------------------------------------------}
procedure InflateDoubleRect( var R: TDoubleRect; dx, dy: Double );
  begin { InflateDoubleRect }
    r.Left := r.Left - dx;
    r.Right := r.Right + dx;
    r.Top := r.Top - dy;
    r.Bottom := r.Bottom + dy;
  end; { InflateDoubleRect }

{:Calculates the intersection of the two rectangles passed and returns
  the result in isect. The result will be empty if the rectangles are
  disjunct.
  Note that this procedure assumes that the rectangles obey the
  constraints Left <= Right and Top <= Bottom !}
procedure IntersectDoubleRect(const R1,R2: TDoubleRect; var isect:
TDoubleRect);
  begin
    if (R1.Left > R2.Right) or
       (R1.Right < R2.Left) or
       (R1.Top > R2.Bottom) or
       (R1.Bottom < R2.Top)
    then begin
      { The two rectangles do not intersect }
      isect := EmptyDoubleRect;
    end { if }
    else begin
      { figure out placement of left border of result rectangle,
        which is the rightmost of the two left borders of the
        source rectangles. }
      if R1.Left < R2.Left then
        isect.Left := R2.Left
      else
        isect.Left := R1.Left;
      { figure out placement of top border of result rectangle,
        which is the bottommost of the two top borders of the
        source rectangles. }
      if R1.Top < R2.Top then
        isect.Top := R2.Top
      else
        isect.Top := R1.Top;
      { figure out placement of right border of result rectangle,
        which is the leftmost of the two Right borders of the
        source rectangles. }
      if R1.Right > R2.Right then
        isect.Right := R2.Right
      else
        isect.Right := R1.Right;
      { figure out placement of Bottom border of result rectangle,
        which is the topmost of the two Bottom borders of the
        source rectangles. }
      if R1.Bottom > R2.Bottom then
        isect.Bottom := R2.Bottom
      else
        isect.Bottom := R1.Bottom;
    end;
  end; { procedure IntersectDoubleRect }

{:Returns True if the passed rect spans no area, meaning the
  TopLeft and BottomRight corners are equal inside the precision
  given by the default threshold value DefaultEpsilon}
function IsDoubleRectEmpty(const R: TDoubleRect): Boolean;
  begin
    Result := AreDoublePointsEqual(R.TopLeft, R.BottomRight);
  end; { function IsDoubleRectEmpty }

{: Constructs a TRect from the passed TDoubleRect and returns it.
   The standard Round function is used to convert floating point
   to integer. }
function RectFromDoubleRect(const R: TDoubleRect): TRect;
  begin
    with Result do begin
      Left := Round(R.Left);
      Top := Round(R.Top);
      Right := Round(R.Right);
      Bottom := Round(R.Bottom);
    end; { with }
  end; { function RectFromDoubleRect }

{:Constructs a TDoubleRect from the passed rect, validates it
  and returns it.}
function DoubleRectFromRect(const R: TRect): TDoubleRect;
  begin
    with Result do begin
      Left := R.Left;
      Top := R.Top;
      Right := R.Right;
      Bottom := R.Bottom;
    end; { with }
    VerifyDoubleRect(Result);
  end; { function DoubleRectFromRect }

{:Performs a point-in-rectangle test and returns True, if the
  passed point is inside the rectangle or on one of its borders,
  false otherwise. The rectangle must meet the constraints
  Left <= Right and Top <= Bottom !}
function DoublePointInRect(const P: TDOublePoint; const R: TDoubleRect):
Boolean;
  begin
    with R, P do begin
      Result := (X >= Left) and (X <= Right) and
                (Y >= Top) and (Y <= Bottom);
    end; { with }
  end; { function DoublePointInRect }

{: Returns the upper left corner of the passed rectangle}
function ULeft(const R: TDoubleRect): TDoublePoint;
  begin
    Result := R.TopLeft;
  end; { function ULeft }

{:Returns the upper right corner of the passed rectangle}
function URight(const R: TDoubleRect): TDoublePoint;
  begin
    with R, result do begin
      X:= Right;
      Y:= Top;
    end; { with }
  end; { function URight }

{:Returns the lower left corner of the passed rectangle}
function LLeft(const R: TDoubleRect): TDoublePoint;
  begin
    with R, result do begin
      X:= Left;
      Y:= Bottom;
    end; { with }
  end; { function LLeft }

{:Returns the lower right corner of the passed rectangle}
function LRight(const R: TDoubleRect): TDoublePoint;
  begin
    Result := R.BottomRight;
  end; { function LRight }


end. { DblRect }

