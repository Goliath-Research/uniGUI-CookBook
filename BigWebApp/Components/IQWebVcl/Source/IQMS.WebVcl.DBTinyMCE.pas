unit IQMS.WebVcl.DBTinyMCE;

interface

uses
  SysUtils, Classes, Controls, DBCtrls, DB, Forms, uniGUIBaseClasses, uniGUIClasses, uniMemo,
  IQMS.WebVcl.TinyMCE,uniGUITypes,uniGUIApplication;

type
  TIQWebDBTinyMCE = class(TIQWebTinyMCE)
  private
    FDataLink: TFieldDataLink;
    procedure ActiveChange(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    function AllowEdit: Boolean;
    function GetText: string;
    procedure SetText(const Value: string);
  protected
    { Protected declarations }
    function GetField: TField; virtual;
    function GetDataField: WideString; virtual;
    procedure SetDataField(Value: WideString); virtual;
    function GetDataSource: TDataSource; virtual;
    procedure SetDataSource(Value: TDataSource); virtual;

    procedure DoSetRemoteValue(AIndex:Integer; Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Field: TField read GetField;
    { Public declarations }
  published

    property DataField: WideString read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Text : string read GetText write SetText;
    { Published declarations }
  end;
implementation

 uses uniDBUtils;

{ TUniDBTinyMCE }

procedure TIQWebDBTinyMCE.ActiveChange(Sender: TObject);
begin
  if (not IsDesigning) and (not IsDestroying) then
    InternalReadOnly:=not AllowEdit;
end;

function TIQWebDBTinyMCE.AllowEdit: Boolean;
begin
  Result:=DataLinkEditable(FDataLink) and (not Self.ReadOnly);
end;

constructor TIQWebDBTinyMCE.Create(AOwner: TComponent);
begin
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  inherited;
  ControlOptions := ControlOptions + [uoNameAsText];

  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnActiveChange := ActiveChange;
end;

procedure TIQWebDBTinyMCE.DataChange(Sender: TObject);
begin
  if SelfUpdating then Exit;
  if IsDestroying then Exit;

  if not Assigned(FDataLink.DataSet) then Exit;

  if FDataLink.DataSet.ControlsDisabled then Exit;

  if FDataLink.Field <> nil then
  begin
    if FDataLink.Field.IsBlob then
      SetText(TMemoField(FDataLink.Field).AsString)
    else
      SetText(FDataLink.Field.DisplayText);
    StateValue:=GetDatasetState(FDataLink.DataSet);
  end
  else
    Text:='';
end;

destructor TIQWebDBTinyMCE.Destroy;
begin
  inherited;
  FDataLink.Free;
end;

procedure TIQWebDBTinyMCE.DoSetRemoteValue(AIndex: Integer; Value: string);
var
  OldValue : string;
begin
  if Value = InternalText then Exit;
  OldValue := Lines.Text;

  inherited DoSetRemoteValue(AIndex, Value);

  if (FDataLink.DataSet<>nil) and FDataLink.DataSet.Active then
  begin
    StateValue:=GetDatasetState(FDataLink.DataSet);
    if not CheckDatasetState(FDataLink, StateValue) then Exit;

    try
      FDataLink.DataSet.Edit;
      FDataLink.DataSet.FieldByName(DataField).Text := Value;
    except
      Text:=OldValue;
      SelfUpdating:=False;
      raise;
    end;
  end;
end;

procedure TIQWebDBTinyMCE.EditingChange(Sender: TObject);
begin
  if IsLoading or IsDestroying then Exit;

  InternalReadOnly:=not AllowEdit;
end;

function TIQWebDBTinyMCE.GetDataField: WideString;
begin
  Result:=FDataLink.FieldName;
end;

function TIQWebDBTinyMCE.GetDataSource: TDataSource;
begin
  Result:=FDataLink.DataSource;
end;

function TIQWebDBTinyMCE.GetField: TField;
begin
  Result:=FDataLink.Field;
end;

function TIQWebDBTinyMCE.GetText: string;
begin
  Result:=Lines.Text;
end;

procedure TIQWebDBTinyMCE.SetDataField(Value: WideString);
begin
  SetVCLProperty('DataField', Value);

  FDataLink.FieldName:=Value;
end;

procedure TIQWebDBTinyMCE.SetDataSource(Value: TDataSource);
begin
  SetVCLClassProperty('DataSource', Value);

  FDataLink.DataSource:=Value;
end;

procedure TIQWebDBTinyMCE.SetText(const Value: string);
begin
  Lines.Text:=Value;
  JSCallGlobal('Ext.Function.defer', [JSFunction('', 'tinyMCE.execCommand("mceSetContent", false, '+JSName+'.value);') , 100  ]);
end;

procedure TIQWebDBTinyMCE.UpdateData(Sender: TObject);
begin
end;

end.