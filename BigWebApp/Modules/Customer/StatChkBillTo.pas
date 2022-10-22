unit StatChkBillTo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
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
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniLabel, uniButton, uniCheckBox, uniPanel, uniPageControl,
  UniGUIApplication;

type
  TFrmStatusExceptionBillTo = class(TFrmStatusException)
    Label7billto: TUniLabel;
    DBEdit7billto: TUniDBEdit;
    procedure FormShow(Sender: TObject);
  private
    FBillTo_ID: Real;
    { Private declarations }
    procedure PrepareQueryBillTo( AID: Real );
    procedure SetBillTo_ID(const Value: Real);
  public
    { Public declarations }
    property BillTo_ID : Real write SetBillTo_ID;
  end;


procedure CheckCustBillToStatusIs2( ABillTo_ID:Real; AStatus:string );



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure CheckCustBillToStatusIs2( ABillTo_ID:Real; AStatus:string );
var
  S:string;
  FrmStatusExceptionBillTo: TFrmStatusExceptionBillTo;
begin
  S:= Trim(SelectValueFmtAsString('select status_id from bill_to where id = %.0f', [ABillTo_ID]));

  if (S <> '') and (CompareText( S, AStatus ) <> 0) then
     if not IsConsole then
     begin
       FrmStatusExceptionBillTo := TFrmStatusExceptionBillTo.Create( UniGUIApplication.UniApplication );
       with FrmStatusExceptionBillTo do
       try
         BillTo_ID := ABillTo_ID;
         if not (ShowModal = mrOK) then
            raise TIQNotAuthorizedException.Create;
       finally
         //Release;
       end
     end
     else
        raise TIQNotAuthorizedException .Create;
end;


procedure TFrmStatusExceptionBillTo.FormShow(Sender: TObject);
begin
  inherited;
  PrepareQueryBillTo( FBillTo_ID );
  IQSetTablesActive(TRUE, self);
  PageControl1.ActivePage:= TabSheet1;
end;

procedure TFrmStatusExceptionBillTo.PrepareQueryBillTo( AID: Real );
begin
  Query1.Close;
  AssignQueryParamValue(Query1, 'ID', AID);
end;



procedure TFrmStatusExceptionBillTo.SetBillTo_ID(const Value: Real);
begin
  FBillTo_ID := Value;
end;

end.
