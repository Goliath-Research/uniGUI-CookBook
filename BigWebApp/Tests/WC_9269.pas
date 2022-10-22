unit WC_9269;

interface

uses
  TestReg, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, IQMS.WebVcl.MultimediaSounds,
  uniCheckBox, uniButton, uniFileUpload,ServerModule;

type
  Tfrm_WC_9269 = class(TUniForm)
    IQWebSound1: TIQWebSound;
    UniButton1: TUniButton;
    UniCheckBox1: TUniCheckBox;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    UniButton5: TUniButton;
    UniFileUpload1: TUniFileUpload;
    UniButton6: TUniButton;
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure UniButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frm_WC_9269: Tfrm_WC_9269;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frm_WC_9269: Tfrm_WC_9269;
begin
  Result := Tfrm_WC_9269(UniMainModule.GetFormInstance(Tfrm_WC_9269));
end;

procedure TestDoShowModal;
begin
    frm_WC_9269.ShowModal();
end;

procedure Tfrm_WC_9269.UniButton1Click(Sender: TObject);
begin
  IQWebSound1.Loop:=UniCheckBox1.Checked;
  IQWebSound1.Play('files/demo.mp3');
end;

procedure Tfrm_WC_9269.UniButton2Click(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

procedure Tfrm_WC_9269.UniButton3Click(Sender: TObject);
begin
  IQWebSound1.Pause;
end;

procedure Tfrm_WC_9269.UniButton4Click(Sender: TObject);
begin
  IQWebSound1.Resume;
end;

procedure Tfrm_WC_9269.UniButton5Click(Sender: TObject);
begin
 IQWebSound1.Stop;
end;

procedure Tfrm_WC_9269.UniButton6Click(Sender: TObject);
begin
  IQWebSound1.Loop:=UniCheckBox1.Checked;
  IQWebSound1.Beep;
end;

procedure Tfrm_WC_9269.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  IQWebSound1.Loop:=UniCheckBox1.Checked;
  IQWebSound1.Play(StringReplace(AStream.FileName,'C:\BIN\WebIQ\','',[rfReplaceAll]));
end;

initialization
  TTestRepo.RegisterTest('WC-9269', 'iqshare', 'iqmm', 'ShowModal', TestDoShowModal);
end.
