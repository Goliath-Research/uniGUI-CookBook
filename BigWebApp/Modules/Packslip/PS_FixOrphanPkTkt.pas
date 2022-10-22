unit PS_FixOrphanPkTkt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmPSFixOrphanedPkTkt = class(TUniForm)
    wwSrcPS_Detail: TDataSource;
    wwQryPS_Detail: TFDQuery;
    wwQryPS_DetailSEQ: TBCDField;
    wwQryPS_DetailMUST_SHIP_DATE: TDateTimeField;
    wwQryPS_DetailSHIP_QUAN: TBCDField;
    wwQryPS_DetailCMTLINE: TStringField;
    wwQryPS_DetailPTS_PER_PKG: TFMTBCDField;
    wwQryPS_DetailID: TBCDField;
    wwQryPS_DetailRELEASE_ID: TBCDField;
    SrcReleases: TDataSource;
    QryReleases: TFDQuery;
    QryReleasesSEQ: TBCDField;
    QryReleasesREQUEST_DATE: TDateTimeField;
    QryReleasesPROMISE_DATE: TDateTimeField;
    QryReleasesQUAN: TBCDField;
    QryReleasesFORECAST: TStringField;
    QryReleasesRAN: TStringField;
    pnlPkTktOrdDtl: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    pnlPkTktDtl: TUniPanel;
    wwGridPkTktDtl: TIQUniGridControl;
    Panel5: TUniPanel;
    wwGridReleases: TIQUniGridControl;
    Splitter2: TUniSplitter;
    SrcPkTktOrdDetail: TDataSource;
    QryPkTktOrdDetail: TFDQuery;
    QryPkTktOrdDetailPS_TICKET_ID: TBCDField;
    QryPkTktOrdDetailORD_DETAIL_ID: TBCDField;
    QryPkTktOrdDetailORDERNO: TStringField;
    QryPkTktOrdDetailPONO: TStringField;
    QryPkTktOrdDetailCLASS: TStringField;
    QryPkTktOrdDetailITEMNO: TStringField;
    QryPkTktOrdDetailREV: TStringField;
    QryPkTktOrdDetailDESCRIP: TStringField;
    wwGridPkTktOrdDtl: TIQUniGridControl;
    QryPkTktOrdDetailBACKLOG_QTY: TFMTBCDField;
    QryPkTktOrdDetailDOCKID: TStringField;
    Panel8: TUniPanel;
    sbtnAssociateRelease: TUniSpeedButton;
    QryReleasesID: TBCDField;
    QryReleasesLEFT_TO_SHIP: TFMTBCDField;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    Label4: TUniLabel;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    Label5: TUniLabel;
    Panel12: TUniPanel;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    sbtnHideShipped: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPkTktOrdDetailBeforeOpen(DataSet: TDataSet);
    procedure wwGridReleasesMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure wwGridPkTktDtlDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure wwGridPkTktDtlDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure sbtnAssociateReleaseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnHideShippedClick(Sender: TObject);
    procedure QryReleasesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPS_Ticket_ID: Real;
    FIsChanged: Boolean;
    procedure Append_New_PkTkt_Line;
    procedure Assign_From_PkTkt_Line;
    procedure SetPS_Ticket_ID(const Value: Real);
  public
    { Public declarations }
    property PS_Ticket_ID: Real read FPS_Ticket_ID write SetPS_Ticket_ID;
    class function DoShowModal(APS_Ticket_ID: Real): Boolean;
  end;

implementation

{$R *.dfm}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  packslip_rscstr;

{ TFrmPSFixOrphanedPkTkt }

class function TFrmPSFixOrphanedPkTkt.DoShowModal(APS_Ticket_ID: Real): Boolean;
var
  LFrmPSFixOrphanedPkTkt : TFrmPSFixOrphanedPkTkt;
begin
  LFrmPSFixOrphanedPkTkt := TFrmPSFixOrphanedPkTkt.Create(uniGUIApplication.UniApplication);
  with LFrmPSFixOrphanedPkTkt do
    begin
      PS_Ticket_ID := APS_Ticket_ID;
      ShowModal;
      Result := FIsChanged;
    end;
end;

procedure TFrmPSFixOrphanedPkTkt.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self, pnlPkTktOrdDtl, pnlPkTktDtl, wwGridPkTktOrdDtl,
    wwGridPkTktDtl, wwGridReleases]);
end;

procedure TFrmPSFixOrphanedPkTkt.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG{CHM}, iqhtmSHIP{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmPSFixOrphanedPkTkt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, pnlPkTktOrdDtl, pnlPkTktDtl, wwGridPkTktOrdDtl,
    wwGridPkTktDtl, wwGridReleases]);
  IQRegBooleanScalarWrite(self, 'HIDE_SHIPPED_RELEASES', sbtnHideShipped.Down);
end;

procedure TFrmPSFixOrphanedPkTkt.QryPkTktOrdDetailBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', Trunc(FPS_Ticket_ID));
end;

procedure TFrmPSFixOrphanedPkTkt.wwGridReleasesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ssLeft]) and (QryReleasesID.AsLargeInt > 0) then
    wwGridReleases.BeginDrag(FALSE);
end;

procedure TFrmPSFixOrphanedPkTkt.wwGridPkTktDtlDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  { TODO -oathite -cWebConvert : Undeclared identifier: 'TDrawGrid'
  Accept := (Source = wwGridReleases) and
    (Y > TDrawGrid(wwGridPkTktDtl).DefaultRowHeight); }
end;


procedure TFrmPSFixOrphanedPkTkt.wwGridPkTktDtlDragDrop(Sender, Source: TObject;
  X, Y: Integer);
{var
   TODO -oathite -cWebConvert : Undeclared identifier: 'TGridCoord'
  ACell: TGridCoord;}
begin
  (*{ TODO -oathite -cWebConvert : Undeclared identifier: 'MouseCoord'
  ACell := wwGridPkTktDtl.MouseCoord(X, Y); }

  case ACell.Y < 0 of
    TRUE:
      if IQConfirmYN
        (packslip_rscstr.cTXT0000041 {'Append new pick ticket line?'}) then
        Append_New_PkTkt_Line;

    FALSE:
      begin
        { TODO -oathite -cWebConvert : Undeclared identifier: 'SetActiveRow'
        wwGridPkTktDtl.SetActiveRow(ACell.Y - 1); }
        Assign_From_PkTkt_Line;
      end;
  end;*)
end;

procedure TFrmPSFixOrphanedPkTkt.Append_New_PkTkt_Line;
var
  APS_Ticket_Dtl_ID: Int64;
begin
  APS_Ticket_Dtl_ID := GetNextID('ps_ticket_dtl');
  ExecuteCommandFmt(
    'insert into ps_ticket_dtl                   ' +
    '     ( id,                                  ' +
    '       ps_ticket_id,                        ' +
    '       ord_detail_id,                       ' +
    '       seq,                                 ' +
    '       release_id,                          ' +
    '       ship_quan,                           ' +
    '       must_ship_date,                      ' +
    '       pts_per_pkg )                        ' +
    'select %d,                                  ' + //id
    '       %d,                                  ' + //ps_ticket_id,
    '       %d,                                  ' + //ord_detail_id,
    '       NULL,                                ' + //seq
    '       release_id,                          ' +
    '       ship_quan,                           ' +
    '       must_ship_date,                      ' +
    '       Mfg.Get_Main_Pkg_PtsPer( arinvt_id ) ' +
    '  from v_backlog_releases_qk                ' +
    ' where release_id = %d                      ',
    [APS_Ticket_Dtl_ID,
    QryPkTktOrdDetailPS_TICKET_ID.AsLargeInt,
    QryPkTktOrdDetailORD_DETAIL_ID.AsLargeInt,
    QryReleasesID.AsLargeInt]);
  FIsChanged := TRUE;
  RefreshDataSetByID(QryPkTktOrdDetail, 'ord_detail_id');
end;

procedure TFrmPSFixOrphanedPkTkt.Assign_From_PkTkt_Line;
begin
  ExecuteCommandFmt(
    'begin pk_tkt_so_sync.sync_releases_ps_ticket_dtl_ex(%d, %d); end;',
    [wwQryPS_DetailID.AsLargeInt,
    QryReleasesID.AsLargeInt]);
  FIsChanged := TRUE;
  RefreshDataSetByID(QryPkTktOrdDetail, 'ord_detail_id');
end;

procedure TFrmPSFixOrphanedPkTkt.sbtnAssociateReleaseClick(
  Sender: TObject);
begin
  IQAssert(wwQryPS_DetailID.AsLargeInt > 0,
    packslip_rscstr.cTXT0000042 {'No orphaned pick ticket releases found.'});
  IQAssert(QryReleasesID.AsLargeInt > 0,
    packslip_rscstr.cTXT0000043 {'No available sales order releases found.'});

  Assign_From_PkTkt_Line;
end;

procedure TFrmPSFixOrphanedPkTkt.sbtnHideShippedClick(Sender: TObject);
begin
  QryReleases.Close;
  QryReleases.Filtered := sbtnHideShipped.Down;
  QryReleases.Open;
end;

procedure TFrmPSFixOrphanedPkTkt.SetPS_Ticket_ID(const Value: Real);
begin
  FPS_Ticket_ID := Value;
  Caption := Format(packslip_rscstr.cTXT0000040, [FPS_Ticket_ID]);
end;

procedure TFrmPSFixOrphanedPkTkt.UniFormCreate(Sender: TObject);
var
  AFlag: Boolean;
begin
  IQSetTablesActive(TRUE, self);

  if IQRegBooleanScalarRead(self, 'HIDE_SHIPPED_RELEASES', AFlag) then
    sbtnHideShipped.Down := AFlag;
  sbtnHideShipped.Click;

end;

procedure TFrmPSFixOrphanedPkTkt.QryReleasesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if sbtnHideShipped.Down then
    Accept := QryReleasesLEFT_TO_SHIP.asFloat > 0;
end;

end.
