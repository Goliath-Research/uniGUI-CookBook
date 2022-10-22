unit IQMS.Common.Screen;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Controls, UniDBNavigator, uniCommonClasses,
  Vcl.Forms, UniGUITYpes, Vcl.DBCtrls, UniGuiForm,uniGUIServer, UniGuiFrame, UniGUIFont,UniDBGrid, uniGUIApplication;

function GetTextWidthPixels(fntFont: TUniFont; const cString: string;
  ACanvasOwner: TUniForm): integer; overload;
function GetTextWidthPixels(const AText: string; AFont: TUniFont): Integer; overload;

function GetTextHeightPixels(fntFont: TUniFont; const cString: string;
  ACanvasOwner: TUniForm): integer; overload;
function GetTextHeightPixels(const AText: string; AFont: TUniFont): Integer; overload;

function GetGridWidthPixels(grid: TUniDBGrid; ACanvasOwner: TUniForm): integer;
procedure ExpandColumnWidth(AGrid: TUniDBGrid; const AFieldName: string);
function IndexOfForm(AForm: TUniForm): integer;
function CloseAllFormsExcept(AForm: TUniForm): Boolean;
procedure CloseAllComServers;

function GetNavigatorWidth(ANavigator: TUniDBNavigator;
  AStdButtonWidth: integer): integer;
procedure SetNavigatorBtns(ANavigator: TUniDBNavigator;
  AVisibleButtons: TNavButtonSet; AStdButtonWidth: integer);

procedure LoadMainFormIcon(ASelf: TUniForm);
procedure SetVisibleWindowsToForeground;
procedure SetVisibleWindowsToForegroundEx;
function IsMultipleMonitors: Boolean;
function AreXYInsideVirtualDesktop(X, Y: integer): Boolean;

function SystemFontName: string;
procedure ApplySystemFont(AForm: TUniForm); overload;
procedure ApplySystemFont(AFrame: TUniFrame); overload;

procedure AssignColorToFontBrush( AFont: TUniFont; ABrush: TUniCellAttribs; F, B: TColor );
function FindFormByClass(AClassName: String) : TUniForm;

implementation

uses
  IQMS.Common.COMServer,
  IQMS.Common.Controls,
  IQMS.Common.SysInfo;

function GetTextWidthPixels(fntFont: TUniFont; const cString: string;
  ACanvasOwner: TUniForm): integer;
var
  fntSave: TUniFont;
  OnChngSave: TNotifyEvent;
begin
  Result := 0;
  if Assigned(ACanvasOwner) then
    begin
      fntSave := ACanvasOwner.Font;
      OnChngSave := ACanvasOwner.Font.OnChange;

      try
        ACanvasOwner.Font.OnChange := nil;
        ACanvasOwner.Font := fntFont;

        Result := ACanvasOwner.Canvas.TextWidth(cString);
      finally
        ACanvasOwner.Font := fntSave;
        ACanvasOwner.Font.OnChange := OnChngSave;
      end;
    end;
end;

function GetTextWidthPixels(const AText: string; AFont: TUniFont): Integer;
var
  ABitmap: TBitmap;
begin
  ABitmap := TBitmap.Create;
  try
    ABitmap.Canvas.Font := AFont;
    Result := ABitmap.Canvas.TextWidth(AText);
  finally
    ABitmap.Free;
  end;
end;

function GetTextHeightPixels(fntFont: TUniFont; const cString: string;
  ACanvasOwner: TUniForm): integer;
var
  fntSave: TUniFont;
  OnChngSave: TNotifyEvent;
begin
  Result := 0;
  if Assigned(ACanvasOwner) then
    begin
      fntSave := ACanvasOwner.Font;
      OnChngSave := ACanvasOwner.Font.OnChange;
      try
        ACanvasOwner.Font.OnChange := nil;
        ACanvasOwner.Font := fntFont;
        Result := ACanvasOwner.Canvas.TextHeight(cString);
      finally
        ACanvasOwner.Font.OnChange := OnChngSave;
        ACanvasOwner.Font := fntSave;
      end;
    end;
end;

function GetTextHeightPixels(const AText: string; AFont: TUniFont): Integer;
var
  ABitmap: TBitmap;
begin
  ABitmap := TBitmap.Create;
  try
    ABitmap.Canvas.Font := AFont;
    Result := ABitmap.Canvas.TextHeight(AText);
  finally
    ABitmap.Free;
  end;
end;

function GetGridWidthPixels(grid: TUniDBGrid; ACanvasOwner: TUniForm): integer;
const
  cMEASURE_CHAR = '0';
  iEXTRA_COL_PIX = 6;
  iINDICATOR_WIDE = 15;
var
  i, iColumns, iColWidth, iTitleWidth, iCharWidth: integer;
begin
  iColumns := 0;

  { width of the vertical scroll bar }
  Result := GetSystemMetrics(SM_CXVSCROLL);

  { width of 1 char based on '0' (constant) }
//  iCharWidth := GetTextWidthPixels(grid.Font, cMEASURE_CHAR, ACanvasOwner);

  with grid.DataSource.DataSet do
    for i := 0 to FieldCount - 1 do
      with Fields[i] do
        if visible then
          begin
            iColWidth := iCharWidth * DisplayWidth;

            if dgTitles in grid.Options then
              begin
//                iTitleWidth := GetTextWidthPixels(grid.TitleFont, DisplayLabel,
//                  ACanvasOwner);
                if iColWidth < iTitleWidth then
                  iColWidth := iTitleWidth;
              end;
            Inc(iColumns, 1);
            Inc(Result, iColWidth + iEXTRA_COL_PIX);

          end; { visible }

  if dgIndicator in grid.Options then
    begin
      Inc(iColumns, 1);
      Inc(Result, iINDICATOR_WIDE);
    end;

  if dgColLines in grid.Options then
    Inc(Result, iColumns)
  else
    Inc(Result, 1);
end;

procedure ExpandColumnWidth(AGrid: TUniDBGrid; const AFieldName: string);
var
  i: integer;
  W: integer;
  ACol: integer;
begin
  W := 0;
  ACol := - 1;
  with AGrid do
    begin
      for i := 0 to Columns.Count - 1 do
        with Columns[i] do
          if CompareText(FieldName, AFieldName) = 0 then
            ACol := i
          else
            Inc(W, Width + 5);

      if ACol > - 1 then
        Columns[ACol].Width := UniApplication.ScreenWidth- W - 11;
    end;
end;

function IndexOfForm(AForm: TUniForm): integer;
var
  i: integer;
begin
  with UniSession do
    for i := 0 to FormsList.Count - 1 do
      if FormsList[i] = AForm then
        begin
          Result := i;
          EXIT;
        end;
  Result := - 1;
end;

function CloseAllFormsExcept(AForm: TUniForm): Boolean;
var
  i: integer;
  AList: TList;
begin
  AList := TList.Create;
  try
    // Build a controlled list of forms that meet the criteria
    for i := UniSession.FormsList.Count - 1 downto 0 do
      if (UniSession.FormsList[i] <> AForm) and TUniBaseForm(UniSession.FormsList[i]).Visible
//        and(UniSession.FormsList[i] <>  Application.MainForm)
        then
        AList.Add(UniSession.FormsList[i]);

    // Loop the list, closing forms
    for i := 0 to AList.Count - 1 do
      if (IndexOfForm(TUniForm(AList[i])) > - 1) then
        begin
          // First, set the modal flag
          if (fsModal in TUniForm(AList[i]).FormState) then
            TUniForm(AList[i]).ModalResult := mrCancel;
          // Now, close the form.  Do not call Release.
          // Release will not fire the Close event.
          TUniForm(AList[i]).Close;
        end;
  finally
    FreeAndNil(AList);
  end;

  // 05-01-2015 EIQ-7003 EnterpriseIQ - Error when Logging On with a different User if System Parameters window is open
  // Hidden forms such as TFrmCCSettings instantiated in IQSys need to be released by letting the system process messages
  Application.ProcessMessages;

  // Close any remaining DCOM servers owned by the application
  CloseAllComServers;

  Result := TRUE;

end;

procedure CloseAllComServers;
begin
  IQComSrvList.Clear; { this should shut down anything hanging out there }
end;

function GetNavigatorWidth(ANavigator: TUniDBNavigator;
  AStdButtonWidth: integer): integer;
var
  i: integer;
  AButton: TComponent;
  A: Variant;
  X: integer;
begin
  {
    Call this function after resetting the VisibleButtons property of a
    navigator bar.  Provide the name of the TDBNavigator and the width
    each button should be.  For example:

    navButtons := [ nbFirst, nbPrior, nbNext, nbLast ];
    navMain.VisibleButtons:= navButtons;
    navMain.Width := GetNavigatorWidth( navMain, 25 );

    See procedure SetNavigatorBtns below.
  }
  X := 0;
  with ANavigator do
    begin
      for i := 0 to (ControlCount - 1) do
        begin
          if ANavigator.Controls[i].visible then
            Inc(X, 1);
        end;

    end;
  Result := X * AStdButtonWidth;
end;

procedure SetNavigatorBtns(ANavigator: TUniDBNavigator;
  AVisibleButtons: TNavButtonSet; AStdButtonWidth: integer);
begin
  {
    Call this function to set both the visible buttons and the width of the
    navigator bar.  For example:

    SetNavigatorBtns( NavMain, [ nbFirst, nbPrior, nbNext, nbLast ], 25 );

    This procedure simultaneously determines which buttons show and how wide
    the navigator bar is.
  }
  ANavigator.VisibleButtons := AVisibleButtons;
  ANavigator.Width := GetNavigatorWidth(ANavigator, AStdButtonWidth);
end;

procedure LoadMainFormIcon(ASelf: TUniForm);
begin
  // windows 95/98 does not show the Application icon on forms.
  // This compensates for that flaw.  Be sure the main form has the
  // application icon assigned to it's own icon property.
  // To use this, call the procedure and pass Self for the parameter.
  with ASelf do
    begin
      Icon.Assign(Application.MainForm.Icon);
      Update;
    end;
end;

procedure SetVisibleWindowsToForeground;
var
  i: integer;
begin
  // {first bring them all to the foreground}
  // for I:= 0 to Screen.FormCount - 1 do
  // if Screen.Forms[ I ].Visible then
  // ForceForegroundWindowB( Screen.Forms[ I ].Handle ); {IQCtrl.pas}

  // the above messes up the sequence of the windows - not very clean
  ForceForegroundWindowB(Application.Handle); { IQCtrl.pas }

  { look for TMessageForm that is used for confirmation, warning and
    error dialog boxes and bring it up on top }
  for i := 0 to UniSession.FormsList.Count - 1 do
    if TUniBaseForm(UniSession.FormsList[i]).ClassName = 'TMessageForm' then
      ForceForegroundWindowB(TUniBaseForm(UniSession.FormsList[i]).Handle); { IQCtrl.pas }
end;

procedure SetVisibleWindowsToForegroundEx;
var
  i: integer;
begin
  BringWindowToTop(Application.Handle);
  SetForegroundWindow(Application.Handle);

  { look for TMessageForm that is used for confirmation, warning and
    error dialog boxes and bring it up on top }
  for i := 0 to UniSession.FormsList.Count - 1 do
    if TUniBaseForm(UniSession.FormsList[i]).ClassName = 'TMessageForm' then
      begin
        BringWindowToTop(TUniBaseForm(UniSession.FormsList[i]).Handle);
        SetForegroundWindow(TUniBaseForm(UniSession.FormsList[i]).Handle);
      end;
end;

function AreXYInsideVirtualDesktop(X, Y: integer): Boolean;
begin
  Result := (X < uniapplication.ScreenWidth) and (Y < uniapplication.ScreenHeight);
end;

function IsMultipleMonitors: Boolean;
begin
  Result := (Screen.MonitorCount > 1);
end;

function SystemFontName: string;
begin
  Result := IQMS.Common.SysInfo.SystemFontName;
end;

procedure ApplySystemFont(AForm: TUniForm);
const
 c_font_name_tahoma: string = 'Tahoma';
begin
  // Apply uniform, Unicode font, appropriate for OS.
  // This applies to 2012 version and above.

  if not Assigned(AForm) then
    Exit;

  // If this is not 64-bit, then grab Tahoma because this ensures
  // the font will be consistent for touch-screen forms.  The problem
  // we wish to avoid is using MS Sans Serif as our touch-screen font
  // because it does not work well.  So, rather than fight with it,
  // set our font to Tahoma, which will look good regardless.
  if not IQMS.Common.SysInfo.Is64Bit and
    (Screen.Fonts.IndexOf(c_font_name_tahoma) > - 1) then
    AForm.Font.Name := c_font_name_tahoma
  // But if we are running 64-bit, then whatever the font may be,it will
  // work well at larger point sizes.
  else
    AForm.Font.Name := SystemFontName;
end;

procedure ApplySystemFont(AFrame: TUniFrame);
const
 c_font_name_tahoma: string = 'Tahoma';
begin
  // Apply uniform, Unicode font, appropriate for OS.
  // This applies to 2012 version and above.

  if not Assigned(AFrame) then
    Exit;

  // If this is not 64-bit, then grab Tahoma because this ensures
  // the font will be consistent for touch-screen forms.  The problem
  // we wish to avoid is using MS Sans Serif as our touch-screen font
  // because it does not work well.  So, rather than fight with it,
  // set our font to Tahoma, which will look good regardless.
  if not IQMS.Common.SysInfo.Is64Bit and
    (Screen.Fonts.IndexOf(c_font_name_tahoma) > - 1) then
    AFrame.Font.Name := c_font_name_tahoma
  // But if we are running 64-bit, then whatever the font may be,it will
  // work well at larger point sizes.
  else
    AFrame.Font.Name := SystemFontName;
end;

procedure AssignColorToFontBrush( AFont: TUniFont; ABrush: TUniCellAttribs; F, B: TColor );
begin
  ABrush.Color:= B;
  AFont.Color := F;
end;

function FindFormByClass(AClassName: String) : TUniForm;
var
  i: Integer;
begin

Result := nil;
for i := UniSession.FormsList.Count - 1 DownTo 0 do
    if (TUniBaseForm(UniSession.FormsList[i]).ClassName=AClassName) then
    begin
      Result := TUniForm(UniSession.FormsList[i]);
      Break;
    end;
end;


end.
