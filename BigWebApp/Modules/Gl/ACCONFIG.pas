unit ACConfig;

interface

uses
  Winapi.Windows,
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
  TFrmActDrillConf = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    OpenDialog1: TOpenDialog;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Panel3: TUniPanel;
    PnlEditBoxes: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    EditAr: TUniEdit;
    EditAp: TUniEdit;
    EditCD: TUniEdit;
    EditCR: TUniEdit;
    EditGJ: TUniEdit;
    SBAR: TUniSpeedButton;
    SBAP: TUniSpeedButton;
    SBCD: TUniSpeedButton;
    SBCR: TUniSpeedButton;
    SBGJ: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure SBARClick(Sender: TObject);
    procedure SBAPClick(Sender: TObject);
    procedure SBCDClick(Sender: TObject);
    procedure SBCRClick(Sender: TObject);
    procedure SBGJClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure AssignFileName( Edit : TUniEdit );
  public
    { Public declarations }
  end;

procedure DOACConfig;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls;

procedure DOACConfig;
var
  LFrmActDrillConf : TFrmActDrillConf;
begin
  LFrmActDrillConf :=  TFrmActDrillConf.Create( uniGUIApplication.UniApplication ) ;
  with LFrmActDrillConf do
  begin
    EditAR.Text := SelectValueAsString('select ar_afterpost_report from iqsys');
    EditAP.Text := SelectValueAsString('select ap_afterpost_report from iqsys');
    EditCD.Text := SelectValueAsString('select cd_afterpost_report from iqsys');
    EditCR.Text := SelectValueAsString('select cr_afterpost_report from iqsys');
    EditGJ.Text := SelectValueAsString('select gj_afterpost_report from iqsys');
    ShowModal;
  end;
end;

procedure TFrmActDrillConf.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlEditBoxes);
  //WEBCONVERT IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead( self, [ self, PnlLeft01 ]);
end;

procedure TFrmActDrillConf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmActDrillConf.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmActDrillConf.AssignFileName( Edit : TUniEdit );
begin
  with OpenDialog1 do
  begin
    if InitialDir = '' then
       InitialDir:= IQGetReportsPath;  {IQMisc}
    FileName:= Edit.Text;
    if Execute then
       Edit.Text:= ExtractFileName( FileName );
  end;
end;

procedure TFrmActDrillConf.SBARClick(Sender: TObject);
begin
  AssignFileName( EditAR );
end;

procedure TFrmActDrillConf.SBAPClick(Sender: TObject);
begin
  AssignFileName( EditAP );
end;

procedure TFrmActDrillConf.SBCDClick(Sender: TObject);
begin
  AssignFileName( EditCD );
end;

procedure TFrmActDrillConf.SBCRClick(Sender: TObject);
begin
  AssignFileName( EditCR );
end;

procedure TFrmActDrillConf.SBGJClick(Sender: TObject);
begin
  AssignFileName( EditGJ );
end;

procedure TFrmActDrillConf.BtnOkClick(Sender: TObject);
begin
  try
    Application.NormalizeTopMosts;
    try
      if not FileExists( IQGetReportsPath + EditAP.Text) then
        raise Exception.Create(Format('File %s not found', [EditAP.Text]));
      if not FileExists( IQGetReportsPath + EditAR.Text) then
        raise Exception.Create(Format('File %s not found', [EditAR.Text]));
      if not FileExists( IQGetReportsPath + EditCD.Text) then
        raise Exception.Create(Format('File %s not found', [EditCD.Text]));
      if not FileExists( IQGetReportsPath + EditCR.Text) then
        raise Exception.Create(Format('File %s not found', [EditCR.Text]));
      if not FileExists( IQGetReportsPath + EditGJ.Text) then
        raise Exception.Create(Format('File %s not found', [EditGJ.Text]));

      ExecuteCommand(Format('update iqsys set ap_afterpost_report = ''%s'', '+
                                     'ar_afterpost_report = ''%s'', '+
                                     'cd_afterpost_report = ''%s'', '+
                                     'cr_afterpost_report = ''%s'', '+
                                     'gj_afterpost_report = ''%s''',
                                  [EditAP.Text,
                                   EditAR.Text,
                                   EditCD.Text,
                                   EditCR.Text,
                                   EditGJ.Text]));
      Close;
   except on E:Exception do
     MessageBox(self.Handle, PChar(E.Message), 'Error', MB_OK);
   end;
 finally
   Application.RestoreTopMosts;
 end;
end;

end.

