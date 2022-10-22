unit crm_pick_source;

(* * Pick Source **

  This unit allows users to select a Principal to be
  applied to a cRM Activity, or a similar use.
  This unit is NOT for setting the global filter
*)

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  crm_context,
  DM_CRMPK,
  System.Math,
  IQMS.WebVcl.DropDownButton,
  System.Variants,
  crm_const,
  crm_types,
  IQMS.Common.PrincipalSourceTypes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  uniPanel,
  uniListBox,
  uniLabel,
  uniCheckBox,
  uniComboBox,
  uniBitBtn,
  uniSplitter,
  uniMainMenu,
  uniButton,
  uniGUIClasses,
  uniMultiItem,
  uniGUIBaseClasses,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication
    ;

type
  TListCargo = class
    SourceTable: String;
    SourceType: TPrincipalSourceType;
    ByContact: Boolean;
    constructor Create(ASourceTable: String; AByContact: Boolean);
  end;

type
  TFrmCRMSelPrinciple = class(TUniForm)
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    PnlClient: TUniPanel;
    Bevel3: TUniPanel;
    Bevel4: TUniPanel;
    lstCategory: TUniListBox;
    Panel2: TUniPanel;
    lblProductCategory: TuniLabel;
    PnlCheckboxes: TUniPanel;
    chkByContact: TUniCheckBox;
    PSelect: TUniPopupMenu;
    SelectFromPicklist1: TUniMenuItem;
    SelectOnlyPrincipleType1: TUniMenuItem;
    PnlButtons: TUniPanel;
    PnlProspectFilter: TUniPanel;
    lblProspectFilter: TuniLabel;
    cmbProspectFilter: TUniComboBox;
    Bevel1: TUniPanel;
    Panel3: TUniPanel;
    PnlByCategory: TUniPanel;
    Bevel2: TUniPanel;
    btnSelectCategory: TUniBitBtn;
    btnNoFiltering: TUniBitBtn;
    btnCancel: TUniBitBtn;
    Splitter1: TUniSplitter;
    Bevel5: TUniPanel;
    PnlSelect: TUniPanel;
    btnSelect: TUniBitBtn;
    chkFilterByEPlant: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoCategoryChange(Sender: TObject);
    procedure btnNoFilteringClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure SelectFromPicklist1Click(Sender: TObject);
    procedure SelectOnlyPrincipleType1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    // These are used for temporary storage, and applied only if the user clicks OK
    FSource: TPrincipalSourceType;
    FSourceID: Real;
    FContactID: Real;
    FProspectIndex: Integer;
    // used locally in TFDQuery objects for Customer vs. Prospect filtering
    FProspectType: TProspectType;
    FLoginName: String;
    FSourceDisplay: String;
    procedure StartUp;
    procedure BuildList;
    procedure ClearFilter;
    procedure SetButtons;
    procedure ShowCurrentGlobalSettings;
    procedure AdjustControlSizes;
    function ProcessExec(ARequirePicklist: Boolean): Boolean;
    procedure FindSource(ASource: String; AContact: Boolean);
    function getSourceID: Real;
    procedure setSourceID(const Value: Real);
  public
    { Public declarations }
    DM: TCRMPK_DM;
    // Global filtering constructors
    procedure CreateForm( ASource: TPrincipalSourceType;
                          ASourceID, AContactID: Real );

    property SourceID:Real read getSourceID write setSourceID;
  end;

function DoSelectPrinciple(var ASource: TPrincipalSourceType;
  var ASourceID: Real; var AContactID: Real;
  var ASourceDisplay: String): Boolean;

function SetGlobalFilter: Boolean;
function GetGlobalFilter( var ASource: TPrincipalSourceType;
  var ASourceID: Real; var AContactID: Real; var ASourceDisplay: String;
  AContactsOnly: Boolean = False): Boolean;

var
  FrmCRMSelPrinciple: TFrmCRMSelPrinciple;

implementation

{$R *.DFM}

uses
  crm_activity_dblib,
  crm_helpconst,
  crm_rscstr,
  // crmshare,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.PrincipalSource;

function DoSelectPrinciple(var ASource: TPrincipalSourceType;
  var ASourceID: Real; var AContactID: Real;
  var ASourceDisplay: String): Boolean;
var
  FrmCRMSelPrinciple: TFrmCRMSelPrinciple;

begin
  FrmCRMSelPrinciple := TFrmCRMSelPrinciple.Create(uniGUIApplication.UniApplication);
  with FrmCRMSelPrinciple do
  begin
    CreateForm(ASource,ASourceID,AContactID);

    PnlByCategory.Visible := False;
    PnlCheckboxes.Visible := False;

    if ShowModal = mrOk then
     begin
      ASource := FSource;
      ASourceID := SourceID;
      ASourceDisplay := FSourceDisplay;
      AContactID := FContactID;
      Result := True;
    end
    else Result := False;
  end;

end;

  function SetGlobalFilter: Boolean;
  var
    ASource: TPrincipalSourceType;
    ASourceID, AContactID: Real;
    FrmCRMSelPrinciple: TFrmCRMSelPrinciple;
  begin
    ASource := CRMContext.GlobalContext.Source;
    ASourceID := CRMContext.GlobalContext.SourceID;
    AContactID := CRMContext.GlobalContext.ContactID;

    FrmCRMSelPrinciple:= TFrmCRMSelPrinciple.Create(uniGUIApplication.UniApplication);
    with FrmCRMSelPrinciple do
    begin
        CreateForm(ASource,ASourceID,AContactID);
        PnlCheckboxes.Visible := True;
        if ShowModal = mrOk then
        begin
          CRMContext.GlobalContext.SetContext(FSource, FSourceID, FContactID,
            FProspectType, chkFilterByEPlant.Checked);
          Result := True;
        end
        else
          Result := False;
    end;
  end;

  function GetGlobalFilter( var ASource: TPrincipalSourceType; var ASourceID: Real;
    var AContactID: Real; var ASourceDisplay: String;
    AContactsOnly: Boolean = False): Boolean;
  var
    FrmCRMSelPrinciple : TFrmCRMSelPrinciple;
  begin
    FrmCRMSelPrinciple:= TFrmCRMSelPrinciple.Create(uniGUIApplication.UniApplication);
    with FrmCRMSelPrinciple do
    begin
       CreateForm( ASource, ASourceID, AContactID);
       PnlCheckboxes.Visible := False;
       if ShowModal = mrOk then
        begin
          ASource := FSource;
          ASourceID := FSourceID;
          ASourceDisplay := FSourceDisplay;
          AContactID := FContactID;
          Result := True;
        end
        else
          Result := False;
    end;
  end;

{$REGION 'TListCargo' }

  constructor TListCargo.Create(ASourceTable: String; AByContact: Boolean);
  begin
    SourceTable := ASourceTable;
    SourceType := CRMContext.SourceType(ASourceTable);
    ByContact := AByContact;
  end;

{$ENDREGION 'TListCargo' }
{$REGION 'TFrmCRMSelPrinciple' }


  procedure TFrmCRMSelPrinciple.FormShow(Sender: TObject);
  begin
    IQRegFormRead(Self, [Self, PnlButtons]); // IQMS.Common.RegFrm.pas
    AdjustControlSizes;
  end;

  function TFrmCRMSelPrinciple.getSourceID: Real;
begin
    result := FSourceID;
end;

procedure TFrmCRMSelPrinciple.FormClose(Sender: TObject;
    var Action: TCloseAction);
  begin
    IQRegFormWrite(Self, [Self, PnlButtons]); // IQMS.Common.RegFrm.pas
    Action := caFree;
  end;

  procedure TFrmCRMSelPrinciple.FormCreate(Sender: TObject);
begin
    DM := TCRMPK_DM.Create(self);
    DM.Name := '';
    StartUp;
end;

procedure TFrmCRMSelPrinciple.StartUp;
  begin
//    IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCheckboxes); // 06/14/2010
    BuildList; // builds combobox list
    lstCategory.ItemIndex := -1; // Default, constructors can set as needed
    SetButtons;
  end;

  procedure TFrmCRMSelPrinciple.BuildList;
  var
    i: Integer;
  begin
    try
      lstCategory.Items.BeginUpdate;
      lstCategory.Items.Clear;
      lstCategory.Items.AddObject(crm_rscstr.cTXT0000570 { 'Customers' } ,
        TListCargo.Create('ARCUSTO', False));
      lstCategory.Items.AddObject
        (crm_rscstr.cTXT0000131 { 'Customer Contacts' } ,
        TListCargo.Create('ARCUSTO', True));
      lstCategory.Items.AddObject(crm_rscstr.cTXT0000572 { 'Vendors' } ,
        TListCargo.Create('VENDOR', False));
      lstCategory.Items.AddObject(crm_rscstr.cTXT0000133 { 'Vendor Contacts' } ,
        TListCargo.Create('VENDOR', True));
      lstCategory.Items.AddObject(crm_rscstr.cTXT0000571 { 'Partners' } ,
        TListCargo.Create('PARTNER', False));
      lstCategory.Items.AddObject
        (crm_rscstr.cTXT0000132 { 'Partner Contacts' } ,
        TListCargo.Create('PARTNER', True));
      lstCategory.Items.AddObject(crm_rscstr.cTXT0000134 { 'Employees' } ,
        TListCargo.Create('PR_EMP', False));
    finally
      lstCategory.Items.EndUpdate;
    end;
  end;

  procedure TFrmCRMSelPrinciple.DoCategoryChange(Sender: TObject);
  begin
    // Clear the filter record; the user has changed it and we don't want mix ups.
    ClearFilter;

    // 03/20/2008 Don't bother resetting the combo box; it just irritates people.
    // Keep the prospect filter if this is for Customer type category;
    // otherwise reset it.
    // if not (lstCategory.ItemIndex in [0,1]) then
    // cmbProspectFilter.ItemIndex := 0;

    // Always reset the combo box index for Prospect
    IQMS.Common.Controls.IQEnableControl([lblProspectFilter, cmbProspectFilter],
      (lstCategory.ItemIndex in [0, 1]));

    // Set the controls
    SetButtons;
  end;

  procedure TFrmCRMSelPrinciple.SetButtons;
  var
    b: Boolean;
  begin
    b := (lstCategory.ItemIndex > -1) and
      (TListCargo(lstCategory.Items.Objects[lstCategory.ItemIndex]).SourceType
      in [srctCustomer, srctVendor, srctPartner]);
    IQMS.Common.Controls.IQEnableControl([chkByContact], b);

    if btnSelect.Visible then
      btnSelect.Enabled := (lstCategory.ItemIndex > -1);
    if btnSelectCategory.Visible then
      btnSelectCategory.Enabled := (lstCategory.ItemIndex > -1);
    if btnSelectCategory.Enabled then
    begin
      case TListCargo(lstCategory.Items.Objects[lstCategory.ItemIndex])
        .SourceType of
        srctCustomer:
          btnSelectCategory.Caption := crm_rscstr.cTXT0001674; // 'By Customers'
        srctVendor:
          btnSelectCategory.Caption := crm_rscstr.cTXT0001675; // 'By Vendors'
        srctPartner:
          btnSelectCategory.Caption := crm_rscstr.cTXT0001676; // 'By Partners'
        srctEmployee:
          btnSelectCategory.Caption := crm_rscstr.cTXT0001677; // 'By Employees'
      else
        btnSelectCategory.Caption := crm_rscstr.cTXT0001678; // 'By Category'
      end;
    end
    else
      btnSelectCategory.Caption := crm_rscstr.cTXT0001678; // 'By Category'

    cmbProspectFilter.Enabled := (lstCategory.ItemIndex in [0, 1]);
  end;

  procedure TFrmCRMSelPrinciple.setSourceID(const Value: Real);
begin
  FSourceID := Value;
end;

procedure TFrmCRMSelPrinciple.btnNoFilteringClick(Sender: TObject);
  begin
    ClearFilter;
  end;

  procedure TFrmCRMSelPrinciple.ShowCurrentGlobalSettings;
  begin
    lstCategory.ItemIndex := Ord(CRMContext.GlobalContext.Source);
    DoCategoryChange(NIL);
    cmbProspectFilter.ItemIndex := Ord(CRMContext.GlobalContext.Prospect);
    chkByContact.Checked := CRMContext.GlobalContext.ContactsPicklist;
    chkFilterByEPlant.Checked := CRMContext.GlobalContext.FilterByEPlant;
  end;

  procedure TFrmCRMSelPrinciple.Help1Click(Sender: TObject);
  begin
    IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM,
      IQMS.Common.HelpHook.iqhtmIQCRM);
    // IQMS.Common.HelpHook.pas
    IQHelp.HelpContext(Self.HelpContext);
  end;

  procedure TFrmCRMSelPrinciple.ClearFilter;
  begin
    FSource := srctNone;
    FSourceID := 0;
    FSourceDisplay := '';
    FContactID := 0;
    FProspectIndex := 0;
  end;



  procedure TFrmCRMSelPrinciple.CreateForm(ASource: TPrincipalSourceType;
                                           ASourceID, AContactID: Real);
  begin
        // Get the current display
        case CRMContext.SourceIndex(ASource) of
          1:
            lstCategory.ItemIndex := 0;
          2:
            lstCategory.ItemIndex := 2;
          3:
            lstCategory.ItemIndex := 4;
          4:
            lstCategory.ItemIndex := 6;
        else
          lstCategory.ItemIndex := 0;
        end;

        DoCategoryChange(NIL);

        // Save the current context values after the lstCategoryChange
        FSource := ASource;
        SourceID := ASourceID;
        FContactID := AContactID;

        // Apply current values to the screen
        FindSource(CRMContext.TableName(FSource), FContactID > 0);
        cmbProspectFilter.ItemIndex := Ord(CRMContext.GlobalContext.Prospect);
        chkByContact.Checked := CRMContext.GlobalContext.ContactsPicklist;
        chkFilterByEPlant.Checked := CRMContext.GlobalContext.FilterByEPlant;
  end;

function TFrmCRMSelPrinciple.ProcessExec(ARequirePicklist: Boolean): Boolean;
  var
    ATableName: String;
  begin
    ClearFilter;
    if (lstCategory.ItemIndex in [0, 1]) then
    begin
      FProspectIndex := cmbProspectFilter.ItemIndex;
      FProspectType := CRMContext.ProspectType(FProspectIndex);
    end;
    DM.CRMProspect := FProspectType;
    FSource := TListCargo(lstCategory.Items.Objects[lstCategory.ItemIndex])
      .SourceType;
    ATableName := TListCargo(lstCategory.Items.Objects[lstCategory.ItemIndex])
      .SourceTable;

    Result := True;

    if ARequirePicklist then
    begin
      case lstCategory.ItemIndex of
        0:
          Result := DM.DoCustomerContextPicklist(FProspectType, FSourceID);
        // Customers
        1:
          Result := DM.PromptForContact(srctCustomer, FProspectType, FSourceID,
            FContactID); // Customer Contacts
        2:
          Result := DM.DoVendorContextPicklist(FSourceID); // Vendors
        3:
          Result := DM.PromptForContact(srctVendor, FProspectType, FSourceID,
            FContactID); // Vendor Contacts
        4:
          Result := DM.DoPartnerContextPicklist(FSourceID); // Partners
        5:
          Result := DM.PromptForContact(srctPartner, FProspectType, FSourceID,
            FContactID); // Partner Contacts
        6:
          Result := DM.DoEmployeeContextPicklist(FSourceID); // Employees
      end;

      if not Result or ((lstCategory.ItemIndex <= 0) and (FSourceID = 0)) then
      begin
        ClearFilter;
        ModalResult := mrCancel;
      end
      else
        FSourceDisplay := IQMS.Common.PrincipalSource.GetShortDisplay
          (ATableName, FSourceID, FContactID);
    end;

    // Set the option
    if Result and PnlCheckboxes.Visible then
    begin
      CRMContext.GlobalContext.ContactsPicklist := chkByContact.Checked;
      CRMContext.GlobalContext.FilterByEPlant := chkFilterByEPlant.Checked;
    end;

  end;

  procedure TFrmCRMSelPrinciple.AdjustControlSizes;
  var
    L: Integer;
  begin
    L := lblProspectFilter.Left + lblProspectFilter.Width + 12;
    cmbProspectFilter.Left := L;
    cmbProspectFilter.Width := PnlProspectFilter.ClientWidth -
      cmbProspectFilter.Left;
  end;

  procedure TFrmCRMSelPrinciple.FindSource(ASource: String; AContact: Boolean);
  var
    i: Integer;
  begin
    for i := 0 to lstCategory.Count - 1 do
    begin
      if (TListCargo(lstCategory.Items.Objects[i]).SourceTable = ASource) and
        (TListCargo(lstCategory.Items.Objects[i]).ByContact = AContact) then
      begin
        lstCategory.ItemIndex := i;
        BREAK;
      end;
    end;
  end;

  procedure TFrmCRMSelPrinciple.SelectFromPicklist1Click(Sender: TObject);
  begin
    if ProcessExec(True) then
      ModalResult := mrOk;
  end;

  procedure TFrmCRMSelPrinciple.SelectOnlyPrincipleType1Click(Sender: TObject);
  begin
    if ProcessExec(False) then
      ModalResult := mrOk;
  end;

{$ENDREGION 'TFrmCRMSelPrinciple' }

end.
