unit IQMS.Common.wDateDlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmSelectWWDate = class(TUniForm)
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    lblPrompt: TUniLabel;
    cmbDate: TUniDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetDate(FDate: TDateTime);
    procedure SetFrmCaption(AFrmCaption:string);
    procedure SetBoxCaption(ABoxCaption:string);
  public
    { Public declarations }
    property aDate: TDateTime write SetDate;
    property FrmCaption:String write SetFrmCaption;
    property BoxCaption:String write SetBoxCaption;
  end;

function GetWWDateDialog( AFrmCaption, ABoxCaption:String; var FDate: TDateTime ): Boolean;



implementation
uses
  IQMS.Common.RegFrm;
{$R *.DFM}

function GetWWDateDialog( AFrmCaption, ABoxCaption:String; var FDate: TDateTime ): Boolean;
var
  FrmSelectWWDate: TFrmSelectWWDate;
begin
  FrmSelectWWDate:= TFrmSelectWWDate.Create(uniGUIApplication.UniApplication);
  with FrmSelectWWDate do
  begin
    FrmCaption:=AFrmCaption;
    BoxCaption:=ABoxCaption;
    aDate:=FDate;
     Result:= ShowModal = mrOK;
     if Result then
       FDate := Trunc(cmbDate.DateTime);
  end
end;

procedure TFrmSelectWWDate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmSelectWWDate.SetBoxCaption(ABoxCaption: string);
begin
  // Set the prompt caption
  if ABoxCaption <> '' then lblPrompt.Caption := ABoxCaption;
end;

procedure TFrmSelectWWDate.SetDate(FDate: TDateTime);
begin
  if Fdate <> 0 then
     cmbDate.DateTime:= FDate
  else
     cmbDate.DateTime:= Date;
end;

procedure TFrmSelectWWDate.SetFrmCaption(AFrmCaption: string);
begin
  // Set the form caption
  if AFrmCaption <> '' then Caption := AFrmCaption;
end;

procedure TFrmSelectWWDate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  cmbDate.Top := lblPrompt.Height + 6;
end;

end.
