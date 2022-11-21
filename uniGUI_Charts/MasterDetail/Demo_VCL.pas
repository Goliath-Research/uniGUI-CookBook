unit Demo_VCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MasterDetailFrame,
  Demo_VCL_DataModule;

type
  TDemoVCL = class(TForm)
    frmMasterDetail1: TfrmMasterDetail;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoVCL: TDemoVCL;

implementation

{$R *.dfm}

end.
