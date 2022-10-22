unit wave_pick_dlg;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Wwquery,
  IQMS.WebVcl.About,
  wave_share,
  System.Generics.Collections,
  IQMS.WebVcl.Jump,
  Vcl.wwDataInspector,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls, Vcl.Grids, IQUniGrid,
  uniGUIFrame;

type
  TFrmWavePickDlg = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PageControl1: TUniPageControl;
    SrcReleases: TDataSource;
    QryReleases: TFDQuery;
    TabSheet1: TUniTabSheet;
    IQSearch1: TIQUniGridControl;
    QryReleasesARINVT_ID: TBCDField;
    QryReleasesORD_DETAIL_ID: TBCDField;
    QryReleasesRELEASE_ID: TBCDField;
    QryReleasesSHIP_QUAN: TFMTBCDField;
    QryReleasesSHIP_DATE: TDateTimeField;
    QryReleasesITEMNO: TStringField;
    QryReleasesDESCRIP: TStringField;
    QryReleasesDESCRIP2: TStringField;
    QryReleasesREV: TStringField;
    QryReleasesEPLANT_ID: TBCDField;
    QryReleasesORDERNO: TStringField;
    QryReleasesPONO: TStringField;
    QryReleasesRAN: TStringField;
    QryReleasesONHOLD: TStringField;
    QryReleasesSHIPHOLD: TStringField;
    QryReleasesKBTRIGGER: TStringField;
    QryReleasesFREIGHT_ID: TFMTBCDField;
    QryReleasesSHIP_VIA: TStringField;
    QryReleasesSHIP_QUAN_NATIVE: TFMTBCDField;
    QryReleasesOE_UNIT: TStringField;
    QryReleasesARINVT_UNIT: TStringField;
    QryReleasesIN_TRANSIT_PARTNO_ID: TBCDField;
    QryReleasesONHAND: TBCDField;
    QryReleasesPHANTOM: TStringField;
    QryReleasesPHANTOM_COMPONENTS_ON_SO: TStringField;
    QryReleasesWAVE_PICK_ID: TFMTBCDField;
    QryReleasesSTANDARD_ID: TBCDField;
    PopupMenu3: TUniPopupMenu;
    MenuItem4: TUniMenuItem;
    MenuItem5: TUniMenuItem;
    MenuItem6: TUniMenuItem;
    IQJumpInv3: TIQWebJump;
    IQJumpOe3: TIQWebJump;
    IQJumpBom3: TIQWebJump;
    pnlWaveHeader: TUniPanel;
    Splitter1: TUniSplitter;
    QryReleasesEXPEDITE: TStringField;
    Panel5: TUniPanel;
    Shape3: TUniPanel;
    Shape4: TUniPanel;
    Shape6: TUniPanel;
    Shape9: TUniPanel;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    QryReleasesINV_AVAIL: TBCDField;
    QryReleasesID: TBCDField;
    QryReleasesORDERS_ID: TBCDField;
    QryReleasesCOMPANY: TStringField;
    QryReleasesSHIP_TO_ATTN: TStringField;
    QryReleasesREQUEST_DATE: TDateTimeField;
    diCriteria: TwwDataInspector;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure AssignParams(DataSet: TDataSet);
    procedure IQSearch1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FWavePick_ID: Real;
    FDivision_ID: Real;
    FEPlant_ID  : Real;
    FArcusto_ID : Real;
    FShip_To_ID : Real;
    FFreight_ID : Real;
    FFromShipDate: TDateTime;
    FToShipDate : TDateTime;
    FWave_Pick_Ticket_ID: Real;
    FExpedite_Axe: string;
    FSalespeople_ID: Real;
    FPR_Emp_ID: Real;
    FCust_Group: string;
    FEvalReqDate: Boolean;
    FRan_From: string;
    FRan_To: string;

    procedure UpdateSelectionCriteriaDisplay;
    procedure CheckReleasesBelongToAnotherWave;
    procedure PrepareReleases;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
  public
    { Public declarations }

    class procedure DoShow( AParam: TWavePickCriteriaParam  );

    class procedure AddToWaveDetails( AWavePick_ID,
                                      AWave_Pick_Ticket_ID: Real;
                                      ACargo: TWaveSelectedRelease); static;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

class procedure TFrmWavePickDlg.DoShow(AParam: TWavePickCriteriaParam);
var
  FrmWavePickDlg: TFrmWavePickDlg;
begin
  FrmWavePickDlg := TFrmWavePickDlg.Create(UniGUIApplication.UniApplication);
  with FrmWavePickDlg do
  begin
    FWavePick_ID := AParam.WavePick_ID;
    FDivision_ID := AParam.Division_ID;
    FEPlant_ID   := AParam.EPlant_ID;
    FArcusto_ID  := AParam.Arcusto_ID;
    FShip_To_ID  := AParam.Ship_To_ID;
    FFreight_ID  := AParam.Freight_ID;
    FFromShipDate:= AParam.FromShipDate;
    FWave_Pick_Ticket_ID:= AParam.Wave_Pick_Ticket_ID;
    FExpedite_Axe:= AParam.Expedite_Axe;
    FToShipDate  := AParam.ToShipDate;
    FSalespeople_ID:= AParam.Salespeople_ID;
    FPR_Emp_ID   := AParam.PR_Emp_ID;
    FCust_Group  := AParam.Cust_Group;
    FEvalReqDate := AParam.EvalReqDate;
    FRan_From    := AParam.Ran_From;
    FRan_To      := AParam.Ran_To;
    Show;
  end;
end;

procedure TFrmWavePickDlg.UniFormCreate(Sender: TObject);
begin
  QryReleases.Close;

  IQRegFormRead(self, [ self, pnlWaveHeader ]);

  PageControl1.ActivePageIndex:= 0;
  //PostMessage( Handle, iq_AfterShowMessage, 0, 0);
end;


procedure TFrmWavePickDlg.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmWavePickDlg.IQAfterShowMessage(var Msg: TMessage);
begin
  UpdateSelectionCriteriaDisplay;
  diCriteria.Repaint;

  PrepareReleases;
  QryReleases.Close;
  QryReleases.Open;
end;

procedure TFrmWavePickDlg.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmWavePickDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, pnlWaveHeader ]);
end;

procedure TFrmWavePickDlg.IQSearch1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);

  procedure _AssignColor( F1,B1, F2, B2: TColor );
  begin
     case Highlight of
       TRUE : begin
                AFont.Color := F1;
                ABrush.Color:= B1;
              end;
       FALSE: begin
                AFont.Color := F2;
                ABrush.Color:= B2;
              end;
     end
  end;

begin
  if QryReleasesID.asFloat = 0 then
     EXIT;

  AssignAvailabilityColors( QryReleasesINV_AVAIL.asFloat, AFont, ABrush, Highlight );

  if (Field = QryReleasesWAVE_PICK_ID) and (QryReleasesWAVE_PICK_ID.asFloat = FWavePick_ID) then
     _AssignColor( {highlight} clAqua, clBlack, {Normal} clBlack, clAqua )

  else if (Field = QryReleasesWAVE_PICK_ID) and (QryReleasesWAVE_PICK_ID.asFloat > 0) then
     _AssignColor( {highlight} clYellow, clBlack, {Normal} clWhite, clGray );

  if (Field = QryReleasesITEMNO) and (QryReleasesONHOLD.asString = 'Y') then
     _AssignColor( {highlight} clYellow, clBlack,  {Normal} clBlack, $000080FF)
end;

procedure TFrmWavePickDlg.MenuItem4Click(Sender: TObject);
begin
  IQJumpInv3.Execute;
end;

procedure TFrmWavePickDlg.MenuItem5Click(Sender: TObject);
begin
  IQJumpOe3.Execute;
end;

procedure TFrmWavePickDlg.MenuItem6Click(Sender: TObject);
begin
  IQJumpBom3.Execute;
end;

procedure TFrmWavePickDlg.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmWavePickDlg.AssignParams(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'wave_pick_id', FWavePick_ID);
end;

procedure TFrmWavePickDlg.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmWavePickDlg.btnOKClick(Sender: TObject);
const
  cnstRefreshDataSet = 2;
var
  I: Integer;

  procedure _AddToWaveDetails( ACargo: TWaveSelectedRelease );
  begin
    TFrmWavePickDlg.AddToWaveDetails( FWavePick_ID, FWave_Pick_Ticket_ID, ACargo );  // this unit
  end;

  procedure _CheckPrepareProcessRelease( DataSet: TDataSet );
  var
    ACargo: TWaveSelectedRelease;   // wave_share.pas
    AQuan: Real;
  begin
    AQuan:= SelectValueFmtAsFloat('select sum(ship_quan) from wave_pick_dtl where wave_pick_id = %f and releases_id = %f',
                      [ FWavePick_ID, DataSet.FieldByName('release_id').asFloat ]);

    if DataSet.FieldByName('ship_quan').asFloat - AQuan <= 0 then
       EXIT;

    if (DataSet.FieldByName('wave_pick_id').asFloat > 0) and (DataSet.FieldByName('wave_pick_id').asFloat <> FWavePick_ID) then
       EXIT;

    ACargo.Arinvt_ID     := DataSet.FieldByName('arinvt_id').asFloat;
    ACargo.Ord_Detail_ID := DataSet.FieldByName('ord_detail_id').asFloat;
    ACargo.Releases_ID   := DataSet.FieldByName('release_id').asFloat;
    ACargo.Ship_Quan     := DataSet.FieldByName('ship_quan').asFloat - AQuan;   // DataSet.FieldByName('ship_quan').asFloat;
    ACargo.Must_Ship_Date:= DataSet.FieldByName('ship_date').asDateTime;
    ACargo.Pts_Per_Pkg   := SelectValueFmtAsFloat('select IQMS.Common.Miscellaneous.no_zero( decode( nvl(a.pk_unit_type, ''C''), '+
                                      '                               ''E'', 1,                   '+
                                      '                               ''C'', pk_ptsper,           '+
                                      '                               ''P'', pallet_ptsper ))     '+
                                      '  from arinvt a                                            '+
                                      ' where a.id = %f                                           ',
                                      [ ACargo.Arinvt_ID  ]);

    _AddToWaveDetails( ACargo );
  end;

begin
  CheckReleasesBelongToAnotherWave;

  with IQSearch1 do
  begin
    {DataSet property is replaced with DataSource.DataSet}
    if DataSource.DataSet.Eof and DataSource.DataSet.Bof then
       EXIT;

    { Append to List (releases_id, arinvt_id - everything }
    { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
    {if wwDBGrid.SelectedList.Count > 0 then
       for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
       begin
         DataSource.DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
         _CheckPrepareProcessRelease( DataSource.DataSet );
       end
    else
       _CheckPrepareProcessRelease( DataSource.DataSet );}

    PostMessage( TUniForm(self.Owner).Handle, iq_Notify, cnstRefreshDataSet, 0 );
    Close;
  end;
end;

procedure TFrmWavePickDlg.UpdateSelectionCriteriaDisplay;
var
  S: string;

  procedure _AssignCriteriaLookupDisplay( ATagString, AFieldName, ATableName: string; AID: Real);
  begin
    diCriteria.GetItemByTagString( ATagString ).DisplayText:= '';
    if AID = 0 then
       EXIT;

    diCriteria.GetItemByTagString( ATagString ).DisplayText:= SelectValueByID( AFieldName, ATableName, AID )
  end;

  procedure _AssignFirstLastNameDisplay( ATagString, ATableName: string; AID: Real );
  begin
    diCriteria.GetItemByTagString( ATagString ).DisplayText:= '';
    if AID = 0 then
       EXIT;
    diCriteria.GetItemByTagString( ATagString ).DisplayText:= SelectValueFmtAsString('select substrB( IQMS.Common.StringUtils.Concat3W( first_name, last_name, ''''), 1, 255) from %s where id = %f',
                                   [ ATableName,
                                     AID ]);
  end;


begin
  _AssignCriteriaLookupDisplay('customer',   'company', 'arcusto',  FArcusto_ID  );
  _AssignCriteriaLookupDisplay('division', 'name',    'division', FDivision_ID );
  _AssignCriteriaLookupDisplay('eplant',   'name',    'eplant',   FEplant_ID   );
  _AssignCriteriaLookupDisplay('freight',  'descrip', 'freight',  FFreight_ID  );
  _AssignCriteriaLookupDisplay('ship_to',  'attn',    'ship_to',  FShip_To_ID  );

  _AssignFirstLastNameDisplay('salesperson', 'salespeople', FSalespeople_ID  );
  _AssignFirstLastNameDisplay('employee',    'pr_emp',      FPr_Emp_ID  );

  diCriteria.GetItemByTagString('wave').DisplayText          := FloatToStr( FWavePick_ID );
  diCriteria.GetItemByTagString('from_ship_date').DisplayText:= DateToStr(FFromShipDate);
  diCriteria.GetItemByTagString('to_ship_date').DisplayText  := DateToStr(FToShipDate);
  diCriteria.GetItemByTagString('cust_group').DisplayText    := FCust_Group;
  diCriteria.GetItemByTagString('eval_req_date').DisplayText := IQMS.Common.StringUtils.BoolToYN(FEvalReqDate);
  diCriteria.GetItemByTagString('ran_from').DisplayText      := FRan_From;
  diCriteria.GetItemByTagString('ran_to').DisplayText        := FRan_To;

  S:= 'Include Expedited Orders';
  if FExpedite_Axe = 'X' then
     S:= 'Exclude Expedited Orders'
  else if FExpedite_Axe = 'E' then
     S:= 'Only Expedited Orders';
  diCriteria.GetItemByTagString('expedite_axe').DisplayText:= S;
end;


class procedure TFrmWavePickDlg.AddToWaveDetails( AWavePick_ID, AWave_Pick_Ticket_ID: Real;  ACargo: TWaveSelectedRelease );
begin
  ExecuteCommandFmt('insert into wave_pick_dtl                          '+
            '     ( wave_pick_id,                               '+
            '       arinvt_id,                                  '+
            '       ord_detail_id,                              '+
            '       releases_id,                                '+
            '       ship_quan,                                  '+
            '       must_ship_date,                             '+
            '       ptsper,                                     '+
            '       wave_pick_ticket_id )                       '+
            'values                                             '+
            '     ( %f,                                         '+
            '       %s,                                         '+
            '       %f,                                         '+
            '       %f,                                         '+
            '       %.6f,                                       '+
            '       to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''), '+
            '       %.6f,                                       '+
            '       %s )                                        ',
            [ AWavePick_ID,
              IQMS.Common.StringUtils.FloatToStr0asNull( ACargo.arinvt_id, 'null' ),
              ACargo.ord_detail_id,
              ACargo.releases_id,
              ACargo.ship_quan,
              FormatDateTime('mm/dd/yyyy hh:nn:ss', ACargo.must_ship_date),
              ACargo.pts_per_pkg,
              IQMS.Common.StringUtils.FloatToStr0asNull( AWave_Pick_Ticket_ID, 'null' )]);
end;


procedure TFrmWavePickDlg.CheckReleasesBelongToAnotherWave;
type
  TInAnotherWave = (iawNone, iawAllow, iawAbort);
var
  I: Integer;

  function _Check( ADataSet: TDataSet ): TInAnotherWave;
  var
    AThisWavePick_ID: Real;
  begin
    AThisWavePick_ID:= QryReleases.FieldByName('wave_pick_id').asFloat;

    if (AThisWavePick_ID = 0) or (AThisWavePick_ID = FWavePick_ID) then
       EXIT (iawNone);

    if IQMS.Common.Dialogs.IQConfirmYNWithSecurity( 'There are releases that belong to another Wave.'#13#13+
                                       'Releases that are not associated to a Wave will be added to the current Wave.'#13#13+
                                       'Continue?',
                                       'ReleaseFoundInAnotherWave',
                                       True ) then
       Result:= iawAllow
    else
       Result:= iawAbort;
  end;

begin
  with IQSearch1 do
  begin
    {DataSet property is replaced with DataSource.DataSet}
    if DataSource.DataSet.Eof and DataSource.DataSet.Bof then
       EXIT;

    { Append to List (releases_id, arinvt_id - everything }
    { TODO -oSanketG -cWebConvert : Need to find alternative property for wwDBGrid in TIQUniGridControl }
    {if wwDBGrid.SelectedList.Count > 0 then
       for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
       begin
         DataSource.DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
         case  _Check( DataSource.DataSet ) of
           iawNone : ;       // continue to scan
           iawAllow: EXIT;   // we are done
           iawAbort: ABORT;
         end;
       end
    else
       case  _Check( DataSource.DataSet ) of
         iawAbort: ABORT;
       end; }
  end;

end;

procedure TFrmWavePickDlg.PrepareReleases;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait();
  try
    ExecuteCommandFmt('begin                                                                              '+
              '  wave_misc.prepare_wave_pick_releases( %f,                                        '+     // v_wave_pick_id
              '                                        to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),'+     // v_from_ship_date
              '                                        to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss''),'+     // v_to_ship_date
              '                                        %f,                                        '+     // v_division_id
              '                                        %f,                                        '+     // v_eplant_id
              '                                        %f,                                        '+     // v_arcusto_id
              '                                        %f,                                        '+     // v_ship_to_id
              '                                        %f,                                        '+     // v_freight_id
              '                                        ''%s'',                                    '+     // v_expedite_axe
              '                                        %f,                                        '+     // v_salespeople_id
              '                                        %f,                                        '+     // v_pr_emp_id
              '                                        ''%s'',                                    '+     // v_cust_group
              '                                        ''%s'',                                    '+     // v_eval_req_date
              '                                        ''%s'',                                    '+     // v_ran_from
              '                                        ''%s'' );                                  '+     // v_ran_to
              'end;                                                                               ',
              [ FWavePick_ID,                                           // v_wave_pick_id
                FormatDateTime('mm/dd/yyyy hh:nn:ss', FFromShipDate),   // v_from_ship_date
                FormatDateTime('mm/dd/yyyy hh:nn:ss', FToShipDate),     // v_to_ship_date
                FDivision_ID,                                           // v_division_id
                FEPlant_ID,                                             // v_eplant_id
                FArcusto_ID,                                            // v_arcusto_id
                FShip_To_ID,                                            // v_ship_to_id
                FFreight_ID,                                            // v_freight_id
                FExpedite_Axe,                                          // v_expedite_axe
                FSalespeople_ID,                                        // v_salespeople_id
                FPR_Emp_ID,                                             // v_pr_emp_id
                FCust_Group,                                            // v_cust_group
                IQMS.Common.StringUtils.BoolToYN(FEvalReqDate),                        // v_eval_req_date
                FRan_From,
                FRan_To ]);
  finally
    hMsg.Free;
  end;
end;

end.
