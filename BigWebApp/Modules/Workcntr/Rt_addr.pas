unit RT_addr;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ComCtrls,
  Vcl.Forms,
  Data.DB,
  IQDBGrid,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, uniMainMenu, IQUniGrid,
  uniGUIFrame,uniDBGrid;

type TIQUniGridHook = Class(TUniDbGrid)
  private
      function GetCurrCol: Integer;
End;

type
  TRTAddress = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel7: TUniPanel;
    StatusBar1: TUniStatusBar;
    SrcRT_Address: TDataSource;
    TblIllum_Rt: TFDTable;
    SrcILLUM_RT: TDataSource;
    TblIllum_RtWORK_CENTER_ID: TBCDField;
    TblIllum_RtID: TBCDField;
    TblWorkCenter: TFDTable;
    TblIllum_RtEQNO: TStringField;
    TblIllum_RtRT_ADDRESS: TStringField;
    TblIllum_RtSCRAP_ADDRESS: TStringField;
    grdCurrent: TIQUniGridControl;
    PnlButtons: TUniPanel;
    sbtnLeft: TUniSpeedButton;
    sbtnRight: TUniSpeedButton;
    TblIllum_RtCntr_Desc: TStringField;
    pkCurrAddr: TIQWebHPick;
    pkAvailAddr: TIQWebHPick;
    pkAvailAddrBOARD_POSITION: TStringField;
    pkAvailAddrADDRESS: TStringField;
    pkCurrAddrID: TBCDField;
    pkCurrAddrEQNO: TStringField;
    pkCurrAddrCNTR_DESC: TStringField;
    pkCurrAddrRT_ADDRESS: TStringField;
    pkCurrAddrSCRAP_ADDRESS: TStringField;
    TblIllum_RtIS_VIRTUAL: TStringField;
    TblIllum_RtPARENT_WORK_CENTER_ID: TBCDField;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    sbtnSearchCurrAddr: TUniSpeedButton;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Label3: TUniLabel;
    Panel10: TUniPanel;
    sbtnSearchAvailAddr: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    NavCurrent: TUniDBNavigator;
    NavAvailable: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Exit1: TUniMenuItem;
    Panel4: TUniPanel;
    Shape3: TUniPanel;
    pkAvailAddrASSIGNED_TO: TStringField;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    NavAssignedTo: TUniDBNavigator;
    pnlGrid: TUniPanel;
    grdAvail: TIQUniGridControl;
    SrcAssignedTo: TDataSource;
    QryAssignedTo: TFDQuery;
    wwDBGridAssignedTo: TIQUniGridControl;
    QryAssignedToEQNO: TStringField;
    QryAssignedToCNTR_DESC: TStringField;
    TblIllum_RtCOMPLEX_CHILD: TStringField;
    Contents1: TUniMenuItem;
    TblRT_Address: TFDQuery;
    TblRT_AddressBOARD_POSITION: TStringField;
    TblRT_AddressADDRESS: TStringField;
    TblRT_AddressDESCRIP: TStringField;
    TblRT_AddressIsAssignedToWorkCenter: TStringField;
    procedure grdCurrentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnLeftClick(Sender: TObject);
    procedure SrcRT_AddressDataChange(Sender: TObject; Field: TField);
    procedure SrcILLUM_RTDataChange(Sender: TObject; Field: TField);
    procedure sbtnRightClick(Sender: TObject);
    procedure grdCurrentColEnter(Sender: TObject);
    procedure grdAvailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdCurrentDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdCurrentDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdCurrentMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grdAvailDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdAvailDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TblIllum_RtAfterPost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//    procedure StatusBar1DrawPanel(StatusBar: TUniStatusBar;
//      Panel: TStatusPanel; const Rect: TRect);
    procedure FormActivate(Sender: TObject);
    procedure sbtnSearchCurrAddrClick(Sender: TObject);
    procedure sbtnSearchAvailAddrClick(Sender: TObject);
    procedure TblIllum_RtFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure TblIllum_RtBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure TblRT_AddressCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure grdAvailCalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//      ABrush: TBrush);
    procedure Contents1Click(Sender: TObject);
    procedure TblIllum_RtCalcFields(DataSet: TDataSet);
    procedure grdAvailDBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    Init_ID: Real;
    procedure CheckDup(Field: string; Addr: string);
    procedure UpdateRTLicenseStatusBar;
    procedure ExecuteInLoop(AMainQuery, AExecQuery: TFDQuery; AMsgFmt: string);
    procedure IQAfterShowMessage(var Msg: TMessage);
//      message iq_AfterShowMessage;
    procedure AssignConnectionToDataSets;
    function grdCurrentColumnFieldSelected:TField;
  public
    { Public declarations }
  end;

procedure DoRTAddress( ID: Real );

implementation

{$R *.DFM}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.License,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.MfgShare,
  System.Variants,
  workcntr_rscstr,
  IQMS.Common.DataConst;

procedure DoRTAddress(ID: Real);
var
  form : TRTAddress;
  msg  : TMessage;
begin
  form := TRTAddress.Create(uniGUIApplication.UniApplication);
  form.Init_ID := ID;
  form.AssignConnectionToDataSets;
//  IQRegFormRead(form, [form, form.Panel2, form.grdCurrent, form.grdAvail, form.pnlGrid,
//    form.wwDBGridAssignedTo]);
  form.IQAfterShowMessage(msg);
  form.ShowModal;
end;

procedure TRTAddress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
//  IQRegFormWrite(self, [self, Panel2, grdCurrent, grdAvail, pnlGrid,
//    wwDBGridAssignedTo]);
end;

procedure TRTAddress.IQAfterShowMessage(var Msg: TMessage);
var
  RTs, q: TFDQuery;
  i: Integer;
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmSETUPch5 { HTM } );
  { IQMS.Common.HelpHook.pas }

  RTs := TFDQuery.Create(self);
  RTs.ConnectionName := 'IQFD';

  q := TFDQuery.Create(self);
  q.ConnectionName := cnstFDConnectionName;

  try
    StatusBar1.Panels[2].Text := workcntr_rscstr.cTXT0000009;
    //'Loading RealTime address information ...'

    { Add Work Centers to ILLUM_RT }
    RTs.SQL.Add('select id from work_center where is_rt = ''Y''');
    RTs.SQL.Add(' MINUS');
    RTs.SQL.Add('select work_center_id from illum_rt');

    q.SQL.Add('Insert into ILLUM_RT (work_center_id) values (:id) ');
    ExecuteInLoop(RTs, q,
      workcntr_rscstr.cTXT0000010 { 'Adding work center (ID: %.0f)' } );
  finally
    RTs.Free;
    q.Free;
  end;

  IQSetTablesActive(False, self);
  IQSetTablesActive(True, self);
  if Init_ID > 0 then
    TblIllum_Rt.Locate('ID', Init_ID, []);

  UpdateRTLicenseStatusBar;
  StatusBar1.Panels[2].Text := '';
end;

procedure TRTAddress.AssignConnectionToDataSets;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TFDCustomQuery then
      with TFDCustomQuery(Components[i]) do
      begin
        Close;
        ConnectionName := cnstFDConnectionName;  // IQMS.Common.DataConst
      end;
end;

procedure TRTAddress.ExecuteInLoop(AMainQuery, AExecQuery: TFDQuery;
  AMsgFmt: string);
begin
  AMainQuery.Open;
  while not AMainQuery.Eof do
  begin
    StatusBar1.Panels[2].Text :=
      IQFormat(AMsgFmt, [AMainQuery.Fields[0].asFloat]);
    StatusBar1.Update;
    Application.ProcessMessages;
    with AExecQuery do
    begin
      Close;
      Params[0].asFloat := AMainQuery.Fields[0].asFloat;
      ExecSQL;
    end;
    AMainQuery.Next;
  end;
  StatusBar1.Panels[2].Text := ' ';
end;

procedure TRTAddress.grdCurrentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with TblIllum_Rt do
    case Key of
      VK_DOWN:
        try
          Next; //if state = dsEdit and DisableControls would come BEFORE "Next"
          DisableControls; //we'd lose the posting!
          if Eof then
            Key := 0
          else
            Prior;
        finally
          EnableControls;
        end;
      VK_DELETE:
        begin
          Edit;
//          grdCurrent.SelectedField.Clear;
        end
    end;
end;

procedure TRTAddress.SrcRT_AddressDataChange(Sender: TObject;
  Field: TField);
begin
  sbtnLeft.Enabled := not (TblRT_Address.Eof and TblRT_Address.Bof)
end;

procedure TRTAddress.SrcILLUM_RTDataChange(Sender: TObject; Field: TField);
begin
  grdCurrentColEnter(Sender);
end;

procedure TRTAddress.grdCurrentColEnter(Sender: TObject);
begin
  with TblIllum_Rt do
//    if grdCurrent.SelectedField = TblIllum_RtSCRAP_ADDRESS then
//      sbtnRight.Enabled := FieldByName('SCRAP_ADDRESS').asString <> ''
//    else
//      sbtnRight.Enabled := FieldByName('RT_ADDRESS').asString <> '';
end;

procedure TRTAddress.sbtnLeftClick(Sender: TObject);
begin
  if not (TblIllum_Rt.Eof and TblIllum_Rt.Bof) and
    not (TblRT_Address.Eof and TblRT_Address.Bof) then
    with TblIllum_Rt do
    begin
      TblRT_Address.CheckBrowseMode;
      if not (State in [dsEdit]) then
        Edit;
      try
        if grdCurrentColumnFieldSelected = TblIllum_RtSCRAP_ADDRESS then
        begin
          CheckDup('RT_ADDRESS', TblRT_AddressADDRESS.asString);
          TblIllum_RtSCRAP_ADDRESS.asString := TblRT_AddressADDRESS.asString
        end
        else
        begin
          CheckDup('SCRAP_ADDRESS', TblRT_AddressADDRESS.asString);
          TblIllum_RtRT_ADDRESS.asString := TblRT_AddressADDRESS.asString;
        end
      finally
        Post;
      end;
    end;
end;

procedure TRTAddress.sbtnRightClick(Sender: TObject);
begin
 if not (TblIllum_Rt.Eof and TblIllum_Rt.Bof) then
    with TblIllum_Rt do
    begin
      if not (State in [dsEdit]) then
        Edit;
      if grdCurrentColumnFieldSelected = TblIllum_RtSCRAP_ADDRESS then
        TblIllum_Rt['SCRAP_ADDRESS'] := NULL
      else
        TblIllum_Rt['RT_ADDRESS'] := NULL;
      Post;
    end;

end;

procedure TRTAddress.CheckDup(Field: string; Addr: string);
begin
  with TFDQuery.Create(self) do
    try
      ConnectionName := cnstFDConnectionName;
      SQL.Add(Format('select 1 from illum_rt where %s = ''%s'' ',
        [Field, Addr]));
      Open;
      if not Eof then
        //workcntr_rscstr.cTXT0000011 =
        //'Address %s is already assigned to another %s'
        raise Exception.Create
          (Format(workcntr_rscstr.
          cTXT0000011 { 'Address %s is already assigned to another %s' } ,
          [Addr, Field]));
    finally
      Close;
      Free;
    end;
end;

procedure TRTAddress.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext); { IQMS.Common.HelpHook.pas }
end;

procedure TRTAddress.grdAvailMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (ssLeft in Shift) then
  begin
    grdAvail.BeginDrag(False);
  end;
end;

procedure TRTAddress.grdCurrentDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = grdAvail;
end;

procedure TRTAddress.grdCurrentDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  OnMouse: TMouseEvent;
begin
  if Source = grdAvail then
  begin
    try
      OnMouse := grdCurrent.OnMouseDown;
      grdCurrent.OnMouseDown := nil;
      TIQDBGrid(grdCurrent).MouseDown(mbLeft, [ssLeft], X, Y);
    finally
      grdCurrent.OnMouseDown := OnMouse;
    end;
    sbtnLeftClick(Sender);
  end;
end;

procedure TRTAddress.grdCurrentMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (ssLeft in Shift) then
  begin
    if sbtnRight.Enabled then
      grdCurrent.BeginDrag(False);
  end;
end;

function TRTAddress.grdCurrentColumnFieldSelected: TField;
var
    i : Integer;
begin
    i := TIQUniGridHook(grdCurrent.IQComponents.Grid).GetCurrCol;
    result:=grdCurrent.IQComponents.Grid.Columns[i].Field;
end;

procedure TRTAddress.grdAvailDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = grdCurrent;
end;



procedure TRTAddress.grdAvailDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source = grdCurrent then
    sbtnRightClick(Sender);
end;

procedure TRTAddress.TblIllum_RtAfterPost(DataSet: TDataSet);
begin
  UpdateRTLicenseStatusBar;
end;

procedure TRTAddress.UpdateRTLicenseStatusBar;
var
  RTLic, RTCount: Real;
begin
  RTCount := RT_Illum_RT_Count; { IQMS.Common.License.pas }
  RTLic := RT_Licensed_Count; { IQMS.Common.License.pas }

  with StatusBar1.Panels[0] do
  begin
    if RTCount <= RTLic then
      Style :=  psText
    else
      Style := psOwnerDraw;
    Text := Format(workcntr_rscstr.cTXT0000012 { 'Count: %.0f' } , [RTCount]);
  end;

  with StatusBar1.Panels[1] do
  begin
    if RTCount <= RTLic then
      Style := psText
    else
      Style := psOwnerDraw;
    Text := Format(workcntr_rscstr.cTXT0000013 { 'Licensed: %.0f' } , [RTLic]);
  end;
end;

//procedure TRTAddress.StatusBar1DrawPanel(StatusBar: TUniStatusBar;
//  Panel: TStatusPanel; const Rect: TRect);
//begin
//  with StatusBar1.Canvas do
//  begin
//    Brush.Color := clRed;
//    FillRect(Rect);
//    Font.Color := clWhite;
//    TextOut(Rect.left + 1, Rect.top + 1, Panel.Text);
//  end;
//end;

procedure TRTAddress.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not IQLicensed_RT then { IQMS.Common.License.pas }
  begin
    //'RealTime Module RT license agreement is exceeded.'#13#13'Would you like to go back and edit?'
    CanClose := not IQWarningYN(workcntr_rscstr.cTXT0000014);
    Exit;
  end;

  if not IQLicensed_RT_Scrap then { IQMS.Common.License.pas }
  begin
    //'RealTime Module RT Scrap license agreement is exceeded.'#13#13'Would you like to go back and edit?'
    CanClose := not IQWarningYN(workcntr_rscstr.cTXT0000015);
    Exit;
  end;
end;

procedure TRTAddress.FormActivate(Sender: TObject);
begin
  //IQHelp.AssignHTMLFile( iqchmSETUP {CHM}, iqhtmSETUPch5{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmSETUPch5 { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TRTAddress.TblIllum_RtFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := SelectValueByID('is_virtual', 'work_center',
    TblIllum_RtWORK_CENTER_ID.asFloat) <> 'Y'
end;

procedure TRTAddress.sbtnSearchCurrAddrClick(Sender: TObject);
begin
  with pkCurrAddr do
    if Execute then
      TblIllum_Rt.Locate('ID', GetValue('ID'), []);
end;

procedure TRTAddress.sbtnSearchAvailAddrClick(Sender: TObject);
begin
  with pkAvailAddr do
    if Execute then
      TblRT_Address.Locate('BOARD_POSITION;ADDRESS',
        VarArrayOf([GetValue('BOARD_POSITION'), GetValue('ADDRESS')]),
        []);
end;

procedure TRTAddress.TblIllum_RtBeforePost(DataSet: TDataSet);
var
  A: Variant;
begin
  A := SelectValueArrayFmt
    ('select is_virtual, parent_id from work_center where id = %f',
    [TblIllum_RtWORK_CENTER_ID.asFloat]);
  if VarArrayDimCount(A) > 0 then
  begin
    TblIllum_RtIS_VIRTUAL.asString := A[0];
    TblIllum_RtCOMPLEX_CHILD.Clear;
    if A[1] > 0 then
    begin
      TblIllum_RtPARENT_WORK_CENTER_ID.asFloat := A[1];
      if IQMS.Common.MfgShare.WorkCenterBelongsToComplex(TblIllum_RtWORK_CENTER_ID.asFloat)
      then
        TblIllum_RtCOMPLEX_CHILD.asString := 'Y';
    end;
  end;
end;

procedure TRTAddress.TblIllum_RtCalcFields(DataSet: TDataSet);
begin
  if TblIllum_RtWORK_CENTER_ID.asFloat > 0 then
    TblIllum_RtCntr_Desc.asString := SelectValueByID('cntr_desc', 'work_center',
      TblIllum_RtWORK_CENTER_ID.asFloat);
end;

procedure TRTAddress.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TRTAddress.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TRTAddress.TblRT_AddressCalcFields(DataSet: TDataSet);
begin
  TblRT_AddressIsAssignedToWorkCenter.asString := SelectValueFmtAsString(
    'select ''Y'' from illum_rt rt                                              ' +
    ' where (rtrim(rt.rt_address) = ''%s'' or rtrim(rt.scrap_address) = ''%s'') ' +
    '   and rownum < 2                                                          ',
    [Trim(DataSet.FieldByName('ADDRESS').asString),
    Trim(DataSet.FieldByName('ADDRESS').asString)]);
end;

procedure TRTAddress.grdAvailDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
 if TblRT_AddressIsAssignedToWorkCenter.asString = 'Y' then
    Attribs.Color := clYellow;
end;

{ TIQUniGridHook }

function TIQUniGridHook.GetCurrCol: Integer;
begin
  Result := CurrCol;
end;

end.
