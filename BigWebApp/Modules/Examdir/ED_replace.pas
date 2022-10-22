unit ED_replace;

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
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniLabel,
  uniImage,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TfrmFileReplace = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnYes: TUniButton;
    btnCancel: TUniButton;
    btnYesToAll: TUniButton;
    btnNo: TUniButton;
    Panel3: TUniPanel;
    Image2: TUniImage;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
  private
    { Private declarations }
    procedure DisplayFileInfo( ASrc, ASrcSize, ASrcDate, ATrg, ATrgSize, ATrgDate: string );
  public
    { Public declarations }
  end;

  function GetFileReplaceConfirm( ASrc, ASrcSize, ASrcDate, ATrg, ATrgSize, ATrgDate: string ): integer;


implementation

{$R *.DFM}
uses
mainmodule;

function GetFileReplaceConfirm( ASrc, ASrcSize, ASrcDate, ATrg, ATrgSize, ATrgDate: string ): integer;
var
  frmFileReplace: TfrmFileReplace;
begin
  frmFileReplace := TfrmFileReplace.Create(uniGUIApplication.UniApplication);
  with frmFileReplace do
  begin
    DisplayFileInfo( ASrc, ASrcSize, ASrcDate, ATrg, ATrgSize, ATrgDate );
    Result:= ShowModal;
  end;
end;

procedure TfrmFileReplace.DisplayFileInfo( ASrc, ASrcSize, ASrcDate, ATrg, ATrgSize, ATrgDate: string );
begin
  Label2.Caption:= ATrg;
  Label3.Caption:= Format('%s bytes, modified on %s',[ ATrgSize, ATrgDate ]);

  Label5.Caption:= ASrc;
  Label6.Caption:= Format('%s bytes, modified on %s',[ ASrcSize, ASrcDate ]);
end;

end.
