{08-22-2012 basically we have 2 params that comprise a key:
table_name - example STANDARD
source_attribute - example INJECTION
source_name would be then standard_injection and the user defined view - v_ud_standard_injection }
unit IQMS.Common.UserFields;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus,
  System.Math, wwdbdatetimepicker, Datasnap.DBClient,
  System.Generics.Collections, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  IQXPMan,
//  iqusrmsg,
//  IQSecReg,
//  Iqhpick,
//  IQDBExpress,
  FireDAC.Comp.Client, Iqhpick, IQDBExpress;

type
  TAfterStructureChange = procedure( Sender: TObject ) of object;
  TOnCheckArchivedEvent = procedure( Sender: TObject; var AArchived: Boolean ) of object;

  // used in FControlsList based on UD_Cols_ID to assist in "relational" drop down to find parent drop down
  TXRef = class
    Component: TComponent;
    UD_Cols_Parent_ID: Real;
    constructor Create( AComponent: TComponent; AUD_Cols_Parent_ID: Real);
  end;

  TFrmUsr_Flds = class(TForm)
    DataSource1: TDataSource;
    pnlCarrier: TPanel;
    Panel2: TPanel;
    _sbtnStructure: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    sbtnRefresh: TSpeedButton;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    pgctrlMain: TPageControl;
    SrcUD_Calc: TDataSource;
    cdsUD_Calc: TClientDataSet;
    dbxUD_View: TDbxQuery;
    TabSheet1: TTabSheet;
    PkList: TIQHpick;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure _sbtnStructureClick(Sender: TObject);
    procedure sbtnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure dbxUD_ViewBeforePost(DataSet: TDataSet);
    procedure dbxUD_ViewBeforeOpen(DataSet: TDataSet);
    procedure dbxUD_ViewBeforeEdit(DataSet: TDataSet);
    procedure dbxUD_ViewBeforeDelete(DataSet: TDataSet);
    procedure dbxUD_ViewBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
  private
    { Private declarations }
    FTable_Name: string;
    FParent_ID : Real;
    FSource_Attribute: string;
    FReadOnly: Boolean;
    FSource: string;
    FAfterStructureChange: TAfterStructureChange;
    FOnCheckArchived: TOnCheckArchivedEvent;
    FPkListSQL: string;
    FPkListResultFieldName: string;
    FPkListTargetField: TField;

    procedure IQAfterShowMessage(var Msg: TMessage); message iq_AfterShowMessage;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    function GetView_Name: string;
    function OpenUD_View: Boolean;
    procedure SetTable_Name(const AValue: string);
    procedure SetParent_ID(AValue: Real);
    procedure AssignDataFields;
    function AssignCalcFields: Boolean;
    function GetUD_Tab_ID: Real;
    procedure DrawScreen;
    procedure ClearScreen;
    function Create_Label(const ATop: Integer; const AField: TField; ALabelsPanel: TPanel ): TLabel;
    function Create_Label_DBEdit_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel ): TComponent;
    function Create_Label_DropDown_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel; AStyle: TComboBoxStyle): TComponent;
    function Create_Label_wwDBDateTimePicker_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel): TComponent;
    function Create_Label_CheckBox_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel): TComponent;
    procedure AssignCaption;
    procedure CreateComponents( AUD_Groupbox_ID: Real; ALabelsPanel, AControlsPanel: TPanel );
    procedure DoOnDeleteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckDeleteObsolete(DataSet: TDataSet);
    function GetUD_Data_ID(AUD_Cols_ID, AParent_ID: Real): Real;
    procedure LoadTabsIntoList(AList: TStringList);
    procedure CreateTabSheet( AUD_Tabsheet_ID: Real; ACaption: string  );
    function CreateCalcDataSet: Boolean;
    procedure EvaluateStatement(ASQLText: string; AField: TField);
    procedure AssignPanelsToList(var AList: TList);
    procedure RegistryReadWritePanels(AAction: string);
    procedure AssignControlsToList( var AList: TList; AParent: TWinControl );
    procedure SetSource_Attribute(const Value: string);
    function GetSource_Name: string;
    procedure SetReadOnly(const Value: Boolean);
    procedure FormControlsReadOnly(const AReadOnly: Boolean);
    procedure SetSource(const Value: string);
    procedure UpdateParentNameStatus;
    procedure CheckTableNameValid;
    procedure CheckPostCalcField(AField: TField);
    function Create_Label_wwComboDlg(const ATop: Integer; AField: TField;
      ALabelsPanel, AControlsPanel: TPanel): TComponent;
    procedure wwDBComboDlgPopupMemo(Sender: TObject);
    procedure wwDBComboDlgClear(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AssignScrollBoxRange;
    function GetScrollBoxOn(ATabsheet: TTabsheet): TScrollBox;
    function GetControlsPanelOn( AParent: TWinControl): TPanel;
    function GetParentUD_Drop_Down_Text_ID(AUD_Col_ID: Real): Real;
    procedure LoadDropDownValues(Sender: TObject; AUD_Col_ID: Real);
    procedure wwDBComboBoxUserDropDownReload(Sender: TObject);
    procedure wwDBComboBoxUserDropDownCheckClearDependent(Sender: TObject);
    function ObjectToField(Sender: TObject): TField;
    function ObjectToUD_Cols_ID(Sender: TObject): Real;
    procedure ComboBoxDropDownInvokePicklist(Sender: TObject);
    procedure PopupPickList;
  protected
    SR: TSecurityRegister;
    FTabsList: TStringList;
    FControlsList: TObjectDictionary<Real, TXRef>;
    function HasCalcFields: Boolean;
    procedure PopulateCalcDataSet;
    procedure DoChangeStructure; virtual;
    procedure AssignSecurityRegister; virtual;
    procedure SetControls; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; const ATable_Name, ASource: string;
      AParent_ID: Real; ASource_Attribute: string = ''); virtual;
    procedure CheckArchived;
    property View_Name: string read GetView_Name;
    property Table_Name: string read FTable_Name write SetTable_Name;
    property Parent_ID: Real read FParent_ID write SetParent_ID;
    property UD_Tab_ID: Real read GetUD_Tab_ID;
    property Source_Attribute: string read FSource_Attribute write SetSource_Attribute;
    property Source: string read FSource write SetSource;
    property Source_Name: string read GetSource_Name;
    property IsReadOnly: Boolean read FReadOnly write SetReadOnly;
    property AfterStructureChange: TAfterStructureChange read FAfterStructureChange write FAfterStructureChange;
    property OnCheckArchived: TOnCheckArchivedEvent read FOnCheckArchived write FOnCheckArchived;
  end;

  TFrmUsr_Flds_BuiltIn = class(TFrmUsr_Flds)
  private
  protected
    procedure DoChangeStructure; override;
    procedure RefreshDataSet;
  public
    constructor Create(AOwner: TComponent; AParent: TWinControl;
      const ATable_Name, ASource: string; AParent_ID: Real;
      AHelpContext: THelpContext = 0; ASR: TSecurityRegister = nil;
      ASource_Attribute: string = '');
    procedure AssignParent_ID(AParent_ID: Real);
  end;

  // for our new IQUDEmbeddedForm shell component - just a name change
  TFrmUserFieldsBuiltIn = class(TFrmUsr_Flds_BuiltIn)
  end;


procedure Do_UD_Fields(AOwner: TComponent; const ATable_Name: string; AParent_ID: Real; AHelpContext: THelpContext = 0; ASource_Attribute: string = '' );
procedure AssignUD_MenuCaption(AMenuItem: TMenuItem; const ATable_Name: string; const ASource: string = ''; const ASource_Attribute: string = '' );
procedure AssignUD_SpeedButtonHint( ASpeedButton: TSpeedButton; const ATable_Name: string; const ASource_Attribute: string = '');
function GetUD_MenuCaption(const ATable_Name: string; const ASource: string = ''; const ASource_Attribute: string = ''): string;
function GetUD_FormCaption(const ATable_Name: string; const ASource: string = ''; const ASource_Attribute: string = '' ): string;
function GetUDTableID(const ATable_Name: string; const ASource: string; const ASource_Attribute: string = '' ): Int64;

function GetUD_Tables_ID(const ASource: string; const ASource_Attribute: string = '' ): Real; deprecated 'Use GetUDTableID';
procedure AddUD_FieldsToPkList( AUD_Tables_ID: Real; APk: TIQHpick );
procedure CreateUD_PkListTFields( AUD_Tables_ID: Real; Apk: TIQHpick );

const
  C_LABEL_LEFT: Integer = 8;
  C_START_TOP: Integer = 8;
  C_CONTROL_INCREMENT: Integer = 25;
  C_EDITCONTROL_WIDTH: Integer = 120;
  C_CHECKBOX_WIDTH: Integer = 15;
  C_COMBODLG_WIDTH: Integer = 120;

var
  FrmUsr_Flds: TFrmUsr_Flds;

implementation

{$R *.DFM}

uses IQRegFrm,        IQMesg,
     IQMS.Common.DataLib,   IQNumber,
     Usr_Stru,        IQNLS,
     IQMS.Common.ResStrings,
     System.Variants,
     IQSecIns,        IQString,
     iqctrl,          PanelMsg,
                dbtdbexp,
     IQUDEmbeddedForm,
     usr_def_class,
     EditMemoStr,
     iqerrdlg,
     vcl.wwframe;  // for TwwDBComboBox.ButtonStyle

const
  cERR_LABEL = '[Error!] ';
  cREFRESH_CALC_FIELDS = 1;
  cPOPUP_PICKLIST = 2;

{$REGION 'Internal methods'}

function IsSourceReadOnly(const ASource: string; const ASourceID: Real): Boolean;
begin
  try
    if TableFieldExists(ASource, 'ARCHIVED') then
      Result := SelectValueFmtAsString(
        'SELECT NVL(archived, ''N'') FROM %s WHERE id = %.0f',
        [ASource, ASourceID]) = 'Y'
    // 12/19/2014 Do not include PK_HIDE fields (Byron).
    // EIQ-5382 INV - Allow UD Form to be Edited on Inactive Records Delta CRM#1122061
    {else if TableFieldExists(ASource, 'PK_HIDE') then
      Result := SelectValueFmtAsString(
        'SELECT NVL(pk_hide, ''N'') FROM %s WHERE id = %.0f',
        [ASource, ASourceID]) = 'Y'}
    else
      Result := False;
  except
    Result := False;
  end;
end;

{$ENDREGION 'Internal methods'}

{$REGION 'Public wrappers'}

procedure Do_UD_Fields(AOwner: TComponent; const ATable_Name: string; AParent_ID: Real; AHelpContext: THelpContext = 0; ASource_Attribute: string = '' );
var
  AReadOnly: Boolean;
begin
  AReadOnly := IsSourceReadOnly(ATable_Name, AParent_ID);
  with TFrmUsr_Flds.Create( AOwner, ATable_Name, ATable_Name {table_name a source for compatability}, AParent_ID, ASource_Attribute ) do
  try
    IsReadOnly := AReadOnly;
    HelpContext := AHelpContext;
    ShowModal;
  finally
    Free;
  end;
end;

procedure AssignUD_MenuCaption(AMenuItem: TMenuItem; const ATable_Name, ASource, ASource_Attribute: string);
var
  S: string;
begin
  S:= GetUD_MenuCaption(ATable_Name, ASource, ASource_Attribute ); // SelectValueFmtAsString('select menu_caption from ud_tables where table_name = ''%s''', [ATable_Name]);
  if S > '' then
     AMenuItem.Caption:= S;
end;

procedure AssignUD_SpeedButtonHint( ASpeedButton: TSpeedButton; const ATable_Name, ASource_Attribute: string);
var
  S: string;
begin
  S:= GetUD_MenuCaption(ATable_Name, ASource_Attribute); // SelectValueFmtAsString('select menu_caption from ud_tables where table_name = ''%s''', [ATable_Name]);
  if S > '' then
     ASpeedButton.Hint:= S;
end;

function GetUD_MenuCaption(const ATable_Name, ASource, ASource_Attribute: string): string;
begin
//  Result:= SelectValueFmtAsString(
//  'select menu_caption from ud_tables where table_name = ''%s'' and source = ''%s'' and nvl(rtrim(source_attribute), ''*'') = nvl(''%s'', ''*'')',
//                        [ ATable_Name, FixStr(ASource), FixStr( ASource_Attribute )]);
  Result := SelectValueFmtAsString(
    'select menu_caption from ud_tables where id = %d',
    [GetUDTableID(ATable_Name, ASource, ASource_Attribute)]);

  if Result = '' then
    // IQMS.Common.ResStrings.cTXT0000449 = 'User Defined Form'
    Result :=  IQMS.Common.ResStrings.cTXT0000449;
end;

function GetUD_FormCaption(const ATable_Name, ASource, ASource_Attribute: string): string;
begin
//  Result:= SelectValueFmtAsString('select form_caption from ud_tables where table_name = ''%s'' and source = ''%s'' and nvl(rtrim(source_attribute), ''*'') = nvl(''%s'', ''*'')',
//                        [ ATable_Name, FixStr(ASource), FixStr(ASource_Attribute) ]);

  Result := SelectValueFmtAsString(
    'select form_caption from ud_tables where id = %d',
    [GetUDTableID(ATable_Name, ASource, ASource_Attribute)]);

  if Result = '' then
    // IQMS.Common.ResStrings.cTXT0000449 = 'User Defined Form'
    Result :=  IQMS.Common.ResStrings.cTXT0000449;
end;

function GetUDTableID(const ATable_Name: string; const ASource: string;
  const ASource_Attribute: string = '' ): Int64;
begin
  Result := 0;
  with TFDQuery.Create(nil) do
  try
    Connection := db_dm.FDConnection;
    SQL.Add('select id');
    SQL.Add('  from ud_tables');
    SQL.Add(' where ');

    if ATable_Name > '' then
      SQL.Add(Format('  upper(trim(table_name)) = upper(trim(''%s'')) and',
      [ATable_Name]));

    // source
    if ASource > '' then
      SQL.Add(Format('       upper(trim(source)) = upper(trim(''%s'')) and',
        [FixStr(ASource)]));

    // source
    if ASource_Attribute > '' then
      SQL.Add(Format('       upper(trim(source_attribute)) = upper(trim(''%s'')) and',
        [FixStr(ASource_Attribute)]))
    else
      SQL.Add('       source_attribute is null and');

    SQL.Add('     rownum < 2');
    Open;
    if not (Bof and Eof) then
      Result := Fields[0].AsLargeInt;
  finally
    Free;
  end;
end;

// OBSOLETE - use prior method above
function GetUD_Tables_ID(const ASource, ASource_Attribute: string): Real;
begin
  Result:= SelectValueFmtAsInt64(
    'select id from ud_tables where upper(source) = upper(''%s'') and upper(nvl(rtrim(source_attribute), ''*'')) = upper(nvl(''%s'', ''*''))',
    [ ASource, FixStr( ASource_Attribute )]);
end;

procedure AddUD_FieldsToPkList( AUD_Tables_ID: Real; APk: TIQHpick );
begin
  with TFDQuery.Create(nil) do
  try
    Connection := db_dm.FDConnection;
    SQL.Add(Format('select id, col_name, col_label from ud_cols where ud_tables_id = %f order by seq', [ AUD_Tables_ID ]));
    Open;
    while not Eof do
    begin
      APk.SQL.Add(Format(',  %s as "%s" ', [ FieldByName('col_name').asString, FieldByName('col_label').asString ]));
      Next;
    end;
  finally
    Free;
  end;
end;

procedure CreateUD_PkListTFields( AUD_Tables_ID: Real; APk: TIQHpick );
var
  I: Integer;
  AField: TField;
begin
  APk.FieldDefs.Update;

  for I:= 0 to APk.FieldDefs.Count - 1 do
    if APk.FindField( APk.FieldDefs[ i ].Name ) = nil then
    begin
      AField:= APk.FieldDefs[ I ].CreateField( APk );
      AField.Tag:= Trunc(SelectValueFmtAsFloat('select id from ud_cols where ud_tables_id = %f and upper(col_name) = upper(''%s'')',
                                   [ AUD_Tables_ID, AField.FieldName ]));
      if AField.DataType = ftString then
         AField.DisplayWidth:= 30;  // default
    end;
end;

{$ENDREGION 'Public wrappers'}


{$REGION 'TXRef'}

{ TXRef }
// used in FControlsList based on UD_Cols_ID to assist in "relational" drop down to find parent drop down
constructor TXRef.Create(AComponent: TComponent; AUD_Cols_Parent_ID: Real);
begin
  Component:= AComponent;
  UD_Cols_Parent_ID:= AUD_Cols_Parent_ID;
end;

{$ENDREGION 'TXRef'}



{$REGION 'TFrmUsr_Flds'}

{ TFrmUsr_Flds }

constructor TFrmUsr_Flds.Create(AOwner: TComponent; const ATable_Name,
  ASource: string; AParent_ID: Real; ASource_Attribute: string = '');
begin
  inherited Create(AOwner);
  FReadOnly := IsSourceReadOnly(ATable_Name, AParent_ID);
  Table_Name:= ATable_Name;
  Source := ASource;
  Source_Attribute:= UpperCase(Trim(ASource_Attribute));
  Parent_ID := AParent_ID;
  FTabsList:= TStringList.Create;
  FControlsList:= TObjectDictionary<Real, TXRef>.Create([ doOwnsValues ]);

  Name:= Format('%s_%s', [ Name, Source_Name]);  {change form's name to distinguish diff modules }

  AssignSecurityRegister;

  IQRegFormRead(self, [ self ]);

  if not (Owner is TIQUDEmbeddedForm) then  {embedded form calls the rebuild after pnlCarrier parent is changed}
     sbtnRefreshClick(NIL);

  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
end;

procedure TFrmUsr_Flds.FormShow(Sender: TObject);
begin
  EnsureSecurityInspectorOnTopOf(self);
end;

procedure TFrmUsr_Flds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (dbxUD_View.State = dsEdit) and IQConfirmYN(IQMS.Common.ResStrings.cTXT0000108 {'Save your changes'}) then
     dbxUD_View.Post;
  IQRegFormWrite(self, [ self ]);
  // RegistryReadWritePanels( 'WRITE' ); moved to FormDestroy
  Action:= caFree;
end;

procedure TFrmUsr_Flds.FormDestroy(Sender: TObject);
begin
  FTabsList.Free;
  FControlsList.Free;
  RegistryReadWritePanels( 'WRITE' );
end;

procedure TFrmUsr_Flds.FormResize(Sender: TObject);
var
  I:Integer;
begin
  (*
  for I:= ComponentCount - 1 downto 0 do
    if (Components[I].Tag < 0) and (Components[I] is TDBEdit) then with Components[I] as TDBEdit do
       if DataSource.DataSet.FieldByName(DataField).DataType = ftString then
          Width:= pnlCarrier.Width - Left - 5               // self.ClientWidth - Left - 5
       else
          Width:= iMin(100, pnlCarrier.Width - Left - 5); // iMin(100, self.ClientWidth - Left - 5);
   *)
end;

procedure TFrmUsr_Flds.IQAfterShowMessage(var Msg: TMessage);
begin
  Application.ProcessMessages;

  // 09-16-2014 commented out
  // if (FSource <> '') and (not (ViewExists(View_Name) or (SelectValueFmtAsFloat('select count(*) from ud_cols where ud_tables_id = %f', [ UD_Tab_ID ]) > 0))) then
  //    // 'A structure has not yet been defined.  To define a structure click the Define Structure button.'
  //    IQInformation(IQMS.Common.ResStrings.cTXT0000348);
end;

procedure TFrmUsr_Flds.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    cREFRESH_CALC_FIELDS:
      if HasCalcFields() then
         PopulateCalcDataSet;

    cPOPUP_PICKLIST:
      PopupPickList
  end;
end;

procedure TFrmUsr_Flds.AssignSecurityRegister;
begin
  if SR = nil then
     SR:= TSecurityRegister.Create(self);
  SR.AddSecurityItem('_sbtnStructure');
  SR.Refresh;
end;

function TFrmUsr_Flds.GetView_Name: string;
begin
  Result:= Format('v_ud_%s', [LowerCase( Source_Name )]);     // v_ud_standard_generic
end;

procedure TFrmUsr_Flds.SetTable_Name(const AValue: string);
begin
  FTable_Name:= AValue;
  UpdateParentNameStatus
end;

procedure TFrmUsr_Flds.UpdateParentNameStatus;
begin
  if FSource > '' then
    StatusBar1.Panels[0].Text := Format('Parent: %s [%s]', [FSource, FTable_Name])
  else if FTable_Name > '' then
    StatusBar1.Panels[0].Text := Format('Parent: %s', [FTable_Name])
  else
    StatusBar1.Panels[0].Text := '';
end;

procedure TFrmUsr_Flds.SetControls;
begin
  _sbtnStructure.Visible := not IsReadOnly;
  DBNavigator1.Visible := not IsReadOnly;
end;

procedure TFrmUsr_Flds.SetParent_ID(AValue: Real);
begin
  FParent_ID:= AValue;
  StatusBar1.Panels[2].Text:= Format('Parent ID: %s', [FLoatToStr(FParent_ID)]);
end;

procedure TFrmUsr_Flds.SetReadOnly(const Value: Boolean);
begin
  // 01/09/2014 (Byron)
  // EIQ-1903  Quality modules - archived records should not allow editing User-Defined form CRM #918985
  FReadOnly := Value;
  if FReadOnly then
    begin
      if Assigned(SR) then SR.Refresh;
      FormControlsReadOnly(True);
    end
  else
    begin
      FormControlsReadOnly(False);
      if Assigned(SR) then SR.Refresh;
    end;
  SetControls;
end;

procedure TFrmUsr_Flds.SetSource(const Value: string);
begin
  FSource := Value;
  UpdateParentNameStatus;
end;

procedure TFrmUsr_Flds.SetSource_Attribute(const Value: string);
begin
  FSource_Attribute := Trim(UpperCase(Value));
  StatusBar1.Panels[1].Text:= Format('Attribute: %s', [ Source_Attribute ]);
end;

function TFrmUsr_Flds.GetUD_Tab_ID: Real;
var
  AActualSource: string;
begin
  Result := 0;

  // 03/15/2016 (Byron, EIQ-10768) Remmed this.  It is too confusing.
  // Instead, added GetUDTableID() which will return the ID based on
  // the provided values.
//  if Source > '' then
//    AActualSource := Source
//  else if Table_Name > '' then
//    AActualSource := Table_Name;
//
//  if AActualSource > '' then
//    Result:= SelectValueFmtAsInt64(
//      'select id from ud_tables where source = ''%s'' ' +
//      'and nvl(rtrim(source_attribute), ''*'') = nvl(''%s'', ''*'')',
//      [ AActualSource, FixStr( Source_Attribute )]);

  // 03/15/2016 (Byron, EIQ-10768) Get the UD_TABLES.ID based on provided values.
  Result := GetUDTableID(Table_Name, Source, Source_Attribute);

  if Result = 0 then
  begin
    Result:= GetNextID('ud_tables');
    // 01/03/2008 Changed to iqlib param method (Byron)
    // cTXT0000349 = 'User-Defined Form'
    ExecuteCommandParam(
      'insert into ud_tables(id, table_name, form_caption, menu_caption, source_attribute, source) '+
      'values(:ID, :TABLE_NAME, :FORM_CAPTION, :MENU_CAPTION, :SOURCE_ATTRIBUTE, :SOURCE)',
      ['ID;INT64', 'TABLE_NAME', 'FORM_CAPTION', 'MENU_CAPTION', 'SOURCE_ATTRIBUTE', 'SOURCE' ],
      [Trunc(Result),
      Table_Name,
      IQMS.Common.ResStrings.cTXT0000349,
      IQMS.Common.ResStrings.cTXT0000349,
      Source_Attribute,
      Source ]);
  end;
end;

procedure TFrmUsr_Flds.dbxUD_ViewBeforeDelete(DataSet: TDataSet);
begin
  if IsReadOnly then
    System.SysUtils.Abort;
end;

procedure TFrmUsr_Flds.dbxUD_ViewBeforeEdit(DataSet: TDataSet);
begin
  if IsReadOnly then
    System.SysUtils.Abort;
end;

procedure TFrmUsr_Flds.dbxUD_ViewBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'parent_id', Parent_ID);
end;

function TFrmUsr_Flds.OpenUD_View: Boolean;
var
  I:Integer;
begin
  try
    // 01/03/2008 Pass initial result based on existence of the view
    Result:= ViewExists(View_Name);
    if Result then
    begin
      // close and clear main query
      dbxUD_View.Close;
      dbxUD_View.ResetInternalDataSet;
      // 06/11/2012 Ensure SQLConnection is assigned
      dbxUD_View.SQLConnection := db_dm.DB_DataModule.SQLConnection;
      // assign sql and open the main query
      dbxUD_View.SQL.Clear;
   // dbxUD_View.SQL.Add(IQFormat('select * from %s where parent_id = %f', [View_Name, Parent_ID]));
      dbxUD_View.SQL.Add(IQFormat('select * from %s where parent_id = :parent_id', [ View_Name ]));
      with dbxUD_View.ParamByName('parent_id') do
       begin
         DataType := ftLargeInt;
         ParamType := ptInput;
       end;
      dbxUD_View.Open;

      AssignDataFields;

    end;

    Result:= AssignCalcFields() or Result;

  except on E: Exception do
    begin
      Result:= FALSE;
      // 'Please check user defined structure.'#13#13'Unable to open %s'#13#13'%s'
      IQInformation(Format(IQMS.Common.ResStrings.cTXT0000248, [View_Name, E.Message]));
    end;
  end;
end;

procedure TFrmUsr_Flds.AssignDataFields;
var
  I: Integer;
  A: Variant;
  Tab_ID: Real;
begin
  {Fields are: TAB_ID, Parent_ID, User1, User2 etc}
  with dbxUD_View do
    for I:= 0 to FieldCount - 1 do
    begin
      A:= SelectValueArrayFmt('select ID, col_label from ud_cols where ud_tables_id = %f and col_name = ''%s''',
                         [UD_Tab_ID, Fields[I].FieldName]);

      if VarArrayDimCount(A) > 0 then
      with Fields[I] do
      begin
        DisplayLabel:= A[1];
        Tag         := Trunc(A[0]);  {Keep UD_Cols ID in the tag }
      end;
    end;
end;

function TFrmUsr_Flds.AssignCalcFields: Boolean;
begin
  Result:= CreateCalcDataSet;
  if Result then
     PopulateCalcDataSet;
end;

function TFrmUsr_Flds.CreateCalcDataSet: Boolean;
var
  I: Integer;
  Qry: TFDQuery;
begin
  Result:= FALSE;
  cdsUD_Calc.Close;
  while cdsUD_Calc.FieldCount > 0 do cdsUD_Calc.Fields[ 0 ].Free;
  cdsUD_Calc.FieldDefs.Clear;

  Qry:= TFDQuery.Create(nil);
  try
    Qry.Connection := db_dm.FDConnection;
    Qry.SQL.Add(IQFormat('select id, col_name, col_type from ud_cols where ud_tables_id = %.0f and col_kind = ''C'' and sql_text is not null order by seq', [ UD_Tab_ID ]));
    Qry.Open;
    while not Qry.Eof do
    begin
      if Qry.FieldByName('col_type').asString = 'C' then
         with cdsUD_Calc.FieldDefs.AddFieldDef do
         begin
           Name:= Qry.FieldByName('col_name').asString;
           DataType:= ftString;
           Size:= 255;
         end

      else if Qry.FieldByName('col_type').asString = 'N' then
         with cdsUD_Calc.FieldDefs.AddFieldDef do
         begin
           Name:= Qry.FieldByName('col_name').asString;
           DataType:= ftFloat;
         end

      else if Qry.FieldByName('col_type').asString = 'D' then
         with cdsUD_Calc.FieldDefs.AddFieldDef do
         begin
           Name:= Qry.FieldByName('col_name').asString;
           DataType:= ftDateTime;
         end;

      Result:= TRUE;
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;

  if Result then
  begin
    cdsUD_Calc.CreateDataSet;
    cdsUD_Calc.Open;
  end;
end;

procedure TFrmUsr_Flds.PopulateCalcDataSet;
var
  A: Variant;
  I: Integer;
  // hMsg: TPanelMesg;
begin
  // hMsg:= hPleaseWait('Evaluating query based values ...');
  try
    {prepare room for values}
    while not cdsUD_Calc.Eof do cdsUD_Calc.Delete;

    cdsUD_Calc.Append;

    for I:= 0 to cdsUD_Calc.Fields.Count - 1 do
    begin
      A:= SelectValueArrayFmt('select id, col_label, sql_text from ud_cols where ud_tables_id = %f and col_name = ''%s''',
                         [UD_Tab_ID, cdsUD_Calc.Fields[ I ].FieldName ]);

      if VarArrayDimCount(A) > 0 then
         with cdsUD_Calc.Fields[ I ] do
         begin
           DisplayLabel:= A[ 1 ];
           Tag         := Trunc(A[ 0 ]);  {Keep UD_Cols ID in the tag }
           // hMsg.Mesg:= Format('Evaluating query based field "%s"...', [ DisplayLabel ]);
           EvaluateStatement( A[ 2 ], cdsUD_Calc.Fields[ I ]);
           CheckPostCalcField( cdsUD_Calc.Fields[ I ]);
         end;
    end;

    cdsUD_Calc.CheckBrowseMode;
  finally
    // hMsg.Free;
  end;
end;

procedure TFrmUsr_Flds.EvaluateStatement( ASQLText: string; AField: TField );
var
  Qry: TFDQuery;
begin
  Qry:= TFDQuery.Create(nil);
  try
    Qry.Connection := db_dm.FDConnection;
    Qry.SQL.Add( ASQLText );
    if Qry.Params.FindParam('id') <> nil then
       Qry.Params.ParamByName('id').Value := Parent_ID;
    try
      Qry.Open;
    except on E: Exception do
      begin
        AField.DisplayLabel:= Format('%s%s', [ cERR_LABEL, AField.DisplayLabel ]);
        AField.Origin:= E.Message;  {use origin as cargo for error description. we will assign that to the associated label hint}
        EXIT;
      end;
    end;

    case AField.DataType of
      ftFloat, ftFMTBcd:
         if Qry.Fields[ 0 ].asFloat <> 0 then
            AField.asFloat:= Qry.Fields[ 0 ].asFloat
         else
            AField.Clear;

      ftDateTime:
         if Qry.Fields[ 0 ].asDateTime > 0 then
            AField.asFloat:= Qry.Fields[ 0 ].asDateTime
         else
            AField.Clear;
    else
      AField.asString:= Qry.Fields[ 0 ].asString;
    end;

  finally
    Qry.Free;
  end;
end;

procedure TFrmUsr_Flds.CheckPostCalcField( AField: TField );
var
  AUD_Data_ID: Real;
  S: string;
begin
  if AField.Tag = 0 then EXIT;

  AUD_Data_ID:= GetUD_Data_ID( AField.Tag {ud_cols_id}, Parent_ID );

  case AField.DataType of
    ftFloat, ftFmtBCD:
       begin
         if AUD_Data_ID = 0 then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'insert into ud_data (ud_cols_id, parent_id, nuser) values(%d, %.0f, %.6f)',
                           [ AField.Tag, Parent_ID, AField.asFloat ])

         else if AField.asFloat <> DBX_GetValFmt( dbxUD_View.SQLConnection,
                                                 'select nuser from ud_data where id = %f',
                                                 [ AUD_Data_ID ]) then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'update ud_data set nuser = %.6f where id = %.0f',
                           [ AField.asFloat, AUD_Data_ID ]);
       end;

    ftDateTime, ftTimeStamp:
       begin
         S:= '';
         if AField.asString > '' then
            S:= FormatDateTime('MM/DD/YYYY', AField.asDateTime);

         if AUD_Data_ID = 0 then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'insert into ud_data(ud_cols_id, parent_id, duser) values(%d, %.0f, to_date(''%s'', ''MM/DD/RRRR''))',
                           [ AField.Tag, Parent_ID, S ])

         else if AField.asDateTime <> DBX_GetValFmt( dbxUD_View.SQLConnection,
                                                     'select duser from ud_data where id = %f',
                                                     [ AUD_Data_ID ]) then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'update ud_data set duser = to_date(''%s'', ''MM/DD/RRRR'') where id = %.0f',
                           [ S, AUD_Data_ID ]);
       end;

    else
       begin
          if AUD_Data_ID = 0 then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'insert into ud_data(ud_cols_id, parent_id, cuser) values(%d, %.0f, ''%s'')',
                           [ AField.Tag, Parent_ID, FixStr( AField.asString) ])

          else if AField.asString <> DBX_GetValStrFmt( dbxUD_View.SQLConnection,
                                                       'select cuser from ud_data where id = %f',
                                                       [ AUD_Data_ID ]) then
            DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                           'update ud_data set cuser = ''%s'' where id = %.0f',
                           [ FixStr(AField.asString), AUD_Data_ID ]);
       end;
  end;
end;


procedure TFrmUsr_Flds.DrawScreen;
var
  I: Integer;
  ARowControlsPanel: TPanel;
begin
  AssignCaption;

  if dbxUD_View.State = dsBrowse then
  begin
    LoadTabsIntoList( FTabsList );

    pgctrlMain.Visible:= FALSE;    // make invisible to speed up drawing
    try
    for I:= 0 to FTabsList.Count - 1 do
      CreateTabsheet( LongInt(FTabsList.Objects[ I ]), FTabsList[ I ] );
    finally
      pgctrlMain.Visible:= TRUE;
    end;

    if pgctrlMain.PageCount > 0 then
    begin
      pgctrlMain.Pages[ 0 ].TabVisible:= pgctrlMain.PageCount > 1;
      pgctrlMain.ActivePageIndex:= 0;
    end;
  end;
  ForceRefreshSecurityInspector; // refreshes the SR items

  // 01/09/2014 (Byron)
  // EIQ-1903  Quality modules - archived records should not allow editing User-Defined form CRM #918985
  CheckArchived;

  RegistryReadWritePanels( 'READ' );
  AssignScrollBoxRange;
end;

procedure TFrmUsr_Flds.AssignCaption;
begin
  Caption:= SelectValueFmtAsString('select form_caption from ud_tables where id = %f', [UD_Tab_ID]);
end;

procedure TFrmUsr_Flds.LoadTabsIntoList( AList: TStringList );
begin
  AList.Clear;
  with TFDQuery.Create(nil) do
  try
    Connection := db_dm.FDConnection;
    SQL.Add(IQFormat('select id, caption from ud_tabsheet where ud_tables_id = %f order by seq, id', [ UD_Tab_ID ]));
    Open;
    while not Eof do
    begin
      AList.AddObject( FieldByName('caption').asString, Pointer( FieldByName('id').asInteger ));  // keep ud_tabsheet_id in the list object
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmUsr_Flds.CreateTabSheet( AUD_Tabsheet_ID: Real; ACaption: string  );
var
  ATabsheet: TTabsheet;
  ALastRowNum: Real;
  AScrollBox : TScrollBox;
  ATabsheetScrollBox : TScrollBox;

  ARowPanel: TPanel;
  AGroupBox: TGroupBox;

  ALabelsPanel  : TPanel;
  AControlsPanel: TPanel;

  {----------------------------------------------------------------------------}
  procedure _CreateRowPanel( var ARowPanel: TPanel; ARowNum: Real );
  begin
    // if this is new but not the first row panel - add a splitter aligned to top
    if Assigned(ARowPanel) then
       with TSplitter.Create(self) do
       begin
         Parent     := ATabsheetScrollBox;
         Color      := clWindow;
         //ParentColor:= FALSE;
         Align      := alTop;
         Top:= 9999;
       end;

    // new row panel
    ARowPanel:= TPanel.Create(self);
    with ARowPanel do
    begin
      Parent := ATabsheetScrollBox;
      Name   := Format('pnl_row_%.0f_%s', [ ARowNum,  ATabsheet.Name ]);
      Align  := alTop;
      Caption:= '';
      Height := 120;
      BevelOuter:= bvNone;
      Top    := 9999;
    end;
  end;

  {----------------------------------------------------------------------------}
  procedure _CreateGroupBox( var AGroupBox: TGroupBox; var ALabelsPanel, AControlsPanel: TPanel; AUD_GroupBox_ID: Real; AName, ACaption: string );
  begin
    // create groupbox on the ARowPanel. Start with a splitter
    if Assigned(AGroupBox) then
       with TSplitter.Create(self) do
       begin
         Parent:= ARowPanel;
         Color := clWindow;
         Align := alLeft;
         Width := 4;
         Left  := 9999;
         Name  := Format( 'split_groupbox_%s', [ AGroupBox.Name ]);
       end;

    AGroupBox:= TGroupBox.Create( self );
    with AGroupBox do
    begin
      Parent := ARowPanel;
      Align  := alLeft;
      Name   := AName;
      Caption:= sIIf( ACaption > '', Format( '  %s  ', [ ACaption ]), '');
      Width  := 160;
      Left   := 9999;
    end;

    AScrollBox:= TScrollBox.Create( self );
    with AScrollBox do
    begin
      Parent    := AGroupBox;
      Align     := alClient;
      Name      := Format('scrollbox_%s', [ AGroupBox.Name ]);
      AutoScroll:= TRUE;
      BorderStyle:= bsNone;
      ParentBackground:= TRUE;
    end;

    // now create 2 panels and a splitter in that groupbox
    ALabelsPanel:= TPanel.Create(self);
    with ALabelsPanel do
    begin
      Parent := AScrollBox;
      Name   := Format( 'pnl_labels_%s', [ AGroupBox.Name ]);
      Align  := alLeft;
      Caption:= '';
      Width  := 80;
      BevelOuter:= bvNone;
    end;

    with TSplitter.Create(self) do
    begin
      Parent:= AScrollBox;
      Align := alLeft;
      Left  := 9999;
      Width := 3;
    end;

    AControlsPanel:= TPanel.Create(self);
    with AControlsPanel do
    begin
      Parent := AScrollBox;
      Name   := Format( 'pnl_controls_%s', [ AGroupBox.Name ]);
      Align  := alClient;
      Caption:= '';
      BevelOuter:= bvNone;
    end;
  end;

{------------------------------------------------------------------------------}
{ Main of CreateTabSheet }
{------------------------------------------------------------------------------}
begin
  ATabsheet:= TTabSheet.Create( pgctrlMain );
  with ATabsheet do
  begin
    PageControl:= pgctrlMain;
    Caption    := ACaption;
    Name       := SelectValueByID('name', 'ud_tabsheet',  AUD_Tabsheet_ID);
    AlignWithMargins:= TRUE;
  end;

  if SelectValueFmtAsFloat('select count(*) from ud_groupbox where ud_tabsheet_id = %f', [ AUD_Tabsheet_ID ]) = 0 then
     EXIT;

  ATabsheetScrollBox:= TScrollBox.Create( self );
  with ATabsheetScrollBox do
  begin
    Parent:= ATabsheet;
    Align := alClient;
    Name := Format('tabsheet_scrollbox_%s', [ ATabsheet.Name ]);
    BorderStyle:= bsNone;
    Color:= clWindow;
  end;

  ALastRowNum:= 0;
  ARowPanel  := nil;
  AGroupBox  := nil;

  with TFDQuery.Create(nil) do
  try
    Connection := db_dm.FDConnection;
    SQL.Add(IQFormat('select id, name, caption, row_num, col_num from ud_groupbox where ud_tabsheet_id = %f order by row_num, col_num',
                     [ AUD_Tabsheet_ID ]));
    Open;
    while not Eof do
    begin
      // check create row container of groupboxes
      // -----------------------------------------------------------------------
      if (FieldByName('row_num').asFloat <> ALastRowNum) or not Assigned(ARowPanel) then
      begin
        ALastRowNum:= FieldByName('row_num').asFloat;

        // realign last groupbox to client
        if Assigned(AGroupBox) then
           AGroupBox.Align:= alClient;
        AGroupBox:= nil;

        // new row panel
        _CreateRowPanel( ARowPanel, FieldByName('row_num').asFloat );
      end;

      // now the group box  along with 2 panels on it
       _CreateGroupBox( AGroupBox, ALabelsPanel, AControlsPanel, FieldByName('id').asInteger, FieldByName('name').asString, FieldByName('caption').asString);

      // create labels and dbedits on corresponding panels
      CreateComponents( FieldByName('id').asFloat {groupbox_id}, ALabelsPanel, AControlsPanel );

      // next groupbox
      Next;
    end;

    // realign last row panel to client
    if Assigned(ARowPanel) then
    begin
      ARowPanel.Align:= alClient;
      // realign last groupbox on the row panel to client
      if Assigned(AGroupBox) then
         AGroupBox.Align:= alClient;
    end;
  finally
    Free;
  end;
end;


procedure TFrmUsr_Flds.CreateComponents( AUD_Groupbox_ID: Real; ALabelsPanel, AControlsPanel: TPanel );
var
  I         : Integer;
  ATop      : Integer;
  AComponent: TComponent;
  AQry      : TFDQuery;

  procedure local_create_component( AField: TField );
  var
    AUseComponent: string;
  begin
    if (AField.Tag > 0) then  { Tag = UD_Cols.ID }
    begin
      // Initialize var
      AComponent:= NIL;
      AUseComponent:= SelectValueByID('use_component', 'ud_cols', AField.Tag);

      // User-defined combo box
      if AUseComponent = 'DROP-DOWN' then
         AComponent:= Create_Label_DropDown_Pair( ATop, AField, ALabelsPanel, AControlsPanel, csDropDown )

      // dropdown listbox
      else if AUseComponent = 'DROP-DOWN-LIST' then
         AComponent:= Create_Label_DropDown_Pair( ATop, AField, ALabelsPanel, AControlsPanel, csDropDownList )

      // Checkbox
      else if AUseComponent = 'CHECKBOX' then
         AComponent:= Create_Label_CheckBox_Pair( ATop, AField, ALabelsPanel, AControlsPanel )

      // Date/Time control
      else if AField.DataType in [ftDateTime, ftTimeStamp] then
         AComponent:= Create_Label_wwDBDateTimePicker_Pair(ATop, AField, ALabelsPanel, AControlsPanel )

      else if AUseComponent = 'MEMO' then
         AComponent:= Create_Label_wwComboDlg(ATop, AField, ALabelsPanel, AControlsPanel )

      // Default edit box
      else
         AComponent:= Create_Label_DBEdit_Pair(ATop, AField, ALabelsPanel, AControlsPanel );

      // Apply security based on component name
      if Assigned(AComponent) then
         SR.AddSecurityItem(AComponent.Name);

      IQXPMan.CheckHasDataSourceAssignAltF1Handler( AComponent );

      // Increment the top value for the next control
      Inc(ATop, C_CONTROL_INCREMENT);
    end;
  end;

begin
  // Initialize top value to default
  ATop := C_START_TOP;

  {get fields on this tabsheet}
  AQry:= TFDQuery.Create(nil);
  try
    AQry.Connection := db_dm.FDConnection;
    AQry.SQL.Add(IQFormat('select id, col_name from ud_cols where ud_tables_id = %.0f and ud_groupbox_id = %f order by groupbox_seq, seq',
                        [ UD_Tab_ID, AUD_Groupbox_ID ]));
    AQry.Open;
    while not AQry.Eof do
    begin
      if dbxUD_View.FindField( AQry.FieldByName('col_name').asString ) <> nil then
         local_create_component( dbxUD_View.FieldByName( AQry.FieldByName('col_name').asString ))

      else if cdsUD_Calc.FindField( AQry.FieldByName('col_name').asString ) <> nil then
         local_create_component( cdsUD_Calc.FieldByName( AQry.FieldByName('col_name').asString ));

      AQry.Next;
    end;
  finally
    AQry.Free;
  end;

  // Set the height of the control carrier.  This control is inside
  // the scrollbox.  By setting the height, we ensure all controls
  // are visible.
  if pgctrlMain.Height < ATop then
     pgctrlMain.Height:= ATop;

  // Adjust controls that have a right-align anchor.  This will
  // only apply to TEdit controls and user-defined combo boxes.
  iqctrl.AdjustRightAlignedControlsToParent( AControlsPanel );

  if AControlsPanel.Parent is TScrollBox then
     TScrollBox(AControlsPanel.Parent).VertScrollBar.Range:= ATop;
end;

procedure TFrmUsr_Flds.ClearScreen;
var
  I, J: Integer;
  ATabsheet: TTabsheet;
  AList: TList;
begin
  RegistryReadWritePanels( 'WRITE' );

  FControlsList.Clear;  // TObjectDictionary with value ownership - will free the cargo objects

  for I:= ComponentCount - 1 downto 0 do
    if (Components[I].Tag < 0) and not ((Components[I] is TPanel) or (Components[I] is TGroupbox)) then   {all added on fly components like labels and dbedits have tag = -1}
    begin
      {remove from SR}
      if Copy(Components[I].Name, 1, 14) = '_ud_component_'  then
         SR.RemoveSecurityItem(Components[I].Name);

      (Components[I] as TControl).Visible:= FALSE;   {wwDBComboBox was throwing AV while being freed and the focus was shifting}
      Components[I].Free;
    end;

  {get rid of the panels, groupboxes and tabsheets}
  AList:= TList.Create;
  try
    for I:= pgctrlMain.PageCount - 1 downto 0 do
    begin
      AList.Clear;
      AssignControlsToList( AList, pgctrlMain.Pages[ I ]);

      for J:= 0 to AList.Count - 1 do
        TObject(AList[ J ]).Free;

      ATabsheet:= pgctrlMain.Pages[ I ];
      ATabsheet.PageControl:= nil;
      ATabsheet.Free;
    end;
  finally
    AList.Free;
  end;
end;

procedure TFrmUsr_Flds.AssignControlsToList( var AList: TList; AParent: TWinControl );
var
  I: Integer;
begin
  for I:= 0 to AParent.ControlCount - 1 do
  begin
    if (AParent.Controls[ I ] is TPanel) or (AParent.Controls[ I ] is TGroupBox) or (AParent.Controls[ I ] is TScrollBox) then
       AssignControlsToList( AList, AParent.Controls[ I ] as TWinControl );  // recursion

    AList.Add( AParent.Controls[ I ]);
  end;
end;

procedure TFrmUsr_Flds.AssignPanelsToList( var AList: TList );
var
  I, J     : Integer;
  ATabsheet: TTabSheet;
  AControlsList: TList;
begin
  if pgctrlMain = nil then EXIT;

  AControlsList:= TList.Create;
  try
    for I:= 0 to pgctrlMain.PageCount - 1 do
    begin
      ATabsheet:= pgctrlMain.Pages[ I ];

      AControlsList.Clear;
      AssignControlsToList( AControlsList, ATabsheet );

      for J:= 0 to AControlsList.Count - 1 do
        if (TObject(AControlsList[ J ]) is TGroupBox) or (TObject(AControlsList[ J ]) is TPanel) then
           AList.Add( AControlsList[ J ]);
    end;
  finally
    AControlsList.Free;
  end;
end;

procedure TFrmUsr_Flds.RegistryReadWritePanels( AAction: string );
var
  AList: TList;
  I: Integer;
begin
  AList:= TList.Create;
  try
    AssignPanelsToList( AList );

    for I:= 0 to AList.Count - 1 do
    begin
      if AAction = 'READ' then
         IQRegFormRead ( self, [ AList[ I ] ])
      else if AAction = 'WRITE' then
         IQRegFormWrite( self, [ AList[ I ] ]);
    end;
  finally
    AList.Free;
  end;
end;

function TFrmUsr_Flds.GetScrollBoxOn( ATabsheet: TTabsheet ): TScrollBox;
var
  I: Integer;
begin
  Result:= nil;
  for I:= 0 to ATabsheet.ControlCount - 1 do
    if (ATabsheet.Controls[ I ] is TScrollBox) and (CompareText(Copy(TScrollBox(ATabsheet.Controls[ I ]).Name, 1, 19 ), 'tabsheet_scrollbox_') = 0 ) then
    begin
      Result:= TScrollBox(ATabsheet.Controls[ I ]);
      BREAK;
    end;
end;

function TFrmUsr_Flds.GetControlsPanelOn( AParent: TWinControl): TPanel;
var
  I: Integer;
begin
  Result:= nil;
  for I:= 0 to AParent.ControlCount - 1 do
    if (AParent.Controls[ I ] is TScrollBox) then
       begin
         Result:= GetControlsPanelOn( TWinControl(AParent.Controls[ I ]));  // recursion
         BREAK;
       end
    else if (AParent.Controls[ I ] is TPanel) and (CompareText(Copy(TPanel(AParent.Controls[ I ]).Name, 1, 13 ), 'pnl_controls_') = 0 ) then
      begin
        Result:= TPanel(AParent.Controls[ I ]);
        BREAK;
      end;
end;

procedure TFrmUsr_Flds.AssignScrollBoxRange;
var
  I, J, K  : Integer;
  ATabsheet: TTabSheet;
  AControlsList: TList;
  ATotalHeight: Integer;
  ATotalWidth : Integer;
  AScrollBox: TScrollBox;
  AZeroWidthList: TList<TPanel>;
  APanel: TPanel;
  ARowPanel: TPanel;
  AStyle: NativeInt;

  // ---------------------------------------------------------------------------
  function _GetTotalGroupBoxesWidthOn( ARowPanel: TPanel ): Integer;
  var
    I: Integer;
    AControlsPanel: TPanel;
    AGroupBox: TGroupBox;
  begin
    Result:= 0;

    for I:= 0 to ARowPanel.ControlCount -1 do
      if ARowPanel.Controls[ i ] is TGroupBox then
         begin
           AGroupBox:= TGroupBox(ARowPanel.Controls[ i ]);
           AControlsPanel:= GetControlsPanelOn( AGroupBox );

           // check controls panel shrunk to 0
           if Assigned(AControlsPanel) and (AControlsPanel.Width = 0) then
              AZeroWidthList.Add( AControlsPanel );

           // keep client aligned to be at least 200 wide to accomodate labels and controls
           if AGroupBox.Align = alClient then
              Inc(Result, Max(200, AGroupBox.Width))
           else
              Inc(Result, AGroupBox.Width)
         end

      else if ARowPanel.Controls[ i ] is TSplitter then with TSplitter(ARowPanel.Controls[ i ]) do
         begin
           if CompareText( Copy(Name,1,15) , 'split_groupbox_') = 0 then
              Inc(Result, Width )
         end;
  end;


  // ---------------------------------------------------------------------------
  function _GetMaxGroupboxesHeight( ARowPanel: TPanel ): Integer;
  var
    I,J: Integer;
    AControlsPanel: TPanel;
    AGroupBox: TGroupBox;
    AMaxHeight: Integer;
    AControl: TControl;
  begin
    Result:= 0;

    for I:= 0 to ARowPanel.ControlCount -1 do
      if ARowPanel.Controls[ i ] is TGroupBox then
      begin
        AGroupBox:= TGroupBox(ARowPanel.Controls[ i ]);
        AControlsPanel:= GetControlsPanelOn( AGroupBox );

        AMaxHeight:= 0;
        for J:= 0 to AControlsPanel.ControlCount - 1 do
        begin
          AControl:= AControlsPanel.Controls[ J ];
          if AMaxHeight < AControl.Top + AControl.Height then
             AMaxHeight:= AControl.Top + AControl.Height;
        end;

        if Result < AMaxHeight then
           Result:= AMaxHeight;
      end;
  end;

begin
  if pgctrlMain = nil then EXIT;

  AControlsList:= TList.Create;
  AZeroWidthList:= TList<TPanel>.Create;
  try
    for I:= 0 to pgctrlMain.PageCount - 1 do
    begin
      ATabsheet:= pgctrlMain.Pages[ I ];
      AScrollBox:= GetScrollBoxOn( ATabsheet );
      if not Assigned(AScrollBox) then
         Continue;  // s/n happen

      AScrollBox.VertScrollBar.Range:= 0;
      AScrollBox.HorzScrollBar.Range:= 0;

      AControlsList.Clear;
      AZeroWidthList.Clear;
      ATotalHeight:= 0;
      ATotalWidth := 0;
      AssignControlsToList( AControlsList, ATabsheet );

      for J:= 0 to AControlsList.Count - 1 do
      begin
        // panels aligned to top and groupboxes inside
        if (TObject(AControlsList[ J ]) is TPanel) and (CompareText( Copy( TPanel(AControlsList[ J ]).Name, 1, 8), 'pnl_row_') = 0) then
           begin
             ARowPanel:= TPanel( AControlsList[ J ]);

             // row panel height
             if ARowPanel.Align = alClient then
                Inc( ATotalHeight, Max( _GetMaxGroupBoxesHeight( ARowPanel ), ARowPanel.Height ))
             else
                Inc( ATotalHeight, ARowPanel.Height);

             // get all groupboxes width inside this panel
             ATotalWidth:= Max( ATotalWidth, _GetTotalGroupBoxesWidthOn( ARowPanel ));
           end

        // top aligned splitters
        else if (TObject(AControlsList[ J ]) is TSplitter) then with TSplitter( AControlsList[ J ]) do
           begin
             if Align = alTop then
                Inc(ATotalHeight, Height)
           end
      end;

      // assign scrollbox range
      AScrollBox.VertScrollBar.Range:= ATotalHeight;
      AScrollBox.HorzScrollBar.Range:= ATotalWidth;

      // prevent main vertical scrollbar to sit on top of the individual scrollboxes vertical scrollbars by reducing main scrollbar horz range
      AStyle:= GetWindowLong(AScrollBox.Handle,GWL_STYLE);
      if (AStyle and WS_VSCROLL = WS_VSCROLL) and (AStyle and WS_HSCROLL = WS_HSCROLL)  then
         AScrollBox.HorzScrollBar.Range:= ATotalWidth - 20;

      // adjust controls on the controls panel in a groupbox that had width = 0
      for APanel in AZeroWidthList do
      begin
         for K:= 0 to APanel.ControlCount - 1 do
           if APanel.Controls[ K ].Width = 0 then
              APanel.Controls[ K ].Width:= APanel.Width - 5;
      end;
    end;
  finally
    AControlsList.Free;
    AZeroWidthList.Free;
  end;
end;


function TFrmUsr_Flds.Create_Label(const ATop: Integer; const AField: TField; ALabelsPanel: TPanel ): TLabel;
begin
  // Initialization
  Result := NIL;
  // Create the label
  Result := TLabel.Create(self);
  with Result do
  begin
    Parent  := ALabelsPanel;
    Left    := C_LABEL_LEFT;
    Top     := ATop;
    Caption := AField.DisplayLabel;
    Tag     := -ATop;    {Set tag to a negative number. Make label and DBEdit the same number to link them logically}
    if Copy(Caption, 1, Length(cERR_LABEL)) = cERR_LABEL then
    begin
      Font.Color:= clRed;
      Hint:= AField.Origin;
      SHowHint:= TRUE;
    end;
  end;
end;

function TFrmUsr_Flds.Create_Label_DBEdit_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel ): TComponent;
var
   ALabel: TLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = NIL then Exit;

  Result:= TDBEdit.Create(self);
  with TDBEdit(Result) do
  begin
    Name  := Format('_ud_component_%s', [AField.FieldName]);
    Parent:= AControlsPanel;
    Left  := 0;
    Top   := ATop;
    Width := C_EDITCONTROL_WIDTH;
    if AField.DataType in [ftString, ftWideString] then
       Anchors:= [akLeft, akTop, akRight];

    if AField.DataSet = cdsUD_Calc then
       DataSource:= SrcUD_Calc
    else
       DataSource:= DataSource1;

    DataField := AField.FieldName;
    Tag       := -ATop;
    if AField.DataType in [ftDateTime, ftTimeStamp]  then
    begin
      AField.EditMask:= '!##/##/####;1;_';
      OnKeyDown := DoOnDeleteKeyDown;
    end;
    ReadOnly:= AField.DataSet = cdsUD_Calc;
    if ReadOnly then
       Color:= clBtnFace;
  end;

  ALabel.FocusControl := TDBEdit(Result);
  iqctrl.CenterLabel(TDBEdit(Result), ALabel);
end;


function TFrmUsr_Flds.Create_Label_wwComboDlg( const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel ): TComponent;
var
   ALabel: TLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = NIL then Exit;

  Result:= TIQwwDBComboDlg.Create(self);
  with TIQwwDBComboDlg( Result ) do
  begin
    Name  := Format('_ud_component_%s', [AField.FieldName]);
    Parent:= AControlsPanel;
    Left  := 0;
    Top   := ATop;
    Width := C_COMBODLG_WIDTH;
    if AField.DataType in [ftString, ftWideString] then
       Anchors:= [akLeft, akTop, akRight];

    OnCustomDlg:= wwDBComboDlgPopupMemo;
    OnKeyDown:= wwDBComboDlgClear;

    if AField.DataSet = cdsUD_Calc then
       DataSource:= SrcUD_Calc
    else
       DataSource:= DataSource1;

    DataField := AField.FieldName;
    Tag       := -ATop;
    ReadOnly:= AField.DataSet = cdsUD_Calc;
    if ReadOnly then
       Color:= clBtnFace;
  end;

  ALabel.FocusControl := TIQwwDBComboDlg(Result);
  iqctrl.CenterLabel(TIQwwDBComboDlg(Result), ALabel);
end;


function TFrmUsr_Flds.ObjectToField(Sender: TObject): TField;
var
  ADataSet  : TDataSet;
  AFieldName: string;
begin
  {The purpose of this function is to take the sender (currently just TwwDBComboBox)
   and derive the associated field.
  }
  Result:= nil;

  // for now supports only wwdbcombobox
  if (Sender is TwwDBComboBox) then with TwwDBComboBox(Sender) do
    begin
      if Assigned(DataSource) and Assigned(DataSource.DataSet) and (DataField <> '') then
         begin
           ADataSet  := DataSource.DataSet;
           AFieldName:= DataField;
         end;
    end
  else
    EXIT;

  Result:= ADataSet.FieldByName( AFieldName );
end;


function TFrmUsr_Flds.ObjectToUD_Cols_ID( Sender: TObject ): Real;
var
  AField    : TField;
begin
  {The purpose of this function is to take the sender (currently just TwwDBComboBox)
   and derive the UD_Cols_ID of the associated field.
  }
  Result:= 0;

  AField:= ObjectToField( Sender );

  if not Assigned(AField) then
    EXIT;

  Result:= AField.Tag;  // ud_cols_id
end;


function TFrmUsr_Flds.GetParentUD_Drop_Down_Text_ID( AUD_Col_ID: Real ): Real;
var
  AThis, AParent: TXRef;
begin
  // Note: if drop-down component A has a parent B then locate the drop-down B,
  // then using its UD_Cols_ID *and* TEXT value locate corresponding record in ud_drop_down_text.

  Result:= 0;
  // find parent component
  if not FControlsList.TryGetValue( AUD_Col_ID, AThis ) then
     EXIT;

  if (AThis.UD_Cols_Parent_ID = 0) then
     EXIT;

  if not FControlsList.TryGetValue( AThis.UD_Cols_Parent_ID, AParent ) then
     EXIT;

  if not Assigned(AParent.Component) or not (AParent.Component is TwwDBComboBox) then
     EXIT;

  Result:= SelectValueFmtAsFloat('select id from ud_drop_down_text where ud_cols_id = %f and text = ''%s''',
                     [ AThis.UD_Cols_Parent_ID,                                // parent ud_cols_id
                       FixStr( TwwDBComboBox( AParent.Component ).Value )]);   // parent text value
end;


procedure TFrmUsr_Flds.LoadDropDownValues( Sender: TObject; AUD_Col_ID: Real );

  // -----------------------------------------------------------------------------
  procedure _assign_drop_down_values;
  var
    AUD_Drop_Down_Parent_ID: Real;
    AList: TStrings;
  begin
    // used in TwwDBComboBox on drop down to create list of drop-down values (strings)
    AList:= TwwDBComboBox( Sender).Items;
    AList.Clear;
    with TFDQuery.Create(NIL) do
    try
      Connection := db_dm.FDConnection;

      // check if we need to filter based on a parent "related" column
      AUD_Drop_Down_Parent_ID:= GetParentUD_Drop_Down_Text_ID( AUD_Col_ID );

      // allow any record in ud_drop_down_text w/o ud_drop_down_parent_id, or we couldn't find parent id or exactly matching
      SQL.Add(IQFormat('select text                                  '+
                       '  from ud_drop_down_text                     '+
                       ' where ud_cols_id = %.0f                     '+
                       '   and ( ud_drop_down_parent_id is null      '+
                       '         or                                  '+
                       '         %f = 0                              '+
                       '         or                                  '+
                       '         nvl(ud_drop_down_parent_id,0) = %f) '+
                       ' order by text                               ',
                       [ AUD_Col_ID,
                         AUD_Drop_Down_Parent_ID,
                         AUD_Drop_Down_Parent_ID ]));
      Open;
      while not Eof do
      begin
        AList.Add(Fields[0].asString);
        Next;
      end;
    finally
      Free;
    end;
  end;

  // -----------------------------------------------------------------------------
  procedure _assign_picklist;
  var
    A: Variant;
  begin
    A:= SelectValueArrayFmt('select sql_text, pklist_field_name from ud_cols where id = %f', [ AUD_Col_ID ]);
    if VarArrayDimCount(A) = 0 then
       EXIT;
    if (A[ 0 ] = '') or (A[ 1 ] = '') then
       EXIT;

   TwwDBComboBox( Sender).OnDropDown:= ComboBoxDropDownInvokePicklist;
   TwwDBComboBox( Sender).ButtonStyle:= cbsEllipsis;
  end;

// -----------------------------------------------------------------------------
begin
  if SelectValueByID('col_kind', 'ud_cols', AUD_Col_ID) = 'P' then
     _assign_picklist
  else
     _assign_drop_down_values;
end;


procedure TFrmUsr_Flds.wwDBComboBoxUserDropDownReload(Sender: TObject);
var
  AUD_Cols_ID: Real;
begin
  AUD_Cols_ID:= ObjectToUD_Cols_ID( Sender );
  if AUD_Cols_ID > 0 then
     LoadDropDownValues( Sender, AUD_Cols_ID );
end;


procedure TFrmUsr_Flds.wwDBComboBoxUserDropDownCheckClearDependent(Sender: TObject);
var
  AUD_Cols_ID: Real;
  AList: TStringList;
  I: Integer;
  AChild: TXRef;

  procedure _ResetDropDown( AComponent: TComponent );
  begin
    if (AComponent is TwwDBComboBox) then with TwwDBComboBox(AComponent) do
    begin
      if Assigned(DataSource) and Assigned(DataSource.DataSet) and (DataField <> '') and (DataSource.DataSet.State in [dsEdit, dsInsert]) then
         try
           OnChange:= nil;
           // DataSource.DataSet.Edit;
           DataSource.DataSet.FieldByName(DataField).Clear;
           TwwDBComboBox(AComponent).Text:= '';
         finally
           OnChange:= wwDBComboBoxUserDropDownCheckClearDependent;
         end;
    end;
  end;

begin
  // find ud_cols_id associated with this drop down
  AUD_Cols_ID:= ObjectToUD_Cols_ID( Sender );
  if AUD_Cols_ID = 0 then
     EXIT;

  // find all the children associated to this ud_cols_id
  AList:= TStringList.Create;
  try
    try
      LoadColumnValueIntoStringList( AList, IQFormat( 'select id from ud_cols                  '+
                                                      ' where ud_tables_id = %f                '+
                                                      '   and id <> %f                         '+
                                                      ' start with id = %f                     '+
                                                      'connect by ud_cols_parent_id = prior id ',
                                                      [ UD_Tab_ID,
                                                        AUD_Cols_ID,
                                                        AUD_Cols_ID ]));
    except on E: Exception do
      begin
        iqerrdlg.ShowIQErrorMessage( IQMS.Common.ResStrings.cTXT0000482, E.Message, ''); // 'Unable to reset dependent user defined drop-down boxes';
        EXIT;
      end;
    end;

    // reset all the children
    for I:= 0 to AList.Count - 1 do
      if FControlsList.TryGetValue( StrToFloat(AList[ I ]), AChild ) then
         _ResetDropDown( AChild.Component );
  finally
    AList.Free;
  end;
end;


function TFrmUsr_Flds.Create_Label_DropDown_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel; AStyle: TComboBoxStyle): TComponent;
var
   ALabel: TLabel;
   AParentUD_Cols_ID: Real;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = NIL then Exit;

  Result:= TwwDBComboBox.Create(self);
  with TwwDBComboBox(Result) do
  begin
    Name  := Format('_ud_component_%s', [AField.FieldName]);
    Parent:= AControlsPanel;
    Left  := 0;
    Top   := ATop;
    Width := C_EDITCONTROL_WIDTH;
    if AField.DataType in [ftString, ftWideString] then
       Anchors:= [akLeft, akTop, akRight];

    if AField.DataSet = cdsUD_Calc then
       DataSource:= SrcUD_Calc
    else
       DataSource:= DataSource1;

    DataField := AField.FieldName;
    Tag       := -ATop;

    LoadDropDownValues( Result, AField.Tag );

    ReadOnly:= AField.DataSet = cdsUD_Calc;
    if ReadOnly then
       Color:= clBtnFace;

    Style:= AStyle;
    if Style = csDropDownList then
    begin
      AllowClearKey:= TRUE;
      ShowMatchText:= TRUE;
    end;

    if not Assigned(OnDropDown) then                         // normally is nil unless we are using picklist  (Kind=PICKLIST)
       OnDropDown:= wwDBComboBoxUserDropDownReload;          // on drop down check and apply parent select value as a filter

    OnChange:= wwDBComboBoxUserDropDownCheckClearDependent;  // on change check and reset related children to null
  end;

  ALabel.FocusControl := TwwDBComboBox(Result);
  iqctrl.CenterLabel(TwwDBComboBox(Result), ALabel);

  // add drop down component to crossreference list FControlsList
  AParentUD_Cols_ID:= SelectValueByID('ud_cols_parent_id', 'ud_cols', AField.Tag);
  FControlsList.Add( AField.Tag,                        {ud_cold_id}
                     TXRef.Create( Result,              {drop down component we just created}
                                   AParentUD_Cols_ID)); {parent ud_cols_id }
end;

function TFrmUsr_Flds.Create_Label_wwDBDateTimePicker_Pair(const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel ): TComponent;
var
   ALabel: TLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = NIL then Exit;

  Result:= TwwDBDateTimePicker.Create(self);
  with TwwDBDateTimePicker(Result) do
  begin
    Name:= Format('_ud_component_%s', [AField.FieldName]);
    Parent:= AControlsPanel;
    Left  := 0;
    Top   := ATop;
    Width := C_EDITCONTROL_WIDTH;
    if AField.DataType in [ftString, ftWideString] then
       Anchors:= [akLeft, akTop, akRight];

    if AField.DataSet = cdsUD_Calc then
       DataSource:= SrcUD_Calc
    else
       DataSource:= DataSource1;

    DataField := AField.FieldName;
    Tag       := -ATop;
    OnKeyDown := DoOnDeleteKeyDown;
    ReadOnly:= AField.DataSet = cdsUD_Calc;
    if ReadOnly then
       Color:= clBtnFace;
  end;

  ALabel.FocusControl := TwwDBDateTimePicker(Result);
  iqctrl.CenterLabel(TwwDBDateTimePicker(Result), ALabel);
end;

function TFrmUsr_Flds.Create_Label_CheckBox_Pair( const ATop: Integer; AField: TField; ALabelsPanel, AControlsPanel: TPanel ): TComponent;
var
  ALabel: TLabel;
begin
  ALabel := Create_Label(ATop, AField, ALabelsPanel);
  if ALabel = NIL then Exit;

  Result:= TDBCheckBox.Create(self);
  with TDBCheckBox(Result) do
  begin
    Name          := Format('_ud_component_%s', [AField.FieldName]);
    Parent        := AControlsPanel;
    Left          := 0;
    Top           := ATop;
    Width         := C_CHECKBOX_WIDTH;
    Anchors       := [akLeft, akTop];
    Caption       := '';
    ValueChecked  := 'Y';
    ValueUnChecked:= 'N';

    if AField.DataSet = cdsUD_Calc then
       DataSource:= SrcUD_Calc
    else
       DataSource:= DataSource1;

    DataField := AField.FieldName;
    Tag       := -ATop;

    ReadOnly:= AField.DataSet = cdsUD_Calc;
    if ReadOnly then
       Color:= clBtnFace;
  end;

  ALabel.FocusControl:= TDBCheckBox(Result);
  iqctrl.IQAlignControls( [TDBCheckBox(Result), ALabel], iqctrl.acVerticalCenters);
end;

procedure TFrmUsr_Flds.DoOnDeleteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key <> VK_DELETE) then EXIT;

  if (Sender is TDBEdit) then with (Sender as TDBEdit).Field do
     begin
       DataSet.Edit;
       Clear;
     end
  else if Sender is TwwDBDateTimePicker then with TwwDBDateTimePicker(Sender), DataSource do
     begin
       DataSet.Edit;
       DataSet.FieldByName(DataField).Clear;
     end;
  Key:= 0;
end;

procedure TFrmUsr_Flds.FormControlsReadOnly(const AReadOnly: Boolean);

  procedure _RecurseControls(const AWinControl: TWinControl);
  var
    i: Integer;
  begin
    for i := 0 to AWinControl.ControlCount - 1 do
     begin
       if (AWinControl.Controls[i] is TLabel) then
         TLabel(AWinControl.Controls[i]).Enabled := not AReadOnly
       else if (AWinControl.Controls[i] is TComponent) then
         iqctrl.IQReadOnlyControl(AWinControl.Controls[i], AReadOnly);
       if (AWinControl.Controls[i] is TWinControl) then
        _RecurseControls(TWinControl(AWinControl.Controls[i]));
     end;
  end;
begin
  _RecurseControls(ScrollBox1);
end;

procedure TFrmUsr_Flds.CheckArchived;
var
  AReadOnly: Boolean;
begin
  // Forces the check
  if ComponentState * [ csDesigning, csLoading, csReading ] = [] then  // if not Designing, Loading, Reading
    begin
      if Assigned(FOnCheckArchived) then
        FOnCheckArchived(Self, {var} AReadOnly)
      else
         AReadOnly := IsSourceReadOnly(Table_Name, FParent_ID);
      IsReadOnly := AReadOnly;
    end;
end;

procedure TFrmUsr_Flds.CheckDeleteObsolete( DataSet: TDataSet );

  function FindUDColumn( AUD_Cols_ID: Real ): Boolean;
  var
    I: Integer;
  begin
    with DataSet do
    for I:= 0 to FieldCount - 1 do
      if (Fields[ I ].Tag > 0) and (AUD_Cols_ID = Fields[ I ].Tag) then  { Tag = UD_Cols.ID }
      begin
        Result:= TRUE;
        EXIT;
      end;
    Result:= FALSE;
  end;

begin
  with TFDQuery.Create(nil) do
  try
    Connection := db_dm.FDConnection;
    SQL.Add(IQFormat('select d.id, d.ud_cols_id                '+
                     '  from ud_data d, ud_cols c, ud_tables t '+
                     ' where d.parent_id = %f                  '+
                     '   and d.ud_cols_id = c.id               '+
                     '   and c.ud_tables_id = t.id             '+
                     '   and t.id = %f                         ',
                     [ Parent_ID,
                       UD_Tab_ID ]));
    Open;
    while not Eof do
    begin
      if not FindUDColumn( FieldByName('ud_cols_id').asFloat ) then
         ExecuteCommandFmt('delete from ud_data where ud_cols_id = %.0f and parent_id = %.0f', [ FieldByName('ud_cols_id').asFloat, Parent_ID ]);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmUsr_Flds.CheckTableNameValid;
begin
  // if not Designing, Loading, Reading
  if (ComponentState * [ csDesigning, csLoading, csReading ] = []) and
    (Table_Name > '') and not OracleObjectExists(Table_Name) then
    raise Exception.CreateFmt(
    'Application Error:  Table or view, %s, does not exist.', [Table_Name]);
end;

function TFrmUsr_Flds.GetSource_Name: string;
begin
  if (Source > '') and (Source_Attribute > '') then
    Result:= Format('%s_%s', [ Source, IQString.FixComponentName( Source_Attribute )])
  else if Source > '' then
    Result := Source
  else if Table_Name > '' then
    Result := Table_Name
  else
    Result := '';
{
  if Table_Name = '' then
     Result:= ''
  else if Source_Attribute = '' then
     Result:= Table_Name
  else
     Result:= Format('%s_%s', [ Table_Name, IQString.FixComponentName( Source_Attribute )]);}
end;

function TFrmUsr_Flds.GetUD_Data_ID( AUD_Cols_ID, AParent_ID: Real ): Real;
begin
  Result:= SelectValueFmtAsFloat('select id from ud_data where parent_id = %f and ud_cols_id = %f', [ AParent_ID, AUD_Cols_ID ]);
end;

procedure TFrmUsr_Flds._sbtnStructureClick(Sender: TObject);
begin
  DoChangeStructure;
  if Assigned(AfterStructureChange) then
     AfterStructureChange( self );
end;

procedure TFrmUsr_Flds.DoChangeStructure;
begin
  UD_DefineStructure(UD_Tab_ID, View_Name);
  sbtnRefreshClick(NIL);
end;

procedure TFrmUsr_Flds.sbtnRefreshClick(Sender: TObject);
begin
  ClearScreen;
  OpenUD_View;
  DrawScreen;
end;

procedure TFrmUsr_Flds.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbPost then
     begin
       if not (dbxUD_View.State in [dsEdit,dsInsert]) then
         System.SysUtils.Abort;
       PostMessage(Handle, iq_Notify, cREFRESH_CALC_FIELDS, 0);
     end;
end;

function TFrmUsr_Flds.HasCalcFields: Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from ud_cols where ud_tables_id = %.0f and col_kind = ''C'' and sql_text is not null and rownum < 2', [ UD_Tab_ID ]) > 0;
end;

procedure TFrmUsr_Flds.dbxUD_ViewBeforePost(DataSet: TDataSet);
begin
  // the following should not be necessary but I couldnt shake off Field Value Required despite I assigned required = false on both ClientDataSet and Inernal SQLQuery.
  if Assigned(dbxUD_View.FindField('tab_id')) and (dbxUD_View.FieldByName('tab_id').asFloat = 0) then
     dbxUD_View.FieldByName('tab_id').asFloat:= UD_Tab_ID;
end;

procedure TFrmUsr_Flds.dbxUD_ViewBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  I:Integer;
  AUD_Data_ID: Real;
  S: string;
  ANeedUpdate: Boolean;
  FieldDelta : TField;
  A: Variant;
  ALinkedColumnName: string;
begin
  with dbxUD_View do
  begin
    CheckDeleteObsolete( dbxUD_View );

    for I:= 0 to FieldCount - 1 do
      if Fields[I].Tag > 0 then  { Tag = UD_Cols.ID }
      begin
        AUD_Data_ID:= GetUD_Data_ID( Fields[I].Tag, Parent_ID );

        ALinkedColumnName:= '';
        A:= SelectValueArrayFmt('select col_kind, linked_col_name from ud_cols where id = %d', [ Fields[I].Tag ]);
        if (VarArrayDimCount(A) > 0) and (A[ 0 ] = 'L' {source linked field}) then
           ALinkedColumnName:= A[1];

        FieldDelta := DeltaDS.FindField(Fields[I].FieldName);

        ANeedUpdate:= Assigned(FieldDelta)
                      and
                         not VarIsEmpty( FieldDelta.NewValue )
                      and
                         (
                         ((AUD_Data_ID = 0) and not VarIsEmpty( FieldDelta.NewValue ))
                         or
                         ((AUD_Data_ID > 0) and ( FieldDelta.OldValue <> FieldDelta.NewValue ))
                         );


        if ANeedUpdate then
        begin
           case Fields[I].DataType of
             ftFloat, ftFmtBCD:
                begin
                  if AUD_Data_ID = 0 then
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'insert into ud_data (ud_cols_id, parent_id, nuser) values(%d, %.0f, %.6f)',
                                    [ Fields[I].Tag, Parent_ID, FieldDelta.asFloat ])
                  else
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'update ud_data set nuser = %.6f where id = %.0f',
                                    [ FieldDelta.asFloat, AUD_Data_ID ]);

                  if ALinkedColumnName > '' then
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'update %s set %s = %.6f where id = %.0f',
                                    [ Table_Name, ALinkedColumnName, FieldDelta.asFloat, Parent_ID ]);
                end;

             ftDateTime, ftTimeStamp:
                begin
                  S:= '';
                  if FieldDelta.asString > '' then
                     S:= FormatDateTime('MM/DD/YYYY', FieldDelta.asDateTime);

                  if AUD_Data_ID = 0 then
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'insert into ud_data(ud_cols_id, parent_id, duser) values(%d, %.0f, to_date(''%s'', ''MM/DD/RRRR''))',
                                    [ Fields[ I ].Tag, Parent_ID, S ])
                  else
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'update ud_data set duser = to_date(''%s'', ''MM/DD/RRRR'') where id = %.0f',
                                    [ S, AUD_Data_ID ]);

                  if ALinkedColumnName > '' then
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'update %s set %s = to_date(''%s'', ''MM/DD/RRRR'') where id = %.0f',
                                    [ Table_Name, ALinkedColumnName, S, Parent_ID ]);
                end;

           else
                begin
                   if AUD_Data_ID = 0 then
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'insert into ud_data(ud_cols_id, parent_id, cuser) values(%d, %.0f, ''%s'')',
                                    [ Fields[I].Tag, Parent_ID, FixStr( FieldDelta.asString) ])
                   else
                     DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                    'update ud_data set cuser = ''%s'' where id = %.0f',
                                    [ FixStr(FieldDelta.asString), AUD_Data_ID ]);

                   if ALinkedColumnName > '' then
                      DBX_RunSQLFmt( dbxUD_View.SQLConnection,
                                     'update %s set %s = ''%s'' where id = %.0f',
                                     [ Table_Name, ALinkedColumnName, FieldDelta.asString, Parent_ID ]);

                end;
           end;
        end;
      end;
  end;

  Applied:= TRUE;
  // DeltaDS.CancelUpdates;
end;

procedure TFrmUsr_Flds.wwDBComboDlgPopupMemo( Sender: TObject );
var
  S: string;
  ADataSet: TDataset;
begin
  if not (Sender is TIQwwDBComboDlg) then
     EXIT;

  with TIQwwDBComboDlg(Sender) do
  begin
    ADataSet:= DataSource.DataSet;
    if not Assigned(ADataSet.FindField( DataField )) then
       EXIT;

    S:= ADataSet.FieldByName( DataField ).asString;

    if ReadOnly then
       DoViewMemoStr( self, S )
    else if EditMemoStr.DoEditMemoStr( self, S, 250 ) then
       begin
         ADataSet.Edit;
         ADataSet.FieldByName( DataField ).asString:= S;
       end;
  end;
end;


procedure TFrmUsr_Flds.wwDBComboDlgClear(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  ADataSet: TDataset;
begin
  if not (Sender is TIQwwDBComboDlg) then
     EXIT;

  with TIQwwDBComboDlg(Sender) do
  begin
    ADataSet:= DataSource.DataSet;
    if not Assigned(ADataSet.FindField( DataField )) then
       EXIT;
    if not ReadOnly then
       IQCtrl.CheckClearWWDBComboDlg( Sender, Key, ADataSet.FieldByName( DataField ));
  end;
end;


procedure TFrmUsr_Flds.ComboBoxDropDownInvokePicklist(Sender: TObject);
var
  A: Variant;
  AUD_Col_ID: Real;
begin
  FPkListTargetField:= ObjectToField( Sender );
  AUD_Col_ID:= FPkListTargetField.Tag;

  A:= SelectValueArrayFmt('select sql_text, pklist_field_name from ud_cols where id = %f', [ AUD_Col_ID ]);
  if VarArrayDimCount(A) = 0 then
     EXIT;

  FPkListSQL:= A[ 0 ];
  FPkListResultFieldName:= A[ 1 ];

  if (FPkListSQL = '') or (FPkListResultFieldName = '') then
    EXIT;

  PostMessage( Handle, iq_Notify, cPOPUP_PICKLIST, 0 );

  ABORT;
end;


procedure TFrmUsr_Flds.PopupPickList;
var
  I: Integer;
begin
  with PkList do
  begin
    Close;
    while FieldCount > 0 do Fields[ 0 ].Free;

    SQL.Text:= FPkListSQL;

    FieldDefs.Update;

    for I:= 0 to FieldDefs.Count - 1 do
      FieldDefs[ I ].CreateField( PkList );

    if Execute then
    begin
      dbxUD_View.Edit;
      FPkListTargetField.Value:= GetValue( FPkListResultFieldName );
    end;
  end;
end;



{$ENDREGION 'TFrmUsr_Flds'}

{$REGION 'TFrmUsr_Flds_BuiltIn'}

{ TFrmUsr_Flds_BuiltIn }

constructor TFrmUsr_Flds_BuiltIn.Create(AOwner: TComponent;
  AParent: TWinControl; const ATable_Name, ASource: string; AParent_ID: Real;
  AHelpContext: THelpContext = 0; ASR: TSecurityRegister = nil; ASource_Attribute: string = '');
begin
  SR:= ASR;
  inherited Create(AOwner, ATable_Name, ASource, AParent_ID, ASource_Attribute);
  HelpContext:= AHelpContext;
  pnlCarrier.Parent:= AParent;

  {recreate the form after parent has changed}
  sbtnRefreshClick(NIL);

  ForceRefreshSecurityInspector; // refreshes the SR items
  if Assigned(SR) then
     SR.Refresh;

  if Owner is TIQUDEmbeddedForm then
     PostMessage(TIQUDEmbeddedForm(Owner).Handle, iq_Notify, 0, 0);
end;

procedure TFrmUsr_Flds_BuiltIn.DoChangeStructure;
begin
  inherited;
  if Owner is TForm then
     PostMessage(TForm(Owner).Handle, iq_Notify, 0, 0);

  if Owner is TIQUDEmbeddedForm then
     PostMessage(TIQUDEmbeddedForm(Owner).Handle, iq_Notify, 0, 0);
end;

procedure TFrmUsr_Flds_BuiltIn.RefreshDataSet;
begin
  OpenUD_View;
end;

procedure TFrmUsr_Flds_BuiltIn.AssignParent_ID( AParent_ID: Real );
begin
  Parent_ID:= AParent_ID;
  RefreshDataSet;
  CheckArchived;
end;

{$ENDREGION 'TFrmUsr_Flds_BuiltIn'}

end.


