unit crm_aka1;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  DBCtrls,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Jump,
  System.Variants,
  DM_CRMPK,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl,
  IQUniGrid, uniComboBox, uniDBComboBox, uniGUIFrame,uniDBGrid;

type
  TFrmCRMEditCustomerAka = class(TUniForm)
    PnlCarrier: TUniPanel;
    pcMain: TUniPageControl;
    TabAKA: TUniTabSheet;
    TabAKABreaks: TUniTabSheet;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    HelpAbout1: TUniMenuItem;
    SrcAvailableArinvt: TDataSource;
    QryAvailableArinvt: TFDQuery;
    SrcSelectedArinvt: TDataSource;
    QrySelectedArinvt: TFDQuery;
    IQAbout1: TIQWebAbout;
    Bevel1: TUniPanel;
    PnlAssignAKA_InventoryList: TUniPanel;
    PnlCurrentAKA: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    GridAvailableArinvt: TIQUniGridControl;
    QryAvailableArinvtID: TBCDField;
    QryAvailableArinvtITEMNO: TStringField;
    QryAvailableArinvtDESCRIP: TStringField;
    QryAvailableArinvtCLASS: TStringField;
    QryAvailableArinvtREV: TStringField;
    StatusBar: TUniStatusBar;
    View1: TUniMenuItem;
    Refresh1: TUniMenuItem;
    PnlPriceBreaks_AKA: TUniPanel;
    PnlAKABreaksTables: TUniPanel;
    Splitter2: TUniSplitter;
    Panel7: TUniPanel;
    SrcAKA: TDataSource;
    SrcAKABreaks: TDataSource;
    Panel11: TUniPanel;
    sbtnAddArinvtToAka: TUniSpeedButton;
    sbtnAddAllArinvtToAka: TUniSpeedButton;
    sbtnRemoveAka: TUniSpeedButton;
    sbtnRemoveAllAka: TUniSpeedButton;
    QryArinvtLookup: TFDQuery;
    QryArinvtLookupID: TBCDField;
    QryArinvtLookupITEMNO: TStringField;
    QryArinvtLookupDESCRIP: TStringField;
    QryArinvtLookupCLASS: TStringField;
    QryArinvtLookupREV: TStringField;
    QryCurrency: TFDQuery;
    Panel9: TUniPanel;
    pcAKA: TUniPageControl;
    TabAKAGrid: TUniTabSheet;
    TabAKAForm: TUniTabSheet;
    PnlAkaGrid: TUniPanel;
    GridAKA: TIQUniGridControl;
    Panel10: TUniPanel;
    pcAKABreaks: TUniPageControl;
    TabAKABreaks_AKABreaks: TUniTabSheet;
    TabAKABreaks_ArinvtBreaks: TUniTabSheet;
    Panel13: TUniPanel;
    GridAKABreaks: TIQUniGridControl;
    Panel14: TUniPanel;
    GridMasterInvBreaks: TIQUniGridControl;
    SrcArinvtBreaks: TDataSource;
    QryArinvtBreaks: TFDQuery;
    QryArinvtBreaksARINVT_ID: TBCDField;
    QryArinvtBreaksQUAN: TBCDField;
    QryArinvtBreaksQPRICE: TFMTBCDField;
    QryArinvtBreaksPRICE_DATE: TDateTimeField;
    QryArinvtBreaksEFFECT_DATE: TDateTimeField;
    QryArinvtBreaksDEACTIVE_DATE: TDateTimeField;
    QryArinvtBreaksID: TBCDField;
    QryArinvtBreaksBUYING: TStringField;
    QryCurrencyCURR_CODE: TStringField;
    QryCurrencyDESCRIP: TStringField;
    sbtnToggleHeaderView: TUniSpeedButton;
    QryClassLookup: TFDQuery;
    QryClassLookupCLASS: TStringField;
    Panel1: TUniPanel;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Panel15: TUniPanel;
    lblFilterByClass: TUniLabel;
    cmbClassFilter: TUniDBLookupComboBox;
    PnlPriceBreaksCaptionOuter: TUniPanel;
    PnlPriceBreaksCaption: TUniPanel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    lblPriceBreaks_Customer: TUniLabel;
    SR: TIQWebSecurityRegister;
    Bevel3: TUniPanel;
    PnlAkaBreaksToolbar: TUniPanel;
    PnlArinvtBreaksToolbar: TUniPanel;
    NavMasterInventoryBreaks: TUniDBNavigator;
    NavAKA_Db: TUniDBNavigator;
    NavAKABreaks_Db: TUniDBNavigator;
    JInventory: TIQWebJump;
    PArinvt: TUniPopupMenu;
    JumpToInventory1: TUniMenuItem;
    QryAvailableArinvtEPLANT_ID: TBCDField;
    HelpContents1: TUniMenuItem;
    QryArinvtLookupDESCRIP2: TStringField;
    QryAvailableArinvtDESCRIP2: TStringField;
    sbtnHideAka: TUniSpeedButton;
    sbtnHideArinvtBreaks: TUniSpeedButton;
    PAka: TUniPopupMenu;
    JumpToInventory2: TUniMenuItem;
    JInventory2: TIQWebJump;
    GridSelectedAka: TIQUniGridControl;
    Panel16: TUniPanel;
    Panel17: TUniPanel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    lblAssignAKA_Customer: TUniLabel;
    QrySelectedArinvtAKA_ID: TBCDField;
    QrySelectedArinvtARINVT_ID: TBCDField;
    QrySelectedArinvtCUST_ITEMNO: TStringField;
    QrySelectedArinvtCUST_DESCRIP: TStringField;
    QrySelectedArinvtITEMNO: TStringField;
    QrySelectedArinvtDESCRIP: TStringField;
    QrySelectedArinvtDESCRIP2: TStringField;
    QrySelectedArinvtCLASS: TStringField;
    QrySelectedArinvtREV: TStringField;
    PSelectedAka: TUniPopupMenu;
    JumptoAKAItem1: TUniMenuItem;
    JAka: TIQWebJump;
    QryAka: TFDQuery;
    QryAkaBreaks: TFDQuery;
    QryAkaID: TBCDField;
    QryAkaARINVT_ID: TBCDField;
    QryAkaCUST_ITEMNO: TStringField;
    QryAkaCUST_DESCRIP: TStringField;
    QryAkaARCUSTO_ID: TBCDField;
    QryAkaPRICE_PER_1000: TStringField;
    QryAkaCOMIS_PRCNT: TFMTBCDField;
    QryAkaCURRENCY_ID: TBCDField;
    QryAkaCUST_REV: TStringField;
    QryAkaCUST_DESCRIP2: TStringField;
    QryAkaKIND: TStringField;
    QryAkaARINVT_ITEMNO: TStringField;
    QryAkaARINVT_DESCRIP: TStringField;
    QryAkaARINVT_DESCRIP2: TStringField;
    QryAkaARINVT_CLASS: TStringField;
    QryAkaARINVT_REV: TStringField;
    QryAkaBreaksID: TBCDField;
    QryAkaBreaksAKA_ID: TBCDField;
    QryAkaBreaksQUAN: TBCDField;
    QryAkaBreaksQPRICE: TFMTBCDField;
    QryAkaBreaksPRICE_DATE: TDateTimeField;
    QryAkaBreaksEFFECT_DATE: TDateTimeField;
    QryAkaBreaksDEACTIVE_DATE: TDateTimeField;
    QryAkaCURR_CODE: TStringField;
    QryAkaCURR_DESCRIP: TStringField;
    cmbCurrencyGrid: TUniDBLookupComboBox;
    PnlAkaFormCarrier: TUniPanel;
    sbAkaForm: TUniScrollBox;
    PnlAkaForm: TUniPanel;
    Splitter3: TUniSplitter;
    PnlAkaFormLeft: TUniPanel;
    lblAkaItemno: TUniLabel;
    lblAkaDescrip: TUniLabel;
    lblAkaCommissionPercent: TUniLabel;
    lblAkaCurrency: TUniLabel;
    lblAkaInventoryItemno: TUniLabel;
    lblAkaInventoryDescrip: TUniLabel;
    lblAkaInventoryDescrip2: TUniLabel;
    lblAkaInventoryClass: TUniLabel;
    lblAkaInventoryRev: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    PnlAkaFormClient: TUniPanel;
    dbeAkaItemo: TUniDBEdit;
    dbeAkaDescrip: TUniDBEdit;
    chkAkaPricePer1000: TUniDBCheckBox;
    dbeAkaCommissionPercent: TUniDBEdit;
    cmbAkaCurrencyForm: TUniDBLookupComboBox;
    dbeAkaInventoryItemno: TUniDBEdit;
    dbeAkaInventoryDescrip: TUniDBEdit;
    dbeAkaInventoryDescrip2: TUniDBEdit;
    dbeAkaInventoryClass: TUniDBEdit;
    dbeAkaInventoryRev: TUniDBEdit;
    dbeAkaDescrip2: TUniDBEdit;
    dbeAkaRev: TUniDBEdit;
    PMasterInventoryBreaks: TUniPopupMenu;
    JumptoTierTable1: TUniMenuItem;
    QrySelectedArinvtKIND: TStringField;
    QryAkaUpdateSQL: TFDUpdateSQL;
    QryAkaBreaksUpdateSQL: TFDUpdateSQL;
    QryCurrencyID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure HelpAbout1Click(Sender: TObject);
    procedure DoDataSetBeforeOpen(DataSet: TDataSet);
    procedure sbtnAddArinvtToAkaClick(Sender: TObject);
    procedure sbtnRemoveAkaClick(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure QryAKANewRecord(DataSet: TDataSet);
    procedure TabAKABreaksShow(Sender: TObject);
    procedure sbtnRemoveAllAkaClick(Sender: TObject);
    procedure sbtnAddAllArinvtToAkaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure GridAKACalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure sbtnToggleHeaderViewClick(Sender: TObject);
    procedure cmbClassFilterChange(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure PkArinvtBeforeOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure QryAKABeforeInsert(DataSet: TDataSet);
    procedure HelpContents1Click(Sender: TObject);
    procedure DoRefreshAKABreaksAfterPost(DataSet: TDataSet);
    procedure sbtnHideAkaClick(Sender: TObject);
    procedure QryArinvtBreaksFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure sbtnHideArinvtBreaksClick(Sender: TObject);
    procedure JumpToInventory2Click(Sender: TObject);
    procedure JumptoAKAItem1Click(Sender: TObject);
    procedure PSelectedAkaPopup(Sender: TObject);
    procedure DoApplyUpdates(DataSet: TDataSet);

    procedure QryAkaBeforeDelete(DataSet: TDataSet);
    procedure QryAkaBeforeOpen(DataSet: TDataSet);
    procedure QryAkaBreaksBeforeDelete(DataSet: TDataSet);
    procedure QryAkaBreaksBeforeInsert(DataSet: TDataSet);
    procedure QryAkaBreaksFilterRecord(DataSet: TDataSet; var Accept: Boolean);

    procedure NavAKA_DbBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure NavAKABreaks_DbBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure QryAkaBreaksNewRecord(DataSet: TDataSet);
    procedure cmbAkaCurrencyCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbAkaCurrencyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JumptoTierTable1Click(Sender: TObject);
    procedure GridAKABreaksDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FCancel: Boolean;
    FModified: Boolean;
    PKDM: TCRMPK_DM;
    FArcustoID: Int64;
    procedure SetCaption;
    procedure SetStatus(S: string; APanel: Integer);

    procedure RegReadAKAButtons;
    procedure SetAKAButtonHints;
  public
    { Public declarations }
    class procedure DoShow( AArcustoID: Int64 );
    property ArcustoID: Int64 read FArcustoID;
  end;


var
  FrmCRMEditCustomerAka: TFrmCRMEditCustomerAka;

implementation

{$R *.DFM}


uses
  ar_tiers,
  crm_aka_shr,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

{ TFrmCRMAka1 }


class procedure TFrmCRMEditCustomerAka.DoShow( AArcustoID: Int64 );
var
  i: Integer;
  AForm: TUniForm;
begin
  AForm := FindFormByClassName('TFrmCRMEditCustomerAka');
  if ( Aform = nil) or (TFrmCRMEditCustomerAka(AForm).ArcustoID <> AArcustoID)  then
  begin
     AForm := TFrmCRMEditCustomerAka.Create(uniGUIApplication.UniApplication);
     with TFrmCRMEditCustomerAka(AForm) do
     begin
        FArcustoID := AArcustoID;
       QryClassLookup.Open;
       cmbClassFilter.Text := crm_rscstr.cTXT0000262; // ' <Not filtered> '
      // cmbClassFilter.PerformSearch;
      ReOpen(QrySelectedArinvt);
     end;
  end;

  AForm.ShowModal;
end;

procedure TFrmCRMEditCustomerAka.FormCreate(Sender: TObject);
var
  S: string;
begin
  PKDM := TCRMPK_DM.Create(Self);
  PKDM.Name := '';

  pcMain.ActivePageIndex := 0;
  cmbCurrencyGrid.SendToBack;
  cmbCurrencyGrid.Visible := FALSE;
  AdjustPageControlToParent(pcAKA);
  pcAKA.ActivePageIndex := 0;

//  IQMS.Common.Controls.ResizeNavBar(NavAKA_Db);
//  IQMS.Common.Controls.ResizeNavBar(NavAKABreaks_Db);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlAkaFormClient);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlAkaFormClient);
//  sbAkaForm.VertScrollBar.Position := 0;
  pcAKABreaks.ActivePageIndex := 0;
  IQRegStringScalarRead(Self, 'Class Filter', S);
  if S > '' then
    begin
      cmbClassFilter.Text := S;
//      cmbClassFilter.PerformSearch;
    end
  else
    cmbClassFilter.Text := crm_rscstr.cTXT0000262; // ' <Not filtered> '

//  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
end;

procedure TFrmCRMEditCustomerAka.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlAssignAKA_InventoryList, PnlPriceBreaks_AKA,
    PnlAkaFormLeft, GridAKABreaks, GridMasterInvBreaks]);
//  GridAvailableArinvt.ReadGrid;
//  GridSelectedAka.ReadGrid;
//  GridAKA.ReadGrid;
  // IQMS.Common.RegFrm.pas
  SetCaption;
  cmbClassFilterChange(nil);
  FModified := FALSE;
end;

procedure TFrmCRMEditCustomerAka.GridAKABreaksDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
begin

  with TIQUniGridControl(Sender).DataSource.DataSet do
    begin
      if ((Date >= FieldByName('EFFECT_DATE').asDateTime) and
        (Date <= FieldByName('DEACTIVE_DATE').asDateTime)) or
        (FieldByName('DEACTIVE_DATE').AsString = '') then
        begin
         Brush.Color := clWhite;
         Font.Color := clBlack;
        end
      else
        begin
          Brush.Color := clBtnFace;
          Font.Color := clBlack;
        end;
    end;

end;

procedure TFrmCRMEditCustomerAka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self, PnlAssignAKA_InventoryList, PnlPriceBreaks_AKA,
    PnlAkaFormLeft, GridAKABreaks, GridMasterInvBreaks]);
//  GridAvailableArinvt.WriteGrid;
//  GridSelectedAka.WriteGrid;
//  GridAKA.WriteGrid;
end;

procedure TFrmCRMEditCustomerAka.SetCaption;
var
  ACompany: string;
begin
  ACompany := SelectValueFmtAsString(
    'SELECT company FROM arcusto WHERE id = %d',
    [FArcustoID]); // pas
  Caption := Format(crm_rscstr.cTXT0000264 { 'Edit AKA Assignment for %s' } ,
    [ACompany]);
  lblAssignAKA_Customer.Caption := ACompany;
  lblPriceBreaks_Customer.Caption := lblAssignAKA_Customer.Caption;
end;

procedure TFrmCRMEditCustomerAka.SetStatus(S: string; APanel: Integer);
begin
  StatusBar.Panels[APanel].Text := S;
  StatusBar.Update;
end;

procedure TFrmCRMEditCustomerAka.StatusBarResize(Sender: TObject);
begin
  if not Showing then
    Exit;
  StatusBar.Panels[0].Width := StatusBar.ClientWidth -
    (StatusBar.Panels[1].Width + StatusBar.Panels[2].Width);
  StatusBar.Update;
end;

procedure TFrmCRMEditCustomerAka.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMEditCustomerAka.HelpAbout1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCRMEditCustomerAka.DoApplyUpdates(DataSet: TDataSet);
begin
  with DataSet as TFDRDBMSDataSet do
    begin
      ApplyUpdates;
      CommitUpdates;
    end;
end;

procedure TFrmCRMEditCustomerAka.DoDataSetBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
end;

procedure TFrmCRMEditCustomerAka.sbtnAddArinvtToAkaClick(Sender: TObject);
var
  AOriginalID: Int64;
  ANewID: Int64;
  i: Integer;
begin
  // Add to Aka
  if GridAvailableArinvt.IQComponents.Grid.SelectedRows.Count > 1 then
    begin
      AOriginalID := QrySelectedArinvtAKA_ID.AsLargeInt;
      with GridAvailableArinvt.IQComponents.Grid,
        GridAvailableArinvt.IQComponents.Grid.DataSource.DataSet do
        try
          // 'Adding multiple items...'
          SetStatus(crm_rscstr.cTXT0000265, 0);
          DisableControls;
          // Cycle selected rows and update the dataset according to the corresponding ID
          for i := 0 to SelectedRows.Count - 1 do
            begin
              GotoBookmark(SelectedRows[i]);
              Freebookmark(SelectedRows[i]);
              crm_aka_shr.AddToAkaEx(
                FieldByName('ID').AsLargeInt,
                FArcustoID,
                ANewID);
            end;
          //SelectedList.Clear;
          Close;
          Open;
          Locate('ID', AOriginalID, []);

          try
            QrySelectedArinvt.DisableControls;
            QrySelectedArinvt.Close;
            QrySelectedArinvt.Open;
            QrySelectedArinvt.Locate('AKA_ID', ANewID, []);
          finally
            QrySelectedArinvt.EnableControls;
          end;

        finally
          SetStatus('', 0);
          EnableControls;
        end;
    end
  else
    begin
      crm_aka_shr.AddToAka(
        QryAvailableArinvtID.AsLargeInt,
        FArcustoID);
      RefreshDataSetByID(QrySelectedArinvt, 'AKA_ID');
    end;
end;

procedure TFrmCRMEditCustomerAka.sbtnRemoveAkaClick(Sender: TObject);
var
  AID: Int64;
  i: Integer;
begin
  if GridSelectedAka.IQComponents.Grid.SelectedRows.Count > 1 then
    begin
      with GridSelectedAka.IQComponents.Grid,
        GridSelectedAka.IQComponents.Grid.DataSource.DataSet do
        try
          // 'Removing multiple items...';
          SetStatus(crm_rscstr.cTXT0000294, 0);
          DisableControls;
          // Cycle selected rows and update the dataset according to the corresponding ID
          for i := 0 to SelectedRows.Count - 1 do
            begin
              GotoBookmark(SelectedRows[i]);
              Freebookmark(SelectedRows[i]);
              ExecuteCommandFmt(
                'DELETE FROM aka WHERE id = %d',
                [QrySelectedArinvtAKA_ID.AsLargeInt]);
            end;
          //SelectedRows.Clear;
          Close;
          Open;
        finally
          SetStatus('', 0);
          EnableControls;
        end;
    end
  else
    begin
      AID := QrySelectedArinvtAKA_ID.AsLargeInt;
      QrySelectedArinvt.Prior;
      ExecuteCommandFmt(
        'DELETE FROM aka WHERE id = %d',
        [AID]);
      RefreshDataSetByID(QrySelectedArinvt, 'AKA_ID');
    end;
  SetStatus('', 0);
end;

procedure TFrmCRMEditCustomerAka.Refresh1Click(Sender: TObject);
begin
  case pcMain.ActivePageIndex of
    0: // AKA assignment
      begin
        RefreshDataSetByID_ExA(QryAvailableArinvt); // iqlib
        RefreshDataSetByID(QrySelectedArinvt, 'AKA_ID');
      end;
    1: // AKA Breaks
      begin
        RefreshDataSetByID(QryAka);
        RefreshDataSetByID(QryAkaBreaks);
      end;
  end;
end;

procedure TFrmCRMEditCustomerAka.QryAKANewRecord(DataSet: TDataSet);
var
  AItemno, ADescrip, ADescrip2, AClass, ARev: string;
begin
  with PKDM.PkArinvt do
    if Execute then
      begin
        begin
          // Populate ID values
          QryAkaID.AsLargeInt := GetNextID('AKA');
          QryAkaARCUSTO_ID.AsLargeInt := FArcustoID;
          QryAkaARINVT_ID.AsLargeInt := System.Variants.VarAsType
            (GetValue('ID'), varInt64);
          // Populate local string variables, which will be reused.
          // We also need to ensure the compiler understands what
          // type we are using for the Force() methods below.
          AItemno := System.Variants.VarToStr(GetValue('ITEMNO'));
          ADescrip := System.Variants.VarToStr(GetValue('DESCRIP'));
          ADescrip2 := System.Variants.VarToStr(GetValue('DESCRIP2'));
          AClass := System.Variants.VarToStr(GetValue('CLASS'));
          ARev := System.Variants.VarToStr(GetValue('REV'));
          QryAkaCUST_ITEMNO.AsString := AItemno;
          QryAkaCUST_DESCRIP.AsString := ADescrip;
          QryAkaCUST_DESCRIP2.AsString := ADescrip2;
          ForceValue(SrcAKA, QryAkaARINVT_ITEMNO, AItemno);
          ForceValue(SrcAKA, QryAkaARINVT_DESCRIP, ADescrip);
          ForceValue(SrcAKA, QryAkaARINVT_DESCRIP2, ADescrip2);
          ForceValue(SrcAKA, QryAkaARINVT_CLASS, AClass);
          ForceValue(SrcAKA, QryAkaARINVT_REV, ARev);
        end;
      end
    else
      System.SysUtils.Abort;
end;

procedure TFrmCRMEditCustomerAka.TabAKABreaksShow(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  // 'Accessing AKA Information.  Please wait.'
  hMsg := hPleaseWait(crm_rscstr.cTXT0000267);
  try

    // 08/24/2009
    RegReadAKAButtons;

    if not QryAka.Active then
      QryAka.Open;

    if not QryAkaBreaks.Active then
      QryAkaBreaks.Open;

    if not QryArinvtLookup.Active then
      QryArinvtLookup.Open;

    if not QryCurrency.Active then
      QryCurrency.Open;

    if not QryArinvtBreaks.Active then
      QryArinvtBreaks.Open;

  finally
    if Assigned(hMsg) then
      hMsg.Free;
  end;
end;

procedure TFrmCRMEditCustomerAka.sbtnRemoveAllAkaClick(Sender: TObject);
begin
  // 'Remove all items from the list?'
  if IQConfirmYN(crm_rscstr.cTXT0000268) then
    begin
      crm_aka_shr.ClearCustomerAka(FArcustoID);
      ReOpen(QrySelectedArinvt);
    end;
end;

procedure TFrmCRMEditCustomerAka.sbtnAddAllArinvtToAkaClick(Sender: TObject);
var
  hMsg: TPanelMesg;
begin
  FCancel := FALSE;
  // 'Add all of Master Inventory to this customer''s AKA list?'#13#13 +
  // 'This could take a few minutes.'
  if IQConfirmYN(crm_rscstr.cTXT0000269) then
    begin
      // 'Adding items.  Please wait.';
      hMsg := hPleaseWait(crm_rscstr.cTXT0000278);
      try
        with QryAvailableArinvt do
          begin
            First;
            while not EOF and not FCancel do
              begin
                crm_aka_shr.AddToAka(FieldByName('ID').AsLargeInt, FArcustoID);
                Next;
              end;
            if FCancel then
              IQInformation(crm_rscstr.cTXT0000270 { 'Operation cancelled.' } );
          end;
        RefreshDataSetByID(QrySelectedArinvt, 'AKA_ID');
        SetStatus('', 0);
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    end;
end;

procedure TFrmCRMEditCustomerAka.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FCancel := (Key = VK_CANCEL);
end;

//procedure TFrmCRMEditCustomerAka.GridAKACalcCellColors(Sender: TObject;
//  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//  ABrush: TBrush);
//begin
//  if Highlight then
//    Exit;
//  if Field.ReadOnly or Field.Calculated then
//    ABrush.Color := clBtnFace;
//end;

procedure TFrmCRMEditCustomerAka.sbtnToggleHeaderViewClick(Sender: TObject);
begin
  TogglePageControl(pcAKA); // IQMS.Common.Controls.pas
end;

procedure TFrmCRMEditCustomerAka.cmbClassFilterChange(Sender: TObject);
var
  AClass: string;
  hMsg: TPanelMesg;
  ATestStr: string; // for testing
begin
  if not Showing then
    Exit;
  hMsg := nil;
  AClass := QryClassLookupCLASS.AsString;
  if Occurances(Trim(UpperCase(crm_rscstr.cTXT0000262)) { '<Not filtered>' } ,
    Trim(UpperCase(AClass))) > 0 then // iqstring
    with QryAvailableArinvt do
      begin
        Application.ProcessMessages;
        // 'Refreshing Master Inventory list.  Please wait.'
        hMsg := hPleaseWait(crm_rscstr.cTXT0000273);
        try
          DisableControls;
          try
            Close;
            Filter := '';
            IQAssignEPlantFilter(QryAvailableArinvt);
            Filtered := Filter > '';
            ATestStr := Filter;
            IQRegStringScalarWrite(Self, 'Class Filter', '');
            Open;
          finally
            EnableControls;
          end;
        finally
          if (hMsg <> nil) and Assigned(hMsg) then
            hMsg.Free;
        end;
        Update;
      end
  else
    with QryAvailableArinvt do
      begin
        Application.ProcessMessages;
        // crm_rscstr.cTXT0000274 =
        // 'Filtering by Class, %s.  Please wait.'
        hMsg := hPleaseWait(Format(crm_rscstr.cTXT0000274, [AClass]));
        try
          DisableControls;
          try
            Close;
            Filter := '';
            IQAssignEPlantFilter(QryAvailableArinvt);
            if Filter > '' then
              Filter := IQFormat('%s AND ( CLASS=''%s'' AND CLASS IS NOT NULL )',
                [Filter, AClass])
            else
              Filter := Format('CLASS=''%s'' AND CLASS IS NOT NULL', [AClass]);
            Filtered := TRUE;
            ATestStr := Filter;
            IQRegStringScalarWrite(Self, 'Class Filter', AClass);
            Open;
          finally
            EnableControls;
          end;
        finally
          if (hMsg <> nil) and Assigned(hMsg) then
            hMsg.Free;
        end;
        Update;
      end;
end;

procedure TFrmCRMEditCustomerAka.cmbAkaCurrencyCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
//  IQMS.Common.Controls.UpdateDBLookupComboDisplay(
//    Sender as TUniDBLookupComboBox,
//    LookupTable,
//    FillTable,
//    modified,
//    'CURRENCY_ID' { TargetIDField } ,
//    'ID' { LookupIDField } ,
//    'CURR_CODE' { TargetDisplayField } ,
//    'CURR_CODE' { LookupDisplayField } );
end;

procedure TFrmCRMEditCustomerAka.cmbAkaCurrencyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    begin
      if not (QryAka.State in [dsEdit, dsInsert]) then
        QryAka.Edit;
      QryAkaCURRENCY_ID.Clear;
    end;
end;

procedure TFrmCRMEditCustomerAka.JumptoAKAItem1Click(Sender: TObject);
begin
  // 10/24/2011
  if QrySelectedArinvtARINVT_ID.AsLargeInt > 0 then
    JAka.Execute;
end;

procedure TFrmCRMEditCustomerAka.JumpToInventory1Click(Sender: TObject);
begin
  if QryAvailableArinvtID.AsLargeInt > 0 then
    JInventory.Execute;
end;

procedure TFrmCRMEditCustomerAka.PkArinvtBeforeOpen(DataSet: TDataSet);
begin
  with DataSet do
    begin
      Filter := '';
      IQAssignEPlantFilter(DataSet); // iqlib
      Filtered := Filter > '';
    end;
end;

procedure TFrmCRMEditCustomerAka.PSelectedAkaPopup(Sender: TObject);
var
  b: Boolean;
begin
  b := SR.Enabled['JumptoAKAItem1'] and
    (QrySelectedArinvtARINVT_ID.AsLargeInt > 0);

  with GridSelectedAka do
    begin
//      if FindMenuItem(JumptoAKAItem1) <> nil then
//        FindMenuItem(JumptoAKAItem1).Visible := b;
    end;

end;

procedure TFrmCRMEditCustomerAka.FormResize(Sender: TObject);
begin
  if not Showing then
    Exit;
  if (PnlAssignAKA_InventoryList.ClientWidth < Round(TabAKA.ClientWidth / 4)) or
    (PnlAssignAKA_InventoryList.ClientWidth > TabAKA.ClientWidth) or
    (PnlCurrentAKA.ClientWidth < Round(TabAKA.ClientWidth / 4)) or
    (PnlCurrentAKA.ClientWidth > TabAKA.ClientWidth) then
    PnlAssignAKA_InventoryList.Width := Round(TabAKA.ClientWidth / 2);

  if (PnlPriceBreaks_AKA.ClientWidth < Round(TabAKABreaks.ClientWidth / 4)) or
    (PnlPriceBreaks_AKA.ClientWidth > TabAKABreaks.ClientWidth) or
    (PnlAKABreaksTables.ClientWidth < Round(TabAKABreaks.ClientWidth / 4)) or
    (PnlAKABreaksTables.ClientWidth > TabAKABreaks.ClientWidth) then
    PnlPriceBreaks_AKA.Width := Round(TabAKABreaks.ClientWidth / 2);
end;

procedure TFrmCRMEditCustomerAka.QryAKABeforeInsert(DataSet: TDataSet);
begin
  if not SR.Enabled['sbtnNavAKA_Insert'] then
    System.SysUtils.Abort;
end;

procedure TFrmCRMEditCustomerAka.HelpContents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCRMEditCustomerAka.DoRefreshAKABreaksAfterPost(DataSet: TDataSet);
begin
  // 07/01/2008 Susan reporting "ghost" records appearing after adding a new
  // record.  The problem is eliminated by refreshing after every
  // posted change.
  RefreshDataSetByID(QryAkaBreaks);
end;

procedure TFrmCRMEditCustomerAka.sbtnHideAkaClick(Sender: TObject);
begin
  // 08/24/2009
  // Allow button click to finish
  Application.ProcessMessages;
  IQRegBooleanScalarWrite(Self, 'Hide Inactive AKA Breaks', sbtnHideAka.Down);
  SetAKAButtonHints;
  RefreshDataSetByID(QryAkaBreaks);
end;

//procedure TFrmCRMEditCustomerAka.GridAKABreaksCalcCellColors(Sender: TObject;
//  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//  ABrush: TBrush);
//begin
//  if Highlight then
//    Exit;
//
//  // 08/24/2009
//  with TIQUniGridControl(Sender).DataSource.DataSet do
//    begin
//      if ((Date >= FieldByName('EFFECT_DATE').asDateTime) and
//        (Date <= FieldByName('DEACTIVE_DATE').asDateTime)) or
//        (FieldByName('DEACTIVE_DATE').AsString = '') then
//        begin
//          ABrush.Color := clWhite;
//          AFont.Color := clBlack;
//        end
//      else
//        begin
//          ABrush.Color := clBtnFace;
//          AFont.Color := clBlack;
//        end;
//    end;
//end;

procedure TFrmCRMEditCustomerAka.QryAkaBeforeDelete(DataSet: TDataSet);
begin
  if not SR.Enabled['sbtnNavAKA_Delete'] then
    System.SysUtils.Abort;
end;

procedure TFrmCRMEditCustomerAka.QryAkaBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arcusto_id', FArcustoID);
end;

procedure TFrmCRMEditCustomerAka.QryAkaBreaksBeforeDelete(DataSet: TDataSet);
begin
  // 'Delete selected item?'
  if not SR.Enabled['sbtnNavAKABreaks_Delete'] then
    System.SysUtils.Abort;
end;

procedure TFrmCRMEditCustomerAka.QryAkaBreaksBeforeInsert(DataSet: TDataSet);
begin
  if not SR.Enabled['sbtnNavAKABreaks_Insert'] or
    (QryAkaID.AsLargeInt = 0) then
    System.SysUtils.Abort;
end;

procedure TFrmCRMEditCustomerAka.QryAkaBreaksFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  // 08/24/2009
  Accept := TRUE;
  if Showing and sbtnHideAka.Down then
    Accept := SelectValueFmtAsInteger(
      'SELECT 1                                                             '#13 +
      '  FROM aka_breaks                                                    '#13 +
      ' WHERE TRUNC(SYSDATE) BETWEEN NVL(effect_date, TRUNC(SYSDATE))       '#13 +
      '                          AND NVL(deactive_date, TRUNC(SYSDATE)) AND '#13 +
      '       id = %d                                                       ',
      [QryAkaBreaksID.AsLargeInt]) = 1;
end;

procedure TFrmCRMEditCustomerAka.QryAkaBreaksNewRecord(DataSet: TDataSet);
begin
  QryAkaBreaksID.AsLargeInt := GetNextID('aka_breaks');
  QryAkaBreaksAKA_ID.AsLargeInt := QryAkaID.AsLargeInt;
end;

procedure TFrmCRMEditCustomerAka.QryArinvtBreaksFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  // 08/24/2009
  Accept := TRUE;
  if Showing and sbtnHideArinvtBreaks.Down then
    Accept := SelectValueFmtAsInteger(
      'SELECT 1                                                             '#13 +
      '  FROM arinvt_breaks                                                 '#13 +
      ' WHERE TRUNC(SYSDATE) BETWEEN NVL(effect_date, TRUNC(SYSDATE))       '#13 +
      '                          AND NVL(deactive_date, TRUNC(SYSDATE)) AND '#13 +
      '       id = %d                                                       ',
      [QryArinvtBreaksID.AsLargeInt]) = 1;
end;

procedure TFrmCRMEditCustomerAka.sbtnHideArinvtBreaksClick(Sender: TObject);
begin
  // 08/24/2009
  // Allow button click to finish
  Application.ProcessMessages;
  IQRegBooleanScalarWrite(Self, 'Hide Inactive ARINVT Breaks',
    sbtnHideArinvtBreaks.Down);
  SetAKAButtonHints;
  ReOpen(QryArinvtBreaks);
end;

procedure TFrmCRMEditCustomerAka.RegReadAKAButtons;
var
  b: Boolean;
begin
  // 08/24/2009
  sbtnHideAka.Down := FALSE;
  sbtnHideArinvtBreaks.Down := FALSE;
  if IQRegBooleanScalarRead(Self, 'Hide Inactive AKA Breaks', b) then
    sbtnHideAka.Down := b;
  if IQRegBooleanScalarRead(Self, 'Hide Inactive ARINVT Breaks', b) then
    sbtnHideArinvtBreaks.Down := b;
  SetAKAButtonHints;
end;

procedure TFrmCRMEditCustomerAka.SetAKAButtonHints;
begin
  // 08/24/2009
  sbtnHideArinvtBreaks.Hint := IQMS.Common.Numbers.sIIf(sbtnHideArinvtBreaks.Down,
    crm_rscstr.cTXT0001663, // 'Click to show inactives.';
    crm_rscstr.cTXT0001664); // 'Click to hide inactives.';
  sbtnHideAka.Hint := IQMS.Common.Numbers.sIIf(sbtnHideAka.Down, crm_rscstr.cTXT0001663,
    // 'Click to show inactives.';
    crm_rscstr.cTXT0001664); // 'Click to hide inactives.';
end;

procedure TFrmCRMEditCustomerAka.JumpToInventory2Click(Sender: TObject);
begin
  if QryAkaARINVT_ID.AsLargeInt > 0 then
    JInventory2.Execute;
end;

procedure TFrmCRMEditCustomerAka.JumptoTierTable1Click(Sender: TObject);
begin
  if QryArinvtBreaksARINVT_ID.AsLargeInt > 0 then
    ar_tiers.DoJumpFromInv(QryArinvtBreaksARINVT_ID.AsLargeInt);
end;

procedure TFrmCRMEditCustomerAka.NavAKABreaks_DbBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

procedure TFrmCRMEditCustomerAka.NavAKA_DbBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;

end.
