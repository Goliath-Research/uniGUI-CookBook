//  PackSlip
unit demo_packingslips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBNavigator, uniButton, uniPanel, uniCheckBox,
  uniDBCheckBox, uniBitBtn, uniSpeedButton, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniDBEdit, uniSplitter, uniLabel,
  uniBasicGrid, uniDBGrid, uniPageControl, Vcl.Menus, uniMainMenu,
  uniGUIBaseClasses, uniImageList,
  demo_packingslips_dm, IQUniGrid, IQUniEditor, IQUniEditorDlg,
  IQUniEditorDlgPickDataSet, System.Actions, Vcl.ActnList,
  IQWeb.Session.RegServices, uniToolBar, uniMemo, uniDBMemo, uniGenericControl;

type
  TUniPackSlip = class(TUniFrame, IIQLocatable)
    UniImageList1: TUniImageList;
    pnlTop: TUniPanel;
    pnlMiddle: TUniPanel;
    pnlBottom: TUniPanel;
    UniToolBar2: TUniToolBar;
    UniDBNavigator2: TUniDBNavigator;
    UniDBGrid1: TUniDBGrid;
    UniToolButton15: TUniToolButton;
    UniToolButton16: TUniToolButton;
    UniToolButton17: TUniToolButton;
    pnlToolbar: TUniPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    pnlMemoTop: TUniPanel;
    pnlMemoBottom: TUniPanel;
    UniToolBar3: TUniToolBar;
    UniToolBar4: TUniToolBar;
    UniDBNavigator1: TUniDBNavigator;
    UniDBNavigator3: TUniDBNavigator;
    UniToolButton14: TUniToolButton;
    UniLabel1: TUniLabel;
    UniToolButton18: TUniToolButton;
    UniLabel2: TUniLabel;
    pnlColumn1: TUniPanel;
    pnlColumn2: TUniPanel;
    pnlColumn3: TUniPanel;
    pnlColumn4: TUniPanel;
    pnlColumn5: TUniPanel;
    pnlColumn6: TUniPanel;
    lblCustomer: TUniLabel;
    lblBillTo: TUniLabel;
    dbeCustomer: TUniDBEdit;
    dbeBillTo: TUniDBEdit;
    lblShipTo: TUniLabel;
    lblEplant: TUniLabel;
    lblPsDate: TUniLabel;
    dbeShipTo: TUniDBEdit;
    dbeEplant: TUniDBEdit;
    dbePsDate: TUniDBEdit;
    UniGenericControl2: TUniGenericControl;
    chkDoNotinvoice: TUniDBCheckBox;
    chkAwaitsInventoryVerification: TUniDBCheckBox;
    UniGenericControl3: TUniGenericControl;
    UniGenericControl4: TUniGenericControl;
    UniGenericControl5: TUniGenericControl;
    UniGenericControl6: TUniGenericControl;
    lblShipVia: TUniLabel;
    lblShipDays: TUniLabel;
    lblShipDate: TUniLabel;
    lblFob: TUniLabel;
    lblPalletCount: TUniLabel;
    lblUserText1: TUniLabel;
    lblNote: TUniLabel;
    dbeShipVia: TUniDBEdit;
    dbeShipDays: TUniDBEdit;
    dbeFob: TUniDBEdit;
    dbePalletCount: TUniDBEdit;
    dbeUserText1: TUniDBEdit;
    dbeNote: TUniDBEdit;
    lblFreightCharge: TUniLabel;
    lblTerms: TUniLabel;
    lblTrackingNumber: TUniLabel;
    lblTruckLoadNumber: TUniLabel;
    lblBolNote: TUniLabel;
    lblBatch: TUniLabel;
    lblPoolBillNumber: TUniLabel;
    dbeBatch: TUniDBEdit;
    dbeTruckLoadNumber: TUniDBEdit;
    dbeTrackingNumber: TUniDBEdit;
    dbeFreightCharge: TUniDBEdit;
    dbeTerms: TUniDBEdit;
    dbeBolNote: TUniDBMemo;
    dbePoolBillNumber: TUniDBMemo;
    UniDBMemo3: TUniDBMemo;
    UniDBMemo4: TUniDBMemo;
    dbeShipDate: TUniDBEdit;
    pnlColorTiles: TUniPanel;
    swatchNegShipment: TUniPanel;
    swatchOverinvoiced: TUniPanel;
    swatchPartialInvoiced: TUniPanel;
    swatchNotInvoiced: TUniPanel;
    swatchInvoiced: TUniPanel;
    UniToolBar1: TUniToolBar;
    UniToolButton1: TUniToolButton;
    UniToolButton2: TUniToolButton;
    UniToolButton3: TUniToolButton;
    UniToolButton4: TUniToolButton;
    UniToolButton5: TUniToolButton;
    UniToolButton6: TUniToolButton;
    UniToolButton7: TUniToolButton;
    UniToolButton8: TUniToolButton;
    UniToolButton9: TUniToolButton;
    UniToolButton10: TUniToolButton;
    UniToolButton11: TUniToolButton;
    UniToolButton12: TUniToolButton;
    UniToolButton13: TUniToolButton;
    PkrHeader: TIQUniEditorDlgPickDataSet;
    lblPSNo: TUniLabel;
    UniGenericControl1: TUniGenericControl;
    uniDBEdtPackslipNo: TUniDBEdit;
    UniPanel2: TUniPanel;
    UniDBNavigator5: TUniDBNavigator;


    procedure UniFrameDestroy(Sender: TObject);
    procedure UniSpeedButtonSearchClick(Sender: TObject);
    procedure FreightPickerDialogResult(Sender: TObject;
      Intf: IIQEditorDialog; var Handled: Boolean);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniDBGrid1DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure PkrHeaderDialogResult(Sender: TObject; Intf: IIQEditorDialog;
      var Handled: Boolean);
    procedure UniToolButton1Click(Sender: TObject);
  private
    { Private declarations }
    DemoPackSlip_DM: TDemoPackSlip_DM;
    procedure LocateID(aID : integer);
  public
    { Public declarations }
  end;

implementation

uses
  Main;

{$R *.dfm}

procedure TUniPackSlip.LocateID(aID: integer);
begin
  DemoPackSlip_DM.SrcPSHeader.DataSet.Locate('ID', aID, []);
end;

procedure TUniPackSlip.PkrHeaderDialogResult(Sender: TObject;
  Intf: IIQEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
  begin
    DemoPackSlip_DM.FDQryPSHeader.Locate('ID', Intf.DialogValue, []);
    Handled := true;
  end;
end;

procedure TUniPackSlip.UniDBGrid1DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
      with TUniDBGrid(Sender).DataSource.DataSet do
    begin
      if FieldByName('QTYSHIPPED').asFloat = FieldByName('INVOICED_QTY').asFloat then
      begin
        //clLime
        Attribs.Color      := swatchInvoiced.Color;
        Attribs.Font.Color := clBlack;
      end;

      if FieldByName('INVOICED_QTY').asFloat = 0 then
      begin
        //clPurple
        Attribs.Color      := swatchNotInvoiced.Color;
        Attribs.Font.Color := clWhite;
      end;

      if (FieldByName('INVOICED_QTY').asFloat <> 0) and
        (FieldByName('INVOICED_QTY').asFloat < FieldByName('QTYSHIPPED').asFloat)
      then
      begin
        //clYellow
        Attribs.Color      := swatchPartialInvoiced.Color;
        Attribs.Font.Color := clBlack;
      end;

      if FieldByName('INVOICED_QTY').asFloat > FieldByName('QTYSHIPPED').asFloat
      then
      begin
        //clRed
        Attribs.Color      := swatchOverinvoiced.Color;
        Attribs.Font.Color := clBlack;
      end;

      if FieldByName('QTYSHIPPED').asFloat < 0 then
      begin
        //clTeal
        Attribs.Color      := swatchNegShipment.Color;
        Attribs.Font.Color := clBlack;
      end;
    end;

end;

procedure TUniPackSlip.UniFrameCreate(Sender: TObject);
var
  I : integer;
begin
  DemoPackSlip_DM := demo_packingslips_dm._DemoPackSlip_DM;
  DemoPackSlip_DM.Initialize;

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TUniPageControl then
      TUniPageControl(Components[I]).ActivePageIndex := 0;
  end;
end;

procedure TUniPackSlip.UniFrameDestroy(Sender: TObject);
begin
  DemoPackSlip_DM.Finalize;
end;

procedure TUniPackSlip.UniSpeedButtonSearchClick(Sender: TObject);
begin
  //with SVM_DM do
  //  if QryFreight.RecordCount > 0 then
  //    FreightPicker.Text := QryFreightID.AsString;

  //FreightPicker.ExecTrigger(1);
end;

procedure TUniPackSlip.UniToolButton1Click(Sender: TObject);
begin
  with DemoPackSlip_DM do
    if FDQryShipDetailID.asFloat > 0 then
      PkrHeader.Text := FDQryShipDetailID.AsString;

  PkrHeader.ExecTrigger(1);
end;

procedure TUniPackSlip.FreightPickerDialogResult(
  Sender: TObject; Intf: IIQEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
  begin
    //PackSlipSVM_DM.QryFreight.Locate('ID', Intf.DialogValue, []);

    Handled := true;
  end;
end;

initialization
  RegisterClass(TUniPackSlip);

end.
