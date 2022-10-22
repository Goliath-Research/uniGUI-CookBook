unit WC_9601;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, TestReg,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniGUIBaseClasses, uniMemo,
  IQMS.WebVcl.TinyMCE, uniDBMemo;

type
  TFrm_WC_9601 = class(TUniForm)
    IQWebTinyMCE1: TIQWebTinyMCE;
    UniButton1: TUniButton;
    UniMemo1: TUniMemo;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Frm_WC_9601: TFrm_WC_9601;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function Frm_WC_9601: TFrm_WC_9601;
begin
  Result := TFrm_WC_9601(UniMainModule.GetFormInstance(TFrm_WC_9601));
end;

procedure Test1;
begin
  Frm_WC_9601.ShowModal();
end;

procedure TFrm_WC_9601.UniButton1Click(Sender: TObject);
begin
  UniMemo1.Text:=IQWebTinyMCE1.Text;
end;

initialization

  TTestRepo.RegisterTest('WC-9601', 'vcl', 'TinyMCE', 'Showmodal', Test1);
end.

end.
