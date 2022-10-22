unit pm_select_task;

{ ** Select MRO Task ***

  This is a base unit, which can also be called directly, to allow selecting
  an equipment task.  The alternative might be a picklist that displayed
  the full list of tasks, but users want to be able to filter by equipment
  first, and then search for tasks by that equipment.

  This unit can be declared externally.  It must not contain any MRO-specific
  units.  This unit replaces the old, pmview.pas, unit.  The form that
  displays in MRO is a descendent of this unit.

  This unit does not support drag-n-drop.  For that, you will need to use
  pm_select_task2.

}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniDBText,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPmSelectTask = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    N2: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Search1: TUniMenuItem;
    PnlEquipmentGrid: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    PkEquip: TIQWebHPick;
    PKEquipID: TBCDField;
    PKEquipCLASS: TStringField;
    PKEquipDESCRIP: TStringField;
    PKEquipMODEL: TStringField;
    PKEquipSERIALNO: TStringField;
    PKEquipINST_DATE: TDateTimeField;
    PKEquipTOTAL_UNITS: TBCDField;
    PKEquipCOMPANY: TStringField;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    SrcEquipment: TDataSource;
    QryEquipment: TFDQuery;
    QryEquipmentID: TBCDField;
    QryEquipmentEQNO: TStringField;
    QryEquipmentCLASS: TStringField;
    QryEquipmentDESCRIP: TStringField;
    QryEquipmentMODEL: TStringField;
    QryEquipmentSERIALNO: TStringField;
    QryEquipmentINST_DATE: TDateTimeField;
    QryEquipmentTOTAL_UNITS: TBCDField;
    QryEquipmentUOM: TStringField;
    PSearch: TUniPopupMenu;
    QryEquipmentCOMPANY: TStringField;
    SrcTasks: TDataSource;
    QryTasks: TFDQuery;
    QryEquipmentEPLANT_ID: TBCDField;
    QryEquipmentEPLANT_NAME: TStringField;
    PkEquipEPLANT_ID: TBCDField;
    PkEquipEPLANT_NAME: TStringField;
    QryEquipmentLOCATION: TStringField;
    PkEquipEQNO: TStringField;
    PkEquipLOCATION: TStringField;
    PkEquipUOM: TStringField;
    Bevel1: TUniPanel;
    Panel8: TUniPanel;
    GridHeader: TIQUniGridControl;
    QryTasksStatus: TStringField;
    GridDetail: TIQUniGridControl;
    QryTasksID: TBCDField;
    QryTasksTASKNO: TStringField;
    QryTasksDESCRIP: TStringField;
    QryTasksPMTASKS_ID: TBCDField;
    QryTasksTOTAL_UNITS: TBCDField;
    QryTasksHOURS4TSK: TBCDField;
    QryTasksPERFORM_EVERY: TBCDField;
    QryTasksUOM: TStringField;
    QryTasksWO_OPEN: TStringField;
    QryTasksINCOMPLETE: TStringField;
    QryTasksEPLANT_ID: TBCDField;
    QryTasksEPLANT_NAME: TStringField;
    QryEquipmentHIDE_MISC: TIntegerField;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    sbtnApplyTask: TUniSpeedButton;
    sbtnFilterMisc: TUniSpeedButton;
    Panel7: TUniPanel;
    shpOpen: TUniPanel;
    shpClosed: TUniPanel;
    shpUnassigned: TUniPanel;
    shpIncomplete: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    lblEquipment: TUniLabel;
    Panel9: TUniPanel;
    SBSearch: TUniSpeedButton;
    lblDash: TUniLabel;
    DBText1: TUniDBText;
    PnlButtons: TUniPanel;
    PnlModalButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnApply: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSearchClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure QryTasksCalcFields(DataSet: TDataSet);
    procedure sbtnFilterMiscClick(Sender: TObject);

    procedure DoEquipmentBeforeOpen(DataSet: TDataSet);
    procedure QryTasksBeforeOpen(DataSet: TDataSet);
    procedure QryEquipmentCalcFields(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn and TGridDrawState not preset in UniGui
    procedure NavDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure GridDetailCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure NavDetailClick(Sender: TObject; Button: TNavigateBtn);  }

    procedure GridDetailDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SrcTasksDataChange(Sender: TObject; Field: TField);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
{ TODO -oGPatil -cWebConvert : TNavigateBtn and TGridDrawState not preset in UniGui
    procedure GridDetailCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure NavDetailBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavDetailClick(Sender: TObject; Button: TNavigateBtn);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);  }
    procedure SetArcustoID(const Value: Real);
    procedure SetStartupEquipmentID(const Value: Real);
  protected
    { Protected declarations }
    FStartupEquipmentID: Real;
    FArcustoID: Real;
    procedure Startup; virtual;
    procedure SetCaption; virtual;
    procedure SetButtons; virtual;
  public
    { Public declarations }
    FTaskSQL    : String;
    destructor Destroy; override;
    procedure LocateEquipment(APMEqmtID: Real);
    property StartupEquipmentID : Real write SetStartupEquipmentID;
    property ArcustoID : Real write SetArcustoID;

  end;

  function SelectEquipmentTask(var APMJobID: Real; APMEqmtID: Real = 0): Boolean;
  function SelectEquipmentTaskForCustomer(const AArcustoID: Real; var APMJobID: Real): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Graphics,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on files
  iqsecins,}
  IQMS.Common.PanelMsg,
  pm_color,
  pm_rscstr,
  pm_settings;

function SelectEquipmentTask(var APMJobID: Real; APMEqmtID: Real): Boolean;
var
  LFrmPmSelectTask : TFrmPmSelectTask;
begin
  APMJobID := 0;
  LFrmPmSelectTask := TFrmPmSelectTask.Create(UniGUIApplication.UniApplication);
  LFrmPmSelectTask.ArcustoID := 0;
  LFrmPmSelectTask.StartupEquipmentID := APMEqmtID;
  LFrmPmSelectTask.PnlModalButtons.Visible := True;
  Result := LFrmPmSelectTask.ShowModal = mrOk;
   if Result then
      begin
        APMJobID := LFrmPmSelectTask.QryTasksID.AsLargeInt;
        Result := APMJobID > 0;
      end;
end;

function SelectEquipmentTaskForCustomer(const AArcustoID: Real; var APMJobID: Real): Boolean;
var
  LFrmPmSelectTask : TFrmPmSelectTask;
begin
  APMJobID := 0;
  LFrmPmSelectTask := TFrmPmSelectTask.Create(UniGUIApplication.UniApplication);
  LFrmPmSelectTask.StartupEquipmentID := 0;
  LFrmPmSelectTask.ArcustoID := AArcustoID;
  LFrmPmSelectTask.PnlModalButtons.Visible := True;
   Result := LFrmPmSelectTask.ShowModal = mrOk;
   if Result then
      begin
        APMJobID := LFrmPmSelectTask.QryTasksID.AsLargeInt;
        Result := APMJobID > 0;
      end;
end;

procedure TFrmPmSelectTask.FormShow(Sender: TObject);
begin
  SetButtons;
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmPmSelectTask.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmPmSelectTask'
 RestoreForm(Self); // IQMS.Common.Controls.pas }
 IQRegFormWrite(self, [self, PnlEquipmentGrid]);
 IQRegBooleanScalarWrite(sbtnFilterMisc, 'sbtnFilterMisc', sbtnFilterMisc.Down);  {IQMS.Common.RegFrm.pas}
 if QryEquipment.Active then QryEquipment.Close;
 Application.OnShowHint:= NIL;
end;

procedure TFrmPmSelectTask.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM{CHM}, iqhtmPM{HTM});  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

destructor TFrmPmSelectTask.Destroy;
begin
  inherited Destroy;
end;

procedure TFrmPmSelectTask.IQAfterShowMessage(var Msg: TMessage);
begin
  // Bring window to front
  Application.ProcessMessages;
  ForceForegroundWindowB(Application.Handle);
  Self.BringToFront;
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas file
  IQSecIns.EnsureSecurityInspectorOnTopOf(Self); }
end;

procedure TFrmPmSelectTask.Startup;
var
   hMsg: TPanelMesg;
   b_tmp: Boolean;
begin
  // 03/21/2006 I restructured the Create method by removing the Form's OnCreate
  // and adding the methods to the constructor.  I also changed the way the
  // datasets are opened so that the form displays faster.
  try
     hMsg := hPleaseWait(pm_rscstr.cTXT0000091 {'Accessing MRO Tasks.'});
     ReOpen(QryEquipment); // open the header record
     if FStartupEquipmentID > 0 then
        LocateEquipment(FStartupEquipmentID);
     b_tmp := FALSE;   // initialize this variable
     IQRegBooleanScalarRead(sbtnFilterMisc, 'sbtnFilterMisc', b_tmp);  // IQMS.Common.RegFrm.pas
     sbtnFilterMisc.Down := b_tmp;  // set the value
     sbtnFilterMiscClick(NIL); // apply the value; this opens the detail dataset
     IQRegFormRead(Self, [Self, PnlEquipmentGrid]);
  finally
    if (hMsg<>NIL) and Assigned(hMsg) then FreeAndNil(hMsg);
  end;
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TUniCanvas' and 'TUniPanel'
  SetPMColorSwatches(shpOpen,
                     shpClosed,
                     shpIncomplete,
                     shpUnassigned); // pm_color.pas   }

  SetCaption;
end;

procedure TFrmPmSelectTask.UniFormCreate(Sender: TObject);
begin
  Startup;
end;

procedure TFrmPmSelectTask.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmPmSelectTask.SetButtons;
begin
  // 05/13/2014
  btnApply.Enabled := Showing and QryTasks.Active and
    not (QryTasks.Bof and QryTasks.Eof) and (QryTasksID.AsLargeInt > 0);
end;

procedure TFrmPmSelectTask.SetCaption;
begin
  //
end;

procedure TFrmPmSelectTask.SetStartupEquipmentID(const Value: Real);
begin
  FStartupEquipmentID := Value;
end;

procedure TFrmPmSelectTask.SrcTasksDataChange(Sender: TObject; Field: TField);
begin
  SetButtons;
end;

procedure TFrmPmSelectTask.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
var
   S: String;
begin
  if (Self=NIL) or not Self.Showing then Exit;

  // Make the hints
  with HintInfo do
   begin
     {Show/Hide Task Element Details button}
     if HintControl = sbtnFilterMisc then
       // pm_rscstr.cTXT0000016 = 'Hide miscellaneous tasks';
       // pm_rscstr.cTXT0000017 = 'Show miscellaneous tasks';
        HintStr := sIIf(sbtnFilterMisc.Down, pm_rscstr.cTXT0000017,
          pm_rscstr.cTXT0000016);
   end;
end;

procedure TFrmPmSelectTask.SBSearchClick(Sender: TObject);
begin
  with PkEquip do
   if Execute then
      QryEquipment.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmPmSelectTask.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPmSelectTask.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPmSelectTask.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM);  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(HelpContext)
end;

procedure TFrmPmSelectTask.QryTasksCalcFields(DataSet: TDataSet);
begin
  // Status field
  if QryTasksWO_OPEN.AsString = 'Y' then
     QryTasksStatus.AsString := pm_rscstr.cTXT0000168 // 'Open'
  else if (QryTasksWO_OPEN.AsString = 'N') and
          (QryTasksINCOMPLETE.AsString <> 'Y') then
     QryTasksStatus.AsString := pm_rscstr.cTXT0000169 // 'Closed'
  else if (QryTasksWO_OPEN.AsString = 'N') and
          (QryTasksINCOMPLETE.AsString = 'Y') then
     QryTasksStatus.AsString := pm_rscstr.cTXT0000170 // 'Incomplete'
  else QryTasksStatus.AsString := '';
end;

(* TODO -oGPatil -cWebConvert : TNavigateBtn not preset in UniGui
procedure TFrmPmSelectTask.NavDetailClick(Sender: TObject; Button: TNavigateBtn);
begin
  try
     if GridDetail.CanFocus then GridDetail.SetFocus;
  except ABORT;  {suppress}
  end;
end; *)

procedure TFrmPmSelectTask.sbtnFilterMiscClick(Sender: TObject);
begin
  sbtnFilterMisc.Hint := IQMS.Common.Numbers.sIIf(sbtnFilterMisc.Down,
                            pm_rscstr.cTXT0000017 {'Show Miscellaneous.'}, // pm_rscstr.pas
                            pm_rscstr.cTXT0000016 {'Hide Miscellaneous.'}); // pm_rscstr.pas
  RefreshDataSetByID(QryTasks);
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmPmSelectTask.GridDetailCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
   ABrushColor, AFontColor: TColor;
begin
  if Highlight then Exit;

  // Incomplete?
  if (QryTasksINCOMPLETE.AsString = 'Y') then
     ABrushColor := shpIncomplete.Brush.Color

  // WO Open?
  else if QryTasksWO_OPEN.AsString = 'Y' then
     ABrushColor := shpOpen.Brush.Color

  // WO Closed?
  else if (QryTasksWO_OPEN.AsString = 'N') then
     ABrushColor := shpClosed.Brush.Color

  else
     ABrushColor := shpUnassigned.Brush.Color;

  AFontColor := IQMS.Common.Graphics.GetFontColor(ABrushColor);

  ABrush.Color := ABrushColor;
  AFont.Color  := AFontColor;

end;     }

procedure TFrmPmSelectTask.DoEquipmentBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', Trunc(FArcustoID));
  AssignQueryParamValue(DataSet, 'BY_ARCUSTO_ID', INTEGER(FArcustoID > 0));
  AssignQueryParamValue(DataSet, 'CLASS', IQPMSettings.ClassFilter);
  AssignQueryParamValue(DataSet, 'BY_CLASS', INTEGER(IQPMSettings.ClassFilter > ''));
end;

procedure TFrmPmSelectTask.QryEquipmentCalcFields(DataSet: TDataSet);
begin
  QryEquipmentHIDE_MISC.AsInteger := INTEGER(sbtnFilterMisc.Down);
end;

procedure TFrmPmSelectTask.QryTasksBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', QryEquipmentID.AsLargeInt);
  AssignQueryParamValue(DataSet, 'HIDE_MISC', INTEGER(sbtnFilterMisc.Down));
end;

procedure TFrmPmSelectTask.LocateEquipment(APMEqmtID: Real);
begin
  if APMEqmtID > 0 then
     QryEquipment.Locate('ID', APMEqmtID, []);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmPmSelectTask.NavDetailBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
     begin
       RefreshDataSetByID(QryTasks);
       System.SysUtils.Abort;
     end;
end;

procedure TFrmPmSelectTask.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
     begin
       RefreshDataSetByID(QryEquipment);
       ReOpen(QryTasks);
       System.SysUtils.Abort;
     end;
end;  }

procedure TFrmPmSelectTask.GridDetailDblClick(Sender: TObject);
begin
  if PnlModalButtons.Visible then
     ModalResult := mrOk;
end;

end.
