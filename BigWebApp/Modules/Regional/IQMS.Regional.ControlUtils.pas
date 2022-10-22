unit IQMS.Regional.ControlUtils;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Wwdblook,
  Data.DB,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox;

/// <summary> Filtered combo box data by the PK_HIDE field. </summary>
procedure FilterInactive(AComboBox: TUniDBLookupComboBox; const AFiltered: Boolean);

/// <summary> Clear the STATE and STATE_ID fields, if the user has pressed the Delete key.
/// </summary>
//procedure CheckClearSubdivisionComboBox(
//  const Sender: TObject;
//  var Key: Word;
//  const AFields: array of TField);

implementation

procedure FilterInactive(AComboBox: TUniDBLookupComboBox; const AFiltered: Boolean);
begin
  Assert(AComboBox <> nil, 'Application Error:  Combo box control not assigned.');
  Assert(AComboBox.ListSource <> nil, 'Application Error:  Combo box lookup dataset not assigned.');
  if AComboBox.ListSource.DataSet.FindField('PK_HIDE') = nil then
  begin
    Exit;
  end;

  if AFiltered then
  begin
    AComboBox.ListSource.DataSet.Filter := 'PK_HIDE IS NULL OR PK_HIDE <> ''Y'' ';
    AComboBox.ListSource.DataSet.Filtered := True;
  end
  else
  begin
    AComboBox.ListSource.DataSet.Filtered := False;
  end;
end;

{
procedure CheckClearSubdivisionComboBox(
  const Sender: TObject;
  var Key: Word;
  const AFields: array of TField);
var
  ADataSet: TDataSet;
  i: Integer;
  AField: TField;
begin
  Assert(Sender <> nil, 'Application Error:  Combo box control not assigned.');
  Assert(Sender is TwwDBLookupCombo, 'Application Error:  Combo box must be TwwDBLookupCombo.');

  if (Key = VK_DELETE) and (Sender is TwwDBLookupCombo) and (High(AFields) > -1) then
  begin
    ADataSet := AFields[0].DataSet;

    if not (ADataSet.State in [dsEdit, dsInsert]) then
      ADataSet.Edit;

    for AField in AFields do
    begin
      AField.Clear;
    end;

    (Sender as TwwDBLookupCombo).Text := '';

    Key := 0;
  end;
end;
}
end.
