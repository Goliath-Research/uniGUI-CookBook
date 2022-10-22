unit AssyGroup_Sandbox;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  //WEB_CONVERT IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.DropDownButton,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  IQUniGrid,
  uniGUIFrame,
  Vcl.ExtCtrls,
  uniMenuButton;

type
  TFrmAssyGroupSandbox = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    wwDBGridGroups: TIQUniGridControl;
    wwDBGridWorkorders: TIQUniGridControl;
    FlowPanel1: TUniPanel;
    Panel5: TUniPanel;
    sbtnSearchAssyGroup: TUniSpeedButton;
    sbtnRemoveGroup: TUniSpeedButton;
    sbtnAddGroup: TUniSpeedButton;
    sbtnPublishSchedule: TUniSpeedButton;
    sbtnGroupingIDAssignment: TUniSpeedButton;
    Bevel1: TUniPanel;
    SrcAssyGroup: TDataSource;
    QryAssyGroup: TFDQuery;
    QryAssyGroupID: TBCDField;
    QryAssyGroupDESCRIP: TStringField;
    QryAssyGroupASSY_RUN: TStringField;
    QryAssyGroupCNTR_TYPE_ID: TBCDField;
    PkCntrType: TIQWebHPick;
    PkCntrTypeNAME: TStringField;
    PkCntrTypeID: TBCDField;
    PkCntrTypeEPLANT_ID: TBCDField;
    QryAssyGroupPLAN_SEQ: TBCDField;
    QryAssyGroupPROD_SEQ: TBCDField;
    QryAssyGroupSTART_DATE: TDateTimeField;
    QryAssyGroupPROD_START_DATE: TDateTimeField;
    QryAssyGroupPRODHRS: TFMTBCDField;
    QryAssyGroupQTY: TFMTBCDField;
    QryAssyGroupINITIATED_DATE: TDateTimeField;
    Bevel2: TUniPanel;
    SrcWorkorders: TDataSource;
    QryWorkorders: TFDQuery;
    QryWorkordersGROUPID: TBCDField;
    QryWorkordersID: TBCDField;
    QryWorkordersMFGNO: TStringField;
    QryWorkordersBUCKET: TBCDField;
    QryWorkordersITEMNO: TStringField;
    QryWorkordersDESCRIP: TStringField;
    QryWorkordersCNTR_TYPE: TStringField;
    QryWorkordersPRODHRS: TFMTBCDField;
    QryWorkordersSETUPHRS: TBCDField;
    QryWorkordersCYCLES_REQ: TFMTBCDField;
    QryWorkordersSTART_TIME: TDateTimeField;
    QryWorkordersCOMPANY: TStringField;
    QryWorkordersSHIP_DATE: TDateTimeField;
    QryWorkordersPROMISE_DATE: TDateTimeField;
    QryWorkordersREQUEST_DATE: TDateTimeField;
    QryWorkordersWORK_ORDER_TYPE: TStringField;
    QryWorkordersORIGIN: TStringField;
    QryWorkordersMFG_TYPE: TStringField;
    QryWorkordersMFGCELL: TStringField;
    QryWorkordersEPLANT_ID: TBCDField;
    QryWorkordersREV: TStringField;
    QryWorkordersDESCRIP2: TStringField;
    QryWorkordersLOOKUP_MFGTYPE: TStringField;
    QryWorkordersSTANDARD_ID: TBCDField;
    QryWorkordersPTALLOCATE_ID: TBCDField;
    QryWorkordersIS_CONSUMED: TFMTBCDField;
    QryWorkordersASSY_GROUP_ID: TBCDField;
    PkAssyGroup: TIQWebHPick;
    PkAssyGroupID: TBCDField;
    PkAssyGroupDESCRIP: TStringField;
    PkAssyGroupLOCATIONS_ID: TBCDField;
    PkAssyGroupWORK_CENTER_ID: TBCDField;
    PkAssyGroupSTART_DATE: TDateTimeField;
    PkAssyGroupCNTR_TYPE_NAME: TStringField;
    PkAssyGroupLOC_DESC: TStringField;
    PkAssyGroupEQNO: TStringField;
    SR: TIQWebSecurityRegister;
    ddbtnCalc: TIQWebDropDownButton;
    popmRecalcAssyGroup: TUniPopupMenu;
    RecalcGroup: TUniMenuItem;
    RefreshPlannedSequence1: TUniMenuItem;
    RecalcAllGroups1: TUniMenuItem;
    QryWorkordersPTORDER_REL_ID: TBCDField;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PkAssyGroupPLANNED_CNTR_TYPE_ID: TBCDField;
    QryWorkordersGROUP_CODE: TStringField;
    sbtnWhiteBoardCapacity: TUniSpeedButton;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryAssyGroupBeforeOpen(DataSet: TDataSet);
    procedure sbtnGroupingIDAssignmentClick(Sender: TObject);
    procedure sbtnSearchAssyGroupClick(Sender: TObject);
    procedure sbtnAddGroupClick(Sender: TObject);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
    procedure wwDBGridGroupsCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure sbtnRemoveGroupClick(Sender: TObject);
    procedure wwDBGridGroupsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure wwDBGridGroupsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure wwDBGridGroupsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure RecalcSelectedGroupClick(Sender: TObject);
    procedure RefreshPlannedSequence1Click(Sender: TObject);
    procedure RecalcAllGroups1Click(Sender: TObject);
    procedure sbtnPublishScheduleClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure PkAssyGroupBeforeOpen(DataSet: TDataSet);
    procedure sbtnWhiteBoardCapacityClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FCntr_Type_ID: Integer;
    FCntr_Type_Name: string;
    FDragDropPoint : TPoint;
    procedure SetCntr_Type_ID(const Value: Integer);
    procedure RecalcSequences;
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;}
    procedure ChangeGroupPlannedSequence;
    procedure MovePlannedSequence(ASource_ID, ATarget_ID: Integer);

    property Cntr_Type_ID: Integer read FCntr_Type_ID write SetCntr_Type_ID;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  AssyGroup_Lab_Whiteboard,
  //WEB_CONVERT AssyGroup_Main,
  AssyTrack_Const,
  AssyTrack_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  //WEB_CONVERT schd_assy1_groupid,
  IQMS.Common.HelpHook;
  //WEB_CONVERT schd_wo_groupid;

const
  cnstDragDropSelected = 1;

type
   TwwLocalDBGrid = class( TIQUniGridControl )    {so we could surface MouseDown event}
   public
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: integer);
   end;

{ TwwLocalDBGrid }

procedure TwwLocalDBGrid.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: integer);
begin
  inherited MouseDown( Button, Shift, X, Y );
end;


{ TFrmAssyGroupSandbox }

class procedure TFrmAssyGroupSandbox.DoShow;
begin
  self.Create(UniGuiApplication.UniApplication).Show;
end;

procedure TFrmAssyGroupSandbox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGridGroups, wwDBGridWorkorders ]);
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
procedure TFrmAssyGroupSandbox.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cnstDragDropSelected : ChangeGroupPlannedSequence;
  end;
end;}

procedure TFrmAssyGroupSandbox.QryAssyGroupBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //begin
  //  ParamByName('cntr_type_id').asInteger:= Cntr_Type_ID;
  //end;
  AssignQueryParamValue(DataSet, 'cntr_type_id', Cntr_Type_ID);
end;

procedure TFrmAssyGroupSandbox.sbtnGroupingIDAssignmentClick(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Dependent on schd_wo_groupid
  TFrmSchedAssyGroupID.DoShow( self );}  // schd_assy1_groupid.pas
end;

procedure TFrmAssyGroupSandbox.sbtnSearchAssyGroupClick(Sender: TObject);
begin
  with PkCntrType do
    if Execute then
       Cntr_Type_ID:= GetValue('id')
    else
       ABORT;
end;

procedure TFrmAssyGroupSandbox.sbtnWhiteBoardCapacityClick(Sender: TObject);
begin
  { TODO -oBantuK -cWEB_CONVERT : Dependent on AssyGroup_Lab_Whiteboard
  TFrmAssyGroupLabWhiteboard.DoShow( Application );}  // AssyGroup_Lab_Whiteboard.pas
end;

procedure TFrmAssyGroupSandbox.SetCntr_Type_ID(const Value: Integer);
begin
  FCntr_Type_ID := Value;

  if FCntr_Type_ID = 0 then
     FCntr_Type_Name:= ''
  else
     FCntr_Type_Name:= SelectValueByID('name', 'cntr_type',  FCntr_Type_ID);

  self.Caption:= Format( cTXT0000002, [ FCntr_Type_Name ]); // = 'Assembly Track Sandbox [ %s ]';

  Reopen(QryAssyGroup);
end;

procedure TFrmAssyGroupSandbox.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self, wwDBGridGroups, wwDBGridWorkorders ]);

  try
    sbtnSearchAssyGroupClick( nil );
  except on EAbort do
    Close;
  end;
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
procedure TFrmAssyGroupSandbox.wwDBGridGroupsCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if QryAssyGroupINITIATED_DATE.asDateTime > 0 then
     AFont.Style:= AFont.Style + [fsBold, fsItalic];

  if Highlight then EXIT;

  if Field.ReadOnly or wwDBGridGroups.ColumnByName(Field.FieldName).ReadOnly then
     ABrush.Color:= clBtnFace;
end;}


procedure TFrmAssyGroupSandbox.sbtnAddGroupClick(Sender: TObject);
var
  I   : Integer;
  ASeq: Integer;

  procedure _AddToCntrType( AList: TStringList; ASeq: Integer );
  var
    AQry: TFDQuery;
    I   : Integer;
  begin
    if AList.Count = 0 then EXIT;

    AQry:= TFDQuery.Create(self);
    with AQry do
    try
      ConnectionName:= 'IQFD';
      SQL.Text:= 'update assy_group set cntr_type_id = :p1, plan_seq = :p2 where id = :p3';

      // Array DML
      Params.ArraySize:= AList.Count;
      for I:= 0 to Params.ArraySize - 1 do
      begin
        Inc( ASeq );
        Params[0].AsIntegers[ i ]:= self.Cntr_Type_ID;
        Params[1].AsIntegers[ i ]:= ASeq;
        Params[2].AsIntegers[ i ]:= StrToInt( AList[ I ]);
      end;

      // Finally!
      Execute( Params.ArraySize );
    finally
      AQry.Free;
    end;
  end;

begin
  with PkAssyGroup do
    if ExecuteEx('id') then
    begin
      ASeq:= SelectValueFmtAsInteger('select max(plan_seq) from assy_group where cntr_type_id = %d', [ Cntr_Type_ID ]);
      _AddToCntrType( ResultList, ASeq );
    end;

  QryAssyGroup.Refresh;
end;


procedure TFrmAssyGroupSandbox.sbtnRemoveGroupClick(Sender: TObject);
begin
  if QryAssyGroupID.asInteger = 0 then EXIT;

  if not IQConfirmYN( Format(cTXT0000003, [ QryAssyGroupID.asInteger ])) then //  'Remove Group ID %d from the Assembly Sandbox?';
     EXIT;

  ExecuteCommandFmt('update assy_group                   '+
                          '   set cntr_type_id = null,         '+
                          '       plan_seq = null,             '+
                          '       prod_seq = null,             '+
                          '       prod_start_date = start_date '+
                          ' where id = %d                      ',
                          [ QryAssyGroupID.asInteger ]);

  RecalcSequences;
end;


procedure TFrmAssyGroupSandbox.RecalcAllGroups1Click(Sender: TObject);
begin
  with QryAssyGroup do
  begin
    First;
    while not Eof do
    begin
      ExecuteCommandFmt('begin assy1_misc.assign_assy_group_totals( %d ); end;', [ QryAssyGroupID.asInteger ]);
      Next;
    end;
  end;
  QryAssyGroup.Refresh;
end;

procedure TFrmAssyGroupSandbox.RecalcSelectedGroupClick(
  Sender: TObject);
begin
  ExecuteCommandFmt('begin assy1_misc.assign_assy_group_totals( %d ); end;', [ QryAssyGroupID.asInteger ]);
  QryAssyGroup.Refresh;
end;

procedure TFrmAssyGroupSandbox.RefreshPlannedSequence1Click(Sender: TObject);
begin
  RecalcSequences;
end;

procedure TFrmAssyGroupSandbox.RecalcSequences;
begin
  MovePlannedSequence( -1, -1 );
end;


procedure TFrmAssyGroupSandbox.wwDBGridGroupsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'RowHeights'
  if (Shift = [ssLeft]) and (Y > wwDBGridGroups.RowHeights[ 0 ]) and not (QryAssyGroup.Eof and QryAssyGroup.Bof) then  // )
     wwDBGridGroups.BeginDrag(FALSE);}
end;


procedure TFrmAssyGroupSandbox.wwDBGridGroupsDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  FDragDropPoint:= Point(X,Y);
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_Notify'
  PostMessage( Handle, iq_Notify, cnstDragDropSelected, 0 );}
end;

procedure TFrmAssyGroupSandbox.wwDBGridGroupsDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= Source = wwDBGridGroups;
end;

procedure TFrmAssyGroupSandbox.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAssyGroupSandbox.ChangeGroupPlannedSequence;
var
  ACurIndex   : Integer;
  ANewIndex   : Integer;
  ASource_ID  : Integer;
  ATarget_ID  : Integer;
  AOnMouseDown: TMouseEvent;
begin
  ACurIndex:= -1;
  ANewIndex:= -1;

  {save source id}
  ASource_ID:= QryAssyGroupID.asInteger;

  {make it go to the target}
  AOnMouseDown:= wwDBGridGroups.OnMouseDown;
  wwDBGridGroups.OnMouseDown:= NIL;
  try
    TwwLocalDBGrid(wwDBGridGroups).MouseDown( mbLeft, [ssLeft], FDragDropPoint.X, FDragDropPoint.Y );
    ATarget_ID:= QryAssyGroupID.asInteger;
  finally
    wwDBGridGroups.OnMouseDown:= AOnMouseDown;
  end;

  MovePlannedSequence( ASource_ID, ATarget_ID );
end;


procedure TFrmAssyGroupSandbox.MovePlannedSequence( ASource_ID, ATarget_ID: Integer );
label
  _finish;
var
  ACurIndex   : Integer;
  ANewIndex   : Integer;
  AList       : TStringList;
  AOnMouseDown: TMouseEvent;
  I           : Integer;

  // ---------------------------------------------------------------------------
  function _LoadExisting: Boolean;
  var
    I: Integer;
  begin
    with TFDQuery.Create(nil) do
    try
      ConnectionName:= 'IQFD';
      SQL.Add( Format('select id, plan_seq from assy_group where cntr_type_id = %d order by plan_seq', [ self.Cntr_Type_ID ]));
      Open;
      I:= 0;
      while not Eof do
      begin
        AList.AddObject( Fields[ 0 ].asString, Pointer( Fields[ 1 ].asInteger ));
        if Fields[ 0 ].asInteger = ASource_ID then
           ACurIndex:= I;
        if Fields[ 0 ].asInteger = ATarget_ID then
           ANewIndex:= I;
        Next;
        Inc(I);
      end;
    finally
      Free;
    end;
    Result:= AList.Count > 0;
  end;

  // ---------------------------------------------------------------------------
  function _GetUpdatesCount: Integer;
  var I: Integer;
  begin
    Result:= 0;
    for I:= 0 to AList.Count - 1 do
      if LongInt(AList.Objects[ I ]) <> I + 1 then
         Inc(Result);
  end;

  // ---------------------------------------------------------------------------
  procedure _CheckUpdateSeq;
  var
    I, J: Integer;
  begin
    J:= 0;
    with TFDQuery.Create(self) do
    try
      ConnectionName:= 'IQFD';
      SQL.Text:= 'update assy_group set plan_seq = :p1 where id = :p2';

      // Array DML
      Params.ArraySize:= _GetUpdatesCount;
      if Params.ArraySize = 0 then
         EXIT;

      for I:= 0 to AList.Count - 1 do
      begin
        if LongInt( AList.Objects[ I ]) <> I + 1 then
        begin
          Params[0].AsIntegers[ j ]:= I + 1;
          Params[1].AsIntegers[ j ]:= StrToInt(AList[ I ]);
          Inc(J);
        end;
      end;

      Execute( Params.ArraySize );
    finally
      Free;
    end;
  end;

  // ---------------------------------------------------------------------------
  procedure _Refresh;
  begin
    if ASource_ID > 0 then
       begin
          Reopen( QryAssyGroup );
          QryAssyGroup.Locate('id', ASource_ID, []);
       end
    else
       QryAssyGroup.Refresh;
  end;

// -----------------------------------------------------------------------------
begin
  ACurIndex:= -1;
  ANewIndex:= -1;

  {load existing}
  AList:= TStringList.Create;
  try
    if not _LoadExisting() then
       goto _finish;

    if (ACurIndex >= 0) and (ANewIndex >= 0) then
       AList.Move( ACurIndex, ANewIndex );

    _CheckUpdateSeq;

    _finish:
    _Refresh;
  finally
    AList.Free;
  end;
end;


procedure TFrmAssyGroupSandbox.sbtnPublishScheduleClick(Sender: TObject);
begin
  if not IQConfirmYN( Format(AssyTrack_rscstr.cTXT0000004, [ FCntr_Type_Name ])) then  // 'Are you sure you want to publish schedule for center type %s?';
     EXIT;

  ExecuteCommandFmt('begin assy1_misc.publish_schedule( %d ); end;', [ QryAssyGroupCNTR_TYPE_ID.asInteger ]);
  QryAssyGroup.Refresh;

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TFrmAssyGroupMain'
  IQMS.Common.Controls.PostMessageToForm( TFrmAssyGroupMain, iq_RefreshDataSets, AssyTrack_Const.cRefreshDataSet_AssyGroup, 0 );}
end;


procedure TFrmAssyGroupSandbox.Exit1Click(Sender: TObject);
begin
  Close;
end;


procedure TFrmAssyGroupSandbox.PkAssyGroupBeforeOpen(DataSet: TDataSet);
begin
  //if DataSet is TFDQuery then
  //   TFDQuery(DataSet).ParamByName('cntr_type_id').asInteger:= FCntr_Type_ID
  //else if DataSet is TFDQuery then
  //   TFDQuery(DataSet).ParamByName('cntr_type_id').asInteger:= FCntr_Type_ID
  AssignQueryParamValue(DataSet, 'cntr_type_id', FCntr_Type_ID);
end;

procedure TFrmAssyGroupSandbox.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmAssyGroupSandbox.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;


procedure TFrmAssyGroupSandbox.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmASSY1{CHM}, iqhtmASSY1{HTM} );  {IQMS.Common.HelpHook.pas}
end;


procedure TFrmAssyGroupSandbox.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;


end.
