unit IQMS.WebVcl.Animator;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,   uniGUIApplication,
  Dialogs,
  StdCtrls,UniCanvas, uniImageList, uniTimer,
  ExtCtrls; //, WinTypes, WinProcs;

type
  TIQWebAnimator = class(TUniCanvas)
  private
    { Private declarations }
    FImageList   : TUniImageList;
    FImageIndex  : Integer;
    FAutoSize    : Boolean;
    FTimer       : TUniTimer;
    procedure SetImageIndex( AValue: Integer );
    function GetInterval: Integer;
    procedure SetInterval( AValue: Integer );
    procedure AdvanceToNextFrame( Sender: TObject );
    function GetActive: Boolean;
    procedure SetActive(AValue: Boolean);
  protected
    { Protected declarations }
    // procedure Paint; override;
    procedure PaintImage(Sender: TObject);
    
  public
    { Public declarations }
    property ImageList: TUniImageList read FImageList;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Go;
    procedure Stop;
    procedure LoadFromResource(AInstance: THandle; const ResName: array of string);
    procedure ResizeImageList(X,Y: Integer);
  published
    { Published declarations }
    property AutoSize: Boolean read FAutoSize write FAutoSize;
    property Interval: Integer read GetInterval write SetInterval;
    property Active: Boolean read GetActive write SetActive;
  end;

implementation
uses
  uniGUIBaseClasses,
  uniGUIClasses;
constructor TIQWebAnimator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 16;
  Height:= 16;

//  onpaint:= PaintImage;

  FImageIndex:= 0;

  {Image List}
  FImageList:= TUniImageList.Create(uniGUIApplication.UniApplication);

  {Internal Timer}
  FTimer:= TUniTimer.Create(self);
  with FTimer do
  begin
    Enabled := FALSE;
    Interval:= 500;
    OnTimer := AdvanceToNextFrame;
  end;
end;

destructor TIQWebAnimator.Destroy;
begin
  FTimer.Free;
  FImageList.Free;
  inherited Destroy;
end;

procedure TIQWebAnimator.Go;
begin
  //if ImageList.Count > 0 then
  //   ImageIndex:= Random( ImageList.Count );
  FTimer.Enabled:= TRUE;
end;

procedure TIQWebAnimator.Stop;
begin
  FTimer.Enabled:= FALSE;
  ImageIndex:= 0;
  Paint;
end;

function TIQWebAnimator.GetActive: Boolean;
begin
  Result:= FTimer.Enabled;
end;

procedure TIQWebAnimator.SetActive(AValue: Boolean);
begin
  if AValue then
     Go
  else
     Stop;
end;

procedure TIQWebAnimator.ResizeImageList(X,Y: Integer);
begin
  {Stop Internal Timer}
  Stop;

  {Reassign ImageList}
  if Assigned(FImageList) then
     FImageList.Free;
  FImageList:= TUniImageList.Create(uniGUIApplication.UniApplication);
  FImageList.Width:=X;
  FImageList.Height:=Y;
  
  FImageIndex:= 0;

  {Adjust PaintBox}
  if AutoSize then
  begin
    //if Width < X then
       Width:= X;
    //if Height < Y then
       Height:= Y;
  end;
end;

procedure TIQWebAnimator.SetImageIndex( AValue: Integer );
begin
  if (FImageIndex <> AValue) and (AValue <= FImageList.Count - 1) then
     FImageIndex:= AValue;
end;

procedure TIQWebAnimator.AdvanceToNextFrame( Sender: TObject );
begin
  Inc(FImageIndex);
  if FImageIndex >= FImageList.Count then
    FImageIndex:= 0;
  Paint;
end;

// procedure TIQAnimator.Paint;
// begin
//   inherited Paint;
//   if FImageList.Count > 0 then
//      FImageList.Draw( Canvas, 0, 0, FImageIndex );
// end;

procedure TIQWebAnimator.PaintImage(Sender: TObject);
begin
//  TIQWebAnimator.FillRect(TIQWebAnimator.ClipRect);

//  if FImageList.Count > 0 then
//     FImageList.Draw( TIQWebAnimator, 0, 0, FImageIndex );
end;

function TIQWebAnimator.GetInterval: Integer;
begin
  Result:= FTimer.Interval;
end;

procedure TIQWebAnimator.SetInterval( AValue: Integer );
begin
  FTimer.Interval:= AValue;
end;

procedure TIQWebAnimator.LoadFromResource( AInstance: THandle; const ResName: array of string);
(* Usage: load images contained in a RES file into the ImageList.

   // Include RES file that contains images we want to animate in the USES. Note RES file must match the unit name
   uses MyUnitName.res;

   // Call LoadFromResource as following:
   IQAnimator1.LoadFromResource( HInstance, [ 'IMAGE1', 'IMAGE2', 'IMAGE3']);
*)
var
  ABmp: TBitmap;
  I   : Integer;
begin
  ABmp:= TBitmap.Create;
  try
    for I:= 0 to High(ResName) do
    begin
      ABmp.LoadFromResourceName( AInstance, ResName[ I ]);  {Load into temp BMP}
      if I = 0 then                                         {Resize ImageList on first BMP}
         ResizeImageList( ABmp.Width, ABmp.Height );
      // ImageList.Add( ABmp, nil);                         {Add to the Image list}
      ImageList.AddMasked( ABmp, clFuchsia );               {Add to the Image list}
    end;
  finally
    ABmp.Free;
  end;
end;



end.
