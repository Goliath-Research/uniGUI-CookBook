unit CD_Void;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Ivoid,
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
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.Comp.DataSet, uniCheckBox, uniMemo, uniEdit, uniGUIClasses,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniSplitter, uniButton,
  Vcl.Forms, uniGUIBaseClasses, uniPanel, uniGUIApplication;

type
  TFrmVoidCD = class(TFrmVoidArInvoice)
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    FReason  :String;
    FVoidedBy:String;
    FVoidedDate:TDateTime;
    { Public declarations }
  end;

function DoVoidCD(var AReason:String; var AVoidedBy:String; var AVoidedDate:TDateTime; var APeriodID:Real):Boolean;

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.AccountingShare,
  cd_rscstr;

{$R *.DFM}

function DoVoidCD(var AReason:String; var AVoidedBy:String; var AVoidedDate:TDateTime; var APeriodID:Real):Boolean;
var
  LFrmVoidCD : TFrmVoidCD;
begin
  LFrmVoidCD := TFrmVoidCD.Create(uniGUIApplication.UniApplication);
  with LFrmVoidCD do
  begin
    Id := 0;
    PeriodID := APeriodID;
    LblReconstruct.Visible := false;
    CbReconstruct.Visible := false;
    Result := False;
    ShowModal;
    Result := (ModalResult = mrOk);
    if Result then
    begin
      AReason     := FReason     ;
      AVoidedBy   := FVoidedBy   ;
      AVoidedDate := FVoidedDate ;
      APeriodID   := TblGLPeriods.FieldByName('ID').asFloat;
    end;
  end;
end;

procedure TFrmVoidCD.BtnOkClick(Sender: TObject);
begin
  if Empty(EditVoidBy.Text) then
     {'Please enter a value for, ''Voided By.'''}
     raise Exception.Create(cd_rscstr.cTXT0000067);

  CheckForOpenPeriod('ap_status', TblGLPeriods.FieldByName('ID').asFloat);  {in IqAcctShr.pas}
  FVoidedDate := StrToDate(EditDate.Text);
  FVoidedBy   := StrTran(EditVoidBy.Text, '''', '''''');
  FReason := MemoReason.Text;
  FReason := StrTran(FReason, #13, ' ');
  FReason := StrTran(FReason, #10, ' ');
  FReason := StrTran(FReason, '''', '''''');
  ModalResult := mrOK;
end;

end.
