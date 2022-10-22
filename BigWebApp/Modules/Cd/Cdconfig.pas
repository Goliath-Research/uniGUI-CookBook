unit CDConfig;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmCdConfigure = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    OpenDialog1: TOpenDialog;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    PnlBtnCtrls: TUniPanel;
    PnlEditCtrls: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    EditCheck: TUniEdit;
    EditRemit: TUniEdit;
    EditLines: TUniEdit;
    SBCheck: TUniSpeedButton;
    SBRemit: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure SBCheckClick(Sender: TObject);
    procedure SBRemitClick(Sender: TObject);
    procedure EditLinesKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DOCDConfig;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  cd_rscstr;

procedure DOCDConfig;
var
  LFrmCdConfigure : TFrmCdConfigure;
begin
  LFrmCdConfigure := TFrmCdConfigure.Create( uniGUIApplication.UniApplication );
  with LFrmCdConfigure do
  begin
    EditCheck.Text := SelectValueAsString('select cd_check_repname from iqsys');
    EditRemit.Text := SelectValueAsString('select cd_check_remitance from iqsys');
    EditLines.Text := IntToStr(Trunc(SelectValueAsFloat('select cd_check_lines from iqsys')));
    IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditCtrls);
    ShowModal;
  end;
end;

procedure TFrmCdConfigure.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, PnlLeft01 ]);
end;

procedure TFrmCdConfigure.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmCdConfigure.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCdConfigure.SBCheckClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if InitialDir = '' then
       InitialDir:= IQGetReportsPath;
    FileName:= EditCheck.Text;
    if Execute then
       EditCheck.Text := ExtractFileName( FileName );
  end;
end;

procedure TFrmCdConfigure.SBRemitClick(Sender: TObject);
begin
  with OpenDialog1 do
  begin
    if InitialDir = '' then
       InitialDir:= IQGetReportsPath;
    FileName := EditRemit.Text;
    if Execute then
       EditRemit.Text := ExtractFileName( FileName );
  end;
end;

procedure TFrmCdConfigure.EditLinesKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in [#8,'0'..'9']) then Key := #0;
end;

procedure TFrmCdConfigure.BtnOkClick(Sender: TObject);
var
  aInitialDir : String;
begin
 aInitialDir:= IQGetReportsPath;
 if not FileExists(aInitialDir + EditCheck.Text) then
    // 'Cannot find file, %s.'
   raise Exception.Create(Format(cd_rscstr.cTXT0000072, [EditCheck.Text]));

 if not FileExists(aInitialDir + EditRemit.Text) then
   // 'Cannot find file, %s.'
   raise Exception.Create(Format(cd_rscstr.cTXT0000072, [EditRemit.Text]));

 ExecuteCommand(Format('update iqsys set cd_check_lines = %d, '+
               'cd_check_repname = ''%s'', '+
               'cd_check_remitance = ''%s''',
               [Trunc(StrToFloat(EditLines.Text)),
                EditCheck.Text,
                EditRemit.Text]));
 Close;
end;

end.
