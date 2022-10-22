unit IQMS.Common.MultimediaSounds;

{ IQMS audio multimedia methods }

interface

uses
  MMSystem,
  System.Classes,
  System.SysUtils,
  Vcl.Forms,
  Winapi.Windows;

type
  TVolumeLevel = 0 .. 127;

procedure IQPlaySoundFile(AFileName: String); // Async/Non-Blocking
procedure IQPlaySoundFileNonAsync(AFileName: String); // Blocking
procedure IQPlayBeep(AFrequency, ADuration: Integer; AVolume: TVolumeLevel);
procedure IQPlayTone(AFrequency, ADuration: Integer; AVolume: TVolumeLevel);

type
  { TMIDIInstrument }
  TMIDIInstrument = (midiAcousticGrandPiano, midiBrightAcousticPiano,
    midiElectricGrandPiano, midiHonkyTonkPiano,
    midiRhodesPiano, midiChorusedPiano, midiHarpsichord,
    midiClavinet, midiCelesta, midiGlockenspiel,
    midiMusicBox, midiVibraphone, midiMarimba, midiXylophone,
    midiTubularBells, midiDulcimer, midiHammondOrgan,
    midiPercussiveOrgan, midiRockOrgan, midiChurchOrgan,
    midiReedOrgan, midiAccordion, midiHarmonica,
    midiTangoAccordion, midiAcousticGuitarNylon,
    midiAcousticGuitarSteel, midiElectricGuitarJazz,
    midiElectricGuitarClean, midiElectricGuitarMuted,
    midiOverdrivenGuitar, midiDistortionGuitar,
    midiGuitarHarmonics, midiAcousticBass, midiElectricBassFinger,
    midiElectricBassPick, midiFretlessBass, midiSlapBass1,
    midiSlapBass2, midiSynthBass1, midiSynthBass2, midiViolin,
    midiViola, midiCello, midiContrabass, midiTremoloStrings,
    midiPizzicatoStrings, midiOrchestralHarp, midiTimpani,
    midiStringEnsemble1, midiStringEnsemble2, midiSynthStrings1,
    midiSynthStrings2, midiChoirAahs, midiVoiceOohs,
    midiSynthVoice, midiOrchestraHit, midiTrumpet, midiTrombone,
    midiTuba, midiMutedTrumpet, midiFrenchHorn, midiBrassSection,
    midiSynthBrass1, midiSynthBrass2, midiSopranoSax, midiAltoSax,
    midiTenorSax, midiBaritoneSax, midiOboe, midiEnglishHorn,
    midiBassoon, midiClarinet, midiPiccolo, midiFlute,
    midiRecorder, midiPanFlute, midiBottleBlow, midiShakuhachi,
    midiWhistle, midiOcarina, midiLead1Square,
    midiLead2Sawtooth, midiLead3CalliopeLead, midiLead4ChiffLead,
    midiLead5Charang, midiLead6Voice, midiLead7Fifths,
    midiLead8BrassLead, midiPad1NewAge, midiPad2Warm,
    midiPad3Polysynth, midiPad4Choir, midiPad5Bowed,
    midiPad6Metallic, midiPad7Halo, midiPad8Sweep, midiEmpty0,
    midiEmpty1, midiEmpty2, midiEmpty3, midiEmpty4, midiEmpty5,
    midiEmpty6, midiEmpty7, midiEmpty8, midiEmpty9, midiEmpty10,
    midiEmpty11, midiEmpty12, midiEmpty13, midiEmpty14,
    midiEmpty15, midiEmpty16, midiEmpty17, midiEmpty18,
    midiEmpty19, midiEmpty20, midiEmpty21, midiEmpty22,
    midiEmpty23, midiGuitarFretNoise, midiBreathNoise,
    midiSeashore, midiBirdTweet, midiTelephoneRing,
    midiHelicopter, midiApplause, midiGunshot);

  { TMidiPlayer }
  TMidiPlayer = class(TComponent)
  strict private
    { Private declarations }
    FDuration: Integer;
    FTone: Integer;
    FVolume: TVolumeLevel;
    FPlaying: Boolean;
    FMidi: Integer;
    function MIDIEncodeMessage(Msg, Param1, Param2: Byte): Integer;
  private
    FInstrument: TMIDIInstrument;
    procedure SetInstrument(const Value: TMIDIInstrument);
  published
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Play; overload;
    procedure Play(ATone, ADuration: Integer; AVolume: TVolumeLevel); overload;
    procedure Play(ATones: array of Integer; ADuration: Integer;
      AVolume: TVolumeLevel); overload;
    property Playing: Boolean read FPlaying;
  published
    { Published declarations }
    property Tone: Integer read FTone write FTone;
    property Volume: TVolumeLevel read FVolume write FVolume;
    property Duration: Integer read FDuration write FDuration;
    property Instrument: TMIDIInstrument read FInstrument write SetInstrument;
  end;

implementation

const
  MIDI_NOTE_ON = $90;
  MIDI_NOTE_OFF = $80;
  MIDI_CHANGE_INSTRUMENT = $C0;
  MIDI_PITCH_BEND = $E0;

  // This will NOT block while the sound plays
procedure IQPlaySoundFile(AFileName: String);
begin
  if FileExists(AFileName) then
    try
      PlaySound(PChar(AFileName), 0, SND_FILENAME + SND_ASYNC);
    except
    end;
end;

// This will block while the sound plays
procedure IQPlaySoundFileNonAsync(AFileName: String);
begin
  if FileExists(AFileName) then
    try
      PlaySound(PChar(AFileName), 0, SND_FILENAME);
    except
    end;
end;

procedure IQPlayBeep(AFrequency, ADuration: Integer; AVolume: TVolumeLevel);
var
  AWaveFormatEx: TWaveFormatEx;
  AMemStream: TMemoryStream;
  i, ATempInt, ADataCount, ARiffCount: Integer;
  ASoundValue: Byte;
  ATempDouble: Double; // omega ( 2 * pi * AFrequency)
const
  Mono: Word = $0001;
  SampleRate: Integer = 11025; // 8000, 11025, 22050, or 44100
  RiffId: AnsiString = 'RIFF';
  WaveId: AnsiString = 'WAVE';
  FmtId: AnsiString = 'fmt ';
  DataId: AnsiString = 'data';
begin
  if AFrequency > (0.6 * SampleRate) then
    Exit;

  with AWaveFormatEx do
    begin
      wFormatTag := WAVE_FORMAT_PCM;
      nChannels := Mono;
      nSamplesPerSec := SampleRate;
      wBitsPerSample := $0008;
      nBlockAlign := (nChannels * wBitsPerSample) div 8;
      nAvgBytesPerSec := nSamplesPerSec * nBlockAlign;
      cbSize := 0;
    end;

  AMemStream := TMemoryStream.Create;

  with AMemStream do
    begin
      // Calculate length of sound data and of file data
      ADataCount := (ADuration * SampleRate) div 1000; // sound data
      ARiffCount := Length(WaveId) + Length(FmtId) + SizeOf(DWORD) +
        SizeOf(TWaveFormatEx) + Length(DataId) + SizeOf(DWORD) + ADataCount;
      // file data
      // Write wave header
      Write(RiffId[1], 4); // 'RIFF'
      Write(ARiffCount, SizeOf(DWORD)); // file data size
      Write(WaveId[1], Length(WaveId)); // 'WAVE'
      Write(FmtId[1], Length(FmtId)); // 'fmt '
      ATempInt := SizeOf(TWaveFormatEx);
      Write(ATempInt, SizeOf(DWORD)); // TWaveFormat data size
      Write(AWaveFormatEx, SizeOf(TWaveFormatEx)); // AWaveFormatEx record
      Write(DataId[1], Length(DataId)); // 'data'
      Write(ADataCount, SizeOf(DWORD)); // sound data size
      // Calculate and write out the tone signal
      ATempDouble := 2 * Pi * AFrequency; // omega
      for i := 0 to ADataCount - 1 do
        begin
          ASoundValue := 127 +
            trunc(AVolume * sin(i * ATempDouble / SampleRate));
          // wt = ATempDouble * i / SampleRate
          Write(ASoundValue, SizeOf(Byte));
        end;
      // Play sound
      sndPlaySound(AMemStream.Memory, SND_MEMORY or SND_SYNC);
      AMemStream.Free;
    end;
end;

procedure IQPlayTone(AFrequency, ADuration: Integer; AVolume: TVolumeLevel);
begin
  with TMidiPlayer.Create(nil) do
    try
      Play(AFrequency, ADuration, AVolume);
    finally
      Free;
    end;
end;

{$REGION 'TMidiPlayer'}

{ TMidiPlayer }

constructor TMidiPlayer.Create(AOwner: TComponent);
const
  DefaultInstrument: TMIDIInstrument = midiMarimba;
  // midiVibraphone - has a 70s, hospital sound
  // midiMarimba (good)
  // midiTubularBells - sounds like an old clock
  // midiPad1NewAge - sounds like a door bell
begin
  inherited Create(AOwner);
  FPlaying := False;
  FInstrument := DefaultInstrument;
  MMSystem.midiOutOpen(@FMidi, 0, 0, 0, CALLBACK_NULL);
  SetInstrument(DefaultInstrument);
end;

destructor TMidiPlayer.Destroy;
begin
  MMSystem.midiOutClose(FMidi);
  inherited Destroy;
end;

function TMidiPlayer.MIDIEncodeMessage(Msg, Param1, Param2: Byte): Integer;
begin
  Result := Msg + (Param1 shl 8) + (Param2 shl 16);
end;

procedure TMidiPlayer.Play;
begin
  Play(FTone, FDuration, FVolume);
end;

procedure TMidiPlayer.Play(ATone, ADuration: Integer; AVolume: TVolumeLevel);
begin
  if not FPlaying then
    try
      MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_PITCH_BEND,
        Lo(ATone), Hi(ATone)));
      MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_NOTE_ON, ATone,
        AVolume));
      FPlaying := True;
      Sleep(ADuration);
    finally
      MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_NOTE_OFF, ATone,
        AVolume));
      FPlaying := False;
    end;
end;

procedure TMidiPlayer.Play(ATones: array of Integer; ADuration: Integer;
  AVolume: TVolumeLevel);
var
  i: Integer;
begin
  if not FPlaying then
    try
      for i := 0 to High(ATones) do
        begin
          MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_PITCH_BEND,
            Lo(ATones[i]), Hi(ATones[i])));
          MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_NOTE_ON,
            ATones[i], AVolume));
        end;
      FPlaying := True;
      Application.ProcessMessages;
      Sleep(ADuration);
    finally
      for i := 0 to High(ATones) do
        MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_NOTE_OFF,
          ATones[i], AVolume));
      FPlaying := False;
    end;
end;

procedure TMidiPlayer.SetInstrument(const Value: TMIDIInstrument);
begin
  FInstrument := Value;
  MMSystem.midiOutShortMsg(FMidi, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT,
    Ord(FInstrument), 0));
end;

{$ENDREGION 'TMidiPlayer'}

end.
