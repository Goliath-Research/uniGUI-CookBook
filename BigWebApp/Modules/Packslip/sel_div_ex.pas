unit sel_div_ex;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  SEL_DIV,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton, uniButton, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, Vcl.Forms, uniPanel;

type
  TFrmSelectDivisionExtended = class(TFrmSelectDivision)
    rbtnNoDiv: TUniRadioButton;
  private
    { Private declarations }
  protected
    procedure InitRadioButtons(ADivision_ID: Real); override;
    procedure InitCaptions; override;
  public
    { Public declarations }
    class function DoShowModal(var ADivision_ID: Real): Boolean;
  end;


implementation

{$R *.dfm}


uses
  IQMS.Common.SysShare,
  uniGUIApplication;

{ TFrmSelectDivisionExtended }

class function TFrmSelectDivisionExtended.DoShowModal(var ADivision_ID: Real): Boolean;
var
  LFrmSelectDivisionExtended : TFrmSelectDivisionExtended;
begin
  LFrmSelectDivisionExtended := TFrmSelectDivisionExtended.Create(uniGUIApplication.UniApplication);
  with LFrmSelectDivisionExtended do
    try
      Division_ID := ADivision_ID;
      Result := ShowModal = mrOK;
      if Result then
      begin
        if rbtnAllDiv.Checked then
          ADivision_ID := 0
        else if rbtnNoDiv.Checked then
          ADivision_ID := - 1
        else
          ADivision_ID := wwQryDivision.FieldByName('ID').asFloat;
      end;
    finally
      Release;
    end;
end;

procedure TFrmSelectDivisionExtended.InitCaptions;
begin
  inherited;
  with rbtnNoDiv do
    Caption := CheckReplaceDivisionCaption(Caption);
end;

procedure TFrmSelectDivisionExtended.InitRadioButtons(ADivision_ID: Real);
begin
  if ADivision_ID = - 1 then
  begin
    rbtnNoDiv.Checked := TRUE;
    EXIT;
  end;

  inherited;
end;

end.
