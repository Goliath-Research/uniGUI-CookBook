unit TagErr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMemo, uniBasicGrid, uniStringGrid;

type
  TFrmTagErrorHandler = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnAbort: TUniButton;
    Splitter1: TUniSplitter;
    btnIgnore: TUniButton;
    UniMemo1: TUniMemo;
    UniStringGrid1: TUniStringGrid;
    procedure FormResize(Sender: TObject);
  private
    procedure SetErrorMessage(const Value: String);
    procedure SetQuery(const Value: TFDQuery);
    procedure SetCanIgnore(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }

     property ErrorMessage  : string    write SetErrorMessage;
     property Query         : TFDQuery  write SetQuery;
     property CanIgnore     : boolean   write SetCanIgnore;
  end;


function TagErrHandled( const EMesg: string; Qry: TFDQuery; ACanIgnore: Boolean = TRUE ): Boolean;

implementation

{$R *.DFM}

uses
  Data.DB;

function TagErrHandled( const EMesg: string; Qry: TFDQuery; ACanIgnore: Boolean = TRUE ): Boolean;
var
  frm : TFrmTagErrorHandler;
begin
  frm := TFrmTagErrorHandler.Create(UniApplication);

  frm.ErrorMessage  := EMesg;
  frm.Query         := Qry;
  frm.CanIgnore     := ACanIgnore;

  Result:= frm.ShowModal = mrIgnore;
end;

procedure TFrmTagErrorHandler.FormResize(Sender: TObject);
begin
  with UniStringGrid1 do
    Columns[ 1 ].Width := ClientWidth - Columns[ 0 ].Width - 2;
end;

procedure TFrmTagErrorHandler.SetCanIgnore(const Value: boolean);
begin
  btnIgnore.Enabled := Value;
end;

procedure TFrmTagErrorHandler.SetErrorMessage(const Value: String);
begin
  UniMemo1.Text := Value;
end;

procedure TFrmTagErrorHandler.SetQuery(const Value: TFDQuery);
var
  I:Integer;
begin
  uniStringGrid1.ReadOnly   := True;
  uniStringGrid1.Cells[0,0] := 'Field';
  uniStringGrid1.Cells[1,0] := 'Value';

  with Value do
    for I := 0 to FieldCount - 1 do
    begin
      uniStringGrid1.RowCount   := uniStringGrid1.RowCount + 1;
      uniStringGrid1.Cells[0,I] := Fields[ I ].FieldName;
      uniStringGrid1.Cells[1,I] := Fields[ I ].AsString;
    end;
end;

end.
