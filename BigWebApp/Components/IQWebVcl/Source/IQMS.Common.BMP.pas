unit IQMS.Common.BMP;

interface

uses
  System.Classes, Data.DB, Winapi.Windows, Vcl.Graphics, Vcl.Printers,
  System.SysUtils;

function FieldIsImage(BlobField: TBlobField): Boolean;
function FileIsImage(const FileName: string): Boolean;
procedure PrintImage(ABitMap: TBitMap; const ACaption: string); overload;
procedure PrintImage(APicture: TPicture; const ACaption: string); overload;
procedure PrintImage(ABlobField: TBlobField; ACaption: string); overload;

implementation

uses
  IQMS.Common.Graphics,
  IQMS.Common.ResStrings;

function FieldIsImage(BlobField: TBlobField): Boolean;
var
  Picture: TPicture;
begin
  try
    Picture := TPicture.Create;
    try
      Result := IQMS.Common.Graphics.LoadPictureFromField(BlobField, Picture);
    finally
      FreeAndNil(Picture);
    end;
  except
    Result := False;
  end;
end;

function FileIsImage(const FileName: string): Boolean;
var
  BlobStream: TFileStream;
  Bmf: TBitmapFileHeader;
begin
  Result := False;
  BlobStream := TFileStream.Create(FileName, fmOpenRead);
  try
    try
      BlobStream.ReadBuffer(Bmf, SizeOf(Bmf));
      Result := (Bmf.bfType = $4D42);
    except
      Result := False;
    end;
  finally
    BlobStream.Free;
  end;
end;

procedure PrintImage(ABitMap: TBitMap; const ACaption: string);
var
  Info: PBitmapInfo;
  InfoSize: DWORD;
  Image: Pointer;
  ImageSize: DWORD;
begin
  with ABitMap do
    begin
      GetDIBSizes(Handle, InfoSize, ImageSize);
      { get the Info header and image size }
      GetMem(Info, InfoSize); { Allocate memory for the info header }
      try
        GetMem(Image, ImageSize); { Allocate memory for the Image }
        try
          GetDIB(Handle, Palette, Info^, Image^);
          { Retrieve the bitmap bits in device-independent format, the palette and the Info header }
          with Info^.bmiHeader do
            begin
              Printer.Title := ACaption;
              Printer.BeginDoc;
              try { Call StretchDIBits to print the bitmap }
                StretchDIBits(Printer.Canvas.Handle, 0, 0, Printer.PageWidth,
                  Printer.PageHeight, 0, 0, biWidth, biHeight, Image, Info^,
                  DIB_RGB_COLORS, SRCCOPY);
              finally
                Printer.EndDoc;
              end;
            end;
        finally
          FreeMem(Image, ImageSize); // Free the memory allocated
        end;
      finally
        FreeMem(Info, InfoSize);
      end;
    end;
end;

procedure PrintImage(APicture: TPicture; const ACaption: string);
begin
  PrintImage(APicture.Bitmap, ACaption);
end;

procedure PrintImage(ABlobField: TBlobField; ACaption: string);
var
  Picture: TPicture;
begin
  Picture := TPicture.Create;
  try
    IQMS.Common.Graphics.LoadPictureFromField(ABlobField, Picture);
    PrintImage(Picture, ACaption);
  finally
    if Assigned(Picture) then
      Picture.Free;
  end;
end;

end.
