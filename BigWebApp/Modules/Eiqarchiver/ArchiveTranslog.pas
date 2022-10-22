unit ArchiveTranslog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
//  Archiver_main,
//  IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniDateTimePicker;

type
  TFrmArchiveTranslog = class(TUniForm)
    pnlCarrier: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    Label1: TUniLabel;
    lblPOdate1: TUniLabel;
    wwDate: TUniDateTimePicker;
    EdTransDate: TUniEdit;
    Label2: TUniLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
//    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
  end;

  procedure DoShowModal;

implementation
uses
  IQMS.Common.DataLib,
  EIQArchiver_rscstr,
  IQMS.Common.Dialogs;
{$R *.dfm}

procedure DoShowModal;
var
  frm: TFrmArchiveTranslog;
begin
  frm := TFrmArchiveTranslog.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmArchiveTranslog.UniFormCreate(Sender: TObject);
var
  ADate:TDateTime;
begin
  ADate := SelectValue('select min(trunc(trans_date)) from translog');
  EdTransDate.text := DateTimeToStr(ADate);
  EdTransDate.ReadOnly := true;
  wwDate.DateTime := ADate;
end;

procedure TFrmArchiveTranslog.UniFormShow(Sender: TObject);
begin
//
end;


procedure TFrmArchiveTranslog.btnCancelClick(Sender: TObject);
begin
  Close;
//  if Owner is TFrmArchiver_main then
//    PostMessage( Handle, iq_Notify, 0, 0);
end;

procedure TFrmArchiveTranslog.btnOkClick(Sender: TObject);
var
  ADate:TDateTime;
begin
  ExecuteCommandFmt('begin IQ_ARCHIVE.ArchiveTranslog(To_Date(''%s'', ''MM/DD/RRRR'')); end;', [FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]);
  IQInformation( EIQArchiver_rscstr.cTXT0000001 );
  ADate := SelectValue('select min(trunc(trans_date)) from translog');
  EdTransDate.ReadOnly := false;
  EdTransDate.text := DateTimeToStr(ADate);
  EdTransDate.ReadOnly := true;
  wwDate.DateTime := ADate;

end;

{
procedure TFrmArchiveTranslog.IQNotify(var Msg: TMessage);
begin
  Free;
end;
}

end.
