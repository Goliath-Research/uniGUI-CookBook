unit AssyTrack_Add;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  IQMS.Common.DataConst,
//  IQMS.Common.UserMessages,
//  Mask,
  RTTypes,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMainMenu,
  uniDBGrid, //TUniDBGridColumn
  Vcl.DBCtrls, //TNavigateBtn
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmAssyTrackAdd = class(TUniForm)
    Panel1: TUniPanel;
    IQSearchWO: TIQUniGridControl;
    SrcUnsched: TDataSource;
    QryUnsched: TFDQuery;
    QryUnschedID: TBCDField;
    QryUnschedSTANDARD_ID: TBCDField;
    QryUnschedPARTNO_ID: TBCDField;
    QryUnschedSTART_TIME: TDateTimeField;
    QryUnschedPRODHRS: TFMTBCDField;
    QryUnschedMFGNO: TStringField;
    QryUnschedITEMNO: TStringField;
    QryUnschedREV: TStringField;
    QryUnschedCLASS: TStringField;
    QryUnschedDESCRIP: TStringField;
    QryUnschedEPLANT_ID: TBCDField;
    QryUnschedPTORDER_ID: TBCDField;
    QryUnschedARINVT_ID: TBCDField;
    QryUnschedSTD_COST: TFMTBCDField;
    QryUnschedREL_DATE: TDateTimeField;
    QryUnschedQty: TFloatField;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    QryUnschedPRIORITY: TStringField;
    QryUnschedFIRM: TStringField;
    popmGridWO: TUniPopupMenu;
    JumpToWorkOrder1: TUniMenuItem;
    JumpToBOM1: TUniMenuItem;
    JumpToInventory1: TUniMenuItem;
    IQJumpWO: TIQWebJump;
    IQJumpBOM: TIQWebJump;
    IQJumpInv: TIQWebJump;
    PkWorkorders: TIQWebHPick;
    PkWorkordersID: TBCDField;
    PkWorkordersMFGNO: TStringField;
    PkWorkordersSTART_TIME: TDateTimeField;
    PkWorkordersPRODHRS: TFMTBCDField;
    PkWorkordersITEMNO: TStringField;
    PkWorkordersREV: TStringField;
    PkWorkordersCLASS: TStringField;
    PkWorkordersDESCRIP: TStringField;
    PkWorkordersEPLANT_ID: TBCDField;
    PkWorkordersFIRM: TStringField;
    PkWorkordersPARTNO_ID: TBCDField;
    PkWorkordersPTORDER_ID: TBCDField;
    PkWorkordersARINVT_ID: TBCDField;
    PkWorkordersSTANDARD_ID: TBCDField;
    pnlTopToolBar: TUniPanel;
    QryUnschedORIGIN: TStringField;
    QryUnschedIS_XCPT_MAT: TStringField;
    pnlFilterDays: TUniPanel;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsADD_JOBS_DAYS_OUT_FILTER: TBCDField;
    NavParams: TUniDBNavigator;
    Bevel1: TUniPanel;
    StatusBar1: TUniStatusBar;
    QryUnschedDESCRIP2: TStringField;
    QryUnschedCUSTNO: TStringField;
    QryUnschedCOMPANY: TStringField;
    QryUnschedORDERNO: TStringField;
    procedure QryUnschedCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure IQSearchWODBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnCancelClick(Sender: TObject);
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure IQSearchWOUserBtn1OnClick(Sender: TObject);
    procedure QryUnschedBeforeOpen(DataSet: TDataSet);
    procedure TblParamsAfterPost(DataSet: TDataSet);
    procedure IQSearchWODBNavigatorBeforeAction(Sender: TObject;  Button: TNavigateBtn);
    procedure UniFormShow(Sender: TObject);
  private
    FSaveOnResize: TNotifyEvent;
    FViewFilter: TCellMfgType;
    procedure SetViewFilter(Value: TCellMfgType);
    procedure BuildWorkordersList(AList: TStringList);
    procedure MarkListAsAssyRunning(AList: TStringList);
//    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure InitForm;
    procedure LocalSearchPanelResize(Sender: TObject);
  public
    { Public declarations }
    property ViewFilter: TCellMfgType write SetViewFilter;
    class function DoShow(AViewFilter: TCellMfgType): Boolean;
    class procedure MarkWorkorderAsRunningAssy(AWorkorder_ID: Real; AJobshop_Rfq_ID: Real = 0);
  end;

implementation

{$R *.dfm}

uses
  AssyTrack_Const,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;
//  IQSecIns;


class function TFrmAssyTrackAdd.DoShow(AViewFilter: TCellMfgType): Boolean;
var
  AForm: TFrmAssyTrackAdd;
begin
  //Lema  result = Boolean ??
  Result:=True;

  AForm:= TFrmAssyTrackAdd.Create(uniGUIApplication.UniApplication);
  AForm.FViewFilter := AViewFilter;
  AForm.Show;
end;


procedure TFrmAssyTrackAdd.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

{
procedure TFrmAssyTrackAdd.IQAfterShowMessage(var Msg: TMessage);
begin
  InitForm;
  LocalSearchPanelResize(NIL);
end;
}

procedure TFrmAssyTrackAdd.InitForm;
var
  ASearchPanel: TUniPanel;
begin
  {Transfer pnlLegend to IQSearchWO panel}
//  pnlLegend.Parent:=  IQSearchWO.TopToolPanel; // wwIncSearch.Parent.Parent as TPanel;
//  pnlLegend.Align:= alRight;
//  pnlLegend.Left:= 0;

  {Navigator}
//  IQSearchWO.DBNav.VisibleButtons:= [ nbFirst, nbPrior, nbNext, nbLast, nbRefresh ];
//  IQSearchWO.DBNav.BeforeAction  := IQSearchDBNavBeforeAction;
end;


procedure TFrmAssyTrackAdd.LocalSearchPanelResize( Sender : TObject);
begin
  if Assigned( FSaveOnResize ) then
     FSaveOnResize( Sender );
  // 11-28-2011 wwIncSearch sits on FSearchCtrlPanel that in turn aligned Client on FSearchPanel.
  // IQSearchWO.wwIncSearch.Width:= IQSearchWO.wwIncSearch.Width - pnlLegend.Width;
end;

procedure TFrmAssyTrackAdd.QryUnschedCalcFields(DataSet: TDataSet);
begin
  QryUnschedQty.asFloat:= SelectValueFmtAsFloat('select sum(nvl(rel_quan_origin,rel_quan)) from ptorder_rel where ptorder_id = %f', [QryUnschedPTORDER_ID.asFloat]);
end;

procedure TFrmAssyTrackAdd.SetViewFilter(Value: TCellMfgType);
begin
  FViewFilter := Value;
end;

procedure TFrmAssyTrackAdd.btnOKClick(Sender: TObject);
var
  AList: TStringList;
  ANew_Workorder_ID: Integer;
  ADB: TFDConnection;
  S: string;
begin
  IQAssert( not (QryUnsched.Eof and QryUnsched.Bof), 'Nothing is selected' );

  ANew_Workorder_ID:= 0;
  AList:= TStringList.Create;
  try
    ADB:= FDManager.FindConnection(cnstFDConnectionName) as TFDConnection;
    try
      ADB.StartTransaction;
      try
        BuildWorkordersList( AList );
        MarkListAsAssyRunning( AList );
        ANew_Workorder_ID:= StrToInt(AList[ 0 ]);
        ADB.Commit;
      finally
        AList.Free;
        if ADB.InTransaction then
           ADB.RollBack;
      end;
    except on E: Exception do
      begin
        S:= Format('Encountered the following error: ' + #13 +'%s.', [ FixFireDACErrorMessage(E) ]);
        if Pos('at end of table', LowerCase(E.Message)) > 0 then
           S:= S + #13#13 + 'It is possible the selected work order(s) got deleted causing the above error - please try again.'
        else
           S:= S + #13#13 + 'Please try again.';
        IQError( S );
      end;
    end;
  finally
{ TODO -oLema : PostMessage , to find a workaround. }
//    PostMessage( TUniForm(self.Owner).Handle, iq_RefreshDataSets, AssyTrack_Const.cRefreshDataSet_Locate, ANew_Workorder_ID );
    Close;
  end;
end;

procedure TFrmAssyTrackAdd.BuildWorkordersList( AList: TStringList );
var
  I: Integer;
begin
  with IQSearchWO do
  begin
     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          DBGrid.DataSource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          if AList.IndexOf( DBGrid.DataSource.DataSet.FieldByName('id').asString) = -1 then
             AList.Add( DBGrid.DataSource.DataSet.FieldByName('id').asString );
        end
     else
        AList.Add( DBGrid.DataSource.DataSet.FieldByName('id').asString );
  end;
end;

procedure TFrmAssyTrackAdd.MarkListAsAssyRunning(AList: TStringList );
var
  I: Integer;
begin
  for I:= 0 to AList.Count - 1 do
    MarkWorkorderAsRunningAssy( StrToFloat(AList[ I ]));
end;


class procedure TFrmAssyTrackAdd.MarkWorkorderAsRunningAssy(AWorkorder_ID: Real; AJobshop_Rfq_ID: Real = 0);
begin
    ExecuteCommandFmt('declare                                                                   '+
              '  v_workorder_id   number::= %f;                                          '+
              '  v_jobshop_rfq_id number::= %f;                                          '+
              'begin                                                                     '+
              '  assy1_misc.add_workorder_to_assy_track(v_workorder_id,v_jobshop_rfq_id);'+
              ' end;                                                                     ',
              [ AWorkorder_ID,
                AJobshop_Rfq_ID ]);
end;


procedure TFrmAssyTrackAdd.IQSearchWODBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
//  if Highlight then EXIT;


  if (Column.Field.FieldName = 'PRIORITY') and (Column.Field.asString = 'Y') then
      begin
        Attribs.Color:= clAqua;
        Attribs.Font.Color := clBlack;
      end
  else if (Column.Field.FieldName = 'ID') and (QryUnSchedIS_XCPT_MAT.asString = 'Y') then
      begin
        Attribs.Color:= clWhite;
        Attribs.Font.Color := clRed;
      end
  else if QryUnschedORIGIN.asString = 'FORECAST' then
      begin
        Attribs.Color:= clWhite;
        Attribs.Font.Color := clBlue;
//        Attribs.Color:= IIf( Highlight, clNavy,   clWhite );
//        Attribs.Font.Color := IIf( Highlight, clYellow, clBlue  );
      end


end;

procedure TFrmAssyTrackAdd.IQSearchWODBNavigatorBeforeAction(Sender: TObject;  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;

procedure TFrmAssyTrackAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyTrackAdd.JumpToWorkOrder1Click(Sender: TObject);
begin
  IQJumpWO.Execute;
end;

procedure TFrmAssyTrackAdd.JumpToBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute
end;

procedure TFrmAssyTrackAdd.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute
end;

procedure TFrmAssyTrackAdd.IQSearchWOUserBtn1OnClick(Sender: TObject);
begin
  with PkWorkorders do
    if Execute then
       if not QryUnsched.Locate('ID', GetValue('id'), []) then
          IQConfirm(Format('WO# %s cannot be found among unscheduled workorders for selected criteria', [ FloatToStr( GetValue('id') )]));
end;


procedure TFrmAssyTrackAdd.QryUnschedBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  ParamByName('day_out_filter').Value := TblParamsADD_JOBS_DAYS_OUT_FILTER.asFloat;
  //  ParamByName('view_kind').Value := IIf( FViewFilter.CellOrMfgType = cmCell, 2, 1 );               // by mfgtype -> kind = 1, by mfgcell -> kind = 2
  //  ParamByName('mfgtype').asString  := Trim(FViewFilter.Mfgtype);
  //  ParamByName('mfgcell_id').Value := IIf( FViewFilter.CellOrMfgType = cmCell, FViewFilter.Mfgcell_ID, 0 );
  //end;
  AssignQueryParamValue(DataSet, 'day_out_filter', TblParamsADD_JOBS_DAYS_OUT_FILTER.asFloat );
  AssignQueryParamValue(DataSet, 'view_kind',      IIf( FViewFilter.CellOrMfgType = cmCell, 2, 1 ));
  AssignQueryParamValue(DataSet, 'mfgtype',        Trim(FViewFilter.Mfgtype), ftString );
  AssignQueryParamValue(DataSet, 'mfgcell_id',     fIIf( FViewFilter.CellOrMfgType = cmCell, FViewFilter.Mfgcell_ID, 0 ));
end;

procedure TFrmAssyTrackAdd.TblParamsAfterPost(DataSet: TDataSet);
begin
  Reopen(QryUnsched);
end;

procedure TFrmAssyTrackAdd.UniFormShow(Sender: TObject);
begin
  // open tables
  IQSetTablesActive(TRUE, self);
  // open main query after params is open to pick up  ADD_JOBS_DAYS_OUT_FILTER
  Reopen(QryUnsched);

  IQRegFormRead(self, [ self ]);
//  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
  InitForm;
  LocalSearchPanelResize(NIL);

//  FSaveOnResize:= TUniPanel(IQSearchWO.wwIncSearch.Parent).OnResize;
//  TUniPanel(IQSearchWO.wwIncSearch.Parent).OnResize:= LocalSearchPanelResize;

  StatusBar1.Panels.Items[ 0 ].Text:= Format(' MfgType: %s', [ FViewFilter.MfgType ]);
  StatusBar1.Panels.Items[ 1 ].Text:= Format(' MfgCell: %s', [ FViewFilter.Cell ]);

end;

end.
