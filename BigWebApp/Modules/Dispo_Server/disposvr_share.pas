unit disposvr_share;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.FileCtrl;

(* -----------------------------------------------------------------------------
  ***                    Running Disposition Server                         ***
  -----------------------------------------------------------------------------

  1.  Begin by declaring this unit (disposvr_share) in your application's calling
  unit.

  2.  Execute the Disposition Server.  For convenience, can call the
  wrapper in this unit. For example:

  disposvr_share.RunDispositionServer;

  The method takes an option parameter for the "working directory," which
  is the directory that is being scanned.  You do not need to provide a
  value unless the directory is different from the standard SERIAL_BAY
  directory in the local home path.

  3. Call one of the MakeSerialFile() methods below to put a serial
  number file in the specified directory.  The directory must be the
  same one that Disposition Server is watching.  For example:

  MakeSerialFile(AWorkingDirectory, ASerial, ABackflush, ATransCodeID);

  As soon as a file is added to the working directory, your
  application is done.  The Disposition Server will process it.
*)

procedure RunDispositionServer(const AWorkingDirectory: String = '');

(*
  -----------------------------------------------------------------------------
  ***      The Purpose and Functionality of the MakeSerialFile() Methods     ***
  ------------------------------------------------------------------------------
  Once you have called disposvr.exe as a COM server, you are ready to create
  "serial files."  Serial files contain at minimum the serial number you want
  processed.  As Disposition Server (disposvr.exe) runs, it monitors the
  "working directory" and will process serial files as soon as it finds them.
  To create a serial file, call MakeSerialFile declared in this unit.  There
  are several overload versions of MakeSerialFile, so you can choose which
  one best suits your needs.

  The primary MakeSerialFile() method takes the following parameters:

  1. ADirectory = The "working directory" is usually the IQMS local home
  path, followed by the subdirectory, "SERIAL_BAY."  A serial file
  will be created in this directory.
  2. ASerial = The serial number you wish to be processed.
  3. Params = A list of additional parameters.
  The other overload methods allow you to create simple serial files,
  with only the most basic information.
  ------------------------------------------------------------------------------


  ------------------------------------------------------------------------------
  ***                          Creating Serial Files                         ***
  ------------------------------------------------------------------------------
  MakeSerialFile takes a list of constants, listed in pairs.  First name the
  "field" and then the "value."  There should therefore always be an even number
  of parameters.  The order of the parameters does not matter, as long they
  come in pairs.

  Examples:

  // This will disposition with backflush
  MakeSerialFile('C:\IQWin\SERIAL_BAY', '00012345',
  [BACKFLUSH, 'Y',          // Yes, backflush
  TRANS_CODE_ID, 12345,    // Pass TRANS_CODE_ID
  QUANTITY, 50,            // Override default quantity (normally taken from MASTER_LABEL)
  FGMULTI_ID, 12345,       // Use this FGMULTI_ID (overrides default)
  WORK_CENTER_ID, 12345,   // Use this WORK_CENTER_ID (overrides default)
  STANDARD_ID, 12345,      // Use this STANDARD_ID (overrides default)
  DAY_PART_ID, 12345,      // Use this DAY_PART_ID
  XDAYPROD_ID, 12345,      // Use this XDAYPROD_ID
  UPDATE_XDAYPART, 'Y',    // Yes, update XDAYPART (calls method similar to Dispo.Update_Floor_Dispo_XDay_Part)
  TRANS_DATE, 38694,       // Override default Transaction Date
  NEW_PARENT_ID, 12345,    // Update the PARENT_ID with this value
  DISPO_METHOD, 1,         // Specify Dispo Method (0=default; 1=Dispo with Backflush; 2=Floor Dispo)
  ILLUM_PART_ID, 12345]);  // The ILLUM_PART_ID, if it is known

  // This will floor disposition the item
  MakeSerialFile('C:\IQWin\SERIAL_BAY', '00012345',
  [BACKFLUSH, 'Y',          // Yes, backflush
  TRANS_CODE_ID, 12345,    // Pass TRANS_CODE_ID
  QUANTITY, 50,            // Override default quantity (normally taken from MASTER_LABEL)
  FGMULTI_ID, 12345,       // Use this FGMULTI_ID (overrides default)
  WORK_CENTER_ID, 12345,   // Use this WORK_CENTER_ID (overrides default)
  STANDARD_ID, 12345,      // Use this STANDARD_ID (overrides default)
  DAY_PART_ID, 12345,      // Use this DAY_PART_ID
  TRANS_DATE, 38694,       // Override default Transaction Date
  NEW_PARENT_ID, 12345,    // Update the PARENT_ID with this value
  DISPO_METHOD, 2]);       // Specify Dispo Method (0=default; 1=Dispo with Backflush; 2=Floor Dispo)

  // This method will also work, but the defaults will be used
  MakeSerialFile('C:\IQWin\SERIAL_BAY', '00012345', []);

  To see a list of available constants and how they are to be used, see in this
  unit below.

  For the secondary overload methods, see below.

*)
procedure MakeSerialFile(const ADirectory, ASerial: String;
  const Params: array of Variant); overload;

(* -----------------------------------------------------------------------------
  ***        How to Add a New Parameter to MakeSerialFile()                 ***
  -----------------------------------------------------------------------------
  The primary overload method, MakeSerialFile(), takes a parameter list.
  To add to the parameter to the list, do the following:

  1.  Add a constant to the constant list in this unit, below.

  2.  Add lines to add a tag to the XML file in the primary overload
  version of MakeSerialFile in this unit, below.

  3.  Add a value to the TPacketData record object declared in
  disposvr_svr.pas.

  4.  Modify disposvr_svr.GetPacketData. Add a block to get the tag
  value.  Follow the same pattern used for the other tags.
  NOTE: disposvr_svr.GetPacketData is currently unused.

  5.  Add a property to the TDispoSerial object in disposvr_svr.pas.
  This will allow values to be assigned to the object before
  the Execute procedure is called.

  6.  Check the calls to TDispoSerial.Create in
  disposvr_main.ProcessSerialFile, and anywhere else
  TDispoSerial.Create may be called.  You may need to add the new
  property value.

  7.  Be sure to initialize the variables used for properties and
  records.  For instance, check disposvr_svr methods,
  FillCurrentSerialDataFor and ClearSerialData.

  8.  After ensuring variables are initialized, go to disposvr_svr
  method FillCurrentSerialDataFor.  Default values are retrieved
  from the database in this method, and the record is filled.
  Property values are later used to overwrite those default
  values.  Be sure that any new values you add to the
  CurrentSerialData record are initialized from the database
  and/or from the property inside this method.

  ---------------------------------------------------------------------------
*)

(* -----------------------------------------------------------------------------
  ***           Secondary Overload Methods for MakeSerialFile()              ***
  ------------------------------------------------------------------------------
  These methods have been added for simplicity.  Each puts a serial number file
  in the directory you specify.  If Disposition Server (disposvr.exe) is
  running, then the file will be processed as usual.
*)

procedure MakeSerialFile(const ADirectory, ASerial: String;
  const ABackflush: Boolean; const ATransCodeID: Real); overload;

procedure MakeSerialFile(const ADirectory: String;
  const ASerialList: TStringList; const ABackflush: Boolean;
  const ATransCodeID: Real); overload;

(* -----------------------------------------------------------------------------
  ***                        Supporting Methods                             ***
  -----------------------------------------------------------------------------
*)

// Is the serial number text a valid serial number?
// Applies a basic check of the text itself.  There is no database check.
function ValidSerialNumber(const ASerial: String): Boolean;

// Is Disposition Server an active COM server?
function IsDispoServerActive(var ALastError: String): Boolean;

(* -----------------------------------------------------------------------------
  ***                   MakeSerialFile() Parameter Constants                ***
  -----------------------------------------------------------------------------

  The following constant list is passed in the params of MakeSerialFile().
  In principle, the constants should be descriptive of what they do or the
  database field value they represent.  And for the sake of simplicity and
  consistency, the value should be the same as the tag string in the XML file.

*)

const
  BACKFLUSH = 'BACKFLUSH'; // [String] Backflush if possible ('Y', 'N').
  TRANS_CODE_ID = 'TRANS_CODE_ID'; // [Float]  Transaction Code ID
  QUANTITY = 'QUANTITY'; // [Float]  Disposition Quantity.  If not
  // supplied, MASTER_LABEL is checked.
  FGMULTI_ID = 'FGMULTI_ID'; // [Float]  Target "in" side of the disposition
  WORK_CENTER_ID = 'WORK_CENTER_ID'; // [Float]  Associated Work Center
  STANDARD_ID = 'STANDARD_ID'; // [Float]  Actual STANDARD_ID
  DAY_PART_ID = 'DAY_PART_ID'; // [Float]
  XDAYPROD_ID = 'XDAYPROD_ID'; // [Float]
  UPDATE_XDAYPART = 'UPDATE_XDAYPART'; // [String] Update XDAY_PART ('Y', 'N')
  TRANS_DATE = 'TRANS_DATE'; // [Float]  Transaction date.
  NEW_PARENT_ID = 'NEW_PARENT_ID'; // [Float]  Update to this Parent ID
  DISPO_METHOD = 'DISPO_METHOD'; // [Byte]   Disposition method.  Pass a number:
  // 0=Default; 1=Dispo With Backflush; 2=Floor Dispo
  // Example: 'DISPO_METHOD', 1, ...
  ILLUM_PART_ID = 'ILLUM_PART_ID'; // [Float]  The ILLUM_PART_ID, if it is known
  DISPO_DUPLICATES = 'DISPO_DUPLICATES';
  // [String] Disposition Duplicate Serials ('Y', 'N')
  USER_NAME = 'USER_NAME';
  // [String] User Name of current user (overrides disposition method UserID)
  EPLANT_ID = 'EPLANT_ID';
  // [Float]  EplantID of current user (overrides disposition method EplantID)

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.COMExe,
  IQMS.Common.COMServer,
  IQMS.Common.FileUtils,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

{ Wrapper to run Disposition Server }
procedure RunDispositionServer(const AWorkingDirectory: String);
begin
  Com_Exec('DISPOSVR', [AWorkingDirectory]);
end;

{ This is the primary overloaded method for MakeSerialFile }
procedure MakeSerialFile(const ADirectory, ASerial: String;
  const Params: array of Variant); overload;

  function VarIsEmpty(V: Variant): Boolean;
  begin
    case TVarData(V).VType of
      varString:
        Result := V = '';
{$IF CompilerVersion >= 26}  // Delphi XE5
      varUString:
        Result := V = '';
{$IFEND}
    else
      Result := V = 0;
    end;
  end;

  function VarToStr(V: Variant): string;
  begin
    case TVarData(V).VType of
      varString:
        Result := V;
{$IF CompilerVersion >= 26}  // Delphi XE5
      varUString:
        Result := V;
{$IFEND}
    else
      Result := FloatToStr(V);
    end;
  end;

  function VarIsStr(V: Variant): Boolean;
  begin
    Result := (TVarData(V).VType = varString)
{$IF CompilerVersion >= 26}  // Delphi XE5
      or
      (TVarData(V).VType = varUString);
{$IFEND}
  end;

var
  AFileLines: TStringList;
  AFileName: String; // full file name (path + name) of the XML file
  I: Integer; // counter variable
  N: Integer; // size of the array
  AField: String; // "field" name: corresponds to constants listed above
  AValue: Variant; // value associated with the "field"
begin

  // ensure these values are provided
  if (ADirectory = '') or (ASerial = '') then
    Exit;
  // get the full name of the XML "serial file"
  AFileName := IQMS.Common.FileUtils.GetDirectoryName(ADirectory) + IQMS.Common.StringUtils.LPadZero(ASerial,
    9) + '.xml';
  // ensure the target directory has been created
  ForceDirectories(ADirectory);
  // if the file exists already, then exit.
  if FileExists(AFileName) then
    Exit; // Does the file already exist?

  AFileLines := TStringList.Create;
  try
    AFileLines.Add('<?xml version="1.0"?>');
    AFileLines.Add('<!DOCTYPE SerialFile>');
    AFileLines.Add('<PACKET>');
    AFileLines.Add(Format('  <SERIAL>%s</SERIAL>', [ASerial]));

    I := 0; // initialize
    N := High(Params); // the count of the params
    // parse the parameters:  what values will we pass?
    while I < N do
      begin
        // Params[ I ] - name of the field, Params[ I + 1 ] - value to equate to
        AField := Params[I];
        AValue := Params[I + 1];

        // continue if the var is empty
        if VarIsEmpty(AValue) then // nested method above
          begin
            // increment the counter used for looping
            Inc(I, 2);
            CONTINUE;
          end;

        // assign the values to the variables
        // NOTE:  To add to this list, first add a constant to the list above,
        // and then follow the basic logic below (if the constant exists,
        // add the tag and value).
        if AField = BACKFLUSH then
          begin
            // check if BACKFLUSH is passed as a Y/N string value
            if VarIsStr(AValue) and ((AValue = 'Y') or (AValue = 'N')) then
              AFileLines.Add(Format('  <BACKFLUSH>%d</BACKFLUSH>',
                [Integer(IQMS.Common.Boolean.YNToBool(AValue))]))
            else
              AFileLines.Add(Format('  <BACKFLUSH>%d</BACKFLUSH>',
                [Integer(AValue)]));
          end
        else if (AField = TRANS_CODE_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <TRANS_CODE_ID>%.0f</TRANS_CODE_ID>',
            [DtoF(AValue)]))
        else if (AField = QUANTITY) and not VarIsStr(AValue) then
          AFileLines.Add(Format('  <QUANTITY>%.6f</QUANTITY>', [DtoF(AValue)]))
        else if (AField = FGMULTI_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <FGMULTI_ID>%.0f</FGMULTI_ID>',
            [DtoF(AValue)]))
        else if (AField = WORK_CENTER_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <WORK_CENTER_ID>%.0f</WORK_CENTER_ID>',
            [DtoF(AValue)]))
        else if (AField = STANDARD_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <STANDARD_ID>%.0f</STANDARD_ID>',
            [DtoF(AValue)]))
        else if (AField = DAY_PART_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <DAY_PART_ID>%.0f</DAY_PART_ID>',
            [DtoF(AValue)]))
        else if (AField = XDAYPROD_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <XDAYPROD_ID>%.0f</XDAYPROD_ID>',
            [DtoF(AValue)]))
        else if AField = UPDATE_XDAYPART then
          begin
            // check if UPDATE_XDAYPART is passed as a Y/N string value
            if VarIsStr(AValue) and ((AValue = 'Y') or (AValue = 'N')) then
              AFileLines.Add(Format('  <UPDATE_XDAYPART>%d</UPDATE_XDAYPART>',
                [Integer(IQMS.Common.Boolean.YNToBool(AValue))]))
            else
              AFileLines.Add(Format('  <UPDATE_XDAYPART>%d</UPDATE_XDAYPART>',
                [Integer(AValue)]));
          end
        else if (AField = TRANS_DATE) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <TRANS_DATE>%.6f</TRANS_DATE>',
            [DtoF(AValue)]))
        else if (AField = NEW_PARENT_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <NEW_PARENT_ID>%.0f</NEW_PARENT_ID>',
            [DtoF(AValue)]))
        else if (AField = DISPO_METHOD) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <DISPO_METHOD>%.0f</DISPO_METHOD>',
            [DtoF(AValue)]))
        else if (AField = ILLUM_PART_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <ILLUM_PART_ID>%.0f</ILLUM_PART_ID>',
            [DtoF(AValue)]))
        else if AField = DISPO_DUPLICATES then
          begin
            // check if DISPO_DUPLICATES is passed as a Y/N string value
            if VarIsStr(AValue) and ((AValue = 'Y') or (AValue = 'N')) then
              AFileLines.Add(Format('  <DISPO_DUPLICATES>%d</DISPO_DUPLICATES>',
                [Integer(IQMS.Common.Boolean.YNToBool(AValue))]))
            else
              AFileLines.Add(Format('  <DISPO_DUPLICATES>%d</DISPO_DUPLICATES>',
                [Integer(AValue)]));
          end
        else if (AField = USER_NAME) and VarIsStr(AValue) then
          AFileLines.Add(Format('  <USER_NAME>%s</USER_NAME>', [AValue]))
        else if (AField = EPLANT_ID) and not VarIsStr(AValue) and
          (DtoF(AValue) > 0) then
          AFileLines.Add(Format('  <EPLANT_ID>%.0f</EPLANT_ID>',
            [DtoF(AValue)]));

        // increment the counter used for looping
        Inc(I, 2);

      end;

    // end the XML file main tag
    AFileLines.Add('</PACKET>');

    // save the file
    AFileLines.SaveToFile(AFileName);

  finally
    // done processing, free the TStringList
    if Assigned(AFileLines) then
      AFileLines.Free;
  end;
end;

procedure MakeSerialFile(const ADirectory, ASerial: String;
  const ABackflush: Boolean; const ATransCodeID: Real);
begin
  // This is a simple version of the primary MakeSerialFile method.
  // Pass basic parameters to MakeSerialFile() above
  MakeSerialFile(ADirectory, ASerial,
    [BACKFLUSH, IQMS.Common.Boolean.BoolToYN(ABackflush),
    TRANS_CODE_ID, ATransCodeID]);
end;

procedure MakeSerialFile(const ADirectory: String;
  const ASerialList: TStringList; const ABackflush: Boolean;
  const ATransCodeID: Real);
var
  I: Integer;
begin
  // passes basic parameters for a list of serial numbers to MakeSerialFile() above
  if not Assigned(ASerialList) or (ASerialList.Count = 0) then
    Exit;
  for I := 0 to ASerialList.Count - 1 do
    MakeSerialFile(ADirectory, ASerialList.Strings[I], ABackflush,
      ATransCodeID);
end;

function ValidSerialNumber(const ASerial: String): Boolean;
var
  S: String;
  R: Real;
begin
  // Returns TRUE if the serial number is a valid serial number
  S := ASerial;
  Result := IQMS.Common.Numbers.IsStringValidFloat(ASerial, R);
  if not Result then
    Exit;
end;

function IsDispoServerActive(var ALastError: String): Boolean;
var
  ADispoServer: OLEVariant;
  I: Integer;
  b1, b2: Boolean;
begin
  // Returns TRUE if disposvr.exe is running as a COM server for the
  // calling (Client) application.
  // NOTE:  I did consider checking to see if it is running in the processes,
  // but we need a COM connection in order to retrieve error Winapi.Messages.
  // Still, as long as it is running in the processes, it should be
  // fine because it will still be processing serial files.
  // The function IQMS.Common.FileUtils.IsProcessRunning could be called in addition
  // to this method, if retrieving Winapi.Messages back is not critical.

  Result := FALSE;
  ALastError := '';

  Result := IQMS.Common.FileUtils.IsProcessRunning('DISPOSVR.EXE');

  if not Result then
    try
      if Assigned(IQComSrvList) and (IQComSrvList.Count > 0) then
        try
          // get the current values
          b1 := IQMS.Common.PanelMsg.PanelMesgVisible;
          b2 := IQComSrvList.HidePleaseWaitMessage;

          IQMS.Common.PanelMsg.PanelMesgVisible := FALSE; // no, don't show it
          IQComSrvList.HidePleaseWaitMessage := TRUE; // yes, hide it!

          I := IQComSrvList.ServerByName('DISPOSVR', 'IQShell');
          if I < 0 then
            Exit;
          ADispoServer := IQComSrvList.List[I].Server.OleServer;
          Result := ADispoServer.IsActive;

          if Result then
            ALastError := ADispoServer.LastError;

        finally
          // restore original values
          IQMS.Common.PanelMsg.PanelMesgVisible := b1;
          IQComSrvList.HidePleaseWaitMessage := b2;
        end;
    except // suppress! We just want to know if it's active
      Result := FALSE;
    end;
end;

end.
