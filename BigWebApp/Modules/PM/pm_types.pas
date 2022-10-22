unit pm_types;

interface

uses
  Winapi.Windows;

type
  { TPMWOFilterType }
  TPMWOFilterType = (wfNone, wfOpen, wfClosed, wfAssociated);

  { TPM_WO_Filter }
  TPM_WO_Filter = class(TObject)
  private
    { Private declarations }
    FDetailFilter: TPMWOFilterType;
    FHeaderFilter: TPMWOFilterType;
    FAssociated_ID: Int64;
  public
    { Public declarations }
    constructor Create; reintroduce;
    procedure Reset;
    procedure CopyFrom(const AFilter: TPM_WO_Filter);
    procedure SaveToRegistry;
    procedure LoadFromRegistry;

    { Properties }
    property DetailFilter: TPMWOFilterType read FDetailFilter
      write FDetailFilter;
    property HeaderFilter: TPMWOFilterType read FHeaderFilter
      write FHeaderFilter;
    property Associated_ID: Int64 read FAssociated_ID write FAssociated_ID;
  end;

  { TPMCapacityView }
  TPMCapacityView = (cwMonthly, cwWeekly, cwDaily);

  { TMiscTaskRecord }
  TMiscTaskRecord = packed record
    EquipmentID: Int64;
    HoursForTask: Real;
    PeopleToPerformTask: Real;
    Department: string;
    Status: string;
    Priority: string;
    EmployeeID: Int64;
    EmployeeUserName: string;
    EmployeeDisplayName: string;
    WorkOrderTypeName: string;
    WorkOrderTypeID: Int64;
    CodeID: Int64;
    Text: string;
  end;

implementation

uses
  IQMS.Common.Registry;

{$REGION 'TPM_WO_Filter' }


const
  // HKEY_CURRENT_USER
  C_REG_FILTER_PATH = '\Software\IQMS\IQWin32\IQPM.exe\PM_WO_Filter';

  { TPM_WO_Filter }

constructor TPM_WO_Filter.Create;
begin
  inherited Create;
  Reset;
end;

procedure TPM_WO_Filter.Reset;
begin
  FDetailFilter := TPMWOFilterType(0);
  FHeaderFilter := TPMWOFilterType(0);
  FAssociated_ID := 0;
end;

procedure TPM_WO_Filter.CopyFrom(const AFilter: TPM_WO_Filter);
begin
  if Assigned(AFilter) then
    begin
      FDetailFilter := AFilter.DetailFilter;
      FHeaderFilter := AFilter.HeaderFilter;
      FAssociated_ID := AFilter.Associated_ID;
    end;
end;

procedure TPM_WO_Filter.SaveToRegistry;
begin
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(C_REG_FILTER_PATH, True) then
        begin
          WriteInteger('DetailFilter', Ord(DetailFilter));
          WriteInteger('HeaderFilter', Ord(HeaderFilter));
          WriteInteger('Associated_ID', Associated_ID);
        end;
    finally
      Free;
    end;
end;

procedure TPM_WO_Filter.LoadFromRegistry;
var
  // Registry object used by nested functions below
  reg: TIQWebRegistry;

  function _ReadFilterType(const AKey: String): TPMWOFilterType;
  var
    o: TPMWOFilterType;
    i: Integer;
  begin
    // Initialize to 0 since the result is used for types
    Result := TPMWOFilterType(0);
    i := 0;
    // Validation
    if not Assigned(reg) then
      Exit;
    // Get value
    if reg.ValueExists(AKey) then
      i := reg.ReadInteger(AKey);
    // Pass type if within bounds
    if (i in [Ord(Low(o)) .. Ord(High(o))]) then
      Result := TPMWOFilterType(i);
  end;

begin
  // Initialization
  reg := NIL;

  // Clear the filter
  Reset;

  // Load Registry values
  try
    reg := TIQWebRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;

    if reg.OpenKey(C_REG_FILTER_PATH, False) then
      begin
        DetailFilter := _ReadFilterType('DetailFilter');
        HeaderFilter := _ReadFilterType('HeaderFilter');
        Associated_ID := reg.ReadInteger('Associated_ID');
      end;
  finally
    reg.Free;
  end;
end;

{$ENDREGION 'TPM_WO_Filter' }

end.
