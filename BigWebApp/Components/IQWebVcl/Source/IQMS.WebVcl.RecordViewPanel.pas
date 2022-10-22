unit IQMS.WebVcl.RecordViewPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, DB, uniPanel;

type
  { TIQWebRecordViewPanel }
  TIQWebRecordViewPanel = class(TUniPanel)
  private
    FReadOnly: Boolean;
    FReadOnlyColor: TColor;
    FFont: TFont;
    FLabelFont: TFont;
    FDataSource: TDataSource;

    { Private declarations }
    procedure AlignControlsForVertical;
    procedure SetReadOnly(const Value: Boolean);
  protected
    { Protected declarations }
    procedure DoOnBeforeCreateControl(Sender: TObject; curField: TField; var accept: Boolean); // override;
    procedure DoOnAfterCreateControl(Sender: TObject; curField: TField; Control: TControl); // override;
    function Apply(Recreate: Boolean): Boolean; // override;
  public
    { Protected declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Protected declarations }
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property ControlOptions;
    property DataSource: TDataSource read FDataSource write FDataSource;
    property Font: TFont read FFont write FFont;
    property LabelFont: TFont read FLabelFont write FLabelFont;
    property ReadOnlyColor: TColor read FReadOnlyColor write FReadOnlyColor;
  end;

implementation

uses
  IQMS.Common.Controls;

{ TIQWebRecordViewPanel }

constructor TIQWebRecordViewPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);


  // Set company defaults
//  EditSpacing.HorizontalView.BetweenLabelEdit := 8;
//  EditSpacing.VerticalView.BetweenLabelEdit := 8;
  ReadOnlyColor := clBtnFace;
end;

procedure TIQWebRecordViewPanel.AlignControlsForVertical;
var
  i: Integer;
begin
  // Set the label alignment
  for i := 0 to ControlCount - 1 do
    if (Controls[i] is TLabel) then
      with TLabel(Controls[i]) do
        begin
          Left := 8;
          Alignment := taLeftJustify;
        end;
end;

function TIQWebRecordViewPanel.Apply(Recreate: Boolean): Boolean;
begin
  Result := False;
//  Result := inherited Apply(Recreate);
//
//  // Adjust control alignment
//  if (Style = rvpsVertical) then
//    AlignControlsForVertical;
end;

procedure TIQWebRecordViewPanel.DoOnAfterCreateControl(Sender: TObject;
  curField: TField; Control: TControl);
begin
  inherited;

  // Set read-only, as applicable
  if Assigned(Control) and Assigned(curField) then
    begin
      if (Control is TWinControl) then
        begin
          IQMS.Common.Controls.IQReadOnlyControl(TWinControl(Control),
            FReadOnly or curField.ReadOnly);
        end;
    end;
end;

procedure TIQWebRecordViewPanel.DoOnBeforeCreateControl(Sender: TObject;
  curField: TField; var accept: Boolean);
begin
  inherited;
  // Determine whether or not to create a control for this field.
  // If it is invisible, do not show it.
  accept := accept and Assigned(curField) and curField.Visible;
end;

procedure TIQWebRecordViewPanel.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
  Apply(True);
end;

end.
