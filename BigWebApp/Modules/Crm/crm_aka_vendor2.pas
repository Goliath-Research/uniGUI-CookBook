unit crm_aka_vendor2;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  IQMS.WebVcl.SecurityRegister,
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
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl, uniComboBox, uniDBComboBox, Vcl.ComCtrls, IQUniGrid,
  uniGUIFrame;

type
  { TLVCargo }
  TLVCargo = class
    ID: Real;
    Caption: string;
    constructor Create(AID: Real; ACaption: string);
  end;

type
  { TFrmCRMEditVendorAkaAll }
  TFrmCRMEditVendorAkaAll = class(TUniForm)
    PnlCarrier: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    View1: TUniMenuItem;
    Refresh1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Bevel1: TUniPanel;
    SrcVendor: TDataSource;
    QryVendor: TFDQuery;
    StatusBar: TUniStatusBar;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    pcMain: TUniPageControl;
    TabAKAAssignment: TUniTabSheet;
    TabVendors: TUniTabSheet;
    PnlAKAList: TUniPanel;
    GridAvailableArinvt: TIQUniGridControl;
    Panel1: TUniPanel;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Panel15: TUniPanel;
    PnlSelectedAKA: TUniPanel;
    Bevel3: TUniPanel;
    Panel3: TUniPanel;
    Panel11: TUniPanel;
    sbtnAddArinvtToAka: TUniSpeedButton;
    sbtnAddAllArinvtToAka: TUniSpeedButton;
    sbtnRemoveAka: TUniSpeedButton;
    sbtnRemoveAllAka: TUniSpeedButton;
    lvSelectedAKA: TListView;
    Panel16: TUniPanel;
    Panel17: TUniPanel;
    Label2: TUniLabel;
    Panel4: TUniPanel;
    PnlSelectedToolbuttons: TUniPanel;
    sbtnSaveList: TUniSpeedButton;
    Splitter1: TUniSplitter;
    PnlArcustoList: TUniPanel;
    Panel7: TUniPanel;
    Panel8: TUniPanel;
    Label3: TUniLabel;
    Panel9: TUniPanel;
    PnlSelectedCustomers: TUniPanel;
    Bevel2: TUniPanel;
    Panel12: TUniPanel;
    Panel13: TUniPanel;
    sbtnAddToAka: TUniSpeedButton;
    sbtnAddAllToAka: TUniSpeedButton;
    sbtnRemove: TUniSpeedButton;
    sbtnRemoveAll: TUniSpeedButton;
    Panel14: TUniPanel;
    Panel18: TUniPanel;
    lblSelectedCaption: TUniLabel;
    lblVendorCompany: TUniLabel;
    Panel19: TUniPanel;
    Panel20: TUniPanel;
    Splitter2: TUniSplitter;
    GridVendors: TIQUniGridControl;
    lvSelectedVendor: TListView;
    sbtnCancel: TUniSpeedButton;
    lblFilterByClass: TUniLabel;
    QryClassLookup: TFDQuery;
    QryClassLookupCLASS: TStringField;
    cmbClassFilter: TUniDBLookupComboBox;
    sbtnVendorAKA1: TUniSpeedButton;
    PSelCust: TUniPopupMenu;
    EditVendorAKA1: TUniMenuItem;
    PVendor: TUniPopupMenu;
    EditVendorAKA2: TUniMenuItem;
    sbtnVendorAKA2: TUniSpeedButton;
    JumpToVendor1: TUniMenuItem;
    JumpToVendorCentral1: TUniMenuItem;
    JVendor: TIQWebJump;
    SR: TIQWebSecurityRegister;
    PArinvt: TUniPopupMenu;
    JumptoInventory1: TUniMenuItem;
    JInventory: TIQWebJump;
    lblVendorCompanyAKA: TUniLabel;
    lblDash2: TUniLabel;
    lblDash1: TUniLabel;
    Contents1: TUniMenuItem;
    QryVendorID: TBCDField;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    procedure Refresh1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnAddToAkaClick(Sender: TObject);
    procedure sbtnAddAllToAkaClick(Sender: TObject);
    procedure sbtnRemoveClick(Sender: TObject);
    procedure sbtnRemoveAllClick(Sender: TObject);
    procedure sbtnAddArinvtToAkaClick(Sender: TObject);
    procedure sbtnAddAllArinvtToAkaClick(Sender: TObject);
    procedure sbtnRemoveAkaClick(Sender: TObject);
    procedure sbtnRemoveAllAkaClick(Sender: TObject);
    procedure sbtnSaveListClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtnCancelClick(Sender: TObject);
    procedure cmbClassFilterChange(Sender: TObject);
    procedure sbtnVendorAKA1Click(Sender: TObject);
    procedure EditVendorAKA1Click(Sender: TObject);
    procedure lvSelectedVendorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvSelectedAKAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditVendorAKA2Click(Sender: TObject);
    procedure JumpToVendor1Click(Sender: TObject);
    procedure JumpToVendorCentral1Click(Sender: TObject);
    procedure PSelCustPopup(Sender: TObject);
    procedure PVendorPopup(Sender: TObject);
    procedure lvSelectedVendorClick(Sender: TObject);
    procedure SrcVendorDataChange(Sender: TObject; Field: TField);
    procedure TabAKAAssignmentShow(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
  private
    { Private declarations }
    FCancel: Boolean;
    FModified: Boolean;
    procedure SetStatus(S: string; APanel: Integer);
    procedure SetButtons;
    procedure SetCaptions;

    // Adds item from the Available DBGrid, to the Selected TListView
    procedure AddToSelectedVendorList(AVendorID: Real);
    // Is an item in the list?
    function VendorItemAlreadyInList(AVendorID: Real): Boolean;
    // Clears the Arcusto list
    procedure ClearSelectedVendorList;

    // Adds item from the Available DBGrid, to the Selected TListView
    procedure AddToSelectedAKAList(AArinvtID: Real);
    // Removes an item from the Selected TListView
    procedure RemoveItem(AItem: TListItem);
    // Is an item in the list?
    function AKAItemAlreadyInList(AArinvtID: Real): Boolean;
    // Clears the AKA list
    procedure ClearSelectedAKAList;

    // Save to Customer AKA
    procedure ApplyAKA;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AVendorID: Real);
  end;

procedure DoEditAllVendorAKA(AOwner: TComponent; AVendorID: Real);

var
  FrmCRMEditVendorAkaAll: TFrmCRMEditVendorAkaAll;

implementation

{$R *.DFM}


uses
  crm_aka_vendor_shr,
  crm_aka_vendor1,
  crm_rscstr,
  crm_vendorcentral,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;

procedure DoEditAllVendorAKA(AOwner: TComponent; AVendorID: Real);
begin
  TFrmCRMEditVendorAkaAll.Create(AOwner, AVendorID).Show;
end;

{$REGION 'TLVCargo' }


constructor TLVCargo.Create(AID: Real; ACaption: string);
begin
  ID := AID;
  Caption := ACaption;
end;

{$ENDREGION 'TLVCargo' }

{$REGION 'TFrmCRMEditCustomerAkaAll' }


procedure TFrmCRMEditVendorAkaAll.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

constructor TFrmCRMEditVendorAkaAll.Create(AOwner: TComponent; AVendorID: Real);
var
  hMsg: TPanelMesg;
begin
  hMsg := nil;
  inherited Create(AOwner);

  hMsg := hPleaseWait('');
  try
    QryVendor.Open;
    // QryArinvt.Open;   // open this only when we show the tab
    QryClassLookup.Open;
    if AVendorID > 0 then
      QryVendor.Locate('ID', AVendorID, []);
  finally
    if (hMsg <> nil) and Assigned(hMsg) then
      hMsg.Free;
  end;
end;

procedure TFrmCRMEditVendorAkaAll.FormCreate(Sender: TObject);
var
  S: string;
begin
  IQRegStringScalarRead(Self, crm_rscstr.cTXT0000263 { 'Class Filter' } , S);
  if S > '' then
    begin
      cmbClassFilter.Text := S;
      cmbClassFilter.PerformSearch;
    end
  else
    cmbClassFilter.Text := crm_rscstr.cTXT0000262; // ' <Not filtered> '

  CenterForm(Self); // iqctrl; must be called before IQRegFormRead()
  pcMain.ActivePageIndex := 0;
end;

procedure TFrmCRMEditVendorAkaAll.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, PnlAKAList, PnlArcustoList]); // IQMS.Common.RegFrm.pas
  FModified := False;
end;

procedure TFrmCRMEditVendorAkaAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlAKAList, PnlArcustoList]); // IQMS.Common.RegFrm.pas
  Action := caFree;
end;

procedure TFrmCRMEditVendorAkaAll.FormResize(Sender: TObject);
begin
  if not Showing then
    Exit;

  if (PnlArcustoList.ClientWidth < Round(TabVendors.ClientWidth / 4)) or
    (PnlArcustoList.ClientWidth > TabVendors.ClientWidth) or
    (PnlSelectedCustomers.ClientWidth < Round(TabVendors.ClientWidth / 4)) or
    (PnlSelectedCustomers.ClientWidth > TabVendors.ClientWidth) then
    PnlArcustoList.Width := Round(TabVendors.ClientWidth / 2);

  if (PnlAKAList.ClientWidth < Round(TabAKAAssignment.ClientWidth / 4)) or
    (PnlAKAList.ClientWidth > TabAKAAssignment.ClientWidth) or
    (PnlSelectedAKA.ClientWidth < Round(TabAKAAssignment.ClientWidth / 4)) or
    (PnlSelectedAKA.ClientWidth > TabAKAAssignment.ClientWidth) then
    PnlAKAList.Width := Round(TabAKAAssignment.ClientWidth / 2);
  Update;
end;

procedure TFrmCRMEditVendorAkaAll.Refresh1Click(Sender: TObject);
begin
  RefreshDataSetByID_ExA(QryVendor); // iqlib
  RefreshDataSetByID_ExA(QryArinvt); // iqlib
end;

procedure TFrmCRMEditVendorAkaAll.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMEditVendorAkaAll.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCRMEditVendorAkaAll.AddToSelectedAKAList(AArinvtID: Real);
var
  AItemno, ADescrip, AClass, ARev: string;
begin
  if not AKAItemAlreadyInList(AArinvtID) then
    with lvSelectedAKA.Items.Add do
      begin
        with TFDQuery.Create(nil) do
          try
            Connection := MainModule.FDConnection;
            SQL.Add('select itemno, descrip, class, rev from arinvt');
            SQL.Add(IQFormat('where id = %.0f', [AArinvtID]));
            Open;
            AItemno := FieldByName('ITEMNO').AsString;
            ADescrip := FieldByName('DESCRIP').AsString;
            AClass := FieldByName('CLASS').AsString;
            ARev := FieldByName('REV').AsString;
          finally
            Free;
          end;

        Data := TLVCargo.Create(AArinvtID, AItemno);
        Caption := AItemno;
        Subitems.Add(ADescrip);
        Subitems.Add(AClass);
        Subitems.Add(ARev);
      end;
end;

procedure TFrmCRMEditVendorAkaAll.ClearSelectedAKAList;
var
  i: Integer;
begin
  for i := 0 to lvSelectedAKA.Items.Count - 1 do
    TLVCargo(lvSelectedAKA.Items[i].Data).Free;
  lvSelectedAKA.Items.Clear;
end;

function TFrmCRMEditVendorAkaAll.AKAItemAlreadyInList(AArinvtID: Real): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to lvSelectedAKA.Items.Count - 1 do
    begin
      Result := TLVCargo(lvSelectedAKA.Items[i].Data).ID = AArinvtID;
      if Result then
        Break;
    end;
  SetStatus('', 0);
end;

procedure TFrmCRMEditVendorAkaAll.RemoveItem(AItem: TListItem);
begin
  if AItem.Data <> nil then
    TLVCargo(AItem.Data).Free;
  AItem.Delete;
end;

{ --  ApplyAKA -- }
procedure TFrmCRMEditVendorAkaAll.ApplyAKA;
var
  i, j: Integer;
  AVendorID: Real;
  hMsg: TPanelMesg;
begin
  { cTXT0001804 = 'All selected Inventory items will be applied to all ' +
    'selected vendors.'#13#13 + 'Do you want to continue?' }
  if not IQConfirmYN(crm_rscstr.cTXT0001804) then
    Exit;

  { crm_rscstr.cTXT0001800 =
    'This action will affect multiple vendors.'#13#13 +
    'Are you sure you want to continue?' }
  if not IQConfirmYNChk(crm_rscstr.cTXT0001800,
    'CRM AKA Add Inv All Vendors') then
    Exit; // iqmesg

  sbtnCancel.Enabled := True;
  sbtnSaveList.Enabled := False;
  hMsg := hPleaseWait(crm_rscstr.cTXT0000278 { 'Adding items.' } );
  try
    for i := 0 to lvSelectedVendor.Items.Count - 1 do
      begin
        if FCancel then
          Break;
        // Get the Company information
        AVendorID := TLVCargo(lvSelectedVendor.Items[i].Data).ID;
        hMsg.Mesg :=
          Format(crm_rscstr.cTXT0000279 { 'Adding AKA items to %s' } ,
          [TLVCargo(lvSelectedVendor.Items[i].Data).Caption]);
        SetStatus(TLVCargo(lvSelectedVendor.Items[i].Data).Caption, 0);
        // Add the AKA items to the Vendor
        for j := 0 to lvSelectedAKA.Items.Count - 1 do
          begin
            if FCancel then
              begin
                Break;
                Exit;
              end;
            AddToAka(TLVCargo(lvSelectedAKA.Items[j].Data).ID, AVendorID);
          end;
      end;
    Application.ProcessMessages;
  finally
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
    sbtnCancel.Enabled := False;
    sbtnSaveList.Enabled := True;
    Update;
  end;
  SetStatus('', 0);
  // crm_rscstr.cTXT0000092 = 'Process completed.'
  IQInformation(crm_rscstr.cTXT0000092);
end;

procedure TFrmCRMEditVendorAkaAll.SetButtons;
begin
  sbtnSaveList.Enabled := FModified and (lvSelectedAKA.Items.Count > 0) and
    SR.Enabled['sbtnSaveList'];
  sbtnVendorAKA1.Enabled := (QryVendorID.AsFloat > 0) and
    SR.Enabled['sbtnVendorAKA1'];
  sbtnVendorAKA2.Enabled := (lvSelectedVendor.Selected <> nil) and
    SR.Enabled['sbtnVendorAKA2'];
  SetCaptions;
end;

procedure TFrmCRMEditVendorAkaAll.SetCaptions;
var
  ACaption: string;
begin
  // Selected Customer Caption
  if lvSelectedVendor.Items.Count = 0 then
    // crm_rscstr.cTXT0001801 = '<No Vendor Selected>';
    ACaption := crm_rscstr.cTXT0001801
  else if lvSelectedVendor.Items.Count = 1 then
    ACaption := lvSelectedVendor.Items[0].Caption
    // crm_rscstr.cTXT0001802 = 'Multiple Customers Selected'
  else
    ACaption := crm_rscstr.cTXT0001802;

  lblVendorCompany.Caption := ACaption;
  lblVendorCompanyAKA.Caption := ACaption;
end;

procedure TFrmCRMEditVendorAkaAll.SetStatus(S: string; APanel: Integer);
begin
  StatusBar.Panels[APanel].Text := S;
  StatusBar.Update;
end;

procedure TFrmCRMEditVendorAkaAll.AddToSelectedVendorList(AVendorID: Real);
var
  ACustno, ACompany: string;
begin
  if not VendorItemAlreadyInList(AVendorID) then
    with lvSelectedVendor.Items.Add do
      begin
        with TFDQuery.Create(nil) do
          try
            Connection := MainModule.FDConnection;
            SQL.Add('SELECT vendorno, company FROM vendor');
            SQL.Add(IQFormat('WHERE id = %.0f', [AVendorID]));
            Open;
            ACustno := FieldByName('VENDORNO').AsString;
            ACompany := FieldByName('COMPANY').AsString;
          finally
            Free;
          end;

        Data := TLVCargo.Create(AVendorID, ACompany);
        Caption := ACompany;
        Subitems.Add(ACustno);
      end;
end;

function TFrmCRMEditVendorAkaAll.VendorItemAlreadyInList
  (AVendorID: Real): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to lvSelectedVendor.Items.Count - 1 do
    begin
      Result := TLVCargo(lvSelectedVendor.Items[i].Data).ID = AVendorID;
      if Result then
        Break;
    end;
  SetStatus('', 0);
end;

procedure TFrmCRMEditVendorAkaAll.ClearSelectedVendorList;
begin
  IQMS.Common.Controls.ClearListViewOfObjects(lvSelectedVendor);
  FModified := False;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnAddToAkaClick(Sender: TObject);
var
  AOriginalID: Real;
  i: Integer;
begin
  if GridVendors.wwDBGrid.SelectedList.Count > 1 then
    begin
      AOriginalID := QryVendorID.AsFloat;
      with GridVendors.wwDBGrid, GridVendors.wwDBGrid.DataSource.DataSet do
        try
          SetStatus(crm_rscstr.cTXT0000265 { 'Adding multiple items...' } , 0);
          DisableControls;
          // Cycle selected rows and update the dataset according to the corresponding ID
          for i := 0 to SelectedList.Count - 1 do
            begin
              GotoBookmark(SelectedList.Items[i]);
              Freebookmark(SelectedList.Items[i]);
              AddToSelectedVendorList(FieldByName('ID').AsFloat);
            end;
          SelectedList.Clear;
          Close;
          Open;
          // Get the original selected record
          Locate('ID', AOriginalID, []);
        finally
          SetStatus('', 0);
          EnableControls;
          lvSelectedVendor.Update;
        end;
    end
  else
    begin
      AddToSelectedVendorList(QryVendorID.AsFloat);
      lvSelectedVendor.Update;
    end;
  FModified := True;
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnAddAllToAkaClick(Sender: TObject);
begin
  FCancel := False;
  { crm_rscstr.cTXT0001805 =
    'Add all vendors to the list?'#13#13'This could ' +
    'take a few minutes.' }
  if IQConfirmYN(crm_rscstr.cTXT0001805) then
    begin
      QryVendor.First;
      while not QryVendor.EOF and not FCancel do
        begin
          AddToSelectedVendorList(QryVendorID.AsFloat);
          QryVendor.Next;
        end;
      // crm_rscstr.cTXT0000270 = 'Operation cancelled.'
      if FCancel then
        IQInformation(crm_rscstr.cTXT0000270);
    end;
  SetStatus('', 0);
  FModified := True;
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnRemoveClick(Sender: TObject);
var
  i: Integer;
begin
  if lvSelectedVendor.Selected <> nil then
    begin
      if lvSelectedVendor.SelCount > 1 then
        begin
          for i := lvSelectedVendor.Items.Count - 1 downto 0 do
            if lvSelectedVendor.Items[i].Selected then
              lvSelectedVendor.Items[i].Delete;
        end
      else
        RemoveItem(lvSelectedVendor.Selected);
      lvSelectedVendor.Update;
    end;
  SetStatus('', 0);
  FModified := True;
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnRemoveAllClick(Sender: TObject);
begin
  // crm_rscstr.cTXT0001806 = 'Remove all vendors from the list?'
  if IQConfirmYN(crm_rscstr.cTXT0001806) then
    ClearSelectedVendorList;
  FModified := True;
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnAddArinvtToAkaClick(Sender: TObject);
var
  AOriginalID: Real;
  i: Integer;
begin
  if GridAvailableArinvt.wwDBGrid.SelectedList.Count > 1 then
    begin
      AOriginalID := QryArinvtID.AsFloat;
      with GridAvailableArinvt.wwDBGrid,
        GridAvailableArinvt.wwDBGrid.DataSource.DataSet do
        try
          SetStatus(crm_rscstr.cTXT0000265 { 'Adding multiple items...' } , 0);
          DisableControls;
          // Cycle selected rows and update the dataset according to the corresponding ID
          for i := 0 to SelectedList.Count - 1 do
            begin
              GotoBookmark(SelectedList.Items[i]);
              Freebookmark(SelectedList.Items[i]);
              AddToSelectedAKAList(FieldByName('ID').AsFloat);
            end;
          SelectedList.Clear;
          Close;
          Open;
          // Get the original selected record
          Locate('ID', AOriginalID, []);
          FModified := True;
        finally
          SetStatus('', 0);
          EnableControls;
          lvSelectedAKA.Update;
        end;
    end
  else
    begin
      AddToSelectedAKAList(QryArinvtID.AsFloat);
      lvSelectedAKA.Update;
    end;

  FModified := True;
  SetButtons;

end;

procedure TFrmCRMEditVendorAkaAll.sbtnAddAllArinvtToAkaClick(Sender: TObject);
begin
  FCancel := False;
  { crm_rscstr.cTXT0001803 =
    'Add all of Master Inventory to this vendor''s AKA ' +
    'list?'#13#13 + 'This could take a few minutes.' }
  if IQConfirmYN(crm_rscstr.cTXT0001803) then
    with QryArinvt do
      begin
        First;
        while not EOF and (FCancel <> True) do
          begin
            AddToSelectedAKAList(FieldByName('ID').AsFloat);
            Next;
          end;
        // crm_rscstr.cTXT0000270 = 'Operation cancelled.'
        if FCancel then
          IQInformation(crm_rscstr.cTXT0000270);
      end;
  FModified := True;
  SetStatus('', 0);
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnRemoveAkaClick(Sender: TObject);
var
  i: Integer;
begin
  if lvSelectedAKA.Selected <> nil then
    begin
      if lvSelectedAKA.SelCount > 1 then
        begin
          for i := lvSelectedAKA.Items.Count - 1 downto 0 do
            if lvSelectedAKA.Items[i].Selected then
              lvSelectedAKA.Items[i].Delete;
        end
      else
        RemoveItem(lvSelectedAKA.Selected);
      lvSelectedAKA.Update;
    end;
  FModified := True;
  SetStatus('', 0);
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnRemoveAllAkaClick(Sender: TObject);
begin
  // crm_rscstr.cTXT0000268 = 'Remove all items from the list?'
  if IQConfirmYN(crm_rscstr.cTXT0000268) then
    ClearSelectedAKAList;
  FModified := True;
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnSaveListClick(Sender: TObject);
begin
  ApplyAKA;
  FModified := False;
end;

procedure TFrmCRMEditVendorAkaAll.StatusBarResize(Sender: TObject);
begin
  if not Showing then
    Exit;
  StatusBar.Panels[0].Width := StatusBar.ClientWidth -
    (StatusBar.Panels[1].Width + StatusBar.Panels[2].Width);
  StatusBar.Update;
end;

procedure TFrmCRMEditVendorAkaAll.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FCancel := (Key = VK_CANCEL);
end;

procedure TFrmCRMEditVendorAkaAll.sbtnCancelClick(Sender: TObject);
begin
  FCancel := True;
end;

procedure TFrmCRMEditVendorAkaAll.cmbClassFilterChange(Sender: TObject);
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
    with QryArinvt do
      try
        Application.ProcessMessages;
        DisableControls;
        // 'Refreshing Master Inventory list.  Please wait.'
        hMsg := hPleaseWait(crm_rscstr.cTXT0000273);
        try
          Close;
          Filter := '';
          IQAssignEPlantFilter(QryArinvt);
          Filtered := Filter > '';
          ATestStr := Filter;
          IQRegStringScalarWrite(Self, 'Class Filter', '');
          Open;
        finally
          if (hMsg <> nil) and Assigned(hMsg) then
            hMsg.Free;
        end;
      finally
        if (hMsg <> nil) and Assigned(hMsg) then
          hMsg.Free;
        EnableControls;
        Update;
      end
  else
    with QryArinvt do
      try
        Application.ProcessMessages;
        DisableControls;
        // crm_rscstr.cTXT0000274 =
        // 'Filtering by Class, %s.  Please wait.'
        hMsg := hPleaseWait(Format(crm_rscstr.cTXT0000274, [AClass]));
        try
          Close;
          Filter := '';
          IQAssignEPlantFilter(QryArinvt);
          if Filter > '' then
            Filter := IQFormat('%s AND ( CLASS=''%s'' AND CLASS IS NOT NULL )',
              [Filter, AClass])
          else
            Filter := Format('CLASS=''%s'' AND CLASS IS NOT NULL', [AClass]);
          ATestStr := Filter;
          Filtered := True;
          IQRegStringScalarWrite(Self, 'Class Filter', AClass);
          Open;
        finally
          if Assigned(hMsg) then
            FreeAndNil(hMsg);
        end;
      finally
        EnableControls;
        Update;
      end;
end;

procedure TFrmCRMEditVendorAkaAll.sbtnVendorAKA1Click(Sender: TObject);
begin
  crm_aka_vendor1.DoEditVendorAKA(Self, QryVendorID.AsFloat);
end;

procedure TFrmCRMEditVendorAkaAll.EditVendorAKA1Click(Sender: TObject);
begin
  if lvSelectedVendor.Selected <> nil then
    crm_aka_vendor1.DoEditVendorAKA(Self,
      TLVCargo(lvSelectedVendor.Selected.Data).ID);
end;

procedure TFrmCRMEditVendorAkaAll.EditVendorAKA2Click(Sender: TObject);
begin
  if QryVendorID.AsFloat > 0 then
    crm_aka_vendor1.DoEditVendorAKA(Self, QryVendorID.AsFloat);
end;

procedure TFrmCRMEditVendorAkaAll.lvSelectedVendorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FCancel := (Key = VK_CANCEL);
  if Key = VK_DELETE then
    sbtnRemoveClick(nil);
end;

procedure TFrmCRMEditVendorAkaAll.lvSelectedAKAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  FCancel := (Key = VK_CANCEL);
  if Key = VK_DELETE then
    sbtnRemoveAkaClick(nil);
end;

procedure TFrmCRMEditVendorAkaAll.JumpToVendor1Click(Sender: TObject);
begin
  if QryVendorID.AsLargeInt > 0 then
    JVendor.Execute;
end;

procedure TFrmCRMEditVendorAkaAll.JumpToVendorCentral1Click(Sender: TObject);
begin
  if QryVendorID.AsFloat > 0 then
    DoVendorCentral(Self, QryVendorID.AsFloat);
end;

procedure TFrmCRMEditVendorAkaAll.PSelCustPopup(Sender: TObject);
var
  AEnabled: Boolean;
begin
  AEnabled := lvSelectedVendor.Selected <> nil;
  EditVendorAKA1.Enabled := SR.Enabled['EditVendorAKA1'] and AEnabled;
end;

procedure TFrmCRMEditVendorAkaAll.PVendorPopup(Sender: TObject);
var
  AEnabled: Boolean;
begin
  AEnabled := QryVendorID.AsFloat > 0;
  EditVendorAKA2.Enabled := SR.Enabled['EditVendorAKA2'] and AEnabled;
  JumpToVendor1.Enabled := SR.Enabled['JumpToVendor1'] and AEnabled;
  JumpToVendorCentral1.Enabled := SR.Enabled['JumpToVendorCentral1']
    and AEnabled;
end;

procedure TFrmCRMEditVendorAkaAll.lvSelectedVendorClick(Sender: TObject);
begin
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.SrcVendorDataChange(Sender: TObject;
  Field: TField);
begin
  SetButtons;
end;

procedure TFrmCRMEditVendorAkaAll.TabAKAAssignmentShow(Sender: TObject);
begin
  if not QryArinvt.Active then
    try
      GridAvailableArinvt.Visible := False;
      Update;
      Application.ProcessMessages;
      cmbClassFilterChange(nil);
    finally
      GridAvailableArinvt.Visible := True;
    end;
end;

procedure TFrmCRMEditVendorAkaAll.JumptoInventory1Click(Sender: TObject);
begin
  if QryArinvtID.AsLargeInt > 0 then
    JInventory.Execute;
end;

{$ENDREGION 'TFrmCRMEditCustomerAkaAll' }

end.
