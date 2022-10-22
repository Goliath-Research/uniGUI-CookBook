unit rmng_Editor;

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
  Menus,
  ExtCtrls,
  Buttons,
  StdCtrls,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, MainModule,
  uniButton, uniMemo, uniHTMLMemo;

type
  TFrmEditor = class(TUniForm)
    Panel2: TUniPanel;
    Panel1: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    RichEdit1: TUniHTMLMemo;
    procedure btnCancelClick(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    
  private
    { Private declarations }
    procedure CallBack(Sender: TComponent; AResult: Integer);
    procedure SaveChanges ( AFileName: string );  
    procedure SetFileName(AFileName:string);
  public
    { Public declarations }
    property FileName: string write SetFileName;
  end;

  function ShowEditor ( AFileName: string ): Boolean;
  

implementation

{$R *.DFM}

var
  FTextChangesStatus: Boolean;

function ShowEditor( AFileName: string ): Boolean;
var
  FrmEditor : TFrmEditor;
begin
  FrmEditor := TFrmEditor.Create(UniApplication);
  with FrmEditor do
  begin
    FileName:=AFileName;
    Result:= (ShowModal = mrOK);
    if Result then
         SaveChanges ( AFileName );
  end;
end;

procedure TFrmEditor.SaveChanges ( AFileName: string );
begin
  if FTextChangesStatus then
    RichEdit1.Lines.SaveToFile( AFileName );
end;
    
procedure TFrmEditor.SetFileName(AFileName: string);
begin
    Self.Caption:= AFileName;
    RichEdit1.Lines.LoadFromFile( AFileName );
    FTextChangesStatus:= FALSE;
end;

procedure TFrmEditor.btnCancelClick(Sender: TObject);
var
  S: string;
begin
  if FTextChangesStatus then
  begin
    S:= 'The text in the file has changed.'#10#13'Do you want to save the changes?';
    MessageDlg( S, mtWarning, [mbYes, mbNo], CallBack);
  end
  else
    ModalResult:= mrCancel;
end;


procedure TFrmEditor.CallBack(Sender: TComponent; AResult: Integer);
begin
  if AResult=mrYes then
  begin
    ModalResult:= mrOk;
  end
  else
    ModalResult:= mrCancel;
end;

procedure TFrmEditor.RichEdit1Change(Sender: TObject);
begin
  FTextChangesStatus:= True;
end;

end.


