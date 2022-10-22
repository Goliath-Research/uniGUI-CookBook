{ Steps to add a user defined form component to the form:
  1. new tabsheet - drop TIQWebUDEmbeddedForm

  2. hook up:
  DataSource       - parent TDataSource such as DM.SrcStandard
  DataField        - parent id field name such as ID
  TableName        - parent table name such as STANDARD
  Source           - same as table name, unless required to be different
  SecurityRegister - parent SR such as BomShell.SR

  3. Parent form, PageControl.OnChange event - (de)activate the component:
  IQUDEmbeddedForm1.Active:= (pgctrlMain.ActivePage = tabUDForm);
}

unit IQMS.WebVcl.UDEmbeddedForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, System.SyncObjs,
  Vcl.ComCtrls,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys,
  FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf, FireDAC.UI.Intf,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniPanel, uniCommonClasses,
  IQMS.WebVcl.SecurityRegister, IQMS.Common.Usr_Flds,
  IQMS.Common.JumpConstants;

type


  TIQWebUDEmbeddedForm = class(TUniPanel)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FActive: Boolean;
    FSource: string;
    CS: TCriticalSection;
    FCreateChildInProgress: Boolean;

    FPnlCarrier: TUniPanel;
    FPnlTop: TUniPanel;

    FChild: TFrmUserFieldsBuiltIn;
    FSecurityRegister: TIQWebSecurityRegister;

    FLastSourceAttribute: string;

    FSourceAttributeDataLink: TFieldDataLink;
    FTableName: string;

    FAfterStructureChange: TAfterStructureChange; // Usr_Flds.pas
    FOnCheckArchived: TOnCheckArchivedEvent;

    function GetSourceAttributeField: string;
    procedure SetSourceAttributeField(const Value: string);

    function GetSourceAttribute: string;
    property SourceAttribute: string read GetSourceAttribute;

    function GetDataField: string;
    procedure SetDataField(AValue: string);

    function GetDataSource: TDataSource;
    procedure SetDataSource(AValue: TDataSource);

    procedure DataChange(Sender: TObject);

    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    procedure SetSource(const Value: string);
    procedure CheckFreeChild;
    procedure CreateChild;
    procedure SetSecurityRegister(const Value: TIQWebSecurityRegister);
    procedure AssignCaption;
    procedure IQNotifyMessage(var Msg: TMessage); message iq_Notify;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

  protected
    { Protected declarations }
    procedure Loaded; override;

  public
    { Public declarations }
    property Child: TFrmUserFieldsBuiltIn read FChild;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    { Published declarations }
    property Active: Boolean read GetActive write SetActive;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property Source: string read FSource write SetSource;
    // table name we create the user form for such as PLM or STANDARD
    property SourceAttributeField: string read GetSourceAttributeField
      write SetSourceAttributeField;
    // extra key data such as INJECTION or GENERIC in case of BOM
    property TableName: string read FTableName write FTableName;
    property SecurityRegister: TIQWebSecurityRegister read FSecurityRegister
      write SetSecurityRegister;
    property AfterStructureChange: TAfterStructureChange
      read FAfterStructureChange write FAfterStructureChange;
    property OnCheckArchived: TOnCheckArchivedEvent read FOnCheckArchived
      write FOnCheckArchived;

    property Align;
    property BevelOuter;
    property BevelInner;
    property BorderStyle;
    property Ctl3D;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnResize;
  end;

implementation

uses
   IQMS.Common.Miscellaneous,
   IQMS.Common.Numbers,
   IQMS.Common.Dialogs,
   IQMS.Common.StringUtils,
   IQMS.Common.DataLib;

{ TIQWebUDEmbeddedForm }

constructor TIQWebUDEmbeddedForm.Create(AOwner: TComponent);
begin
  inherited;
  Height := 160;
  Width := 300;
  Caption := '';
  BevelOuter := bvNone;
  FActive := FALSE;

  CS := TCriticalSection.Create;

  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DataChange;

  FSourceAttributeDataLink := TFieldDataLink.Create;

  { panels }
  FPnlTop := TUniPanel.Create(self);
  with FPnlTop do
  begin
    Parent := self;
    Name := 'pnlTop';
    Height := 27;
    Align := alTop;
    Alignment := taLeftJustify;
    Color := clWhite;
    Caption := ' User Defined Form';
    BevelOuter := bvNone;
    BevelInner := bvNone;
    ParentBackground := FALSE;
    Tag := 1999;
  end;

  FPnlCarrier := TUniPanel.Create(self);
  with FPnlCarrier do
  begin
    Parent := self;
    Name := 'pnlCarrier';
    Height := 27;
    Align := alClient;
    Caption := '';
    BevelOuter := bvNone;
    BevelInner := bvNone;
    ParentBackground := FALSE;
    Tag := 1999;
  end;

end;

destructor TIQWebUDEmbeddedForm.Destroy;
begin
  if Assigned(FDataLink) then
  begin
    FDataLink.OnDataChange := NIL;
    FDataLink.Free;
  end;

  if Assigned(FSourceAttributeDataLink) then
  begin
    FSourceAttributeDataLink.OnDataChange := nil;
    FSourceAttributeDataLink.Free;
  end;

  CheckFreeChild;

  CS.Free;
  inherited;
end;

procedure TIQWebUDEmbeddedForm.Loaded;
begin
  inherited Loaded;
  try
    AssignCaption;
    if TableName = '' then
      TableName := Source;
  except
    if csDesigning in ComponentState then
      Application.HandleException(self)
    else
      raise;
  end;
end;

procedure TIQWebUDEmbeddedForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (AComponent is TIQWebSecurityRegister) and
    (FSecurityRegister = AComponent) then
    SecurityRegister := nil;
end;

function TIQWebUDEmbeddedForm.GetActive: Boolean;
begin
  Result := FActive;
end;

function TIQWebUDEmbeddedForm.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TIQWebUDEmbeddedForm.GetSourceAttribute: string;
begin
  if Assigned(FSourceAttributeDataLink) and
    (FSourceAttributeDataLink.FieldName <> '') and
    Assigned(FSourceAttributeDataLink.Field) then
    Result := UpperCase(Trim(FSourceAttributeDataLink.Field.asString))
  else
    Result := '';
end;

function TIQWebUDEmbeddedForm.GetSourceAttributeField: string;
begin
  Result := FSourceAttributeDataLink.FieldName;
end;

function TIQWebUDEmbeddedForm.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TIQWebUDEmbeddedForm.SetActive(const Value: Boolean);
begin
  FActive := Value;

  if not FActive then
    CheckFreeChild // get rid of the UD form
  else if FActive and not(csDesigning in ComponentState) then
  // attempt to activate the user defined form
    DataChange(nil);
end;

procedure TIQWebUDEmbeddedForm.SetDataField(AValue: string);
begin
  FDataLink.FieldName := AValue;
end;

procedure TIQWebUDEmbeddedForm.SetSourceAttributeField(const Value: string);
begin
  FSourceAttributeDataLink.FieldName := Value;
end;

procedure TIQWebUDEmbeddedForm.SetDataSource(AValue: TDataSource);
begin
  FDataLink.DataSource := AValue;
  FSourceAttributeDataLink.DataSource := AValue;
end;

procedure TIQWebUDEmbeddedForm.SetSecurityRegister
  (const Value: TIQWebSecurityRegister);
begin
  FSecurityRegister := Value;
end;

procedure TIQWebUDEmbeddedForm.SetSource(const Value: string);
begin
  if FSource = Trim(UpperCase(Value)) then
    EXIT;

  FSource := Trim(UpperCase(Value));

  if FTableName = '' then
    FTableName := Value;

  if ComponentState * [csDesigning, csLoading, csReading] = [] then
  // if not Designing, Loading, Reading
    PostMessage(self.Handle, iq_Notify, 0, 0); // refresh caption
end;

procedure TIQWebUDEmbeddedForm.DataChange(Sender: TObject);
begin
  if not(ComponentState = []) then
    EXIT;

  CS.Acquire;
  try
    // check if active
    if not(Active and Assigned(FDataLink.Field) and
      Assigned(FDataLink.DataSource) and (Source > '') and
      (FDataLink.Field.asFloat <> 0)) then
    begin
      CheckFreeChild;
      EXIT;
    end;

    // if source attribute has changed we need to rebuild the object
    if SourceAttribute <> FLastSourceAttribute then
    begin
      FLastSourceAttribute := SourceAttribute;
      CheckFreeChild;
    end;

    // create/refresh child
    if not Assigned(FChild) then
    begin
      if not FCreateChildInProgress then
        try
          FCreateChildInProgress := True;
          CreateChild;
        finally
          FCreateChildInProgress := FALSE;
        end;
    end
    else
      Child.AssignParent_ID(FDataLink.Field.asFloat);

  finally
    CS.Release;
  end;
end;

procedure TIQWebUDEmbeddedForm.IQNotifyMessage(var Msg: TMessage);
begin
  case Msg.WParam of
    0:
      AssignCaption;
    { comes when user defined form changing its structure or on Create }
  end;
end;

procedure TIQWebUDEmbeddedForm.CheckFreeChild;
begin
  if Assigned(FChild) then
    try
      FChild.pnlCarrier.Parent := FChild;
      FChild.Free;
    finally
      FChild := NIL;
    end;
end;

procedure TIQWebUDEmbeddedForm.CreateChild;
var
  S: string;
begin
  try
    FChild := TFrmUserFieldsBuiltIn.Create(self, FPnlCarrier, TableName, Source,
      FDataLink.Field.asFloat, 0 { helpcontext } , SecurityRegister,
      SourceAttribute);
    FChild.AfterStructureChange := self.AfterStructureChange;
    FChild.OnCheckArchived := self.OnCheckArchived;
    FChild.CheckArchived;
  except
    FChild := NIL;
    raise;
  end;
end;

procedure TIQWebUDEmbeddedForm.AssignCaption;
var
  AParent: TTabSheet;

  function _FindTabSheetOf(AControl: TWinControl): TTabSheet;
  begin
    repeat
      if AControl is TTabSheet then
      begin
        Result := TTabSheet(AControl);
        EXIT;
      end;
      AControl := AControl.Parent;
    until not Assigned(AControl);
    Result := nil;
  end;

begin
  if csDesigning in ComponentState then
    EXIT;

  if Assigned(FChild) then
    FPnlTop.Caption := FChild.Caption
  else
    FPnlTop.Caption := DefaultToString
      (GetUD_FormCaption(TableName, Source, SourceAttribute),
      'User Defined Form');

  AParent := _FindTabSheetOf(Parent);
  if Assigned(AParent) then
    AParent.Caption := DefaultToString
      (GetUD_MenuCaption(TableName, Source, SourceAttribute),
      'User Defined Form');
end;

end.
