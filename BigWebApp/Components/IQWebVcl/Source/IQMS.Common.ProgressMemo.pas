{   Wrapper for IQProgressMemoFrm.

    =========================================================================
    Example One, "Memo and Progress Bar":
    =========================================================================

    var
       hPrg: TIQProgressMemo;
       ACurLine: Integer;
    begin
        try
           // Create the form.  You may use any of the wrappers.
           // This wrapper also uses the progress bar
           hPrg := hProgressMemo( Self, 'Updating Database', AObjectCnt );

           // Add the first line
           ACurLine := hPrg.AddTextLine( 'Initializing...' );

           // Code that does something goes here
           ...

           // Update the text line
           // The result will look like this:  'Initializing...OK'
           hPrg.AppendText( ACurLine, 'OK' ); // done initializing

           // Update the progress bar.  This feature is optional.  See the wrappers.
           hPrg.StepProgress;

           // More code that does something, perhaps to continue a loop
           ...

        finally
           if Assigned( hPrg ) then hPrg.Free; // free the hPrg object
        end;

    =========================================================================
    Example Two, "Simple Memo":
    =========================================================================

    var
       hPrg: TIQProgressMemo;
       ACurLine: Integer;
    begin
        try
           // Create the form.  This wrapper creates the simple version
           hPrg := hProgressMemo( Self, 'Updating Database' );

           // Add the first line
           ACurLine := hPrg.AddTextLine( 'Initializing...' );

           // Code that does something goes here
           ...

           // Update the text line.
           // The result will look like this:  'Initializing...OK'
           hPrg.AppendText( ACurLine, 'OK' ); // done initializing

           // More code that does something, perhaps to continue a loop
           ...

        finally
           if Assigned( hPrg ) then hPrg.Free; // free the hPrg object
        end;
}


unit IQMS.Common.ProgressMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Forms,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,uniGUIApplication,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniProgressBar,
  {*UG_rem_AE*}
  IQMS.Common.ProgressMemoForm;
  //db_dm;

type
  TIQWebProgressMemo = class(TComponent)
  private
    { Private declarations }
    FCaption: String;
    FMaxProgress: integer;
    FMinProgress: integer;
    Progress: integer;
    FProgressBarVisible: Boolean;
    FShowCancelBtn: Boolean;
    function GetActiveState: boolean;
    function GetCaption: String;
    function GetMaxProgress: integer;
    function GetMinProgress: integer;
    procedure SetCaption(const Value: String);
    procedure SetMaxProgress(const Value: integer);
    procedure SetMinProgress(const Value: integer);
    procedure SetProgressBarVisible(const Value: Boolean);
    function IsFormCancelled: Boolean;
    {*UG_rem_AE*}
    procedure SetShowCancelBtn(const Value: Boolean);
  protected
    { Protected declarations }
    procedure ScrollDown;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;

    // Call this to update the progress bar.  See hProgressMemoExA wrapper.
    procedure UpdateProgress(Progress: Integer );
    procedure StepProgress;

    // Memo Text
    // Adds a new line of text to the memo, and returns the line index
    function AddTextLine( S: String ): Integer;
    // Returns a line of text at the specified line index
    function GetTextLine( ALineIndex: Integer ): String;
    // Appends text to a line, specified by line index
    procedure AppendText( ALineIndex: Integer; AAppendText: String );
    // Completely replace a line of text at the line index
    procedure ReplaceText( ALineIndex: Integer; ANewText: String );

    procedure Hide;
    procedure Show;
    procedure MinimizeWindow;
    procedure MaximizeWindow;
    procedure RestoreWindow;
  published
    { Published declarations }
    ButtonCancel: TUniBitBtn;
    MemoWindow: TUniMemo;
    ProgressBar: TUniProgressBar;
    FMemoForm :TFrmProgressMemo;
    property Active: boolean read GetActiveState;
    property Caption: String read GetCaption write SetCaption;
    property MaxProgress: integer read GetMaxProgress write SetMaxProgress default 100;
    property MinProgress: integer read GetMinProgress write SetMinProgress default 0;
    property ShowProgressBar: Boolean write SetProgressBarVisible;
    property ShowCancelBtn: Boolean read FShowCancelBtn write SetShowCancelBtn;
    property Cancelled: Boolean read IsFormCancelled;
    {*UG_rem_AE*}
    property MemoForm: TFrmProgressMemo read FMemoForm write FMemoForm;
  end;

  {
    The progress bar is optional. It only displays if you supply a
    AMaxProgress value.

    Example:

    var
       hPrg: TIQProgressMemo;
    begin

      try
         hPrg := hProgressMemo(Self,               // AOwner
                              'Processing...',     // ACaption
                              100);                // AMaxProgress

         // Actions
         ...

         // Add line of text
         AddTextLine('Retrieving data.');

         // Actions
         ...

         // Increment progress
         hPrg.StepProgress;

      finally
        if Assigned(hPrg) then FreeAndNil(hPrg);
      end;
    end;

  }

    {*UG_rem_AE*}
  function hProgressMemo(ACaption: String = 'Progress';
                         AMaxProgress: Integer = 0): TIQWebProgressMemo;


implementation

uses
    IQMS.Common.Controls,
    IQMS.Common.ResStrings;

    {*UG_rem_AE*}
function hProgressMemo(ACaption: String;
                       AMaxProgress: Integer): TIQWebProgressMemo;
begin
  Result := TIQWebProgressMemo.Create(uniGUIApplication.UniApplication);
  with Result do
   begin
     Caption := ACaption;
     MaxProgress     := AMaxProgress;
     ShowProgressBar := AMaxProgress > 0;
     Execute;
   end;
end;

constructor TIQWebProgressMemo.Create(AOwner: TComponent);
begin
 inherited Create( AOwner );

  FShowCancelBtn := True;

  Caption := '';
//  ProgressBar.Min := 0;
//  ProgressBar.Max := 100;
  Progress := 0;
end;

destructor TIQWebProgressMemo.Destroy;
begin
 inherited;
end;

procedure TIQWebProgressMemo.Execute;
begin
  {*UG_rem_AE*}
  MemoForm := TFrmProgressMemo.Create( uniGUIApplication.UniApplication );

 with MemoForm do
  begin
  Caption                         := Self.Caption;
    ProgressBar_StatusIndicator.Max := MaxProgress;
    ProgressBar_StatusIndicator.Min := MinProgress;
    HelpContext                     := HelpContext;
    ProgressBar_StatusIndicator.Visible := FProgressBarVisible;

    // Assign the controls to their variables
    ButtonCancel := btnCancel;
    MemoWindow   := Memo;
    ProgressBar  := ProgressBar_StatusIndicator;
    btnCancel.Visible := Self.FShowCancelBtn;

    // Show the form
    Show;
    // hide the insertion point.  This must follow Show.
//    DestroyCaret;
  end;
end;

function TIQWebProgressMemo.GetCaption: String;
begin
 Result := FCaption;
end;

function TIQWebProgressMemo.GetMaxProgress: integer;
begin
 Result := FMaxProgress;
end;

function TIQWebProgressMemo.GetMinProgress: integer;
begin
 Result := FMinProgress;
end;

procedure TIQWebProgressMemo.SetCaption(const Value: String);
begin
 if (FCaption <> Value) then
   FCaption := Value;
end;

procedure TIQWebProgressMemo.SetMaxProgress(const Value: integer);
begin
 if (FMaxProgress <> Value) then
   FMaxProgress := Value;
end;

procedure TIQWebProgressMemo.SetMinProgress(const Value: integer);
begin
 if (FMinProgress <> Value) then
   FMinProgress := Value;
end;

procedure TIQWebProgressMemo.StepProgress;
begin
  {*UG_rem_AE*}
 if not (MemoForm = nil) then
   begin
     with MemoForm do
      begin
           ProgressBar_StatusIndicator.Position:=ProgressBar_StatusIndicator.Position+1;
           Update;
           Application.ProcessMessages;
           if ( ProgressBar_StatusIndicator.Max <= ProgressBar_StatusIndicator.Position ) then
              begin
                ProgressBar_StatusIndicator.Visible := FALSE;
                   btnCancel.Caption := IQMS.Common.ResStrings.cTXT0000159 { 'Close' };
              end;
      end;
   end;
end;

procedure TIQWebProgressMemo.UpdateProgress( Progress: Integer );
begin
     Application.ProcessMessages;

     {*UG_rem_AE*}
 if not (MemoForm = nil) then
  begin
    with MemoForm do
      begin
       Invalidate;
        ProgressBar_StatusIndicator.Position := Progress;
       Update;
       // Check if progress meter has reached the end...
       if ( ProgressBar_StatusIndicator.Max <= ProgressBar_StatusIndicator.Position ) then
          begin
            ProgressBar_StatusIndicator.Visible := FALSE;
               btnCancel.Caption := IQMS.Common.ResStrings.cTXT0000159 { 'Close' };
          end;
      end;
  end;
end;


function TIQWebProgressMemo.GetActiveState: boolean;
begin
  {*UG_rem_AE*}
 Result := not (Memoform = nil);
end;

function TIQWebProgressMemo.AddTextLine(S: String): Integer;
begin
     Result := -1; // default result
     {*UG_rem_AE*}
     if not (Memoform = nil) then
        with Memoform do
             try
                Invalidate;
                Memo.Lines.BeginUpdate;
                Result := Memo.Lines.Add( S );
             finally
                Memo.Lines.EndUpdate;
                Update;
             end;
end;

function TIQWebProgressMemo.GetTextLine(ALineIndex: Integer): String;
var
   i: Integer;
begin
    {*UG_rem_AE*}
     if not (Memoform = nil) then
      begin
        Result:=Memoform.Memo.Lines[ALineIndex];
      end;
//     with Memoform.Memo do
//      try
//         Invalidate;
//         Lines.BeginUpdate;
//         i         := Perform(EM_LINEINDEX, ALineIndex, 0);
//
//         SelStart  := i;
//         SelLength := Length(Lines[ALineIndex]);
//         Result    := SelText;
//         SelStart  := i;
//      finally
//         Lines.EndUpdate;
//         Application.ProcessMessages;
//      end;
end;

procedure TIQWebProgressMemo.AppendText(ALineIndex: Integer;
  AAppendText: String);
var
   S: String;
begin
     S := GetTextLine( ALineIndex );
     ReplaceText( ALineIndex, Format( '%s%s', [ S, AAppendText ] ));
end;

procedure TIQWebProgressMemo.ReplaceText( ALineIndex: Integer;
  ANewText: String );
var
   i: Integer;
begin
  {*UG_rem_AE*}
     if not (Memoform = nil) then
     begin
       Memoform.Memo.Lines[ALineIndex]:=ANewText;
     end;
//     with FrmProgressMemo.Memo do
//          try
//             Invalidate;
//             Lines.BeginUpdate;
//             i         := Perform(EM_LINEINDEX, ALineIndex, 0);
//             SelStart  := i;
//             SelLength := Length(Lines[ALineIndex]);
//             SelText   := ANewText;
//             SelStart  := i;
//             ScrollDown;
//          finally
//             Lines.EndUpdate;
//             Update;
//             Application.ProcessMessages;
//          end;

end;

procedure TIQWebProgressMemo.SetProgressBarVisible(const Value: Boolean);
begin
  FProgressBarVisible := Value;

    {*UG_rem_AE*}
  if (Memoform <> nil) then
     Memoform.ShowProgressBar := Value;
end;

procedure TIQWebProgressMemo.ScrollDown;
begin
  {*UG_rem_AE*}
//  if (Memoform <> nil) then
//     with Memoform do
//       SendMessage( Memo.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
end;

function TIQWebProgressMemo.IsFormCancelled: Boolean;
begin
  {*UG_rem_AE*}
     Result := ( Memoform = NIL );
end;

procedure TIQWebProgressMemo.Hide;
begin
  {*UG_rem_AE*}
  if (Memoform<>NIL) and Assigned(Memoform) then
     Memoform.Hide;
end;

procedure TIQWebProgressMemo.Show;
begin
  {*UG_rem_AE*}
  if (Memoform<>NIL) and Assigned(Memoform) then
     Memoform.Show;
end;

procedure TIQWebProgressMemo.SetShowCancelBtn(const Value: Boolean);
begin
  FShowCancelBtn := Value;
  {*UG_rem_AE*}
  if Assigned(Memoform) then
     ShowCancelBtn := Value;
end;

procedure TIQWebProgressMemo.MaximizeWindow;
begin
  {*UG_rem_AE*}
  if Assigned(Memoform) then
     Memoform.WindowState := wsMaximized;
end;

procedure TIQWebProgressMemo.MinimizeWindow;
begin
  {*UG_rem_AE*}
  if Assigned(Memoform) then
     Memoform.WindowState := wsMinimized;
end;

procedure TIQWebProgressMemo.RestoreWindow;
begin
  {*UG_rem_AE*}
//  if Assigned(Memoform) then
//     RestoreForm(Memoform); //iqctrl
end;

end.
