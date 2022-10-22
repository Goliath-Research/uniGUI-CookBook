unit RTDebug;

interface

uses
  System.Classes,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMemo, uniHTMLMemo, Vcl.Controls;

type
  TRTDebugLog = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnRefresh: TUniButton;
    btnClear: TUniButton;
    RichEdit1: TUniHTMLMemo;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoRTDebugLog;

implementation

{$R *.DFM}

uses
 mainmodule;
//  RTSrvWin;

procedure DoRTDebugLog;
var
  RTDebugLog: TRTDebugLog;
begin
  RTDebugLog := TRTDebugLog.Create(UniApplication);
  RTDebugLog.Show;
end;

procedure TRTDebugLog.FormCreate(Sender: TObject);
begin
  btnRefreshClick(Sender);
end;

procedure TRTDebugLog.btnRefreshClick(Sender: TObject);
begin
  RichEdit1.Clear;
//  RichEdit1.Lines.Assign( RTServerWin.LogList );
end;

procedure TRTDebugLog.btnClearClick(Sender: TObject);
begin
//  RTServerWin.LogList.Clear;
  btnRefreshClick(Sender);
end;

end.

