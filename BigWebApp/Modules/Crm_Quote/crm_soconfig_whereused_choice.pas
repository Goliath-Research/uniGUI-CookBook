unit crm_soconfig_whereused_choice;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCRMSalesChoiceWhereUsed = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlToolbar: TUniPanel;
    PnlMain: TUniPanel;
    sbtnModify: TUniSpeedButton;
    Grid: TIQUniGridControl;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataTEMPLATE_DESCRIP: TStringField;
    QryDataTEMPLATE_ITEM_TYPE: TStringField;
    QryDataSALES_OPTION_DESCRIP: TStringField;
    QryDataCODE: TStringField;
    QryDataDESCRIP: TStringField;
    QryDataPRICE: TFMTBCDField;
    QryDataCHOICE_ITEM_TYPE: TStringField;
    QryDataCHOICE_GL_ACCT: TStringField;
    QryDataCHOICE_GL_ACCT_DESCRIP: TStringField;
    QryDataMARKUP: TFMTBCDField;
    QryDataMARKUP_TYPE: TBCDField;
    QryDataID: TBCDField;
    PMain: TUniPopupMenu;
    JumptoTemplate1: TUniMenuItem;
    Replace1: TUniMenuItem;
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure sbtnModifyClick(Sender: TObject);
    procedure SrcDataDataChange(Sender: TObject; Field: TField);
    procedure JumptoTemplate1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSalesChoiceID: Real;
    procedure SetCaption;
    procedure SetControls;
    function GetChoiceInfo(ASalesChoiceID: Real; var ACode,
      ADescrip: string): Boolean;
    function SelectedID: Real;
    procedure SetSalesChoiceID(const Value: Real);

  public
    { Public declarations }
    property SalesChoiceID: Real write SetSalesChoiceID;
  end;

function DoCRMSalesConfigChoiceWhereUsed(
  ASalesChoiceID: Real; var ASelectedChoiceID: Real): Boolean;



implementation

{$R *.dfm}


uses
  crm_rscstr,
  crm_soconfig_choice_replace,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

function DoCRMSalesConfigChoiceWhereUsed(
  ASalesChoiceID: Real; var ASelectedChoiceID: Real): Boolean;
var
  FrmCRMSalesChoiceWhereUsed: TFrmCRMSalesChoiceWhereUsed;
begin
  FrmCRMSalesChoiceWhereUsed := TFrmCRMSalesChoiceWhereUsed.Create(uniGUIApplication.UniApplication);
  with FrmCRMSalesChoiceWhereUsed do
  begin
    try
      FSalesChoiceID := ASalesChoiceID;
      Result := ShowModal = mrOk;
      if Result then
        ASelectedChoiceID := SelectedID;
    finally
      //Release;
    end;
  end;
end;

{ TFrmCRMSalesChoiceWhereUsed }

procedure TFrmCRMSalesChoiceWhereUsed.UniFormCreate(Sender: TObject);
begin
  SetCaption;
end;

procedure TFrmCRMSalesChoiceWhereUsed.FormShow(Sender: TObject);
begin
  ReOpen(QryData);
  SetControls;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMSalesChoiceWhereUsed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmCRMSalesChoiceWhereUsed.SetCaption;
var
  ACode, ADescrip, AComma: string;
begin
  if GetChoiceInfo(FSalesChoiceID, ACode, ADescrip) then
  begin
    AComma := IQMS.Common.Numbers.sIIf((Trim(ACode) > '') and
      (Trim(ADescrip) > ''), ', ', '');
    // crm_rscstr.cTXT0001970 = 'Where Used - %s%s%s';
    Self.Caption := Format(crm_rscstr.cTXT0001970, [ACode, AComma, ADescrip]);
  end;
end;

function TFrmCRMSalesChoiceWhereUsed.GetChoiceInfo(ASalesChoiceID: Real;
  var ACode: string; var ADescrip: string): Boolean;
var
  AData: Variant;
begin
  ACode := '';
  ADescrip := '';
  AData := SelectValueArrayFmt(
    'SELECT code, descrip'#13 +
    '  FROM sales_choice'#13 +
    ' WHERE id = %.0f',
    [ASalesChoiceID]);
  if (System.Variants.VarArrayDimCount(AData) <> 0) then
  begin
    ACode := AData[0];
    ADescrip := AData[1];
    Result := True;
  end
  else
    Result := False;
end;

procedure TFrmCRMSalesChoiceWhereUsed.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FSalesChoiceID);
  EnsureThousandSeparatorAssigned(DataSet);
end;

procedure TFrmCRMSalesChoiceWhereUsed.sbtnModifyClick(Sender: TObject);
var
  i: Integer;
  ASalesChoiceID: Real;
  APrice: Real;
  AChangeChoiceID: Boolean;
  AChangePrice: Boolean;
  ANewCode, ANewDescrip: string;
  AData: Variant;

  procedure _UpdateChoiceID(const AID: Real);
  begin
    ExecuteCommandParam(
      'UPDATE sales_option_choice'#13 +
      '   SET sales_choice_id = :SALES_CHOICE_ID, '#13 +
      '       code = :CODE, '#13 +
      '       descrip = :DESCRIP '#13 +
      ' WHERE id = :ID',
      ['SALES_CHOICE_ID;F', 'CODE;S', 'DESCRIP;S', 'ID;F'],
      [ASalesChoiceID, ANewCode, ANewDescrip, AID]);
  end;

  procedure _UpdatePrice(const AID: Real);
  begin
    ExecuteCommandFmt(
      'UPDATE sales_option_choice'#13 +
      '   SET price = %.15f'#13 +
      ' WHERE id = %.0f',
      [APrice, AID]);
  end;

begin
  ASalesChoiceID := FSalesChoiceID;
  APrice := QryDataPRICE.AsFloat;
  if ReplaceCRMConfigChoice({ var } ASalesChoiceID,
    { var } APrice, { var } AChangeChoiceID, { var } AChangePrice) then
  // crm_soconfig_choice_replace.pas
    try
      GetChoiceInfo(ASalesChoiceID, ANewCode, ANewDescrip);

      QryData.DisableControls;
      // Cycle multiple selection
      { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl }
      {if Grid.Wwdbgrid.SelectedList.Count > 0 then
        try
          with Grid.Wwdbgrid, QryData do
            for i := 0 to SelectedList.Count - 1 do
            begin
              GotoBookmark(SelectedList.Items[i]);
              Freebookmark(SelectedList.Items[i]);
              if AChangeChoiceID then
                _UpdateChoiceID(QryDataID.AsFloat);
              if AChangePrice then
                _UpdatePrice(QryDataID.AsFloat);
            end;
        finally
          Grid.Wwdbgrid.SelectedList.Clear; // must go into the finally block
        end
        // Only one item selected
      else
      begin
        if AChangeChoiceID then
          _UpdateChoiceID(QryDataID.AsFloat);
        if AChangePrice then
          _UpdatePrice(QryDataID.AsFloat);
      end;}
      // Refresh the data
      ReOpen(QryData);
    finally
      QryData.EnableControls;
    end;
end;

function TFrmCRMSalesChoiceWhereUsed.SelectedID: Real;
begin
  Result := QryDataID.AsFloat;
end;

procedure TFrmCRMSalesChoiceWhereUsed.SrcDataDataChange(Sender: TObject;
  Field: TField);
begin
  SetControls;
end;

procedure TFrmCRMSalesChoiceWhereUsed.SetControls;
begin
  btnOk.Enabled := QryDataID.AsFloat > 0;
end;

procedure TFrmCRMSalesChoiceWhereUsed.SetSalesChoiceID(const Value: Real);
begin
  FSalesChoiceID := Value;
end;

procedure TFrmCRMSalesChoiceWhereUsed.JumptoTemplate1Click(
  Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmCRMSalesChoiceWhereUsed.PMainPopup(Sender: TObject);
// --------------------------------------------------------------------------
  procedure _ApplyEnabled(AGrid: TIQUniGridControl; AMenuItem: TUniMenuItem; AEnabled: Boolean);
  begin
    { TODO -oSanketG -cWebConvert : Need to find alternative for FindMenuItem in TIQUniGridControl }
    {with AGrid do
      if FindMenuItem(AMenuItem) <> nil then
        FindMenuItem(AMenuItem).Enabled := AEnabled;}
  end;
// --------------------------------------------------------------------------
  procedure _ApplyVisible(AGrid: TIQUniGridControl; AMenuItem: TUniMenuItem; AVisible: Boolean);
  begin
    { TODO -oSanketG -cWebConvert : Need to find alternative for FindMenuItem in TIQUniGridControl }
    {with AGrid do
      if FindMenuItem(AMenuItem) <> nil then
        FindMenuItem(AMenuItem).Visible := AVisible;}
  end;

// --------------------------------------------------------------------------
begin
  _ApplyEnabled(Grid, JumptoTemplate1, QryDataID.AsFloat > 0);
  _ApplyEnabled(Grid, Replace1, QryDataID.AsFloat > 0);
end;

end.
