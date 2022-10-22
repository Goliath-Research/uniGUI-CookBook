unit AssyTrack_CostInfo;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
  IQMS.WebVcl.About,
  { TODO : IQMS.Common.UserMessages is not compiling, though it has been submitted }
 // IQMS.Common.UserMessages,
  Vcl.Buttons,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmAssyTrackCosting = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    SrcMain: TDataSource;
    QryMain: TFDQuery;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryMainID: TBCDField;
    QryMainWORKORDER_ID: TBCDField;
    QryMainPARTNO_ID: TBCDField;
    QryMainSNDOP_ID: TBCDField;
    QryMainOPNO: TStringField;
    QryMainOPDESC: TStringField;
    QryMainITEMNO: TStringField;
    QryMainDESCRIP: TStringField;
    QryMainREV: TStringField;
    QryMainCLASS: TStringField;
    wwDBGrid1: TIQUniGridControl;
    SrcCostElements: TDataSource;
    QryCostElements: TFDQuery;
    QryCostElementsID: TBCDField;
    QryCostElementsELEMENTS_ID: TBCDField;
    QryCostElementsELEM_DESCRIP: TStringField;
    QryCostElementsACT_COST: TFMTBCDField;
    QryCostElementsSTD_COST: TFMTBCDField;
    QryCostElementsVARIANCE: TFMTBCDField;
    Panel3: TUniPanel;
    sbtnRecalc: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    Details1: TUniMenuItem;
    QryMainDESCRIP2: TStringField;
    wwDataInspector1: TwwDataInspector;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMainBeforeOpen(DataSet: TDataSet);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure Details1Click(Sender: TObject);
    procedure wwDBGrid1UpdateFooter(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FNewHdr_ID   : Real;
    FWorkorder_ID: Real;
    FPartno_ID   : Real;
    FSndop_ID    : Real;
    FPtoper_ID   : Real;

    procedure IQAfterShowMessage( var Msg: TMessage );
    { TODO : IQMS.Common.UserMessages is not compiling, though it has been submitted }
      //message iq_AfterShowMessage;
    procedure ReCalculateCostingInfo;
    procedure SetPartno_ID(const Value: Real);
    procedure SetPtoper_ID(const Value: Real);
    procedure SetSndop_ID(const Value: Real);
    procedure SetWorkorder_ID(const Value: Real);

  public
    { Public declarations }
 property Workorder_ID : Real write SetWorkorder_ID;
    property Partno_ID : Real write SetPartno_ID;
    property Sndop_ID : Real write SetSndop_ID;
    property Ptoper_ID : Real write SetPtoper_ID;
    class procedure DoShow(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  AssyTrack_CostInfo_Details,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

class procedure TFrmAssyTrackCosting.DoShow(AWorkorder_ID, APartno_ID, ASndop_ID, APtoper_ID: Real);
var
  LmAssyTrackCosting : TFrmAssyTrackCosting;
begin
  LmAssyTrackCosting := create( UniGUIApplication.UniApplication );
  with LmAssyTrackCosting do
  begin
    Workorder_ID:= AWorkorder_ID;
    Partno_ID   := APartno_ID;
    Sndop_ID    := ASndop_ID;
    Ptoper_ID   := APtoper_ID;
    Show;
  end;
end;

procedure TFrmAssyTrackCosting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmAssyTrackCosting.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAssyTrackCosting.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmAssyTrackCosting.IQAfterShowMessage(var Msg: TMessage);
begin
  ReCalculateCostingInfo;
end;

procedure TFrmAssyTrackCosting.QryMainBeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //  ParamByName('id').Value := FNewHdr_ID;
  AssignQueryParamValue(DataSet, 'id', FNewHdr_ID);
end;


procedure TFrmAssyTrackCosting.sbtnRecalcClick(Sender: TObject);
begin
  if not IQConfirmYN('Recalculate Costing Info?') then
     EXIT;

  ReCalculateCostingInfo;
end;

procedure TFrmAssyTrackCosting.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmAssyTrackCosting.SetPtoper_ID(const Value: Real);
begin
  FPtoper_ID := Value;
end;

procedure TFrmAssyTrackCosting.SetSndop_ID(const Value: Real);
begin
  FSndop_ID := Value;
  FNewHdr_ID   := GetNextID('c_assy1_proc_cost');
end;

procedure TFrmAssyTrackCosting.SetWorkorder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TFrmAssyTrackCosting.UniFormDestroy(Sender: TObject);
begin
  ExecuteCommandFmt('delete from c_assy1_proc_cost where id = %f', [ FNewHdr_ID ]);
end;

procedure TFrmAssyTrackCosting.ReCalculateCostingInfo;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  try
    ExecuteCommandFmt('begin                           '+
              '  proc_cost_assy1.do_main( %f,  '+     // v_new_hdr_id
              '                           %f,  '+     // v_workorder_id
              '                           %f,  '+     // v_partno_id
              '                           %f,  '+     // v_sndop_id
              '                           %f); '+     // v_ptoper_id
              'end;',
              [ FNewHdr_ID,
                FWorkorder_ID,
                FPartno_ID,
                FSndop_ID,
                FPtoper_ID ]);

  finally
    Reopen(QryMain);
    Reopen(QryCostElements);
    hMsg.Free;
  end;
end;

procedure TFrmAssyTrackCosting.Details1Click(Sender: TObject);
begin
  TFrmAccyTrackCostInfoDetails.DoShowModal(FWorkorder_ID, FPartno_ID, FSndop_ID, FPtoper_ID );  // AssyTrack_CostInfo_Details.pas
end;

procedure TFrmAssyTrackCosting.wwDBGrid1UpdateFooter(Sender: TObject);
var
  A: Variant;
begin
  A:= SelectValueArrayFmt('select sum(act_cost), sum(std_cost), sum((nvl(std_cost,0) - nvl(act_cost,0))) '+
                     ' from c_assy1_proc_cost_elem where c_assy1_proc_cost_id = %f ',
                     [ QryMainID.asFloat ]);
 { wwDBGrid1.ColumnByName('ACT_COST').FooterValue:= A[ 0 ];
  wwDBGrid1.ColumnByName('STD_COST').FooterValue:= A[ 1 ];
  wwDBGrid1.ColumnByName('VARIANCE').FooterValue:= A[ 2 ];  }
end;

end.
