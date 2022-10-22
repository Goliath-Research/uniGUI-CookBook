unit iqdbx_summary;

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
  Menus,
  MainModule,
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
  uniButton;

type
  TFrmIQDBXSummary = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    memSummary: TUniMemo;
    lblPrompt: TUniLabel;
    Panel4: TUniPanel;
    btnClose: TUniButton;
    btnCopyToClipboard: TUniButton;
    btnSelectAll: TUniButton;
    procedure UniFormCreate(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    private
      { Private declarations }
      procedure SetErrorCount(AErrorCount:integer);
      procedure SetLines(ALines:TStringList);
    public
      property ErrorCount : integer write SetErrorCount;
      property Lines : TStringList write SetLines;
      { Public declarations }
  end;

procedure ShowProcessSummary(AErrorCount: Integer; ALines: TStringList);

implementation

{$R *.dfm}

procedure ShowProcessSummary(AErrorCount: Integer; ALines: TStringList);
var
  FrmIQDBXSummary : TFrmIQDBXSummary;
begin
  FrmIQDBXSummary := TFrmIQDBXSummary.Create(uniGUIApplication.UniApplication);
   with FrmIQDBXSummary do
    begin
      ErrorCount:=AErrorCount;
      Lines:=ALines;
      ShowModal;
    end;
end;

{ TFrmIQDBXSummary }


procedure TFrmIQDBXSummary.btnSelectAllClick(Sender: TObject);
begin
  UniSession.AddJS(' var textarea = document.getElementById("'+memSummary.JSName+'_id-inputEl"); '+
                   ' textarea.select(); ');
end;

procedure TFrmIQDBXSummary.SetErrorCount(AErrorCount: integer);
begin
 if AErrorCount > 0 then
  lblPrompt.Caption := Format('Finished importing with %d errors.',
    [AErrorCount]);
end;

procedure TFrmIQDBXSummary.SetLines(ALines: TStringList);
begin
  if Assigned(ALines) then
    memSummary.Lines.AddStrings(ALines);
end;

procedure TFrmIQDBXSummary.UniFormCreate(Sender: TObject);
begin
  btnCopyToClipboard.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memSummary.JSName+'_id-inputEl"); '+
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

end.
