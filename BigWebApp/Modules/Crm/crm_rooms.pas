unit crm_rooms;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  DBCtrls,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { TFrmCRMRooms }
  TFrmCRMRooms = class(TUniForm)
    PnlToolbar: TUniPanel;
    Panel1: TUniPanel;
    SrcRooms: TDataSource;
    QryRooms: TFDQuery;
    NavMain: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    PkRooms: TIQWebHPick;
    QryRoomsID: TBCDField;
    QryRoomsNAME: TStringField;
    QryRoomsDESCRIP: TStringField;
    PkRoomsID: TBCDField;
    PkRoomsNAME: TStringField;
    PkRoomsDESCRIP: TStringField;
    GridRooms: TIQUniGridControl;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure QryRoomsAfterPost(DataSet: TDataSet);
    procedure QryRoomsBeforeDelete(DataSet: TDataSet);
    procedure QryRoomsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryRoomsNewRecord(DataSet: TDataSet);
    procedure QryRoomsBeforePost(DataSet: TDataSet);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    private
      { Private declarations }
      procedure CheckRoomIsReferencedBeforeDelete(const AID: Real);
      procedure RemoveReferencesToThisRoom(const AID: Real);
    public
      { Public declarations }
      class procedure DoShow;
  end;

procedure DoCRMRooms;

var
  FrmCRMRooms: TFrmCRMRooms;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_rscstr;

procedure DoCRMRooms;
begin
  TFrmCRMRooms.DoShow;
end;

{ TFrmCRMRooms }

procedure TFrmCRMRooms.FormCreate(Sender: TObject);
begin
  ReOpen(QryRooms);
end;

procedure TFrmCRMRooms.FormShow(Sender: TObject);
begin
//  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, GridRooms]);
end;

procedure TFrmCRMRooms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
//  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, GridRooms]);
end;

class procedure TFrmCRMRooms.DoShow;
var
  AForm: TUniForm;
begin
  AForm := FindFormByClassName('TFrmCRMRooms'); //IQMS.Common.Controls.FindFormByClassType(Self);
  if not Assigned(AForm) then
    AForm := TFrmCRMRooms.Create(uniGUIApplication.UniApplication);
  AForm.Show;
end;

procedure TFrmCRMRooms.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCRMRooms.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMRooms.Search1Click(Sender: TObject);
begin
  // Search
  with PkRooms do
    if Execute then
      QryRooms.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmCRMRooms.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmCRMRooms.QryRoomsAfterPost(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
end;

procedure TFrmCRMRooms.QryRoomsBeforeDelete(DataSet: TDataSet);
var
  AID: Real;
begin
  AID := QryRoomsID.AsFloat;
  CheckRoomIsReferencedBeforeDelete(AID);
  QryRooms.Prior;
  ExecuteCommandFmt('DELETE FROM crm_rooms WHERE id = %.0f', [AID]);
  RefreshDataSetByID(QryRooms);
  System.SysUtils.Abort;
end;

procedure TFrmCRMRooms.QryRoomsBeforePost(DataSet: TDataSet);
begin
  // crm_rscstr.cTXT0001808 = 'Please enter room name.';
  IQMS.Common.Miscellaneous.IQAssert(QryRoomsNAME.AsString > '', crm_rscstr.cTXT0001808);
end;

procedure TFrmCRMRooms.QryRoomsNewRecord(DataSet: TDataSet);
begin
  QryRoomsID.AsFloat := GetNextID('CRM_ROOMS');
end;

procedure TFrmCRMRooms.QryRoomsUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

var
  ASQL: TStringList;
begin
  if ARequest = arUpdate then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('UPDATE crm_rooms');
        ASQL.Add('   SET name = :NAME, descrip = :DESCRIP');
        ASQL.Add('WHERE id = :ID');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end
  else if ARequest = arInsert then
    begin
      ASQL := TStringList.Create;
      try
        ASQL.Add('INSERT INTO crm_rooms(id, name, descrip)');
        ASQL.Add('    VALUES (:ID, :NAME, :DESCRIP)');
        ExecuteCommandParamDataSet(ASQL.Text, ASender);
      finally
        if Assigned(ASQL) then
          FreeAndNil(ASQL);
      end;
    end;
  AAction := eaApplied;
end;

procedure TFrmCRMRooms.CheckRoomIsReferencedBeforeDelete(const AID: Real);
var
  AExists: Boolean;
begin
  // Find CRM_ACTIVITY record that references this room
  AExists := SelectValueFmtAsInteger(
    'SELECT 1'#13 +
    '  FROM crm_rooms a'#13 +
    ' WHERE a.id = 2 AND'#13 +
    '       EXISTS (SELECT 1'#13 +
    '                 FROM crm_room_schedule'#13 +
    '                WHERE crm_room_id = a.id) AND'#13 +
    '       ROWNUM < 2',
    [AID]) = 1;

  // crm_rscstr.cTXT0001809 =
  // 'This room has been scheduled.  Removing it will also ' +
  // 'remove it from the schedule.  Do you want to continue?';
  if AExists then
    begin
      if not IQConfirmYN(crm_rscstr.cTXT0001809) then
        System.SysUtils.Abort;
      RemoveReferencesToThisRoom(AID);
    end;
end;

procedure TFrmCRMRooms.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCRMRooms.RemoveReferencesToThisRoom(const AID: Real);
begin
  ExecuteCommandFmt('DELETE FROM crm_room_schedule WHERE crm_room_id = %.0f',
    [AID]);
end;

end.
