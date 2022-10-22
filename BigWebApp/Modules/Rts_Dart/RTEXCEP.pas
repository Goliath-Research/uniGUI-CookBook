unit RTExcep;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMemo;

type
  TFrmExceptionList = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnClear: TUniButton;
    Button2: TUniButton;
    btnRefresh: TUniButton;
    UniMemo1: TUniMemo;
    procedure btnClearClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetStringList(const Value: TStringList);
    function GetStringList: TStringList;
  public
    { Public declarations }
    vStrList : TStringList;
    property StringList  : TStringList read GetStringList write SetStringList;
  end;

procedure DoExceptionList( AStringList : TStringList );

implementation

{$R *.DFM}

procedure DoExceptionList( AStringList : TStringList );
var
  frm : TFrmExceptionList;
begin
  frm := TFrmExceptionList.Create(UniGUIApplication.UniApplication);

  frm.StringList := AStringList;
  frm.vStrList   := TStringList.Create();
  frm.vStrList   := AStringList;

  try
    frm.ShowModal;
  finally
    frm.vStrList.Free;
    frm.Free;
  end;
end;

procedure TFrmExceptionList.btnClearClick(Sender: TObject);
begin
  vStrList.Clear;
  StringList := vStrList;
end;

procedure TFrmExceptionList.btnRefreshClick(Sender: TObject);
begin
  uniMemo1.Lines.Assign( vStrList );
end;

procedure TFrmExceptionList.SetStringList(const Value: TStringList);
begin
  uniMemo1.Lines.Clear;
  uniMemo1.Lines.Assign( Value );
end;

function TFrmExceptionList.GetStringList: TStringList;
begin
  Result := vStrList;
end;

end.

