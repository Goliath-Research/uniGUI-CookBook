unit Snd_PR;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Snd_base,
  Vcl.Menus,
  Vcl.Buttons,
  Mask,
  Data.DB,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants,
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
  IQMS.WebVcl.SecurityRegister,
  Vcl.Dialogs,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.Documents,
  Vcl.DBGrids,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniGUIApplication,
  uniDBComboBox, IQMS.WebVcl.HPick, uniBasicGrid, uniDBGrid, IQUniGrid,
  uniGUIFrame, uniPageControl, uniImageList, uniToolBar;

type
  TSnd_Process = class(TSndBase)
    Panel3: TUniPanel;
    wwDBGridWorkCenters: TIQUniGridControl;
    navWorkCenters: TUniDBNavigator;
    wwDBComboBoxEqno: TUniDBComboBox;
    TabInspection: TUniTabSheet;
    Panel4: TUniPanel;
    navInsp: TUniDBNavigator;
    wwDBGridInspection: TIQUniGridControl;
    wwDBComboBoxInspection: TUniDBComboBox;
    popmInspection: TUniPopupMenu;
    JumptoInspection1: TUniMenuItem;
    TabJobs: TUniTabSheet;
    Panel5: TUniPanel;
    navJobs: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboBoxJobDescrip: TUniDBComboBox;
    TabSheetCosting: TUniTabSheet;
    QryElemLabor: TFDQuery;
    QryLaborID: TBCDField;
    QryLaborELEM_DESCRIP: TStringField;
    QryElemOverhead: TFDQuery;
    QryElemOverheadID: TBCDField;
    QryElemOverheadELEM_DESCRIP: TStringField;
    procLaborCost: TFDStoredProc;
    procOverheadCost: TFDStoredProc;
    Label4: TUniLabel;
    dblcCenterType: TUniDBLookupComboBox;
    Label9: TUniLabel;
    DBEdit4: TUniDBEdit;
    Label8: TUniLabel;
    DBEdit3: TUniDBEdit;
    PnlHeader02: TUniPanel;
    Splitter3: TUniSplitter;
    PnlHeaderLeft02: TUniPanel;
    PnlHeaderClient02: TUniPanel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBComboBox1: TUniDBComboBox;
    DBEdit2: TUniDBEdit;
    DBEdit5: TUniDBEdit;
    DBEdit6: TUniDBEdit;
    Splitter4: TUniSplitter;
    PnlHeaderCheckboxes: TUniPanel;
    dbchkFABAllowAllWC: TUniDBCheckBox;
    Bevel1: TUniPanel;
    Bevel4: TUniPanel;
    Bevel5: TUniPanel;
    Bevel6: TUniPanel;
    Bevel7: TUniPanel;
    PnlLabor01: TUniPanel;
    PnlOverhead01: TUniPanel;
    PnlLaborHeaderBar: TUniPanel;
    lblLaborHeader: TUniLabel;
    PnlOverheadHeaderBar: TUniPanel;
    lblOverheadHeader: TUniLabel;
    PnlLaborInner01: TUniPanel;
    Splitter5: TUniSplitter;
    PnlLaborLeft01: TUniPanel;
    PnlLaborClient01: TUniPanel;
    PnlOverheadInner01: TUniPanel;
    Splitter6: TUniSplitter;
    PnlOverheadLeft01: TUniPanel;
    PnlOverheadClient01: TUniPanel;
    Label11: TUniLabel;
    lOperators: TUniLabel;
    Label10: TUniLabel;
    Label12: TUniLabel;
    Label13: TUniLabel;
    wwDBLookupComboLbrElem: TUniDBLookupComboBox;
    wwcomboOperator: TUniDBComboBox;
    wwDBComboBoxLbrCost: TUniDBComboBox;
    wwDBLookupComboOvhElem: TUniDBLookupComboBox;
    wwDBComboBoxOvhCost: TUniDBComboBox;
    Splitter7: TUniSplitter;
    pnlSndOpPrRight01: TUniPanel;
    sbtnEPlant: TUniSpeedButton;
    procOverheadCostLaborBased: TFDStoredProc;
    CloneProcess1: TUniMenuItem;
    N1: TUniMenuItem;
    CalculateOverheadforAllProcesses1: TUniMenuItem;
    CalculateLaborforAllProcesses1: TUniMenuItem;
    sbtnCenterType: TUniSpeedButton;
    IQWebHpick1: TIQWebHpick;
    procedure FormCreate(Sender: TObject);
    procedure Equipment1Click(Sender: TObject);
    procedure wwDBComboBoxEqnoDropDown(Sender: TObject);
    procedure wwDBComboBoxInspectionDropDown(Sender: TObject);
    procedure JumptoInspection1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwDBComboBoxJobDescripDropDown(Sender: TObject);
    procedure wwcomboOperatorDropDown(Sender: TObject);
    procedure wwDBComboBoxLbrCostDropDown(Sender: TObject);
    procedure wwDBComboBoxOvhCostDropDown(Sender: TObject);
    procedure GridMaterialsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure RecalcOverheadForALLProcesses1Click(Sender: TObject);
    procedure RecalcLaborForALLProcesses1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure wwDBComboDlgRejectCodeCustomDlg(Sender: TObject);
    procedure wwDBComboDlgAuxCustomDlg(Sender: TObject);
    procedure sbtnAuxToolingClick(Sender: TObject);
    procedure CloneProcess1Click(Sender: TObject);
    procedure sbtnCenterTypeClick(Sender: TObject);
    procedure PnlOverheadClient01Resize(Sender: TObject);
    procedure PnlLaborClient01Resize(Sender: TObject);
    procedure PnlHeaderClient01Resize(Sender: TObject);
  private
    { Private declarations }
    FHint: string;
    FID: real;
    procedure TblSndOpBeforePost(DataSet: TDataSet); override;
    procedure TblSndOpBeforeOpen(DataSet: TDataSet);
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;
                            var HintInfo: THintInfo );
    procedure RecalcAllProcesses( AKind: string );
    procedure SetID(const Value: real);
  protected
    procedure AssignOpClass; virtual;
    procedure RefreshComponents( const AObjects: array of TWinControl; AOffset: Integer = 8 );
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; AID: Real );
    class procedure DoShow( AID: Real );
    procedure CalcLaborCost;
    procedure CalcStandardOverheadCost;
    property ID : real write SetID;
  end;

implementation

{$R *.DFM}

uses
  //bom_aux_tool,
  IQMS.Common.COMExe,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Panelmsg,
  IQMS.Common.SetPlant,
  snd_clone,
  snd_dm,
  snd_labor,
  snd_tool,
  sndop_rscstr,
  spcconst;


class procedure TSnd_Process.DoShow(AID: Real);
var
  LSnd_Process : TSnd_Process;
begin
  LSnd_Process := TSnd_Process.Create(uniGUIApplication.UniApplication);
  LSnd_Process.ID:=AID;
  LSnd_Process.Show;
end;

(*
constructor TSnd_Process.Create(AOwner: TComponent; AID: Real);
begin
  inherited;

  IQSetTablesActive( TRUE, self );

  if AID > 0 then
     TSndDM(DM).TblSndOp.Locate( 'ID', AID, [])

  else if AID = 0 then        // -1 will paypass the picklist
     try
       sbtnSearchClick(NIL);  // activate search speed button
     except on E:EAbort do
       begin
         PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
         ABORT;
       end;
     end;

  IQRegFormRead( self, [ wwDBGridWorkCenters, wwDBGridInspection,
   PnlHeader01, PnlHeaderLeft01, PnlHeaderLeft02,
   PnlLabor01, PnlLaborLeft01, PnlOverheadLeft01 ]);
  PageControlDetails.ActivePageIndex:= 0;
  (* TODO -ombaral -cWebIQ : Check dependecies
  // resize check boxes for localization
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlHeaderCheckboxes);
  // ensure navigation bar Vcl.Buttons are 25x25 (after security)
  IQMS.Common.Controls.ResizeNavBar(NavMain);
  IQMS.Common.Controls.ResizeNavBar(navWorkCenters);
  IQMS.Common.Controls.ResizeNavBar(navJobs);
  IQMS.Common.Controls.ResizeNavBar(navInsp);


  IQMS.Common.Controls.ResizeNavBar(navMaterials);
  IQMS.Common.Controls.ResizeNavBar(navMatQPB);

  // Delphi...
  //wwDBLookupComboOvhElem.Width:= PnlOverheadClient01.Width - 3;
  //wwDBComboBoxOvhCost.Width   := PnlOverheadClient01.Width - 3;

  // TAttachedDocumentsCoordinator.Create( self ).RegisterDocuments( TabSheet1, [ IQDocs1, IQExtDoc1 ]);  // IQAttachedDocumentsCoordinator.pas
//end;
*)

procedure TSnd_Process.FormCreate(Sender: TObject);
begin
    inherited;
  {for now we don't invoke other System.Classes so I don't care reinstate these properties}
  TSndDM(DM).PkSndOpOPNO.DisplayLabel:= sndop_rscstr.cTXT0000029; // 'Process #'
  with TSndDM(DM).TblSndOp do
  begin
    Filtered  := TRUE;
    BeforeOpen:= TblSndOpBeforeOpen;
  end;
end;

procedure TSnd_Process.AssignOpClass;
begin
  OpClass:= 'FB';
end;

procedure TSnd_Process.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  TSndDM(DM).CheckRecalcCost;

  Action:= caFree;

  IQRegFormWrite( self, [ wwDBGridWorkCenters, wwDBGridInspection,
    PnlHeader01, PnlHeaderLeft01, PnlHeaderLeft02,
    PnlLabor01, PnlLaborLeft01, PnlOverheadLeft01 ]);
  Application.OnShowHint:= NIL;
  inherited;
end;

procedure TSnd_Process.TblSndOpBeforePost(DataSet: TDataSet);
begin
  inherited;
  IQAssert( TSndDM(DM).TblSndOpCNTR_TYPE.asString > '', sndop_rscstr.cTXT0000030 {Please enter a value for Type'});
  IQAssert( TSndDM(DM).TblSndOpOPDESC.asString > '',    sndop_rscstr.cTXT0000031 {'Please enter a value for Description.'});
end;

procedure TSnd_Process.TblSndOpBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
end;

procedure TSnd_Process.Equipment1Click(Sender: TObject);
begin
  TFrmSndopTool.DoShow;  {Snd_Tool.pas}
end;

procedure TSnd_Process.wwDBComboBoxEqnoDropDown(Sender: TObject);
begin
  inherited; {nothing}

  with TSndDM(DM), PkWorkCenter do
    if Execute then
    begin
      TblSndop_WorkCenter.Edit;
      TblSndop_WorkCenterWORKCENTER_ID.asFloat:= GetValue('ID');
      TblSndop_WorkCenterEqNo.asString:= GetValue('eqno');
      TblSndop_WorkCenterCntr_Desc.asString:= GetValue('Cntr_Desc');
      TblSndop_WorkCenterCntr_Type.asString:= GetValue('Cntr_Type');
    end;
end;

procedure TSnd_Process.wwDBComboBoxInspectionDropDown(Sender: TObject);
begin
  inherited; {nothing}

  with TSndDM(DM), PkInspection do
    if Execute then
    begin
      TblSndop_Insp.Edit;
      TblSndop_InspSPC_INSPECTION_ID.asFloat:= GetValue('ID');
      TblSndop_InspName.asString   := SelectValueByID( 'name',        'spc_inspection', TblSndop_InspSPC_INSPECTION_ID.asFloat );
      TblSndop_InspDescrip.asString:= SelectValueByID( 'description', 'spc_inspection', TblSndop_InspSPC_INSPECTION_ID.asFloat );
    end;
end;

procedure TSnd_Process.JumptoInspection1Click(Sender: TObject);
begin
  inherited; {nothing}

  // Launch SPC jump here
  Com_Exec( 'IQSPC', [ SPCConst.SHOW_SPC_SNDOP_SETUP,  TSndDM(DM).TblSndop_InspSPC_INSPECTION_ID.asFloat ]);   // IQMS.Common.COMExe.pas; SPCConst.pas
end;

procedure TSnd_Process.wwDBComboBoxJobDescripDropDown(Sender: TObject);
begin
  with TSndDM(DM), PkJobDescrip do
   if Execute then
   begin
     TblSndopJobs.Edit;
     TblSndopJobsHR_JOB_DESCRIP_ID.asFloat:= GetValue('ID');
     TblSndopJobsJobDescrip.asString:= GetValue('descrip');
   end;
end;

procedure TSnd_Process.wwcomboOperatorDropDown(Sender: TObject);
begin
  inherited;  {nothing}

  with TSndDM(DM) do
  begin
    if SrcSndOp.DataSet.State in [dsEdit, dsInsert] then
       SrcSndOp.DataSet.Post;

    // inactivate cost members so it wont get reset in case of sndop being reopened and located
    // which in turn will trigger AfterScroll that will reset the vars
    TSndDM(DM).CostMembers.Active:= FALSE;
    try
      TFrmSndOp_Labor.DoShowExA( self, SrcSndOp.DataSet.FieldByName('id').asFloat, not SR.ReadWrite['TblSndOp'] );  {Snd_Labor.pas}
    finally
      TSndDM(DM).CostMembers.Active:= TRUE;
    end;
    CostMembers.MarkNeedsRecalc( 'OPERATOR', TRUE );
  end;

  ABORT; {bail out from the drop down}
end;

procedure TSnd_Process.IQRefreshDataSets(var Msg: TMessage);
var
  AID: Real;
  ADataSet: TDataset;
begin
  // RefreshDataSetByID( SrcSndOp.DataSet );
  ADataSet:= TSndDM(self.DM).SrcSndOp.DataSet; // normally is TFDTable but is TFDQuery when is coming from FAB BOM Routing
  with ADataSet do // as TFDTable do
  begin
    AID:= FieldByName('ID').asFloat;
    Close;
    Open;

    if ADataSet is TFDTable then with ADataSet as TFDTable do
    begin
      if TSndDM(self.DM).FRangeSet and (Pos('OP_CLASS',IndexFieldNames) = 1) then
         SetRange( [ OpClass ], [ OpClass ] )
    end;
    Locate('id', AID, []);
  end;
end;

procedure TSnd_Process.wwDBComboBoxLbrCostDropDown(Sender: TObject);
begin
  inherited; {nothing}

  if IQConfirmYN(sndop_rscstr.cTXT0000032 {'Calculate the standard labor cost?'}) then
     CalcLaborCost;

  ABORT; {bail out from the drop down}
end;

procedure TSnd_Process.CalcLaborCost;
begin
  with procLaborCost do
  begin
    ParamByName('v_sndop_id').Value := SrcSndOp.DataSet.FieldByName('id').asFloat;
    ExecProc;

    SrcSndOp.DataSet.edit;
    SrcSndOp.DataSet.FieldByName('std_cost_lbr').asFloat:= ParamByName('v_labor_rate').asFloat * ParamByName('v_labor_hrs').asFloat;
  end;

  TSndDM(DM).CostMembers.LaborNeedsRecalc:= False;
end;

procedure TSnd_Process.wwDBComboBoxOvhCostDropDown(Sender: TObject);
begin
  inherited; {nothing}

  if IQConfirmYN(sndop_rscstr.cTXT0000033 {'Calculate the standard overhead cost?'}) then
     CalcStandardOverheadCost;

  ABORT; {bail out from the drop down}
end;

procedure TSnd_Process.CalcStandardOverheadCost;
var
  AIsOverHeadLaborBased: Boolean;
  AMfgType: string;
begin
  if (CompareText(self.ClassName, 'TSnd_Assembly') = 0) or (CompareText(self.ClassName, 'TQuickAddAssy1Oper') = 0) then
     AMfgType:= 'ASSY1'
  else
     AMfgType:= 'FAB';

  AIsOverHeadLaborBased:= SelectValueFmtAsString('select is_labor_based_oh from mfgtype where rtrim(mfgtype) = ''%s''', [ AMfgType ]) = 'Y';

  if not AIsOverHeadLaborBased then
     begin
       with procOverheadCost do
       begin
         ParamByName('v_sndop_id').Value := SrcSndOp.DataSet.FieldByName('id').asFloat;
         ExecProc;

         SrcSndOp.DataSet.edit;
         SrcSndOp.DataSet.FieldByName('std_cost_oh').asFloat:= ParamByName('v_overhead_rate').asFloat * ParamByName('v_overhead_hrs').asFloat;
       end;
     end

  else
    begin
      with procOverheadCostLaborBased do
       begin
         ParamByName('v_sndop_id').Value := SrcSndOp.DataSet.FieldByName('id').asFloat;
         ParamByName('v_mfgtype').asString:= AMfgType;
         ParamByName('v_is_fixed').Value := 0;
         ExecProc;

         SrcSndOp.DataSet.edit;
         SrcSndOp.DataSet.FieldByName('std_cost_oh').asFloat:= ParamByName('v_overhead_rate').asFloat * ParamByName('v_overhead_hrs').asFloat;
       end;
    end;

  TSndDM(DM).CostMembers.OverheadNeedsRecalc:= False;
end;

procedure TSnd_Process.GridMaterialsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
//var
 // ACell: TGridCoord;
begin
  (*
  inherited;

  ACell:= GridMaterials.MouseCoord(X, Y);
  FHint:= sndop_rscstr.cTXT0000034; // 'Attached Material'

  if (ACell.X < 1) or (ACell.Y < 0) then Exit;

  with GridMaterials, Columns[ ACell.X  - 1 ] do
    if Assigned(Field) and (Field = TSndDM(DM).TblOpMatALLOC_REQ) then
       FHint:= sndop_rscstr.cTXT0000035; // 'If checked, item must be hard allocated to the lot before it can be released to the floor.'
 *)


end;

procedure TSnd_Process.FormActivate(Sender: TObject);
begin
  inherited;
  IQHelp.AssignHTMLFile( iqchmFAB{CHM}, iqhtmFAB{HTM} );  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TSnd_Process.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
  begin
    if HintControl = GridMaterials then
    begin
      ReshowTimeout:= 200;
      HintStr:= FHint;
    end;
  end;
end;

procedure TSnd_Process.Contents1Click(Sender: TObject);
begin
  // inherited;
  IQHelp.HelpContext( self.HelpContext ); {IQMS.Common.HelpHook.pas}
end;

procedure TSnd_Process.sbtnEPlantClick(Sender: TObject);
begin
  inherited; {nothing}
  DoChangePlantID(TSndDM(DM).TblSndOp ); { SetPlant.pas}
end;

procedure TSnd_Process.SetID(const Value: real);
begin
  FID := Value;
end;

procedure TSnd_Process.RecalcOverheadForALLProcesses1Click(Sender: TObject);
begin
  inherited;  {nothing}
  if IQConfirmYN(sndop_rscstr.cTXT0000036 {'Calculate the standard overhead cost for all processes?'}) then
     RecalcAllProcesses('OVERHEAD');
end;

procedure TSnd_Process.RecalcLaborForALLProcesses1Click(Sender: TObject);
begin
  inherited;  {nothing}

  if IQConfirmYN(sndop_rscstr.cTXT0000037 {'Calculate the standard labor cost for all processes?'}) then
     RecalcAllProcesses('LABOR');
end;


procedure TSnd_Process.RecalcAllProcesses( AKind: string );
var
  hMsg : TPanelMesg;
  AMsgText: String;
  AMfgType: string;
  AIsOverHeadLaborBased: Boolean;

  procedure ExecuteProcedure( AStoredProc      : TFDStoredProc;
                              ASndop_ID        : Real;
                              AStdCostFieldName: string;
                              ARateFieldName   : string;
                              AHoursFieldName  : string;
                              AIsFixedOverhead : Real = 0 );
  begin
    with AStoredProc do
    begin
      ParamByName('v_sndop_id').Value := ASndop_ID;

      if Params.FindParam('v_mfgtype') <> nil then
         ParamByName('v_mfgtype').asString:= AMfgType;

      if Params.FindParam('v_is_fixed') <> nil then
           ParamByName('v_is_fixed').Value := AIsFixedOverhead;

      ExecProc;

      ExecuteCommandFmt('update sndop set %s = %.6f where id = %f',
                [ AStdCostFieldName,
                  ParamByName( ARateFieldName ).asFloat * ParamByName( AHoursFieldName ).asFloat,
                  ASndop_ID ]);
    end;
  end;

begin
  with TFDQuery.Create(self) do
  try
    hMsg:= hPleaseWait('');
    Connection := UniMainModule.FDConnection1;
    SQL.Add(Format('select id, opno from sndop where op_class = ''%s'' order by id', [ OpClass ]));
    Open;
    while not Eof do
    begin

      // Get "please wait" text
      // We must use this method (an "if" statement) because of localization
      if AKind = 'OVERHEAD' then
         AMsgText := Format(sndop_rscstr.cTXT0000038 {'Calculate overhead for Process, %s'}, [Trim(FieldByName('opno').asString)])
      else if AKind = 'LABOR' then
         AMsgText := Format(sndop_rscstr.cTXT0000039 {'Calculate labor for Process, %s'}, [Trim(FieldByName('opno').asString)]);

      if CompareText(self.ClassName, 'TSnd_Assembly') = 0 then
         AMfgType:= 'ASSY1'
      else
         AMfgType:= 'FAB';
      AIsOverHeadLaborBased:= SelectValueFmtAsString('select is_labor_based_oh from mfgtype where rtrim(mfgtype) = ''%s''', [ AMfgType ]) = 'Y';

      hMsg.Mesg:= AMsgText;

      try
        if CompareText( UpperCase(AKind), 'LABOR' ) = 0 then
           ExecuteProcedure( procLaborCost,                 // AStoredProc
                             FieldByName('id').asFloat,     // ASndop_ID
                             'std_cost_lbr',                // AStdCostFieldName
                             'v_labor_rate',                // ARateFieldName
                             'v_labor_hrs')                 // AHoursFieldName

        else if (CompareText( UpperCase(AKind), 'OVERHEAD' ) = 0) and not AIsOverHeadLaborBased  then
           ExecuteProcedure( procOverheadCost,              // AStoredProc
                             FieldByName('id').asFloat,     // ASndop_ID
                             'std_cost_oh',                 // AStdCostFieldName
                             'v_overhead_rate',             // ARateFieldName
                             'v_overhead_hrs')              // AHoursFieldName

        else if (CompareText( UpperCase(AKind), 'OVERHEAD' ) = 0) and AIsOverHeadLaborBased  then
           begin
             ExecuteProcedure( procOverheadCostLaborBased,    // AStoredProc
                               FieldByName('id').asFloat,     // ASndop_ID
                               'std_cost_oh',                 // AStdCostFieldName
                               'v_overhead_rate',             // ARateFieldName
                               'v_overhead_hrs');             // AHoursFieldName

             if AMfgType = 'ASSY1' then
                ExecuteProcedure( procOverheadCostLaborBased, // AStoredProc
                                  FieldByName('id').asFloat,  // ASndop_ID
                                  'fixed_std_cost_oh',        // AStdCostFieldName
                                  'v_overhead_rate',          // ARateFieldName
                                  'v_overhead_hrs',           // AHoursFieldName
                                  1 );                        // AIsFixedOverhead
           end

      except on E: Exception do
        IQWarning( E.Message + #13#13 + sndop_rscstr.cTXT0000040 {'Program execution will continue normally from this point.'});
      end;

      Next;
    end;
  finally
    hMsg.Free;
    Free;
  end;

  RefreshDataSetByID( TSndDM(DM).TblSndOp );
  TSndDM(DM).TblSndOp.SetRange( [ OpClass ], [ OpClass ] );
end;

procedure TSnd_Process.FormShow(Sender: TObject);
begin
  inherited;

  AdjustControlsWidthBasedOnParent( PnlHeaderClient02, [ DBEdit1, DBComboBox1, DBEdit2, DBEdit5, DBEdit6 ], 26);
end;

procedure TSnd_Process.wwDBComboDlgRejectCodeCustomDlg(Sender: TObject);
begin
  inherited; {n}
  with TSndDM(DM).PkRejectCode do
    if Execute then
    begin
      TSndDM(DM).TblSndop_RejectCode.Edit;
      TSndDM(DM).TblSndop_RejectCode.FieldByName('reject_code_id').asFloat:= GetValue('id')
    end;
end;

procedure TSnd_Process.wwDBComboDlgAuxCustomDlg(Sender: TObject);
begin
  with TSndDM(DM).PkAux do
    if Execute then
    begin
      TSndDM(DM).TblSndop_Aux.Edit;
      TSndDM(DM).TblSndop_Aux.FieldByName('aux_id').asFloat:= GetValue('id')
    end;
end;

procedure TSnd_Process.sbtnAuxToolingClick(Sender: TObject);
begin
  (*
  TSndDM(DM).TblSndop_Aux.CheckBrowseMode;
  TFrmBomAuxTool.DoShowModal(TSndDM(DM).TblSndop_Aux.FieldByName('AUX_ID').asFloat ); {bom_aux_tool.pas}
  RefreshDataSetByID(TSndDM(DM).TblSndop_Aux);
  *)
end;

procedure TSnd_Process.CloneProcess1Click(Sender: TObject);
var
  ANewSndop_ID: Real;
begin
  TSndDM(DM).TblSndOp.CheckBrowseMode;
  IQAssert( TSndDM(DM).TblSndOpID.asFloat > 0, 'No process found - operation aborted.' );
  ANewSndop_ID:= TFrmSndClone.DoShowModal(TSndDM(DM).TblSndOpID.asFloat );  // snd_clone.pas
  if ANewSndop_ID > 0 then
     TSndDM(DM).TblSndOp.Locate('ID', ANewSndop_ID, []);
end;

procedure TSnd_Process.sbtnCenterTypeClick(Sender: TObject);
begin
  with PkCntrType do
    if Execute then
    begin
      TblSndOp.Edit;
      TblSndOp.FieldByName('CNTR_TYPE').asString:= GetValue('CNTR_TYPE');
    end;
end;

procedure TSnd_Process.RefreshComponents(const AObjects: array of TWinControl; AOffset: Integer);
begin
  IQMS.Common.Controls.RefreshComponents( AObjects, AOffset, SR );
  // for I:= 0 to High( AObjects ) do
  // begin
  //   AObjects[ I ].Visible:= FALSE;
  //   AObjects[ I ].Visible:= TRUE and SR.Visible[ AObjects[ I ].Name ];
  //   if AOffset > 0 then
  //      AObjects[ I ].Width:= AObjects[ I ].Parent.Width - AOffset;
  // end;
end;

procedure TSnd_Process.PnlOverheadClient01Resize(Sender: TObject);
begin
  inherited;
  RefreshComponents([wwDBLookupComboOvhElem, wwDBComboBoxOvhCost]);
end;

procedure TSnd_Process.PnlLaborClient01Resize(Sender: TObject);
begin
  inherited;
  RefreshComponents([ wwDBLookupComboLbrElem, wwcomboOperator, wwDBComboBoxLbrCost ]);
end;

procedure TSnd_Process.PnlHeaderClient01Resize(Sender: TObject);
begin
  inherited;
  RefreshComponents([ dblcCenterType ], 0);
end;

end.
