unit Q_Let_SU;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmQLetterSetup = class(TUniForm)
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel2: TUniPanel;
    PnlLeft: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edCRW: TUniEdit;
    edMSWord: TUniEdit;
    Label3: TUniLabel;
    SR: TIQWebSecurityRegister;
    EdQLetterPath: TUniEdit;
    procedure DoCRWClick(Sender: TObject);
    procedure DoWordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure EdQLetterPathCustomDlg(Sender: TObject);
    procedure UpdateQLetterPerHierarchy( AReportName : string );
  private
    { Private declarations }
    FArcusto_ID : Real;
    procedure SetArcusto_ID(const Value: Real);
  public
    { Public declarations }
    property Arcusto_ID : Real write SetArcusto_ID;
  end;

function GetQLetterParams( var ACRWReportName, ATemplateName: string; AArcusto_ID : Real  ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.Directory,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO : IQSecIns not yet converted }
  //IQSecIns;

function GetQLetterParams( var ACRWReportName, ATemplateName: string; AArcusto_ID : Real    ): Boolean;
var
  LFrmQLetterSetup : TFrmQLetterSetup;
begin
  LFrmQLetterSetup := TFrmQLetterSetup.Create( UniGUIApplication.UniApplication );
  with LFrmQLetterSetup do
  begin
    edCRW.Text   := ACRWReportName;
    Arcusto_ID  := AArcusto_ID;
    edMSWord.Text:= ATemplateName ;
    EdQLetterPath.text := SelectValueAsString('select quote_letter_file_path from iqsys2 where rownum < 2');

    Result:= ShowModal = mrOK;

    if Result then
    begin
      ExecuteCommandFmt('update iqsys2 set quote_letter_file_path = ''%s''', [EdQLetterPath.text]);
      ACRWReportName:= edCRW.Text;
      ATemplateName := edMSWord.Text;
      UpdateQLetterPerHierarchy( ExtractFileName(ACRWReportName) );
    end;
  end;
end;

procedure TFrmQLetterSetup.FormCreate(Sender: TObject);
begin
  { TODO : Incompatible types: 'TForm' and 'TFrmQLetterSetup' }
  //CenterForm(Self); // iqctrl
  IQRegFormRead(Self, [Self, PnlLeft]);
end;

procedure TFrmQLetterSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmQLetterSetup.DoCRWClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    FileName:= edCRW.Text;
    if Execute then edCRW.Text:= FileName;
  end;
end;

procedure TFrmQLetterSetup.DoWordClick(Sender: TObject);
begin
  with OpenDialog2 do
  begin
    FileName:= edMSWord.Text;
    if Execute then edMSWord.Text:= FileName;
  end;
end;

procedure TFrmQLetterSetup.FormShow(Sender: TObject);
begin
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmQLetterSetup.SetArcusto_ID(const Value: Real);
begin
  FArcusto_ID := Value;
end;

procedure TFrmQLetterSetup.UpdateQLetterPerHierarchy( AReportName : string );
begin
  if SelectValueFmtAsString('select trim(qletter_report) from arcusto where id = %f', [ FArcusto_ID ]) <> '' then
  begin
    ExecuteCommandFmt('update arcusto set qletter_report = ''%s'' where id = %f', [ ExtractFileName(AReportName), FArcusto_ID ]);
    Exit;
  end;

  ExecuteCommandFmt('update iqsys set qletter_report = ''%s''', [ AReportName ]);
end;

procedure TFrmQLetterSetup.EdQLetterPathCustomDlg(Sender: TObject);
var
  ADir:String;
begin
  ADir := EdQLetterPath.text;
  if DirBrowse( ADir, 'Quote Letter File Path' ) then
  begin
    EdQLetterPath.text := ADir;
  end;
end;

end.
