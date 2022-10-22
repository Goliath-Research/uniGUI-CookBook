unit IQMS.Common.PrincipalSource;

interface

uses
   System.Classes, IQMS.Common.PrincipalSourceTypes , IQMS.Common.PrincipalSourceInfoDlg;

/// <summary> Return a single-line display text for the source.
/// </summary>
function GetShortDisplay(ASource: string; ASourceID, AContactID: Real): string;

/// <summary> Return a full address information for the source.
/// </summary>
procedure GetLongDisplay(ASource: string; ASourceID, AContactID: Real;
  var ALines: TStringList);

/// <summary> Return a full address information for the source
/// in HTML format.
/// </summary>
procedure GetLongDisplayHTML(ASource: string; ASourceID: Real; AContactID: Real;
  var ALines: TStringList);

/// <summary> Display popup form containing full address information
/// for the given source.
/// </summary>
procedure ShowPrincipalSummary(AOwner: TComponent; ASource: string;
  ASourceID: Real; AContactID: Real);

implementation

function GetShortDisplay(ASource: string; ASourceID, AContactID: Real): string;
var
  o: TPrincipalDisplayRec;
begin
  o.Update(ASource, ASourceID, AContactID);
  Result := o.GetShortDisplay;
end;

procedure GetLongDisplay(ASource: string; ASourceID, AContactID: Real;
  var ALines: TStringList);
var
  o: TPrincipalDisplayRec;
begin
  if Assigned(ALines) then
    begin
      o.Update(ASource, ASourceID, AContactID);
      o.GetLongDisplay(ALines);
    end;
end;

procedure GetLongDisplayHTML(ASource: string; ASourceID: Real; AContactID: Real;
  var ALines: TStringList);
var
  o: TPrincipalDisplayRec;
begin
  if Assigned(ALines) then
    begin
      o.Update(ASource, ASourceID, AContactID);
      o.GetLongDisplayHTML(ALines);
    end;
end;

procedure ShowPrincipalSummary(AOwner: TComponent; ASource: string;
  ASourceID: Real; AContactID: Real);
begin
   TFrmPrincipalSourceInfoDlg.DoShow( ASource, ASourceID, AContactID);
end;

end.
