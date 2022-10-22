unit D4WEditorUtils;

interface

uses
  Classes, Controls, SysUtils, DB, uniGUIClasses, D4WEditor, uniDateTimePicker,
  uniDBDateTimePicker, uniSpinEdit, uniMemo, uniDBMemo, uniCheckBox, uniDBComboBox,
  uniDBCheckBox, uniComboBox, uniDBLookupComboBox, uniDBLookupListBox,
  D4WEditorDlgMemo, D4WEditorDlgPickDataSet, uniEdit, uniDBEdit, uniDBRadioGroup,
  uniDBText, uniHTMLMemo, D4W.HyperGrid, uniDBGrid,
  D4W.DataControllerList;

function GetEditorInstance(AOwner: TD4WHyperGrid; AParent: TWinControl; AField: TField): TUniFormControl;
procedure LoadComponentFromStream(Root: TComponent; AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);

implementation

uses
  uniGUIUtils, uniGUICoreInterfaces, D4WStream;

type
  THUniFormControl = class(TUniFormControl);

function GetEditorInstance(AOwner: TD4WHyperGrid; AParent: TWinControl; AField: TField): TUniFormControl;
var
  CClass : TUniFormControlClass;
  IDB: IUniDBControl;
begin
  Result := nil;
  CClass := nil;
  try
    if AField.Lookup then
    begin
      CClass := TUniDBLookupComboBox;
    end
    else
      case AField.DataType of
        ftGuid,
        ftUnknown,
        ftWideString,
        ftString:
          CClass := TUniDBEdit;

        ftLongWord,
        ftShortint,
        ftLargeint,
        ftAutoInc,
        ftSmallint,
        ftInteger,
        ftWord:
          CClass := TUniDBNumberEdit;

        ftBoolean :
          CClass := TUniDBCheckBox;

        ftExtended,
        ftSingle,
        ftFloat,
        ftCurrency:
          CClass := TUniDBNumberEdit;


        ftOraTimeStamp,
        ftTimeStamp,
        ftDate,
        ftTime,
        ftDateTime:
          CClass := TUniDBDateTimePicker;


        ftWideMemo,
        ftMemo,
        ftFmtMemo:
          CClass := TUniDBMemo;

        ftBCD,
        ftParadoxOle,
        ftDBaseOle,
        ftTypedBinary,
        ftCursor,
        ftFixedChar,
        ftADT,
        ftArray,
        ftReference,
        ftDataSet,
        ftOraBlob,
        ftOraClob,
        ftVariant,
        ftInterface,
        ftIDispatch,
        ftFMTBcd,
        ftFixedWideChar,
        ftOraInterval,
        ftByte,
        ftConnection,
        ftParams,
        ftStream,
        ftTimeStampOffset,
        ftObject,
        ftBytes,
        ftVarBytes,
        ftBlob,
        ftGraphic:
          CClass := TUniDBEdit;
      end;

    if CClass <> nil then
    begin
      TUniControl(Result) := AOwner.CreateD4WControl(CClass,
        uniUniqueComponentName(CClass.ClassName, AOwner),
      AParent);

      with THUniFormControl(Result) do
      begin
        FieldLabel := AField.DisplayLabel;
      end;

      if Result is TUniDBLookupComboBox then
      begin
        TUniDBLookupComboBox(Result).DataSource := AOwner.DataSource;
        TUniDBLookupComboBox(Result).DataField := AField.KeyFields;

        TUniDBLookupComboBox(Result).ListSource := AOwner.Controller.FindDataSource(AField.LookupDataSet);
        TUniDBLookupComboBox(Result).KeyField := AField.LookupKeyFields;
        TUniDBLookupComboBox(Result).ListField := AField.LookupResultField;
      end
      else
      begin
        if Supports(Result, IUniDBControl, IDB) then
        begin
          IDB.DataSource := AOwner.DataSource;
          IDB.DataField := AField.FieldName;
        end;
      end;
    end;

  except
    FreeAndNil(Result);
    raise;
  end;
end;

procedure LoadComponentFromStream(Root: TComponent; AComponent: TComponent; AStream: TMemoryStream; ATextDFM: Boolean = True);
var
  Temp   : TMemoryStream;
  Reader : TD4WReader;
begin
  if AStream.Size > 0 then
  begin
    Temp := nil;
    Reader := nil;

    try
      Temp := TMemoryStream.Create;
      AStream.Position := 0;
      if ATextDFM then
        ObjectTextToBinary(AStream, Temp)
      else
        Temp.LoadFromStream(AStream);

      Temp.Position := 0;

      Reader := TD4WReader.Create(Temp, 4096);
      Reader.UniRoot := Root;
      Reader.ReadRootComponent(AComponent);
    finally
      Temp.Free;
      Reader.Free;
    end;
  end;
end;

end.
