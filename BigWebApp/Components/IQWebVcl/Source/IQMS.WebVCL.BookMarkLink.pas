unit IQMS.WebVCL.BookMarkLink;

interface

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  System.Classes,
  uniGUIClasses,
  uniEdit,
  uniLabel,
  uniGUIBaseClasses,
  uniPanel,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmLinkDisplay = class(TUniForm)
    URLCaption: TUniLabel;
    BtnCopy: TUniButton;
    URLDisplay: TUniEdit;
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmLinkDisplay.UniFormCreate(Sender: TObject);
begin
  btnCopy.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+URLDisplay.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) alert(''Copied!''); '+
      ' else alert(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' alert(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

end.
