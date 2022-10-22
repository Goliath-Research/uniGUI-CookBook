unit snd_where_used;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmSndWhereUsed = class(TUniForm)
    pnlAttachedMat: TUniPanel;
    IQSearchOpMat: TIQUniGridControl;
    QryBOM_Opmat: TFDQuery;
    QryBOM_OpmatMFGNO: TStringField;
    QryBOM_OpmatPARTNO_CLASS: TStringField;
    QryBOM_OpmatPARTNO_ITEMNO: TStringField;
    QryBOM_OpmatPARTNO_REV: TStringField;
    QryBOM_OpmatPARTNO_DESCRIP: TStringField;
    QryBOM_OpmatSTANDARD_PK_HIDE: TStringField;
    QryBOM_OpmatSTANDARD_ID: TBCDField;
    QryBOM_OpmatPARTNO_ARINVT_ID: TBCDField;
    QryBOM_OpmatPARTNO_ID: TBCDField;
    SrcBOM_OPMat: TDataSource;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    Bevel1: TUniPanel;
    QryBOM_OpmatPARTNO_DESCRIP2: TStringField;
    PopupMenu1: TUniPopupMenu;
    JumpToBOM1: TUniMenuItem;
    IQJumpBOM: TIQWebJump;
    QryBOM_OpmatSNDOP_ID: TBCDField;
    QryBOM_OpmatPTOPER_ID: TBCDField;
    N1: TUniMenuItem;
    SubstituteProcess1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkSndOpAssy1: TIQWebHPick;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField5: TBCDField;
    PkSndOpAssy1PK_HIDE: TStringField;
    SR: TIQWebSecurityRegister;
    procedure QryBOM_OpmatBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure SubstituteProcess1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSndOp_ID: Real;
    FOpClass: string;
    procedure SubstituteProcessesWith(ASndop_ID: Real);
    procedure SetSndop_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(ASndop_ID: Real );
    Property Sndop_ID: Real write SetSndop_ID;

  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  { TODO -ombaral -cWebIQ : Need to resolve dependency
  IQSecIns,
  }
  snd_dm,
  sndop_rscstr;

{ TFrmSndWhereUsed }

class procedure TFrmSndWhereUsed.DoShowModal(ASndop_ID: Real);
var
  LFrmSndWhereUsed : TFrmSndWhereUsed;
begin
  LFrmSndWhereUsed := TFrmSndWhereUsed(uniGUIApplication.UniApplication);
  with LFrmSndWhereUsed do
  begin
    Sndop_ID:=ASndop_ID;
    ShowModal;
  end;
end;

procedure TFrmSndWhereUsed.QryBOM_OpmatBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('sndop_id').Value := FSndOp_ID;
  AssignQueryParamValue(DataSet, 'sndop_id', FSndOp_ID);
end;

procedure TFrmSndWhereUsed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmSndWhereUsed.JumpToBOM1Click(Sender: TObject);
begin
  IQJumpBOM.Execute;
end;

procedure TFrmSndWhereUsed.PopupMenu1Popup(Sender: TObject);
var
  AMenuItem: TUniMenuItem;
begin
  //AMenuItem:= IQSearchOpMat.FindMenuItem( SubstituteProcess1 );
  if not Assigned(AMenuItem) then
     EXIT;
  (*
  AMenuItem.Enabled:= SR.Enabled['SubstituteProcess1']
                      and
                      (FOpClass = 'AS')
                      and
                      not (QryBOM_Opmat.Eof and QryBOM_Opmat.Bof);
 *)

end;

procedure TFrmSndWhereUsed.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
end;

procedure TFrmSndWhereUsed.SubstituteProcess1Click(Sender: TObject);
begin
  with PkSndOpAssy1 do
    if Execute and IQConfirmYN(Format('About to substitute marked process(s) with selected process %s - are you sure you want to continue?', [ Trim(GetValue('opno')) ])) then
       SubstituteProcessesWith( GetValue('ID'));
end;

procedure TFrmSndWhereUsed.FormShow(Sender: TObject);
begin
  FOpClass := SelectValueByID('op_class', 'sndop', FSndOp_ID);

  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmSndWhereUsed.SubstituteProcessesWith( ASndop_ID: Real );
var
  I: Integer;
  ADB: TFDConnection;

  procedure Substitute( APtOper_ID: Real );
  var
    APartno_ID: Real;
    AStandard_ID: Real;
    A: Variant;
    AWorkorder_ID: Real;
  begin
    AWorkorder_ID:= SelectValueFmtAsFloat('select workorder_id from sndop_dispatch where ptoper_id = %f', [ APtOper_ID ]);
    IQAssert( AWorkorder_ID = 0,
              Format('WO# %.0f in Assembly Track is using the process requested to be substituted - operation is not allowed.', [ AWorkorder_ID ]));

    APartno_ID  := SelectValueByID('partno_id', 'ptoper', APtOper_ID);
    AStandard_ID:= SelectValueByID('standard_id', 'partno', APartno_ID);
    if SelectValueFmtAsFloat('select 1 from ptoper where partno_id = %f and sndop_id = %f', [ APartno_ID, ASndop_ID ]) = 1 then
       raise Exception.CreateFmt('Process# %s already exists in the Mfg# %s - operation aborted.',
                                 [ SelectValueFmtAsString('select opno from sndop where id = %f', [ ASndop_ID ]),
                                   SelectValueFmtAsString('select mfgno from standard where id = %f', [ AStandard_ID ]) ]);

    A:= SelectValueArrayFmt( 'select cycletm_disp, multiples, scrap_disp, move_size, move_time, uom from sndop where id = %f', [ ASndop_ID ]);
    if VarArrayDimCount( A ) = 0 then
       EXIT;

    ExecuteCommandFmt('update ptoper set sndop_id = %f where id = %f', [ ASndop_ID, APtOper_ID ]);

    TSndDM.RollSndopInfoToPtOper( ASndop_ID, // snd_dm.pas
                                  A[ 0 ],    // ACycletm_Disp,
                                  A[ 1 ],    // AMultiples,
                                  A[ 2 ],    // AScrap_Disp,
                                  A[ 3 ],    // AMoveSize,
                                  A[ 4 ],    // AMoveTime: Real;
                                  A[ 5 ] );  // AUom: string
  end;

begin
  ADB:= UniMainModule.FDConnection1;
  ADB.StartTransaction;
  with IQSearchOpMat do
  try
     Datasource.DataSet.DisableControls;
     if Datasource.DataSet.Eof and Datasource.DataSet.Bof then
        EXIT;

     if DBGrid.SelectedRows.Count > 0 then
        for I:= 0 to DBGrid.SelectedRows.Count - 1 do
        begin
          Datasource.DataSet.GotoBookmark( DBGrid.SelectedRows.Items[ I ]);
          Substitute( QryBOM_OpmatPTOPER_ID.asFloat )
        end
     else
        Substitute( QryBOM_OpmatPTOPER_ID.asFloat );

     ADB.Commit;
  finally
     Datasource.DataSet.EnableControls;
     if ADB.InTransaction then
        ADB.RollBack;
  end;

  Reopen(QryBOM_Opmat);
end;


end.
