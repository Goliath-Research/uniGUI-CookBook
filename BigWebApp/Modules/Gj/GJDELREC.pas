unit GJDelRec;

interface

uses
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Classes, uniGUIClasses, uniRadioButton, uniLabel, uniButton,
  uniGUIBaseClasses, uniPanel, uniGUIForm, uniGUIApplication;

type
  TDeleteRecurring = ( drCancel, drDelete, drPush );

type
  TFrmDelRecurringLine = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlMain: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    rbtnDelete: TUniRadioButton;
    rbtnPush: TUniRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ConfirmDeleteRecurring : TDeleteRecurring;

implementation

{$R *.DFM}

function ConfirmDeleteRecurring : TDeleteRecurring;
begin
  with TFrmDelRecurringLine.Create(UniApplication) do
    if ShowModal = mrOK then
    begin
      if rbtnDelete.Checked then
        Result:= drDelete
      else
        Result:= drPush;
    end
    else
      Result:= drCancel;
end;

end.

