{developed based on Delphi C:\program files\borland\delphi7\source\rtl\common\IniFiles.pas}
unit IQMS.Common.HHPFiles;

interface

uses
  System.SysUtils,
  System.Classes;

type
  THHP_File = class(TObject)
  private
    FFileName: string;
    FSections: TStringList;
    function AddSection(const Section: string): TStrings;
    procedure SetStrings(List: TStrings);
  public
    constructor Create(FileName: string);
    destructor Destroy; override;
    procedure Clear;
    procedure LoadValues;
    property FileName: string read FFileName;
    procedure ReadSection(const Section: string; Strings: TStrings);  // not used
    function ContextToHtm( AContextID: string ): string;
  end;

  THHP_List = class(TObject)
  private
    FFiles: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    procedure CheckAddFile( AFileName: string );
    function ContextToHtm( AFileName, AContextID: string ): string;
    property Files: TStringList read FFiles;
  end;

implementation

{ THHP_File }

uses
  IniFiles,
  IQMS.Common.StringUtils;

constructor THHP_File.Create(FileName: string);
begin
  FFileName:= FileName;
  FSections := TStringList.Create;
  LoadValues;
end;

destructor THHP_File.Destroy;
begin
  if FSections <> nil then
    Clear;
  FSections.Free;
  inherited Destroy;
end;

procedure THHP_File.Clear;
var
  I: Integer;
begin
  for I := 0 to FSections.Count - 1 do
    TObject(FSections.Objects[I]).Free;
  FSections.Clear;
end;

function THHP_File.AddSection(const Section: string): TStrings;
begin
  Result:= THashedStringList.Create;
  try
    THashedStringList(Result).CaseSensitive:= FALSE;
    FSections.AddObject(Section, Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure THHP_File.LoadValues;
var
  List: TStringList;
begin
  if (FileName <> '') and FileExists(FileName) then
  begin
    List := TStringList.Create;
    try
      List.LoadFromFile(FileName);
      SetStrings(List);
    finally
      List.Free;
    end;
  end
  else
    Clear;
end;

procedure THHP_File.SetStrings(List: TStrings);
var
  I: Integer;
  S: string;
  Strings: TStrings;

  procedure AddConnectionDef(S: string);
  var
    I, J: Integer;
  begin
    // example: O108=108.htm ;EnterpriseIQ
    I:= Pos('=', S);
    J:= Pos('.htm', S);
    // remove spaces before and after '='
    if (I > 0) and (J > 0) then
       Strings.Add(Trim(Copy(S, 1, I-1)) + '=' + Trim(Copy(S, I+1, J-I+3)));
  end;

  procedure AddMapping(S: string);
  var
    I, J: Integer;
  begin
    // example: #define O12168 5000433  ;JobShop
    I:= Pos('#define', S);
    if I = 0 then
       EXIT;
    S:= Copy( S, I+8, MaxInt ); // O12168 5000433  ;JobShop
    I:= Pos(' ', S);
    J:= Pos(';', S);
    // make it 5000433=O12168
    if (I > 0) and (J > 0) then
       Strings.Add( Trim(Copy(S, I+1, J-I-1)) + '=' + Trim(Copy(S, 1, I-1)) );
  end;

begin
  Clear;
  Strings := nil;
  for I := 0 to List.Count - 1 do
  begin
    S:= Trim(List[I]);

    if (S = '') or (S[1] = ';') then
       Continue

    else if (S[1] = '[') and (S[Length(S)] = ']') then
       begin
         Delete(S, 1, 1);
         SetLength(S, Length(S)-1);
         if StrInList( S, [ 'ALIAS', 'MAP' ]) then
            Strings:= AddSection(Trim(S))
         else
            Strings:= nil
       end

    else if Strings = nil then
       Continue

    else
       begin
         if CompareText(FSections[ FSections.Count - 1 ], 'ALIAS') = 0 then
            AddConnectionDef( S )

         else if CompareText(FSections[ FSections.Count - 1 ], 'MAP') = 0 then
            AddMapping( S );
       end;
  end;
end;

procedure THHP_File.ReadSection(const Section: string; Strings: TStrings);
var
  I, J: Integer;
  SectionStrings: TStrings;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    I := FSections.IndexOf(Section);
    if I >= 0 then
    begin
      SectionStrings := TStrings(FSections.Objects[I]);
      for J := 0 to SectionStrings.Count - 1 do
        Strings.Add(SectionStrings[ J ]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

function THHP_File.ContextToHtm( AContextID: string ): string;
var
  I: Integer;
  AObjectID:string;
  Strings: TStrings;
begin
  Result:= '';
  I:= FSections.IndexOf('MAP');
  if I < 0 then
     EXIT;

  // based on context get the object id
  with TStrings(FSections.Objects[ I ]) do AObjectID:= Values[ AContextID ];
  if AObjectID = '' then
     EXIT;

  I:= FSections.IndexOf('ALIAS');
  if I < 0 then
     EXIT;

  // based on object id find the htm file name
  with TStrings(FSections.Objects[ I ]) do Result:= Values[ AObjectID ];
end;


{ THHP_List }

constructor THHP_List.Create;
begin
  inherited;
  FFiles:= TStringList.Create;
end;

destructor THHP_List.Destroy;
begin
  if FFiles <> nil then
     Clear;
  FFiles.Free;
  inherited;
end;

procedure THHP_List.Clear;
var
  I: Integer;
begin
  for I:= 0 to FFiles.Count - 1 do
    THHP_File(FFiles.Objects[I]).Free;
  FFiles.Clear;
end;

procedure THHP_List.CheckAddFile(AFileName: string);
begin
  if not FileExists(AFileName) then
     EXIT;

  if FFiles.IndexOf( AFileName ) > -1 then
     EXIT;

  FFiles.AddObject( AFileName,
                    THHP_File.Create( AFileName ));
end;

function THHP_List.ContextToHtm( AFileName, AContextID: string): string;
var
  I: Integer;
begin
  Result:= '';
  I:= FFiles.IndexOf( AFileName );
  if I < 0 then
     EXIT;

  Result:= THHP_File( FFiles.Objects[ I ]).ContextToHtm( AContextID );
end;

end.

