unit IQMS.WebVcl.REPDECRW;

interface

uses
  Messages,
  SysUtils,
  Graphics,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniTreeView,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Controls, System.Classes;

type
  TCRWColumns = class(TUniForm)
    TreeCRWColumns: TUniTreeView;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Button1: TUniButton;
    Button2: TUniButton;
    procedure TreeCRWColumnsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CRWColumns: TCRWColumns;

implementation

{$R *.DFM}

procedure TCRWColumns.TreeCRWColumnsDblClick(Sender: TObject);
begin
  if TreeCRWColumns.Selected.Level = 2 then
    ModalResult:= mrOK;
end;

end.
 
