unit snd_assy1_overhead_update;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmSndOpAssy1OverheadUpdate = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    IQSearchCenterType: TIQUniGridControl;
    IQSearchProcess: TIQUniGridControl;
    Splitter2: TUniSplitter;
    SrcWork_Center: TDataSource;
    QryWork_Center: TFDQuery;
    QryWork_CenterCNTR_TYPE: TStringField;
    QryWork_CenterMFG_TYPE: TStringField;
    QryWork_CenterEPLANT_ID: TBCDField;
    QryWork_CenterMFGCELL: TStringField;
    QryWork_CenterMFGCELL_ID: TBCDField;
    SrcProcess: TDataSource;
    QryProcess: TFDQuery;
    QryProcessID: TBCDField;
    QryProcessOPNO: TStringField;
    QryProcessOPDESC: TStringField;
    QryProcessASSY1_OH_RATE: TFMTBCDField;
    QryProcessMULTIPLES: TBCDField;
    QryProcessUOM: TStringField;
    QryProcessCYCLETM_DISP: TBCDField;
    QryProcessSCRAP_DISP: TBCDField;
    QryProcessEPLANT_ID: TBCDField;
    procOverheadCostLaborBased: TFDStoredProc;
    QryProcessSTD_COST_OH: TFMTBCDField;
    QryProcessFIXED_ASSY1_OH_RATE: TFMTBCDField;
    QryProcessFIXED_STD_COST_OH: TFMTBCDField;
    GroupBox1: TUniGroupBox;
    Edit1: TUniEdit;
    btnApply: TUniButton;
    Label2: TUniLabel;
    Edit2: TUniEdit;
    Label1: TUniLabel;
    QryWork_CenterCNTR_COST: TFMTBCDField;
    QryWork_CenterFIXED_CNTR_COST: TFMTBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    popmProcess: TUniPopupMenu;
    JumpToProcess1: TUniMenuItem;
    popmCenterType: TUniPopupMenu;
    JumpToMasterCenterType1: TUniMenuItem;
    QryWork_CenterCNTR_TYPE_ID: TBCDField;
    SecurityRegister1: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryWork_CenterAfterScroll(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumpToProcess1Click(Sender: TObject);
    procedure JumpToMasterCenterType1Click(Sender: TObject);
  private
    { Private declarations }
     FNewVariableCost: Real;
     FNewFixedCost: Real;
     procedure Validate;
    procedure UpdateProcessOverheadRate(ASndop_ID: Real);
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;
{ TODO -oGPatil -cWebConvert : Dependency on the following Files.
  IQSecIns,
  snd_link,
  wc_cntr_type; }

{ TFrmSndOpAssy1OverheadUpdate }

class procedure TFrmSndOpAssy1OverheadUpdate.DoShowModal;
var
  LFrmSndOpAssy1OverheadUpdate : TFrmSndOpAssy1OverheadUpdate;
begin
  LFrmSndOpAssy1OverheadUpdate := TFrmSndOpAssy1OverheadUpdate.Create(UniGUIApplication.UniApplication);
  LFrmSndOpAssy1OverheadUpdate.ShowModal;
end;

procedure TFrmSndOpAssy1OverheadUpdate.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSndOpAssy1OverheadUpdate.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, Panel3,  Panel5 ]);
end;

procedure TFrmSndOpAssy1OverheadUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel3,  Panel5 ]);
end;

procedure TFrmSndOpAssy1OverheadUpdate.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmSndOpAssy1OverheadUpdate.btnApplyClick(Sender: TObject);
var
  I: Integer;
  hMsg: TPanelMesg;
begin
  if not IQConfirmYN('Are you sure you want to apply and recalculate selected process(es) standard overhead cost?') then
     EXIT;

  Validate;

  with IQSearchProcess do
  try
     hMsg:= hPleaseWait('');

     (* TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain a member wwdbgrid.
     { Append to List (ship_to_id, tran_date) }
     if wwDBGrid.SelectedList.Count > 0 then
        for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
        begin
          DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
          hMsg.Mesg:= Format('Processing %s ...', [ DataSet.FieldByName('opno').asString ]);
          UpdateProcessOverheadRate( DataSet.FieldByName('ID').asFloat );
        end
     else
        UpdateProcessOverheadRate( DataSet.FieldByName('ID').asFloat );

     IQSearchProcess.wwDBGrid.UnselectAll;  *)
  finally
     hMsg.Free;
  end;

  RefreshDataSetByID( QryProcess );
end;

procedure TFrmSndOpAssy1OverheadUpdate.Validate;
begin
  with IQSearchProcess do
     IQAssert( not (Datasource.DataSet.Eof and Datasource.DataSet.Bof), 'No process selected - operation aborted');

  if Edit1.Text > '' then
     IQAssert( IQMS.Common.Numbers.IsStringValidFloat( Edit1.Text, FNewVariableCost ) and (FNewVariableCost >0), 'Invalid New Variable Center Cost - please enter positve number and try again');

  if Edit2.Text > '' then
     IQAssert( IQMS.Common.Numbers.IsStringValidFloat( Edit2.Text, FNewFixedCost ) and (FNewFixedCost > 0), 'Invalid New Fixed Center Cost - please enter positve number and try again');
end;


procedure TFrmSndOpAssy1OverheadUpdate.UpdateProcessOverheadRate( ASndop_ID: Real );
begin
  if Edit1.Text = '' then
     ExecuteCommandFmt('update sndop set assy1_oh_rate = null where id = %f', [ ASndop_ID ])
  else
     ExecuteCommandFmt('update sndop set assy1_oh_rate = %.6f where id = %f', [ FNewVariableCost, ASndop_ID ]);

  if Edit2.Text = '' then
     ExecuteCommandFmt('update sndop set fixed_assy1_oh_rate = null where id = %f', [ ASndop_ID ])
  else
     ExecuteCommandFmt('update sndop set fixed_assy1_oh_rate = %.6f where id = %f', [ FNewFixedCost, ASndop_ID ]);

  // variable
  with procOverheadCostLaborBased do
  begin
    ParamByName('v_sndop_id').Value := ASndop_ID;
    ParamByName('v_mfgtype').asString:= 'ASSY1';
    ParamByName('v_is_fixed').Value := 0;
    ExecProc;

    ExecuteCommandFmt('update sndop set std_cost_oh = %.6f where id = %f',
              [ ParamByName( 'v_overhead_rate' ).asFloat * ParamByName( 'v_overhead_hrs' ).asFloat,
                ASndop_ID ]);
  end;

  // fixed
  with procOverheadCostLaborBased do
  begin
    ParamByName('v_sndop_id').Value := ASndop_ID;
    ParamByName('v_mfgtype').asString:= 'ASSY1';
    ParamByName('v_is_fixed').Value := 1;
    ExecProc;

    ExecuteCommandFmt('update sndop set fixed_std_cost_oh = %.6f where id = %f',
              [ ParamByName( 'v_overhead_rate' ).asFloat * ParamByName( 'v_overhead_hrs' ).asFloat,
                ASndop_ID ]);
  end;
end;

procedure TFrmSndOpAssy1OverheadUpdate.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on IQSecins.pas File
  EnsureSecurityInspectorOnTopOf( self ); }
end;

procedure TFrmSndOpAssy1OverheadUpdate.JumpToProcess1Click(Sender: TObject);
begin
(* TODO -oGPatil -cWebConvert : Dependency on snd_link.pas
  ShowSndOperModaless( Application, QryProcessID.asFloat, 'AS' );  {snd_link.pas}
*)
end;

procedure TFrmSndOpAssy1OverheadUpdate.QryWork_CenterAfterScroll(DataSet: TDataSet);
begin
  if (DataSet.State <> dsBrowse) or (DataSet.Eof and DataSet.Bof) then
     EXIT;

  Edit1.Text:= QryWork_CenterCNTR_COST.asString;
  Edit2.Text:= QryWork_CenterFIXED_CNTR_COST.asString;
end;

procedure TFrmSndOpAssy1OverheadUpdate.JumpToMasterCenterType1Click(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on wc_cntr_type.pas File
  TFrmWorkCenterType.DoShow( Application, QryWork_CenterCNTR_TYPE_ID.asFloat );  // wc_cntr_type.pas
  }
end;


end.
