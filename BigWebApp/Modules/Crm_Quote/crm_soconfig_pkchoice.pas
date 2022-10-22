unit crm_soconfig_pkchoice;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  IQMS.CRM.SalesQuote.MarkupConst,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { Callback events }
  TSelectSalesChoiceItemEvent = procedure(const ASalesConfigID,
    ASalesConfigOptionID, ASalesChoiceID, AOriginalQuoteDetailID: Int64;
    const APrice: Real; const ASalesConfigurationItemMarkup
    : TSalesConfigurationItemMarkup; const ASourceDisplay: string;
    const ANewRecord: Boolean) of object;

  { TFrmPkChoice }
  TFrmPkChoice = class(TUniForm)
    PnlGrid: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataForbidden: TBooleanField;
    Grid: TIQUniGridControl;
    QryExcludes: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    Refresh1: TUniMenuItem;
    QryDataSALES_OPTION_CHOICE_ID: TBCDField;
    QryDataSALES_CONFIG_OPTION_ID: TBCDField;
    QryDataSEQ: TBCDField;
    QryDataSALES_CHOICE_DESCRIP: TStringField;
    QryDataPRICE: TFMTBCDField;
    QryDataMARKUP: TFMTBCDField;
    QryDataMARKUP_TYPE: TBCDField;
    QryDataCODE: TStringField;
    QryExcludesDEPENDANT_OPTION_ID: TBCDField;
    QryExcludesDEPENDANT_CHOICE_ID: TBCDField;
    QryExcludesOPERATOR: TStringField;
    QryDataMARKUP_COMPOUND: TStringField;
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure SrcDataDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO -oSanketG -cWebConvert : Need to revisit ,
    [dcc32 Error] crm_soconfig_pkchoice.pas(83): E2003 Undeclared identifier: 'TGridDrawState'}
    {procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure QryDataCalcFields(DataSet: TDataSet);
    procedure Refresh1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FCRMQuoteID: Int64;
    FCRMQuoteDetailID: Int64;
    FSalesConfigID: Int64;
    FSalesConfigOptionID: Int64;
    FParentID: Int64; // CRM_QUOTE_DETAIL.PARENT_ID
    FSelectSalesChoiceItemEvent: TSelectSalesChoiceItemEvent;
    FMultiSelectOn: Boolean;
    function IsForbidden: Boolean;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
    procedure CheckApplyMultiSelectProperty;
    procedure ProcessSelection;
    procedure SetCRMQuoteID(const Value: Int64);
    procedure SetRMQuoteDetailID(const Value: Int64);
  public
    { Public declarations }
    property CRMQuoteID : Int64 write SetCRMQuoteID;
    property CRMQuoteDetailID: Int64 write SetRMQuoteDetailID;
  end;

  /// <summary> Prompts user to modify a Sales Option Choice item for a given
  /// CRM Quote Detail record.
  /// </summary>
  /// <param name="AOwner">TComponent owner.
  /// </param>
  /// <param name="ACRMQuoteID">The CRM_QUOTE.ID for the current Sales Quote.
  /// </param>
  /// <param name="ACRMQuoteDetailID">The CRM_QUOTE_DETAIL.ID for the selected
  /// Sales Quote detail item.  This is the detail item the user currently has
  /// selected in the grid.  It is passed back in the callback method in the
  /// AOriginalQuoteDetailID value.
  /// </param>
  /// <param name="AEvent">The call back event that will handle inserting or
  /// updating the quote detail record.  This method is provided by the calling
  /// form.
  /// </param>
  /// <param name="AMultiSelect">Returns true if multi-select was turned on.
  /// </param>
  /// <remarks>
  /// This must only be called for a quote detail record that has a source of
  /// SALES_CONFIG_OPTION.
  /// </remarks>
  /// <returns>True if a value was selected. Otherwise False is returned.
  /// </returns>
function DoSelectChoiceItem(ACRMQuoteID, ACRMQuoteDetailID: Int64;
  AEvent: TSelectSalesChoiceItemEvent; var AMultiSelect: Boolean): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  crm_rscstr;

function DoSelectChoiceItem(ACRMQuoteID, ACRMQuoteDetailID: Int64;
  AEvent: TSelectSalesChoiceItemEvent; var AMultiSelect: Boolean): Boolean;
var
  FrmPkChoice: TFrmPkChoice;
begin
  FrmPkChoice := TFrmPkChoice.Create(uniGUIApplication.uniApplication);
  with FrmPkChoice do
  begin
    try
      CRMQuoteID := ACRMQuoteID;
      CRMQuoteDetailID := ACRMQuoteDetailID;
      // 04/22/2009
      if (QryData.BOF and QryData.EOF) then
        // 'No choice items have been created for this option.'
        raise Exception.Create(crm_rscstr.cTXT0001633);

      // Assign the event
      FSelectSalesChoiceItemEvent := AEvent;

      Result := ShowModal = mrOk;

      AMultiSelect := FMultiSelectOn;
    finally
      //Release;
    end;
  end;
end;

{ TFrmPkChoice }

procedure TFrmPkChoice.FormShow(Sender: TObject);
begin
  CheckApplyMultiSelectProperty;
  ReOpen(QryData);
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl  }
  //IQRegFormRead(Self, [Self, Grid.Wwdbgrid]);
end;

procedure TFrmPkChoice.UniFormCreate(Sender: TObject);
begin

  FSalesConfigOptionID := 0;
  FParentID := 0;

  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_soconfig_pkchoice.pas(193): E2010 Incompatible types: 'TForm' and 'TFrmPkChoice'}
  //CenterForm(Self); // IQMS.Common.Controls.pas
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl  }
  //Grid.Wwdbgrid.Ctl3D := False;

  //PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmPkChoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl  }
  //IQRegFormWrite(Self, [Self, Grid.Wwdbgrid]);
end;

procedure TFrmPkChoice.IQAfterShowMessage(var Msg: TMessage);
begin
  // We refresh the data after show so that the OnCalculate kicks in
  // properly.  It just works best this way.
  Refresh1Click(NIL);
  // Locate the first OK record
  if QryData.Active then
    while not QryData.EOF do
    begin
      if QryDataForbidden.AsBoolean = False then
        BREAK;
      QryData.Next;
    end;

  Self.BringToFront;
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crm_soconfig_pkchoice.pas(220): E2010 Incompatible types: 'TForm' and 'TFrmPkChoice'}
  //IQMS.Common.Controls.ForceForegroundWindowC(Self, []);

end;

procedure TFrmPkChoice.CheckApplyMultiSelectProperty;
begin
  // Initialize
  FSalesConfigID := 0;
  FMultiSelectOn := False;

  // Get the values using the FCRMQuoteDetailID value.
  // FCRMQuoteDetailID represents the original CRM_QUOTE_DETAIL record
  // that was selected by the user.
  with TFDQuery.Create(nil) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add('SELECT parent_id,');
      SQL.Add('       source_id');
      SQL.Add('  FROM crm_quote_detail');
      SQL.Add(Format(' WHERE id = %d AND', [FCRMQuoteDetailID]));
      SQL.Add('        source = ''SALES_CONFIG_OPTION''');
      Open;
      if not(BOF and EOF) then
      begin
        FParentID := Fields[0].AsLargeInt;
        FSalesConfigOptionID := Fields[1].AsLargeInt;
        FSalesConfigID := SelectValueFmtAsInt64
          ('SELECT source_id AS sales_config_id              '#13 +
          '  FROM crm_quote_detail                          '#13 +
          ' WHERE id = %d                                   ', [FParentID]);
      end;
    finally
      Free;
    end;

  // Apply multiselect setting to grid
  FMultiSelectOn := SelectValueFmtAsInteger
    ('SELECT 1 FROM sales_config WHERE id = %d AND ' +
    'NVL(pick_by_choices, ''N'') = ''Y''', [FSalesConfigID]) = 1;
  { TODO -oSanketG -cWebConvert : Need to find alternative for Options in TIQUniGridControl}
  {if FMultiSelectOn then
    Grid.Options := Grid.Options + [dgMultiSelect]
  else
    Grid.Options := Grid.Options - [dgMultiSelect];}
end;

procedure TFrmPkChoice.DoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'SALES_CONFIG_OPTION_ID',
    FSalesConfigOptionID);
  AssignQueryParamValue(DataSet, 'CRM_QUOTE_DETAIL_ID', FCRMQuoteDetailID);
end;

procedure TFrmPkChoice.SetCRMQuoteID(const Value: Int64);
begin
  FCRMQuoteID := Value;
end;

procedure TFrmPkChoice.SetRMQuoteDetailID(const Value: Int64);
begin
  FCRMQuoteDetailID := Value;
end;

procedure TFrmPkChoice.SrcDataDataChange(Sender: TObject; Field: TField);
begin
  if Showing then
    btnOk.Enabled := QryDataForbidden.AsBoolean = False;
end;

{ TODO -oSanketG -cWebConvert : Need to revisit ,
[dcc32 Error] crm_soconfig_pkchoice.pas(293): E2003 Undeclared identifier: 'GridCalcCellColors'}
{procedure TFrmPkChoice.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if not Highlight and QryDataForbidden.AsBoolean then
  begin
    ABrush.Color := clBtnFace;
    AFont.Color := clBtnShadow;
  end;
end;}

procedure TFrmPkChoice.QryDataCalcFields(DataSet: TDataSet);
begin
  QryDataForbidden.AsBoolean := IsForbidden;
end;

function TFrmPkChoice.IsForbidden: Boolean;
begin
  { NOTE: QryExcludes is a "detail dataset" (child) of QryData.
    As the QryData record changes, so will the list of
    excludes.  We search the list of quoted items to see
    if the combination of option_id and choice_id exist in it.
    If the combination does exist (True), then we pass true and
    end the loop; there is no need to continue searching once
    we have found a True condition.  Otherwise, we pass False.
    False means the item is not forbidden and can be added to
    the quotation.

  }
  Result := False;
  if not QryExcludes.Active then
    Exit;
  ReOpen(QryExcludes); // unfortunately we have to do this
  while not QryExcludes.EOF do
  begin
    // Does this item exist on the quotation?
    // 10/07/2011 Changed SQL to include PARENT_ID
    if SelectValueFmtAsInteger('SELECT 1'#13 + '  FROM crm_quote_detail'#13 +
      ' WHERE crm_quote_id = %d AND'#13 +
      '       source = ''SALES_CONFIG_OPTION'' AND'#13 +
      '       source_id = %d AND'#13 +
      '       sales_option_choice_id = %d AND'#13 +
      '       parent_id = %d AND'#13 + '       ROWNUM < 2',
      [FCRMQuoteID, QryExcludesDEPENDANT_OPTION_ID.AsLargeInt,
      QryExcludesDEPENDANT_CHOICE_ID.AsLargeInt, FParentID]) = 1 then
    begin
      Result := True;
      BREAK;
    end;
    QryExcludes.Next;
  end;
end;

procedure TFrmPkChoice.Refresh1Click(Sender: TObject);
begin
  ReOpen(QryExcludes);
  ReOpen(QryData);
end;

procedure TFrmPkChoice.ProcessSelection;
var
  i: Integer;
  ASalesConfigurationItemMarkup: TSalesConfigurationItemMarkup;
begin
  if Assigned(FSelectSalesChoiceItemEvent) then
  begin
    { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl }
    {if Grid.Wwdbgrid.SelectedList.Count > 0 then
      try
        QryData.DisableControls;
        with Grid.Wwdbgrid, QryData do
          for i := 0 to SelectedList.Count - 1 do
          begin
            GotoBookmark(SelectedList.Items[i]);
            Freebookmark(SelectedList.Items[i]);

            ASalesConfigurationItemMarkup.Fill
              (TMarkupOptionType(QryDataMARKUP_TYPE.AsInteger),
              QryDataMARKUP.AsFloat, QryDataMARKUP_COMPOUND.AsString = 'Y');

            FSelectSalesChoiceItemEvent(FSalesConfigID, FSalesConfigOptionID,
              QryDataSALES_OPTION_CHOICE_ID.AsLargeInt, FCRMQuoteDetailID,
              QryDataPRICE.AsFloat, ASalesConfigurationItemMarkup,
              QryDataSALES_CHOICE_DESCRIP.AsString, True);
          end;
      finally
        Grid.Wwdbgrid.SelectedList.Clear; // must go into the finally block
        QryData.EnableControls;
      end
    else
    begin
      ASalesConfigurationItemMarkup.Fill
        (TMarkupOptionType(QryDataMARKUP_TYPE.AsInteger), QryDataMARKUP.AsFloat,
        QryDataMARKUP_COMPOUND.AsString = 'Y');

      // Process the selected record
      FSelectSalesChoiceItemEvent(FSalesConfigID, FSalesConfigOptionID,
        QryDataSALES_OPTION_CHOICE_ID.AsLargeInt, FCRMQuoteDetailID,
        QryDataPRICE.AsFloat, ASalesConfigurationItemMarkup,
        QryDataSALES_CHOICE_DESCRIP.AsString, False);
    end;}
  end;
end;

procedure TFrmPkChoice.btnOkClick(Sender: TObject);
begin
  if btnOk.Enabled then
    ModalResult := mrOk;

  if ModalResult = mrOk then
    ProcessSelection;
end;

end.
