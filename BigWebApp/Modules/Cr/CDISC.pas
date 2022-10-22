unit cDisc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn,
  uniSpeedButton;

type
  TFrmDiscount = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    DBEditTerms: TUniDBEdit;
    Label1: TUniLabel;
    DBEditDiscount: TUniDBEdit;
    Label2: TUniLabel;
    DBEditDiscAmt: TUniDBEdit;
    Label3: TUniLabel;
    SBAcct: TUniSpeedButton;
    Label10: TUniLabel;
    DBEditARAcct: TUniDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBAcctClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CheckForDiscountDays;
  public
    { Public declarations }
    lOk:Boolean;
  end;


procedure DoDiscount;

implementation
{$R *.DFM}

uses
//  CashRec,
  IQMS.Common.RegFrm;

procedure DoDiscount;
var
  FrmDiscount : TFrmDiscount;
begin
  FrmDiscount := TFrmDiscount.Create(uniGUIApplication.UniApplication);
  FrmDiscount.ShowModal;
end;


procedure TFrmDiscount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmDiscount.SBAcctClick(Sender: TObject);
begin
//  with TFrmCr(Owner).DM, TblCrPrePostDetail do
//    if PkAcct.Execute then
//    begin
//      if not (State in [dsEdit, dsInsert]) then Edit;
//      FieldByName('GLACCT_ID_DISC').asFloat := PkAcct.GetValue('ID');
//    end;
end;

procedure TFrmDiscount.UniFormCreate(Sender: TObject);
begin

//  lOk := False;
  IQRegFormRead( self, [ self ]);
//  CheckForDiscountDays;
end;

procedure TFrmDiscount.BtnOkClick(Sender: TObject);
begin
//  with TFrmCr(Owner).DM.TblCrPrePostDetail do
//    if (FieldByName('GLACCT_ID_DISC').asFloat = 0) or
//       (FieldByName('DISCOUNT_APPLIED').asFloat = 0) then
//       raise Exception.Create('Discount amount and the discount account must be filled');
//  lOk := True;
//  Close;
end;

procedure TFrmDiscount.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDiscount.CheckForDiscountDays;
var
  dDate1, dDate2:TDateTime;
begin
//  dDate1 := TFrmCr(Owner).DM.TblCrPrePostDetail.FieldByName('INVOICE_DATE').asDateTime +
//           TFrmCr(Owner).DM.TblCrPrePostDetail.FieldByName('TERMS_DISDAYS').asInteger;
//  dDate2 := TFrmCr(Owner).DM.TblCrPrePost.FieldByName('REF_DATE').asDateTime;
//  with TFrmCr(Owner).DM.TblCrPrePostDetail do
//    begin
//      if dDate2 <= dDate1 then
//        begin
//          if not (State in [dsInsert, dsEdit]) then Edit;
//          FieldByName('DISCOUNT_APPLIED').asFloat :=
//          FieldByName('AMOUNT_APPLIED').asFloat * FieldByName('TERMS_DISCOUNT').asFloat/100;
//        end;
//     end;
end;


end.
