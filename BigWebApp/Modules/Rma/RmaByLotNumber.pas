unit RmaByLotNumber;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
//  vcl.wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmRmaByLotNumberRec = record
    SHIPMENT_DTL_ID: Real;
    ARINVT_ID: Real;
    ARINVT_ITEMNO: string;
    ARINVT_DESCRIP: string;
    ARINVT_DESCRIP2: string;
    ARINVT_CLASS: string;
    ARINVT_REV: string;
  end;

  TFrmRmaByLotNumber = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnSelect: TUniButton;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    edLotNumber: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    IQSearch1: TIQUniGridControl;
    Qry: TFDQuery;
    Src: TDataSource;
    QrySHIPDATE: TDateTimeField;
    QryPACKSLIPNO: TStringField;
    QryCUSTNO: TStringField;
    QryARCUSTO_ID: TBCDField;
    QryQTYSHIPPED: TBCDField;
    QrySHIPMENT_DTL_ID: TBCDField;
    QryORDER_DTL_ID: TBCDField;
    QryPONO: TStringField;
    QryREV: TStringField;
    QryITEMNO: TStringField;
    QryDESCRIP: TStringField;
    QryDESCRIP2: TStringField;
    QryORDERS_ID: TBCDField;
    QryHIST_ORDERS_ID: TBCDField;
    QryARINVT_ID: TFMTBCDField;
    QryARINVT_HIST_ID: TBCDField;
    QryCUST_ITEMNO: TStringField;
    QryCUST_DESCRIP: TStringField;
    QryEPLANT_ID: TFMTBCDField;
    QryUOM: TStringField;
    QryPHANTOM: TStringField;
    QryORDERNO: TStringField;
    QryPHANTOM_PS_TICKET_DTL_ID: TBCDField;
    QrySHIP_TO_ATTN: TStringField;
    QryLOTNO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure edLotNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edLotNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:Real;
    FArcustoId:Real;
    procedure SetArcustoId(const Value: Real);
  public
    { Public declarations }
    property ArcustoId: Real Read FArcustoId Write SetArcustoId;
    property TheResult: Real Read FResult;
  end;

  function GetShipmentDtlId_ByLotNumber(AArcustoId:Real):Real;

  function GetShipmentDtlId_ByLotNumberEx(AArcustoID: Real; var AResult: TFrmRmaByLotNumberRec): Boolean;

var
  FrmRmaByLotNumber: TFrmRmaByLotNumber;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  rma_rscstr;

{$R *.dfm}

procedure TFrmRmaByLotNumber.SetArcustoId(const Value: Real);
begin
   FArcustoId:= Value;
end;


function GetShipmentDtlId_ByLotNumber(AArcustoId:Real):Real;
var
  frm: TFrmRmaByLotNumber;
begin
  frm:= TFrmRmaByLotNumber.Create(uniGUIApplication.UniApplication);
  frm.ArcustoId:= AArcustoId;

  if frm.ShowModal= mrOk then
    Result := frm.TheResult
  else
    Result := 0;
end;

function GetShipmentDtlId_ByLotNumberEx(AArcustoID: Real; var AResult: TFrmRmaByLotNumberRec): Boolean;
var
  frm: TFrmRmaByLotNumber;
begin
  // Clear the record
  ZeroMemory(@AResult, SizeOf(TFrmRmaByLotNumberRec));
  // Show the form

  frm:= TFrmRmaByLotNumber.Create(uniGUIApplication.UniApplication);
  frm.ArcustoId:= AArcustoId;

  Result := frm.ShowModal = mrOk;
  // If value is selected, populate result record
  if Result then
    begin
      AResult.SHIPMENT_DTL_ID := frm.QrySHIPMENT_DTL_ID.AsFloat;
      AResult.ARINVT_ID := frm.QryARINVT_ID.AsFloat;
      if AResult.ARINVT_ID = 0 then
        AResult.ARINVT_ID := frm.QryARINVT_HIST_ID.AsFloat;
      AResult.ARINVT_ITEMNO := frm.QryITEMNO.AsString;
      AResult.ARINVT_DESCRIP := frm.QryDESCRIP.AsString;
      AResult.ARINVT_DESCRIP2 := frm.QryDESCRIP2.AsString;
      AResult.ARINVT_CLASS := SelectValueFmtAsString(
       'SELECT class FROM arinvt WHERE id = %.0f',
       [AResult.ARINVT_ID]);
      AResult.ARINVT_REV := frm.QryREV.AsString;
    end;
end;

procedure TFrmRmaByLotNumber.UniFormCreate(Sender: TObject);
begin
  FResult := 0;
  IQRegFormRead( self, [self]);
end;


procedure TFrmRmaByLotNumber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmRmaByLotNumber.FormShow(Sender: TObject);
begin
  if edLotNumber.CanFocus then
    edLotNumber.SetFocus;
end;

procedure TFrmRmaByLotNumber.sbtnSearchClick(Sender: TObject);
begin
  Qry.Close;
  Qry.ParamByName('alotno').asString := Trim(edLotNumber.text);
  Qry.ParamByName('nArCustoId').Value := FArcustoId;
  Qry.Open;
end;

procedure TFrmRmaByLotNumber.BtnCancelClick(Sender: TObject);
begin
  FResult := 0;
  ModalResult := mrCancel;
end;

procedure TFrmRmaByLotNumber.BtnSelectClick(Sender: TObject);
begin
  if not Qry.Active then
    // rma_rscstr.cTXT0000091 = 'Nothing selected.';
    raise Exception.Create(rma_rscstr.cTXT0000091);
  if QrySHIPMENT_DTL_ID.asFloat = 0 then
    // rma_rscstr.cTXT0000091 = 'Nothing selected.';
    raise Exception.Create(rma_rscstr.cTXT0000091);
  FResult := QrySHIPMENT_DTL_ID.asFloat;
  ModalResult := mrOk;
end;

procedure TFrmRmaByLotNumber.edLotNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      Key := 0;
      sbtnSearchClick(sbtnSearch);
    end;
end;

procedure TFrmRmaByLotNumber.edLotNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;


end.
