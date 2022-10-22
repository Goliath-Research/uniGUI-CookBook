unit IQUniEditorDlg;

interface

uses
  SysUtils, Windows, Classes, Controls, uniGUIApplication, uniComboBox, uniGUITypes,
  uniGUIClasses, Graphics, IQUniEditor, uniGUIForm, Variants;

type
  IIQEditorDialog = interface
    ['{EA1ACCA4-0101-45C7-B8C5-8D24C86CB385}']
    function GetDialogResult: Integer;
    function GetDialogValue: Variant;
    procedure SetDialogValue(const Value: Variant);
    procedure SetEditorInstance(Editor: TIQUniCustomEditor);

    property DialogResult: Integer read GetDialogResult;
    property DialogValue: Variant read GetDialogValue write SetDialogValue;
  end;

  TIQDialogResultEvent = procedure(Sender: TObject; Intf: IIQEditorDialog; var Handled: Boolean) of object;

  TIQUniCustomEditorDlg = class(TIQUniCustomEditor)
  private
    FIQDialogResultEvent: TIQDialogResultEvent;
   { private declarations }
    function GetDialogClass: TUniBaseFormClass;
  protected
   { protected declarations }
    procedure DoHandleTriggerClick(const AButtonId: Integer); override;
    procedure ProcessDialogResult(const Intf: IIQEditorDialog); virtual;
    procedure DoBeforeShowDialog(const ADialog: TUniBaseForm); virtual;
    procedure DoBeforeCreateDialog; virtual;

    function GetEditorValue: Variant; virtual;
    procedure SetEditorValue(const Value: Variant); virtual;

    function DialogClassName: string; virtual;
    function DialogClass: TUniBaseFormClass; virtual;

    property EditorValue: Variant read GetEditorValue write SetEditorValue;

    property OnDialogResult: TIQDialogResultEvent read FIQDialogResultEvent write FIQDialogResultEvent;
  public
   { public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

uses
  Data.DB;

{ TIQUniCustomEditorDlg }

constructor TIQUniCustomEditorDlg.Create(AOwner: TComponent);
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

function TIQUniCustomEditorDlg.DialogClass: TUniBaseFormClass;
begin
  Result := nil;
end;

function TIQUniCustomEditorDlg.DialogClassName: string;
begin
  Result := '';
end;

procedure TIQUniCustomEditorDlg.DoBeforeCreateDialog;
begin
//
end;

procedure TIQUniCustomEditorDlg.DoBeforeShowDialog(const ADialog: TUniBaseForm);
begin
  if Assigned(DBGrid) then
    DBGrid.CancelEditing(True);
end;

procedure TIQUniCustomEditorDlg.DoHandleTriggerClick(const AButtonId: Integer);
var
  FrmClass: TUniBaseFormClass;
  Frm: TUniBaseForm;
  IRes : IIQEditorDialog;
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

          if Supports(Frm, IIQEditorDialog, IRes) then
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
                  ProcessDialogResult(Sender as IIQEditorDialog);
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

function TIQUniCustomEditorDlg.GetDialogClass: TUniBaseFormClass;
begin
  Result := DialogClass;

  if (Result = nil) and (DialogClassName <> '') then
    Result := TUniBaseFormClass(GetClass(DialogClassName));
end;

procedure TIQUniCustomEditorDlg.ProcessDialogResult(const Intf: IIQEditorDialog);
var
  Handled : Boolean;
begin
  Handled := False;

  if Assigned(FIQDialogResultEvent) then
    FIQDialogResultEvent(Self, Intf, Handled);

  if not Handled then
    if Intf.DialogResult = mrOK then
      EditorValue := Intf.DialogValue;
end;

function TIQUniCustomEditorDlg.GetEditorValue: Variant;
begin
  if Assigned(Field) then
    Result := Field.Value
  else
    Result := Text;
end;

procedure TIQUniCustomEditorDlg.SetEditorValue(const Value: Variant);
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
