unit IQMS.Common.ProgressMemoForm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniProgressBar, Vcl.Controls;

type
  TFrmProgressMemo = class(TUniForm)
    PnlText: TUniPanel;
    Memo: TUniMemo;
    Panel1: TUniPanel;
    PnlCancel: TUniPanel;
    btnCancel: TUniBitBtn;
    PnlProgressBar: TUniPanel;
    ProgressBar_StatusIndicator: TUniProgressBar;
    UniPanel1: TUniPanel;
    btnCopy: TUniButton;
    btnCopyToClipboard: TUniButton;
    btnSaveToFile: TUniButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveToFileClick(Sender: TObject);
  private
    function GetShowCancelBtn: Boolean;
    procedure SetShowCancelBtn(const Value: Boolean);
    function GetProgressBarVisible: Boolean;
    procedure SetProgressBarVisible(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
  published
    property ShowCancelBtn: Boolean read GetShowCancelBtn write SetShowCancelBtn;
    property ShowProgressBar: Boolean read GetProgressBarVisible write SetProgressBarVisible;
  end;



implementation

{$R *.DFM}

uses
  IQMS.Common.Controls;

procedure TFrmProgressMemo.FormCreate(Sender: TObject);
begin
  KeyPreview := TRUE;
  ProgressBar_StatusIndicator.Width := PnlProgressBar.ClientWidth -
   (ProgressBar_StatusIndicator.Left * 2);


  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+Memo.JSName+'_id-inputEl"); '+
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
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';

end;

procedure TFrmProgressMemo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then  // User pressed the ESC (Escape) key
     begin
       Key := #0;
       Close;
     end;
end;

procedure TFrmProgressMemo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProgressMemo.btnSaveToFileClick(Sender: TObject);
var
S : TStringStream;
begin
  S := TStringStream.Create(Memo.Lines.Text);
  try
    UniSession.SendStream(S, 'Progress.txt');
  finally
    S.Free;
  end;
end;

function TFrmProgressMemo.GetShowCancelBtn: Boolean;
begin
  Result := PnlCancel.Visible;
end;

procedure TFrmProgressMemo.SetShowCancelBtn(const Value: Boolean);
begin
  PnlCancel.Visible := Value;
end;

function TFrmProgressMemo.GetProgressBarVisible: Boolean;
begin
  Result := ProgressBar_StatusIndicator.Visible;
end;

procedure TFrmProgressMemo.SetProgressBarVisible(const Value: Boolean);
begin
  ProgressBar_StatusIndicator.Visible := Value;
end;

end.
