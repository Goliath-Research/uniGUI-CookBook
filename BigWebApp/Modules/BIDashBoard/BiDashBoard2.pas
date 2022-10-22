unit BiDashBoard2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniURLFrame,
  IQWeb.Session.RegServices;

type
  TUniBiDashBoard2 = class(TUniFrame, IIQLocatable)
    UniURLFrame1: TUniURLFrame;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
    FID : integer;

    procedure LocateID(aID : integer);
    procedure SetURL;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ServerModule,
  MainModule;

procedure TUniBiDashBoard2.LocateID(aID: integer);
begin
  if aID <> FID then
  begin
    FID := aID;
    SetURL;
  end;
end;

procedure TUniBiDashBoard2.SetURL;
var
  RecordLoc : string;
begin
  if FID > 0 then
    RecordLoc := '?PackageID=' + IntToStr(FID)
  else
    RecordLoc := '';

  //UniURLFrame1.URL := UniSession.Host + '/EnterpriseIQ/BiDashBoard2/Manage?AuthToken=' + UniMainModule.AuthToken + RecordLoc;

  //BiDashBoardUniURLFrame1.Refresh;
end;

procedure TUniBiDashBoard2.UniFrameCreate(Sender: TObject);
begin
  SetURL;
end;

end.
