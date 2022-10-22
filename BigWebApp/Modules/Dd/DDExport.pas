unit DDExport;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniLabel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit, uniFileUpload;

type
  TDDRepDefExport = class(TUniForm)
    GroupBox1: TUniGroupBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edRepDef: TUniEdit;
    edRepDef_Cr: TUniEdit;
    edRepDef_Fr: TUniEdit;
    btnRepDef: TUniSpeedButton;
    btnRepDef_Cr: TUniSpeedButton;
    btnRepDef_Fr: TUniSpeedButton;
    lblRepDef_Cat: TUniLabel;
    edRepDef_Cat: TUniEdit;
    btnRepDef_Cat: TUniSpeedButton;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    UniFileUpload1: TUniFileUpload;
    procedure btnRepDefClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTragetDBFNames(  var A, B, C, D : string ):Boolean;

implementation

{$R *.DFM}

uses
  DD_resourcestring, MainModule;

function GetTragetDBFNames( var A, B, C, D : string ):Boolean;
var
  DDRepDefExport : TDDRepDefExport;
begin
  DDRepDefExport := TDDRepDefExport.Create(uniGUIApplication.UniApplication);
  Result:= FALSE;
  with DDRepDefExport do
  begin
    if ShowModal = mrOK then
    begin
       A:= edRepDef.Text;
       B:= edRepDef_Cr.Text;
       C:= edRepDef_Fr.Text;
       D:= edRepDef_Cat.Text;
       Result:= TRUE;
    end;
  end;
end;

procedure TDDRepDefExport.FormCreate(Sender: TObject);
begin
  edRepDef.Text    := ExpandFileName( edRepDef.Text    );
  edRepDef_Cr.Text := ExpandFileName( edRepDef_Cr.Text );
  edRepDef_Fr.Text := ExpandFileName( edRepDef_Fr.Text );
  edRepDef_Cat.Text:= ExpandFileName( edRepDef_Cat.Text);
end;

procedure TDDRepDefExport.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
   case UniFileUpload1.Tag of
     0: edRepDef.Text:=ExtractFileName(AStream.FileName);
     1: edRepDef_Cr.Text:=ExtractFileName(AStream.FileName);
     2: edRepDef_Fr.Text:=ExtractFileName(AStream.FileName);
     3: edRepDef_Cat.Text:=ExtractFileName(AStream.FileName);
   end;
end;

procedure TDDRepDefExport.btnRepDefClick(Sender: TObject);
var
  ed:TUniEdit;
begin
  if Sender = btnRepDef then
  begin
     ed:= edRepDef;
     UniFileUpload1.Tag:=0;
  end
  else if Sender = btnRepDef_Cr then
  begin
     ed:= edRepDef_Cr;
     UniFileUpload1.Tag:=1;
  end
  else if Sender = btnRepDef_Fr then
  begin
     ed:= edRepDef_Fr;
     UniFileUpload1.Tag:=2;
  end
  else if Sender = btnRepDef_Cat then
  begin
     ed:= edRepDef_Cat;
     UniFileUpload1.Tag:=3;
  end;

  UniFileUpload1.FileName:=ed.Text;
  UniFileUpload1.Execute;
end;

procedure TDDRepDefExport.btnOKClick(Sender: TObject);
begin
  if (Trim(edRepDef.Text) = '') or (Trim(edRepDef_Cr.Text)='') or (Trim(edRepDef_Fr.Text)='') or (Trim(edRepDef_Cat.Text) = '') then
     // 'Please Enter ALL File Names'
     raise Exception.Create( DD_resourcestring.cTXT0000071 );
  ModalResult:= mrOK;
end;


end.

