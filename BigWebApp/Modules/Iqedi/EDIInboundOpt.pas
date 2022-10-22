unit EDIInboundOpt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  EdiTP,
  Mask,
  Vcl.wwdbedit,
  Vcl.Wwdotdot,
  Vcl.Wwdbcomb,
  Vcl.Menus,
  Vcl.Wwdatsrc,
  Vcl.Wwdbigrd,
  Vcl.Wwdbgrid,
  wwdblook,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPageControl,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniCheckBox,
  uniDBCheckBox;

type
  TFrmInboundOptions = class(TUniForm)
    PageControl1: TUniPageControl;
    TabGeneral: TUniTabSheet;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    cbProcess: TUniDBCheckBox;
    GroupBox1: TUniGroupBox;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    GroupBox2: TUniGroupBox;
    Panel8: TUniPanel;
    GroupBox3: TUniGroupBox;
    Panel9: TUniPanel;
    GroupBox4: TUniGroupBox;
    cbSync: TUniDBCheckBox;
    cbNext: TUniDBCheckBox;
    cbInc: TUniDBCheckBox;
    cbClear: TUniDBCheckBox;
    cbMerge: TUniDBCheckBox;
    cbFam: TUniDBCheckBox;
    cbAdj: TUniDBCheckBox;
    dbDel: TUniDBCheckBox;
    cbUpd: TUniDBCheckBox;
    sbSing: TUniDBCheckBox;
    cbBlank: TUniDBCheckBox;
    cbNotes: TUniDBCheckBox;
    cbFore: TUniDBCheckBox;
    cbAuto: TUniDBCheckBox;
    cbCrea: TUniDBCheckBox;
    cbPrint: TUniDBCheckBox;
    dbFore: TUniDBEdit;
    Label1: TUniLabel;
    Label3: TUniLabel;
    wwDBForeHead: TUniEdit;
    PopupMenu1: TUniPopupMenu;
    ClearForecastHeaderName1: TUniMenuItem;
    TabLeg: TUniTabSheet;
    DBCheckBox1: TUniDBCheckBox;
    DBCheckBox2: TUniDBCheckBox;
    DBCheckBox3: TUniDBCheckBox;
    DBCheckBox4: TUniDBCheckBox;
    Label4: TUniLabel;
    DBDockId: TUniDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure cbProcessClick(Sender: TObject);
    procedure wwDBForeHeadCustomDlg(Sender: TObject);
    procedure ClearForecastHeaderName1Click(Sender: TObject);
    procedure cbForeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure EDIInboundTransOptions;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  edi_rscstr;

procedure EDIInboundTransOptions;
var
  FrmInboundOptions : TFrmInboundOptions;
begin
  FrmInboundOptions := TFrmInboundOptions.Create(UniApplication);
  FrmInboundOptions.ShowModal;
end;

procedure TFrmInboundOptions.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmInboundOptions.UniFormCreate(Sender: TObject);
begin
//  IQRegFormRead( self, [self]);
//  Caption := Format(edi_rscstr.cTXT0000182,
//    [RTrim(TFrmEdiTP(AOwner).tblEdiPartnersTP_INTERCHANGE_CODE.asString),
//     TFrmEdiTP(AOwner).tblEdiPartnersTSTRANSACTION_SET_CODE.asString]);
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PROCESS_INBOUND').asString <> '' then
//    cbProcess.Checked := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PROCESS_INBOUND').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('SYNC_SHP').asString <> '' then
//    cbSync.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('SYNC_SHP').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('LMULTIPLE').asString <> '' then
//    cbNext.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('LMULTIPLE').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('LINCREMENTS').asString <> '' then
//    cbInc.Checked     := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('LINCREMENTS').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('CLEAR_RELEASES').asString <> '' then
//    cbClear.Checked   := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('CLEAR_RELEASES').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('MRG_FCST').asString <> '' then
//    cbMerge.Checked   := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('MRG_FCST').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('ADJ_PARTIAL_REL').asString <> '' then
//    cbAdj.Checked     := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('ADJ_PARTIAL_REL').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('DELETE_UNUSED_FORECASTS').asString <> '' then
//    dbDel.Checked     := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('DELETE_UNUSED_FORECASTS').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FAMILY_BATCH_ORDERS').asString <> '' then
//    cbFam.Checked     := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FAMILY_BATCH_ORDERS').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('UPDATE_UNIT_PRICE').asString <> '' then
//    cbUpd.Checked     := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('UPDATE_UNIT_PRICE').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('GROUPBYPO').asString <> '' then
//    sbSing.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('GROUPBYPO').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('UPD_BLANKET_QTY').asString <> '' then
//    cbBlank.Checked   := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('UPD_BLANKET_QTY').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PROCESS_NOTES').asString <> '' then
//    cbNotes.Checked   := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PROCESS_NOTES').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FORECAST').asString <> '' then
//    cbFore.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FORECAST').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('AUTO_CONVERT').asString <> '' then
//    cbAuto.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('AUTO_CONVERT').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FUNC_ACKN').asString <> '' then
//    cbCrea.Checked    := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('FUNC_ACKN').asString = 'Y';
//  if TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PRINT_TO_FILE').asString <> '' then
//    cbPrint.Checked   := TFrmEdiTP(AOwner).tblEdiPartnersTS.FieldByName('PRINT_TO_FILE').asString = 'Y';
//  cbProcessClick(nil);
end;

procedure TFrmInboundOptions.BtnOkClick(Sender: TObject);
begin
//  if cbFore.Checked then
//  begin
//    if TFrmEdiTP(Owner).tblEdiPartnersTSFORE_HEAD_ID.asFloat = 0 then
//    raise exception.Create('You have selected the Forecast Module option. Please also select the Forecast Header Name.');
//  end;
//  TFrmEdiTP(Owner).tblEdiPartnersTS.Post;
//  Close;
end;

procedure TFrmInboundOptions.BtnCancelClick(Sender: TObject);
begin
//  TFrmEdiTP(Owner).tblEdiPartnersTS.Cancel;
//  Close;
end;

procedure TFrmInboundOptions.cbProcessClick(Sender: TObject);
begin
  cbSync.Enabled := cbProcess.Checked;
  cbNext.Enabled := cbProcess.Checked;
  cbInc.Enabled := cbProcess.Checked;
  cbClear.Enabled := cbProcess.Checked;
  cbMerge.Enabled := cbProcess.Checked;
  cbAdj.Enabled := cbProcess.Checked;
  dbDel.Enabled := cbProcess.Checked;
  dbFore.Enabled := cbProcess.Checked;
  cbFam.Enabled := cbProcess.Checked;
  cbUpd.Enabled := cbProcess.Checked;
  sbSing.Enabled := cbProcess.Checked;
  cbBlank.Enabled := cbProcess.Checked;
  cbNotes.Enabled := cbProcess.Checked;
  cbFore.Enabled := cbProcess.Checked;
//  cbAuto.Enabled := cbProcess.Checked;
//  cbCrea.Enabled := cbProcess.Checked;
//  cbPrint.Enabled := cbProcess.Checked;
end;

procedure TFrmInboundOptions.wwDBForeHeadCustomDlg(Sender: TObject);
begin
//  with TFrmEdiTP(Owner).PkForeHead do
//    if Execute then
//    begin
//      if not (TFrmEdiTP(Owner).tblEdiPartnersTS.State in [dsEdit, dsInsert]) then TFrmEdiTP(Owner).tblEdiPartnersTS.Edit;
//      TFrmEdiTP(Owner).tblEdiPartnersTSFORE_HEAD_ID.asFloat := GetValue('ID');
//      TFrmEdiTP(Owner).tblEdiPartnersTSKIND.asString := GetValue('KIND');
//    end;

end;

procedure TFrmInboundOptions.ClearForecastHeaderName1Click(Sender: TObject);
begin
//  if not (TFrmEdiTP(Owner).tblEdiPartnersTS.State in [dsEdit, dsInsert]) then TFrmEdiTP(Owner).tblEdiPartnersTS.Edit;
//  TFrmEdiTP(Owner).tblEdiPartnersTSFORE_HEAD_ID.Clear;
//  TFrmEdiTP(Owner).tblEdiPartnersTSKIND.Clear;
end;

procedure TFrmInboundOptions.cbForeMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if not cbFore.Checked then
//  begin
//    if not (TFrmEdiTP(Owner).tblEdiPartnersTS.State in [dsEdit, dsInsert]) then TFrmEdiTP(Owner).tblEdiPartnersTS.Edit;
//    TFrmEdiTP(Owner).tblEdiPartnersTSFORE_HEAD_ID.Clear;
//  end;
end;



end.
