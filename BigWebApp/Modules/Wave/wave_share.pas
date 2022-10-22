unit wave_share;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  System.Generics.Collections,
  Data.DB,
  MainModule;


type
  TWaveSelectedRelease = record
    Arinvt_ID     : Real;
    Ord_Detail_ID : Real;
    Releases_ID   : Real;
    Ship_Quan     : Real;
    Must_Ship_Date: TDateTime;
    Pts_Per_Pkg   : Real;
  end;

  TWavePickCriteriaParam = record
    WavePick_ID: Real;
    Division_ID: Real;
    EPlant_ID  : Real;
    Arcusto_ID : Real;
    Ship_To_ID : Real;
    Freight_ID : Real;
    FromShipDate : TDateTime;
    ToShipDate   : TDateTime;
    Wave_Pick_Ticket_ID: Real;
    Expedite_Axe: string;
    Salespeople_ID: Real;
    PR_Emp_ID: Real;
    Cust_Group: string;
    EvalReqDate: Boolean;
    Ran_From: string;
    Ran_To: string;
    constructor Create( AWavePick_ID: Real );
  end;

procedure AssignAvailabilityColors( AInvAvail: Real; AFont: TFont; ABrush: TBrush; Highlight: Boolean );

{ TODO -oSanketG -cWebConvert : Need to revisit,
[dcc32 Error] wave_share.pas(48): E2003 Undeclared identifier: 'TGridDrawState' }
{procedure AssignWaveGridColor(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}

implementation

procedure AssignAvailabilityColors( AInvAvail: Real; AFont: TFont; ABrush: TBrush; Highlight: Boolean );
  procedure _AssignColor( F1,B1, F2, B2: TColor );
  begin
     case Highlight of
       TRUE : begin
                AFont.Color := F1;
                ABrush.Color:= B1;
              end;
       FALSE: begin
                AFont.Color := F2;
                ABrush.Color:= B2;
              end;
     end
  end;
begin
  if AInvAvail = 1 then
     _AssignColor( {highlight} clLime, clBlack, {Normal} clWhite, clGreen )  // available

  else if AInvAvail = 2 then
     _AssignColor( {highlight} clYellow, clBlack, {Normal} clBlack, clYellow )  // possibly available

  else if AInvAvail = 0 then
     // _AssignColor( {highlight} clFuchsia, clBlack, {Normal} clWhite, clRed )  // not available
     _AssignColor( {highlight} clRed, clBlack, {Normal} clWhite, clRed )  // not available
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] wave_share.pas(80): E2005 'TGridDrawState' is not a type identifier}
(*procedure AssignWaveGridColor(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  DS: TDataSet;

  procedure _AssignColor( F1,B1, F2, B2: TColor );
  begin
     case Highlight of
       TRUE : begin
                AFont.Color := F1;
                ABrush.Color:= B1;
              end;
       FALSE: begin
                AFont.Color := F2;
                ABrush.Color:= B2;
              end;
     end
  end;
begin
  DS:= (Sender as TIQUniGridControl).DataSource.DataSet;
  if not Assigned( DS ) then
     EXIT;

  // empty grid
  if Assigned(DS.FindField('id')) and (DS.FieldByName('id').asFloat = 0) then
     EXIT;

  // pick ticket exists
  if Assigned(DS.FindField('ps_ticket_id')) and (DS.FieldByName('ps_ticket_id').asFloat > 0) then
     _AssignColor( {highlight} clAqua, clBlack, {Normal} clBlack, clAqua )

  //availability
  else if Assigned( DS.FindField('avail_state')) then
     AssignAvailabilityColors( DS.FieldByName('avail_state').asFloat, AFont, ABrush, Highlight );

  // bol populated
  if Assigned(DS.FindField('itemno'))
     and
     (Field = DS.FieldByName('itemno'))
     and
     Assigned(DS.FindField('arinvt_bol_data_populated'))
     and
     (Field = DS.FieldByName('arinvt_bol_data_populated')) then
   _AssignColor( {highlight} clYellow, clBlack,  {Normal} clBlack, clYellow)
end;*)


{ TWavePickCriteriaParam }

constructor TWavePickCriteriaParam.Create(AWavePick_ID: Real);
begin
    WavePick_ID        := AWavePick_ID;
    Division_ID        := 0;
    EPlant_ID          := 0;
    Arcusto_ID         := 0;
    Ship_To_ID         := 0;
    Freight_ID         := 0;
    FromShipDate       := 0;
    ToShipDate         := 0;
    Wave_Pick_Ticket_ID:= 0;
    Expedite_Axe       := '';
    Salespeople_ID     := 0;
    PR_Emp_ID          := 0;
    Cust_Group         := '';
    EvalReqDate        := FALSE;
    Ran_From           := '';
    Ran_To             := '';
end;

end.
