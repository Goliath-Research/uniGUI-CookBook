unit ApRelChk;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIApplication,
  uniGUIForm,
  IQMS.Common.StatChk,
  Mask,
  FireDAC.Comp.DataSet,
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
  FireDAC.Comp.Client;

type
  TFrmApReleaseCheck = class(TFrmStatusException)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    fReceipts_id: Real;
    { Private declarations }
     procedure SetReceipts_id(const Value: Real);
  public
    { Public declarations }
     property receipts_id : Real write SetReceipts_id;

  end;

procedure CheckAPPORelease( po_receipts_id:Real );


var
  FrmApReleaseCheck: TFrmApReleaseCheck;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

procedure CheckAPPORelease( po_receipts_id:Real );
begin
   FrmApReleaseCheck := TFrmApReleaseCheck.Create( UniGUIApplication.UniApplication );
   with FrmApReleaseCheck do
   try
     receipts_id := fReceipts_id;
     if not (ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
   finally
     Release;
   end;
end;

procedure TFrmApReleaseCheck.UniFormCreate(Sender: TObject);
begin
  if not IQRegFormRead( self, [self]) then
  begin
    Height := 176;
    Width  := 312;
  end;
end;

procedure TFrmApReleaseCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite( self, [self]);
end;


procedure TFrmApReleaseCheck.SetReceipts_id(const Value: Real);
begin
  fReceipts_id := Value;
end;
end.

