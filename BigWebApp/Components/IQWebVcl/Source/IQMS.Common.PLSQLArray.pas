(*Immitate PL/SQL Arrays.
  Example:

  {Create array}
  ArrWCenters:= TPLSQLTable.Create;

  if not Assigned( ArrWCenters['ABC'] ) then
    ArrWCenters.Add('ABC');

  with AWorkCenters['ABC'] do
  begin
     Values['a1']:= '1234';
     Values['a2']:= '9999';
  end;

  or

  with AWorkCenters['ABC'] do
     Items.Text:= 'a1=1234#13a2=9999'

*)

unit IQMS.Common.PLSQLArray;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Controls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf;

type

  TPLSQLRecord = class(TCollectionItem)
  private
    FKey: string;
    FItems: TStrings;
    function GetValue(const Name: string): string;
    procedure SetValue(const Name, Value: string);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Key: string read FKey write FKey;
    property Items: TStrings read FItems;
    property Values[const Name: string]: string read GetValue write SetValue;
  end;

  TPLSQLRecordClass = class of TPLSQLRecord;

  TPLSQLTable = class(TCollection)
  private
    function GetPLSQLRecord( const AKey: string ): TPLSQLRecord;
    procedure SetPLSQLRecord( const AKey: string; Value: TPLSQLRecord );
  public
    constructor Create;
    function Add( AKey: string ): TCollectionItem;
    property Records[ const AKey: string ]: TPLSQLRecord read GetPLSQLRecord write SetPLSQLRecord; default;
  end;

implementation

{ TPLSQLRecord }

constructor TPLSQLRecord.Create( Collection: TCollection );
begin
  inherited Create(Collection);
  FItems:= TStrings.Create;
end;

destructor TPLSQLRecord.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TPLSQLRecord.GetValue(const Name: string): string;
begin
  Result:= FItems.Values[ Name ];
end;

procedure TPLSQLRecord.SetValue(const Name, Value: string);
begin
  FItems.Values[ Name ]:= Value;
end;


{ TPLSQLTable }

constructor TPLSQLTable.Create;
begin
  inherited Create( TPLSQLRecord );
end;

function TPLSQLTable.GetPLSQLRecord( const AKey: string ): TPLSQLRecord;
var
  I: Integer;
begin
  for I := 0 to Count-1 do
  begin
    Result := TPLSQLRecord(Items[ I ]);
    if CompareText( Result.Key, AKey ) =  0 then Exit;
  end;
  Result:= NIL;
end;

procedure TPLSQLTable.SetPLSQLRecord( const AKey: string; Value: TPLSQLRecord );
var
  I: Integer;
begin
  for I:= 0 to Count - 1 do
    if CompareText( TPLSQLRecord(Items[ I ]).Key, AKey ) = 0 then
    begin
       Items[ I ].Assign(Value);
       EXIT;
    end;
end;

function TPLSQLTable.Add( AKey: string ): TCollectionItem;
begin
  Result:= inherited Add;
  with TPLSQLRecord(Result) do
    Key:= AKey;
end;

end.
