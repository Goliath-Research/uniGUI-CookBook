unit IQMS.WebVcl.Time;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus,
  IQMS.WebVcl.Strings,
  uniListBox,
  IQMS.WebVcl.TimeForm,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu;


type
  TIQWebTiming = class;
  
  TIQWebTimeCargo = class
    FOwner  : TIQWebTiming;
    FStart  : TDateTime;
    FStop   : TDateTime; 
    FCounter: Real;
    FHits   : Real;
  public
    property Counter: Real read FCounter write FCounter;
    property Hits: Real read FHits write FHits;
    constructor Create( AOwner: TIQWebTiming );
  end;

  TIQWebTiming = class(TIQWebStrings)
  private
    { Private declarations }
    procedure FreeTimeCargo;
  protected
    { Protected declarations }
    function TimeCargoByName( const AName: string ): TIQWebTimeCargo;
  public
    { Public declarations }
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    procedure Clear;
    procedure Start( const AName: string );
    procedure Stop( const AName: string );
    procedure Display;
  published
    { Published declarations }
  end;

  { TIQWebTimeIt }
  TIQWebTimeIt = class
  private
    { Private declarations }
    FEndDate: TDateTime;
    FStartDate: TDateTime;
  public
    { Public declarations }
    constructor Create; reintroduce;
    constructor CreateStart(AStartDate: TDateTime);
    /// <summary> Set the start date and time.
    /// </summary>
    procedure Start;
    /// <summary> Set the stop date and time.
    /// </summary>
    procedure Stop; overload;
    procedure Stop(const AEndDate: TDateTime); overload;
    /// <summary> Get the elapsed date and time.
    /// </summary>
    function Elapsed: TDateTime;
    /// <summary> Get the elapsed date and time in short date/time format.
    /// </summary>
    function ShortDisplay: string;
    /// <summary> Get the elapsed date and time in long format.
    /// </summary>
    function LongDisplay: string;
    /// <summary> The start date and time.
    /// </summary>
    property StartDate: TDateTime read FStartDate write FStartDate;
    /// <summary> The end date and time.
    /// </summary>
    property EndDate: TDateTime read FEndDate;
  end;

implementation

uses
    IQMS.Common.Dates,
    IQMS.WebVcl.ResourceStrings;

{ TIQWebTimeCargo }
constructor TIQWebTimeCargo.Create( AOwner: TIQWebTiming );
begin
  FOwner  := AOwner;
  FCounter := 0;
  FHits   := 0;
end;   

{ TIQWebTiming }
constructor TIQWebTiming.Create(AOwner:TComponent); 
begin
  inherited;
end;

destructor TIQWebTiming.Destroy; 
begin
  FreeTimeCargo;
  inherited Destroy; 
end;

procedure TIQWebTiming.FreeTimeCargo;
var
  I:Integer;
begin
  for I := Items.Count - 1 downto 0 do
    if Assigned( TIQWebTimeCargo( Items.Objects[ I ] )) then 
       TIQWebTimeCargo( Items.Objects[ I ]).Free;
end;

procedure TIQWebTiming.Clear;
var
  I:Integer;
begin
  for I := 0 to Items.Count - 1 do with TIQWebTimeCargo( Items.Objects[ I ]) do
  begin
    Counter := 0;
    Hits   := 0;
  end;
end;  

function TIQWebTiming.TimeCargoByName( const AName: string ): TIQWebTimeCargo;
var
  I:Integer;
begin
  I := Items.IndexOf( AName );
  if I = -1 then
     I := Items.Add( AName );
  if not Assigned( TIQWebTimeCargo( Items.Objects[ I ] )) then 
     Items.Objects[ I ] := TIQWebTimeCargo.Create( self );
  Result := Items.Objects[ I ] as TIQWebTimeCargo;
end;

procedure TIQWebTiming.Start( const AName: string );
begin
  with TimeCargoByName( AName ) do
     FStart := Now;
end;

procedure TIQWebTiming.Stop( const AName: string );
var
  D: TDateTime;
begin
  D := Now;
  with TimeCargoByName( AName ) do
  begin
    FStop := D;
    if FStop >= FStart then
    begin
       FCounter := FCounter + (FStop - FStart)*86400;
       FHits   := FHits + 1;
    end;   
  end;   
end;

procedure TIQWebTiming.Display;
var
  AForm     : TTimeForm;
  I         : Integer;
begin
  AForm := TTimeForm.Create( uniGUIApplication.UniApplication );

  with AForm do
  begin
     Caption := IQMS.WebVcl.ResourceStrings.cTXT0000208; // 'Execution Timing'
     Width  := 600;

     File1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000209;
     SaveToTextFile1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000210; // '&Save to Text File'
     SaveToBitmapFile1.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000211; // '&Save to Bitmap File'


     for I := 0 to Items.Count - 1 do
       if Assigned( TIQWebTimeCargo( Items.Objects[ I ] )) then with TIQWebTimeCargo( Items.Objects[ I ]) do
          AList.Items.Add(Format('%-40s - %12.4f sec, %9.0f ' + IQMS.WebVcl.ResourceStrings.cTXT0000212 {'hits'}, [ Items[ I ], Counter, Hits ]));


     ShowModal;
  end;
end;


{$REGION 'TIQWebTimeIt'}

{ TIQWebTimeIt }

constructor TIQWebTimeIt.Create;
begin
  inherited Create;
  FStartDate := Now();
  FEndDate := Now();
end;

constructor TIQWebTimeIt.CreateStart(AStartDate: TDateTime);
begin
  inherited Create;
  FStartDate := AStartDate;
  FEndDate := AStartDate;
end;

procedure TIQWebTimeIt.Start;
begin
  StartDate := Now();
end;

procedure TIQWebTimeIt.Stop;
begin
  FEndDate := Now();
end;

procedure TIQWebTimeIt.Stop(const AEndDate: TDateTime);
begin
  FEndDate := AEndDate;
end;

function TIQWebTimeIt.Elapsed: TDateTime;
begin
  Result := FEndDate - FStartDate;
end;

function TIQWebTimeIt.ShortDisplay: string;
begin
  if Trunc(Elapsed) = 1 then
    Result := FormatDateTime('''1 day'', hh:mm:ss:zzz', Elapsed)
  else if Trunc(Elapsed) > 1 then
    Result := FormatDateTime(Format('%d ''days'', hh:mm:ss:zzz',
      [Trunc(Elapsed)]), Elapsed)
  else
    Result := FormatDateTime('hh:mm:ss:zzz', Elapsed);
end;

function TIQWebTimeIt.LongDisplay: string;
begin
  IQMS.Common.Dates.GetDurationLongDisplay(Elapsed, { var } Result);
end;

{$ENDREGION 'TIQWebTimeIt'}

end.
