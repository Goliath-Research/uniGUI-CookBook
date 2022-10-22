unit IQMS.Common.CharDialog;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniBasicGrid,
  uniStringGrid,
  uniMultiItem,
  uniListBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmCharDlg = class(TUniForm)
    Panel1: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Panel3: TUniPanel;
    Panel7: TUniPanel;
    Panel4: TUniPanel;
    lstFonts: TUniListBox;
    Panel6: TUniPanel;
    Fonts: TUniLabel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Grid1: TUniStringGrid;
    Panel5: TUniPanel;
    Label4: TUniLabel;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Label2: TUniLabel;
    edtCurrent: TUniEdit;
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    sbtnCopy: TUniSpeedButton;
    Label3: TUniLabel;
    sbtnCopyFromKeyboard: TUniSpeedButton;
    edtSelected: TUniEdit;
    edtKeyboard: TUniEdit;
    sbtnClear: TUniSpeedButton;
    procedure Grid1Click(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure sbtnCopyClick(Sender: TObject);
    procedure lstFontsClick(Sender: TObject);
    procedure Grid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnCopyFromKeyboardClick(Sender: TObject);
    procedure sbtnClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMaxCharLen: Integer; // how many characters is user allowed to select?
    procedure GetCharList;
    procedure GetFontList;
    procedure GetSelectedText;
    procedure UnEncodeText( S: String );
    procedure ValidateEncodedText;
    procedure SetMaxCharLen(AMaxCharLen: Integer);
    procedure SetCurrent(ACurrent: String);
  public
    { Public declarations }
    FFormActive: Boolean;
    property MaxCharLen: Integer write SetMaxCharLen;
    Property Current : string write SetCurrent;
  end;

  function DoCharDlg( AMaxCharLen: Integer; var ACurrent: String ): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils;

function DoCharDlg( AMaxCharLen: Integer; var ACurrent: String ): Boolean;
var
  FrmCharDlg: TFrmCharDlg;
begin
  FrmCharDlg:= TFrmCharDlg.Create(uniGUIApplication.UniApplication);
     with FrmCharDlg do
      begin
         MaxCharLen:=AMaxCharLen;
         Current:=ACurrent;
         Result := ShowModal = mrOk;
         if Result then ACurrent := Trim( edtCurrent.Text );
      end;
end;

procedure TFrmCharDlg.FormShow(Sender: TObject);
begin
     FFormActive := TRUE;
end;

procedure TFrmCharDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FFormActive := FALSE;
end;

procedure TFrmCharDlg.GetCharList;
var
   I, bFrom, bTo : Byte;
   ARow          : Integer;
   ACaption: String;
begin
     Grid1.RowCount := 0;
     Grid1.RowCount := 1;
     bFrom := 0;
     bTo   := 255;
     ARow  := 0;

     for I := bFrom To bTo do
         begin
             if I = 10 then ACaption := 'New Line'
             else if I = 13 then ACaption := 'Line Feed'
             else ACaption := Chr( I );
             Grid1.Cells[ 0, ARow ] := ACaption;
             Grid1.Cells[ 1, ARow ] := IntToStr( I );
             Inc( ARow, 1 );
             Grid1.RowCount := ARow;
         end;
end;

procedure TFrmCharDlg.GetFontList;
var
   i: integer;
   S: String;
begin
     lstFonts.Clear;
     lstFonts.Items.Assign( Screen.Fonts );
     lstFonts.ItemIndex := lstFonts.Items.IndexOf( Grid1.Font.Name );
end;

procedure TFrmCharDlg.Grid1Click(Sender: TObject);
begin
     GetSelectedText;
end;

procedure TFrmCharDlg.Grid1DblClick(Sender: TObject);
//var
//   AForm: TForm;
//   S    : String;
begin
     GetSelectedText;
     sbtnCopyClick( NIL );

{     S := Chr( Grid1.Row );
     AForm:= TForm.Create( Self );
     with AForm do
     begin
        OnClose := DoFormClose;
        Height  := 150;
        Width   := 200;
        with TMemo.Create( AForm ) do
             begin
                  Parent := AForm;
                  Align  := alClient;
                  Font.Name := Grid1.Font.Name;
                  Font.Size := 72;
                  Text      := S;
             end;
        Show;
     end;   }
end;

procedure TFrmCharDlg.sbtnCopyClick(Sender: TObject);
var
   S, C, R: String;
begin
     S := Trim( edtCurrent.Text );
     C := Trim( edtSelected.Text );

     if S > '' then
        R := Format( '%s, %s', [ S, C ] )
     else R := C;

     R := StrTran( R, ',,', ',' );
     R := StrTran( R, ', ,', ',' );

     edtCurrent.Text := Trim( R );

end;

procedure TFrmCharDlg.lstFontsClick(Sender: TObject);
begin
     Grid1.Font.Name := lstFonts.Items.Strings[lstFonts.ItemIndex];
     Grid1.Repaint;
end;

procedure TFrmCharDlg.Grid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     GetSelectedText;
end;

procedure TFrmCharDlg.GetSelectedText;
var
   ARow, ACol : Longint;
begin
     ARow := Grid1.Row;
     ACol := 1;
     edtSelected.Text := Grid1.Cells[ ACol, ARow ];
end;

procedure TFrmCharDlg.sbtnCopyFromKeyboardClick(Sender: TObject);
var
   S, AResult: String;
   i: Integer;
   C: Integer;
begin
     S := edtKeyboard.Text;
     for i := 1 to Length( S ) do
         begin
              C := Ord(S[i]);
              if AResult = '' then AResult := Format( '%d', [C] )
              else AResult := Format( '%s, %d', [ AResult, C ] );
         end;
     if Trim( edtCurrent.Text ) = '' then edtCurrent.Text := AResult
     else edtCurrent.Text := Format( '%s, %s', [ edtCurrent.Text , AResult ] );
end;

procedure TFrmCharDlg.SetCurrent(ACurrent: String);
begin
   edtCurrent.Text := ACurrent;
   UnEncodeText( ACurrent );
end;

procedure TFrmCharDlg.SetMaxCharLen(AMaxCharLen: Integer);
begin
   // Maximum character length.  If 0, then ignore
   FMaxCharLen := AMaxCharLen;
   GetFontList;
   GetCharList;

   if FMaxCharLen > 0 then
      edtKeyboard.MaxLength := FMaxCharLen;
end;

procedure TFrmCharDlg.UnEncodeText(S: String);
var
   AResult: String;
   i, ACount: Integer;
   C: Integer;
   AList: TStringList;
begin
     try
        AResult := '';
        AList:= TStringList.Create;
        AList.Clear;
        AList.Text:= StrTran( S, ',', #13 );
        for i := 0 to AList.Count - 1 do
            begin
                 if ( FMaxCharLen > 0 ) and ( i = FMaxCharLen ) then BREAK;

                 if IsStringValidInteger( AList.Strings[i], C ) then  // iqnumber
                    AResult := AResult + Chr( C );
            end;
        edtKeyboard.Text := AResult;
     finally
        FreeAndNil( AList );
     end;
end;

procedure TFrmCharDlg.UniFormCreate(Sender: TObject);
begin
   FFormActive := FALSE;
end;

procedure TFrmCharDlg.sbtnClearClick(Sender: TObject);
begin
     edtCurrent.Clear;
end;

procedure TFrmCharDlg.ValidateEncodedText;
var
   i, ACount: Integer;
   C: Integer;
   S : String;
   AList: TStringList;
   AResult: TStringList;
begin
     try
        S := Trim( edtCurrent.Text );

        AResult:= TStringList.Create;
        AResult.Clear;

        AList:= TStringList.Create;
        AList.Clear;
        AList.Text:= StrTran( S, ',', #13 );

        for i := 0 to AList.Count - 1 do
            begin
                 if ( FMaxCharLen > 0 ) and ( i = FMaxCharLen ) then BREAK;

                 if IsStringValidInteger( AList.Strings[i], C ) then  // iqnumber
                    AResult.Add( IntToStr( C ));
            end;
        edtCurrent.Text := StrTran( AResult.CommaText, '"', '' );
     finally
        FreeAndNil( AList );
     end;
end;

procedure TFrmCharDlg.btnOkClick(Sender: TObject);
begin
     ValidateEncodedText;
end;

end.
