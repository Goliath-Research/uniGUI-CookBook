unit shipman_print;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Printers,
  TMultiP,
  System.Math,
  WinSpool,
  shipman_printconst,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmIQShipManPrint = class(TUniForm)
    PrintDialog: TPrintDialog;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    imgPreview: TPMultiImage;
    lblPrinterName: TUniLabel;
    lblPrintJobName: TUniLabel;
    Panel3: TUniPanel;
    btnClose: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FFileName: TFileName;
    FPrinter: String;
    procedure SetFileName(const Value: TFileName);
    procedure SetPrinter(const Value: String);
    function PrintAsBinaryFile: Boolean;
    function PrintAsImageFile: Boolean;
    function PrintAsTextFile: Boolean;
  public
    { Public declarations }
    LabelParams: TLabelParams;
    procedure Execute;
    procedure AssignParams(const ALabelParams: TLabelParams);
    procedure ApplyParams;
  published
    { Published declarations }
    property FileName: TFileName read FFileName write SetFileName;
    property PrinterName: String read FPrinter write SetPrinter;
  end;


  procedure GetLabelParams(AFreightPrinterID: Real; var ALabelParams: TLabelParams);

  procedure DoPrintLabel(AOwner: TComponent; AFileName: TFileName;
      AFreightPrinterID: Real; AShow: Boolean = FALSE);

  procedure DoPrintLabelEx(AOwner: TComponent; AFileName: TFileName;
   APrinterName: String; ALabelParams: TLabelParams; AShow: Boolean = FALSE);


implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.ResStrings
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  ,prn_share
  }
  ;

procedure DoPrintLabel(AOwner: TComponent; AFileName: TFileName;
    AFreightPrinterID: Real; AShow: Boolean);
var
   ALabelParams: TLabelParams;
begin
   GetLabelParams(AFreightPrinterID, ALabelParams);
   DoPrintLabelEx(AOwner,AFileName,'',ALabelParams,AShow);
end;

procedure DoPrintLabelEx(AOwner: TComponent; AFileName: TFileName;
 APrinterName: String; ALabelParams: TLabelParams; AShow: Boolean);
begin
  with TFrmIQShipManPrint.Create(AOwner) do
  try
    AssignParams(ALabelParams);
    FileName := AFileName;
    PrinterName := APrinterName;
    ApplyParams;
    if AShow then
       ShowModal
    else
       Execute;
  finally
    Free;
  end;
end;

procedure GetLabelParams(AFreightPrinterID: Real; var ALabelParams: TLabelParams);
begin
  with TFDQuery.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     SQL.Add('SELECT name, printer, printer_type, label_width,');
     SQL.Add('       label_height, label_top, label_left, orientation, uom');
     SQL.Add('FROM freight_printer');
     SQL.Add(Format('WHERE id = %.0f',[AFreightPrinterID]));
     Open;
     ALabelParams.PrintJobName := 'Shipping Label';
     ALabelParams.DisplayName := FieldByName('NAME').AsString;
     ALabelParams.Printer := FieldByName('PRINTER').AsString;
     ALabelParams.PrinterType := TPrinterType(FieldByName('PRINTER_TYPE').AsInteger);
     ALabelParams.TopMargin := FieldByName('LABEL_TOP').AsFloat;
     ALabelParams.LeftMargin := FieldByName('LABEL_LEFT').AsFloat;
     ALabelParams.Height := FieldByName('LABEL_HEIGHT').AsFloat;
     ALabelParams.Width  := FieldByName('LABEL_WIDTH').AsFloat;
     if FieldByName('UOM').AsString = 'IN' then
        ALabelParams.UOM    := cuInches
     else
        ALabelParams.UOM    := cuCentimeters;
     ALabelParams.Orientation := TOrientation(FieldByName('ORIENTATION').AsInteger);
     
  finally
     Free;
  end;
end;

{ TFrmIQShipManPrint }
    
procedure TFrmIQShipManPrint.FormCreate(Sender: TObject);
begin
  // Initial values
  LabelParams.TopMargin   := 0;
  LabelParams.LeftMargin  := 0;
  LabelParams.Height      := 4;
  LabelParams.Width       := 6;
  LabelParams.UOM         := cuInches;
  LabelParams.Orientation := orVertical;
  LabelParams.PrinterType := ptUnknown;
  LabelParams.Printer     := '';
end;

procedure TFrmIQShipManPrint.Execute;
begin
  try
     Screen.Cursor := crHourGlass;
     case LabelParams.PrinterType of
      ptLaser: PrintAsImageFile;
      ptEltron, ptZebra, ptUniMark: PrintAsBinaryFile;
     end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmIQShipManPrint.SetFileName(const Value: TFileName);
begin
  if not FileExists(Value) then Exit;
  FFileName := Value;

  // Don't try this without an image file
  if LabelParams.PrinterType = ptLaser then
     try
        imgPreview.ImageName := Value;
     except // yes, suppress
     end;
end;

procedure TFrmIQShipManPrint.SetPrinter(const Value: String);
begin
  if Value = '' then Exit;
  FPrinter := Value;
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  IQSetPrinter(Value); // prn_share.pas
  }
end;

procedure TFrmIQShipManPrint.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQShipManPrint.AssignParams(
  const ALabelParams: TLabelParams);
begin
  // Copy the params record
  LabelParams.PrintJobName:= ALabelParams.PrintJobName;
  LabelParams.DisplayName := ALabelParams.DisplayName ;
  LabelParams.Printer     := ALabelParams.Printer     ;
  LabelParams.PrinterType := ALabelParams.PrinterType ;
  LabelParams.TopMargin   := ALabelParams.TopMargin   ;
  LabelParams.LeftMargin  := ALabelParams.LeftMargin  ;
  LabelParams.Width       := ALabelParams.Width       ;
  LabelParams.Height      := ALabelParams.Height      ;
  LabelParams.UOM         := ALabelParams.UOM         ;
  LabelParams.Orientation := ALabelParams.Orientation ;
  LabelParams.StartingRotation := ALabelParams.StartingRotation ;
end;

procedure TFrmIQShipManPrint.ApplyParams;
begin
  lblPrinterName.Caption := LabelParams.DisplayName;
  lblPrintJobName.Caption := LabelParams.PrintJobName;
  if imgPreview.ImageName > '' then
  case LabelParams.Orientation of
   orVertical:
    begin
     imgPreview.RotateImageDegree(0,0,0,0,(270 + LabelParams.StartingRotation) mod 360);
    end;
   orHorizontal:
    begin
     imgPreview.RotateImageDegree(0,0,0,0,(180 + LabelParams.StartingRotation) mod 360);
    end;
   orVerticalFlip:
    begin
     imgPreview.RotateImageDegree(0,0,0,0,(90 + LabelParams.StartingRotation) mod 360);
    end;
  else
     imgPreview.RotateImageDegree(0,0,0,0,(0 + LabelParams.StartingRotation) mod 360);
//     imgPreview.ResetImage;
  end;
end;

function TFrmIQShipManPrint.PrintAsImageFile: Boolean;
var
   rUOMDivisor,
   AWidth,
   AHeight: Real;
   iPrinterPixelsX,
   iPrinterPixelsY,
   iPagePixelsX,
   iPagePixelsY: Integer;
   AParams: TRect;
begin
  // We need to make some adjustments to the useable values, based on orientation
  if (LabelParams.Orientation = orHorizontal) or (LabelParams.Orientation = orHorizontalFlip) then
    begin
      AWidth  := LabelParams.Height;
      AHeight := LabelParams.Width;
    end
  else
    begin
      AWidth  := LabelParams.Width;
      AHeight := LabelParams.Height;
    end;


  // Depending on UOM, we may need to divide the resulting "inches"
  // value to convert it to centimeters
  rUOMDivisor := IQMS.Common.Numbers.fIIf(LabelParams.UOM = cuCentimeters, 2.54, 1.00);

  // Get the printer pixels per inch
  iPrinterPixelsX := GetDeviceCaps( Printer.Handle, LOGPIXELSX );
  iPrinterPixelsY := GetDeviceCaps( Printer.Handle, LOGPIXELSY );

  // Get the Vcl.Printers totals pixels
  iPagePixelsX := GetDeviceCaps( Printer.Handle, PHYSICALWIDTH );
  iPagePixelsY := GetDeviceCaps( Printer.Handle, PHYSICALHEIGHT );

  // Fill AParams (TRect) with modified values
  AParams.Top    := Trunc((LabelParams.TopMargin * iPrinterPixelsY) / rUOMDivisor);
  AParams.Left   := Trunc((LabelParams.LeftMargin  * iPrinterPixelsX) / rUOMDivisor);
  AParams.Right  := Trunc(Min(iPagePixelsX,Trunc(AWidth * iPrinterPixelsX)) / rUOMDivisor);
  AParams.Bottom := Trunc(Min(iPagePixelsY,Trunc(AHeight * iPrinterPixelsY)) / rUOMDivisor);

  // Set the printer
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  if (not IQSetPrinter(LabelParams.Printer)) then    // prn_share.pas
     iqmesg.IQError(IQMS.Common.ResourceStrings.cTXT0000345 + #13#13 + LabelParams.Printer);
  }
  // Print the image
  imgPreview.PrintMultiImage(AParams.Top,
                             AParams.Left,
                             AParams.Right,
                             AParams.Bottom );

  // wait
  Sleep(1000);

end;

function TFrmIQShipManPrint.PrintAsBinaryFile: Boolean;
begin
  { TODO -ombaral -cWebIQ : Need to resolve dependency }
  //Result := prn_share.PrintBinaryFile(FileName, 'Shipping Label' {Title}, LabelParams.Printer);
end;

function TFrmIQShipManPrint.PrintAsTextFile: Boolean;
begin
  { TODO -ombaral -cWebIQ : Need to resolve dependency }
  //Result := prn_share.PrintTextFile(FileName, 'Shipping Label' {Title}, LabelParams.Printer);
end;

end.
