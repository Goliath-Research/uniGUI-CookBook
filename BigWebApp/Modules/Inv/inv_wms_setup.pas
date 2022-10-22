unit inv_wms_setup;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.HotLabel,
  { TODO -ohphadke : Dependency
  //IQMS.Common.UserMessages,}
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniLabel;

type
  TFrmInvWmsSetup = class(TUniForm)
    pnlMain: TUniPanel;
    Panel1: TUniPanel;
    pnlVSeparator1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlowPanel1Resize(Sender: TObject);
    procedure hlWMSTeamClick(Sender: TObject);
    procedure hlWMSEquipClick(Sender: TObject);
    procedure hlInvAislesClick(Sender: TObject);
    procedure hlInvZonesClick(Sender: TObject);
    procedure hlLocationTypeClick(Sender: TObject);
    procedure hlInvMoveClassClick(Sender: TObject);
    procedure hlExitClick(Sender: TObject);
    procedure hlInvLocationsClick(Sender: TObject);
    procedure hlInvShuttleLocsClick(Sender: TObject);
    procedure hlWMSInvGroupsClick(Sender: TObject);
    procedure hlInvAisles1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    { TODO -ohphadke : Dependency }
    //procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  inv_aisle_loc_gen,
  inv_aisles,
  inv_location_type,
  inv_move_class,
  { TODO -ohphadke : Dependency
  inv_rf_teams,
  Location, }
  inv_trans_shuttle_locs,
  inv_wms_eqmt,
  inv_wms_groups,
  inv_zones,
  IQMS.Common.RegFrm;

{ TFrmInvWmsSetup }


class procedure TFrmInvWmsSetup.DoShow;
Var
  LFrmInvWmsSetup : TFrmInvWmsSetup;
begin
  LFrmInvWmsSetup := TFrmInvWmsSetup.Create(UniGUIApplication.UniApplication);
  LFrmInvWmsSetup.Show;
end;

procedure TFrmInvWmsSetup.FlowPanel1Resize(Sender: TObject);
begin
  //pnlHSeparator1.Width:= FlowPanel1.ClientWidth;
  //pnlHSeparator2.Width:= FlowPanel1.ClientWidth;
end;

procedure TFrmInvWmsSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmInvWmsSetup.hlExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvWmsSetup.hlInvAislesClick(Sender: TObject);
begin
  TFrmInvAisles.DoShow;   // inv_aisles.pas
end;

procedure TFrmInvWmsSetup.hlInvLocationsClick(Sender: TObject);
begin
  // DoLocations;  {Location.pas}
  //TLocationsTable.DoShow( self ); {Location.pas}
end;

procedure TFrmInvWmsSetup.hlInvMoveClassClick(Sender: TObject);
begin
  TFrmInvMoveClass.DoShow( Application  );  // inv_move_class.pas
end;

procedure TFrmInvWmsSetup.hlInvZonesClick(Sender: TObject);
begin
  TFrmInvZones.DoShow;  // inv_zones.pas
end;

procedure TFrmInvWmsSetup.hlLocationTypeClick(Sender: TObject);
begin
  TFrmInvLocationType.DoShow;  // inv_location_type.pas
end;

procedure TFrmInvWmsSetup.hlWMSEquipClick(Sender: TObject);
begin
  TFrmInvWMSEquipment.DoShow;  // inv_wms_eqmt.pas
end;

procedure TFrmInvWmsSetup.hlWMSTeamClick(Sender: TObject);
begin
  //TFrmInvRFTeams.DoShow( Application  );  // inv_rf_teams.pas
end;

{ TODO -ohphadke : Dependency
procedure TFrmInvWmsSetup.IQAfterShowMessage(var Msg: TMessage);
  procedure _assign_btnface( P: TUniPanel );
  begin
    P.ParentBackground:= True;
    P.ParentBackground:= False;
    P.Color:= clBtnFace;
  end;
begin
  _assign_btnface( pnlVSeparator1 );
  _assign_btnface( pnlHSeparator1 );
  _assign_btnface( pnlHSeparator2 );
end;}

procedure TFrmInvWmsSetup.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, []);
  //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmInvWmsSetup.hlInvShuttleLocsClick(Sender: TObject);
begin
  TFrmInvTransShuttleLocs.DoShow;  //inv_trans_shuttle_locs
end;

procedure TFrmInvWmsSetup.hlWMSInvGroupsClick(Sender: TObject);
begin
  TFrmInvWmsGroups.DoShow;  // inv_wms_groups.pas
end;

procedure TFrmInvWmsSetup.hlInvAisles1Click(Sender: TObject);
begin
  TFrmInvAisleLocationGenerator.DoShow;  // inv_aisle_loc_gen.pas
end;



end.
