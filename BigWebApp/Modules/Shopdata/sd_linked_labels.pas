unit sd_linked_labels;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Mask,
  System.Math,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.LargeGrid,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.CaptionPanel,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  { TFrmSdLinkedLabels }
  TFrmSdLinkedLabels = class(TUniForm)
    SrcItemInfo: TDataSource;
    QryItemInfo: TFDQuery;
    QryItemInfoITEMNO: TStringField;
    QryItemInfoDESCRIP: TStringField;
    QryItemInfoDESCRIP2: TStringField;
    QryItemInfoCLASS: TStringField;
    QryItemInfoREV: TStringField;
    QryItemInfoLOC_DESC: TStringField;
    QryItemInfoLOTNO: TStringField;
    SrcMaster_Label: TDataSource;
    QryMaster_Label: TFDQuery;
    QryMaster_LabelSERIAL: TStringField;
    QryMaster_LabelQTY: TFMTBCDField;
    QryMaster_LabelDISPO_DATE: TDateTimeField;
    QryMaster_LabelPARENT_SERIAL: TStringField;
    QryMaster_LabelFG_LOTNO: TStringField;
    QryMaster_LabelPRINT_DATE: TDateTimeField;
    QryMaster_LabelID: TBCDField;
    QryMaster_LabelPARENT_ID: TBCDField;
    SrcArinvtForTrans: TDataSource;
    QryArinvtForTrans: TFDQuery;
    PnlGrid: TUniPanel;
    Grid: TIQWebTouchScreenGrid;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlSerial: TUniPanel;
    PnlSerialClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlSerialLeft01: TUniPanel;
    PnlSerialClient02: TUniPanel;
    lblFilterLabel: TUniLabel;
    edtSerial: TUniEdit;
    btnSelect: TUniBitBtn;
    PkSerial: TIQWebHPick;
    PkSerialID: TBCDField;
    PkSerialSERIAL: TStringField;
    PkSerialQTY: TFMTBCDField;
    PkSerialDISPO_DATE: TDateTimeField;
    PkSerialPARENT_ID: TBCDField;
    PkSerialPARENT_SERIAL: TStringField;
    PkSerialFG_LOTNO: TStringField;
    PkSerialPRINT_DATE: TDateTimeField;
    btnKeyboard: TUniBitBtn;
    PnlHeader: TUniPanel;
    PnlInventoryItem: TUniPanel;
    PnlInventoryInfoCaption: TUniPanel;
    lblInventoryInfoCaption: TUniLabel;
    PnlInventoryClient01: TUniPanel;
    PnlInventoryLeft01: TUniPanel;
    lblInventoryItemno: TUniLabel;
    lblInventoryDescrip: TUniLabel;
    lblInventoryDescrip2: TUniLabel;
    lblInventoryClass: TUniLabel;
    lblInventoryRev: TUniLabel;
    PnlInventoryClient02: TUniPanel;
    dbeInventoryItemno: TUniDBEdit;
    dbeInventoryDescrip: TUniDBEdit;
    dbeInventoryDescrip2: TUniDBEdit;
    dbeInventoryClass: TUniDBEdit;
    dbeInventoryRev: TUniDBEdit;
    PnlLocation: TUniPanel;
    PnlLocationCaption: TUniPanel;
    lblLocationCaption: TUniLabel;
    PnlLocationClient01: TUniPanel;
    PnlLocationLeft01: TUniPanel;
    lblLocation: TUniLabel;
    lblLotno: TUniLabel;
    PnlLocationClient02: TUniPanel;
    dbeLocation: TUniDBEdit;
    dbeLotno: TUniDBEdit;
    Splitter2: TUniSplitter;
    btnApplyFilter: TUniBitBtn;
    btnClear: TUniBitBtn;
    CaptionPanel1: TIQWebCaptionPanel;
    Panel1: TUniPanel;
    lblSelected: TUniLabel;
    PnlSearchControls: TUniPanel;
    PnlMultiSelectControls: TUniPanel;
    Bevel2: TUniPanel;
    btnSelectAll: TUniBitBtn;
    btnUnselectAll: TUniBitBtn;
    procedure QryItemInfoBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtForTransBeforeOpen(DataSet: TDataSet);
    procedure QryMaster_LabelBeforeOpen(DataSet: TDataSet);
    procedure DoGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoSelectSerialClick(Sender: TObject);
    procedure btnKeyboardClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnApplyFilterClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtSerialKeyPress(Sender: TObject; var Key: Char);
    procedure PnlSerialLeft01Click(Sender: TObject);
    procedure edtSerialChange(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    private
      { Private declarations }
      procedure IQAfterShowMessage(var Msg: TMessage);
        message iq_AfterShowMessage;
      procedure IQNotify( var Msg: TMessage ); message iq_Notify;
      procedure ResizeItemInfo;
      procedure UpdateSelectedCountLabel;
    procedure FixSerialNumber;
    protected
      FFGMulti_ID: Real;
      FArinvt_ID: Real;
      procedure SetFGMulti_ID(const Value: Real);
      procedure Validate; virtual;
      procedure CheckSameLotNumber;
      procedure SetControls;
      procedure ClearSerial;
      procedure EnsureSerialFocused;
    public
      { Public declarations }
      class function DoShowModal(AFGMulti_ID: Real)
        : Boolean;
      procedure GetSelected(var AList: TStringList;
        var ATotalQuantity: Real);
      property FGMulti_ID: Real read FFGMulti_ID write SetFGMulti_ID;
      property Arinvt_ID: Real read FArinvt_ID write FArinvt_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  { TODO -oSanketG -cWC : Need to revisit }
  //iqrf.share,
  //IQSecIns,
  shopdata_rscstr
  { TODO -oSanketG -cWC : Need to revisit }
  //touchscrn
  ;

const
  UM_ENSUREFOCUS = 1;
  UM_SETCONTROLS = 2;
  UM_PROCESS_SCAN = 3;

{ TFrmSdLinkedLabelsAdd }

procedure TFrmSdLinkedLabels.UniFormCreate(Sender: TObject);
begin
  FArinvt_ID := 0;
  { TODO -oSanketG -cWC : Need to find alternative for OnMouseUp,MultiSelectOptions in TIQUniGridControl,
  [dcc32 Error] sd_linked_labels.pas(200): E2003 Undeclared identifier: 'MultiSelectOptions' }
  //Grid.Grid.MultiSelectOptions := [];
  //Grid.Grid.OnMouseUp := DoGridMouseUp;

  IQSetTablesActive(TRUE, self);
  { TODO -oSanketG -cWC : Need to revisit,
  [dcc32 Error] sd_linked_labels.pas(205): E2010 Incompatible types: 'TForm' and 'TFrmSdLinkedLabels' }
  //IQMS.Common.Controls.CenterForm(self);

  // 07/17/2012 Ensure touch-screen font applied.
  { TODO -oSanketG -cWC : Need to revisit, dependent on touchscrn }
  //touchscrn.ApplyTouchscreenFont(Self);

end;

class function TFrmSdLinkedLabels.DoShowModal(
  AFGMulti_ID: Real): Boolean;
var
  FrmSdLinkedLabels: TFrmSdLinkedLabels;
begin
  FrmSdLinkedLabels := self.Create( uniGUIApplication.UniApplication);
  with FrmSdLinkedLabels do
  begin
    try
      FGMulti_ID := AFGMulti_ID;
      Result := ShowModal = mrOK;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmSdLinkedLabels.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on iqsecins}
  //EnsureSecurityInspectorOnTopOf(self); { IQSecIns.pas }
  //PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmSdLinkedLabels.IQAfterShowMessage(var Msg: TMessage);
begin
  ResizeItemInfo;
  ClearSerial;
end;

procedure TFrmSdLinkedLabels.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
   UM_ENSUREFOCUS: Self.EnsureSerialFocused;
   UM_SETCONTROLS: Self.SetControls;
   UM_PROCESS_SCAN:
     begin
       FixSerialNumber;
       ReOpen(QryMaster_Label);
       if QryMaster_Label.Locate('SERIAL', edtSerial.Text, [loCaseInsensitive]) then
         btnOkClick(btnOk);
     end;
  end;
end;

procedure TFrmSdLinkedLabels.edtSerialChange(Sender: TObject);
begin
//  if Showing and not (csDestroying in ComponentState) then
//    begin
//      FixSerialNumber;
//      SetControls;
//    end;
end;

procedure TFrmSdLinkedLabels.edtSerialKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in [ #10, #13 ] then
     begin
       Key := #0;
       PostMessage(Handle, iq_Notify, UM_PROCESS_SCAN, 0);
     end
  else if (Key = #27 {ESCAPE} ) then
    ClearSerial;
  PostMessage(Handle, iq_Notify, UM_SETCONTROLS, 0);

(*  if Key in [ #10, #13 ] then
     begin
       Key := #0;
       FixSerialNumber;
       if not QryMaster_Label.Active then
         QryMaster_Label.Open;
       if QryMaster_Label.Locate('SERIAL', edtSerial.Text, [loCaseInsensitive]) then
         btnOkClick(btnOk);
     end
  else if (Key = #27 {ESCAPE} ) then
     ClearSerial;*)
end;

procedure TFrmSdLinkedLabels.FixSerialNumber;
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on iqrf.share}
  //edtSerial.Text := iqrf.share.StripSerialPrefix(edtSerial.Text);
end;

procedure TFrmSdLinkedLabels.PnlSerialLeft01Click(Sender: TObject);
begin
  PostMessage(Handle, iq_Notify, UM_ENSUREFOCUS, 0);
end;

procedure TFrmSdLinkedLabels.GetSelected(var AList: TStringList;
 var ATotalQuantity: Real);
var
  I: Integer;
begin
  ATotalQuantity := 0;

  if not Assigned(AList) then
    Exit;

  AList.Clear;

  with Grid, Grid.DataSource do
    try
      DataSet.DisableControls;
      if DataSet.Eof and DataSet.Bof then
        EXIT;
      { TODO -oSanketG -cWC : Need to find alternative for SelectedList in TIQUniGridControl }
      {if Grid.SelectedList.Count > 0 then
        for I := 0 to Grid.SelectedList.Count - 1 do
          begin
            DataSet.GotoBookmark(Grid.SelectedList.Items[I]);
            AList.Add(DataSet.FieldByName('ID').AsString);
            if (DataSet.FindField('QTY') <> nil) then
              ATotalQuantity := ATotalQuantity + DataSet.FieldByName('QTY').AsFloat;
          end
      else
        begin
          AList.Add(DataSet.FieldByName('ID').AsString);
          if (DataSet.FindField('QTY') <> nil) then
            ATotalQuantity := DataSet.FieldByName('QTY').AsFloat;
        end;}
    finally
      DataSet.EnableControls;
    end;
end;

procedure TFrmSdLinkedLabels.ResizeItemInfo;
const
  C_BUFFER = 32;
var
  I, w: Integer;
begin
  // Inventory Item
  w := 102;
  for I := 0 to PnlInventoryLeft01.ControlCount - 1 do
    if PnlInventoryLeft01.Controls[I] is TUniLabel then
      w := Max(w, TUniLabel(PnlInventoryLeft01.Controls[I]).Width);

  // Location
  w := 102;
  for I := 0 to PnlLocationLeft01.ControlCount - 1 do
    if PnlLocationLeft01.Controls[I] is TUniLabel then
      w := Max(w, TUniLabel(PnlLocationLeft01.Controls[I]).Width);

  // Set panel width
  PnlInventoryLeft01.Width := w + C_BUFFER;
  PnlLocationLeft01.Width := PnlInventoryLeft01.Width;

  // IQMS.Common.Controls.Adjus
end;

procedure TFrmSdLinkedLabels.SetFGMulti_ID(const Value: Real);
begin
  FFGMulti_ID := Value;
  if (Value > 0) and (FArinvt_ID = 0) then
    FArinvt_ID := SelectValueByID('arinvt_id', 'fgmulti', FFGMulti_ID);
end;

procedure TFrmSdLinkedLabels.QryItemInfoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'fgmulti_id', FGMulti_ID);
end;

procedure TFrmSdLinkedLabels.QryArinvtForTransBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'arinvt_id', Arinvt_ID);
end;

procedure TFrmSdLinkedLabels.QryMaster_LabelBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'fgmulti_id', FGMulti_ID);
end;

procedure TFrmSdLinkedLabels.DoGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  { TODO -oSanketG -cWC :  Need to find alternative for IsSelected,UnselectRecord in TIQUniGridControl }
  {if Grid.Grid.IsSelected then
    Grid.Grid.UnselectRecord
  else
    Grid.Grid.SelectRecord;}
  UpdateSelectedCountLabel;
end;

procedure TFrmSdLinkedLabels.DoSelectSerialClick(Sender: TObject);
begin
  with PkSerial do
    if Execute then
      begin
        edtSerial.Text := GetValue('SERIAL');
        TFDQuery(Grid.DataSource.DataSet).Locate('SERIAL', edtSerial.Text, []);
      end;
  PostMessage(Handle, iq_Notify, UM_SETCONTROLS, 0);
  PostMessage(Handle, iq_Notify, UM_ENSUREFOCUS, 0);
end;

procedure TFrmSdLinkedLabels.btnKeyboardClick(Sender: TObject);
var
  S: string;
begin
  FixSerialNumber;
  S := edtSerial.Text;
  { TODO -oSanketG -cWC : Need to revisit , dependent on touchscreen}
  {if touchscrn.TouchScreen_Keyboard(self, S, 9, '') then
    begin
      edtSerial.Text := S;
      FixSerialNumber;
    end;}
  PostMessage(Handle, iq_Notify, UM_SETCONTROLS, 0);
  PostMessage(Handle, iq_Notify, UM_ENSUREFOCUS, 0);
end;

procedure TFrmSdLinkedLabels.btnOkClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOK;
end;

procedure TFrmSdLinkedLabels.UpdateSelectedCountLabel;
var
  I: Integer;
begin
  Application.ProcessMessages;
  { TODO -oSanketG -cWC :  Need to find alternative for SelectedList in TIQUniGridControl }
  //I := Grid.Grid.SelectedList.Count;
  lblSelected.Caption :=
    Format(shopdata_rscstr.cTXT0000119 { 'Selected:  %d' } , [I]);
end;

procedure TFrmSdLinkedLabels.Validate;
begin
  // nothing
end;

procedure TFrmSdLinkedLabels.SetControls;
begin
  btnApplyFilter.Enabled := Trim(edtSerial.Text) > '';
end;

procedure TFrmSdLinkedLabels.btnClearClick(Sender: TObject);
begin
  ClearSerial;
end;

procedure TFrmSdLinkedLabels.btnApplyFilterClick(Sender: TObject);
begin
  FixSerialNumber;
  { TODO -oSanketG -cWC : Need to find alternative for SelectedList,UnselectAll in TIQUniGridControl ,
  dependent on touchscrn}
  {if (Grid.Grid.SelectedList.Count > 0) and
  // 'Your current selection will be cleared.  Do you want to continue?'
    not touchscrn.TouchScreen_Msg_ConfirmYN(shopdata_rscstr.cTXT0000120) then
    EXIT;

  if Grid.Grid.SelectedList.Count > 0 then
    Grid.Grid.UnselectAll; }
  UpdateSelectedCountLabel;

  // Apply filter
  TFDQuery(Grid.DataSource.DataSet).Filter := Format('SERIAL = ''%s''', [edtSerial.Text]);
  TFDQuery(Grid.DataSource.DataSet).Filtered := Length(Trim(edtSerial.Text)) > 0;

  PostMessage(Handle, iq_Notify, UM_SETCONTROLS, 0);
  PostMessage(Handle, iq_Notify, UM_ENSUREFOCUS, 0);

end;

procedure TFrmSdLinkedLabels.btnSelectAllClick(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to find alternative for selectAll in TIQUniGridControl }
  //Grid.Grid.SelectAll;
  UpdateSelectedCountLabel;
end;

procedure TFrmSdLinkedLabels.btnUnselectAllClick(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to find alternative for UnselectAll in TIQUniGridControl }
  //Grid.Grid.UnselectAll;
  UpdateSelectedCountLabel;
end;

procedure TFrmSdLinkedLabels.CheckSameLotNumber;
var
  AFG_LotNo: string;
  i: Integer;
begin
  // check fg_lotno to be the same for all selected records
  with Grid, Grid.DataSource do
    try
      DataSet.DisableControls;
      if DataSet.EOF and DataSet.BOF then
        EXIT;
      { TODO -oSanketG -cWC : Need to find alternative for SelectedList in TIQUniGridControl ,
      dependent on touchscrn}
      {if Grid.SelectedList.Count > 0 then
        for i := 0 to Grid.SelectedList.Count - 1 do
          begin
            DataSet.GotoBookmark(Grid.SelectedList.Items[i]);
            if I = 0 then
              AFG_LotNo := DataSet.FieldByName('fg_lotno').asString;

            if (DataSet.FieldByName('fg_lotno').AsString <> AFG_LotNo) then
              begin
                // 'The selected labels must all have the same lot number.  Cannot continue.'
                touchscrn.TouchScreen_Msg_Error(shopdata_rscstr.cTXT0000125);
                System.SysUtils.Abort;
              end;
          end;}
    finally
      DataSet.EnableControls;
    end;
end;

procedure TFrmSdLinkedLabels.ClearSerial;
begin
  edtSerial.Clear;
  PostMessage(Handle, iq_Notify, UM_SETCONTROLS, 0);
  PostMessage(Handle, iq_Notify, UM_ENSUREFOCUS, 0);
end;

procedure TFrmSdLinkedLabels.EnsureSerialFocused;
begin
  if Showing then
  try
     if edtSerial.CanFocus then
        edtSerial.SetFocus;
  except // suppress
  end;
end;

end.
