unit fix_debug_string;

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
  StdCtrls,
  Buttons,
  Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniMainMenu,
  uniMemo,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmFixDelphiDebugStr = class(TUniForm)
    Panel1: TUniPanel;
    Label1: TUniLabel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    Label2: TUniLabel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    memOriginal: TUniMemo;
    memFixed: TUniMemo;
    sbtnPaste: TUniSpeedButton;
    sbtnCopy: TUniSpeedButton;
    sbtnClearOriginal: TUniSpeedButton;
    sbtnClearFixed: TUniSpeedButton;
    sbtnExecute: TUniSpeedButton;
    Bevel2: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Edit1: TUniMenuItem;
    PasteFromClipboard1: TUniMenuItem;
    ClearOriginalText1: TUniMenuItem;
    FixText1: TUniMenuItem;
    N1: TUniMenuItem;
    CopyFixedTextToClipboard1: TUniMenuItem;
    ClearFixedText1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure PasteFromClipboard1Click(Sender: TObject);
    procedure ClearOriginalText1Click(Sender: TObject);
    procedure FixText1Click(Sender: TObject);
    procedure ClearFixedText1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



    procedure DoShow;

implementation

{$R *.dfm}


uses
 MainModule,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  StrUtils;

procedure DoShow;
var
  FrmFixDelphiDebugStr: TFrmFixDelphiDebugStr;
begin
  FrmFixDelphiDebugStr := TFrmFixDelphiDebugStr.Create(UniApplication);
  FrmFixDelphiDebugStr.ShowModal;
end;

procedure TFrmFixDelphiDebugStr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmFixDelphiDebugStr.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFixDelphiDebugStr.PasteFromClipboard1Click(Sender: TObject);
begin
//  UniSession.AddJS(' var clipboardData; '+
//  ' clipboardData = window.clipboardData; '+
//  ' document.getElementById('''+memOriginal.JSName+'_id-inputEl'').innerHTML= clipboardData.getData(''Text'');');
end;

procedure TFrmFixDelphiDebugStr.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlLeft01]);

  sbtnCopy.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memFixed.JSName+'_id-inputEl"); '+
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

procedure TFrmFixDelphiDebugStr.ClearOriginalText1Click(Sender: TObject);
begin
  memOriginal.Lines.Clear;
end;

procedure TFrmFixDelphiDebugStr.ClearFixedText1Click(Sender: TObject);
begin
  memFixed.Lines.Clear;
end;

procedure TFrmFixDelphiDebugStr.FixText1Click(Sender: TObject);
var
  AText, ALineText: string;
  ALines: TStringList;
  i: Integer;
begin
  ALines := TStringList.Create;
  try
    memFixed.Lines.BeginUpdate;
    try
      memFixed.Lines.Clear;
      AText := memOriginal.Text;
      AText := StrTran(AText, '#$D#$A', #13);
      ALines.Text := AText;
      for i := 0 to ALines.Count - 1 do
      begin
        ALineText := ALines.Strings[i];
        ALineText := AnsiDequotedStr(ALineText, '''');
        memFixed.Lines.Add(ALineText);
      end;
    finally
      memFixed.Lines.EndUpdate;
    end;
  finally
    if Assigned(ALines) then
      FreeAndNil(ALines);
  end;
end;

end.
