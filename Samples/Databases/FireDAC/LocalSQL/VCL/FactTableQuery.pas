unit FactTableQuery;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSynEditHighlighter, uSynHighlighterSQL,
  uSynEdit, uSynMemo;

type
  TFactTableQueryForm = class(TForm)
    USynMemo1: TUSynMemo;
    USynSQLSyn1: TUSynSQLSyn;
  private
    function GetSQL: string;
    procedure SetSQL(const Value: string);
    { Private declarations }
  public
    property SQL : string read GetSQL write SetSQL;
  end;

var
  FactTableQueryForm: TFactTableQueryForm;

implementation

{$R *.dfm}

{ TFactTableQueryForm }

function TFactTableQueryForm.GetSQL: string;
begin
  Result := USynMemo1.Lines.Text;
end;

procedure TFactTableQueryForm.SetSQL(const Value: string);
begin
  USynMemo1.Lines.Text := Value;
end;

end.
