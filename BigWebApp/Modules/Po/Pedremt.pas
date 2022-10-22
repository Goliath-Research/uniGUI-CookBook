unit PEdRemt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Editbill,
  Vcl.Wwdatsrc,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.HPick, uniButton,
  uniDBNavigator, uniBitBtn, uniSpeedButton, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniDBComboBox, uniGUIClasses, uniEdit, uniDBEdit,
  uniLabel, uniSplitter, uniScrollBox, uniPageControl, Vcl.Controls,
  uniGUIBaseClasses, uniPanel, uniGUIApplication;

type
  TFrmEditRemitTo = class(TFrmEditBillToCustom)
    TblRemitTo: TFDTable;
    TblRemitToID: TBCDField;
    TblRemitToVENDOR_ID: TBCDField;
    TblRemitToATTN: TStringField;
    TblRemitToADDR1: TStringField;
    TblRemitToADDR2: TStringField;
    TblRemitToADDR3: TStringField;
    TblRemitToCITY: TStringField;
    TblRemitToSTATE: TStringField;
    TblRemitToZIP: TStringField;
    TblRemitToCURRENCY_ID: TStringField;
    TblRemitToPHONE_NUMBER: TStringField;
    TblRemitToFAX_NUMBER: TStringField;
    TblRemitToPRIME_CONTACT: TStringField;
    TblRemitToCOUNTRY: TStringField;
    procedure BtnOkClick(Sender: TObject);
    procedure TblRemitToBeforePost(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FRemitID: Real;
    procedure SetRemitID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    //constructor RemittoCreate(AOwner: TComponent; Id, RemitID: Real);
    property RemitID : Real write SetRemitID;
  end;

function DoRemitTo(AId, ARemitID: Real): Real;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils;

function DoRemitTo(AId, ARemitID: Real): Real;
var
  FrmEditRemitTo: TFrmEditRemitTo;
begin
  FrmEditRemitTo :=  TFrmEditRemitTo.create(uniGUIApplication.UniApplication);
  with FrmEditRemitTo do
  begin
      ArcustoID := AId;
      RemitID := ARemitID;
      ShowModal;
      if OKButtonClicked then
        Result := TblRemitTo.FieldByName('ID').asFloat
      else
        Result := 0;
  end;
end;

{constructor TFrmEditRemitTo.RemittoCreate(AOwner: TComponent;
  Id, RemitID: Real);
begin
  inherited Create(AOwner, Id);
  TblRemitTo.Open;
  TblRemitTo.SetRange([ArcustoID], [ArcustoID]);
  TblRemitTo.Locate('ID', RemitID, []);
end;}

procedure TFrmEditRemitTo.BtnOkClick(Sender: TObject);
begin
  if TblRemitTo.State in [dsEdit, dsInsert] then
    TblRemitTo.Post;
  FOKButtonClicked := True;
  Close;
end;

procedure TFrmEditRemitTo.TblRemitToBeforePost(DataSet: TDataSet);
begin
  if Empty(TblRemitTo.FieldByName('ATTN').AsString) then
    raise Exception.Create('field Company must have a value');
  IQAssignIDBeforePost(DataSet); {in IQlib}
  TblRemitTo.FieldByName('VENDOR_ID').asFloat := ArcustoID;
end;

procedure TFrmEditRemitTo.UniFormCreate(Sender: TObject);
begin
  inherited;
  TblRemitTo.Open;
  TblRemitTo.SetRange([ArcustoID], [ArcustoID]);
  TblRemitTo.Locate('ID', FRemitID, []);
end;

procedure TFrmEditRemitTo.sbtnSearchClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmEditRemitTo.SetRemitID(const Value: Real);
begin
  FRemitID := Value;
end;

end.
