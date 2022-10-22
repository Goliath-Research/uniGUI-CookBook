unit FR_Group;

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
  DBGrids,
  DBCtrls,
  ExtCtrls,
  Wwdbigrd,
  Wwdbgrid,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  Menus,
  IQMS.WebVcl.About,
  ComCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmForeGroups = class(TUniForm)
    wwSrcFR_Group: TDataSource;
    wwSrcFR_Group_Dtl: TDataSource;
    wwTblFR_Group: TFDTable;
    wwTblFR_Group_Dtl: TFDTable;
    wwTblFR_GroupID: TBCDField;
    wwTblFR_GroupCODE: TStringField;
    wwTblFR_GroupDESCRIP: TStringField;
    wwTblFR_Group_DtlID: TBCDField;
    wwTblFR_Group_DtlFR_GROUP_ID: TBCDField;
    wwTblFR_Group_DtlGLYEAR_ID: TBCDField;
    wwTblFR_Group_DtlQUARTER: TBCDField;
    wwTblFR_Group_DtlSTART_DATE: TDateTimeField;
    wwTblFR_Group_DtlEND_DATE: TDateTimeField;
    wwTblFR_Group_DtlPRCNT_CHANGE: TFMTBCDField;
    wwTblFR_Group_DtlSEQ: TBCDField;
    pnlGroups: TUniPanel;
    wwGrdGroup: TIQUniGridControl;
    Splitter1: TUniSplitter;
    wwComboTrgQuarter: TUniDBComboBox;
    wwComboLookupGLYear: TUniDBLookupComboBox;
    wwQryGLYear: TFDQuery;
    wwQryGLYearID: TBCDField;
    wwQryGLYearDESCRIP: TStringField;
    wwQryGLYearSTART_DATE: TDateTimeField;
    wwQryGLYearEND_DATE: TDateTimeField;
    wwComboSrcQuarter: TUniDBComboBox;
    wwTblFR_Group_DtlGLYear: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    wwGrdGroup_Dtl: TIQUniGridControl;
    wwGrdGroup_Dtl_Period: TIQUniGridControl;
    wwLookupComboSrcPeriod: TUniDBLookupComboBox;
    wwQryGLPeriods: TFDQuery;
    wwQryGLPeriodsPERIOD: TBCDField;
    wwQryGLPeriodsSTART_DATE: TDateTimeField;
    wwQryGLPeriodsEND_DATE: TDateTimeField;
    wwLookupComboTrgPeriod: TUniDBLookupComboBox;
    wwSrcFR_Group_Dtl_Period: TDataSource;
    wwTblFR_Group_Dtl_Period: TFDTable;
    wwTblFR_Group_Dtl_PeriodID: TBCDField;
    wwTblFR_Group_Dtl_PeriodFR_GROUP_ID: TBCDField;
    wwTblFR_Group_Dtl_PeriodGLYEAR_ID: TBCDField;
    wwTblFR_Group_Dtl_PeriodSTART_DATE: TDateTimeField;
    wwTblFR_Group_Dtl_PeriodEND_DATE: TDateTimeField;
    wwTblFR_Group_Dtl_PeriodPRCNT_CHANGE: TFMTBCDField;
    wwTblFR_Group_Dtl_PeriodPERIOD_SRC: TBCDField;
    wwTblFR_Group_Dtl_PeriodPERIOD_TRG: TBCDField;
    wwComboLookupGLYearPeriod: TUniDBLookupComboBox;
    wwTblFR_Group_Dtl_PeriodGLYear: TStringField;
    Contents1: TUniMenuItem;
    wwSrcGLPeriods: TDataSource;
    wwSrcGLYear: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure CheckQuarters(DataSet: TDataSet);
    procedure wwGrdGroup_DtlCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwTblFR_GroupBeforePost(DataSet: TDataSet);
    procedure wwTblFR_Group_DtlAfterPost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure wwLookupComboSrcPeriodDropDown(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure wwTblFR_Group_Dtl_PeriodBeforeInsert(DataSet: TDataSet);
    procedure wwTblFR_Group_Dtl_PeriodAfterInsert(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FPrevGLYear_ID     : Real;
    FPrevPeriod_Src    : Real;
    FPrevPeriod_Trg    : Real;
    FPrevPercent_Change: Real;
    procedure Ensure4Quarters( AGroup_ID: Real );
  public
    { Public declarations }
  end;

procedure DoForecastGroups;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoForecastGroups;
var
  FrmForeGroups: TFrmForeGroups;
begin
  FrmForeGroups := TFrmForeGroups.Create( uniGUIApplication.uniApplication );
  FrmForeGroups.ShowModal;
end;

procedure TFrmForeGroups.FormCreate(Sender: TObject);
begin

  IQRegFormRead( self, [ self, pnlGroups, wwGrdGroup, wwGrdGroup_Dtl, wwGrdGroup_Dtl_Period ]);

  PageControl1.ActivePage:= TabSheet1;
  PageControl1Change( NIL );
end;

procedure TFrmForeGroups.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE , self );
end;

procedure TFrmForeGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlGroups, wwGrdGroup, wwGrdGroup_Dtl, wwGrdGroup_Dtl_Period ]);
end;

procedure TFrmForeGroups.wwTblFR_GroupBeforePost(DataSet: TDataSet);
begin
  if Trim(wwTblFR_GroupCODE.asString)='' then
     raise exception.create('Group code is mandatory');
  wwTblFR_GroupCODE.asString:= UpperCase( wwTblFR_GroupCODE.asString );
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmForeGroups.AssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmForeGroups.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

procedure TFrmForeGroups.CheckQuarters(DataSet: TDataSet);
begin
  Ensure4Quarters( wwTblFR_GroupID.asFloat );
end;

procedure TFrmForeGroups.Ensure4Quarters( AGroup_ID: Real );
begin
  if AGroup_ID = 0 then
     EXIT;

  if SelectValueFmtAsFloat('select count(*) from fr_group_dtl where fr_group_id = %f', [ AGroup_ID ]) = 4 then
     EXIT;

  ExecuteCommandFmt('insert into fr_group_dtl   '+
            '      ( fr_group_id, seq ) '+
            ' select %f, 1 from dual    '+
            ' union all                 '+
            ' select %f, 2 from dual    '+
            ' union all                 '+
            ' select %f, 3 from dual    '+
            ' union all                 '+
            ' select %f, 4 from dual    '+
            ' MINUS                     '+
            ' select fr_group_id, seq from fr_group_dtl where fr_group_id = %f ',
            [ AGroup_ID, AGroup_ID, AGroup_ID, AGroup_ID, AGroup_ID ]);

  wwTblFR_Group_Dtl.Refresh;
end;

procedure TFrmForeGroups.wwGrdGroup_DtlCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;


procedure TFrmForeGroups.wwTblFR_Group_DtlAfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;  {this will update start/end date of the quarter}
end;

procedure TFrmForeGroups.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmForeGroups.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmForeGroups.wwLookupComboSrcPeriodDropDown(Sender: TObject);
begin
  with wwQryGLPeriods do
  begin
    Close;
//    wwQryGLPeriods.ParamByName('glyear_id').asFloat:= wwTblFR_Group_Dtl_PeriodGLYEAR_ID.asFloat;
    AssignQueryParamValue(wwQryGLPeriods, 'glyear_id', wwTblFR_Group_Dtl_PeriodGLYEAR_ID.asFloat);
    Open;
  end;
end;

procedure TFrmForeGroups.PageControl1Change(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit
  [dcc32 Error] FR_Group.pas(276): E2003 Undeclared identifier: 'NavDtl'}
  {if PageControl1.ActivePage = TabSheet1 then
     NavDtl.DataSource:= wwGrdGroup_Dtl_Period.DataSource
  else
     NavDtl.DataSource:= wwGrdGroup_Dtl.DataSource;}
end;

procedure TFrmForeGroups.wwTblFR_Group_Dtl_PeriodBeforeInsert(DataSet: TDataSet);
begin
  PostParentsBeforeEdit(DataSet);
  FPrevGLYear_ID     := wwTblFR_Group_Dtl_PeriodGLYEAR_ID.asFloat;
  FPrevPeriod_Src    := wwTblFR_Group_Dtl_PeriodPERIOD_SRC.asFloat;
  FPrevPeriod_Trg    := wwTblFR_Group_Dtl_PeriodPERIOD_TRG.asFloat;
  FPrevPercent_Change:= wwTblFR_Group_Dtl_PeriodPRCNT_CHANGE.asFloat;
end;

procedure TFrmForeGroups.wwTblFR_Group_Dtl_PeriodAfterInsert(DataSet: TDataSet);
begin
  if FPrevGLYear_ID > 0 then
     wwTblFR_Group_Dtl_PeriodGLYEAR_ID.asFloat:= FPrevGLYear_ID;

  wwTblFR_Group_Dtl_PeriodPERIOD_SRC.asFloat  := FPrevPeriod_Src + 1;
  wwTblFR_Group_Dtl_PeriodPERIOD_TRG.asFloat  := FPrevPeriod_Trg + 1;
  wwTblFR_Group_Dtl_PeriodPRCNT_CHANGE.asFloat:= FPrevPercent_Change;

end;

procedure TFrmForeGroups.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1000064 );
end;

procedure TFrmForeGroups.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmForecast{CHM}, iqhtmForecast{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
