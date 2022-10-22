unit IQMS.PrintLabels.LMManu;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.PrintLabels.LMBase,
  Mask,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid, uniGUIFrame,
  uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniPageControl;

type
  TFrmLM_Manu = class(TFrmLM_Base)
    Label6: TUniLabel;
    Label7: TUniLabel;
    EditBox: TUniEdit;
    Label8: TUniLabel;
    wwMfgNo: TUniDBLookupComboBox;
    Label9: TUniLabel;
    Label10: TUniLabel;
    wwPackage: TUniDBLookupComboBox;
    Label11: TUniLabel;
    wwBillTo: TUniDBLookupComboBox;
    Label13: TUniLabel;
    EditBoxNum: TUniEdit;
    editVolume: TUniEdit;
    editWeight: TUniEdit;
    Label14: TUniLabel;
    Label15: TUniLabel;
    Label16: TUniLabel;
    Label17: TUniLabel;
    sbEditBoxNum: TUniSpeedButton;
    wwDBLookupComboCustomer: TUniDBLookupComboBox;
    sbtnPopulateLabelsQty: TUniSpeedButton;
    StoredProc1: TFDStoredProc;
    StoredProc1ID: TBCDField;
    StoredProc1ISA_RECEIVER_CODE: TStringField;
    StoredProc1SU_SUPPLIER_CODE: TStringField;
    StoredProc1SF_N1_CODE: TStringField;
    StoredProc1PCI_11Z: TStringField;
    StoredProc1PCI_12Z: TStringField;
    StoredProc1PCI_13Z: TStringField;
    StoredProc1PCI_14Z: TStringField;
    StoredProc1PCI_15Z: TStringField;
    StoredProc1PCI_16Z: TStringField;
    StoredProc1PCI_17Z: TStringField;
    StoredProc1SHIP_TO_CUSER5: TStringField;
    StoredProc1EDI_SHIP_TO_CODE: TStringField;
    StoredProc1CUST_REF: TStringField;
    StoredProc1EDIUSER1: TStringField;
    StoredProc1EDIUSER2: TStringField;
    StoredProc1EDIUSER3: TStringField;
    StoredProc1EDIUSER4: TStringField;
    StoredProc1EDIUSER5: TStringField;
    StoredProc1EDIUSER6: TStringField;
    StoredProc1EDIUSER7: TStringField;
    StoredProc1EDIUSER8: TStringField;
    StoredProc1EDIUSER9: TStringField;
    StoredProc1EDIUSER10: TStringField;
    StoredProc1EDIUSER11: TStringField;
    StoredProc1EDIUSER12: TStringField;
    StoredProc1EDIUSER13: TStringField;
    StoredProc1EDIUSER14: TStringField;
    StoredProc1EDIUSER15: TStringField;
    lblShipTo: TUniLabel;
    cmbShipTo: TUniDBLookupComboBox;
    Shape9: TUniPanel;
    procedure BtnOkClick(Sender: TObject);
    procedure SBNewLabelClick(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure sbEditBoxNumClick(Sender: TObject);
    procedure wwDBLookupComboCustomerChange(Sender: TObject);
    procedure wwMfgNoChange(Sender: TObject);
    procedure wwDBLookupComboCustomerDropDown(Sender: TObject);
    procedure wwDBLookupComboCustomerCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnPopulateLabelsQtyClick(Sender: TObject);
    procedure wwPackageCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure EditBoxExit(Sender: TObject);
    procedure wwLabelsChange(Sender: TObject);
    procedure cmbShipToChange(Sender: TObject);
  protected
    FIsMfgLabelAllowedDecimal  : Boolean;
    FReceiptsId:Real;
    procedure SrcPackageDataChange(Sender: TObject; Field: TField); virtual;
    procedure AssignDefaultLabelsQty; virtual;
    procedure AssignPkgInfo;
    procedure AssignEdiInfo;
    procedure AssignMfgLabelAllowedDecimal;
  private
    { Private declarations }
    FInit_Standard_ID: Real;
    FInit_Arinvt_ID: Real;
    procedure CheckAssignBoxQtyFromBolData;
  protected
    procedure AssignDefaults;override;
    procedure AssignCustomerLookupParams; virtual;
    procedure AssignQuantity;override;
    procedure AssignVolumeAndWeight( AUseDefault: Boolean = TRUE );
    function GetUnitQuantity: Integer; override;
    procedure SetUnitQuantity(const Value: Integer); override;
  public
    { Public declarations }
    SkipMfgExistsValidation: Boolean;
    constructor Create(AOwner:TComponent; Id:Real); override;
  end;

var
  FrmLM_Manu: TFrmLM_Manu;

implementation
{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM,
  System.Math,
  System.Variants,
  IQMS.WebVcl.ResourceStrings;

constructor TFrmLM_Manu.Create(AOwner:TComponent; Id:Real);
begin
  FInit_Standard_ID:= -1;

  inherited Create( AOwner, Id );
  Shape9.Top := wwMfgNo.Top + 6;
  Shape9.left := SBNewLabel.left;
  DM.SrcPackage.OnDataChange := SrcPackageDataChange;
  SrcPackageDataChange(nil, nil);  // update ptsper
  sbEditBoxNumClick(nil);

  CheckAssignBoxQtyFromBolData;
end;

function TFrmLM_Manu.GetUnitQuantity: Integer;
begin
  if not TryStrToInt(EditBox.Text, Result) then
    Result := 0;
end;


procedure TFrmLM_Manu.SetUnitQuantity(const Value: Integer);
begin
  inherited;
  EditBox.Text := IntToStr(Value);
end;

procedure TFrmLM_Manu.SrcPackageDataChange(Sender: TObject; Field: TField);
begin
  //try
  //  nBoxes := StrToFloat(EditQty.Text)/DM.QryPackage.FieldByName('PTSPER').asFloat;
  //except
  //  nBoxes := 1;
  //end;
  //if (nBoxes - Trunc(nBoxes)) <> 0 then nBoxes := nBoxes + 1;

  EditBox.Text    := IntToStr(Trunc(DM.QryPackage.FieldByName('PTSPER').asFloat));
  // EditLbLQty.Text := IntToStr(Trunc(nBoxes));
  EditBoxNum.Text
    := IntToStr( SelectValueFmtAsInteger(
        'select workorder_misc.get_boxno(%d, %d, %d ) from dual',
        [ Trunc(FInit_Arinvt_ID),
          Trunc(FInit_Standard_ID),
          Trunc(TIQWebLMBase(self.Owner).Workorder_id ) ])); //IntToStr( Max(1, DM.QryPackage.FieldByName('BOXNO').asInteger ));

  {Store packaging arinvt_id. Sep-10-01}
  TIQWebLMBase(self.Owner).FBox_ID:= DM.QryPackage.FieldByName('ARINVT_ID').asFloat;
end;

procedure TFrmLM_Manu.AssignDefaultLabelsQty;
var
  nBoxes:Real;
begin
  //if not IQMS.Common.Numbers.IsStringValidInteger(EditQty.Text, nBoxes) then
  //   nBoxes := 1;

  //if (nBoxes - nBoxes) <> 0 then
  //   nBoxes:= nBoxes + 1;

  //EditLbLQty.Text:= IntToStr(nBoxes);

  // restored Sep-07-2006
  try
    nBoxes := StrToFloat(EditQty.Text) / StrToFloat( EditBox.Text );
  except
    nBoxes := 1;
  end;

  if (nBoxes - Trunc(nBoxes)) <> 0 then
     nBoxes:= nBoxes + 1;

  EditLbLQty.Text:= FormatInteger1000Separator( Trunc( nBoxes ));
end;


procedure TFrmLM_Manu.AssignDefaults;
var
  nId:Real;
  AStandardID: Real;
begin
  {Apr-25-01}
  if (TIQWebLMBase(self.Owner).Arinvt_ID > 0) and (TIQWebLMBase(self.Owner).Standard_ID = 0) then
     TIQWebLMBase(self.Owner).Standard_ID:= SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [ TIQWebLMBase(self.Owner).Arinvt_ID ]);

  if SelectValueFmtAsFloat('select id from po_receipts where id = %f', [FReceiptsId]) <> 0 then
    TIQWebLMBase(self.Owner).This_Standard_ID:= TIQWebLMBase(self.Owner).Standard_ID;

  FInit_Standard_ID:= TIQWebLMBase(self.Owner).Standard_ID;
  FInit_Arinvt_ID  := TIQWebLMBase(self.Owner).Arinvt_ID;

  AssignMfgLabelAllowedDecimal;

  inherited;

  wwLabels.DataSource.DataSet := DM.QryLabelCust;
  DM.SrcLabels.DataSet := DM.QryLabelCust;
  IQSetTablesActive( false, DM );

  wwMfgNo.ListField        := 'MFGNO';
  wwPackage.ListField      := 'SEQ';
  wwBillTo.ListField       := 'ATTN';
  cmbShipTo.ListField       := 'ATTN';

  IQSetTablesActive( true, DM );

  if TIQWebLMBase(self.Owner).Orders_id <> 0 then
  begin
    // Bill To
    nId:= SelectValueFmtAsFloat('select bill_to_id from orders where id = %.0f', [TIQWebLMBase(self.Owner).Orders_id]);
    if nId = 0 then
       nId:= SelectValueFmtAsFloat('select bill_to_id from hist_orders where id = %.0f', [TIQWebLMBase(self.Owner).Orders_id]);
    ReOpen(DM.QryBillTo);
    if nId <> 0 then
       DM.QryBillTo.Locate('ID', nId, []);
    // Ship To
    nId:= SelectValueFmtAsFloat('select ship_to_id from orders where id = %.0f', [TIQWebLMBase(self.Owner).Orders_id]);
    if nId = 0 then
       nId:= SelectValueFmtAsFloat('select ship_to_id from hist_orders where id = %.0f', [TIQWebLMBase(self.Owner).Orders_id]);
    ReOpen(DM.QryShipTo);
    if nId <> 0 then
       DM.QryShipTo.Locate('ID', nId, []);
  end;


  if not SkipMfgExistsValidation then
  begin
    if DM.QryMfgNo.Eof and DM.QryMfgNo.Bof then
       begin
         if SelectValueByID('standard_id', 'arinvt', DM.QryMfgNo.ParamByName('nid').asFloat) = 0 then
            raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000126 {'Not a Finish Goods item (ARINVT_ID = %.0f).'}, [ DM.QryMfgNo.ParamByName('nid').asFloat ])
         else
            raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000315 {'The associated BOM is marked inactive (ARINVT_ID = %.0f) - unable to proceed.'}, [ DM.QryMfgNo.ParamByName('nid').asFloat ]);
       end;
    if Empty(Trim(TIQWebLMBase(Owner).FPart_No)) then
       raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000127 {'Item is not found in inventory.'} );
  end;

  wwBillTo.Text := DM.QryBillTo.FieldByName('ATTN').asString;
  cmbShipTo.Text := DM.QryShipTo.FieldByName('ATTN').asString;
  wwLabels.Text := DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
  wwPackage.Text:= DM.QryPackage.FieldByName('DESCRIP').asString;

  if TIQWebLMBase(self.Owner).This_Standard_ID > 0 then
     AStandardID:= TIQWebLMBase(self.Owner).This_Standard_ID
  else
     AStandardID:= SelectValueFmtAsFloat('select standard_id from arinvt where id = %f', [ TIQWebLMBase(self.Owner).Arinvt_ID ]);
  if AStandardID > 0 then
     DM.QryMfgNo.Locate('ID', AStandardID, []);
  wwMfgNo.Text:= DM.QryMfgNo.FieldByName('MFGNO').asString;

  // EditCustomer.Text   := TLMBase(Owner).FCustomer;
  {Customer drop down box}
  AssignCustomerLookupParams;
  wwDBLookupComboCustomer.DataSource.DataSet.FieldByName(wwDBLookupComboCustomer.DataField).AsString:= TIQWebLMBase(Owner).FCustomer;
  PopulateAkaItemno;
//  wwDBLookupComboCustomer.PerformSearch;
  wwDBLookupComboCustomerChange( NIL );  {refresh manually bill-to and labels}

  AssignVolumeAndWeight;
end;

procedure TFrmLM_Manu.AssignCustomerLookupParams;
begin
  with DM.wwQryCustomer do
  begin
    Close;
    ParamByName('arinvt_id').Value := TIQWebLMBase(self.Owner).Arinvt_ID;
    ParamByName('arcusto_id').Value := -1;  {use this param to pickup arcusto_id for sales orders in addition to default arinvt.arcusto_id}
    Open;
  end;
end;

procedure TFrmLM_Manu.AssignVolumeAndWeight( AUseDefault: Boolean = TRUE );
var
  AID:Real;
  AUom:String;
  ALookupArinvt_ID: Real;
  AStandard_ID: Real;

  procedure CheckChangeBlankToZero( AEdit: TUniEdit );
  begin
    if Trim(AEdit.Text) = '' then
       AEdit.Text:= '0';
  end;

begin
  // AUom := SelectValueAsString('select NVL(metric_uom, ''N'') from params');
  try
    if IsMetricSysArinvt( TIQWebLMBase(Owner).FArinvt_ID ) then
       AUOM:= 'Y'
    else
       AUOM:= 'N';

    if AUom = 'N' then
      Label16.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000128 // '(Lbs.)'
    else
      Label16.Caption := IQMS.WebVcl.ResourceStrings.cTXT0000129; // '(Gr.)'
//    Label16.Caption := SelectValueFmtAsString('select ''('' || uom || '')'' from standard where id = ' +
//                                    '(select standard_id from arinvt where id = %f)',
//                                    [TLMBase(Owner).FArinvt_ID]);
//    Label16.Visible := Trim(Label16.Caption) <> '()';


    // 01-09-2009 overwrite default if needed
    if not AUseDefault then
    begin
      editVolume.Text:= DM.QryPackage.FieldByName('volume').asString;
      editWeight.Text:= DM.QryPackage.FieldByName('weight').asString;
      EXIT;
    end;

    // 01-07-2009 get partno_id based on selected standard_id
    AStandard_ID:= IIf( TIQWebLMBase(Owner).Standard_ID > 0, TIQWebLMBase(Owner).Standard_ID , SelectValueByID('standard_id', 'arinvt', TIQWebLMBase(Owner).FArinvt_ID));
    AID:= SelectValueFmtAsFloat('select id from partno where arinvt_id = %f and standard_id = %f',
                    [ TIQWebLMBase(Owner).FArinvt_ID, AStandard_ID ]);

    if (AID <> 0) and Assigned(wwPackage.DataSource.DataSet) then
    begin
      // editWeight.Text := FloattoStr(SelectValueFmtAsFloat('select ptwt_disp from partno where id = %f', [AID]));
      with TFDQuery.Create(NIL) do
      try
        ConnectionName := 'IQFD';
        ALookupArinvt_ID:= TFDQuery(wwPackage.DataSource.DataSet).FieldByName('arinvt_id').asFloat;

        Sql.Add(IQFormat('select o.arinvt_id, o.weight ' +
                         '  from opmat o, ' +
                         '       ptoper t, ' +
                         '       arinvt a ' +
                         ' where t.partno_id = %f ' +
                         '   and o.sndop_id = t.sndop_id ' +
                         '   and o.arinvt_id = a.id ' +
                         '   and o.arinvt_id = %f ' +
                         '   and a.class = ''PK'' ' +
                         'order by o.seq', [AID, ALookupArinvt_ID]));
        Open;
        if not (eof and bof) then
        begin
          editVolume.Text:= Format('%.6f', [SelectValueFmtAsFloat('select volume from arinvt where id = %f', [ FieldByName('arinvt_id').asFloat ])]);

          editWeight.Text:= Format('%.6f', [FieldByName('weight').asFloat]);
        end;
      finally
        Free;
      end;
    end;
  finally
    CheckChangeBlankToZero( editVolume );
    CheckChangeBlankToZero( editWeight );
  end;
end;

procedure TFrmLM_Manu.BtnOkClick(Sender: TObject);
var
  nBoxNum, nLabelQty: Integer;
  nWeight, nVolume, nBoxQty : Real;
begin

  // initialize the variables
  nBoxQty    := 0;
  nBoxNum    := 0;
  nLabelQty  := 0;
  nWeight    := 0;
  nVolume    := 0;

  CheckMandatoryLotNo;      // IQLMBase.pas

  // validate and get box quantity
  if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, nBoxQty) then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000130 {'Valid Box Quantity must be entered'} );

  // validate and get box number
  if not IQMS.Common.Numbers.IsStringValidInteger(EditBoxNum.Text, nBoxNum) then
     raise Exception.Create(  IQMS.WebVcl.ResourceStrings.cTXT0000131 {'Valid Box Number must be entered'} );
  nBoxNum := Max(1, nBoxNum); // ensure at least a value of 1

  // validate and get weight
  if not IQMS.Common.Numbers.IsStringValidFloat(EditWeight.Text, nWeight) then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000132 {'Valid Weight must be entered'} );

  // validate and get volume
  if not IQMS.Common.Numbers.IsStringValidFloat(editVolume.Text, nVolume) then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000327 {'Valid Volume must be entered.'} );

  TIQWebLMBase(Owner).Standard_Id := DM.QryMfgNo.FieldByName('ID').asFloat;
  TIQWebLMBase(Owner).FPck_wght   := nWeight; // DM.QryPackage.FieldByName('ARINVT_ID').asFloat;

//  if TLMBase(self.Owner).Orders_id <> 0 then
    if TIQWebLMBase(Owner).bill_to_id2 = 0 then
      TIQWebLMBase(Owner).Bill_To_Id  := DM.QryBillTo.FieldByName('ID').asFloat
    else
      TIQWebLMBase(Owner).Bill_To_Id  := TIQWebLMBase(Owner).bill_to_id2;

//  TLMBase(Owner).Bill_To_Id  := DM.QryBillTo.FieldByName('ID').asFloat;

//  else
//    TLMBase(Owner).Bill_To_Id  := SelectValueFmtAsFloat('select bill_to_id from orders where id = %f',
//                                            [TLMBase(self.Owner).Orders_id]);

  TIQWebLMBase(Owner).FBoxno  := nBoxNum;
  TIQWebLMBase(Owner).FWeight := nWeight;
  TIQWebLMBase(Owner).FVolume := nVolume;

  {Oct-28-04}
  AssignPkgInfo;

  {Nov-05-04}
  AssignEdiInfo;

  inherited;

  {increment box # only for non pallet labels and for brand new labels - nor reprint}
  if not FIsPallet and (FPrintExist_Master_Label_ID = 0) then
  begin
    if FBoxNoRepresentsNumberOfCopies then
      nBoxNum := Max(1, (1 + Trunc(nBoxNum)) mod 10000)
    else
      nBoxNum := Max(1, (Trunc(TIQWebLMBase(Owner).TBoxNo) + Trunc(nBoxNum)) mod 10000);

    if not TIQWebLMBase(Owner).FSkipBoxNoUpdate then
    begin
       {Prevent BOM Ctrl# change. AA Jun 27, 01}

//Migrated to workorder_misc.set_boxno call below

//       ExecuteCommandFmt('begin                                         '+
//                 '  IQMisc.v_disable_change::= ''Y'';           '+
//                 '  update partno set boxno = %d where id = %f; '+
//                 '  IQMisc.v_disable_change::= ''N'';           '+
//                 'end;                                          ',
//                 [ nBoxNum, TLMBase(Owner).FpartnoID ]);

      {EIQ-11211 Labels- Box # not resetting when
      'Reset box number on lot number change' checked
       Phoenix Closures CRM# 1409049

         Package: WORKORDER_MISC
         PROCEDURE set_boxno
          ( p_boxno        IN NUMBER,
            p_arinvt_id    IN NUMBER,
            p_standard_id  IN NUMBER,
            p_workorder_id IN NUMBER:= 0,
            p_partno_id    IN NUMBER:= 0,
            p_ptorder_id   IN NUMBER:= 0 );
      }
      ExecuteCommandFmt(
        'begin '+
        '  workorder_misc.set_boxno( %d, %d, %d, %d, %d, %d ); '+
        'end; ', [ nBoxNum,
                   Trunc(TIQWebLMBase(self.Owner).Arinvt_ID),
                   Trunc(FInit_Standard_ID),
                   Trunc(TIQWebLMBase(self.Owner).Workorder_id),
                   Trunc(TIQWebLMBase(self.Owner).FPartNoId),
                   Trunc(TIQWebLMBase(self.Owner).FPTOrder_ID) ]);
    end;

    EditBoxNum.Text := IntToStr(nBoxNum);
  end;
end;


procedure TFrmLM_Manu.AssignQuantity;
var
   AQty: Real;
begin
  // if not IQMS.Common.Numbers.IsStringValidInteger(EditBox.Text, nBoxes) then
  //    nBoxes := 0;
  // TLMBase(Owner).Quantity   := nBoxes;

  if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, AQty) then
     AQty:= 0;

  if FIsMfgLabelAllowedDecimal then
     TIQWebLMBase(Owner).Quantity:= IQMS.Common.Numbers.IQRound( AQty,  Trunc(SelectValue('select NVL(prod_rep_decimal,6) from params') ) )
  else
     TIQWebLMBase(Owner).Quantity:= Trunc( AQty )
end;


procedure TFrmLM_Manu.SBNewLabelClick(Sender: TObject);
begin
  inherited;
  wwLabels.Text := DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
end;

procedure TFrmLM_Manu.DefineLabelText1Click(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmLM_Manu.sbEditBoxNumClick(Sender: TObject);
begin
  with EditBoxNum do
  begin
    if sbEditBoxNum.Down
    then
    begin
      sbEditBoxNum.Hint := IQMS.WebVcl.ResourceStrings.cTXT0000133; // 'The first Box Number is editable.'#13'Click to swich to Read Only.'
      ReadOnly := False;
      Color    := clWindow;
//      Ctl3D    := True;
    end
    else
    begin
      sbEditBoxNum.Hint := IQMS.WebVcl.ResourceStrings.cTXT0000134; // 'The first Box Number is Read Only.'#13'Click to edit.'
      ReadOnly := True;
      Color    := clBtnFace;
//      Ctl3D    := False;
    end;
  end;
end;

procedure TFrmLM_Manu.wwDBLookupComboCustomerChange(Sender: TObject);
begin
  inherited;  {nothing}

  TIQWebLMBase(Owner).Arcusto_ID:= DM.wwQryCustomerID.asFloat;

  PopulateAkaItemno;

  ReOpen(DM.QryLabelCust);
  wwLabels.DataSource.DataSet.FieldByName(wwLabels.DataField).AsString:= DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
//  wwLabels.PerformSearch;

  ReOpen(DM.QryBillTo);
  ReOpen(DM.QryShipTo);

  wwBillTo.Text := DM.QryBillTo.FieldByName('ATTN').asString;
  cmbShipTo.Text := DM.QryShipTo.FieldByName('ATTN').asString;
  wwLabels.Text := DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
end;

procedure TFrmLM_Manu.wwMfgNoChange(Sender: TObject);
var
  AOldArinvt_ID: Real;
begin
  inherited; {nothing}

  if SelectValueFmtAsString('select NVL(pk_hide, ''N'') from standard where id = %f', [DM.QryMfgNo.FieldByName('ID').asFloat]) = 'Y' then
    wwMfgNo.Color := clYellow
  else
    wwMfgNo.Color := clWindow;


  if FInit_Standard_ID = -1 then
     EXIT;

  AOldArinvt_ID:= TIQWebLMBase(self.Owner).Arinvt_ID;

  TIQWebLMBase(self.Owner).Standard_ID:= DM.QryMfgNo.FieldByName('ID').asFloat;

  if TIQWebLMBase(self.Owner).Standard_ID = FInit_Standard_ID then
     TIQWebLMBase(self.Owner).Arinvt_ID:= FInit_Arinvt_ID

  else if SelectValueFmtAsFloat( 'select 1 from partno where standard_id = %f and arinvt_id = %f', [ TIQWebLMBase(self.Owner).Standard_ID, TIQWebLMBase(self.Owner).Arinvt_ID ]) = 1 then
     {do nothing as we already sitting on that item - this is for family molds that have 2 bom producing the same 2 items}

  else
     TIQWebLMBase(self.Owner).Arinvt_ID:= SelectValueFmtAsFloat( 'select arinvt_id from partno where standard_id = %f', [ TIQWebLMBase(self.Owner).Standard_ID ]);

  {Aug-16-2004 refresh attached label - when apply mfg is assigned selecting an mfg should change the associated label}
  if (AOldArinvt_ID <> TIQWebLMBase(self.Owner).Arinvt_ID) or not wwLabels.DataSource.DataSet.Active  then
  begin
    ReOpen( wwLabels.DataSource.DataSet );
    wwLabels.Text:= DM.QryLabelCust.FieldByName('LABEL_MENU_NAME').asString;
  end;

  {Feb-08-05 Position on 1st pkg item}
  DM.QryPackage.Open;
  if DM.QryPackage.Locate('partno_id;seq', VarArrayOf([ TIQWebLMBase(self.Owner).FPartnoID, 1 ]), []) then
     wwPackage.Text:= DM.QryPackage.FieldByName('DESCRIP').asString

  else if DM.QryPackage.Locate('partno_id', TIQWebLMBase(self.Owner).FPartnoID, []) then
     wwPackage.Text:= DM.QryPackage.FieldByName('DESCRIP').asString;

  // 01-07-2009 refresh volume & weight use QryPackage values instead of default based on opmat
  AssignVolumeAndWeight( FALSE );

  edLotNo.Text:= Trim(TIQWebLMBase(Owner).FLotNo); // default lot number for given standard_id
end;

procedure TFrmLM_Manu.wwDBLookupComboCustomerDropDown(Sender: TObject);
begin
  //  DM.wwQryCustomer.Filter := 'PK_HIDE = NULL or PK_HIDE = ''N''';
  if DM.DoNotDefaultArcusto then
  begin
    DM.DoNotDefaultArcusto:= False;
    Reopen(DM.wwQryCustomer);
  end;
end;

procedure TFrmLM_Manu.wwLabelsChange(Sender: TObject);
begin
  inherited;
  CheckAssignBoxQtyFromBolData;
end;

procedure TFrmLM_Manu.wwDBLookupComboCustomerCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
//  DM.wwQryCustomer.Filter := '';
end;

procedure TFrmLM_Manu.sbtnPopulateLabelsQtyClick(Sender: TObject);
begin
  inherited; {nothing}
  AssignDefaultLabelsQty;
end;

procedure TFrmLM_Manu.wwPackageCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  AssignVolumeAndWeight( FALSE {do not use default - use QryPackage values instead});
end;

procedure TFrmLM_Manu.AssignPkgInfo;
var
  A: Variant;
begin
  TIQWebLMBase(Owner).FPkg_Arinvt_ID := TFDQuery(wwPackage.DataSource.DataSet).FieldByName('arinvt_id').asFloat;
  TIQWebLMBase(Owner).FPkg_Aka_ID    := 0;
  TIQWebLMBase(Owner).FPkg_Aka_Itemno:= '';

  A:= SelectValueArrayFmt( 'select id, cust_itemno from aka                                             '+
                      ' where arcusto_id = %f and arinvt_id = %f                                   '+
                      '   and misc.aka_ship_to_filter( arcusto_id, arinvt_id, %s, ship_to_id ) = 1 ',
                      [ TIQWebLMBase(Owner).FArcusto_Id,
                        TIQWebLMBase(Owner).FPkg_Arinvt_ID,
                        IIf( TIQWebLMBase(Owner).FShip_To_ID = 0, 'NULL', FloatToStr( TIQWebLMBase(Owner).FShip_To_ID )) ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    TIQWebLMBase(Owner).FPkg_Aka_ID    := A[ 0 ];
    TIQWebLMBase(Owner).FPkg_Aka_Itemno:= A[ 1 ];
  end;

  {selected pkg item tare_weight}
  TIQWebLMBase(Owner).FPk_Tare:= TFDQuery(wwPackage.DataSource.DataSet).FieldByName('tare_weight').asFloat;

  {select seq = 1 pkg item and its tare_weight}
  TIQWebLMBase(Owner).FPK_1_Item:= '';
  TIQWebLMBase(Owner).FPK_1_Tare:= 0;
  A:= SelectValueArrayFmt( 'select a.itemno, o.tare_weight '+
                      '  from partno p,               '+
                      '       ptoper t,               '+
                      '       sndop s,                '+
                      '       opmat o,                '+
                      '       arinvt a                '+
                      ' where p.id = %.0f             '+
                      '   and t.partno_id = p.id      '+
                      '   and t.sndop_id = s.id       '+
                      '   and s.op_class = ''PK''     '+
                      '   and o.sndop_id = s.id       '+
                      '   and o.arinvt_id = a.id      '+
                      '   and o.seq = 1               ',
                      [ TFDQuery(wwPackage.DataSource.DataSet).FieldByName('partno_id').asFloat ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    TIQWebLMBase(Owner).FPK_1_Item:= A[ 0 ];
    TIQWebLMBase(Owner).FPK_1_Tare:= A[ 1 ];
  end;
end;

procedure TFrmLM_Manu.AssignEdiInfo;
var
  A: Variant;
  B: Variant;
  ASeg_str: string;
  AId:Real;
begin
  TIQWebLMBase(Owner).FIsa_receiver_code:= '';
  TIQWebLMBase(Owner).FSu_supplier_code := '';
  TIQWebLMBase(Owner).FPci_11z          := '';
  TIQWebLMBase(Owner).FPci_12z          := '';
  TIQWebLMBase(Owner).FPci_13z          := '';
  TIQWebLMBase(Owner).FPci_14z          := '';
  TIQWebLMBase(Owner).FPci_15z          := '';
  TIQWebLMBase(Owner).FPci_16z          := '';
  TIQWebLMBase(Owner).FPci_17z          := '';
  TIQWebLMBase(Owner).FShip_to_cuser5   := '';
  TIQWebLMBase(Owner).FEdi_ship_to_code := '';
  TIQWebLMBase(Owner).FCust_ref         := '';
  TIQWebLMBase(Owner).FSf_n1_code       := '';
  TIQWebLMBase(Owner).FSeg_man          := '';

  TIQWebLMBase(Owner).FEDIUser1         := '';
  TIQWebLMBase(Owner).FEDIUser2         := '';
  TIQWebLMBase(Owner).FEDIUser3         := '';
  TIQWebLMBase(Owner).FEDIUser4         := '';
  TIQWebLMBase(Owner).FEDIUser5         := '';
  TIQWebLMBase(Owner).FEDIUser6         := '';
  TIQWebLMBase(Owner).FEDIUser7         := '';
  TIQWebLMBase(Owner).FEDIUser8         := '';
  TIQWebLMBase(Owner).FEDIUser9         := '';
  TIQWebLMBase(Owner).FEDIUser10        := '';
  TIQWebLMBase(Owner).FEDIUser11        := '';
  TIQWebLMBase(Owner).FEDIUser12        := '';
  TIQWebLMBase(Owner).FEDIUser13        := '';
  TIQWebLMBase(Owner).FEDIUser14        := '';
  TIQWebLMBase(Owner).FEDIUser15        := '';
  {07-16-2007}
  TIQWebLMBase(Owner).FRel_CUser1       := '';
  TIQWebLMBase(Owner).FRel_CUser2       := '';

  {EDI fields}
  if TIQWebLMBase(Owner).Ord_Detail_ID > 0 then
  begin
      StoredProc1.Prepare;
      AId := TIQWebLMBase(Owner).Ord_Detail_ID;
      StoredProc1.ParamByName('v_id').Value := Trunc(AId);
      StoredProc1.Open;

      if StoredProc1.Fields.Count > 0 then
      begin
        TIQWebLMBase(Owner).FIsa_receiver_code:= StoredProc1isa_receiver_code.asString;
        TIQWebLMBase(Owner).FSu_supplier_code := StoredProc1su_supplier_code.asString;
        TIQWebLMBase(Owner).FPci_11z          := StoredProc1pci_11z.asString;
        TIQWebLMBase(Owner).FPci_12z          := StoredProc1pci_12z.asString;
        TIQWebLMBase(Owner).FPci_13z          := StoredProc1pci_13z.asString;
        TIQWebLMBase(Owner).FPci_14z          := StoredProc1pci_14z.asString;
        TIQWebLMBase(Owner).FPci_15z          := StoredProc1pci_15z.asString;
        TIQWebLMBase(Owner).FPci_16z          := StoredProc1pci_16z.asString;
        TIQWebLMBase(Owner).FPci_17z          := StoredProc1pci_17z.asString;
        TIQWebLMBase(Owner).FShip_to_cuser5   := StoredProc1ship_to_cuser5.asString;
        TIQWebLMBase(Owner).FEdi_ship_to_code := StoredProc1edi_ship_to_code.asString;
        TIQWebLMBase(Owner).FCust_ref         := StoredProc1cust_ref.asString;
        TIQWebLMBase(Owner).FSf_n1_code       := StoredProc1sf_n1_code.asString;
        TIQWebLMBase(Owner).FEDIUser1         := StoredProc1ediuser1.asString;
        TIQWebLMBase(Owner).FEDIUser2         := StoredProc1ediuser2.asString;
        TIQWebLMBase(Owner).FEDIUser3         := StoredProc1ediuser3.asString;
        TIQWebLMBase(Owner).FEDIUser4         := StoredProc1ediuser4.asString;
        TIQWebLMBase(Owner).FEDIUser5         := StoredProc1ediuser5.asString;
        TIQWebLMBase(Owner).FEDIUser6         := StoredProc1ediuser6.asString;
        TIQWebLMBase(Owner).FEDIUser7         := StoredProc1ediuser7.asString;
        TIQWebLMBase(Owner).FEDIUser8         := StoredProc1ediuser8.asString;
        TIQWebLMBase(Owner).FEDIUser9         := StoredProc1ediuser9.asString;
        TIQWebLMBase(Owner).FEDIUser10        := StoredProc1ediuser10.asString;
        TIQWebLMBase(Owner).FEDIUser11        := StoredProc1ediuser11.asString;
        TIQWebLMBase(Owner).FEDIUser12        := StoredProc1ediuser12.asString;
        TIQWebLMBase(Owner).FEDIUser13        := StoredProc1ediuser13.asString;
        TIQWebLMBase(Owner).FEDIUser14        := StoredProc1ediuser14.asString;
        TIQWebLMBase(Owner).FEDIUser15        := StoredProc1ediuser15.asString;
      end;

    TIQWebLMBase(Owner).FSeg_man:= SelectValueFmtAsString('select max(seg_string) from ord_detail_seg where seg = ''MAN'' and ord_detail_id = %f', [ TIQWebLMBase(Owner).Ord_Detail_ID ]);
  end;

  {RAN}
  if TIQWebLMBase(Owner).Pk_Ticket_Dtl_ID > 0 then
  begin
    TIQWebLMBase(Owner).FRan:= '';
    B:= SelectValueArrayFmt('select r.ran, r.cuser1, r.cuser2 from releases r, ps_ticket_dtl d where d.id = %f and d.release_id = r.id', [ TIQWebLMBase(Owner).Pk_Ticket_Dtl_ID ]);
    if VarArrayDimCount( B ) > 0 then
    begin
      TIQWebLMBase(Owner).FRan       := B[ 0 ];
      TIQWebLMBase(Owner).FRel_CUser1:= B[ 1 ];
      TIQWebLMBase(Owner).FRel_CUser2:= B[ 2 ];
    end;
  end;

  {Shipped from}
  TIQWebLMBase(Owner).FCo_Addr1:= '';
  TIQWebLMBase(Owner).FCo_Addr2:= '';
  TIQWebLMBase(Owner).FCo_City := '';
  TIQWebLMBase(Owner).FCo_State:= '';
  TIQWebLMBase(Owner).FCo_Zip  := '';
  if TIQWebLMBase(Owner).FShip_To_ID > 0 then
  begin
    A:= SelectValueArrayFmt( 'select c.address1, c.address2, c.city, c.state, c.zip '+
                        '  from ship_to s, company c            '+
                        ' where s.id = %f                       '+
                        '   and s.eplant_id = c.eplant_id(+)    '+
                        '   and s.division_id = c.division_id(+)',
                        [ TIQWebLMBase(Owner).FShip_To_ID ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      TIQWebLMBase(Owner).FCo_Addr1:= A[ 0 ];
      TIQWebLMBase(Owner).FCo_Addr2:= A[ 1 ];
      TIQWebLMBase(Owner).FCo_City := A[ 2 ];
      TIQWebLMBase(Owner).FCo_State:= A[ 3 ];
      TIQWebLMBase(Owner).FCo_Zip  := A[ 4 ];
    end;
  end;
end;

procedure TFrmLM_Manu.AssignMfgLabelAllowedDecimal;
begin
  FIsMfgLabelAllowedDecimal:= SelectValueAsString('select LBL_ALLOW_DEC_MFG_QTY from params') = 'Y';
end;

procedure TFrmLM_Manu.EditBoxExit(Sender: TObject);
var
  AQtyReal: Real;
  AQtyInt : Integer;
begin
  // inherited;

  if Trim(EditBox.Text) = '' then
  begin
     EditBox.Text:= '0';
     EXIT;
  end;

  if not IQMS.Common.Numbers.IsStringValidFloat(EditBox.Text, AQtyReal) then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000130 {'Valid Box Quantity must be entered'} );

  if FIsMfgLabelAllowedDecimal then
     begin
       EditBox.Text:= FloatToStr( IQMS.Common.Numbers.IQRound( AQtyReal,2 ));
       FormatEditTextAsFloat(TUniEdit(Sender)); // iqlib
     end
  else
     begin
       EditBox.Text:= IntToStr( Trunc( AQtyReal ));
       FormatEditTextAsInteger(TUniEdit(Sender)); // iqlib
     end
end;


procedure TFrmLM_Manu.CheckAssignBoxQtyFromBolData;
var
  ALabelKind: TField;
begin
  if (wwLabels.DataSource.DataSet = nil) or (wwLabels.DataSource.DataSet.State = dsInactive) then
     EXIT;

  if SelectValueAsString('select lbl_use_inv_bol_data_pkg from params') <> 'Y' then
     EXIT;

  // EditBox.Text:= FloatToStr( SelectValueFmtAsFloat('select inv_trans_misc.get_default_ptsper( %f ) from dual', [ TLMBase(self.Owner).Arinvt_ID ]))

  ALabelKind:= wwLabels.DataSource.DataSet.FindField('LABEL_KIND');
  if not Assigned( ALabelKind ) then
     EXIT;

  if ALabelKind.asString = 'PALLET' then
     EditBox.Text:= SelectValueByID('pallet_ptsper', 'arinvt',TIQWebLMBase(self.Owner).Arinvt_ID )
  else
     EditBox.Text:= SelectValueByID('pk_ptsper', 'arinvt',TIQWebLMBase(self.Owner).Arinvt_ID )
end;


procedure TFrmLM_Manu.cmbShipToChange(Sender: TObject);
begin
  TIQWebLMBase(self.Owner).Ship_To_ID   := DM.QryShipTo.FieldByName('ID').asFloat;
  PopulateAkaItemno;
end;

end.
