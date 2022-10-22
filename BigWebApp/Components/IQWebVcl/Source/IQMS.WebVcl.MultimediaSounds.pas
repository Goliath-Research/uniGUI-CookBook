unit IQMS.WebVcl.MultimediaSounds;

interface

uses
  SysUtils, Classes, uniGUIBaseClasses, uniGUIClasses, uniGUITypes;

type
  TIQWebSound = class(TUniComponent)
  private
    FLoop         : Boolean;
    FVolume       : Integer;
    FBeepFileName : String;
    procedure SetVolume(const Value: Integer);
    { Private declarations }
  protected
    constructor Create(AOwner: TComponent); override;
    procedure WebCreate; override;
    procedure JSEventHandler(AEventName: string; AParams: TUniStrings); override;
    { Protected declarations }
  public
    { Public declarations }
  published
    property Loop         : boolean read FLoop         write FLoop;
    property Volume       : Integer read FVolume       write SetVolume;
    property BeepFileName : String  read FBeepFileName write FBeepFileName;
    procedure Play(AFileName : string);
    procedure Pause;
    procedure Resume;
    procedure Stop;
    procedure Beep;
    procedure IQPlaySoundFile(AFileName: String);
    { Published declarations }
  end;

implementation

{ TUniSound }

procedure TIQWebSound.Beep;
begin
  Play(BeepFileName);
end;

constructor TIQWebSound.Create(AOwner: TComponent);
begin
  inherited;
  Volume:=100;
  BeepFileName:='files/beep.wav';
end;

procedure TIQWebSound.IQPlaySoundFile(AFileName: String);
begin
  Play(AFileName);
end;

procedure TIQWebSound.JSEventHandler(AEventName: string; AParams: TUniStrings);
begin
  inherited;

end;

procedure TIQWebSound.Pause;
begin
  JSCallGlobal(Self.JSName+'sound.pause', []);
end;

procedure TIQWebSound.Play(AFileName : string);
begin
  JSCallGlobal(Self.JSName+'sound = new Howl', [
    JSObject(
      [
        'src', JSArray([AFileName]),
        'volume', Volume/100,
        'autoplay', True,
        'loop', Loop
      ]
    )
  ]);
end;

procedure TIQWebSound.Resume;
begin
  JSCallGlobal(Self.JSName+'sound.play', []);
end;

procedure TIQWebSound.SetVolume(const Value: Integer);
begin
 if Value<0 then
   FVolume:=0
 else if Value>100 then
   FVolume:=100
 else
   FVolume := Value;
end;

procedure TIQWebSound.Stop;
begin
  JSCallGlobal(Self.JSName+'sound.stop', []);
end;

procedure TIQWebSound.WebCreate;
begin
  inherited;
  JSComponent := TJSComponent.JSCreate('Object');
end;

initialization
  UniAddJSLibrary('/files/howler.js', True, [upoPlatformDesktop]);

end.
