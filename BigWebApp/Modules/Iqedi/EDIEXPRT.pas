unit EdiExprt;

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
  uniLabel,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniFileUpload;

type
  TFrmEdiExport = class(TUniForm)
    GroupBox1: TUniGroupBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edEdiTS: TUniEdit;
    edEdiSeg: TUniEdit;
    edEdiToken: TUniEdit;
    btnEdiTS: TUniSpeedButton;
    btnEdiSeg: TUniSpeedButton;
    btnEdiToken: TUniSpeedButton;
    Label4: TUniLabel;
    edEdiValue: TUniEdit;
    btnEdiValue: TUniSpeedButton;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    UniFileUpload1: TUniFileUpload;
    procedure btnOKClick(Sender: TObject);
    procedure btnEdiTSClick(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetEdiDBFNames( var A, B, C, D : string ):Boolean;

implementation

{$R *.DFM}

uses
  edi_rscstr, MainModule;

function GetEdiDBFNames(var A, B, C, D : string ):Boolean;
var
  aFrmEdiExport : TFrmEdiExport;
begin
  aFrmEdiExport := UniMainModule.GetFormInstance(TFrmEdiExport) as TFrmEdiExport;
  Result:= FALSE;
  with aFrmEdiExport do
  begin
      edEdiTS.Text    := ExpandFileName(edEdiTS.Text   );
      edEdiSeg.Text   := ExpandFileName(edEdiSeg.Text  );
      edEdiToken.Text := ExpandFileName(edEdiToken.Text);
      edEdiValue.Text := ExpandFileName(edEdiValue.Text);
      if ShowModal = mrOK then
      begin
         A := edEdiTS.Text;
         B := edEdiSeg.Text;
         C := edEdiToken.Text;
         D := edEdiValue.Text;
         Result := TRUE;
      end;
  end;
end;

procedure TFrmEdiExport.btnOKClick(Sender: TObject);
begin
  if (Trim(edEdiTS.Text) = '') or (Trim(edEdiSeg.Text)='') or (Trim(edEdiToken.Text)='') or (Trim(edEdiValue.Text)='') then
     raise Exception.Create(edi_rscstr.cTXT0000181{'Please enter all file names.'});

  ModalResult:= mrOK;
end;

procedure TFrmEdiExport.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
   case UniFileUpload1.Tag of
     0: edEdiTS.Text:=ExtractFileName(AStream.FileName);
     1: edEdiSeg.Text:=ExtractFileName(AStream.FileName);
     2: edEdiToken.Text:=ExtractFileName(AStream.FileName);
     3: edEdiValue.Text:=ExtractFileName(AStream.FileName);
   end;
end;

procedure TFrmEdiExport.btnEdiTSClick(Sender: TObject);
var
  ed : TUniEdit;
  S : TStringStream;
begin
   if Sender = btnEdiTS then
  begin
     ed:= edEdiTS;
     UniFileUpload1.Tag:=0;
  end
  else if Sender = btnEdiSeg then
  begin
     ed:= edEdiSeg;
     UniFileUpload1.Tag:=1;
  end
  else if Sender = btnEdiToken then
  begin
     ed:= edEdiToken;
     UniFileUpload1.Tag:=2;
  end
  else if Sender = btnEdiValue then
  begin
     ed:= edEdiValue;
     UniFileUpload1.Tag:=3;
  end;

  UniFileUpload1.FileName:=ed.Text;
  UniFileUpload1.Execute;
//  with SaveDialog1 do
//  begin
//    FileName:= ed.Text;
//    if Execute then
//       ed.Text:= FileName;
//  end;
end;

end.
