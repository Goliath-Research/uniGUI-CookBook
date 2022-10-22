unit CheckNegativeAlert;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmNegAlert = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnNo: TUniButton;
    BtnYes: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    procedure FormShow(Sender: TObject);
    procedure BtnNoClick(Sender: TObject);
    procedure BtnYesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FResult:Boolean;
  public
    { Public declarations }
  end;

function DoCheckNegativeAlert( APrEmpId, APayType_id, AHrs:Real; ADate:TDateTime; ATableName:String; AId:Real = 0):boolean;

var
  FrmNegAlert: TFrmNegAlert;

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;
//  IQSecIns;
{$R *.dfm}

function DoCheckNegativeAlert( APrEmpId, APayType_id, AHrs:Real; ADate:TDateTime; ATableName:String; AId:Real = 0):boolean;
var
  ALeftToTake:Real;
  frm:TFrmNegAlert;
  ADescrip:String;

begin

  frm := TFrmNegAlert.Create(uniGUIApplication.UniApplication);

  ALeftToTake := SelectValueFmtAsFloat('select payroll.IQ_LeftToTake(%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), %f, ''%s'', %f) from dual',
               [APrEmpId, APayType_id, FormatDateTime('mm/dd/yyyy', ADate), AHrs, ATableName, AId]);
  if (ALeftToTake > 0) and (ALeftToTake < 0.0000000001) then
  begin
   frm.FResult := false;
   ADescrip := SelectValueFmtAsString('select description from pr_paytype where id = %f', [APayType_id]);
   frm.Panel5.Caption := Format('Quantity of %s paytype entered exceeds available hours of  %f.', [ADescrip, ALeftToTake]);
   frm.ShowModal;
   Result := frm.FResult;
  end
  else if (ALeftToTake <> 0) and (ALeftToTake <> -10000000000)  then
  begin
      frm.ShowModal;
      Result := frm.FResult;
  end
  else
    result := true;
end;

procedure TFrmNegAlert.FormShow(Sender: TObject);
begin
//  /EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmNegAlert.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmNegAlert.BtnNoClick(Sender: TObject);
begin
  FResult := false;
  Close;
end;

procedure TFrmNegAlert.BtnYesClick(Sender: TObject);
begin
  FResult := true;
  Close;
end;

procedure TFrmNegAlert.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

end.
