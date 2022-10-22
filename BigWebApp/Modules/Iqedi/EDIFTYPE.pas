unit EdiFtype;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmEdiFileType = class(TUniForm)
    Panel1: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    GroupBox1: TUniGroupBox;
    rbX12: TUniRadioButton;
    rbEDIFACT: TUniRadioButton;
    rbYOUFIND: TUniRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetEdiFileType(var AType:String):Boolean;

implementation
{$R *.DFM}
uses
  Mainmodule,
  IQMS.Common.RegFrm;

function GetEdiFileType(var AType:String):Boolean;
var
  FrmEdiFileType : TFrmEdiFileType;
begin
  FrmEdiFileType := TFrmEdiFileType.Create(UniApplication);
  with FrmEdiFileType do
  begin
    Result := ShowModal = mrOk;
    if rbX12.Checked then
      AType := 'X12'
    else if rbEDIFACT.Checked then
      AType := 'EDIFACT'
    else
      AType := 'YOUFIND';
  end;
end;


procedure TFrmEdiFileType.FormCreate(Sender: TObject);
begin
 IQRegFormRead( self, [self]);
end;

procedure TFrmEdiFileType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 IQRegFormWrite( self, [self]);
end;

end.
