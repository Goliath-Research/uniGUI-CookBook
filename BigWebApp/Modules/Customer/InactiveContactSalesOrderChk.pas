unit InactiveContactSalesOrderChk;

{ ** History **

  01/11/2011
    This form was added (Byron) as part of SCR 1799.
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
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
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu,
  uniLabel, uniImage, uniRadioGroup, uniGUIFrame, IQUniGrid;

type
  TFrmInactiveContactSalesOrderCheck = class(TUniForm)
    Panel1: TUniPanel;
    PnlGrid: TUniPanel;
    SrcHeader: TDataSource;
    QryHeader: TFDQuery;
    QryHeaderCUSTNO: TStringField;
    QryHeaderCOMPANY: TStringField;
    QryHeaderNAME: TStringField;
    SrcOrders: TDataSource;
    QryOrders: TFDQuery;
    IQSearch1: TIQUniGridControl;
    QryOrdersORDERNO: TStringField;
    QryOrdersDATE_TAKEN: TDateTimeField;
    QryOrdersBILL_TO_ATTN: TStringField;
    QryOrdersSHIP_TO_ATTN: TStringField;
    QryOrdersFREIGHT: TStringField;
    PkContact: TIQWebHPick;
    PkContactID: TFloatField;
    PkContactSALUTATION: TStringField;
    PkContactLAST_NAME: TStringField;
    PkContactFIRST_NAME: TStringField;
    PkContactTITLE: TStringField;
    PkContactPHONE_NUMBER: TStringField;
    PkContactEXT: TStringField;
    PkContactFAX_NUMBER: TStringField;
    PkContactEMAIL: TStringField;
    PkContactPAGER: TStringField;
    PkContactMOBILE: TStringField;
    PkContactPK_HIDE: TStringField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    Button1: TUniButton;
    PnlActions: TUniPanel;
    rgActions: TUniRadioGroup;
    PMain: TUniPopupMenu;
    JumptoSalesOrder1: TUniMenuItem;
    QryOrdersID: TBCDField;
    JOrder: TIQWebJump;
    SR: TIQWebSecurityRegister;
    PnlHeader: TUniPanel;
    PnlImage: TUniPanel;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    imgWarning: TUniImage;
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure btnOkClick(Sender: TObject);
    procedure JumptoSalesOrder1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FArcustoID,
    FContactID: Real;
    procedure SetCaption;
    procedure ReplaceContact;
    procedure ClearContact;
    procedure SetArcustoID(const Value: Real);
    procedure SetContactID(const Value: Real);
  public
    { Public declarations }
    property ArcustoID : Real write SetArcustoID;
    property ContactID : Real write SetContactID;
  end;

  { This form is designed to be used within Customer Maintenance or
    Customer Central, or any place where a contact can be flagged as
    "Inactive."  After setting PK_HIDE = Y, call these methods to determine
    what do about Sales Orders assigned to this contact:

    Example:

    if not CheckContactOrdersBeforeSettingInactive(Self,
       QryArcustoID.AsFloat, QryContactID.AsFloat) then
       SysUtils.Abort;

  }
  function CheckContactOrdersBeforeSettingInactive(AArcustoID, AContactID: Real): Boolean;

implementation

{$R *.dfm}

uses
  cust_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  { TODO : IQSecIns not converted yet }
  //IQSecIns,
  IQMS.Common.PanelMsg;

function ContactHasOrders(AContactID: Real): Boolean;
begin
  Result := SelectValueFmtAsFloat('SELECT 1'#13 +
                            '  FROM orders'#13 +
                            ' WHERE (contact_id = %.0f OR'#13 +
                            '        contact_id2 = %.0f) AND'#13 +
                            '       ROWNUM < 2',
                            [AContactID, AContactID]) = 1;
end;

function CheckContactOrdersBeforeSettingInactive(AArcustoID, AContactID: Real): Boolean;
var
  LFrmInactiveContactSalesOrderCheck : TFrmInactiveContactSalesOrderCheck;
begin
  Result := not ContactHasOrders(AContactID);

  if not Result then
  LFrmInactiveContactSalesOrderCheck := TFrmInactiveContactSalesOrderCheck.Create(UniGUIApplication.UniApplication);
  with LFrmInactiveContactSalesOrderCheck do
  begin
    ArcustoID := AArcustoID;
    ContactID := AContactID;
     if not (QryOrders.BOF and QryOrders.EOF) then
        Result := ShowModal = mrOk
     else
        Result := True;
  end;
end;

procedure TFrmInactiveContactSalesOrderCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmInactiveContactSalesOrderCheck.FormShow(Sender: TObject);
begin
  ReOpen(QryHeader);
  ReOpen(QryOrders);
  SetCaption;
  { TODO : Incompatible types: 'TForm' and 'TFrmInactiveContactSalesOrderCheck' }
  //IQMS.Common.Controls.CenterForm(Self);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
{ TODO : IQSecIns not converted yet }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmInactiveContactSalesOrderCheck.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmInactiveContactSalesOrderCheck.SetCaption;
begin
  Caption := Format('Set Contact Inactive - %s, %s',
   [QryHeaderNAME.AsString, QryHeaderCOMPANY.AsString]);
end;

procedure TFrmInactiveContactSalesOrderCheck.SetContactID(const Value: Real);
begin
  FContactID := Value;
end;

procedure TFrmInactiveContactSalesOrderCheck.DoBeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
   begin
     if Params.FindParam('ID') <> NIL then
        ParamByName('ID').Value := FContactID;
     if Params.FindParam('ARCUSTO_ID') <> NIL then
        ParamByName('ARCUSTO_ID').Value := FArcustoID;
   end;
end;

procedure TFrmInactiveContactSalesOrderCheck.ReplaceContact;
var
   hMsg: TPanelMesg;
   ANewContactID: Real;
begin
  hMsg := NIL;

  // Let button click finish
  Application.ProcessMessages;

  // Replace the contact on Sales Orders
  with PkContact do
   if Execute and
      {'Replace the contact on all Sales Orders?  ' +
       'You will not be able to undo this action.'}
      IQConfirmYN(cust_rscstr.cTXT0000001) then
      try
         ANewContactID := GetValue('ID');
         // 'Replacing contact references.  Please wait.'
         hMsg := hPleaseWait(cust_rscstr.cTXT0000002);
         ExecuteCommandFmt(
           'BEGIN'#13 +
           '   iqms.arcusto_misc.replace_contact_on_orders(%.0f,%.0f);'#13 +
           'END;',
           [FContactID, ANewContactID]);
         ModalResult := mrOk;
       finally
          if Assigned(hMsg) then FreeAndNil(hMsg);
       end;
end;

procedure TFrmInactiveContactSalesOrderCheck.ClearContact;
var
   hMsg: TPanelMesg;
begin
  hMsg := NIL;

  // Let button click finish
  Application.ProcessMessages;

  // Clear the contact on Sales Orders
  {'The contact will be cleared on all Sales Orders ' +
    'that are assigned to this contact.  You will not be able to undo ' +
    'this action.  Do you want to continue?'}
  if IQConfirmYN(cust_rscstr.cTXT0000003) then
    try
       //
       hMsg := hPleaseWait(cust_rscstr.cTXT0000004);
       ExecuteCommandFmt(
         'BEGIN'#13 +
         '   iqms.arcusto_misc.clear_contact_on_orders(%.0f);'#13 +
         'END;',
         [FContactID]);
       ModalResult := mrOk;
     finally
       if Assigned(hMsg) then FreeAndNil(hMsg);
     end;
end;

procedure TFrmInactiveContactSalesOrderCheck.btnOkClick(Sender: TObject);
begin
  case rgActions.ItemIndex of
   0: ReplaceContact;
   1: ClearContact;
   2: ModalResult := mrOk;
  end;
end;

procedure TFrmInactiveContactSalesOrderCheck.JumptoSalesOrder1Click(Sender: TObject);
begin
  if QryOrdersID.AsFloat > 0 then
     JOrder.Execute;
end;

procedure TFrmInactiveContactSalesOrderCheck.PMainPopup(Sender: TObject);
begin
  JumptoSalesOrder1.Enabled := (QryOrdersID.AsFloat > 0) and
   SR.Enabled['JumptoSalesOrder1'];
end;

end.
