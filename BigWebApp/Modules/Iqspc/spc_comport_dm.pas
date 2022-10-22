unit spc_comport_dm;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniImageList, uniGUIClasses;

type
  Tdm_spc_comport = class(TDataModule)
    imageListComport: TUniImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetComPortIcon(var AIcon: TIcon);

  end;

implementation

{$R *.dfm}

{ Tdm_spc_comport }

procedure Tdm_spc_comport.GetComPortIcon(var AIcon: TIcon);
begin
  if not Assigned(AIcon) then
   Exit;
  imageListComport.GetIcon(0, AIcon);
end;

end.
