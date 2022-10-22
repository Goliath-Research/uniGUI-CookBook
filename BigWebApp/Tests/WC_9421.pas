unit WC_9421;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,TestReg,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIFrame, IQMS.WebVcl.KeyPad, uniGUIBaseClasses,
  uniCheckBox, uniEdit;

type
  TFrm_WC_9421 = class(TUniForm)
    IQWebKeyPad1: TIQWebKeyPad;
    UniCheckBox1: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;
    UniEdit1: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure UniCheckBox1Click(Sender: TObject);
    procedure UniCheckBox2Click(Sender: TObject);
    procedure IQWebKeyPad1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Frm_WC_9421: TFrm_WC_9421;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function Frm_WC_9421: TFrm_WC_9421;
begin
  Result := TFrm_WC_9421(UniMainModule.GetFormInstance(TFrm_WC_9421));
end;

procedure TFrm_WC_9421.IQWebKeyPad1Change(Sender: TObject);
begin
  UniEdit1.Text:=IQWebKeyPad1.Selected;
end;

procedure TFrm_WC_9421.UniCheckBox1Click(Sender: TObject);
begin
  IQWebKeyPad1.AllowNegative:=UniCheckBox1.Checked;
end;

procedure TFrm_WC_9421.UniCheckBox2Click(Sender: TObject);
begin
  IQWebKeyPad1.IncludeDecimal:=UniCheckBox2.Checked;
end;

procedure TFrm_WC_9421.UniFormCreate(Sender: TObject);
begin
  IQWebKeyPad1.AllowNegative:=UniCheckBox1.Checked;
  IQWebKeyPad1.IncludeDecimal:=UniCheckBox2.Checked;
end;

procedure Test1;
begin
  Frm_WC_9421.ShowModal();
end;

initialization

  TTestRepo.RegisterTest('WC-9421', 'vcl', 'IQKeyPad', 'ShowModal', Test1);

end.
