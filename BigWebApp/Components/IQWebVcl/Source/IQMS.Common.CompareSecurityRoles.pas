unit IQMS.Common.CompareSecurityRoles;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCompareSecurityRoles = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    SrcAllUsers: TDataSource;
    QryAllUsers: TFDQuery;
    QryAllUsersUSERNAME: TStringField;
    IQSearchUsers: TIQUniGridControl;
    sbtnRolesSummary: TUniSpeedButton;
    Panel5: TUniPanel;
    Panel4: TUniPanel;
    Panel6: TUniPanel;
    SrcCompare: TDataSource;
    QryCompare: TFDQuery;
    QryGrantedRole: TFDQuery;
    QryGrantedRoleGRANTED_ROLE_NAME: TStringField;
    pgctrlComparison: TUniPageControl;
    tabStart: TUniTabSheet;
    tabCompare: TUniTabSheet;
    Panel7: TUniPanel;
    QryAllUsersIS_DBA_USER: TStringField;
    ImageList1: TUniImageList;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwDBGridCompare: TIQUniGridControl;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnRolesSummaryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBatch: Real;
    FUsersList: TStringList;
    procedure AssignSelectedUsersList;
    procedure DeleteRolesUsersCrossReference;
    procedure PopulateRolesUsersCrossRefercence;
    procedure BuildComparisonBasedOnCrossReference;
    procedure DisplayResults;
    function GetLongestUserName: Integer;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls,
  IQMS.Common.PanelMsg,
  IQMS.Common.HelpHook;

{ TFrmCompareSecurityRoles }

class procedure TFrmCompareSecurityRoles.DoShow;
begin
  self.Create(uniGUIApplication.UniApplication).Show;
end;

procedure TFrmCompareSecurityRoles.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( Self.HelpContext );
end;

procedure TFrmCompareSecurityRoles.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmICA{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCompareSecurityRoles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel2 ]);
end;

procedure TFrmCompareSecurityRoles.FormDestroy(Sender: TObject);
begin
  DeleteRolesUsersCrossReference;
  FUsersList.Free;
end;

procedure TFrmCompareSecurityRoles.DeleteRolesUsersCrossReference;
begin
  ExecuteCommandFmt('delete from s_user_role_tmp where batch = %f', [ FBatch ]);
end;

procedure TFrmCompareSecurityRoles.sbtnRolesSummaryClick(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    AssignSelectedUsersList;
    PopulateRolesUsersCrossRefercence;
    BuildComparisonBasedOnCrossReference;
    DisplayResults;
  finally
    hMsg.Free;
  end;
end;


procedure TFrmCompareSecurityRoles.UniFormCreate(Sender: TObject);
begin
  FBatch:= GetNextID('s_user_role_tmp');
  FUsersList:= TStringList.Create;

  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, Panel2 ]);
  AdjustPageControlToParent( pgctrlComparison );

  self.FormStyle:= fsStayOnTop;
  IQMS.Common.Controls.ForceForegroundWindowB( self.Handle );
end;

procedure TFrmCompareSecurityRoles.AssignSelectedUsersList;
var
  I: Integer;
begin
  FUsersList.Clear;
  with IQSearchUsers do
  begin
     if DBGrid.DataSource.DataSet.Eof and DBGrid.DataSource.DataSet.Bof then
        EXIT;

     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          FUsersList.Add( DataSource.DataSet.FieldByName('username').asString )
        end
     else
        FUsersList.Add( DataSource.DataSet.FieldByName('username').asString );
  end;
  FUsersList.Sort;
end;


procedure TFrmCompareSecurityRoles.PopulateRolesUsersCrossRefercence;
var
  I: Integer;

  procedure AddReference( AUserName, ARoleName: string );
  begin
    ExecuteCommandFmt( 'insert into s_user_role_tmp( user_name, role_name, batch ) values( ''%s'', ''%s'', %f )',
               [ AUserName,
                 ARoleName,
                 FBatch ]);
  end;

begin
  DeleteRolesUsersCrossReference;

  for I:= 0 to FUsersList.Count - 1 do
  begin
    QryGrantedRole.Close;
    QryGrantedRole.ParamByName('username').asString:= FUsersList[ I ];
    QryGrantedRole.Open;

    if QryGrantedRole.Eof then
       AddReference( FUsersList[ I ], '* No security roles assigned *' )
    else
       while not QryGrantedRole.Eof do
       begin
         AddReference( FUsersList[ I ], QryGrantedRoleGRANTED_ROLE_NAME.asString );
         QryGrantedRole.Next;
       end;
  end;
end;


procedure TFrmCompareSecurityRoles.BuildComparisonBasedOnCrossReference;
var
  I: Integer;
  N: Integer;
begin
(* select role_name,
          max(decode( user_name, 'IQMS', 'Y', '')) as iqms,
          max(decode( user_name, 'RON', 'Y', ''))  as ron,
          max(decode( user_name, 'ARIK', 'Y', '')) as sanna
     from s_user_role_tmp
   group by role_name
   order by decode( role_name, ''* No security roles assigned *'', 0, 1), role_name *)

  // compose SQL
  QryCompare.Close;
  QryCompare.SQL.Clear;

  QryCompare.SQL.Add('select role_name');

  for I:= 0 to FUsersList.Count - 1 do
  begin
    {add comma to prev line}
    QryCompare.SQL[ QryCompare.SQL.Count - 1 ]:= QryCompare.SQL[ QryCompare.SQL.Count - 1 ] + ',';
    {add this user}
    QryCompare.SQL.Add( Format('max(decode( user_name, ''%s'', 0, -1)) as %s ', [ FUsersList[ I ], FUsersList[ I ] ]));
  end;

  QryCompare.SQL.Add('from s_user_role_tmp');
  QryCompare.SQL.Add('group by role_name');
  QryCompare.SQL.Add('order by decode( role_name, ''* No security roles assigned *'', 0, 1), role_name');

  // format grid
  wwDBGridCompare.DBGrid.SelectedRows.Delete;
  N:= GetLongestUserName();

//  wwDBGridCompare.DBGrid.SelectedRows.AddItem('ROLE_NAME'#9'35'#9'Security Role');
  for I:= 0 to FUsersList.Count - 1 do
  begin
    {first add to the grid}
//    wwDBGridCompare.Selected.Add(Format('%s'#9'%d'#9'%s', [ FUsersList[ I ], N, FUsersList[ I ] ]));

    {now make it show the bmp}
//    wwDBGridCompare.ControlType.Add(Format('%s;ImageIndex;Shrink To Fit', [ FUsersList[ I ] ]));
  end;
//  wwDBGridCompare.ApplySelected;
end;


procedure TFrmCompareSecurityRoles.DisplayResults;
begin
  QryCompare.Open;
  pgctrlComparison.ActivePage:= tabCompare;
end;

function TFrmCompareSecurityRoles.GetLongestUserName: Integer;
var
  I: Integer;
begin
  Result:= 10; // min 10
  for I:= 0 to FUsersList.Count - 1 do
    if Length(FUsersList[ I ]) > Result then
       Result:= Length(FUsersList[ I ])
end;

procedure TFrmCompareSecurityRoles.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCompareSecurityRoles.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

end.
