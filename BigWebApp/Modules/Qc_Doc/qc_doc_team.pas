unit qc_doc_team;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  Wwdatsrc,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  Menus,
  ExtCtrls,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniGUIFrame, IQUniGrid;

type
  TFrmQCDocTeam = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Grid: TIQUniGridControl;
    DocTeam: TDataSource;
    QryTeamMember: TFDQuery;
    QryTeamMemberID: TBCDField;
    QryTeamMemberNAME: TStringField;
    QryTeamMemberTITLE: TStringField;
    wwTeam: TUniDBLookupComboBox;
    wwAuthRev: TUniDBComboBox;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    TblDocTeam: TFDQuery;
    TblDocTeamSEQ: TBCDField;
    TblDocTeamTYPE: TStringField;
    TblDocTeamTEAM_MEMBER_ID: TBCDField;
    TblDocTeamID: TBCDField;
    TblDocTeamDOC_LIBRARY_ID: TBCDField;
    TblDocTeamNAME: TStringField;
    UpdateSQLTeamDoc: TFDUpdateSQL;
    SrcTeamMember: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblDocTeamNewRecord(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwTeamCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    { TODO : TGridDrawState not converted unit }
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);  }
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TblDocTeamBeforeOpen(DataSet: TDataSet);
    procedure TblDocTeamBeforePost(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDocLibId :Real;
    procedure SetDocLibId(const Value: Real);
  public
    { Public declarations }
    property DocLibId : Real write SetDocLibId;
  end;

procedure DoAssignDocTeam(ADocLibId:Real);

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

{$R *.DFM}

procedure DoAssignDocTeam(ADocLibId:Real);
var
  LFrmQCDocTeam : TFrmQCDocTeam;
begin
  LFrmQCDocTeam := TFrmQCDocTeam.Create(UniGUIApplication.UniApplication);
  with LFrmQCDocTeam do
  begin
    DocLibId := ADocLibId;
    Show;
  end;
end;

procedure TFrmQCDocTeam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, Grid]);
end;

procedure TFrmQCDocTeam.SetDocLibId(const Value: Real);
begin
  FDocLibId := Value;
end;

procedure TFrmQCDocTeam.TblDocTeamNewRecord(DataSet: TDataSet);
var
  AMaxSeq:Real;
begin
  TblDocTeamDOC_LIBRARY_ID.asFloat := FDocLibId;

  if TblDocTeamSEQ.asInteger = 0 then
  begin
    AMaxSeq := SelectValueFmtAsFloat('select max(seq) from DOC_TEAM where id <> %f and DOC_LIBRARY_ID = %f',
                          [TblDocTeamID.asFloat, TblDocTeamDOC_LIBRARY_ID.asFloat]);
    TblDocTeamSEQ.asInteger := Trunc(AMaxSeq) + 1;
  end;
end;

procedure TFrmQCDocTeam.UniFormShow(Sender: TObject);
var
  ADescrip:String;
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [self, Grid]);

  ADescrip:= SelectValueFmtAsString('select descrip from DOC_LIBRARY where id = %f', [FDocLibId]);
  if Adescrip <> '' then
    Caption := Format('Team Members of %s', [Adescrip]);
end;

procedure TFrmQCDocTeam.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQCDocTeam.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmQCDocTeam.wwTeamCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if not modified then exit;

  with TblDocTeam do
    if not (State in [dsEdit, dsInsert]) then Edit;

  TblDocTeamTEAM_MEMBER_ID.asFloat := QryTeamMemberID.asFloat;
  TblDocTeamNAME.asString:= SelectValueByID('name', 'team_member', TblDocTeamTEAM_MEMBER_ID.asFloat);
  wwTeam.Text:= TblDocTeamNAME.asString;
end;

{ TODO : TGridDrawState not converted unit }
{procedure TFrmQCDocTeam.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if CompareText( TblDocTeamTYPE.asString, 'Review') = 0 then
     AFont.Style:= AFont.Style + [fsItalic];
end;       }

procedure TFrmQCDocTeam.TblDocTeamBeforeOpen(DataSet: TDataSet);
begin
//  TFDQuery(DataSet).ParamByName('doc_library_id').asFloat:= FDocLibId;
  AssignQueryParamValue(DataSet, 'doc_library_id', FDocLibId);
end;

procedure TFrmQCDocTeam.TblDocTeamBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'doc_team'); {in IQlib}
end;

procedure TFrmQCDocTeam.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

procedure TFrmQCDocTeam.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender,Button);
end;

procedure TFrmQCDocTeam.Contents1Click(Sender: TObject);
begin
  if Assigned( IQHelp ) then
     IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmQCDocTeam.FormActivate(Sender: TObject);
begin
  if Assigned( IQHelp ) then
     IQHelp.AssignHTMLFile( iqchmQuality{CHM}, iqhtmQuality{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
