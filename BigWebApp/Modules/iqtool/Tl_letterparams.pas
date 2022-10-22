unit Tl_letterparams;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmTLLetterParams = class(TUniForm)
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    PnlControls: TUniPanel;
    PnlFields: TUniPanel;
    Label1: TUniLabel;
    edtToolingReport: TUniEdit;
    sbtnToolingReport: TUniSpeedButton;
    Label3: TUniLabel;
    edtQuoteReport: TUniEdit;
    sbtnQuoteReport: TUniSpeedButton;
    Label2: TUniLabel;
    edtTemplate: TUniEdit;
    sbtnTemplate: TUniSpeedButton;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure sbtnToolingReportClick(Sender: TObject);
    procedure sbtnQuoteReportClick(Sender: TObject);
    procedure sbtnTemplateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function GetTLLetterParams( var AToolingReportName, AQuoteReportName, ATemplateName: String  ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

procedure TFrmTLLetterParams.FormCreate(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmTLLetterParams'
     CenterForm( Self ); // iqctrl   }
     IQRegFormRead( Self, [ Self ] ); // iqregfrm
end;

procedure TFrmTLLetterParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmTLLetterParams'
     RestoreForm( Self ); // IQMS.Common.Controls.pas  }
     IQRegFormWrite( Self, [ Self ] ); // IQMS.Common.RegFrm.pas
end;

function GetTLLetterParams( var AToolingReportName, AQuoteReportName, ATemplateName: String  ): Boolean;
var
  LFrmTLLetterParams : TFrmTLLetterParams;
begin
  LFrmTLLetterParams := TFrmTLLetterParams.Create( UniGUIApplication.UniApplication );
  LFrmTLLetterParams.edtToolingReport.Text  := AToolingReportName;
   LFrmTLLetterParams.edtQuoteReport.Text   := AQuoteReportName;
   LFrmTLLetterParams.edtTemplate.Text  := ATemplateName;

   Result:= LFrmTLLetterParams.ShowModal = mrOK;

   if Result then
      begin
           AToolingReportName := LFrmTLLetterParams.edtToolingReport.Text;
           AQuoteReportName   := LFrmTLLetterParams.edtQuoteReport.Text;
           ATemplateName      := LFrmTLLetterParams.edtTemplate.Text;
      end;

end;

procedure TFrmTLLetterParams.sbtnToolingReportClick(Sender: TObject);
begin
     with OpenDialog1 do
          begin
               FileName:= edtToolingReport.Text;
               if Execute then edtToolingReport.Text:= FileName;
          end;
end;

procedure TFrmTLLetterParams.sbtnQuoteReportClick(Sender: TObject);
begin
     with OpenDialog1 do
          begin
               FileName:= edtQuoteReport.Text;
               if Execute then edtQuoteReport.Text:= FileName;
          end;
end;

procedure TFrmTLLetterParams.sbtnTemplateClick(Sender: TObject);
begin
     with OpenDialog2 do
          begin
               FileName:= edtTemplate.Text;
               if Execute then edtTemplate.Text:= FileName;
          end;
end;

end.
