unit D4WEditorDlg;

interface

uses
  SysUtils, Windows, Classes, Controls, uniGUIApplication, uniComboBox, uniGUITypes,
  uniGUIClasses, Graphics, D4WEditor, uniGUIForm, Variants;

type
  ID4WEditorDialog = interface
    ['{EA1ACCA4-0101-45C7-B8C5-8D24C86CB385}']
    function GetDialogResult: Integer;
    function GetDialogValue: Variant;
    procedure SetDialogValue(const Value: Variant);
    procedure SetEditorInstance(Editor: TD4WCustomEditor);

    property DialogResult: Integer read GetDialogResult;
    property DialogValue: Variant read GetDialogValue write SetDialogValue;
  end;

  TD4WDialogResultEvent = procedure(Sender: TObject; Intf: ID4WEditorDialog; var Handled: Boolean) of object;

  TD4WCustomEditorDlg = class(TD4WCustomEditor)
  private
    FD4WDialogResultEvent: TD4WDialogResultEvent;
   { private declarations }
    function GetDialogClass: TUniBaseFormClass;
  protected
   { protected declarations }
    procedure DoHandleTriggerClick(const AButtonId: Integer); override;
    procedure ProcessDialogResult(const Intf: ID4WEditorDialog); virtual;
    procedure DoBeforeShowDialog(const ADialog: TUniBaseForm); virtual;
    procedure DoBeforeCreateDialog; virtual;

    function GetEditorValue: Variant; virtual;
    procedure SetEditorValue(const Value: Variant); virtual;

    function DialogClassName: string; virtual;
    function DialogClass: TUniBaseFormClass; virtual;

    property EditorValue: Variant read GetEditorValue write SetEditorValue;

    property OnDialogResult: TD4WDialogResultEvent read FD4WDialogResultEvent write FD4WDialogResultEvent;
  public
   { public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

uses
  Data.DB;

{ TD4WCustomEditorDlg }

constructor TD4WCustomEditorDlg.Create(AOwner: TComponent);
begin
  inherited;

  with Triggers.Add do
  begin
    ImageIndex := 0;
    ButtonId := 1;
    HandleClicks := True;
  end;

//  with Triggers.Add do
//  begin
//    ImageIndex := 1;
//    ButtonId := 2;
//    HandleClicks := True;
//  end;
end;

function TD4WCustomEditorDlg.DialogClass: TUniBaseFormClass;
begin
  Result := nil;
end;

function TD4WCustomEditorDlg.DialogClassName: string;
begin
  Result := '';
end;

procedure TD4WCustomEditorDlg.DoBeforeCreateDialog;
begin
//
end;

procedure TD4WCustomEditorDlg.DoBeforeShowDialog(const ADialog: TUniBaseForm);
begin
  if Assigned(DBGrid) then
    DBGrid.CancelEditing(True);
end;

procedure TD4WCustomEditorDlg.DoHandleTriggerClick(const AButtonId: Integer);
var
  FrmClass: TUniBaseFormClass;
  Frm: TUniBaseForm;
  IRes : ID4WEditorDialog;
begin
  inherited;

  case AButtonId of
    1 :
      begin
        DoBeforeCreateDialog;
        FrmClass := GetDialogClass;
        if Assigned(FrmClass) then
        begin
          Frm := FrmClass.Create(UniApplication);
          try
            DoBeforeShowDialog(Frm);
          except
            Frm.Release;
            raise
          end;

          if Supports(Frm, ID4WEditorDialog, IRes) then
          begin
            try
              IRes.SetDialogValue(EditorValue);
            finally
              IRes := nil;  // release interface here
            end;

            with Frm do
              ShowModal
              (
                procedure(Sender: TComponent; AResult:Integer)
                begin
                  ProcessDialogResult(Sender as ID4WEditorDialog);
                end
              );
          end;
        end;
      end;

    2 :
      begin

      end;
  end;

end;

function TD4WCustomEditorDlg.GetDialogClass: TUniBaseFormClass;
begin
  Result := DialogClass;

  if (Result = nil) and (DialogClassName <> '') then
    Result := TUniBaseFormClass(GetClass(DialogClassName));
end;

procedure TD4WCustomEditorDlg.ProcessDialogResult(const Intf: ID4WEditorDialog);
var
  Handled : Boolean;
begin
  Handled := False;

  if Assigned(FD4WDialogResultEvent) then
    FD4WDialogResultEvent(Self, Intf, Handled);

  if not Handled then
    if Intf.DialogResult = mrOK then
      EditorValue := Intf.DialogValue;
end;

function TD4WCustomEditorDlg.GetEditorValue: Variant;
begin
  if Assigned(Field) then
    Result := Field.Value
  else
    Result := Text;
end;

procedure TD4WCustomEditorDlg.SetEditorValue(const Value: Variant);
begin
  if Assigned(Field) then
  begin
    if not (DataSource.State in [dsEdit, dsInsert])  then
      DataSource.Edit;

    Field.Value := Value;

    if Assigned(DBGrid) then
      DBGrid.RefreshCurrentRow(False);
  end
  else
    Text := Value;
end;

end.
