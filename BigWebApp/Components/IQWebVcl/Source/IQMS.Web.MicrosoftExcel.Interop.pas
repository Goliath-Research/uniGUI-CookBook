unit IQMS.Web.MicrosoftExcel.Interop;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils, System.Variants,
  IQMS.Web.MicrosoftApplication, IQMS.Web.MicrosoftApplication.Interop,
  IQMS.Web.MicrosoftExcel;

type
  TMicrosoftExcelInterop = class(TMicrosoftApplicationInterop, IMicrosoftApplication, IMicrosoftExcel)
  strict private
    FVersion: Integer;
  private
    FWorkbookName: string; protected
    function GetServerName: string; override;
  public
    constructor Create; reintroduce;
    function Version: Integer; override;

    procedure NewWorkbook;
    procedure OpenWorkbook(const AFileName: string; const AReadOnly: Boolean);
    procedure SaveWorkbook;
    procedure SaveAsWorkbook(const ANewFileName: string);
    procedure CloseWorkbook;
    function ActiveWorkbook: OLEVariant;
    function ActiveSheet: OLEVariant;

    //Properties
    property WorkbookName: string read FWorkbookName write FWorkbookName;
  end;

implementation

uses
  IQMS.Web.MicrosoftApplication.Types,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  System.Win.ComObj,
  System.Win.Registry;

{ TMicrosoftExcelInterop }

constructor TMicrosoftExcelInterop.Create;
begin
  inherited Create;
  FVersion := -1;
end;

function TMicrosoftExcelInterop.GetServerName: string;
begin
  Result := IQMS.Web.MicrosoftApplication.Types.MICROSOFT_EXCEL_APPLICATION;
end;

function TMicrosoftExcelInterop.ActiveWorkbook: OLEVariant;
begin
  Result := Unassigned;
  if IsConnected then
    Result := Application.ActiveWorkbook;
end;

function TMicrosoftExcelInterop.ActiveSheet: OLEVariant;
begin
  Result := Unassigned;
  if IsConnected then
    Result := Application.ActiveSheet;
end;

procedure TMicrosoftExcelInterop.CloseWorkbook;
begin
  if IsConnected then
    Application.ActiveWorkbook.Close;
end;

procedure TMicrosoftExcelInterop.NewWorkbook;
begin
  if IsConnected then
    Application.NewWorkbook;
end;

procedure TMicrosoftExcelInterop.OpenWorkbook(const AFileName: string; const AReadOnly: Boolean);
begin
  if IsConnected then
    Application.Workbooks.Open(AFileName);
end;

procedure TMicrosoftExcelInterop.SaveAsWorkbook(const ANewFileName: string);
begin
  if IsConnected then
    Application.ActiveWorkbook.SaveAs(ANewFileName);
end;

procedure TMicrosoftExcelInterop.SaveWorkbook;
begin
  if IsConnected then
    Application.ActiveWorkbook.Save;
end;

function TMicrosoftExcelInterop.Version: Integer;
var
  AVersionString: string;
  i: Integer;
begin
  //Return last value if we have already read the Registry.
  Result := FVersion;

  if FVersion = -1 then
    try
      //Try to read the Registry, but do so in read-only mode
      try
        with TIQWebRegistry.CreateRO do
          try
            RootKey := HKEY_CLASSES_ROOT;
            if OpenKey('Excel.Application\CurVer', False) then
            begin
              AVersionString := ReadString('');
            end;
          finally
            Free;
          end;
      except
        on ERegistryException do
          FVersion := 0
        else
          raise;
      end;

      //If execution gets here, then this user has rights to read the
      //Registry.  Now, parse the string value.
      AVersionString := IQMS.Common.StringUtils.GetToken(AVersionString, '.', 3);
      if AVersionString > '' then
      begin
        if not TryStrToInt(AVersionString, FVersion) then
          FVersion := 0;
      end;
    finally
      Result := FVersion;
    end;
end;

end.
