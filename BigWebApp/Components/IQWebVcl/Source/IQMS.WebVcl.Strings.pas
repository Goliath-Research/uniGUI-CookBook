unit IQMS.WebVcl.Strings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TIQWebStrings = class(TComponent)
  private
    { Private declarations }
    FItems: TStrings;
    FText : string;
    procedure SetItems( Value : TStrings );
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Items: TStrings  read FItems write SetItems;
    property Text : string read FText write FText;
  end;

implementation

constructor TIQWebStrings.Create(AOwner:TComponent);
begin
  inherited;
  FItems:= TStringList.Create;
end;

destructor TIQWebStrings.Destroy;
begin
  Items.Free;
  inherited Destroy;
end;

procedure TIQWebStrings.SetItems( Value : TStrings );
begin
  if Items.Text <> Value.Text then
  begin
    Items.BeginUpdate;
    try
      Items.Assign( Value );
    finally
      Items.EndUpdate;
    end;
  end;
end;

end.
