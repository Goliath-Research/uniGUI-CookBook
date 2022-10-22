unit IQMS.WebVcl.RepDefVersions;

interface

uses
  Classes,
  StdCtrls, uniComboBox,
  IQMS.Common.UCRPE32,
  IQMS.Common.PrintDialogsShare;

  procedure AssignCRWPrinter( var Crpe:TCrpe; var CRDotNetObject:Variant; APrinterName:string );
  procedure AssignExportType( var Crpe:TCrpe; var CRDotNetObject:Variant; var CrpeExportType:TCrExportType; var DNetExportType:TExportOptions );

  procedure AssignPrintOptionCollated( var Crpe:TCrpe; var CRDotNetObject:Variant; ACollated:boolean );
  procedure AssignPrintOptionNumCopies( var Crpe:TCrpe; var CRDotNetObject:Variant; ANumCopies:Integer );
  procedure AssignPrintOptionPrintRange( var Crpe:TCrpe; var CRDotNetObject:Variant; APageStart, APageStop: Integer );

  procedure AssignTargetFileType( var Crpe:TCrpe; var CRDotNetObject:Variant; AComboBox: TUniComboBox );
  procedure AssignTargetFileTypeEx( var Crpe:TCrpe; var CRDotNetObject:Variant; AItemIndex: Integer );
  procedure AppendSelectionFormula( var ACrpe:TCrpe; var CRDotNetObject:Variant; List2:TStringList );
  procedure CheckApplyVerifyDatabase( var Crpe:TCrpe; var CRDotNetObject:Variant );
  procedure CheckConfigureDNetRpt( var CRDotNetObject:Variant );
  procedure CheckCreateDNetCOM( var CRDotNetObject:Variant );
  procedure CheckCreateReportObject( var Crpe:TCrpe; var CRDotNetObject:Variant; AOwner:TComponent );
  procedure CheckDisableFPUExceptions( var CW:Word );
  function CheckEnsureFormulaIndexExists( var Crpe:TCrpe; CRDotNetObject:Variant; AFormulaName:string ):Integer;
  procedure CheckFreeCRDotNetObject( var CRDotNetObject: Variant );
  procedure CheckFreeCRPEObject( var Crpe:TCrpe );
  procedure CheckFreeNonToWindowOutputCrpe( var Crpe:TCrpe );
  procedure CheckRestoreFPU( CW:Word );
  procedure CheckCrpeSuppressProgressDialog( var Crpe:TCrpe );
  procedure CheckShowDNetForm( var CRDotNetObject:Variant );
  procedure CheckSuppressCrpePrompts( var Crpe:TCrpe );
  procedure ClearCrpeReportName( var Crpe:TCrpe );
  procedure ClearCrpeFormulas( var Crpe:TCrpe );
  procedure CheckSelectionFormulaAgainstReportTables( Crpe:TCrpe; CRDotNetObject:Variant; AList:TStrings );
  procedure DisableDNetParamPrompts( var CRDotNetObject:Variant; Value:Boolean );
  procedure DoExecuteReport( Crpe:TCrpe; CRDotNetObject:Variant );
  function GetCRVersion: string;
  function GetDefaultFileTypeExt( CrpeExportType:TCrExportType; DNetExportType:TExportOptions): string; overload;
  function GetDefaultFileTypeExt( Crpe:TCrpe; CRDotNetObject:Variant ):string; overload;
  function GetExportFilePath( Crpe:TCrpe; CRDotNetObject:Variant ):string;

  function GetFormulasIndexOf( Crpe:TCrpe; CRDotNetObject:Variant; FormulaName:string ): Integer;
  function GetParamNameAtIndex( Crpe:TCrpe; CRDotNetObject:Variant; I:Integer ): String;
  function GetParamsCount( Crpe:TCrpe; CRDotNetObject:Variant ): Integer;
  function GetReportPathName( Crpe:TCrpe; CRDotNetObject:Variant ): string;
  function GetReportPathName2( Crpe:TCrpe; CRDotNetObject:Variant; AReportName:String ): string;
  function GetSelectionFormulaText( ACrpe:TCrpe; CRDotNetObject:Variant ): string;
  procedure IntializeCrpe(var Crpe:TCrpe);
  function IsCRDotVersion: Boolean;
  function ParamExists( var Crpe:TCrpe;  var CRDotNetObject:Variant;  ParamName:string ): Boolean;
  procedure SetDestinationMSWord( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string  );
  procedure SetDestinationToEmail(   var Crpe:TCrpe; var CRDotNetObject:Variant; cboxFileType:TUniComboBox; DestFileNamePath:string );
  procedure SetDestinationToFax(     var Crpe:TCrpe; var CRDotNetObject:Variant;                         DestFileNamePath:string );
  procedure SetDestinationToFile(    var Crpe:TCrpe; var CRDotNetObject:Variant; cboxFileType:TUniComboBox; DestFileNamePath:string );
  procedure SetDestinationToFileEx(  var Crpe:TCrpe;  var CRDotNetObject:Variant; DestFileNamePath:string );
  procedure SetDestinationToFileExA( var Crpe:TCrpe;  var CRDotNetObject:Variant; DestFileNamePath:string; AFileType: Integer );
  procedure SetDestinationToFile_Web( var Crpe:TCrpe; var CRDotNetObject:Variant; ADestFileNamePath :string );
  procedure SetDestinationToPrinter( var Crpe:TCrpe; var CRDotNetObject:Variant );
  procedure SetDestinationToScreen(  var Crpe:TCrpe; var CRDotNetObject:Variant );
  procedure SetDestinationToEditableRTF( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string  );
  procedure SetDestinationToPDF(var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string);
  procedure SetFormulaText( var Crpe              :TCrpe;
                            var CRDotNetObject    :Variant;
                                IndexOfFormula    :Integer = 0;
                           //     DNetNameOfFormula :string  = '';
                                Value             :string  = '' );
  procedure SetOutput( var Crpe:TCrpe; var CRDotNetObject:Variant; AOutput:Integer );
  procedure SetParam( var Crpe :TCrpe; var CRDotNetObject:Variant; ParamName, Value:string );
  procedure SetReportConnection( var Crpe:TCrpe; var CRDotNetObject:Variant; ServerName, UID, Password: string; AEplantID:Real = 0 );
  procedure SetReportName( var Crpe:TCrpe; var CRDotNetObject:Variant; ReportName:string );
  procedure SetReportTitle( var Crpe:TCrpe; var CRDotNetObject:Variant; ReportTitle:string );
  procedure SetSelectionFormula( var Crpe:TCrpe; var CRDotNetObject:Variant; ACurrentLinkExpression:string );

  procedure SetUserNameEplantFormulaValuesMain( var Crpe:TCrpe; var CRDotNetObject:Variant );
  procedure SetUserNameEplantFormulaValuesDNet( var CRDotNetObject:Variant );   {use SetUserNameEplantFormulaValuesMain instead}
  procedure SetUserNameEplantFormulaValuesCrpe( var Crpe:TCrpe );              {use SetUserNameEplantFormulaValuesMain instead}

  function  ValidStoredProcedureParams( Crpe:TCrpe; CRDotNetObject:Variant ): Boolean;
  procedure AssertWebCrpeParamPromptsNotExist( ACrpe:TCrpe; AMsg:string );
  procedure SetReportTextObjectValue( var ACRDotNetObject:Variant; ATextObjectName, ATextObjectValue:String );
  function IsAnythingPrinted( Crpe:TCrpe; CRDotNetObject:Variant ): Boolean;

Const
 // CRNative        : Char    = 9;                          // Native = WIN32
 // CRManaged       : Char    = 11;                         // Managed = .NET
  DOTNETDLL       : String  = 'iqrep';                      // Do Not Localize
  DOTNETCRCOMTYPE : String  = 'DNetRepdef.TFrmDNetRepDef';  // Do Not Localize

var
  CRDotNetVersion : String;  // User's version - see GetCRVersion below.

implementation

uses
  SysUtils,
  IQMS.Common.ResStrings,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Numbers,
  Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.RegFrm,
  Variants,
  Forms,
  Printers,
  Windows;


//
// Initialize CRVersion variable above.  Caller = procedure CheckCreateDNetCOM
//
function GetCRVersion:string;
begin
  // Default to cr9 for Windows NT 4.0, Windows Me, Windows 98 or Windows 95.
  // Note: Win2000 versions less than sp4 still get by this
  //      even though CR 11 .Net requires windows 2000 sp4 or greater
  if ( Win32MajorVersion = 4 ) then
  begin
    Result:= 'N';
    Exit;
  end;

  // Check Global Setting
  Result := SelectValueAsString( 'select upper(nvl(CRW_USE_DOTNET, ''N'')) from params' );

  if ( Result = 'N' ) then // System Parameters, Utilize .net is NOT checked
    Exit;

  case IQRegUtilizeDNETIntegerRead of   {IQMS.Common.RegFrm.pas}
    // 0: Exit;          // This always results in 'Y', so just use global assignment
    1: Result:= 'N';
    //2: Result:= 'Y';   // This always results in 'Y', so just use global assignment
  end;
end;


function IsCRDotVersion: Boolean;
begin
  Result := true;
{
  if not ( ( CRDotNetVersion = 'Y' ) or ( CRDotNetVersion = 'N' ) ) then
    CRDotNetVersion:= GetCRVersion;

  Result:= (CRDotNetVersion = 'Y')
}  
end;


procedure AssignCRWPrinter( var Crpe:TCrpe; var CRDotNetObject:Variant; APrinterName:string );
var
  APaperSource: String;
  ADuplex, AOrientation: Integer;
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Printer.Name := APrinterName;
      {Feb 15, 2002. Take PaperSource out and call GetCurrent instead}
      Crpe.Printer.PreserveRPTSettings:= [ prOrientation, prPaperSize ];
      Crpe.Printer.GetCurrent( TRUE ); { TRUE = PreserveDevMode}
    end

  else // CR.NET Version
  *)
  begin

    GetSelectedPaperBin( APaperSource ); // get which tray to pull paper from
    GetSelectedDuplexMode( ADuplex );    // print front and back of page if printer supports it

    AOrientation:= -1; // tell .net engine we dont have a valid value so it doesnt override setting
    if Printer.Orientation in [poPortrait, poLandscape] then
      AOrientation:= Integer(Printer.Orientation);

    CRDotNetObject.SetPrintOptions( APrinterName,
                                    APaperSource,
                                    AOrientation, // 0 = portrait, 1 = landscape
                                    ADuplex );
  end;
end;


procedure AppendSelectionFormula( var ACrpe:TCrpe; var CRDotNetObject:Variant; List2:TStringList );
begin
  (* if not IsCRDotVersion then
    begin
      //if report contains some selection criteria - append AND
      if ACrpe.Selection.Formula.Count > 0 then
         ACrpe.Selection.Formula.Text:= Format( '( %s ) and', [ ACrpe.Selection.Formula.Text ]);

      //Add to selection criteria List1 stored in the report user defined criteria List2
      ACrpe.Selection.Formula.Text:= Format( '%s ( %s )', [ ACrpe.Selection.Formula.Text, List2.Text ]);
    end

  else  // CR.NET Version
  *)
    // This .NET method should have been named "APPEND"SelectionFormula - sorry, JS
    CRDotNetObject.ApplySelectionFormula( List2.Text );
end;


procedure AssignExportType( var Crpe:TCrpe; var CRDotNetObject:Variant; var CrpeExportType:TCrExportType; var DNetExportType:TExportOptions );
begin
  (* if not IsCRDotVersion then
    CrpeExportType:= Crpe.ExportOptions.FileType

  else // CR.NET Version
  *)
    DNetExportType:= CRDotNetObject.SelectedExportFormatType;
end;


procedure AssignPrintOptionCollated( var Crpe:TCrpe; var CRDotNetObject:Variant; ACollated:boolean );
begin
  (* if not IsCRDotVersion then
    Crpe.PrintOptions.Collation:= ACollated

  else  // CR.NET Version
  *)
    CRDotNetObject.poCollated:= ACollated;
end;


procedure AssignPrintOptionNumCopies( var Crpe:TCrpe; var CRDotNetObject:Variant; ANumCopies:Integer );
begin
  (* if not IsCRDotVersion then
    Crpe.PrintOptions.Copies:= ANumCopies

  else  // CR.NET Version
  *)
    CRDotNetObject.poCopies:= ANumCopies;
end;

procedure AssignPrintOptionPrintRange( var Crpe:TCrpe; var CRDotNetObject:Variant; APageStart, APageStop: Integer );
begin
  (* if not IsCRDotVersion then
     begin
       Crpe.PrintOptions.StartPage:= APageStart;
       Crpe.PrintOptions.StopPage := APageStop;
     end

  else  // CR.NET Version
  *)
     begin
       CRDotNetObject.poStartPage:= APageStart;
       CRDotNetObject.poEndPage := APageStop;
     end;
end;


procedure AssignTargetFileType( var Crpe:TCrpe; var CRDotNetObject:Variant; AComboBox: TUniComboBox );
begin
  AssignTargetFileTypeEx( Crpe, CRDotNetObject, AComboBox.ItemIndex );
  //  if not IsCRDotVersion then
  //     begin
  //        case  of
  //          0: Crpe.ExportOptions.FileType:= RichText;        // RichTextFormat;
  //          1: Crpe.ExportOptions.FileType:= SeparatedValues; // CharacterSeparated;
  //          2: Crpe.ExportOptions.FileType:= TextFormat;      // Ascii;
  //          3: Crpe.ExportOptions.FileType:= AdobeAcrobatPDF;
  //          4: Crpe.ExportOptions.FileType:= MSExcel;
  //        else
  //          Crpe.ExportOptions.FileType:= RichText;           // RichTextFormat;
  //        end;
  //     end
  // 
  //   else // CR.NET Version
  //     begin
  //        case AComboBox.ItemIndex of
  //          0: CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;     // EditableRichTextFormat;
  //          1: CRDotNetObject.SelectedExportFormatType:= dtSeparatedValues; // CharacterSeparated;
  //          2: CRDotNetObject.SelectedExportFormatType:= dtTextFormat;      // Ascii;
  //          3: CRDotNetObject.SelectedExportFormatType:= dtAdobeAcrobatPDF;
  //          4: CRDotNetObject.SelectedExportFormatType:= dtExcel;
  //        else
  //          CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;           // EditableRichTextFormat;
  //        end;
  //     end;
end;

procedure AssignTargetFileTypeEx( var Crpe:TCrpe; var CRDotNetObject:Variant; AItemIndex: Integer );
begin
    (* if not IsCRDotVersion then
      begin
         case AFileType of
           0: Crpe.ExportOptions.FileType:= RichText;        // RichTextFormat;
           1: Crpe.ExportOptions.FileType:= SeparatedValues; // CharacterSeparated;
           2: Crpe.ExportOptions.FileType:= TextFormat;      // Ascii;
           3: Crpe.ExportOptions.FileType:= AdobeAcrobatPDF;
           4: Crpe.ExportOptions.FileType:= MSExcel;
           5: Crpe.ExportOptions.FileType:= HTML40;
         else
           Crpe.ExportOptions.FileType:= RichText;           // RichTextFormat;
         end;
      end

    else // CR.NET Version
    *)

    CRDotNetObject.SelectedExportFormatType := ExportOptionOfItemIndex(AItemIndex)

(*      begin
         case AItemIndex of
           0: CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;     // EditableRichTextFormat;
           1: CRDotNetObject.SelectedExportFormatType:= dtRichText;
           2: CRDotNetObject.SelectedExportFormatType:= dtSeparatedValues; // CharacterSeparated;
           3: CRDotNetObject.SelectedExportFormatType:= dtTextFormat;      // Ascii;
           4: CRDotNetObject.SelectedExportFormatType:= dtAdobeAcrobatPDF;
           5: CRDotNetObject.SelectedExportFormatType:= dtExcel;
           6: CRDotNetObject.SelectedExportFormatType:= dtHtml40;
           7: CRDotNetObject.SelectedExportFormatType:= dtExcelRecord;
         else
           CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;           // EditableRichTextFormat;
         end;
      end;
*)
end;


procedure CheckApplyVerifyDatabase( var Crpe:TCrpe; var CRDotNetObject:Variant );
var
  I:Integer;
begin
  (* if not IsCRDotVersion then
    begin
        // Crpe.Subreports.Retrieve;
        for I:= 0 to (Crpe.Subreports.Count - 1) do
        begin
          // Crpe.Subreports[ I ];
          // Crpe.Tables.FieldMapping:= fmPrompt;  {defaut - fmAuto. Setting to fmPrompt will cause VerifyDataBase during Execute}

          Crpe.Subreports[ I ];
          Crpe.Tables.FieldMapping:= fmAuto;
          Crpe.Tables.Verify;
        end;
    end

  else  // CR.NET Version
  *)
    CRDotNetObject.ApplyVerifyDatabase;
end;


procedure CheckConfigureDNetRpt( var CRDotNetObject:Variant );
begin
  if IsCRDotVersion then
    CRDotNetObject.ConfigureReport;
end;


procedure CheckCreateDNetCOM( var CRDotNetObject:Variant );
begin
  if IsCRDotVersion then
    CreateDNetCOM( CRDotNetObject, DOTNETDLL, DOTNETCRCOMTYPE );
end;


procedure IntializeCrpe(var Crpe:TCrpe);
begin
  (* with Crpe do
  begin
    {Non-default settings from a drag-n-dropped TCrpe design time component}
    Connect.Propagate              := True;
    ExportOptions.Excel.Constant   := 9.000000000000000000;
    ExportOptions.Excel.Area       := 'D';
    WindowState                    := wsMaximized;
    WindowButtonBar.AllowDrillDown := True;
    WindowButtonBar.GroupTree      := True;
    WindowButtonBar.SearchBtn      := True;
  end;
  *)
end;


procedure CheckCreateReportObject( var Crpe:TCrpe; var CRDotNetObject:Variant; AOwner: TComponent );
begin
  (* if not IsCRDotVersion then
  begin
    Crpe:= TCrpe.Create( AOwner );
    IntializeCrpe( Crpe );
  end
  else
  *)
    CheckCreateDNetCOM( CRDotNetObject );
end;


procedure ClearCrpeReportName( var Crpe:TCrpe );
begin
  (* if not IsCRDotVersion then
    with Crpe do ReportName:= '';
  *)
end;


procedure ClearCrpeFormulas( var Crpe:TCrpe );
begin
  (* if not IsCRDotVersion then
    Crpe.Formulas.Clear;
  *)
end;


procedure CheckRestoreFPU( CW:Word );
begin
  // Restore original FPU State. See CheckDisableFPUExceptions
  if IsCRDotVersion then
    RestoreFPU( CW );
end;


procedure CheckDisableFPUExceptions( var CW:Word );
begin
 { If accessing .NET via com call we need to disable FPU exceptions b/c win32 attempts to track
  the address in memory of a .NET object. }
  if IsCRDotVersion then  // CR.NET Version
    DisableFPUExceptions( CW );
end;


procedure DisableDNetParamPrompts( var CRDotNetObject:Variant; Value:Boolean );
begin
  if IsCRDotVersion then
    CRDotNetObject.DisablePrompts:= Value;
end;


procedure AssertWebCrpeParamPromptsNotExist( ACrpe:TCrpe; AMsg:string );
    // currently only supported non .net version
    function RequiresPromptDialog: Boolean;
    var
      i:integer;
    begin
      Result:= False;

      (* if not IsCRDotVersion then
        with ACrpe.Subreports[0] do // this is the main report, meaning all params will be enumerated, even those from subreports
          for i:= 0 to ParamFields.Count - 1 do
          try
            if ParamFields[i].NeedsCurrentValue then
            begin
              Result:= TRUE;
              EXIT;
            end;
          except on x:Exception do
            raise Exception.CreateFmt('Error accessing report parameter #%d. %s', [i, x.Message]);
          end;
      *)
    end;
begin
  if RequiresPromptDialog then raise Exception.Create( AMsg );
end;


function CheckEnsureFormulaIndexExists( var Crpe:TCrpe; CRDotNetObject:Variant; AFormulaName:string ):Integer;
begin
  (* if not IsCRDotVersion then
    begin
      Result:= Crpe.Formulas.IndexOf( AFormulaName );
      if Result = -1 then                  {Should not happen if formula in the report}
         Result:= Crpe.Formulas.Names.Add( UpperCase( AFormulaName ));
    end

  else   // CR.NET Version
  *)
    Result:= CRDotNetObject.IndexOfFormulaField( AFormulaName );
end;


procedure CheckFreeCRDotNetObject( var CRDotNetObject: Variant );
begin
  if IsCRDotVersion then  // CR.NET Version
    FreeDNetObject( CRDotNetObject );
end;

procedure CheckFreeCRPEObject( var Crpe:TCrpe );
begin
  (* if not IsCRDotVersion then
    if Assigned(Crpe) then
      Crpe.Free;
  *)
end;


procedure CheckFreeNonToWindowOutputCrpe( var Crpe:TCrpe );
begin
  (* if not IsCRDotVersion then
    if Crpe.Output <> toWindow then
      begin
         Crpe.Free;
         Crpe:= NIL;
      end;
   *)
end;


procedure CheckCrpeSuppressProgressDialog( var Crpe:TCrpe );
begin
  (* if not IsCRDotVersion then
    Crpe.ProgressDialog:= not IsConsole;
  *)
end;


procedure CheckSuppressCrpePrompts( var Crpe:TCrpe );
var
  T: TStrings;
  i: Integer;
begin
  (* if not IsCRDotVersion then
    begin
      T := Crpe.ParamFields.Names;
      for i:=0 to T.count-1 do
        Crpe.ParamByName(T[i],'').ShowDialog := False;
    end;
  *)
end;


{ local procedure.  please call DoCheckSelectionFormulaAgainstReportTables }
procedure CrpeCheckSelectionFormulaAgainstReportTables( ACrpe: TCrpe; AList:TStrings );
(* var
  I: Integer;
  S: string;
  ATableName : string;
  AExpression: string;

    function ExtractTableName( AText: string ): string;
    begin
      AText:= Copy( Trim(UpperCase( AText)), Pos('{', AText ) + 1, 255 );
      Result:= Copy( AText, 1, Pos('.', AText ) - 1);
    end;

    function LoadListOfAliases: string;
    var
      I: Integer;
      S: string;
    begin
      S:= '';
      for I:= 0 to ACrpe.Tables.Count - 1 do
      begin
        if S = '' then
           S:= ACrpe.Tables[ I ].AliasName
        else
           S:= Format('%s, %s', [S, ACrpe.Tables[ I ].AliasName ]);
      end;
      Result:= S;
    end;
*)
begin
  (* if (AList.Count > 0) and (ACrpe.Tables.Count > 0) then
  begin
     ACrpe.Subreports[ 0 ];

     for I:= 0 to AList.Count - 1 do
     begin
       AExpression:= Trim( AList[ I ]);                               // "( {standard.mfgno = '123'} and {somethingelse.somefield = '456'} ) and ...)'
       while Pos( '{', AExpression ) > 0 do
       begin
         // Determine the table name in the selection criteria
         S:= Copy( AExpression, Pos('{', AExpression), 255 );         // "{standard.mfgno = '123'} and {somethingelse.somefield = '456'} ) and ...)"
         ATableName := ExtractTableName( Copy( S, 1, Pos('}', S )));  // "{standard.mfgno = '123'}"

         {'Unable to identify table name referenced in the selection criteria ''%s'''}
         IQAssert( ATableName > '', Format( IQMS.Common.ResStrings.cTXT0000300, [ S ]));

         // 'Unable to match table ''%s'' referenced in the selection criteria ''%s'' against table names %s used in the report ''%s'''
         IQAssert( ACrpe.Tables.IndexOf( ATableName ) > -1, Format( IQMS.Common.ResStrings.cTXT0000301, [ ATableName, AList[ I ], LoadListOfAliases, ACrpe.ReportName ]));

         // Prepapre for the next iteration
         AExpression:= Copy( AExpression, Pos('}', AExpression) + 1, 255);
       end;
     end;
  end;
  *)
end;


procedure CheckSelectionFormulaAgainstReportTables( Crpe: TCrpe; CRDotNetObject:Variant; AList:TStrings );
begin
  (* if not IsCRDotVersion then
     CrpeCheckSelectionFormulaAgainstReportTables( Crpe, AList )

  else // CR.NET Version
  *)
    CRDotNetObject.CheckSelectionFormulaAgainstReportTables( AList.Text );
end;



procedure DoExecuteReport( Crpe:TCrpe; CRDotNetObject:Variant );
begin
  (* if not IsCRDotVersion then
     Crpe.Execute

  else // CR.NET Version
  *)
    CRDotNetObject.ExecuteReport;
end;


function GetDefaultFileTypeExt( CrpeExportType:TCrExportType; DNetExportType:TExportOptions): string;
begin
  (* if not IsCRDotVersion then
      begin
         case CrpeExportType of
            RichText       : Result:= '.doc';    // RichTextFormat;
            SeparatedValues: Result:= '.txt';    // CharacterSeparated;
            TextFormat     : Result:= '.txt';    // Ascii;
            AdobeAcrobatPDF: Result:= '.pdf';
            MSExcel        : Result:= '.xls';
            HTML40         : Result:= '.htm';
         else
            Result:= '.doc';
         end;
      end

  else // CR.NET Version
  *)
  Result := ExportFileTypeExt[DNetExportType];
  if Result = '' then
    Result := ExportFileTypeExt[dtWordForWindows];
(*
      begin
         case DNetExportType of
            dtEditableRTF    : Result:= '.doc';    // RichTextFormat;
            dtRichText       : Result:= '.rtf';
            dtSeparatedValues: Result:= '.txt';    // CharacterSeparated;
            dtTextFormat     : Result:= '.txt';    // Ascii;
            dtAdobeAcrobatPDF: Result:= '.pdf';
            dtExcel          : Result:= '.xls';
            dtExcelRecord    : Result:= '.xls';
            dtHTML40         : Result:= '.htm';
            dtHTML32         : Result:= '.htm';
         else
            Result:= '.doc';
         end;
      end;
*)
end;


function GetDefaultFileTypeExt( Crpe:TCrpe; CRDotNetObject:Variant ):string;
begin
  (* if not IsCRDotVersion then
      begin
         case Crpe.ExportOptions.FileType of
            RichText       : Result:= '.doc';    // RichTextFormat;
            SeparatedValues: Result:= '.txt';    // CharacterSeparated;
            TextFormat     : Result:= '.txt';    // Ascii;
            AdobeAcrobatPDF: Result:= '.pdf';
            MSExcel        : Result:= '.xls';
            HTML40         : Result:= '.htm';
            HTML32         : Result:= '.htm';
         else
            Result:= '.doc';
         end;
      end

  else // CR.NET Version
  *)
  Result := ExportFileTypeExt[TExportOptions(CRDotNetObject.SelectedExportFormatType)];
  if Result = '' then
    Result := ExportFileTypeExt[dtWordForWindows];
(*
      begin
         case TExportOptions( CRDotNetObject.SelectedExportFormatType ) of
            dtEditableRTF    : Result:= '.doc';    // RichTextFormat;
            dtRichText       : Result:= '.rtf';
            dtSeparatedValues: Result:= '.txt';    // CharacterSeparated;
            dtTextFormat     : Result:= '.txt';    // Ascii;
            dtAdobeAcrobatPDF: Result:= '.pdf';
            dtExcel          : Result:= '.xls';
            dtExcelRecord    : Result:= '.xls';
            dtHTML40         : Result:= '.htm';
            dtHTML32         : Result:= '.htm';
         else
            Result:= '.doc';
         end;
      end;
*)
end;


function GetExportFilePath( Crpe:TCrpe; CRDotNetObject:Variant ):string;
begin
  (* if not IsCRDotVersion then
    Result:= Crpe.ExportOptions.FileName

  else // CR.NET Version
  *)
    Result:= CRDotNetObject.ExportFilePath;
end;


function GetFormulasIndexOf( Crpe:TCrpe; CRDotNetObject:Variant; FormulaName:string ): Integer;
begin
  (* if not IsCRDotVersion then
    Result:= Crpe.Formulas.IndexOf( FormulaName )

  else // CR.NET Version
  *)
    Result:= CRDotNetObject.IndexOfFormulaField( FormulaName );
end;


function GetParamNameAtIndex( Crpe:TCrpe; CRDotNetObject:Variant; I:Integer ): String;
begin
  (* if not IsCRDotVersion then
    Result:= Crpe.ParamFields[ i ].Name

  else // CR.NET Version
  *)  
    Result:= CRDotNetObject.GetParamNameAtIndex( i );
end;


function GetParamsCount( Crpe:TCrpe; CRDotNetObject:Variant ): Integer;
begin
  (* if not IsCRDotVersion then
    Result:= Crpe.ParamFields.Count

  else // CR.NET Version
  *)
    Result:= CRDotNetObject.GetParamsCount;
end;

function GetReportPathName2( Crpe:TCrpe; CRDotNetObject:Variant; AReportName:String ): string;
begin
  Result := AReportName;
  if Result = '' then
    Result := GetReportPathName(Crpe, CRDotNetObject);

end;


function GetReportPathName( Crpe:TCrpe; CRDotNetObject:Variant ): string;
begin
  (* if not IsCRDotVersion then
    Result:= Crpe.ReportName

  else  // CR.NET Version
  *)  
    Result:= CRDotNetObject.ReportPath;
end;


function GetSelectionFormulaText( ACrpe:TCrpe; CRDotNetObject:Variant ): string;
begin
  (* if not IsCRDotVersion then
    Result:= ACrpe.Selection.Formula.Text

  else  // CR.NET Version
  *)  
    Result:= CRDotNetObject.SelectionFormula;
end;


function ParamExists( var Crpe:TCrpe;  var  CRDotNetObject:Variant; ParamName:string ): Boolean;
var
  T: TStrings;
  I: Integer;
begin
  Result:= FALSE;

  (* if not IsCRDotVersion then
  begin
    T:= Crpe.ParamFields.Names;

    for I:= 0 to T.count - 1 do
      if T[ I ] = ParamName then
      begin
        Result := TRUE;
        BREAK;
      end;
  end

  else // CR.NET Version
  *)  
    if CRDotNetObject.ParamNameExists( ParamName ) then
      Result:= TRUE;
end;


procedure SetDestinationMSWord( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string  );
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Output                    := toExport;
      Crpe.ExportOptions.Destination := toFile;
      Crpe.ExportOptions.FileType    := MSWord;
      Crpe.ExportOptions.FileName    := DestFileNamePath;
    end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination             := dtToExport;
      CRDotNetObject.SelectedExportFormatType:= dtWordForWindows;
      CRDotNetObject.ExportFilePath          := DestFileNamePath;
    end;
end;


procedure SetDestinationToEmail( var Crpe:TCrpe; var CRDotNetObject:Variant; cboxFileType:TUniComboBox; DestFileNamePath:string  );
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Output                    := toExport;
      Crpe.ExportOptions.Destination := toFile;
      AssignTargetFileType( Crpe, CRDotNetObject, cboxFileType );
      Crpe.ExportOptions.FileName    := DestFileNamePath
    end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination             := dtToExport;
      AssignTargetFileType( Crpe, CRDotNetObject, cboxFileType );
      CRDotNetObject.ExportFilePath          := DestFileNamePath;
    end;
end;


procedure SetDestinationToFax( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string  );
begin
  (* if not IsCRDotVersion then
     with Crpe do
     begin
        Output                   := toExport;
        ExportOptions.Destination:= toFile;
        ExportOptions.FileType   := AdobeAcrobatPDF; // RichTextFormat; Aug-15-03
        ExportOptions.FileName   := DestFileNamePath;
     end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination             := dtToExport;
      CRDotNetObject.SelectedExportFormatType:= dtAdobeAcrobatPDF;
      CRDotNetObject.ExportFilePath          := DestFileNamePath;
    end;
end;

procedure SetDestinationToPDF(var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string);
begin
  CRDotNetObject.Destination             := dtToExport;
  CRDotNetObject.SelectedExportFormatType:= dtAdobeAcrobatPDF;
  CRDotNetObject.ExportFilePath          := ChangeFileExt(DestFileNamePath, '.pdf');
end;

procedure SetDestinationToFile( var Crpe:TCrpe; var CRDotNetObject:Variant; cboxFileType:TUniComboBox; DestFileNamePath:string  );
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Output                    := toExport;
      Crpe.ExportOptions.Destination := toFile;
      AssignTargetFileType( Crpe, CRDotNetObject, cboxFileType );
      Crpe.ExportOptions.FileName    := DestFileNamePath;
    end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination      := dtToExport;
      AssignTargetFileType( Crpe, CRDotNetObject, cboxFileType );
      CRDotNetObject.ExportFilePath   := DestFileNamePath;
    end;
end;


procedure SetDestinationToFileEx( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string );
begin
  (* if not IsCRDotVersion then
  begin
      with Crpe do
        if Output = toExport then
        begin
            ExportOptions.Destination := toFile;
            ExportOptions.FileType    := RichText;
            ExportOptions.FileName    := DestFileNamePath;
        end;
  end
  else // CR.NET Version
  *)
    if CRDotNetObject.Destination = dtToExport then
    begin
       CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;
       CRDotNetObject.ExportFilePath          := DestFileNamePath;
    end;
end;

procedure SetDestinationToFileExA( var Crpe:TCrpe;  var CRDotNetObject:Variant; DestFileNamePath:string; AFileType: Integer );
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Output                    := toExport;
      Crpe.ExportOptions.Destination := toFile;
      AssignTargetFileTypeEx( Crpe, CRDotNetObject, AFileType );
      Crpe.ExportOptions.FileName    := DestFileNamePath;
    end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination      := dtToExport;
      AssignTargetFileTypeEx( Crpe, CRDotNetObject, AFileType );
      CRDotNetObject.ExportFilePath   := DestFileNamePath;   
    end;
end;


// Used in IQWebRepDef
procedure SetDestinationToFile_Web( var Crpe:TCrpe; var CRDotNetObject:Variant; ADestFileNamePath:string );
begin
  (* if not IsCRDotVersion then
  begin
    Crpe.Output                          := toExport;
    Crpe.ExportOptions.Destination       := toFile;

    {FileNameHTML must be assign by the caller and should include all path info to reports\temp subdir}
    if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.XLS' then
       Crpe.ExportOptions.FileType:= MSExcel                          // ExcelXLS is not supported in D7
    else if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.DOC' then
       Crpe.ExportOptions.FileType:= RichText                         // RichTextFormat is not supported in D7
    else
       Crpe.ExportOptions.FileType:= HTML40;                          // HTML4 is not supported in D7

    {HTML}
    Crpe.ExportOptions.HTML.SeparatePages:= FALSE;
    Crpe.ExportOptions.HTML.PageNavigator:= FALSE;

    Crpe.ExportOptions.FileName:= ADestFileNamePath;
  end

  else // CR.NET Version
  *)
  begin
    CRDotNetObject.Destination:= dtToExport;

    {FileNameHTML must be assign by the caller and should include all path info to reports\temp subdir}
    if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.XLS' then
       CRDotNetObject.SelectedExportFormatType:= dtExcel
    else if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.DOC' then
       CRDotNetObject.SelectedExportFormatType:= dtEditableRTF
    else if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.RTF' then
       CRDotNetObject.SelectedExportFormatType:= dtRichText
    else if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.PDF' then
       CRDotNetObject.SelectedExportFormatType:= dtAdobeAcrobatPDF
    else if UpperCase(ExtractFileExt( ADestFileNamePath )) = '.CSV' then
       CRDotNetObject.SelectedExportFormatType:= dtSeparatedValues

    else
       CRDotNetObject.SelectedExportFormatType:= dtHTML40;

    CRDotNetObject.ExportFilePath:= ADestFileNamePath;
  end;
end;

procedure SetDestinationToPrinter( var Crpe:TCrpe; var CRDotNetObject:Variant );
begin
  (* if not IsCRDotVersion then
    Crpe.Output:= toPrinter

  else // CR.NET Version
  *)
  CRDotNetObject.Destination:= dtToPrinter;
end;


// Warining - CR 9 doesn't support Editable RTF so we are using plain Text for CR 9
procedure SetDestinationToEditableRTF( var Crpe:TCrpe; var CRDotNetObject:Variant; DestFileNamePath:string  );
begin
  (* if not IsCRDotVersion then
    begin
      Crpe.Output                    := toExport;
      Crpe.ExportOptions.Destination := toFile;
      Crpe.ExportOptions.FileType    := TextFormat;
      Crpe.ExportOptions.FileName    := DestFileNamePath;
    end

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination             := dtToExport;
      CRDotNetObject.SelectedExportFormatType:= dtEditableRTF;//dtTextFormat;
      CRDotNetObject.ExportFilePath          := DestFileNamePath;
    end;
end;

procedure CheckShowDNetForm( var CRDotNetObject:Variant );
begin
  if {not IsCRDotVersion or} VarIsEmpty(CRDotNetObject) then //VarIsEmpty = to not Assigned
    Exit;

  if CRDotNetObject.Destination = dtToWindow then
    CRDotNetObject.Show;
end;

procedure SetDestinationToScreen( var Crpe:TCrpe; var CRDotNetObject:Variant );
begin
  (* if not IsCRDotVersion then
    Crpe.Output:= toWindow

  else // CR.NET Version
  *)
    begin
      CRDotNetObject.Destination:= dtToWindow;
      //CRDotNetObject.Show; // Moved to ChekcShowDNetForm - used after DoExecuteReport.
    end;                     // This allow the "please wait..." mesgs to appear on top

  //jason Sep-06-06 causing invalid printer issue
  //FixPortProblemWhenPrintedToScreen1stTimeFromCRW;  {Prn_Share.pas}
end;


procedure SetFormulaText( var Crpe              :TCrpe;
                          var CRDotNetObject    :Variant;
                              IndexOfFormula    :Integer = 0;
                      //        DNetNameOfFormula :string  = '';
                              Value             :string  = '' );
begin
  (* if not IsCRDotVersion then
    Crpe.Formulas[ IndexOfFormula ].Formula.Text := Value

  else  // CR.NET Version
  *)
    CRDotNetObject.AssignTextToFormulaEx( IndexOfFormula, Value );
end;


procedure SetOutput( var Crpe:TCrpe; var CRDotNetObject:Variant; AOutput:Integer );
begin
  (* if not IsCRDotVersion then
    Crpe.Output:= TCrOutput(AOutput)

  else  // CR.NET Version
  *)
    CRDotNetObject.Destination:= AOutput
end;


procedure SetParam( var Crpe:TCrpe; var CRDotNetObject:Variant; ParamName, Value:string );
begin
  (* if not IsCRDotVersion then
    Crpe.ParamByName(ParamName, '').CurrentValue := Value

  else  // CR.NET Version
  *)
    CRDotNetObject.SetDiscreteParam( ParamName, Value );
end;


procedure SetReportConnection( var Crpe:TCrpe; var CRDotNetObject:Variant; ServerName, UID, Password: string; AEplantID:Real = 0 );
begin
  (* if not IsCRDotVersion then
    begin
        with Crpe do
        begin
          Subreports[ 0 ];
          // ConnectMethod     := useConnect;
          Connect.Propagate := True;

          Connect.ServerName:= ServerName;
          Connect.Password  := Password;
          Connect.UserID    := UID;
        end;
    end

  else  // CR.NET Version
  *)
    CRDotNetObject.SetConnectInfoEx( UID, Password, ServerName, AEplantID );
end;


procedure SetReportName( var Crpe:TCrpe; var CRDotNetObject:Variant; ReportName:string );
begin
  {This sets the path + name of the report file effectively resetting all other properties}
  (* if not IsCRDotVersion then
    Crpe.ReportName:= ReportName

  else  // CR.NET Version
  *)
    CRDotNetObject.ReportPath:= ReportName;
end;


procedure SetReportTitle( var Crpe:TCrpe; var CRDotNetObject:Variant; ReportTitle:string );
begin
  {This sets the title of the report - Ex. 'Customer Invoices Report' }
  (*  if not IsCRDotVersion then
    Crpe.ReportTitle:= ReportTitle

  else  // CR.NET Version
  *)
  begin
    CRDotNetObject.ReportTitle:= ReportTitle;
  end;
end;


procedure SetSelectionFormula( var Crpe:TCrpe; var CRDotNetObject:Variant; ACurrentLinkExpression:string );
begin
  if ACurrentLinkExpression <> '' then
  begin
      (* if not IsCRDotVersion then
        begin
          Crpe.Selection.Clear;
          Crpe.Selection.Formula.Add( ACurrentLinkExpression );
        end

      else  // CR.NET Version
      *)
        CRDotNetObject.SelectionFormula:= ACurrentLinkExpression;
  end;
end;


procedure SetUserNameEplantFormulaValuesMain( var Crpe:TCrpe; var CRDotNetObject:Variant );
begin
  {This sets the title of the report - Ex. 'Customer Invoices Report' }
  (* if not IsCRDotVersion then
    SetUserNameEplantFormulaValuesCrpe( Crpe )

  else  // CR.NET Version
  *)
    SetUserNameEplantFormulaValuesDNet( CRDotNetObject );
end;


procedure SetUserNameEplantFormulaValuesCrpe( var Crpe:TCrpe );
(* var
  I, J:Integer;
  AEPlant_ID: string;
*)
begin
  (* for I:= 0 to (Crpe.Subreports.Count - 1) do
  begin
    Crpe.Subreports[ I ];

    {VerifyDataBase}
    // Tables.FieldMapping:= fmPrompt;  {defaut - fmAuto. Setting to fmPrompt will cause VerifyDataBase during Execute}
    Crpe.Tables.FieldMapping:= fmAuto;
    Crpe.Tables.Verify;

    if Assigned( Prn_Share.Print_SoftEPlant ) then
       AEPlant_ID:= Prn_Share.Print_SoftEPlant.EPlant_ID
    else
       AEPlant_ID:= SecurityManager.EPlant_ID;

    {Formulas}
    for J:= 0 to (Crpe.Formulas.Count - 1) do
    begin
      {Pass user name, eplant if needed}
      if UpperCase(Crpe.Formulas[ J ].Name) = 'USERNAME' then
         Crpe.Formulas[ J ].Formula.Text:= Format('''%s''', [ SecurityManager.UserName ])

      else if UpperCase(Crpe.Formulas[ J ].Name) = 'USER_EPLANT_ID' then
         Crpe.Formulas[ J ].Formula.Text:= Format('%s', [ sIIf( AEPlant_ID = 'NULL', '0', AEPlant_ID )])

      else if UpperCase(Crpe.Formulas[ J ].Name) = 'EPLANT_INCLUDE_NOT_ASSIGN' then
        Crpe.Formulas[ J ].Formula.Text:= Format('%s', [ sIIf( SecurityManager.EPlant_Include_Nulls, '''Y''', '''N''' )])

      else if UpperCase(Crpe.Formulas[ J ].Name) = 'USERNAME_PROC_COST_LOT_SUM' then
         Crpe.Formulas[ J ].Formula.Text:= Format('''%s_LOT_SUM''', [ SecurityManager.UserName ]);
    end;
  end;
  *)  
end;


procedure SetUserNameEplantFormulaValuesDNet( var CRDotNetObject:Variant );
var
  AEPlant_ID: string;
begin     
  if Assigned( Print_SoftEPlant ) then
     AEPlant_ID:= Print_SoftEPlant.EPlant_ID
  else
     AEPlant_ID:= SecurityManager.EPlant_ID;

  CRDotNetObject.AssignTextToFormula( 'USERNAME',
                                      Format( '''%s''', [ SecurityManager.UserName ] ) );

  CRDotNetObject.AssignTextToFormula( 'USER_EPLANT_ID',
                                      Format( '%s', [ sIIf( AEPlant_ID = 'NULL',
                                                            '0',
                                                            AEPlant_ID ) ] ) );

  CRDotNetObject.AssignTextToFormula( 'EPLANT_INCLUDE_NOT_ASSIGN',
                                      Format( '%s', [ sIIf( SecurityManager.EPlant_Include_Nulls,
                                                            '''Y''',
                                                            '''N''' )                   ]       ) );

  CRDotNetObject.AssignTextToFormula( 'USERNAME_PROC_COST_LOT_SUM',
                                      Format( '''%s_LOT_SUM''', [ SecurityManager.UserName ] ) );
                                                            
end;


function ValidStoredProcedureParams( Crpe:TCrpe; CRDotNetObject:Variant ): Boolean;
var
  T: TStrings;
  I: Integer;
  U: string;
begin
  Result:= TRUE;

  (* if not IsCRDotVersion then
    begin
      T:= Crpe.ParamFields.Names;

      for i:=0 to T.count-1 do
      begin
        U := Uppercase(Copy(T[i], 1, 5));
        if not ( (T[i] = 'CRW_CURSOR') or (T[i] = 'V_EPLANT_ID')  or ( U = 'V_DAT' ) or ( U = 'V_NUM' ) or ( U = 'V_STR' ) ) then
          Result:= False;
      end;
    end

  else // CR.NET Version
  *)
    if not ( ( CRDotNetObject.ParamNameExists( 'CRW_CURSOR' ) )  or
             ( CRDotNetObject.ParamNameExists( 'V_EPLANT_ID' ) ) or
             ( CRDotNetObject.ParamExistsStartsWith( 'V_DAT' ) ) or
             ( CRDotNetObject.ParamExistsStartsWith( 'V_NUM' ) ) or
             ( CRDotNetObject.ParamExistsStartsWith( 'V_STR' ) ) )
    then
      Result:= False;
end;


procedure SetReportTextObjectValue( var ACRDotNetObject:Variant; ATextObjectName, ATextObjectValue:String );
begin
  (* if not IsCRDotVersion then
    EXIT;
  *)
  ACRDotNetObject.SetTextObjectText( ATextObjectName, ATextObjectValue );
end;


function IsAnythingPrinted( Crpe:TCrpe; CRDotNetObject:Variant ): Boolean;
begin
  Result:= TRUE;

  (* if not IsCRDotVersion then
     Result:= Crpe.Records.Printed > 0
  else
  *)
     // CR.NET Version
     Result:= TRUE;  // needs to be changed
end;


end.
