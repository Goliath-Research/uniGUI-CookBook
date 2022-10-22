unit Bom_Type;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  System.Classes,
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
  TMFG_Type = class(TUniForm)
    Label1: TUniLabel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    ComboBox1: TUniComboBox;
    Query1: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetNewMfgType:string;
  public
    { Public declarations }
    property NewMfgType:string read GetNewMfgType;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.StringUtils;

procedure TMFG_Type.FormCreate(Sender: TObject);
begin
  with Query1, ComboBox1 do
  begin
    Open;
    while not Eof do
    begin
      Items.Add( Fields[ 0 ].asString );  {add all mfgtypes}
      if Items[ Items.Count - 1 ] = 'GENERIC' then
         ItemIndex:= Items.Count - 1;
      Next;
    end;
    Query1.Close;
  end;
end;

function TMFG_Type.GetNewMfgType:string;
begin
  with ComboBox1 do
    Result:= Items[ ItemIndex ];
  if Empty(Result) then
     raise Exception.Create('No MfgType Found/Selected - unable to continue.')
end;

end.

