unit IQMS.Common.DartNode;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmDartNodes = class(TUniForm)
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    ComboBox1: TUniComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPath : string;
    FName : string;
    function GetPath: String;
    procedure SetPath(const Value: String);
    function GetName: String;
    procedure SetName(const Value: String);
  public
    { Public declarations }
    class function GetDARTNodeName( var AName:string; const APath: string ):Boolean;

    property Path : String read GetPath write SetPath;
    property Name : String read GetName write SetName;
  end;


implementation

{$R *.DFM}

class function TFrmDartNodes.GetDARTNodeName( var AName:string; const APath: string ):Boolean;
var
  frm : TFrmDartNodes;
begin

  frm := TFrmDartNodes.Create(uniGUIApplication.UniApplication);
  frm.Path := APath;

  Result := (frm.ShowModal = mrOk) and (frm.ComboBox1.Text <> '');
  if Result then
     frm.Name := frm.ComboBox1.Text;
end;

function TFrmDartNodes.GetName: String;
begin
  Result := FName;
end;

function TFrmDartNodes.GetPath: String;
begin
   Result := FPath;
end;

procedure TFrmDartNodes.SetName(const Value: String);
begin
 FName := Value;
end;

procedure TFrmDartNodes.SetPath(const Value: String);
begin
  FPath := Value;
end;

procedure TFrmDartNodes.FormCreate(Sender: TObject);
var
  SearchRec : TSearchRec;
  FindResult: Integer;
begin
  ComboBox1.Clear;
  FindResult:= FindFirst( FPath + '*.CFG', faAnyFile, SearchRec );
  while FindResult = 0 do
  begin
    ComboBox1.Items.Add( Copy( SearchRec.Name, 1, Length( SearchRec.Name ) - 4));
    FindResult:= FindNext( SearchRec );
    Application.ProcessMessages;
  end;
  if ComboBox1.Items.Count > 0 then
     ComboBox1.ItemIndex:= 0;
end;

end.
