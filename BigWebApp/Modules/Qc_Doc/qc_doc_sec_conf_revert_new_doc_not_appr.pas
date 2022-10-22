unit qc_doc_sec_conf_revert_new_doc_not_appr;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.SecuredConfirm,
  StdCtrls,
  ExtCtrls, uniLabel, uniImage, uniButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel;

type
  TFrmSecuredConfirmRevertNewDocNotApproved = class(TFrmSecuredConfirm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSecuredConfirmRevertNewDocNotApproved: TFrmSecuredConfirmRevertNewDocNotApproved;

implementation

{$R *.dfm}

procedure TFrmSecuredConfirmRevertNewDocNotApproved.FormCreate(Sender: TObject);
begin
  inherited;
  btnCancel.Visible:= FALSE;
end;

end.
