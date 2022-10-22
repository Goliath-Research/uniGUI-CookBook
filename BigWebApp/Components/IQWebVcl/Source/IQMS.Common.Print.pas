unit IQMS.Common.Print;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBGrids,
  Vcl.Grids, Vcl.DBCtrls, Vcl.Mask,
  IQMS.WebVcl.About,
  Vcl.Menus, IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.UCRPE32,
  Vcl.Printers,
  IQMS.Common.PrintDialogsShare,
  IQMS.WebVcl.RepDef,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf;

type
  TAssignDestination = procedure( Crpe:TCrpe; CRDotNetObject:Variant ) of object;

const
  IQMS_PDF_Printer = 'IQMS_PDF_Printer';

var
  Orientation:Short;
  PaperWidth:Short;
  PaperLength:Short;
  PaperSize:Short;

function PrintDefaultReport( AComponent:TComponent; const AFieldName:String; AList:TStringList ):Boolean;
function PrintDefaultReportEx( AComponent:TComponent; const AReportName: string; AList:TStringList; APrinterName: String = '' ):Boolean;
function PrintDefaultReportExA ( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; AStartPage: Integer = 0; AStopPage: Integer = 0 ):Boolean;
function PrintDefaultReportExB ( const AReportName: string; AList:TStringList; ACopies: Integer; AFileName:string; ACollated:Boolean = FALSE; AStartPage: Integer = 0; AStopPage: Integer = 0 ):Boolean;
function PrintDefaultReportExC ( const AReportName: string; AList:TStringList; AOwner: TComponent; AssignDestination: TAssignDestination ):Boolean;
function PrintDefaultReportExD ( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; AReportErrorText:String = ''; AStartPage: Integer = 0; AStopPage: Integer = 0):Boolean;
function PrintDefaultReportExE ( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean; AParams:TStringList; AStartPage: Integer = 0; AStopPage: Integer = 0 ):Boolean;
function PrintDefaultReportExF ( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; ACustomText:String = ''; AStartPage: Integer = 0; AStopPage: Integer = 0):Boolean;
function PrintDefaultReportExG ( const AReportName: string; AList:TStringList; AOwner: TComponent; AssignDestination: TAssignDestination ):Boolean;
function PrintDefaultReportMain( const AReportName: string;
                                 AList:TStringList;
                                 AMode: string;
                                 AOwner: TComponent;
                                 AParams: array of Variant;
                                 AssignDest: TAssignDestination = NIL;
                                 AProcParams:TStringList = NIL ):Boolean;

function AssignPrinterSettings( AComponent:TComponent; const AReportName: string; var ACopies: Integer; var ACollated: Boolean; var AStartPage, AStopPage: Integer ): Boolean;
procedure SetCRWPrinter( var ACrpe:TCrpe; var CRDotNetObject:Variant ); overload;
procedure SetCRWPrinter(const APrinterName: String; var ACrpe:TCrpe; var CRDotNetObject:Variant ); overload;
procedure GetDefaultPrinter;
procedure PrintSelectedRecords( AOwner: TComponent; AReportName, ACriteria: string );
function GetReportName(const AFieldName: string): string;

procedure LogPrintEvent( AReportName, AParams: string );

procedure SaveReportAsPDF(AOwner: TComponent; AReportName: string;
  ASelectionCriteria: TStringList; ANewFileName: string);
procedure SaveReportAsHTML(AOwner: TComponent; AReportName: string;
  ASelectionCriteria: TStringList; ANewFileName: string);

type
  { TIQPrintAsPDF }
  TIQPrintAsPDF = class(TComponent)
    procedure DoAssignDest(Crpe: TCrpe; CRDotNetObject: Variant);
    private
      FFileName: string;
      FReportName: string;
      procedure SetFileName(const Value: string);
    published
    public
      procedure Execute(ASelectionCriteria: TStringList);
      property ReportName: string read FReportName write FReportName;
      property FileName: string read FFileName write SetFileName;
      class procedure SaveAsPDF(AOwner: TComponent; AReportName: string;
        ASelectionCriteria: TStringList; ANewFileName: string);
  end;

type
  { TIQPrintAsHTML }
  TIQPrintAsHTML = class(TComponent)
    procedure DoAssignDest(Crpe: TCrpe; CRDotNetObject: Variant);
    private
      FFileName: string;
      FReportName: string;
      procedure SetFileName(const Value: string);
    published
    public
      procedure Execute(ASelectionCriteria: TStringList);
      property ReportName: string read FReportName write FReportName;
      property FileName: string read FFileName write SetFileName;
      class procedure SaveAsHTML(AOwner: TComponent; AReportName: string;
        ASelectionCriteria: TStringList; ANewFileName: string);
  end;

implementation

uses
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Numbers,
  IQMS.Common.RFShare,
  IQMS.Common.ResStrings,
  IQMS.Common.CheckPoint,
  IQMS.WebVcl.RepDefVersions,
  System.Variants;

procedure AddToRepDefLog( AStartTime: Real; AReportName: string; AOutput: Integer; AFileName: string ); forward;

function GetReportName(const AFieldName: string): string;
begin
  try
    if TableFieldExists('IQSYS', AFieldName) then
      Result := SelectValueFmtAsString('SELECT %s FROM iqsys', [AFieldName])
    else if TableFieldExists('IQSYS2', AFieldName) then
      Result := SelectValueFmtAsString('SELECT %s FROM iqsys2', [AFieldName])
    else
      Result := '';
  except
     Result := '';
  end;
  {try
     Result := SelectValueFmtAsString('SELECT %s FROM iqsys', [AFieldName]);
  except
    try
       Result := SelectValueFmtAsString('SELECT %s FROM iqsys2', [AFieldName]);
    except
       Result := '';
    end;
  end;}
end;

function PrintDefaultReport( AComponent:TComponent; const AFieldName: String;
  AList: TStringList ):Boolean;
var
  AReport: string;
begin
  // Get the report name (no path)
  AReport := GetReportName(AFieldName);

  // If the report value is empty, let the user know
  if Empty(AReport) then
     // 'No default report assigned in System Parameters. Please assign default report'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160);

  Result:= PrintDefaultReportEx( AComponent, AReport, AList );
end;

function PrintDefaultReportEx( AComponent:TComponent;
  const AReportName: string; AList:TStringList; APrinterName: String ):Boolean;
var
  ACopies : Integer;
  ACollated: Boolean;
  AStartPage: Integer;
  AStopPage: Integer;
begin
  // Initialize
  Result := False;

  ACopies   := 1;
  ACollated := FALSE;
  AStartPage:= 0;
  AStopPage := 0;

  if not IQRegIntegerScalarRead( AComponent, AReportName + '_Copies', ACopies ) then
     ACopies:= 1;

  // If the printer name is provided, and it is in the local machine's list,
  // then apply it.
  if (APrinterName > '') and (Printer.Printers.IndexOf(APrinterName) > -1) then
     Result := IQSetPrinter(APrinterName); // prn_share.pas - sets StoredPrinterName to current printer

  // If no printer has been set, or the prior attempt to set the printer failed,
  // then prompt the user for the printer.
  if not Result then
     Result:= AssignPrinterSettings( AComponent, AReportName, ACopies, ACollated, AStartPage, AStopPage );

  // If we successfully set the printer, then print the report.
  if Result then
     PrintDefaultReportExA( AReportName, AList, ACopies, ACollated, AStartPage, AStopPage );
end;

function PrintDefaultReportExA( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; AStartPage: Integer = 0; AStopPage: Integer = 0 ):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                { Report Name                    }
                                   AList,                      { Selection Criteria             }
                                   'DIRECT',                   { DIRECT - params passed in line }
                                   Application,                { Owner                          }
                                   [ ACopies,                  { How many copies                }
                                     '',                       { Filename if exporting to a file}
                                     Ord(toPrinter),           { toExport, toPrinter            }
                                     Ord(ACollated),           { Collated TRUE/FASLE            }
                                     AStartPage,               { Start Page. 0 prints all       }
                                     AStopPage ]);             { Stop Page.  0 prints all       }

end;

function PrintDefaultReportExB( const AReportName: string; AList:TStringList; ACopies: Integer; AFileName:string; ACollated:Boolean = FALSE; AStartPage: Integer = 0; AStopPage: Integer = 0 ):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                { Report Name                    }
                                   AList,                      { Selection Criteria             }
                                   'DIRECT',                   { DIRECT - params passed in line }
                                   Application,                { Owner                          }
                                   [ ACopies,                  { How many copies                }
                                     AFileName,                { FileName if exporting to a file}
                                     Ord(toExport),            { toExport, toPrinter            }
                                     Ord(ACollated),           { Collated TRUE/FASLE            }
                                     AStartPage,               { Start Page. 0 prints all       }
                                     AStopPage ]);             { Stop Page.  0 prints all       }
end;


function PrintDefaultReportExC( const AReportName: string; AList:TStringList; AOwner: TComponent; AssignDestination: TAssignDestination ):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                 { Report Name                    }
                                   AList,                       { Selection Criteria             }
                                   'CALLBACK',                  { CALLBACK - AssignDestination is passed }
                                   AOwner,                      { Owner                          }
                                   [],                          { no direct params}
                                   AssignDestination )          { Callback procedure - let caller assign copies, collate etc}
end;

function PrintDefaultReportExD( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; AReportErrorText:String = ''; AStartPage: Integer = 0; AStopPage: Integer = 0):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                { Report Name                    }
                                   AList,                      { Selection Criteria             }
                                   'DIRECT_WITH_ERROR_TEXT',   { DIRECT - params passed in line }
                                   Application,                { Owner                          }
                                   [ ACopies,                  { How many copies                }
                                     '',                       { Filename if exporting to a file}
                                     Ord(toPrinter),           { toExport, toPrinter            }
                                     Ord(ACollated),           { Collated TRUE/FASLE            }
                                     AStartPage,               { Start Page. 0 prints all       }
                                     AStopPage,                { Stop Page.  0 prints all       }
                                     AReportErrorText ]);
end;

function PrintDefaultReportExE(const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean; AParams:TStringList; AStartPage: Integer = 0; AStopPage: Integer = 0  ):Boolean;
begin
// Procedure to handle Parameter-Enabled Procedure
  Result:= PrintDefaultReportMain( AReportName,                { Report Name                    }
                                   AList,                      { Selection Criteria             }
                                   'DIRECT',                   { DIRECT - params passed in line }
                                   Application,                { Owner                          }
                                   [ ACopies,                  { How many copies                }
                                     '',                       { Filename if exporting to a file}
                                     Ord(toPrinter),           { toExport, toPrinter            }
                                     Ord(ACollated),           { Collated TRUE/FASLE            }
                                     AStartPage,               { Start Page. 0 prints all       }
                                     AStopPage ],              { Stop Page.  0 prints all       }
                                     NIL,
                                     AParams);
end;

function PrintDefaultReportExF( const AReportName: string; AList:TStringList; ACopies: Integer; ACollated:Boolean = FALSE; ACustomText:String = ''; AStartPage: Integer = 0; AStopPage: Integer = 0):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                { Report Name                    }
                                   AList,                      { Selection Criteria             }
                                   'DIRECT_WITH_CUSTOM_TEXT',  { DIRECT - params passed in line }
                                   Application,                { Owner                          }
                                   [ ACopies,                  { How many copies                }
                                     '',                       { Filename if exporting to a file}
                                     Ord(toPrinter),           { toExport, toPrinter            }
                                     Ord(ACollated),           { Collated TRUE/FASLE            }
                                     AStartPage,               { Start Page. 0 prints all       }
                                     AStopPage,                { Stop Page.  0 prints all       }
                                     ACustomText ]);           { Custom text to include         }
end;

function PrintDefaultReportExG( const AReportName: string; AList:TStringList; AOwner: TComponent; AssignDestination: TAssignDestination ):Boolean;
begin
  Result:= PrintDefaultReportMain( AReportName,                 { Report Name                    }
                                   AList,                       { Selection Criteria             }
                                   'CALLBACK_PDF_SIG',          { CALLBACK_PDF_SIG - AssignDestination is passed, check/use PDF signature }
                                   AOwner,                      { Owner                          }
                                   [],                          { no direct params}
                                   AssignDestination )          { Callback procedure - let caller assign copies, collate etc}
end;

function PrintDefaultReportMain( const AReportName: string;
                                 AList:TStringList;
                                 AMode: string;
                                 AOwner: TComponent;
                                 AParams: array of Variant;
                                 AssignDest: TAssignDestination = NIL;
                                 AProcParams:TStringList = NIL ):Boolean;
var
  ACopies    : Integer;
  AFileName  : string;
  AOutput    : Integer;
  ACollation : Boolean;
  AStartPage : Integer;
  AStopPage  : Integer;

  ACrpe      : TCrpe;
  // added for .net CRXI
  CW: Word;
  ACRDotNetObject:Variant;


  cServerName: string;
  cUID       : string;
  cPassword  : string;
  DebugStr   : string;
  AStartTime : TDateTime;
  AReportText, AReportTextName: string;
  I:integer;

  AParamName:String;
  AParamValue:String;

  AOpenFile: Boolean;

begin
  AOpenFile := False;
  AReportText:= '';
  AReportTextName:= '';
  if AMode = 'DIRECT_WITH_ERROR_TEXT' then
    begin
      AReportText:= AParams[ 6 ];
      AReportText:= Format( '"%s"', [ Trim( AReportText {StrTran(AReportErrorText,  #13#10, '')} )  ] );
      AReportTextName := 'ERROR_MESSAGE';
      AMode:= 'DIRECT'
    end;

  if AMode = 'DIRECT_WITH_CUSTOM_TEXT' then
    begin
      AReportText:= AParams[ 6 ];
      AReportTextName := 'CUSTOM_TEXT';
      AMode:= 'DIRECT'
    end;

  {Parse Params}
  if AMode = 'DIRECT' then
    begin
       AOwner    := Application;
       ACopies   := AParams[ 0 ];
       AFileName := AParams[ 1 ];
       AOutput   := AParams[ 2 ];
       ACollation:= AParams[ 3 ];
       AStartPage:= AParams[ 4 ];
       AStopPage := AParams[ 5 ];
    end;

  Result:= TRUE;

  cServername := IQGetServerName;
  cUID        := IQGetUID;
  cPassword   := IQGetPassword;

  try
    CheckDisableFPUExceptions( CW );
    try
      DebugStr:= 'Check Create Report Object';
      CheckCreateReportObject( ACrpe, ACRDotNetObject, AOwner );

      DebugStr:= 'Assign Path and RepName';
      SetReportName( ACrpe, ACRDotNetObject, IQGetReportsPath + AReportName );      { IQRepDefVersions.pas }

      if not FileExists( GetReportPathName( ACrpe, ACRDotNetObject ) ) then             { IQRepDefVersions.pas }
//         'Report %s not found. Please check report name'
        raise Exception.CreateFmt(  IQMS.Common.ResStrings.cTXT0000161, [ GetReportPathName( ACrpe, ACRDotNetObject ) ]  );

      if AMode = 'DIRECT' then
        begin
          DebugStr:= 'Assign Copies';
          AssignPrintOptionNumCopies( ACrpe, ACRDotNetObject, ACopies   );          { IQRepDefVersions.pas }

          DebugStr:= 'Assign Collated';
          AssignPrintOptionCollated( ACrpe, ACRDotNetObject, ACollation );          { IQRepDefVersions.pas }

          DebugStr:= 'Assign Print Range';
          AssignPrintOptionPrintRange( ACrpe, ACRDotNetObject, AStartPage, AStopPage );  { IQRepDefVersions.pas }

          DebugStr:= 'Set Output';
          SetOutput( ACrpe, ACRDotNetObject, AOutput ); { toExport or toPrinter }   { IQRepDefVersions.pas }

          DebugStr:= 'Set Destination';

//           06/12/2015 If the user selected 'IQMS_PDF_Printer' from the
//           "Print" dialog, we must intercept it here.  It is impossible
          // to print directly to the 'IQMS_PDF_Printer' because it requires
          // a license key.  So, change the destination to "export", and
          // let the Crystal report engine handle writing to PDF instead.
          // EIQ-7478 Printing - printing reports with parameters to
          // IQMS PDF Printer prompts user several times for file name -
          // DBM Optix CRM# 1245005
          if CompareText(IQMS_PDF_Printer,Printer.Printers[Printer.PrinterIndex]) = 0 then
            begin
              DebugStr:= 'Set Destination - PDF';
              // Set the destination to "export"
              ACRDotNetObject.Destination := dtToExport;
              ACRDotNetObject.SelectedExportFormatType := TExportOptions.dtAdobeAcrobatPDF;
              // Prompt the user for the PDF file name
              with TSaveDialog.Create(NIL) do
              try
                DefaultExt := '.txt';
                FileName := ChangeFileExt(AReportName, '.pdf');
                // IQMS.Common.ResStrings.cTXT0000498 = 'PDF File (*.pdf)';
                Filter :=  IQMS.Common.ResStrings.cTXT0000498;
                // If the user selects or sets a file name, then we use
                // it; otherwise, we must abort printing because an
                // error will be raised by the Nova driver.
                if Execute then
                  AFileName := FileName
                else
                  System.SysUtils.Abort;
                AOpenFile := True;
              finally
                 Free;
              end;
              // Set the PDF file name
              ACRDotNetObject.ExportFilePath := AFileName;
            end
          else
            SetDestinationToFileEx( ACrpe, ACRDotNetObject, AFileName );       { IQRepDefVersions.pas }
        end
      else if Assigned( AssignDest ) then
        AssignDest( ACrpe, ACRDotNetObject );

      if AMode = 'CALLBACK_PDF_SIG' then
        ACRDotNetObject.UsePdfSignature := True;

      DebugStr:= 'Connect';
      SetReportConnection( ACrpe, ACRDotNetObject, cServerName, cUID, cPassword );  { IQRepDefVersions.pas }

      // Load report file and apply connection info
      DebugStr:= 'Check Configure .NET Report';
      CheckConfigureDNetRpt( ACRDotNetObject );  { IQRepDefVersions.pas }

      if Assigned(AProcParams) and (AProcParams <> nil) then
      begin
        for I := 0 to AProcParams.Count - 1 do
        begin
         AParamName  := AProcParams.Names[I];
         AParamValue := AProcParams.Values[AParamName];
         SetParam(ACrpe, ACRDotNetObject,  AParamName, AParamValue);
        end;
      end;

      if AList.Count > 0 then
      begin
        DebugStr:= 'Verify Formula Schema';
        CheckSelectionFormulaAgainstReportTables( ACrpe, ACRDotNetObject, AList );  { IQRepDefVersions.pas }

        DebugStr:= 'Set Selection Formula';
        AppendSelectionFormula( ACrpe, ACRDotNetObject, AList );  { IQRepDefVersions.pas } //Only passing crpe.selection.formula, .net codes handles its selection formula
      end;

      // .net reports only cr9 doesnt support named TextObjects
      if AReportText <> '' then
        SetReportTextObjectValue( ACRDotNetObject, AReportTextName, AReportText );

      DebugStr:= 'Set CRW Printer';
      if ACRDotNetObject.Destination = dtToPrinter then
        SetCRWPrinter( ACrpe, ACRDotNetObject );

      DebugStr:= 'Apply VerifyDataBase';
      CheckApplyVerifyDatabase( ACrpe, ACRDotNetObject );  { Force VerifyDataBase including subreports }

      if IsConsole then
      begin
         DebugStr:= 'Log Print Event';
         LogPrintEvent( GetReportPathName( ACrpe, ACRDotNetObject ),                    { IQRepDefVersions.pas }
                        GetSelectionFormulaText( ACrpe, ACRDotNetObject ) );        { IQRepDefVersions.pas }
      end;

      DebugStr:= 'Suppress Progress Dialog';
      CheckCrpeSuppressProgressDialog( ACrpe );                                     { IQRepDefVersions.pas }

      DebugStr:= 'Set Username and Eplant';
      SetUserNameEplantFormulaValuesMain( ACrpe, ACRDotNetObject );                 { IQRepDefVersions.pas }

      DisableDNetParamPrompts( ACRDotNetObject, IsConsole );

      DebugStr:= 'Execute';
      AStartTime:= Now;
      DoExecuteReport( ACrpe, ACRDotNetObject );

      {Aug-22-2006 if AMode = CALLBACK then the caller must take care of AddToRepDefLog}
      DebugStr:= 'AddToRepDefLog';
      if AMode = 'DIRECT' then
         AddToRepDefLog( AStartTime, AReportName, AOutput, AFileName );

      DebugStr:= 'Print to Screen';
      CheckShowDNetForm( ACRDotNetObject ); { IQRepDefVersions.pas }
    finally
      CheckFreeCRDotNetObject( ACRDotNetObject );
      CheckRestoreFPU( CW );
      CheckFreeNonToWindowOutputCrpe( ACrpe );
    end;

  except on E: Exception do
    begin
      if Assigned( ACrpe ) then
        ACrpe.Free;
      CheckFreeCRDotNetObject( ACRDotNetObject );

      raise Exception.CreateFmt('%s (IQPrint Action: %s)', [ E.Message, DebugStr ]);;
    end;
  end;

  // 06/12/2015 Display the exported file (if applicable).  If the user
  // printed to PDF, and the file exists, go ahead and show the file.
  // EIQ-7478 Printing - printing reports with parameters to
  // IQMS PDF Printer prompts user several times for file name -
  // DBM Optix CRM# 1245005
  if AOpenFile and FileExists(AFileName) then
    ExecuteProgram(AFileName);
end;


procedure SetCRWPrinter( var ACrpe:TCrpe; var CRDotNetObject:Variant );
begin
  AssignCRWPrinter( ACrpe , CRDotNetObject, Printer.Printers[Printer.PrinterIndex] );
end;

procedure SetCRWPrinter(const APrinterName: String; var ACrpe:TCrpe; var CRDotNetObject:Variant );
var
   AUseThisIndex: Integer;
begin
  AUseThisIndex := Printer.Printers.IndexOf(APrinterName);
  if (AUseThisIndex = -1) then AUseThisIndex := Printer.PrinterIndex;
  AssignCRWPrinter( ACrpe , CRDotNetObject, Printer.Printers[AUseThisIndex] );
end;

procedure GetDefaultPrinter;
var
  printerName,driverName,portName: PChar;
  hMode: THandle;
  ptrDevMode: PDevMode;
begin
  printerName:= StrAlloc(255);
  driverName := StrAlloc(255);
  portName   := StrAlloc(255);
  try
     Printer.PrinterIndex := -1;                                    {A value of -1 gets the Default Printer from the Printer List}
     Printer.GetPrinter(printerName, driverName, portName, hMode);  {Get the DevMode for that Printer}

     ptrDevMode := GlobalLock(hMode);                               {Get the Orientation from the Printer Driver DevMode}
     Orientation:= ptrDevMode^.dmOrientation;                       {Set the global Orientation variable accordingly}

     GlobalUnlock(hMode);
  finally
     StrDispose(printerName);
     StrDispose(driverName);
     StrDispose(portName);
  end;
end;

function AssignPrinterSettings( AComponent:TComponent; const AReportName: string; var ACopies: Integer; var ACollated: Boolean; var AStartPage, AStopPage: Integer ): Boolean;
var
  StoredPrinterName: string;
begin
  Result   := True;
  ACopies  := 1;
  ACollated:= False;
  AStartPage:= 0;
  AStopPage := 0;

  {Jun-07-04}
  if not IQRegIntegerScalarRead( AComponent, AReportName + '_Copies', ACopies ) then
     ACopies:= 1;

  case IsConsole of
    TRUE :
       StoredPrinterName:= GetRFPrinter( AReportName );   {RF_Share}
    FALSE:
       begin
         IQRegStringScalarRead( AComponent, AReportName + '_Printer', StoredPrinterName );

         //if not IQRegIntegerScalarRead( AComponent, AReportName + '_Copies', ACopies ) then
         //   ACopies:= 1;

         if not IQRegBooleanScalarRead( AComponent, AReportName + '_Collated', ACollated ) then
           ACollated := False;
       end;
  end;
//
  IQSetPrinter( StoredPrinterName ); // prn_share.pas - sets StoredPrinterName to current printer

  if not IsConsole then
  begin
     with TPrintDialog.Create(Application) do
     try
       MaxPage := -1;
       Options := [poPageNums];
       try
         Copies  := ACopies;
       except
         Printer.PrinterIndex := -1;  {A value of -1 gets the Default Printer from the Printer List}
         Copies  := ACopies;
       end;
       Collate := ACollated;

       if not Execute then
       begin
         Result:= FALSE;
         EXIT;
       end;

       ACopies  := Copies;
       ACollated:= Collate;

       if PrintRange = prPageNums then
       begin
          AStartPage:= FromPage;
          AStopPage := ToPage;
       end;
     finally
       Free;
     end;

     StoredPrinterName:= Printer.Printers[Printer.PrinterIndex];
     // Sep-8-06 - Jason - do not chop name or we wont find it in list of Vcl.Printers when calling IQSetPrinter
     // If it is terminal server, they should setup static printer names, that dont have "in session xxx" in the name.
     //if RPos(' on ', StoredPrinterName) <> 0 then
     //  StoredPrinterName:= Copy(StoredPrinterName, 1, RPos(' on ', StoredPrinterName) - 1);

     IQRegStringScalarWrite ( AComponent, AReportName + '_Printer',  StoredPrinterName);
     IQRegIntegerScalarWrite( AComponent, AReportName + '_Copies',   ACopies );
     IQRegBooleanScalarWrite( AComponent, AReportName + '_Collated', ACollated );
  end;
end;

procedure PrintSelectedRecords( AOwner: TComponent; AReportName, ACriteria: string );
var
  SelectionList:TStringList;
begin
  try
    SelectionList := TStringList.Create;
    SelectionList.Add( ACriteria );
    PrintDefaultReport( AOwner, AReportName, SelectionList );
  finally
    SelectionList.Free;
  end;
end;


procedure LogPrintEvent( AReportName, AParams: string );
begin
  try
    TFrmCheckPointList.Add( Format('%s is about to print %s to a printer.'#13#10'Current default printer: %s.'#13#10'Params: %s',
                            [ ExtractFileName( Application.ExeName ),
                              AReportName,
                              Printer.Printers[ Printer.PrinterIndex ],
                              AParams ]));
  except
  end;
end;


procedure GetDestination( AOutput: Integer; AFileName: string; var ADestination, ASpec: string );
begin
  case TCrOutput( AOutput ) of  {ucrpe32}
    toWindow :
     begin
       ADestination:= 'Screen';
       ASpec:= '';
     end;

    toPrinter:
     begin
       ADestination:= 'Printer';
       ASpec:= Printer.Printers[ Printer.PrinterIndex ];
     end;

    toExport:
     begin
       ADestination:= 'File';
       ASpec:= AFileName;
     end;
  end;
end;

procedure AddToRepDefLog( AStartTime: Real; AReportName: string; AOutput: Integer; AFileName: string );
var
  ADestination: string;
  ASpec       : string;
begin
  ADestination:= ''; ASpec:= '';
  GetDestination( AOutput, AFileName, ADestination, ASpec );
  if ASpec > '' then
     ADestination:= Format( '%s: %s', [ ADestination, ASpec ]);

  InternalWriteToRepdefLog( AReportName, SecurityManager.UserName, ADestination, AStartTime );  {prn_share.pas}
end;


procedure SaveReportAsPDF(AOwner: TComponent; AReportName: string;
  ASelectionCriteria: TStringList; ANewFileName: string);
begin
  TIQPrintAsPDF.SaveAsPDF(AOwner, AReportName, ASelectionCriteria,
    ANewFileName);
end;

procedure SaveReportAsHTML(AOwner: TComponent; AReportName: string;
  ASelectionCriteria: TStringList; ANewFileName: string);
begin
  TIQPrintAsHTML.SaveAsHTML(AOwner, AReportName, ASelectionCriteria,
    ANewFileName);
end;

{$REGION 'TIQPrintAsPDF'}

{ TIQPrintAsPDF }

class procedure TIQPrintAsPDF.SaveAsPDF(AOwner: TComponent; AReportName: string;
  ASelectionCriteria: TStringList; ANewFileName: string);
begin
  with TIQPrintAsPDF.Create(AOwner) do
    try
      ReportName := AReportName;
      FileName := ANewFileName;
      Execute(ASelectionCriteria);
    finally
      Free;
    end;
end;

procedure TIQPrintAsPDF.Execute(ASelectionCriteria: TStringList);
begin
  // The report name must be provided
  IQAssert(FileName > '', 'Application Error:  PDF file name is required.');
  // A new PDF file name must be provided
  IQAssert(ReportName > '', 'Application Error:  Report name is required.');
  // Print to PDF
  PrintDefaultReportMain(ReportName, ASelectionCriteria, '', Self.Owner, [],
    DoAssignDest);
end;

procedure TIQPrintAsPDF.SetFileName(const Value: string);
begin
  FFileName := System.SysUtils.ChangeFileExt(Value, '.pdf');
end;

procedure TIQPrintAsPDF.DoAssignDest(Crpe: TCrpe; CRDotNetObject: Variant);
var
  ADebugStr: string;
begin
  try
    ADebugStr := 'Assign Copies';
    AssignPrintOptionNumCopies(Crpe, CRDotNetObject, 1);

    ADebugStr := 'Assign Collated';
    AssignPrintOptionCollated(Crpe, CRDotNetObject, TRUE);

    ADebugStr := 'Assign Print Range';
    AssignPrintOptionPrintRange(Crpe, CRDotNetObject, 0, 0);

    ADebugStr := 'Set Destination';
    CRDotNetObject.Destination := dtToExport;
    CRDotNetObject.SelectedExportFormatType := TExportOptions.dtAdobeAcrobatPDF;
    CRDotNetObject.ExportFilePath := FFileName;

  except
    on E: Exception do
      raise Exception.CreateFmt('Encountered error assigning ' +
        'destination [%s]:  %s',  [ADebugStr, E.Message]);
  end;
end;

{$ENDREGION 'TIQPrintAsPDF'}

{ TIQPrintAsHTML }

class procedure TIQPrintAsHTML.SaveAsHTML(AOwner: TComponent;
  AReportName: string; ASelectionCriteria: TStringList; ANewFileName: string);
begin
  with TIQPrintAsHTML.Create(AOwner) do
    try
      ReportName := AReportName;
      FileName := ANewFileName;
      Execute(ASelectionCriteria);
    finally
      Free;
    end;
end;

procedure TIQPrintAsHTML.Execute(ASelectionCriteria: TStringList);
begin
  // The report name must be provided
  IQAssert(FileName > '', 'Application Error:  PDF file name is required.');
  // A new PDF file name must be provided
  IQAssert(ReportName > '', 'Application Error:  Report name is required.');
  // Print
  PrintDefaultReportMain(ReportName, ASelectionCriteria, '', Self.Owner, [],
    DoAssignDest);
end;

procedure TIQPrintAsHTML.SetFileName(const Value: string);
begin
  FFileName := System.SysUtils.ChangeFileExt(Value, '.htm');
end;

procedure TIQPrintAsHTML.DoAssignDest(Crpe: TCrpe; CRDotNetObject: Variant);
var
  ADebugStr: string;
begin
  try
    ADebugStr := 'Assign Copies';
    AssignPrintOptionNumCopies(Crpe, CRDotNetObject, 1);

    ADebugStr := 'Assign Collated';
    AssignPrintOptionCollated(Crpe, CRDotNetObject, TRUE);

    ADebugStr := 'Assign Print Range';
    AssignPrintOptionPrintRange(Crpe, CRDotNetObject, 0, 0);

    ADebugStr := 'Set Destination';
    CRDotNetObject.Destination := dtToExport;
    // Note:  Do not assign dtHTML40
    CRDotNetObject.SelectedExportFormatType := TExportOptions.dtHTML32;
    CRDotNetObject.ExportFilePath := FFileName;
  except
    on E: Exception do
      raise Exception.CreateFmt('Encountered error assigning ' +
        'destination [%s]:  %s', [ADebugStr, E.Message]);
  end;
end;

end.
