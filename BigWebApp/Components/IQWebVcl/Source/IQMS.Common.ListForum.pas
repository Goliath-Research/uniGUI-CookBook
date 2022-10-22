unit IQMS.Common.ListForum;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  TListForm = class(TUniForm)
    PnlPrompt: TUniPanel;
    Panel2: TUniPanel;
    lblPrompt: TUniLabel;
    lstList: TUniListBox;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Memo: TUniMemo;
    btnSelectAll: TUniButton;
    btnCopyToClipboard: TUniButton;
    procedure lstListDblClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
  private
    { Private declarations }
    FPrompt: String;
    procedure AdjustControls;
    procedure SetPrompt(const Value: String);
  public
    { Public declarations }
  published
    property Prompt: String read FPrompt write SetPrompt;
  end;

  procedure DoShowList(const ACaption, APrompt: String; const AList: TStringList);
  function DoListSelect(const ACaption, APrompt: String; const AList: TStringList;var ASelectedIndex: Integer): Boolean;
  function DoListConfirm(const ACaption, APrompt: String; const AList: TStringList): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.ResStrings;

procedure DoShowList( const ACaption, APrompt: String; const AList: TStringList);
var
  ListForm: TListForm;
begin
  if not Assigned(AList) then
     Exit;

  ListForm:= TListForm.Create(uniGUIApplication.UniApplication);
   with ListForm do
    begin
      Caption := ACaption;
      Prompt  := APrompt;
      lstList.Items.Assign(AList);
      Memo.Clear;
      Memo.Text := lstList.Items.Text;
      Show;
    end;
end;

function DoListSelect(const ACaption, APrompt: String; const AList: TStringList;
 var ASelectedIndex: Integer): Boolean;
var
  ListForm: TListForm;
begin
  ListForm:= TListForm.Create(uniGUIApplication.UniApplication);
  with ListForm do
  begin
     Caption := ACaption;
      Prompt  := APrompt;
      lstList.Items.Assign(AList);
      Memo.Clear;
      Memo.Text := lstList.Items.Text;
     PnlButtons.Visible := TRUE;
     lstList.OnMouseDown := NIL;
     Result := ShowModal = mrOk;
     if Result then
        ASelectedIndex := lstList.ItemIndex;
  end;
end;

function DoListConfirm(const ACaption, APrompt: String; const AList: TStringList): Boolean;
var
  ListForm: TListForm;
begin
  ListForm:= TListForm.Create(uniGUIApplication.UniApplication);
  with ListForm do
  begin
     Caption := ACaption;
      Prompt  := APrompt;
      lstList.Items.Assign(AList);
      Memo.Clear;
      Memo.Text := lstList.Items.Text;
     PnlButtons.Visible := TRUE;
     btnOk.Caption := IQMS.Common.ResStrings.cTXT0000346; // '&Yes'
     btnCancel.Caption := IQMS.Common.ResStrings.cTXT0000347; // '&No'
     Result := ShowModal = mrOk;
  end;
end;

procedure TListForm.AdjustControls;
begin
  lblPrompt.Align    := alNone;
  lblPrompt.AutoSize := FALSE;
  lblPrompt.AutoSize := TRUE;
  lblPrompt.Update;
  lblPrompt.Left  := 8;
  lblPrompt.Width := PnlPrompt.Width - 16;
  PnlPrompt.Height := lblPrompt.Height + 16;
  lblPrompt.Align := alClient;
end;

procedure TListForm.SetPrompt(const Value: String);
begin
  FPrompt := Value;
  lblPrompt.Caption := Value;
  PnlPrompt.Visible := Trim(Value) > '';
  AdjustControls;
end;

procedure TListForm.UniFormCreate(Sender: TObject);
begin
  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memo.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

procedure TListForm.UniFormShow(Sender: TObject);
begin
  AdjustControls;
end;

procedure TListForm.btnSelectAllClick(Sender: TObject);
var
  S : TStringStream;
begin
  S := TStringStream.Create(lstList.Items.Text);
    try
      UniSession.SendStream(S, 'List.txt');
    finally
      S.Free;
    end;
end;

procedure TListForm.lstListDblClick(Sender: TObject);
begin
  if PnlButtons.Visible then
     ModalResult := mrOk;
end;

end.
