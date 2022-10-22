unit qcexec_car;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  IQMS.WebVcl.Search,
  Db,
  Wwdatsrc,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  Buttons,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Menus,
  StdCtrls,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniGUIFrame, IQUniGrid;

type
  TFrmQCECAR = class(TUniForm)
    Panel2: TUniPanel;
    PnlTeam: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    pcMain: TUniPageControl;
    TabTeamDtl: TUniTabSheet;
    TabArcustoDtl: TUniTabSheet;
    SrcTeam: TDataSource;
    QryTeam: TFDQuery;
    SrcCAR: TDataSource;
    QryCAR: TFDQuery;
    QryTeamID: TBCDField;
    QryTeamNAME: TStringField;
    QryTeamTITLE: TStringField;
    QryTeamEMAIL: TStringField;
    PTeamDtl: TUniPopupMenu;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    QryCARCARNO: TStringField;
    QryCARPROBLEM_OWNER: TStringField;
    QryCARARCUSTO_CUSTNO: TStringField;
    QryCARARCUSTO_COMPANY: TStringField;
    QryCARVENDOR_VENDORNO: TStringField;
    QryCARVENDOR_COMPANY: TStringField;
    QryCARARINVT_ITEMNO: TStringField;
    QryCARARINVT_DESCRIP: TStringField;
    QryCARARINVT_CLASS: TStringField;
    Splitter2: TUniSplitter;
    PnlCAR: TUniPanel;
    GridCAR: TIQUniGridControl;
    PnlCARElem: TUniPanel;
    GridCARElem: TIQUniGridControl;
    SrcCARElem: TDataSource;
    QryCARElem: TFDQuery;
    QryCARID: TBCDField;
    JumptoCAR1: TUniMenuItem;
    QryCARElemID: TBCDField;
    QryCARElemCAR_ID: TBCDField;
    QryCARElemSEQ: TBCDField;
    QryCARElemDESCRIP: TStringField;
    QryCARElemRESPONSE_TEXT: TStringField;
    QryCARElemCOMPLETE_DATE: TDateTimeField;
    QryCARTEAM_MEMBER_ID: TBCDField;
    QryCARElemNAME: TStringField;
    QryCARElemEMAIL_SENT: TDateTimeField;
    QryCARElemSIGNOFF_DATE: TDateTimeField;
    QryCARElemSIGNOFF: TStringField;
    Panel3: TUniPanel;
    Panel6: TUniPanel;
    Shape1: TUniPanel;
    Shape2: TUniPanel;
    Shape3: TUniPanel;
    Shape4: TUniPanel;
    chkApproved: TUniCheckBox;
    chkUnprocessed: TUniCheckBox;
    chkPending: TUniCheckBox;
    QryCARhide_unprocessed: TIntegerField;
    QryCARhide_pending: TIntegerField;
    QryCARhide_approved: TIntegerField;
    QryCARhide_rejected: TIntegerField;
    PTeam: TUniPopupMenu;
    SendMail1: TUniMenuItem;
    QryCARElemUNPROCESSED: TStringField;
    QryCARElemPENDING: TStringField;
    QryCARARCUSTO_ID: TBCDField;
    QryCARARINVT_ID: TBCDField;
    Panel7: TUniPanel;
    cmbMaster: TUniComboBox;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    pcMaster: TUniPageControl;
    TabTeam: TUniTabSheet;
    TabArinvt: TUniTabSheet;
    TabArcusto: TUniTabSheet;
    GridTeamMember: TIQUniGridControl;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    SrcArcusto: TDataSource;
    QryArcusto: TFDQuery;
    GridArcusto: TIQUniGridControl;
    GridArinvt: TIQUniGridControl;
    TabArinvtDtl: TUniTabSheet;
    SrcArcustoCAR: TDataSource;
    QryArcustoCAR: TFDQuery;
    SrcArinvtCAR: TDataSource;
    QryArinvtCAR: TFDQuery;
    GridArinvtDtl: TIQUniGridControl;
    QryArcustoCARID: TBCDField;
    QryArcustoCARCARNO: TStringField;
    QryArcustoCARPROBLEM_OWNER: TStringField;
    QryArcustoCARARCUSTO_ID: TBCDField;
    QryArcustoCARARCUSTO_CUSTNO: TStringField;
    QryArcustoCARARCUSTO_COMPANY: TStringField;
    QryArcustoCARVENDOR_VENDORNO: TStringField;
    QryArcustoCARVENDOR_COMPANY: TStringField;
    QryArcustoCARARINVT_ID: TBCDField;
    QryArcustoCARARINVT_ITEMNO: TStringField;
    QryArcustoCARARINVT_DESCRIP: TStringField;
    QryArcustoCARARINVT_CLASS: TStringField;
    QryArinvtCARID: TBCDField;
    QryArinvtCARCARNO: TStringField;
    QryArinvtCARPROBLEM_OWNER: TStringField;
    QryArinvtCARARCUSTO_ID: TBCDField;
    QryArinvtCARARCUSTO_CUSTNO: TStringField;
    QryArinvtCARARCUSTO_COMPANY: TStringField;
    QryArinvtCARVENDOR_VENDORNO: TStringField;
    QryArinvtCARVENDOR_COMPANY: TStringField;
    QryArinvtCARARINVT_ID: TBCDField;
    QryArinvtCARARINVT_ITEMNO: TStringField;
    QryArinvtCARARINVT_DESCRIP: TStringField;
    QryArinvtCARARINVT_CLASS: TStringField;
    GridArcustoDtl: TIQUniGridControl;
    PArcustoDtl: TUniPopupMenu;
    PArinvtDtl: TUniPopupMenu;
    JumptoCAR2: TUniMenuItem;
    JumptoCAR3: TUniMenuItem;
    JumptoCustomer2: TUniMenuItem;
    JumptoInventory2: TUniMenuItem;
    QryArinvtID: TFloatField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    JumptoInventory3: TUniMenuItem;
    JumptoCustomer3: TUniMenuItem;
    SrcVendor: TDataSource;
    QryVendor: TFDQuery;
    SrcVendorCAR: TDataSource;
    QryVendorCAR: TFDQuery;
    QryVendorCARID: TBCDField;
    QryVendorCARCARNO: TStringField;
    QryVendorCARPROBLEM_OWNER: TStringField;
    QryVendorCARARCUSTO_ID: TBCDField;
    QryVendorCARARCUSTO_CUSTNO: TStringField;
    QryVendorCARARCUSTO_COMPANY: TStringField;
    QryVendorCARVENDOR_VENDORNO: TStringField;
    QryVendorCARVENDOR_COMPANY: TStringField;
    QryVendorCARARINVT_ID: TBCDField;
    QryVendorCARARINVT_ITEMNO: TStringField;
    QryVendorCARARINVT_DESCRIP: TStringField;
    QryVendorCARARINVT_CLASS: TStringField;
    TabVendor: TUniTabSheet;
    GridVendor: TIQUniGridControl;
    TabVendorDtl: TUniTabSheet;
    GridVendorDtl: TIQUniGridControl;
    PVendorDtl: TUniPopupMenu;
    JumpToCar4: TUniMenuItem;
    JumpToInventory4: TUniMenuItem;
    JumpToCustomer4: TUniMenuItem;
    PArcusto: TUniPopupMenu;
    PVendor: TUniPopupMenu;
    PArinvt: TUniPopupMenu;
    JumptoCustomer5: TUniMenuItem;
    JumptoVendor1: TUniMenuItem;
    JumptoInventory5: TUniMenuItem;
    JumptoVendor2: TUniMenuItem;
    QryCARVENDOR_ID: TBCDField;
    JumptoVendor3: TUniMenuItem;
    QryArcustoCARVENDOR_ID: TBCDField;
    JumptoVendor4: TUniMenuItem;
    QryArinvtCARVENDOR_ID: TBCDField;
    SecurityRegister1: TIQWebSecurityRegister;
    QryArcustoID: TBCDField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoCOMPANY: TStringField;
    QryVendorID: TBCDField;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcTeamDataChange(Sender: TObject; Field: TField);
    procedure Close1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumptoCAR1Click(Sender: TObject);
    procedure GridCARElemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DoFilterCheckboxClick(Sender: TObject);
    procedure QryCARElemBeforeOpen(DataSet: TDataSet);
    procedure SendMail1Click(Sender: TObject);
    procedure cmbMasterChange(Sender: TObject);
    procedure JumptoCAR2Click(Sender: TObject);
    procedure JumptoCAR3Click(Sender: TObject);
    procedure JumptoCustomer2Click(Sender: TObject);
    procedure JumptoInventory2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JumptoInventory3Click(Sender: TObject);
    procedure JumptoCustomer3Click(Sender: TObject);
    procedure JumpToCar4Click(Sender: TObject);
    procedure JumpToInventory4Click(Sender: TObject);
    procedure JumpToCustomer4Click(Sender: TObject);
    procedure JumptoCustomer5Click(Sender: TObject);
    procedure JumptoVendor1Click(Sender: TObject);
    procedure JumptoInventory5Click(Sender: TObject);
    procedure JumptoVendor2Click(Sender: TObject);
    procedure JumptoVendor3Click(Sender: TObject);
    procedure JumptoVendor4Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FFormActive: Boolean;
    procedure SetButtons;
    procedure ChangeView(AView: Integer);
  public
    { Public declarations }
    // constructor Create( AOwner: TComponent );
  end;

procedure DoQCExecCAR();

var
  FrmQCECAR: TFrmQCECAR;

implementation

{$R *.DFM}

uses
  {TODO -omugdha -cWEBIQ : Dependency on cust
    cust,}
  IQMS.Common.EmailUtils,
  { TODO -omugdha -cWEBIQ : Dependency on invtshel
  invtshel,  }
  IQMS.Common.COMExe,
  IQMS.Common.Controls,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Version,
  IQMS.Common.QC_Const;
{ TODO -omugdha -cWEBIQ : Dependency on vendor
vendor ; }

procedure DoQCExecCAR();
var
  LFrmQCECAR: TFrmQCECAR;
begin
  // TFrmQCECAR.Create( AOwner ).Show;
  LFrmQCECAR := TFrmQCECAR.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmQCECAR.UniFormCreate(Sender: TObject);
var
  i: Integer;
begin
FFormActive := FALSE;
  NotifyIfVersionChanged(Self); // iqversion

  AdjustPageControlToParent(pcMain);
  AdjustPageControlToParent(pcMaster);
  IQSetTablesActive(TRUE, Self);
  { TODO -omugdha -cWEBIQ : Dependency on Wwdbgrid
  GridCAR.Wwdbgrid.Cursor := crJump;  }

  IQRegFormRead(Self, [Self, PnlTeam]);

  cmbMaster.ItemIndex := 0;
  if IQRegIntegerScalarRead(Self, 'cmbMaster', i) then // IQMS.Common.RegFrm.pas
    cmbMaster.ItemIndex := i;
  Caption := Format('%s [%s]', [Caption, IQGetServerName('IQ')]);
end;


procedure TFrmQCECAR.FormShow(Sender: TObject);
begin
  FFormActive := TRUE;
  ChangeView(cmbMaster.ItemIndex);
  SetButtons;
end;

procedure TFrmQCECAR.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile('', ''); // IQMS.Common.HelpHook.pas
end;

procedure TFrmQCECAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ TODO -omugdha -cWEBIQ : Dependency on RestoreForm
  RestoreForm(Self); }
  FFormActive := FALSE;
  IQRegIntegerScalarWrite(Self, 'cmbMaster', cmbMaster.ItemIndex);
  IQRegFormWrite(Self, [Self, PnlTeam]);
  MemorizeVersion(Self); // iqversion
  Action := caFree;
end;

procedure TFrmQCECAR.SetButtons;
begin
  //
end;

procedure TFrmQCECAR.SrcTeamDataChange(Sender: TObject; Field: TField);
begin
  if FFormActive = FALSE then
    Exit;
  SetButtons;
end;

procedure TFrmQCECAR.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmQCECAR.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmQCECAR.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmQCECAR.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmQCECAR.GridCARElemCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;

  if QryCARElemEMAIL_SENT.AsFloat = 0 then
  begin
    AFont.Color := clBlack;
    Exit;
  end;

  if QryCARElemSIGNOFF_DATE.AsFloat = 0 then
  begin
    AFont.Color := clBlue;
    Exit;
  end;

  if QryCARElemSIGNOFF.AsString = 'Y' then
    AFont.Color := clGreen
  else
    AFont.Color := clRed;

end;

procedure TFrmQCECAR.DoFilterCheckboxClick(Sender: TObject);
begin
  RefreshDataSetByID_ExA(QryCARElem);
end;

procedure TFrmQCECAR.QryCARElemBeforeOpen(DataSet: TDataSet);
var
  AFilter: TStringList;
begin
  // Based on negative logic.  We cannot use positive logic or too many
  // rows are excluded.
  with TFDQuery(DataSet) do
    try
      AFilter := TStringList.Create;
      if not chkApproved.Checked then
        AFilter.Add('SIGNOFF<>''Y''');
      if not chkPending.Checked then
        AFilter.Add('PENDING<>''Y''');
      if not chkUnprocessed.Checked then
        AFilter.Add('UNPROCESSED<>''Y''');
      if AFilter.Count > 0 then
        Filter := StrTran(AFilter.CommaText, ',', ' AND ')
      else
        Filter := '';
      Filtered := not Empty(Filter);
    finally
      if Assigned(AFilter) then
        FreeAndNil(AFilter);
    end;
end;

procedure TFrmQCECAR.SendMail1Click(Sender: TObject);
var
  AEMail: String;
begin
  AEMail := QryTeamEMAIL.AsString;
  if AEMail > '' then
    // Show e-mail editor, using the default method
    IQMS.Common.EmailUtils.IQSendMailA(AEMail, // Recipient
      '', // Subject
      '', // BodyText
      NIL, // Attachments
      FALSE); // SendNow=False
end;

procedure TFrmQCECAR.cmbMasterChange(Sender: TObject);
begin
  ChangeView(cmbMaster.ItemIndex);
end;

procedure TFrmQCECAR.ChangeView(AView: Integer);
begin
  if FFormActive = FALSE then
    Exit;
  try
    pcMain.Visible := FALSE;
    Update;
    Invalidate;
    case AView of
      0: // Team Members
        begin
          pcMaster.ActivePageIndex := 0;
          pcMain.ActivePageIndex := 0;
        end;
      1: // Customers
        begin
          pcMaster.ActivePageIndex := 1;
          pcMain.ActivePageIndex := 1;
        end;
      2: // Vendors
        begin
          pcMaster.ActivePageIndex := 2;
          pcMain.ActivePageIndex := 2;
        end;
      3: // Inventory
        begin
          pcMaster.ActivePageIndex := 3;
          pcMain.ActivePageIndex := 3;
        end;
    end;
  finally
    pcMain.Visible := TRUE;
    Update;
  end;

end;

// ---------------------------------------------------------------------------//
// *** Begin Jumps for Master List (pcMaster) *** //
procedure TFrmQCECAR.JumptoCustomer5Click(Sender: TObject);
begin
  if QryArcustoID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToCustomer(Application, QryArcustoID.AsFloat); }// Cust.pas
end;

procedure TFrmQCECAR.JumptoVendor1Click(Sender: TObject);
begin
  if QryVendorID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoJumpToVendor(Application, QryVendorID.AsFloat); }
end;

procedure TFrmQCECAR.JumptoInventory5Click(Sender: TObject);
begin
  if QryArinvtID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToInv(Application, QryArinvtID.AsFloat); }// InvtShel.pas
end;
// ---------------------------------------------------------------------------//
// *** End Jumps for Master List *** //

// ---------------------------------------------------------------------------//
// *** Begin Jumps for Team CAR Grid *** //
procedure TFrmQCECAR.JumptoCAR1Click(Sender: TObject);
begin
  Com_Exec('IQQC', [IQMS.Common.QC_Const.QC_CAR_MAINT, QryCARID.AsFloat]);
  // IQMS.Common.COMExe.pas
end;

procedure TFrmQCECAR.JumptoCustomer2Click(Sender: TObject);
begin
  if QryCARARCUSTO_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToCustomer(Application, QryCARARCUSTO_ID.AsFloat);} // Cust.pas
end;

procedure TFrmQCECAR.JumptoInventory2Click(Sender: TObject);
begin
  if QryCARARINVT_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToInv(Application, QryCARARINVT_ID.AsFloat);} // InvtShel.pas
end;

procedure TFrmQCECAR.JumptoVendor2Click(Sender: TObject);
begin
  if QryCARVENDOR_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoJumpToVendor(Application, QryCARVENDOR_ID.AsFloat);  }
end;
// *** End Jumps for Team CAR Grid *** //
// ---------------------------------------------------------------------------//

// ---------------------------------------------------------------------------//
// *** Begin Jumps for Customer CAR Grid *** //
procedure TFrmQCECAR.JumptoCAR2Click(Sender: TObject);
begin
  Com_Exec('IQQC', [IQMS.Common.QC_Const.QC_CAR_MAINT, QryArcustoCARID.AsFloat]);
  // IQMS.Common.COMExe.pas
end;

procedure TFrmQCECAR.JumptoInventory3Click(Sender: TObject);
begin
  if QryArcustoCARARINVT_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToInv(Application, QryArcustoCARARINVT_ID.AsFloat);  }// InvtShel.pas
end;

procedure TFrmQCECAR.JumptoVendor3Click(Sender: TObject);
begin
  if QryArcustoCARVENDOR_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoJumpToVendor(Application, QryArcustoCARVENDOR_ID.AsFloat); }
end;
// *** End Jumps for Customer CAR Grid *** //
// ---------------------------------------------------------------------------//

// ---------------------------------------------------------------------------//
// *** Begin Jumps for Inventory CAR Grid *** //
procedure TFrmQCECAR.JumptoCAR3Click(Sender: TObject);
begin
  Com_Exec('IQQC', [IQMS.Common.QC_Const.QC_CAR_MAINT, QryArinvtCARID.AsFloat]);
  // IQMS.Common.COMExe.pas
end;

procedure TFrmQCECAR.JumptoCustomer3Click(Sender: TObject);
begin
  if QryArinvtCARARCUSTO_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToCustomer(Application, QryArinvtCARARCUSTO_ID.AsFloat);} // Cust.pas
end;

procedure TFrmQCECAR.JumptoVendor4Click(Sender: TObject);
begin
  if QryArinvtCARVENDOR_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoJumpToVendor(Application, QryArinvtCARVENDOR_ID.AsFloat); }
end;
// *** End Jumps for Inventory CAR Grid *** //
// ---------------------------------------------------------------------------//

// ---------------------------------------------------------------------------//
// *** Begin Jumps for Vendor CAR Grid *** //
procedure TFrmQCECAR.JumpToCar4Click(Sender: TObject);
begin
  Com_Exec('IQQC', [IQMS.Common.QC_Const.QC_CAR_MAINT, QryVendorCARID.AsFloat]);
  // IQMS.Common.COMExe.pas
end;

procedure TFrmQCECAR.JumpToInventory4Click(Sender: TObject);
begin
  if QryVendorCARARINVT_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToInv(Application, QryVendorCARARINVT_ID.AsFloat);} // InvtShel.pas
end;

procedure TFrmQCECAR.JumpToCustomer4Click(Sender: TObject);
begin
  if QryVendorCARARCUSTO_ID.AsFloat > 0 then
  { TODO -omugdha -cWEBIQ : Dependency on cust unit
    DoIQJumpToCustomer(Application, QryVendorCARARCUSTO_ID.AsFloat); }// Cust.pas
end;
// *** End Jumps for Vendor CAR Grid *** //
// ---------------------------------------------------------------------------//

end.
