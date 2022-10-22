unit Pmtskftr;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmPMFilterTasks = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    GroupBox1: TUniGroupBox;
    chkMisc: TUniCheckBox;
    chkArchived: TUniCheckBox;
    PnlButtonsRight: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

function DoPMTaskFilter(var AShowMisc, AShowArchived: Boolean): Boolean;


implementation

{$R *.DFM}


uses
  IQMS.Common.Controls;

function DoPMTaskFilter(var AShowMisc, AShowArchived: Boolean): Boolean;
var
 FrmPMFilterTasks: TFrmPMFilterTasks;
begin
FrmPMFilterTasks := TFrmPMFilterTasks.Create(UniGUIApplication.UniApplication);

  with FrmPMFilterTasks do
    try
       chkMisc.Checked := AShowMisc;
       chkArchived.Checked := AShowArchived;


      Result := ShowModal = mrOk;
      if Result then
        begin
          AShowMisc := chkMisc.Checked;
          AShowArchived := chkArchived.Checked;
        end;
    finally
      Release;
    end;
end;

end.
