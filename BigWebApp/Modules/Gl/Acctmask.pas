unit AcctMask;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.DBGrids,
  Data.DB,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, uniMainMenu;

type
  TFrmAcctMask = class(TUniForm)
    Panel6: TUniPanel;
    PnlMain: TUniPanel;
    PnlToolbar: TUniPanel;
    NavMain: TUniDBNavigator;
    DBGridAcct_Def: TUniDBGrid;
    SrcGlAcct_Def: TDataSource;
    TblGLAcct_Def: TFDTable;
    TblGLAcct_DefGROUP_NAME: TStringField;
    TblGLAcct_DefSEQ: TBCDField;
    TblGLAcct_DefGROUP_START: TBCDField;
    TblGLAcct_DefGROUP_LENGTH: TBCDField;
    TblGLAcct_DefFILL_CHAR: TBCDField;
    TblGLAcct_DefSEP_CHAR: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    HelpContents1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    BitBtnOk: TUniBitBtn;
    BitBtnCancle: TUniBitBtn;
    PnlSample: TUniPanel;
    Panel11: TUniPanel;
    Label1: TUniLabel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Label3: TUniLabel;
    Label2: TUniLabel;
    LblSample: TUniLabel;
    Bevel1: TUniPanel;
    procedure BitBtnCancleClick(Sender: TObject);
    procedure DBGridAcct_DefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TblGLAcct_DefBeforeDelete(DataSet: TDataSet);
    procedure TblGLAcct_DefAfterPost(DataSet: TDataSet);
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TblGLAcct_DefBeforePost(DataSet: TDataSet);
    procedure TblGLAcct_DefNewRecord(DataSet: TDataSet);
    procedure TblGLAcct_DefAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure TblGLAcct_DefGROUP_NAMEValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure HelpContents1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure DBGridAcct_DefDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    procedure CheckPermanentFields;
    procedure CheckField(cField:String; nSeq:Integer);
    function  ReservedFields(cFieldName:String):Boolean;
    function  CheckPosition(nSeq, nStart, nLen:Integer; cSep_Char:String):Integer;
    function  GapsInTheMask:Boolean;
    function  CheckForGaps(nStart:Integer):Integer;
    function  CreateInitAndMask(var cInitAcct, cMaskAcct:String):Boolean;
    function  GetSubMask(cField:string):string;
    function  Overlapping:Boolean;
    procedure CreateLabel;
    procedure AssignValuesToIqSys(cInitAcct, cMaskAcct:String);
    { Private declarations }
  public
    { Public declarations }
    lOkPressed:Boolean;
    MyDataBase:TFDCustomConnection;
  end;

procedure DoAcctMask;

implementation

{$R *.DFM}

uses
  gl_rscstr,
  GLCreAcc,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils;


procedure DoAcctMask;
var
  tViews:TCreateAccGroup;
  LFrmAcctMask : TFrmAcctMask;
begin
  LFrmAcctMask := TFrmAcctMask.Create( uniGUIApplication.UniApplication );
  with LFrmAcctMask do
  try
    lOkPressed := False;
    CheckPermanentFields;
    MyDataBase := FDManager.FindConnection('IQFD');
    MyDataBase.StartTransaction;
    ShowModal;
    if lOkPressed then
    begin
//      MyDataBase.Commit;
      tViews := CreateAccountGroupsView;
      case tViews of
        agCancel : IQWarning(gl_rscstr.cTXT0000033 {'GL account structure creation was cancelled.'});
        agError  : IQWarning(gl_rscstr.cTXT0000034 {'GL account structure was not created because of an error.'});
        agOk     :
          if ( not ViewExists('V_GLACCT') ) then
            IQWarning(gl_rscstr.cTXT0000035 {'Accounting structure was not updated.'})
          else
          begin
            MyDataBase.Commit;
            IQMS.Common.Dialogs.IQInformation(gl_rscstr.cTXT0000036 {'GL account structure was created successfully.'});
          end;
      end;
      Screen.Cursor:= crDefault;
    end;
  finally
    if MyDataBase.InTransaction then
       MyDataBase.RollBack;
  end;
end;

procedure TFrmAcctMask.FormCreate(Sender: TObject);
begin
  TblGLAcct_Def.Open;
//  IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TFrmAcctMask.FormShow(Sender: TObject);
begin
  CreateLabel;
end;

procedure TFrmAcctMask.BitBtnCancleClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAcctMask.CheckPermanentFields;
begin
  CheckField('ACCOUNT', 1);
  CheckField('DIVISION', 2);
  CheckField('DEPARTMENT', 3);
end;

procedure TFrmAcctMask.CheckField(cField:String; nSeq:Integer);
begin
  if Empty(SelectValueAsString(Format('select group_name from glacct_def ' +
                            'where group_name = ''%s''', [cField]))) then
    ExecuteCommand(Format('insert into glacct_def (seq, ' +
                   'group_name, ' +
                   'sep_char, ' +
                   'group_start, ' +
                   'fill_char, ' +
                   'group_length) ' +
                   'values (%d, ''%s'', ''-'', 0, 0, 0)', [nSeq, cField]));
end;


procedure TFrmAcctMask.DBGridAcct_DefDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if ReservedFields(Column.FieldName) then
    (Sender as TUniDBGrid).Brush.Color := clBtnFace;
//  (Sender as TUniDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State );
end;

function TFrmAcctMask.ReservedFields(cFieldName:String):Boolean;
begin
  Result := False;

  with TblGlAcct_Def do
  if  ((FieldByName('SEQ').AsInteger = 1) or
      (FieldByName('SEQ').AsInteger = 2) or
      (FieldByName('SEQ').AsInteger = 3))

      and ( (cFieldName = 'SEQ') or (cFieldName = 'GROUP_NAME') )
       then Result := True;

end;


procedure TFrmAcctMask.DBGridAcct_DefKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectedField'
  with DBGridAcct_Def do
    if ReservedFields(SelectedField.FieldName)
      then Readonly := (Key <> VK_DOWN)
      else ReadOnly := False; }
end;

procedure TFrmAcctMask.TblGLAcct_DefBeforeDelete(DataSet: TDataSet);
begin
  with TblGlAcct_Def do
    if
      (FieldByName('GROUP_NAME').AsString = 'ACCOUNT') or
      (FieldByName('GROUP_NAME').AsString = 'DIVISION') or
      (FieldByName('GROUP_NAME').AsString = 'DEPARTMENT') then ABORT;
end;

function TFrmAcctMask.CheckPosition(nSeq, nStart, nLen:Integer; cSep_Char:String):Integer;
var
 nlStart, nlLen, nPos, nlPos:Integer;
 clSep_Char:String;
begin
  Result := 0;
  if (not Empty(cSep_Char)) then Inc(nLen);
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select seq, group_start, group_length, sep_char from glacct_def where seq <> %d and group_start + group_length > 0', [nSeq]));
    Open;
    while not Eof do
    begin
      nlStart    := FieldByName('GROUP_START').AsInteger;
      nlLen      := FieldByName('GROUP_LENGTH').AsInteger;
      clSep_Char := FieldByName('SEP_CHAR').AsString;
      if (not Empty(clSep_Char)) then Inc(nlLen);
      nlPos   := nlStart + nlLen - 1;
      nPos    := nStart + nLen - 1;
      if nlStart + nlLen + 1 > 0 then
        if ( (nlPos >= nStart) and (nlPos <= nPos) ) or ( (nlStart >= nStart) and (nlStart <= nPos) ) then
        begin
          Result := FieldByName('SEQ').AsInteger;
          Exit
        end;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmAcctMask.CreateLabel;
var
  cStr, cFill_Char, cSep_Char, cWorkStr:String;
  nLen, i, j, nStart:Integer;
begin
  cStr := Repl(' ', 50);
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add('select group_start, ' +
            'group_length, ' +
            'fill_char, ' +
            'sep_char ' +
            'from glacct_def ' +
            'where group_start + group_length > 0 ' +
            'order by group_start');
    Open;
    while not Eof do
    begin
      nStart := FieldByName('GROUP_START').AsInteger;
      cFill_Char := IntToStr(FieldByName('FILL_CHAR').AsInteger);
      cSep_Char  := FieldByName('SEP_CHAR').AsString;

//      if (nStart = Trunc(SelectValueAsFloat('select max(group_start) from glacct_def'))) and
//          (not Empty(cSep_Char)) then cSep_Char := '';

//      if Empty(cFill_Char) then cFill_Char := ' ';

      cWorkStr := Repl(cFill_Char, (FieldByName('GROUP_LENGTH').AsInteger)) +
                     cSep_Char;
      nLen := Length(cWorkStr);

      if (nStart + nLen - 1) > 50 then
        raise Exception.Create(gl_rscstr.cTXT0000037 {'Account number must be 50 characters or less.'});
      j := 0;
      for i := nStart to (nStart + nLen - 1) do
      begin
        Inc(j);
        cStr[i] := cWorkStr[j];
      end;

//      cStr := cStr + Repl(cFill_Char, (FieldByName('GROUP_LENGTH').AsInteger)) +
//                     cSep_Char;
      Next;
    end;
  finally
    Free;
  end;
  lblSample.Caption := cStr;
end;

procedure TFrmAcctMask.TblGLAcct_DefAfterPost(DataSet: TDataSet);
var
  nPos:Integer;
  nSeq:Integer;
begin
  with TblGlAcct_Def do
  try
    if FieldByName('GROUP_START').AsInteger + FieldByName('GROUP_LENGTH').AsInteger = 0 then Exit;

    nPos := CheckPosition(FieldByName('SEQ').AsInteger,
                          FieldByName('GROUP_START').AsInteger,
                          FieldByName('GROUP_LENGTH').AsInteger,
                          FieldByName('SEP_CHAR').AsString);
    if nPos <> 0 then
      // 'The parameters at sequence %d conflict with the parameters at sequence %d'
      raise Exception.Create(Format(gl_rscstr.cTXT0000038, [FieldByName('SEQ').AsInteger, nPos]));

    GapsInTheMask;
  finally
    CreateLabel;
  end;
end;

procedure TFrmAcctMask.BitBtnOkClick(Sender: TObject);
var
  cInitAcct, cMaskAcct:String;
  nMinStart:Integer;
begin
  nMinStart := 0;
  with TblGlAcct_Def do
    if State in [dsEdit, dsInsert] then Post;

  if Overlapping then
     Abort;
  if GapsInTheMask then
     Abort;

  nMinStart := Trunc(SelectValueAsFloat('select min(group_start) from glacct_def where group_start > 0'));
  if nMinStart <> 1 then
    raise Exception.Create(gl_rscstr.cTXT0000039 {'At least one of the parameters must start with the number, 1'});

  if not CreateInitAndMask(cInitAcct, cMaskAcct) then
    raise Exception.Create(gl_rscstr.cTXT0000037 {'Account number must be 50 characters or less.'});

  AssignValuesToIqSys(cInitAcct, cMaskAcct);

  lOkPressed := True;
  Close;
end;

function TFrmAcctMask.GapsInTheMask:Boolean;
var
  nSeq:Integer;
begin
  Result := False;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add('select seq, group_start from glacct_def');
    Open;
    while not Eof do
    begin
      nSeq := CheckForGaps(FieldByName('GROUP_START').AsInteger);
      if nSeq <> 0 then
      begin
        Result := True;
        // 'There is a gap between sequence %d and sequence %d'
        raise Exception.Create(Format(gl_rscstr.cTXT0000040, [FieldByName('SEQ').AsInteger, nSeq]));
      end;
      Next;
    end;
  finally
    Free;
  end;

end;

function TFrmAcctMask.CheckForGaps(nStart:Integer):Integer;
var
 nLocalStart, nLocalLen, nSum:Integer;
 cSep_Char:String;
begin
  Result := 0;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select seq, ' +
                   'group_start, ' +
                   'group_length, ' +
                   'sep_char ' +
                   'from glacct_def ' +
                   'where group_start = ' +
                   '(select max(group_start) ' +
                   'from glacct_def where group_start < %d) ' +
                   'and group_start <> 0',
                    [nStart]));
    Open;

    nLocalStart   := FieldByName('GROUP_START').AsInteger;
    nLocalLen     := FieldByName('GROUP_LENGTH').AsInteger;
    cSep_Char := FieldByName('SEP_CHAR').AsString;

    if (not Empty(cSep_Char)) then
      Inc(nLocalLen);

    nSum  := (nLocalLen + nLocalStart );
    if nSum <> nStart then
      Result := FieldByName('SEQ').AsInteger
  finally
    Free;
  end;
end;

function TFrmAcctMask.CreateInitAndMask(var cInitAcct, cMaskAcct:String):Boolean;
var
   cFill_Char, cSep_Char:String;
   nStart:Integer;
const
  Characters = '!<>\LlAaCc09#';
begin
  Result := True;
  cMaskAcct := '';
  cInitAcct := '';
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add('select seq, ' +
            'group_start, ' +
            'group_length, ' +
            'sep_char, ' +
            'fill_char ' +
            'from glacct_def ' +
            'where group_start + group_length > 0 ' +
            'order by group_start ');
    Open;
    while not Eof do
    begin

      nStart     := FieldByName('GROUP_START').AsInteger;
      cFill_Char := IntToStr(FieldByName('FILL_CHAR').AsInteger);
      cSep_Char  := FieldByName('SEP_CHAR').AsString;

      if (nStart = Trunc(SelectValueAsFloat('select max(group_start) from glacct_def'))) and
          (not Empty(cSep_Char)) then cSep_Char := '';


      cInitAcct := cInitAcct + Repl(cFill_Char, FieldByName('GROUP_LENGTH').AsInteger) +
                     cSep_Char;
      if Pos(cSep_Char, Characters) <> 0 then
        cSep_Char := '\' + cSep_Char;

      cMaskAcct := cMaskAcct + Repl('0', FieldByName('GROUP_LENGTH').AsInteger) + cSep_Char;

      Next;
    end;
    cMaskAcct := cMaskAcct + ';1; ';
    if Length(cInitAcct) > 50 then Result := False;
  finally
    Free;
  end;
end;

function TFrmAcctMask.Overlapping: Boolean;
var
  nPos:Integer;
begin
  Result := False;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add('select seq, group_start, group_length, sep_char from glacct_def where group_start + group_length > 0');
    Open;
    while not Eof do
    begin
      nPos := CheckPosition(FieldByName('SEQ').AsInteger,
                            FieldByName('GROUP_START').AsInteger,
                            FieldByName('GROUP_LENGTH').AsInteger,
                            FieldByName('SEP_CHAR').AsString);
      if nPos <> 0 then
      begin
        // 'The parameters at sequence %d conflict with the parameters at sequence %d'
        IQWarning(Format(gl_rscstr.cTXT0000038, [FieldByName('SEQ').AsInteger, nPos]));
        Result := True;
        Exit;
      end;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmAcctMask.TblGLAcct_DefBeforePost(DataSet: TDataSet);
begin
  with TblGlAcct_Def do
  begin
  if ( (FieldByName('GROUP_NAME').asString = 'ACCOUNT') or
     (FieldByName('GROUP_NAME').asString = 'DIVISION') or
     (FieldByName('GROUP_NAME').asString = 'DEPARTMENT') ) and
     ( not (FieldByName('SEQ').AsInteger in [1..3]) ) then
    raise Exception.Create('Reserved Description.');

    if FieldByName('GROUP_START').AsInteger + FieldByName('GROUP_LENGTH').AsInteger = 0 then Exit;
    if FieldByName('GROUP_START').AsInteger = 0 then
      raise Exception.Create(gl_rscstr.cTXT0000041 {'The Start parameter cannot be zero (0).'});

    if FieldByName('GROUP_LENGTH').AsInteger = 0 then
      raise Exception.Create(gl_rscstr.cTXT0000042 {'The Length parameter cannot be zero (0).'});
  end;
end;

procedure TFrmAcctMask.TblGLAcct_DefNewRecord(DataSet: TDataSet);
begin
  with TblGlAcct_Def do
  begin
    FieldByName('FILL_CHAR').asInteger := 0;
    FieldByName('SEP_CHAR').asString := '-';
    FieldByName('SEQ').asInteger := Trunc(SelectValueAsFloat('select max(seq) from glacct_def')) + 1;
  end;
end;

procedure TFrmAcctMask.AssignValuesToIqSys(cInitAcct, cMaskAcct:String);
var
  nId:Real;
begin
  ExecuteCommandFmt('update iqsys                          '+
            '   set acct_account_mask    = ''%s'', '+
            '       acct_division_mask   = ''%s'', '+
            '       acct_department_mask = ''%s'', '+
            '       acct_mask            = ''%s'', '+
            '       acct_init            = ''%s''  ',
            [GetSubMask('ACCOUNT'),
             GetSubMask('DIVISION'),
             GetSubMask('DEPARTMENT'),
             cMaskAcct,
             cInitAcct ]);
  (*
  with TFDTable.Create(self) do
  try
    Connection := MainModule.FDConnection;
    TableName := 'IQSYS';
    Active := True;
    Edit;
    FieldByName('ACCT_ACCOUNT_MASK').AsString    := GetSubMask('ACCOUNT');
    FieldByName('ACCT_DIVISION_MASK').AsString   := GetSubMask('DIVISION');
    FieldByName('ACCT_DEPARTMENT_MASK').AsString := GetSubMask('DEPARTMENT');
    FieldByName('ACCT_MASK').AsString            := cMaskAcct;
    FieldByName('ACCT_INIT').AsString            := cInitAcct;
    Post;
  finally
    free;
  end;
  *)
end;

procedure TFrmAcctMask.TblGLAcct_DefAfterDelete(DataSet: TDataSet);
begin
  CreateLabel;
  if Overlapping then Abort;
  if GapsInTheMask then Abort;
end;

function TFrmAcctMask.GetSubMask(cField:string):string;
var
  nLength:Integer;
begin
  nLength := Trunc(SelectValueAsFloat(Format('select group_length from glacct_def where group_name = ''%s''', [cField])));
  // cFill_Char := SelectValueAsString(Format('select fill_char from glacct_def where group_name = ''%s''', [cField]));
  Result:= Repl( '0', nLength );
end;

procedure TFrmAcctMask.TblGLAcct_DefGROUP_NAMEValidate(Sender: TField);
begin
  with Sender do
    if Pos(' ', Trim(Sender.AsString)) > 0 then
       raise Exception.Create(gl_rscstr.cTXT0000043 {'The Description must be a single word.'})
end;

procedure TFrmAcctMask.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAcctMask.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAcctMask.HelpContents1Click(Sender: TObject);
begin
  // Application.HelpContext(1024636);
  IQHelp.HelpContext( 1024636 );
end;

procedure TFrmAcctMask.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

