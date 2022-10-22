unit MReqFltr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  ClassDiv,
  Data.DB,
  FireDAC.Comp.Client,
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
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniDateTimePicker,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniLabel, Vcl.StdCtrls, uniButton, uniComboBox, uniDBComboBox, uniPanel, uniGUIApplication;

type
  TFrmInvClassFilterMatReq = class(TFrmInvClassDivisionFilter)
    Label2: TUniLabel;
    Label3: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    wwQryBuyerCode: TFDQuery;
    wwQryBuyerCodeID: TBCDField;
    wwQryBuyerCodeBUYER_CODE: TStringField;
    wwQryBuyerCodeDESCRIP: TStringField;
    Label5: TUniLabel;
    wwLookupBuyerCode: TUniDBLookupComboBox;
    SrcBuyerCode: TDataSource;
    procedure btnOKClick(Sender: TObject);
  private
    procedure SetAFrom(const Value: TDateTime);
    procedure SetATo(const Value: TDateTime);
    procedure SetBuyer_Code_ID(const Value: Real);
    { Private declarations }
  protected
    procedure Validate; override;
  public
    { Public declarations }
    property AFrom: TDateTime write SetAFrom;
    property ATo: TDateTime write SetATo;
    property Buyer_Code_ID: Real write SetBuyer_Code_ID;
  end;

function DoInvClassFilterMatReq( var AClass:string; var AFrom, ATo: TDateTime; var ADivision_ID, ABuyer_Code_ID: Real ):Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

function DoInvClassFilterMatReq( var AClass:string; var AFrom, ATo: TDateTime; var ADivision_ID, ABuyer_Code_ID: Real ):Boolean;
var
  LFrmInvClassFilterMatReq: TFrmInvClassFilterMatReq;
begin
  LFrmInvClassFilterMatReq := TFrmInvClassFilterMatReq.Create( uniGUIApplication.UniApplication );
  LFrmInvClassFilterMatReq.AFrom := AFrom;
  LFrmInvClassFilterMatReq.ATo := ATo;
  LFrmInvClassFilterMatReq.Division_ID := ADivision_ID;
  LFrmInvClassFilterMatReq.Buyer_Code_ID := ABuyer_Code_ID;
  { TODO -oathite -cWebConvert : Properties are not available for TUniDBLookupComboBox
  LFrmInvClassFilterMatReq.wwLookupBuyerCode.PerformSearch;  }

  Result:= LFrmInvClassFilterMatReq.ShowModal = mrOK;
    if Result then
    begin
       if Trim(LFrmInvClassFilterMatReq.wwLookupClass.Text) = '' then
          AClass:= 'ALL'
       else
          AClass:= LFrmInvClassFilterMatReq.wwLookupClass.Text;
       AFrom         := Trunc(LFrmInvClassFilterMatReq.DateTimePicker1.DateTime);
       ATo           := Trunc(LFrmInvClassFilterMatReq.DateTimePicker2.DateTime);
       ADivision_ID  := fIIf( LFrmInvClassFilterMatReq.wwLookupDivision.Text = '', 0, LFrmInvClassFilterMatReq.wwQryDivisionID.asFloat );
       ABuyer_Code_ID:= fIIf( LFrmInvClassFilterMatReq.wwLookupBuyerCode.Text = '', 0, LFrmInvClassFilterMatReq.wwQryBuyerCodeID.asFloat );
    end;
end;

procedure TFrmInvClassFilterMatReq.btnOKClick(Sender: TObject);
begin
  // inherited;
  Validate;
  IQRegStringScalarWrite( self, 'AClass', wwLookupClass.Text );
  ModalResult:= mrOK;
end;

procedure TFrmInvClassFilterMatReq.SetAFrom(const Value: TDateTime);
begin
  if Value <> 0 then
    DateTimePicker1.DateTime:= Value
  else
    DateTimePicker1.DateTime:= Date;
end;

procedure TFrmInvClassFilterMatReq.SetATo(const Value: TDateTime);
begin
  if Value <> 0 then
     DateTimePicker2.DateTime:= Value
  else
     DateTimePicker2.DateTime:= DateTimePicker1.DateTime;
end;

procedure TFrmInvClassFilterMatReq.SetBuyer_Code_ID(const Value: Real);
begin
  wwLookupBuyerCode.Text:= SelectValueFmtAsString('select buyer_code from buyer_code where id = %f', [ Value ]);
end;

procedure TFrmInvClassFilterMatReq.Validate;
begin
  // inherited;  allow null class for ALL
  if DateTimePicker1.DateTime > DateTimePicker2.DateTime then
     raise Exception.Create( 'Invalid date scope - please reenter');
end;

end.
