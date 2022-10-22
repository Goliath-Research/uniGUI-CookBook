unit rsm_list;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  Buttons,
  Menus,
  uniMainMenu,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMemo,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniCheckBox,
  uniButton,
  uniBitBtn;

type
  TFrmRsmList = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    edtPrefix: TUniEdit;
    Label2: TUniLabel;
    btnCreate: TUniBitBtn;
    memList: TUniMemo;
    cmbFormat: TUniComboBox;
    Label4: TUniLabel;
    Label5: TUniLabel;
    edtStart: TUniEdit;
    edtEnd: TUniEdit;
    udStart: TUpDown;
    udEnd: TUpDown;
    Bevel1: TUniPanel;
    Label3: TUniLabel;
    edtIndent: TUniEdit;
    udIndent: TUpDown;
    chkPValue: TUniCheckBox;
    UniPanel1: TUniPanel;
    btnSelectAll: TUniButton;
    btnCopy: TUniButton;
    btnCopyAll: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCreateClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure DoConstantList;


implementation

{$R *.dfm}

uses
 MainModule,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure DoConstantList;
var
  FrmRsmList: TFrmRsmList;
begin
  FrmRsmList := TFrmRsmList.Create(UniApplication);
  FrmRsmList.Show;
end;

procedure TFrmRsmList.FormCreate(Sender: TObject);
var
  S: String;
  i: Integer;
begin
  IQRegFormRead(Self, [Self]);
  if IQRegStringScalarRead(Self, 'Prefix', S) then
     edtPrefix.Text := S;
  if IQRegStringScalarRead(Self, 'Format', S) then
     cmbFormat.Text := S;
  //if IQRegIntegerScalarRead(Self, 'Count', i) then
  //   udCount.Position := i;
  if IQRegIntegerScalarRead(Self, 'Start', i) then
     udStart.Position := i;
  if IQRegIntegerScalarRead(Self, 'End', i) then
     udEnd.Position := i;
  if IQRegIntegerScalarRead(Self, 'LPad', i) then
     udIndent.Position := i;


  btnCopyAll.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memList.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
  btnCopy.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memList.JSName+'_id-inputEl"); '+
//      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

procedure TFrmRsmList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
  IQRegStringScalarWrite(Self,  'Prefix', edtPrefix.Text);
  IQRegStringScalarWrite(Self,  'Format', cmbFormat.Text);
  //IQRegIntegerScalarWrite(Self, 'Count',  udCount.Position);
  IQRegIntegerScalarWrite(Self, 'Start',  udStart.Position);
  IQRegIntegerScalarWrite(Self, 'End',    udEnd.Position);
  IQRegIntegerScalarWrite(Self, 'LPad',   udIndent.Position);
end;

procedure TFrmRsmList.btnCreateClick(Sender: TObject);
var
  APrefix, AFormat, AText, ALPad, ARPad: String;
  AStart, AEnd, i: Integer;
begin
  try
    AText := FormatFloat(AFormat, 100);
  except
    raise Exception.Create('Format is invalid.');
  end;

  APrefix := edtPrefix.Text;
  AFormat := cmbFormat.Text;
  AStart  := udStart.Position;
  AEnd    := udEnd.Position;
  ALPad   := Repl(' ', udIndent.Position); // iqstring
  ARPad   := sIIf(chkPValue.Checked, ' = ''''; ', '');
  memList.Clear;
  for i := AStart to AEnd do
    begin
      AText := Format('%s%s', [APrefix, FormatFloat(AFormat, i)]);
      memList.Lines.Add(ALPad + AText + ARPad);
    end;
  if memList.CanFocus then memList.SetFocus;  
//  memList.SelStart := Perform(EM_LINEINDEX, 0, 0);
  memList.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TFrmRsmList.btnSelectAllClick(Sender: TObject);
begin
  UniSession.AddJS(' var textarea = document.getElementById("'+memList.JSName+'_id-inputEl"); '+
                   ' textarea.select(); ');
end;

end.
