unit taclcinc;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Db,
  Mask,
  wwdbedit,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniEdit, uniDBEdit,
  uniComboBox, uniDBComboBox;

type
  TFrmCalcIncPay = class(TUniForm)
    QryInc: TFDQuery;
    StringField1: TStringField;
    FloatField1: TBCDField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    lblNote: TUniLabel;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label44: TUniLabel;
    Label4: TUniLabel;
    dbInc: TUniDBLookupComboBox;
    dbHrs: TUniDBNumberEdit;
    SrcQryInc: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetIncpaytype(var Apaytype:Real; var AHrs:Real):Boolean;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ta_rscstr;

{$R *.DFM}

function GetIncpaytype(var Apaytype:Real; var AHrs:Real):Boolean;
var
  LFrmCalcIncPay : TFrmCalcIncPay;
begin
  LFrmCalcIncPay := TFrmCalcIncPay.Create(UniGUIApplication.UniApplication);
  LFrmCalcIncPay.ShowModal;
  if LFrmCalcIncPay.ModalResult = mrOk then
  begin
{ TODO -oGPatil -cWebConvert : TUniDBLookupComboBox does not contain a member named  lookupvalue
    if LFrmCalcIncPay.dbInc.Text <> '' then
      Apaytype := StrToFloat(LFrmCalcIncPay.dbInc.LookupValue);   }
    AHrs := LFrmCalcIncPay.dbHrs.Value;
    Result := True;
  end
  else
    Result := False;
end;

procedure TFrmCalcIncPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlLeft01]);
end;

procedure TFrmCalcIncPay.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, PnlLeft01]);
  QryInc.Open;
end;

procedure TFrmCalcIncPay.btnOkClick(Sender: TObject);
begin
  if dbHrs.Value = 0 then
     // 'Please specify a value for Incentive Hours.'
    raise Exception.Create(ta_rscstr.cTXT0000005);
  ModalResult := mrOk;
end;

end.
