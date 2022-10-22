unit shipman_quantum_view;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Mask,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmQuantumView = class(TUniForm)
    pnlMain: TUniPanel;
    pnlTop: TUniPanel;
    pnlBottom: TUniPanel;
    grpRecipients: TUniGroupBox;
    grpTypes: TUniGroupBox;
    pnlButtons: TUniPanel;
    grpOptions: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbeCompany1: TUniDBEdit;
    dbeContact1: TUniDBEdit;
    dbeCompany2: TUniDBEdit;
    dbeContact2: TUniDBEdit;
    dbeCompany3: TUniDBEdit;
    dbeContact3: TUniDBEdit;
    dbeCompany4: TUniDBEdit;
    dbeContact4: TUniDBEdit;
    dbeCompany5: TUniDBEdit;
    dbeContact5: TUniDBEdit;
    Label4: TUniLabel;
    dbeShipFrom: TUniDBEdit;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    dbeMemo: TUniDBEdit;
    dbeFailEmail: TUniDBEdit;
    chkShip1: TUniDBCheckBox;
    lblShip: TUniLabel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    cmbSubject: TUniDBComboBox;
    chkShip2: TUniDBCheckBox;
    chkShip3: TUniDBCheckBox;
    chkShip4: TUniDBCheckBox;
    chkShip5: TUniDBCheckBox;
    chkException1: TUniDBCheckBox;
    chkException2: TUniDBCheckBox;
    chkException3: TUniDBCheckBox;
    chkException4: TUniDBCheckBox;
    chkException5: TUniDBCheckBox;
    chkDelivery2: TUniDBCheckBox;
    chkDelivery4: TUniDBCheckBox;
    chkDelivery5: TUniDBCheckBox;
    chkDelivery1: TUniDBCheckBox;
    chkDelivery3: TUniDBCheckBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    qryQuantumView: TFDQuery;
    qryQuantumViewID: TBCDField;
    qryQuantumViewSOURCE: TStringField;
    qryQuantumViewSOURCE_ID: TBCDField;
    qryQuantumViewSHIP_FROM_NAME: TStringField;
    qryQuantumViewFAIL_EMAIL: TStringField;
    qryQuantumViewSUBJECT_TYPE: TBCDField;
    qryQuantumViewSUBJECT: TStringField;
    qryQuantumViewMEMO: TStringField;
    qryQuantumViewCOMPANY1: TStringField;
    qryQuantumViewCONTACT1: TStringField;
    qryQuantumViewEMAIL1: TStringField;
    qryQuantumViewSHIP1: TStringField;
    qryQuantumViewEXCEPTION1: TStringField;
    qryQuantumViewDELIVERY1: TStringField;
    qryQuantumViewCOMPANY2: TStringField;
    qryQuantumViewCONTACT2: TStringField;
    qryQuantumViewEMAIL2: TStringField;
    qryQuantumViewSHIP2: TStringField;
    qryQuantumViewEXCEPTION2: TStringField;
    qryQuantumViewDELIVERY2: TStringField;
    qryQuantumViewCOMPANY3: TStringField;
    qryQuantumViewCONTACT3: TStringField;
    qryQuantumViewEMAIL3: TStringField;
    qryQuantumViewSHIP3: TStringField;
    qryQuantumViewEXCEPTION3: TStringField;
    qryQuantumViewDELIVERY3: TStringField;
    qryQuantumViewCOMPANY4: TStringField;
    qryQuantumViewCONTACT4: TStringField;
    qryQuantumViewEMAIL4: TStringField;
    qryQuantumViewSHIP4: TStringField;
    qryQuantumViewEXCEPTION4: TStringField;
    qryQuantumViewDELIVERY4: TStringField;
    qryQuantumViewCOMPANY5: TStringField;
    qryQuantumViewCONTACT5: TStringField;
    qryQuantumViewEMAIL5: TStringField;
    qryQuantumViewSHIP5: TStringField;
    qryQuantumViewEXCEPTION5: TStringField;
    qryQuantumViewDELIVERY5: TStringField;
    srcQuantumView: TDataSource;
    UpdateSQLPkgQuantumView: TFDUpdateSQL;
    qryQuantumViewRETURN: TStringField;
    lblInTransit: TUniLabel;
    chkTransit1: TUniDBCheckBox;
    chkTransit2: TUniDBCheckBox;
    chkTransit3: TUniDBCheckBox;
    chkTransit4: TUniDBCheckBox;
    chkTransit5: TUniDBCheckBox;
    qryQuantumViewINTRANSIT1: TStringField;
    qryQuantumViewINTRANSIT2: TStringField;
    qryQuantumViewINTRANSIT3: TStringField;
    qryQuantumViewINTRANSIT4: TStringField;
    qryQuantumViewINTRANSIT5: TStringField;
    PKShipToContact: TIQWebHPick;
    PKShipToContactATTN: TStringField;
    PKShipToContactFIRST_NAME: TStringField;
    PKShipToContactLAST_NAME: TStringField;
    PKShipToContactEMAIL: TStringField;
    dbeEmail1: TUniEdit;
    PKShipToContactCONTACT: TStringField;
    dbeEmail2: TUniEdit;
    dbeEmail3: TUniEdit;
    dbeEmail4: TUniEdit;
    dbeEmail5: TUniEdit;
    procedure qryQuantumViewBeforeOpen(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure qryQuantumViewAfterPost(DataSet: TDataSet);
    procedure qryQuantumViewBeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PKShipToContactBeforeOpen(DataSet: TDataSet);
    procedure dbeEmail1CustomDlg(Sender: TObject);
    procedure dbeEmail2CustomDlg(Sender: TObject);
    procedure dbeEmail3CustomDlg(Sender: TObject);
    procedure dbeEmail4CustomDlg(Sender: TObject);
    procedure dbeEmail5CustomDlg(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FID: Real;
    FArcustoID: Real;
    procedure SetArcustoID(const Value: Real);
    procedure SetID(const Value: Real);
  public
    class procedure Execute( AID: Real; AArcustoID: Real = 0);
    property ID : Real write SetID;
    property ArcustoID : Real write SetArcustoID;
    { Public declarations }
  end;

implementation

uses
  IQMS.Common.Boolean,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.EmailUtils;

{$R *.dfm}
class procedure TFrmQuantumView.Execute(AID: Real; AArcustoID: Real = 0);
var
  LFrmQuantumView : TFrmQuantumView;
begin
  LFrmQuantumView := TFrmQuantumView.Create(UniGUIApplication.UniApplication);
  LFrmQuantumView.ID := AID;
  LFrmQuantumView.ArcustoID := AArcustoID;
  LFrmQuantumView.ShowModal;
end;

procedure TFrmQuantumView.dbeEmail1CustomDlg(Sender: TObject);
begin
  with PKShipToContact do
    if Execute then
      begin
        qryQuantumViewCOMPANY1.AsString := GetValue('ATTN');
        qryQuantumViewCONTACT1.AsString := GetValue('CONTACT');
        qryQuantumViewEMAIL1.AsString := GetValue('EMAIL');
      end;
end;

procedure TFrmQuantumView.dbeEmail2CustomDlg(Sender: TObject);
begin
  with PKShipToContact do
    if Execute then
      begin
        qryQuantumViewCOMPANY2.AsString := GetValue('ATTN');
        qryQuantumViewCONTACT2.AsString := GetValue('CONTACT');
        qryQuantumViewEMAIL2.AsString := GetValue('EMAIL');
      end;
end;

procedure TFrmQuantumView.dbeEmail3CustomDlg(Sender: TObject);
begin
  with PKShipToContact do
    if Execute then
      begin
        qryQuantumViewCOMPANY3.AsString := GetValue('ATTN');
        qryQuantumViewCONTACT3.AsString := GetValue('CONTACT');
        qryQuantumViewEMAIL3.AsString := GetValue('EMAIL');
      end;
end;

procedure TFrmQuantumView.dbeEmail4CustomDlg(Sender: TObject);
begin
  with PKShipToContact do
    if Execute then
      begin
        qryQuantumViewCOMPANY4.AsString := GetValue('ATTN');
        qryQuantumViewCONTACT4.AsString := GetValue('CONTACT');
        qryQuantumViewEMAIL4.AsString := GetValue('EMAIL');
      end;
end;

procedure TFrmQuantumView.dbeEmail5CustomDlg(Sender: TObject);
begin
  with PKShipToContact do
    if Execute then
      begin
        qryQuantumViewCOMPANY5.AsString := GetValue('ATTN');
        qryQuantumViewCONTACT5.AsString := GetValue('CONTACT');
        qryQuantumViewEMAIL5.AsString := GetValue('EMAIL');
      end;
end;

procedure TFrmQuantumView.qryQuantumViewBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FID);
end;

procedure TFrmQuantumView.btnCancelClick(Sender: TObject);
begin
  if (qryQuantumView.State in [dsEdit, dsInsert]) then
    qryQuantumView.Cancel;
end;

procedure TFrmQuantumView.qryQuantumViewAfterPost(DataSet: TDataSet);
begin
   IQApplyUpdateToTable(DataSet);
end;


procedure TFrmQuantumView.qryQuantumViewBeforePost(DataSet: TDataSet);
begin
  if (qryQuantumViewSOURCE.AsString = 'RETURN_SHIPMENT') then
    begin
      qryQuantumViewSHIP1.AsString := 'N';
      qryQuantumViewSHIP2.AsString := 'N';
      qryQuantumViewSHIP3.AsString := 'N';
      qryQuantumViewSHIP4.AsString := 'N';
      qryQuantumViewSHIP5.AsString := 'N';
    end
  else
    begin
      qryQuantumViewINTRANSIT1.AsString := 'N';
      qryQuantumViewINTRANSIT2.AsString := 'N';
      qryQuantumViewINTRANSIT3.AsString := 'N';
      qryQuantumViewINTRANSIT4.AsString := 'N';
      qryQuantumViewINTRANSIT5.AsString := 'N';
    end;
    IQAssert(not ((qryQuantumViewEMAIL1.AsString = '') and
                  (qryQuantumViewEMAIL2.AsString = '') and
                  (qryQuantumViewEMAIL3.AsString = '') and
                  (qryQuantumViewEMAIL4.AsString = '') and
                  (qryQuantumViewEMAIL5.AsString = '')),
             'At least one recipient is required.');

    IQAssert(not ((qryQuantumViewEMAIL1.AsString = '') and
                  ((qryQuantumViewCOMPANY1.AsString <> '') or
                   (qryQuantumViewCONTACT1.AsString <> '') or
                   (qryQuantumViewSHIP1.AsString = 'Y') or
                   (qryQuantumViewEXCEPTION1.AsString = 'Y') or
                   (qryQuantumViewDELIVERY1.AsString = 'Y') or
                   (qryQuantumViewINTRANSIT1.AsString = 'Y'))),
             'E-mail is required for recipient 1.');

    IQAssert(not ((qryQuantumViewEMAIL2.AsString = '') and
                  ((qryQuantumViewCOMPANY2.AsString <> '') or
                   (qryQuantumViewCONTACT2.AsString <> '') or
                   (qryQuantumViewSHIP2.AsString = 'Y') or
                   (qryQuantumViewEXCEPTION2.AsString = 'Y') or
                   (qryQuantumViewDELIVERY2.AsString = 'Y') or
                   (qryQuantumViewINTRANSIT2.AsString = 'Y'))),
             'E-mail is required for recipient 2.');

    IQAssert(not ((qryQuantumViewEMAIL3.AsString = '') and
                  ((qryQuantumViewCOMPANY3.AsString <> '') or
                   (qryQuantumViewCONTACT3.AsString <> '') or
                   (qryQuantumViewSHIP3.AsString = 'Y') or
                   (qryQuantumViewEXCEPTION3.AsString = 'Y') or
                   (qryQuantumViewDELIVERY3.AsString = 'Y') or
                   (qryQuantumViewINTRANSIT3.AsString = 'Y'))),
             'E-mail is required for recipient 3.');

    IQAssert(not ((qryQuantumViewEMAIL4.AsString = '') and
                  ((qryQuantumViewCOMPANY4.AsString <> '') or
                   (qryQuantumViewCONTACT4.AsString <> '') or
                   (qryQuantumViewSHIP4.AsString = 'Y') or
                   (qryQuantumViewEXCEPTION4.AsString = 'Y') or
                   (qryQuantumViewDELIVERY4.AsString = 'Y') or
                   (qryQuantumViewINTRANSIT4.AsString = 'Y'))),
             'E-mail is required for recipient 4.');

    IQAssert(not ((qryQuantumViewEMAIL5.AsString = '') and
                  ((qryQuantumViewCOMPANY5.AsString <> '') or
                   (qryQuantumViewCONTACT5.AsString <> '') or
                   (qryQuantumViewSHIP5.AsString = 'Y') or
                   (qryQuantumViewEXCEPTION5.AsString = 'Y') or
                   (qryQuantumViewDELIVERY5.AsString = 'Y') or
                   (qryQuantumViewINTRANSIT5.AsString = 'Y'))),
             'E-mail is required for recipient 5.');

    IQAssert((qryQuantumViewFAIL_EMAIL.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewFAIL_EMAIL.AsString),
             'Failure E-mail is invalid.');

    IQAssert((qryQuantumViewEMAIL1.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewEMAIL1.AsString),
             'E-mail is invalid for recipient 1.');

    IQAssert((qryQuantumViewEMAIL2.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewEMAIL2.AsString),
             'E-mail is invalid for recipient 2.');

    IQAssert((qryQuantumViewEMAIL3.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewEMAIL3.AsString),
             'E-mail is invalid for recipient 3.');

    IQAssert((qryQuantumViewEMAIL4.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewEMAIL4.AsString),
             'E-mail is invalid for recipient 4.');

    IQAssert((qryQuantumViewEMAIL5.AsString = '') or
             IQMS.Common.EmailUtils.EMailValid(qryQuantumViewEMAIL5.AsString),
             'E-mail is invalid for recipient 5.');

  if (not IQMS.Common.Boolean.YNToBool(qryQuantumViewRETURN.AsString)) then
  begin
    IQAssert(not ((qryQuantumViewEMAIL1.AsString <> '') and
                  (qryQuantumViewSHIP1.AsString <> 'Y') and
                  (qryQuantumViewEXCEPTION1.AsString <> 'Y') and
                  (qryQuantumViewDELIVERY1.AsString <> 'Y') and
                  (qryQuantumViewINTRANSIT1.AsString <> 'Y')),
             'At least one notification type is required for recipient 1.');

    IQAssert(not ((qryQuantumViewEMAIL2.AsString <> '') and
                  (qryQuantumViewSHIP2.AsString <> 'Y') and
                  (qryQuantumViewEXCEPTION2.AsString <> 'Y') and
                  (qryQuantumViewDELIVERY2.AsString <> 'Y') and
                  (qryQuantumViewINTRANSIT2.AsString <> 'Y')),
             'At least one notification type is required for recipient 2.');

    IQAssert(not ((qryQuantumViewEMAIL3.AsString <> '') and
                  (qryQuantumViewSHIP3.AsString <> 'Y') and
                  (qryQuantumViewEXCEPTION3.AsString <> 'Y') and
                  (qryQuantumViewDELIVERY3.AsString <> 'Y') and
                  (qryQuantumViewINTRANSIT3.AsString <> 'Y')),
             'At least one notification type is required for recipient 3.');

    IQAssert(not ((qryQuantumViewEMAIL4.AsString <> '') and
                  (qryQuantumViewSHIP4.AsString <> 'Y') and
                  (qryQuantumViewEXCEPTION4.AsString <> 'Y') and
                  (qryQuantumViewDELIVERY4.AsString <> 'Y') and
                  (qryQuantumViewINTRANSIT4.AsString <> 'Y')),
             'At least one notification type is required for recipient 4.');

    IQAssert(not ((qryQuantumViewEMAIL5.AsString <> '') and
                  (qryQuantumViewSHIP5.AsString <> 'Y') and
                  (qryQuantumViewEXCEPTION5.AsString <> 'Y') and
                  (qryQuantumViewDELIVERY5.AsString <> 'Y') and
                  (qryQuantumViewINTRANSIT5.AsString <> 'Y')),
             'At least one notification type is required for recipient 5.');
  end;
end;

procedure TFrmQuantumView.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmQuantumView.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmQuantumView.UniFormCreate(Sender: TObject);
begin
  ReOpen(qryQuantumView);
  qryQuantumView.Edit;
  if (IQMS.Common.Boolean.YNToBool(qryQuantumViewRETURN.AsString)) then
    begin
      Caption := 'Return Notification Recipients';
      grpTypes.Visible := false;
    end
  else if (qryQuantumViewSOURCE.AsString = 'SHIPMENT_PACKAGES') then
    Caption := Caption + ' (Package)'
  else
    Caption := Caption + ' (Shipment)';

  if (qryQuantumViewSOURCE.AsString = 'RETURN_SHIPMENT') then
    begin
      lblShip.Visible := false;
      chkShip1.Visible := false;
      chkShip2.Visible := false;
      chkShip3.Visible := false;
      chkShip4.Visible := false;
      chkShip5.Visible := false;
    end
  else
    begin
      lblInTransit.Visible := false;
      chkTransit1.Visible := false;
      chkTransit2.Visible := false;
      chkTransit3.Visible := false;
      chkTransit4.Visible := false;
      chkTransit5.Visible := false;
    end;

{ TODO -oGPatil -cWebConvert : TUniEdit does not contain ShowButton
  if (AArcustoID > 0) then
    begin
      dbeEmail1.ShowButton := True;
      dbeEmail2.ShowButton := True;
      dbeEmail3.ShowButton := True;
      dbeEmail4.ShowButton := True;
      dbeEmail5.ShowButton := True;
    end
  else
    begin
      dbeEmail1.ShowButton := False;
      dbeEmail2.ShowButton := False;
      dbeEmail3.ShowButton := False;
      dbeEmail4.ShowButton := False;
      dbeEmail5.ShowButton := False;
    end;   }
end;

procedure TFrmQuantumView.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := TRUE;
  if ModalResult = mrOk then
    if (qryQuantumView.State in [dsEdit, dsInsert]) then
      qryQuantumView.Post;

end;

procedure TFrmQuantumView.PKShipToContactBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FArcustoId);
end;

end.
