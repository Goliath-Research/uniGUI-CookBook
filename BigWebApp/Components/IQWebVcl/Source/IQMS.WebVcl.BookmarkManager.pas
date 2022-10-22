unit IQMS.WebVcl.BookmarkManager;

interface

uses
  Classes, Generics.Collections, Spring.Collections, SysUtils, IQMS.Common.Regfrm,
  IQMS.Common.JumpDispatcher;

type
  TIQWebBookmarkItem = class
  private
    FFormClassName: string;
    FRecordId:      integer;
    FCaption:       string;
  public
    constructor Create(BookmarkString: string); reintroduce; virtual;
    property Caption:       string  read FCaption       write FCaption;
    property FormClassName: string  read FFormClassName write FFormClassName;
    property RecordId:      integer read FRecordId      write FRecordId;
  end;

  TIQWebBookmarkList = IList<TIQWebBookmarkItem>;

  TIQWebBookmarkManager = class
  private
    FFavorites: TIQWebBookmarkList;
    FHistory:  TIQWebBookmarkList;
  public
    constructor Create; reintroduce; virtual;
    procedure LoadBookmarks;

    procedure BookmarkClick(Sender: TObject);

    property Favorites: TIQWebBookmarkList read FFavorites;
    property History: TIQWebBookmarkList read FHistory;
  end;

implementation

{ TIQWebBookmarkItem }

constructor TIQWebBookmarkItem.Create(BookmarkString: string);
var
  Tokens: TStringList;
begin
  Tokens := TStringList.Create;
  with Tokens do
  try
    Delimiter       := #9;
    StrictDelimiter := True;
    DelimitedText   := BookmarkString;
    Caption         := Format('%s %s', [Strings[2], Strings[3]]);
    FormClassName   := Strings[0];
    RecordId        := StrToInt(Strings[1]);
  finally
    Free;
  end;
end;

{ TIQWebBookmarkManager }

procedure TIQWebBookmarkManager.BookmarkClick(Sender: TObject);
  function _FormClassNameToJumpId(const AModuleName : string) : integer;
  begin
    //convert FormClassName to integer
    Result := 1;
  end;
begin
  with TIQWebBookmarkItem(TComponent(Sender).Tag) do
    // TODO -oUXCoreTeam -cDeepLinks: TIQWebJumpDispatcher.Jump either needs to take a string argument of have some translation matrix both bookmarks and jumps can use
    TIQWebJumpDispatcher.Jump(_FormClassNameToJumpId(FormClassName), RecordId);
end;

constructor TIQWebBookmarkManager.Create;
begin
  inherited Create;

  FFavorites := TCollections.CreateList<TIQWebBookmarkItem>(True);
  FHistory   := TCollections.CreateList<TIQWebBookmarkItem>(True);
end;

procedure TIQWebBookmarkManager.LoadBookmarks;
var
  i: integer;
  BookMarkStrings: TStringList;
begin
  FHistory.Clear;
  FFavorites.Clear;

  BookMarkStrings := TStringList.Create;
  try
    // get the bookmark list from the registry thingy
    IQRegMRURead(TWebIQBookmarkType.History, BookMarkStrings);
    for I := BookMarkStrings.Count - 1 downto 0 do
      FHistory.Add(TIQWebBookmarkItem.Create(BookMarkStrings[i]));

    BookMarkStrings.Clear;

    IQRegMRURead(TWebIQBookmarkType.Favorites, BookMarkStrings);
    for I := BookMarkStrings.Count - 1 downto 0 do
      FFavorites.Add(TIQWebBookmarkItem.Create(BookMarkStrings[i]));
  finally
    BookMarkStrings.Free;
  end;
end;

end.
