unit IQMS.Common.BrowsDir;
{
To use this directory browser:

   1.  Declare the IQDir unit in the uses clause.
   2.  Call the wrapper (contained in Iqdir.pas), DirBrowse().  Pass the appropriate values.

This browser works like the standard Windows directory browser, but also accomodates
network paths.
}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Winapi.ShlObj, Vcl.Forms;

type

  TBrowseFlag = (bfComputersOnly, bfPrintersOnly, bfDirsOnly, bfStatusText);
  TBrowseFlags = set of TBrowseFlag;

  {AEnabledOK :
              0  : Disables the OK button
              1  : Enables the OK button
              -1 : No change
  }
  TDirectoryChangeEvent = procedure ( const ADirectory: string;
                                   var AEnabledOK : integer;
                                   var AStatusText : string) of object;

  TIQWebDirectoryBrowser = class (TComponent)
  private
    FTitle : string;
    FBrowseFlags : TBrowseFlags;
    FDirectory: string;
    FOwnerHandle : HWND;
    FOnChangeDirectory: TDirectoryChangeEvent;
    procedure SetDirectory(const AValue: string);
    procedure SetOnChangeDirectory(const AValue: TDirectoryChangeEvent);
  protected
  public
    constructor Create( AOwner : TComponent ); override;
    function Execute: boolean;
  published
    property BrowseFlags : TBrowseFlags read FBrowseFlags write FBrowseFlags;
    property Directory : string read FDirectory write SetDirectory;
    property Title : string read FTitle write FTitle;
    property OnChangeDirectory : TDirectoryChangeEvent read FOnChangeDirectory write SetOnChangeDirectory;
  end;


function DirectoryCallBack( Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM ): Integer stdcall;

implementation

uses
  IQMS.Common.ResStrings;

var
  CurrentOpenedDirectory : string;
  CurrentEventHandler    : TDirectoryChangeEvent;


function DirectoryCallBack(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer stdcall;
var
  A                       : array[0..MAX_PATH] of Char;
  EnabledOK               : integer;
  StatusText, Directory   : string;
begin
  Result := 0;

  if uMsg = BFFM_INITIALIZED then
     begin
          StrPCopy( A, CurrentOpenedDirectory );
          SendMessage( Wnd, BFFM_SETSELECTION, 1, Integer(@A[0]));
          Exit;
     end;

  if uMsg = BFFM_SELCHANGED then
     begin
          EnabledOK         :=-1;
          StatusText        :='';
          SHGetPathFromIDList( Pointer( lParam ), A );
          Directory         :=StrPas(a);
          if Assigned( CurrentEventHandler ) and
             ( Directory <> '' ) then
             CurrentEventHandler( Directory, EnabledOK, StatusText );
          if EnabledOK <> -1 then
             SendMessage( Wnd, BFFM_ENABLEOK, EnabledOK, EnabledOK );
          if StatusText <> '' then
             SendMessage( Wnd, BFFM_SETSTATUSTEXT, EnabledOK,
                          Integer(PChar(StatusText )));
     end;
end;

{TDirectoryBrowser}
constructor TIQWebDirectoryBrowser.Create( AOwner : TComponent );
begin

  inherited Create( AOwner );

  FOwnerHandle             := Application.Handle;
  FTitle                   := IQMS.Common.ResStrings.cTXT0000002; // 'Select Directory'
  FBrowseFlags             := [];
  FDirectory               := '';

end;

function TIQWebDirectoryBrowser.Execute: boolean;
var
   BrowseInfo       : TBrowseInfoW;
   A                : array[0..MAX_PATH] of Char;
   B                : PChar;
   AIDList          : PItemIDList;
begin
     b := StrAlloc( Length( FTitle ) + 1 );
     try
        StrPCopy( B, FTitle );
        {Create and display the browser form}
        BrowseInfo.hwndOwner          := FOwnerHandle;
        BrowseInfo.pszDisplayName     := @A[0];
        BrowseInfo.lpszTitle          := B;
        BrowseInfo.ulFlags            := BIF_BROWSEFORCOMPUTER * Byte( bfComputersOnly in BrowseFlags ) +
                                         BIF_BROWSEFORPRINTER  * Byte( bfPrintersOnly  in BrowseFlags ) +
                                         BIF_RETURNONLYFSDIRS  * Byte( bfDirsOnly      in BrowseFlags ) +
                                         BIF_STATUSTEXT        * Byte( bfStatusText    in BrowseFlags );
        BrowseInfo.lpfn               := DirectoryCallBack;
        BrowseInfo.lParam             := 0;
        BrowseInfo.pidlRoot           := NIL;

        CurrentOpenedDirectory        := FDirectory;
        CurrentEventHandler           := FOnChangeDirectory;

        AIDList                       := SHBrowseForFolder( BrowseInfo );

        if AIDList <> NIL then
           begin
                SHGetPathFromIDList( AIDList, A );
                FDirectory           := StrPas( A );
                Result               := TRUE;
           end
        else Result := FALSE;
     finally
        StrDispose( B );
     end;
end;

procedure TIQWebDirectoryBrowser.SetDirectory( const AValue: String );
begin
     FDirectory := AValue;
end;

procedure TIQWebDirectoryBrowser.SetOnChangeDirectory( const AValue: TDirectoryChangeEvent);
begin
     FOnChangeDirectory := AValue;
end;

initialization
  CurrentOpenedDirectory       := '';
  CurrentEventHandler          := NIL;

end.
