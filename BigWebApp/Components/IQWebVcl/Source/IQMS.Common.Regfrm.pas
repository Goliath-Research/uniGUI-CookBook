unit IQMS.Common.Regfrm;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IQMS.Common.Registry,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids, Vcl.Buttons,
  IQMS.WebVcl.UDRecView,
  FireDAC.Comp.Client;

/// <summary>
/// Indicates the type of bookmark to be persisted.  History works like MRU
/// and Favorites are manually elected by the user.
/// </summary>
type TWebIQBookmarkType = (History, Favorites);

type
  (* Example of use:
     --------------
     To Restore settings:
     ...................

     with TIQRegForm.Create( self ) do
     try
       Read( self );
       Read( dbGrid1);
     finally
       Free;
     end;

     OR as a procedure:
     IQRegFormRead( self, [ self, dbGrid1 ]);


     To Save settings:
     .................

     with TIQRegForm.Create( self ) do try
       Write( self );
       Write( dbGrid1);
     finally
       Free;
     end;

     OR as a procedure:
     IQRegFormWrite( self, [ self, dbGrid1 ]);
  *)



  {note we inherit from the TComponent so this carg owill be freed as soon as the owner form is freed}
  TIQRegFormOnShowCargo = class(TComponent)
  public
    OnShow: TNotifyEvent;
  end;


  TIQRegForm = class(TIQWebRegistry)
  strict private
    FObjects:TList;       {for future use}
    FPath : string;
    FFormPath : string;
    //FPicklistPath: string;
    FCheckboxPath: string;
    FMenuItemPath: string;
    FSpeedButtonPath: string;
    FDialogCheckBoxPath: string;
    FIsDialogCheckBox: Boolean;
    FForm : TComponent;
    FKeyIsOpen:Boolean;
    FIsPermanentPath: Boolean;
    FCheckDualMonitorsIssue: Boolean;

    function ReadForm( Sender:TObject ):Boolean;
    procedure WriteForm( Sender:TObject );

    function ReadGrid( Sender:TObject ):Boolean;
    procedure WriteGrid( Sender:TObject );

    function ReadWWGrid( Sender:TObject ):Boolean;
    procedure WriteWWGrid( Sender:TObject );

    function ReadEdit( Sender:TObject ):Boolean;
    procedure WriteEdit( Sender:TObject );

    function  ReadCheckBox( Sender:TObject ):Boolean;
    procedure WriteCheckBox( Sender:TObject );

    function  ReadRadioButton( Sender:TObject ):Boolean;
    procedure WriteRadioButton( Sender:TObject );

    // TRadioGroup
    function  ReadRadioGroup( Sender:TObject ):Boolean;
    procedure WriteRadioGroup( Sender:TObject );

    function  ReadSpeedButton( Sender:TObject ):Boolean;
    procedure WriteSpeedButton( Sender:TObject );

    function  ReadUpDown( Sender:TObject ):Boolean;
    procedure WriteUpDown( Sender:TObject );

    function ReadQuery( AObject : TObject ):Boolean;
    procedure WriteQuery( AObject : TObject );

    function ReadControl( Sender : TObject ):Boolean;
    procedure WriteControl( Sender : TObject );

    function ReadMenuItem( Sender : TObject ):Boolean;
    procedure WriteMenuItem( Sender : TObject );

    function ReadPageControl(  Sender : TObject ):Boolean;
    procedure WritePageControl(  Sender : TObject );

    function ReadStringGrid( AObject : TObject ):Boolean;
    procedure WriteStringGrid( AObject : TObject );

    function ReadComboBox( Sender: TObject ):Boolean;
    procedure WriteComboBox( Sender: TObject );

    function ReadWWComboBox( Sender: TObject ):Boolean;
    procedure WriteWWComboBox( Sender: TObject );

    function ReadWWDataInspector( Sender: TObject ): Boolean;
    procedure WriteWWDataInspector( Sender: TObject );

    function ReadListView( Sender: TObject ):Boolean;
    procedure WriteListView( Sender: TObject );

    function ReadAsString( AComponent:TComponent; const ValueName:string ):string; virtual;
    procedure WriteAsString( AComponent:TComponent; const ValueName, Value : string ); virtual;

    function ReadAsInteger( AComponent:TComponent; const ValueName:string ):Integer; virtual;
    procedure WriteAsInteger( AComponent:TComponent; const ValueName : string; Value : Integer ); virtual;

    procedure SetPath( APath:string );
    procedure CheckInsideVirtualDesktopAssignBounds(Sender: TObject; L, T, W, H: Integer);
    function CompleteOwnerPath(AComponent: TComponent): string;
    procedure RequestRedirectOnFormShow(Sender: TObject);
    function ReadAsInteger2( AComponent:TComponent; const APath: string; const ValueName:string ):Integer; virtual;
    procedure WriteAsInteger2( AComponent:TComponent; const APath: string; const ValueName : string; Value : Integer ); virtual;


  private

    function Read( AObject:TObject ):Boolean;
    procedure Write( AObject : TObject );
    function TryResetRegistry: Boolean;
  public
    constructor Create( AComponent:TComponent; AOptional: Integer = 0); virtual;
    destructor Destroy; override;

    class procedure ReadDialogCheckBox(const AKey: string; var AChecked: Boolean;
      var AModalResult: TModalResult; var AMessageText: string;
      var AShowDialog: Boolean; const ADefaultResult: TModalResult);
    class procedure WriteDialogCheckBox(const AKey: string; const AChecked: Boolean;
      const AModalResult: TModalResult; const AMessageText: string);

    procedure IQDeleteKey( AKey: string );
    procedure ResetRegistry;

    function CheckPathExistsAssignValue( APath: string): Boolean;
    procedure KeepLastKeys(AKeyName: string; ACount: Integer);
    procedure LoadSubKeysIntegerValues(AKeyName: string; AResultValues: TStringList);
    function DialogCheckBoxPath(const AKey: string): string;

    property Path:string read FPath write SetPath;
    property FormPath:string read FFormPath write FFormPath;
    property Form:TComponent read FForm write FForm;
    property KeyIsOpen:Boolean read FKeyIsOpen write FKeyIsOpen;
    property Objects:TList read FObjects write FObjects;
    property CheckDualMonitorsIssue: Boolean read FCheckDualMonitorsIssue write FCheckDualMonitorsIssue;

    class function GetForceAppName: string;
    class procedure SetForceAppName( Value: string );

    function ReadWWFilterDialog( Sender: TObject ): Boolean; overload;
    function ReadWWFilterDialog( APath: string; AFilterDialog: TObject ): Boolean; overload;

    procedure WriteWWFilterDialog( Sender: TObject ); overload;
    procedure WriteWWFilterDialog( APath: string; AFilterDialog: TObject ); overload;

    procedure GetKeyNamesOf( AName: string; AList: TStringList );
  end;

function IQRegFormRead( AComponent:TComponent; const AObjects : array of TObject ) : Boolean;
procedure IQRegFormWrite( AComponent:TComponent; const AObjects : array of TObject );
procedure IQRegFormResetRegistry(AComponent:TComponent);

function IQRegIntegerScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue :Integer ):Boolean;
procedure IQRegIntegerScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue :Integer );

function IQRegInt64ScalarRead(AComponent: TComponent; const ScalarName: string; var ScalarValue: Int64):Boolean;
procedure IQRegInt64ScalarWrite(AComponent: TComponent; const ScalarName: string; ScalarValue: Int64);

function IQRegFloatScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue :Real ):Boolean;
procedure IQRegFloatScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue :Real );

function IQRegStringScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue : string; AIsPermanent: Boolean = FALSE  ):Boolean;
procedure IQRegStringScalarWrite( AComponent:TComponent; const ScalarName: string; const ScalarValue: string; AIsPermanent: Boolean = FALSE );

function IQRegBooleanScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue : Boolean; AIsPermanent: Boolean = FALSE ):Boolean;
procedure IQRegBooleanScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue : Boolean; AIsPermanent: Boolean = FALSE );

function IQRegDateTimeScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue : TDateTime ):Boolean;
procedure IQRegDateTimeScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue : TDateTime );

function IQRegUtilizeDNETIntegerRead: Integer;            {0-not assigned, 1-No, 2-Yes}
procedure IQRegUtilizeDNETIntegerWrite( AValue: Integer );

procedure IQRegMRUWrite( AType : TWebIQBookmarkType; AClassName : string; ATargetID: Integer; AOrigin, ADescription: string );
procedure IQRegMRURead( AType : TWebIQBookmarkType; AList: TStringList );

// "Do not show again" dialog boxes
// Get saved dialog values
procedure GetDialogCheckBoxResult(const AKey: string; var AChecked: Boolean;
  var AModalResult: TModalResult; var AMessageText: string;
  var AShowDialog: Boolean; const ADefaultResult: TModalResult = mrYes);
// Save the dialog values
procedure SetDialogCheckBoxResult(const AKey: string; const AChecked: Boolean;
  const AModalResult: TModalResult; const AMessageText: string);
// Set just the check box for this dialog (key)
procedure SetDialogCheckBox(const AKey: string; const AChecked: Boolean);
// Get the Registry path for the dialog (key)
function GetDialogCheckBoxPath(const AKey: string): string;
// Asks:  "Do not show again"?
function DoNotShowDialogAgain(const AKey: string): Boolean;

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.HPick,
  IQMS.WebVcl.About,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.Search,
  IQMS.Common.ConfBas,
  IQMS.Common.ResStrings,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.Common.Controls,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Screen,
  IQMS.Common.JumpConstants,
  uniDBGrid,
  uniComboBox,
  uniEdit,
  uniCheckbox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIFrame,
  uniLabel,
  uniListBox,
  uniMainMenu,
  uniPageControl,
  uniRadioButton,
  uniRadioGroup,
  uniScrollBox,
  uniSpeedButton,
  uniSpinEdit,
  uniStringGrid,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIApplication,
  uniButton,
  uniDateTimePicker;

function Get_Eplant_ID_As_Float: Real; forward;
function GetBkMrkString(AType : TWebIQBookmarkType) : String; forward;

const
  cPERMANENT = 1;

var
  FForceAppName: string;

type
   TMRUCargo = class
     TimeStamp: TDateTime;
     constructor Create( ATimeStamp: TDateTime );
   end;


constructor TMRUCargo.Create( ATimeStamp: TDateTime );
begin
  TimeStamp:= ATimeStamp;
end;


function IQRegFormRead( AComponent:TComponent; const AObjects : array of TObject ) : Boolean;
var
  I:Integer;
begin
  Result:= FALSE;
  with TIQRegForm.Create( AComponent ) do
  try
    for i:= 0 to High( AObjects ) do
      Result:= Read( AObjects[ i ] );
  finally
    Free;
  end;
end;

procedure IQRegFormWrite( AComponent:TComponent; const AObjects : array of TObject );
var
  aObject: TObject;
begin
  with TIQRegForm.Create( AComponent ) do
    if not TryResetRegistry then
    try
      for aObject in AObjects do
        Write(aObject);
    finally
      Free;
    end;
end;

procedure IQRegFormResetRegistry(AComponent:TComponent);
begin
  with TIQRegForm.Create( AComponent ) do
    try
      ResetRegistry;
    finally
      Free;
    end;
end;

function IQRegIntegerScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue :Integer ):Boolean;
var
  ATmp: Integer;
begin
  with TIQRegForm.Create( AComponent ) do
  try
    Path := Format( '%s\%s', [FormPath, ScalarName]);
    if KeyIsOpen then
    try
       ATmp:= ReadInteger( 'ScalarValue' );
       ScalarValue:= ATmp;
       Result:= TRUE;
    except
       Result:= FALSE;
    end;
  finally
    Free;
  end;
end;


procedure IQRegIntegerScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue :Integer );
begin
  with TIQRegForm.Create( AComponent ) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [FormPath, ScalarName]);
       if KeyIsOpen then
         WriteInteger( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;

function IQRegInt64ScalarRead(AComponent: TComponent; const ScalarName: string; var ScalarValue: Int64):Boolean;
var
  ATmp: Real;
  o: TIQWebRegistry;
begin
  with TIQRegForm.Create( AComponent ) do
  try
    Path := Format( '%s\%s', [FormPath, ScalarName]);
    if KeyIsOpen then
    try
       ATmp:= ReadFloat( 'ScalarValue' );
       ScalarValue:= Trunc(ATmp);
       Result:= TRUE;
    except
       Result:= FALSE;
    end;
  finally
    Free;
  end;
end;

procedure IQRegInt64ScalarWrite(AComponent: TComponent; const ScalarName: string; ScalarValue: Int64);
begin
  with TIQRegForm.Create( AComponent ) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [FormPath, ScalarName]);
       if KeyIsOpen then
         WriteFloat( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;

function IQRegStringScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue : string; AIsPermanent: Boolean = FALSE  ):Boolean;
var
  ATmp: string;
begin
  with TIQRegForm.Create( AComponent, IIf( AIsPermanent, 1, 0 )) do
    try
      Path:= Format( '%s\%s', [ FormPath, ScalarName ]);

      if KeyIsOpen then
      try
         ATmp:= ReadString( 'ScalarValue' );
         ScalarValue:= ATmp;
         Result:= TRUE;
      except
         Result:= FALSE;
      end;
    finally
      Free;
    end;
end;

procedure IQRegStringScalarWrite( AComponent:TComponent; const ScalarName: string; const ScalarValue: string; AIsPermanent: Boolean = FALSE );
begin
  with TIQRegForm.Create( AComponent, IIf( AIsPermanent, 1, 0 )) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [ FormPath, ScalarName ]);
       if KeyIsOpen then
         WriteString( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;

function IQRegFloatScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue :Real ):Boolean;
var
  ATmp: Real;
begin
  with TIQRegForm.Create( AComponent ) do
  try
    Path := Format( '%s\%s', [FormPath, ScalarName]);
    if KeyIsOpen then
    try
       ATmp:= ReadFloat( 'ScalarValue' );
       ScalarValue:= ATmp;
       Result:= TRUE;
    except
       Result:= FALSE;
    end;
  finally
    Free;
  end;
end;

procedure IQRegFloatScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue :Real );
begin
  with TIQRegForm.Create( AComponent ) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [FormPath, ScalarName]);
       if KeyIsOpen then
         WriteFloat( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;

function IQRegDateTimeScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue : TDateTime ):Boolean;
var
  ATmp: TDateTime;
begin
  with TIQRegForm.Create( AComponent ) do
  try
    Path := Format( '%s\%s', [FormPath, ScalarName]);
    if KeyIsOpen then
    try
       ATmp:= ReadDate( 'ScalarValue' );
       ScalarValue:= ATmp;
       Result:= TRUE;
    except
       Result:= FALSE;
    end;
  finally
    Free;
  end;
end;

procedure IQRegDateTimeScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue : TDateTime );
begin
  with TIQRegForm.Create( AComponent ) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [FormPath, ScalarName]);
       if KeyIsOpen then
         WriteDate( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;


function IQRegBooleanScalarRead( AComponent:TComponent; const ScalarName: string; var ScalarValue: Boolean; AIsPermanent: Boolean ):Boolean;
var
  ATmp: Boolean;
begin
  with TIQRegForm.Create( AComponent, IIf( AIsPermanent, 1, 0 ) ) do
  try
    Path := Format( '%s\%s', [FormPath, ScalarName]);
    if KeyIsOpen then
    try
       ATmp:= ReadBool( 'ScalarValue' );
       ScalarValue:= ATmp;
       Result:= TRUE;
    except
       Result:= FALSE;
    end;
  finally
    Free;
  end;
end;

procedure IQRegBooleanScalarWrite( AComponent:TComponent; const ScalarName: string; ScalarValue, AIsPermanent: Boolean );
begin
  with TIQRegForm.Create( AComponent, IIf( AIsPermanent, 1, 0 ) ) do
    if not TryResetRegistry then
    try
       Path:= Format( '%s\%s', [FormPath, ScalarName]);
       if KeyIsOpen then
         WriteBool( 'ScalarValue', ScalarValue );
    finally
      Free;
    end;
end;


function IQRegUtilizeDNETIntegerRead: Integer; {0-not assigned, 1-No, 2-Yes}
var
  ATmp: Integer;
begin
  Result:= 0;

  with TIQRegForm.Create( nil ) do
  try
    if not CheckPathExistsAssignValue( Format( '%s\%s', [ FormPath, 'Utilize_DNET_Printing_Local' ])) then
       EXIT;

    if KeyIsOpen then
    try
       Result:= ReadInteger( 'ScalarValue' );
    except
       Result:= 0;
    end;
  finally
    Free;
  end;
end;


procedure IQRegUtilizeDNETIntegerWrite( AValue: Integer );
begin
  IQRegIntegerScalarWrite( nil, 'Utilize_DNET_Printing_Local', AValue );
end;


function Get_Eplant_ID_As_Float: Real;
begin
  if (SecurityManager <> nil) then
     Result:= SecurityManager.EPlant_ID_AsFloat
  else
     Result:= 0;
end;

function GetBkMrkString(AType : TWebIQBookmarkType) : String;
begin
  case AType of
    TWebIQBookmarkType.History:   Result := 'MRU';
    TWebIQBookmarkType.Favorites: Result := 'FAV';
  end;
end;


procedure IQRegMRUWrite( AType : TWebIQBookmarkType; AClassName : string; ATargetID: Integer; AOrigin, ADescription: string );
var
  AFolderName: string;
begin
  with TIQRegForm.Create( nil ) do
  try
     {we are going to put everything under _Generic\MRU\eplant_0, 1, 2 etc }
     FormPath:= Format( '%s\%s\EPlant_%.0f', [ FormPath, GetBkMrkString(AType), Get_Eplant_ID_As_Float ]);

     {construct something that looks like BOM_1227_3456}
     AFolderName:= Format('%s_%s_%d', [ AOrigin, AClassName, ATargetID ]);

     {the path is going to look like this: HKEY_CURRENT_USER\Software\IQMS\IQWin32\Iqwin32.exe\_Generic\MRU\EPlant_0\BOM_1227_3456 }
     Path:= Format( '%s\%s', [ FormPath, AFolderName ]);

     {write the MRU info: jump_id (message) and the id of the target record in the table}
     if KeyIsOpen then
     begin
       WriteString ( 'ClassName',   AClassName);
       WriteInteger( 'TargetID',    ATargetID );
       WriteString ( 'Origin',      Trim(AOrigin));
       WriteString ( 'Description', Trim(ADescription));
       WriteString ( 'TimeStamp',   DateTimeToStr(Now));
     end;

     {Keep last 10 keys}
     KeepLastKeys( FormPath, 10);
  finally
    Free;
  end;
end;

procedure IQRegMRURead( AType : TWebIQBookmarkType; AList: TStringList );
var
  aLocal : TIQRegForm;
begin
  aLocal := TIQRegForm.Create( nil );
  with aLocal  do
  try
   {we are going to put everything under _Generic\MRU\eplant_0, 1, 2 etc }
   FormPath:= Format( '%s\%s\EPlant_%.0f', [ FormPath, GetBkMrkString(AType), Get_Eplant_ID_As_Float ]);
   LoadSubKeysIntegerValues( FormPath, AList );
  finally
    aLocal.Free;
  end;
end;

procedure GetDialogCheckBoxResult(const AKey: string; var AChecked: Boolean;
  var AModalResult: TModalResult; var AMessageText: string;
  var AShowDialog: Boolean; const ADefaultResult: TModalResult);
begin
  TIQRegForm.ReadDialogCheckBox(AKey,{var} AChecked, {var} AModalResult,
    {var} AMessageText, {var} AShowDialog, ADefaultResult);
end;

procedure SetDialogCheckBoxResult(const AKey: string; const AChecked: Boolean;
  const AModalResult: TModalResult; const AMessageText: string);
begin
  TIQRegForm.WriteDialogCheckBox(AKey, AChecked, AModalResult, AMessageText);
end;

procedure SetDialogCheckBox(const AKey: string; const AChecked: Boolean);
var
  ACheckedOut, AShowDialog: Boolean;
  AModalResult: TModalResult;
  AMessageText: string;
begin
  // Get current values because we do not want to overwrite with null values
  GetDialogCheckBoxResult(AKey, {var} ACheckedOut, {var} AModalResult,
    {var} AMessageText, {var} AShowDialog);
  // Now set the values back, but with the new check box value
  TIQRegForm.WriteDialogCheckBox(AKey, AChecked, AModalResult, AMessageText);
end;

function DoNotShowDialogAgain(const AKey: string): Boolean;
var
  AChecked, AShowDialog: Boolean;
  AModalResult: TModalResult;
  AMessageText: string;
begin
  GetDialogCheckBoxResult(AKey,
    {var} AChecked, {var} AModalResult, {var} AMessageText,
    {var} AShowDialog, mrOk);
  // Return True if the check box was checked; meaning, the end user
  // does not want the dialog box to show again.
  Result := not AShowDialog;
end;

function GetDialogCheckBoxPath(const AKey: string): string;
begin
  with TIQRegForm.Create(nil) do
  try
    Result := DialogCheckBoxPath('');
  finally
    Free;
  end;
end;

{TIQRegForm}

constructor TIQRegForm.Create( AComponent:TComponent; AOptional: Integer = 0);
var
  S               :string;
  AApplicationName: string;
  AOwnerFrame: TUniFrame;
  AOwnerForm: TUniForm;
begin
  inherited Create;
  FObjects:= TList.Create;
  FForm:= AComponent;
  FPath:= '';
  FKeyIsOpen:= FALSE;
  CheckDualMonitorsIssue:= TRUE;

  if TIQRegForm.GetForceAppName() > '' then
     AApplicationName:= TIQRegForm.GetForceAppName()
  else
     AApplicationName:= ExtractFileName( Application.ExeName );

  FDialogCheckBoxPath := Format( '\Software\IQMS\IQWin32\%s\_Permanent\_Dialog\', [AApplicationName]);
  FIsDialogCheckBox := False;

  AOwnerFrame := GetOwnerUniFrame(FForm); // Parent TFrame
  AOwnerForm := GetOwnerUniForm(FForm); // Parent TUniForm

  if not Assigned(FForm) then
     begin
       S:= '_Generic';
       AApplicationName:= 'IQ Shared';
     end

  else if FForm.Name = '' then
       S:= '_Generic'

  else if (FForm is TIQWebHPick) and (FForm.Owner is TIQWebExtDoc) and Assigned( FForm.Owner.Owner ) then  {picklist launched from IQExtDoc component}
       S:= Format( '%s\%s\%s', [ FForm.Owner.Owner.Name, FForm.Owner.Name, FForm.Name ])             {Ex: BomGeneric\IQExtDocSndOp\PkDocument }

  else if (FForm is TIQWebHPick) or (FForm is TIQWebSearch) or
    (FForm is TIQWebExtDoc) {or (FForm is TFrmIQSearchPickList)} then
     try
       if not Assigned(FForm.Owner) then
          S:= Format( '_Unknown\%s', [ FForm.Name ])                      { prevent exception when owner goes out of scope}

       else if FForm.Owner.Name = '' then
          S:= Format( '%s\%s', [ FForm.Owner.ClassName, FForm.Name ])  { TInv_DM\PkArinvt }

       else if CompareText( FForm.Owner.Name, 'FrmIQSearchPickList') = 0 then
          S:= Format( '%s\%s', [ CompleteOwnerPath(FForm), FForm.Name ])  { BomShell\IQRepDef1\FrmRepdef\FrmIQSearchPickList\PkCustomer }

       else if (FForm is TIQWebHPick) and (TIQWebHPick(FForm).RegistryPathExtension <> '') then
          S:= Format( '%s\%s\%s', [ FForm.Owner.Name, FForm.Name, TIQWebHPick(FForm).RegistryPathExtension ])  { FrmRepDef\PkLookup\Customer.rpt\CUSTNO }

       // TIQSearch is on a TFrame
       else if (FForm is TIQWebSearch) and Assigned(AOwnerFrame) and Assigned(AOwnerForm) then
          S:= Format( '%s\%s\%s', [ AOwnerForm.Name, AOwnerFrame.Name, FForm.Name])

       // TIQWebSearch with RegistryPathExtension
       else if (FForm is TIQWebSearch) and (TIQWebSearch(FForm).RegistryPathExtension <> '') then
          S:= Format( '%s\%s\%s', [ FForm.Owner.Name, FForm.Name, TIQWebSearch(FForm).RegistryPathExtension ])  { FrmQCDocMaint\IQSearch1\DEFAULT Library}

       else
          S:= Format( '%s\%s', [ FForm.Owner.Name, FForm.Name ])  { TInv_DM\PkArinvt }

     except
       S:= Format( '_Unknown\%s', [ FForm.Name ])                      { prevent exception when owner goes out of scope}
     end

  else
     S:= FForm.Name;


  if AOptional = cPERMANENT then
  begin
     S:= '_Permanent\' + S;
     FIsPermanentPath:= TRUE;
  end;

  // 11/13/2013 If the form is a TIQDialogCheckBox form, then we need to
  // save the form settings (position, etc., ... everything) under the
  // "_Permanent\_Dialog" folder, and not with other forms.
  if Assigned(FForm) and (CompareText(FForm.Name, 'IQDialogCheckBox') = 0) then
     begin
       FIsDialogCheckBox := True;
       if FForm.Tag > 0 then
         // Example: _Dialog\Prod_Rep_Remove_Hist
         FFormPath := Format( '%s%s', [FDialogCheckBoxPath, WideCharToString(PWideChar(FForm.Tag))])
       else
         // Example:  _Dialog\_Generic
         FFormPath := Format( '%s%s', [FDialogCheckBoxPath, '_Generic' ])
     end

  else if Assigned(FForm) and (FForm is TIQDialogCheckBox) then
     begin
       FIsDialogCheckBox := True;
       // Example:  _Dialog\Prod_Rep_Remove_Hist
       FFormPath := Format( '%s%s', [FDialogCheckBoxPath, FForm.Name ]);
     end

  else
    FFormPath := Format( '\Software\IQMS\IQWin32\%s\%s', [ AApplicationName, S ]);

  // 11/12/2013 Place check boxes and menu items under _Permanent so that
  // they are never reset -- either through "reset form to default" or
  // after the version changes.
  FCheckboxPath := Format( '\Software\IQMS\IQWin32\%s\_Permanent\_Checkbox\%s', [ AApplicationName, S ]);
  FMenuItemPath := Format( '\Software\IQMS\IQWin32\%s\_Permanent\_MenuItem\%s', [ AApplicationName, S ]);
  FSpeedButtonPath := Format( '\Software\IQMS\IQWin32\%s\_Permanent\_Button\%s', [ AApplicationName, S ]);
end;

destructor TIQRegForm.Destroy;
begin
  FObjects.Free;
  inherited;
end;

function TIQRegForm.DialogCheckBoxPath(const AKey: string): string;
begin
  if Trim(AKey) > '' then
    Result := System.SysUtils.IncludeTrailingPathDelimiter(FDialogCheckBoxPath) + AKey
  else
    Result := FDialogCheckBoxPath;
  Result := System.SysUtils.IncludeTrailingPathDelimiter(Result);
end;

class function TIQRegForm.GetForceAppName: string;
begin
  Result:= FForceAppName;
end;

class procedure TIQRegForm.SetForceAppName(Value: string);
begin
  FForceAppName:= Value;
end;


function TIQRegForm.CompleteOwnerPath( AComponent: TComponent ): string;
var
  //AOwner: TComponent;
  AComponentOwnerForm, ACallingForm: TUniForm;
  AExt: string;
begin
  Result:= '';
  if AComponent = nil then
     EXIT;

  AExt := '';
  if (AComponent is TIQWebSearch) and
   (TIQWebSearch(AComponent).RegistryPathExtension > '') then
   AExt := TIQWebSearch(AComponent).RegistryPathExtension + '\';

  AComponentOwnerForm := GetOwnerUniForm(AComponent);
  if Assigned(AComponentOwnerForm) then
    ACallingForm := GetOwnerUniForm(AComponentOwnerForm);


  if Assigned(ACallingForm) then
    Result:= ACallingForm.Name + '\' + AExt + AComponentOwnerForm.Name + '\' + AComponent.Name + '\' + Result

  else if Assigned(ACallingForm) then
    Result:= AExt + AComponentOwnerForm.Name + '\' + AComponent.Name + '\' + Result;

{
  AOwner:= AComponent.Owner;
  while Assigned(AOwner) and (AOwner.Name > '') do
  begin
    if Result = '' then Result:= AOwner.Name else Result:= AOwner.Name + '\' + Result;

    AOwner:= AOwner.Owner;
  end;
}
end;


function TIQRegForm.TryResetRegistry: Boolean;
var
  I:Integer;
begin
  Result:= FALSE;
  if Assigned(FForm) and not FIsPermanentPath then
     for I:= 0 to FForm.ComponentCount - 1 do
       if FForm.Components[ I ] is TIQWebAbout then
         with FForm.Components[ I ] as TIQWebAbout do
           begin
             if ResetOwnerRegistry then
             begin
               ResetRegistry;
               Result:= TRUE;
             end;
             BREAK;
           end;
end;

procedure TIQRegForm.ResetRegistry;
begin
  if FForm = Application.MainForm then
    IQDeleteKey( Format( '\Software\IQMS\IQWin32\%s', [ ExtractFileName( Application.ExeName )]))
  else
    IQDeleteKey(FormPath);
end;

procedure TIQRegForm.IQDeleteKey( AKey: string );
var
  AList: TStrings;
  I    : Integer;
  AIsSomeExcluded: Boolean;
begin
  if FIsPermanentPath or (AKey = '') then
     EXIT;

  if OpenKey( AKey, FALSE ) then
  try
    AList:= TStringList.Create;
    {get all the children}
    GetKeyNames( AList );

    {exclude '_Permanent'}
    AIsSomeExcluded:= FALSE;
    I:= AList.IndexOf('_Permanent');
    if I > -1 then
    begin
       AList.Delete( I );
       AIsSomeExcluded:= TRUE;
    end;

    {delete all children}
    for I:= AList.Count - 1 downto 0 do
      IQDeleteKey( AKey + '\' + AList[ I ]);

    {check if all children got deleted and delete current key}
    if not AIsSomeExcluded then
    begin
      OpenKey( AKey, FALSE );
      if not DeleteKey( AKey ) then
        IQWarning('Unable to delete key '+AKey);
    end;
  finally
    AList.Free;
  end;
end;

function TIQRegForm.Read( AObject:TObject ):Boolean;
begin
  //  UG_rem_AMB -  removed items with no equivalents in uniGUI
  {
   //  else if AObject is TWWDBGrid        then Result:= ReadWWGrid( AObject )
   //  else if AObject is TUniUpDown          then Result:= ReadUpDown( AObject )
   //  else if AObject is TwwDBComboBox    then Result:= ReadWWComboBox( AObject )
   //  else if AObject is TwwFilterDialog  then Result:= ReadWWFilterDialog( AObject )
   // else if AObject is TwwDataInspector then Result:= ReadWWDataInspector( AObject )
   //  else if AObject is TUniListView        then Result:= ReadListView( AObject )
  }
  if AObject is TUniForm                 then Result:= ReadForm( AObject )
  else if AObject is TUniDBGrid          then Result:= ReadGrid( AObject )
  else if AObject is TUniEdit            then Result:= ReadEdit( AObject )
  else if AObject is TUniCheckBox        then Result:= ReadCheckBox( AObject )
  else if AObject is TUniSpeedButton     then Result:= ReadSpeedButton( AObject )
  else if AObject is TUniRadioButton     then Result:= ReadRadioButton( AObject )
  else if AObject is TUniRadioGroup      then Result:= ReadRadioGroup( AObject )
  else if AObject is TFDQuery            then Result:= ReadQuery( AObject )
  else if AObject is TUniMenuItem        then Result:= ReadMenuItem( AObject )
  else if AObject is TUniPanel           then Result:= ReadControl( AObject )
  else if AObject is TUniGroupBox        then Result:= ReadControl( AObject )
  else if AObject is TUniPageControl     then Result:= ReadPageControl( AObject )
  else if AObject is TUniComboBox        then Result:= ReadComboBox( AObject )
  else if AObject is TUniStringGrid      then Result:= ReadStringGrid( AObject )
  else if AObject is TUniScrollBox       then Result:= ReadControl( AObject )
  else if AObject is TIQWebUDRecView     then Result:= ReadControl( AObject )

  else
    Result:= FALSE;
end;

procedure TIQRegForm.Write( AObject : TObject );
begin
  //  UG_rem_AMB -  removed items with no equivalents in uniGUI
  {
   //  else if AObject is TWWDBGrid        then Result:= ReadWWGrid( AObject )
   //  else if AObject is TUniUpDown          then Result:= ReadUpDown( AObject )
   //  else if AObject is TwwDBComboBox    then Result:= ReadWWComboBox( AObject )
   //  else if AObject is TwwFilterDialog  then Result:= ReadWWFilterDialog( AObject )
   // else if AObject is TwwDataInspector then Result:= ReadWWDataInspector( AObject )
   //  else if AObject is TUniListView        then Result:= ReadListView( AObject )
  }
  if AObject is TUniForm                 then WriteForm( AObject )
  else if AObject is TUniDBGrid          then WriteGrid( AObject )
//  else if AObject is TWWDBGrid        then WriteWWGrid( AObject )
  else if AObject is TUniEdit            then WriteEdit( AObject )
  else if AObject is TUniCheckBox        then WriteCheckBox( AObject )
  else if AObject is TUniSpeedButton     then WriteSpeedButton( AObject )
//  else if AObject is TUpDown          then WriteUpDown( AObject )
  else if AObject is TUniRadioButton     then WriteRadioButton( AObject )
  else if AObject is TUniRadioGroup      then WriteRadioGroup( AObject )
  else if AObject is TFDQuery           then WriteQuery( AObject )
  else if AObject is TUniMenuItem        then WriteMenuItem( AObject )
  else if AObject is TUniPanel           then WriteControl( AObject )
  else if AObject is TUniMenuItem        then WriteMenuItem( AObject )
  else if AObject is TUniGroupBox        then WriteControl( AObject )
  else if AObject is TUniPageControl     then WritePageControl( AObject )
  else if AObject is TUniComboBox        then WriteComboBox( AObject )
//  else if AObject is TwwDBComboBox    then WriteWWComboBox( AObject )
  else if AObject is TUniStringGrid      then WriteStringGrid( AObject )
  else if AObject is TUniScrollBox       then WriteControl( AObject )
//  else if AObject is TwwFilterDialog  then WriteWWFilterDialog( AObject )
//  else if AObject is TwwDataInspector then WriteWWDataInspector( AObject )
  else if AObject is TIQWebUDRecView  then WriteControl( AObject )
//  else if AObject is TListView        then WriteListView( AObject );
end;

function TIQRegForm.ReadForm( Sender:TObject ):Boolean;
var
  L,T,W,H:Integer;
  AFormStyle:Integer;
  AMaximized: Boolean;
begin
  Result:= FALSE;

  Path  := FormPath;
  if KeyIsOpen then
  begin
     L:= TUniForm(Sender).Left;
     T:= TUniForm(Sender).Top;
     if ValueExists( 'Width' ) then
     begin
       W:= ReadInteger( 'Width' );
       Result:= TRUE;
     end;
     if ValueExists( 'Height' ) then
     begin
       H:= ReadInteger( 'Height' );
       Result:= TRUE;
     end;
     if ValueExists( 'FormStyle' ) then
        TUniForm(Sender).FormStyle:= TFormStyle( ReadInteger( 'FormStyle' ));

     AMaximized:= ValueExists( 'Maximized' ) and (ReadInteger('Maximized') = 1);
  end;

 if Result then
     begin
        case TUniForm(Sender).BorderStyle of
             bsDialog, bsSingle: CheckInsideVirtualDesktopAssignBounds( Sender, L, T, TUniForm(Sender).Width, TUniForm(Sender).Height ); // TForm(Sender).SetBounds( L, T, TForm(Sender).Width, TForm(Sender).Height );
        else
          begin
            CenteredUniFormPos(TUniForm(Sender), True, {var} L, T, W, H);
            TUniForm(Sender).SetBounds(L, T, W, H);
          end;
                                                           // TForm(Sender).SetBounds( L, T, W, H );
        end
     end
  else
     with TUniForm(Sender) do if not (Position in [poDesigned]) then
     begin
       {Default to center of the screen}
       CenteredUniFormPos(TUniForm(Sender), True, {var} L, T, W, H);
       // L:= (Screen.Width - Width) div 2;
       // T:= (Screen.Height - Height) div 2;
       CheckInsideVirtualDesktopAssignBounds( Sender, L, T, Width, Height );  // SetBounds( L, T, Width, Height );
     end;

  if AMaximized then
  begin
     TUniForm(Sender).WindowState:= wsNormal;
     TUniForm(Sender).WindowState:= wsMaximized;
  end;
end;

procedure TIQRegForm.CheckInsideVirtualDesktopAssignBounds( Sender: TObject; L, T, W, H: Integer );
begin
  if not AreXYInsideVirtualDesktop( L, T ) then
  begin
    {Default to center of the screen}
    L:= (UniApplication.ScreenWidth- W) div 2;
    T:= (UniApplication.ScreenHeight - H) div 2;
  end;

  TUniForm(Sender).SetBounds( L, T, W, H );

  // EIQ-241 Dual monitors - form do not open in last opened position CRM # 792864
  if CheckDualMonitorsIssue and ((L < 0) or (L > Screen.Width))  then
     RequestRedirectOnFormShow( Sender );
end;

procedure TIQRegForm.WriteForm( Sender:TObject );
var
  AMaximized: Boolean;
  L,T,W,H   :Integer;
  WindowPlacement: TWindowPlacement;
begin
(*Note: in uniGUI/web framework, size of form is position, but not position*)
  Path:= FormPath;
  if KeyIsOpen then
  begin
     AMaximized:= TUniForm(Sender).HandleAllocated and IsZoomed( TUniForm(Sender).Handle );

     {default}
//     L:= TUniForm(Sender).Left;
//     T:= TUniForm(Sender).Top;
     W:= TUniForm(Sender).Width;
     H:= TUniForm(Sender).Height;

     {if maximized}
     if AMaximized and TUniForm(Sender).HandleAllocated then
     try
       WindowPlacement.Length:= SizeOf(WindowPlacement);
       GetWindowPlacement( TUniForm(Sender).Handle, @WindowPlacement );
//       L:= WindowPlacement.rcNormalPosition.Left;
//       T:= WindowPlacement.rcNormalPosition.Top;
       W:= WindowPlacement.rcNormalPosition.Right - WindowPlacement.rcNormalPosition.Left;
       H:= WindowPlacement.rcNormalPosition.Bottom - WindowPlacement.rcNormalPosition.Top;
     except
       {suppress any surprises}
//       L:= TUniForm(Sender).Left;
//       T:= TUniForm(Sender).Top;
       W:= TUniForm(Sender).Width;
       H:= TUniForm(Sender).Height;
     end;

//     WriteInteger( 'Left'  , L );
//     WriteInteger( 'Top'   , T );
     WriteInteger( 'Width' , W );
     WriteInteger( 'Height', H );
     WriteInteger( 'FormStyle', Integer(TUniForm(Sender).FormStyle));

     if AMaximized then
        WriteInteger( 'Maximized', 1 )
     else
        WriteInteger( 'Maximized', 0 );

     {make controls that left or right aligned to readjust based on the normal size}
     if AMaximized and TUniForm(Sender).HandleAllocated then
        TUniForm(Sender).WindowState:= wsNormal;
  end;
end;

procedure TIQRegForm.SetPath( APath:string );
begin
  if APath <> FPath then
  begin
    FPath:= APath;
    FKeyIsOpen:= OpenKey( FPath, TRUE );
    if not FKeyIsOpen then
      // 'Unable to open or create the Registry Key, %s.'
      ShowMessage(Format(IQMS.Common.ResStrings.cTXT0000172, [FPath]));
  end;
end;

function TIQRegForm.ReadGrid( Sender:TObject ):Boolean;
var
  DBGrid  : TUniDBGrid;
  I       : Integer;
  J       : Integer;
  ColsList: TList;
  MfgType : string;
  aOrigLeft, aOrigTop : Integer;
begin
  DBGrid:= Sender as TUniDBGrid;
  Result:= FALSE;
  with DBGrid do
  try
    {MfgType (if any) is passed in the tag property }
    MfgType:= WideCharToString(PWideChar(DBGrid.Tag));
    if MfgType = '' then
       MfgType:= '_NoMfgType_';

    Columns.BeginUpdate;

    ColsList:= TList.Create;
    for I:= 0 to Columns.Count - 1 do ColsList.Add( Columns[ I ] );             {prepare as many columns we have}

    for I:= 0 to Columns.Count - 1 do with Columns[ I ] do
    try
      {A Path may look like 'RTPartNumbers\dbGrid1.Act Cav(ACTCAV)'}
      Path:= Format( '%s\%s\%s\%s(%s)', [ FormPath,
                                          DBGrid.Name,
                                          MfgType,
                                          DefaultToString( Title.Caption, Format( 'Column%d', [ i ] )),
                                          DefaultToString( FieldName, Format( 'FieldName%d', [ i ] )) ]);
      if KeyIsOpen and ValueExists( 'Width' ) then
         Width:= ReadInteger( 'Width' );

      if KeyIsOpen and ValueExists( 'Index' ) then
      begin
         J:= ReadInteger( 'Index' );
         if J <= ColsList.Count - 1 then
            ColsList[ J ]:= Columns[ I ];
      end;
      Result:= TRUE;
    except
    end;

    for I:= ColsList.Count - 1 downto 0 do
      if Assigned( ColsList[ i ] ) then with TColumn( ColsList[ i ] ) do
         if Index <> I then
            Index := I;
  finally
    ColsList.Free;
    Columns.EndUpdate;
  end;
end;

function TIQRegForm.ReadWWGrid( Sender:TObject ):Boolean;
var
//  DBGrid  : TWWDBGrid;
  I       : Integer;
  ColsList: TList;
  MfgType : string;

  procedure RestoreWWDBGridUsingBuiltIn;
  begin
//    DBGrid.IniAttributes.FileName      := FormPath;
//    DBGrid.IniAttributes.SectionName   := Format('%s\%s', [ DBGrid.Name, MfgType ]);
//    DBGrid.IniAttributes.CheckNewFields:= TRUE;
//    DBGrid.IniAttributes.SaveToRegistry:= TRUE;
//    DBGrid.LoadFromIniFile;
  end;

begin
//  DBGrid:= Sender as TWWDBGrid;
  Result := False;

  //with TFDTable(DBGrid.DataSource.DataSet) do
//  if Assigned(DBGrid.DataSource) and Assigned(DBGrid.DataSource.DataSet) then
//     with TFDRDBMSDataSet(DBGrid.DataSource.DataSet) do
//     try
//       ColsList:= TList.Create;
//       for i:= 0 to FieldCount - 1 do ColsList.Add( Fields[ i ] );             {prepare as many columns we have}
//
//       {MfgType (if any) is passed in the tag property }
//       MfgType:= WideCharToString(PWideChar(DBGrid.Tag));
//       if MfgType = '' then
//          MfgType:= '_NoMfgType_';
//
//       if not DBGrid.UseTFields then
//       begin
//         RestoreWWDBGridUsingBuiltIn;
//         EXIT;
//       end;
//
//       for i:= 0 to FieldCount - 1 do
//       try
//         {A Path may look like 'RTPartNumbers\dbGrid1.Act Cav(ACTCAV)'}
//         Path:= Format( '%s\%s\%s\%s(%s)', [ FormPath,
//                                             DBGrid.Name,
//                                             MfgType,
//                                             DefaultToString( Fields[ i ].DisplayLabel, Format( 'Column%d', [ i ] )),
//                                             DefaultToString( Fields[ i ].FieldName, Format( 'FieldName%d', [ i ] )) ]);
//         if KeyIsOpen and ValueExists( 'Width' ) then
//            Fields[ i ].DisplayWidth:= ReadInteger( 'Width' );
//
//         if KeyIsOpen and ValueExists( 'Index' ) then
//            ColsList[ ReadInteger( 'Index' ) ]:= Fields[ i ];
//
//         Result:= TRUE;
//       except
//       end;
//
//       for i:= 0 to ColsList.Count - 1 do
//         if Assigned( ColsList[ i ] ) then with TField( ColsList[ i ] ) do
//            if Index <> I then
//               Index := I;
//     finally
//       ColsList.Free;
//     end;
end;

procedure TIQRegForm.WriteGrid( Sender:TObject  );
var
  DBGrid : TUniDBGrid;
  I:Integer;
  MfgType:string;
begin
  DBGrid:= Sender as TUniDBGrid;

  {MfgType (if any) is passed in the tag property }
  MfgType:= WideCharToString(PWideChar(DBGrid.Tag));
  if MfgType = '' then
     MfgType:= '_NoMfgType_';

  with DBGrid do
  begin
    for i:= 0 to Columns.Count - 1 do
    try
      {FrmRealTime\DBGrid1\INJECTION\Act Cav(ACTCAV)}
      Path:= Format( '%s\%s\%s\%s(%s)', [ FormPath,
                                          DBGrid.Name,
                                          MfgType,
                                          DefaultToString( Columns[ i ].Title.Caption, Format( 'Column%d', [ i ] )),
                                          DefaultToString( Columns[ i ].FieldName, Format( 'FieldName%d', [ i ] )) ]);
      if KeyIsOpen then
        WriteInteger( 'Width', Columns[ i ].Width );
      if KeyIsOpen then
        // WriteInteger( 'Index', Columns[ i ].Index );
        WriteInteger( 'Index', I );
    except
    end;
  end;
end;

procedure TIQRegForm.WriteWWGrid( Sender:TObject  );
var
//  DBGrid : TWWDBGrid;
  I:Integer;
  MfgType:string;

  procedure SaveWWDBGridUsingBuiltIn;
  begin
//    DBGrid.IniAttributes.FileName      := FormPath;
//    DBGrid.IniAttributes.SectionName   := Format('%s\%s', [ DBGrid.Name, MfgType ]);
//    DBGrid.IniAttributes.CheckNewFields:= TRUE;
//    DBGrid.IniAttributes.SaveToRegistry:= TRUE;
//    DBGrid.SaveToIniFile;
  end;

begin
//  DBGrid:= Sender as TWWDBGrid;
//  if not Assigned(DBGrid.DataSource) then Exit;
//
//  {MfgType (if any) is passed in the tag property }
//  MfgType:= WideCharToString(PWideChar(DBGrid.Tag));
//  if MfgType = '' then
//     MfgType:= '_NoMfgType_';
//
//  if not DBGrid.UseTFields then
//  begin
//    SaveWWDBGridUsingBuiltIn;
//    EXIT;
//  end;
//
//  with TFDRDBMSDataSet(DBGrid.DataSource.DataSet) do
//  for i:= 0 to FieldCount - 1 do
//  try
//    {FrmRealTime\DBGrid1\INJECTION\Act Cav(ACTCAV)}
//    Path:= Format( '%s\%s\%s\%s(%s)', [ FormPath,
//                                        DBGrid.Name,
//                                        MfgType,
//                                        DefaultToString( Fields[ i ].DisplayLabel, Format( 'Column%d', [ i ] )),
//                                        DefaultToString( Fields[ i ].FieldName, Format( 'FieldName%d', [ i ] )) ]);
//    if KeyIsOpen then
//      WriteInteger( 'Width', Fields[ i ].DisplayWidth );
//    if KeyIsOpen then
//      // WriteInteger( 'Index', Columns[ i ].Index );
//      WriteInteger( 'Index', Fields[ i ].Index );
//  except
//  end;
end;

function TIQRegForm.ReadStringGrid( AObject : TObject ):Boolean;
var
  I: Integer;
begin
  with TUniStringGrid( AObject ) do
    for I:= 0 to ColCount - 1 do
    try
      Path:= Format( '%s\%s\%d', [ FormPath, Name, I ]);   {Form1\StringGrid1\1}
      if KeyIsOpen and ValueExists( 'Width' ) then
         ColWidths[ I ]:= ReadInteger( 'Width' );
      Result:= TRUE;
    except
      Result:= FALSE;
    end;
end;

function TIQRegForm.ReadSpeedButton(Sender: TObject): Boolean;
var
  AControl: TUniSpeedButton;
  AValue: Integer;
begin
  AControl := TUniSpeedButton(Sender);
  AValue := ReadAsInteger2(AControl, FSpeedButtonPath, 'Down' );
  Result:= (AValue <> - 1);
  if Result then
    AControl.Down := ( AValue = 1 );
end;

procedure TIQRegForm.WriteSpeedButton(Sender: TObject);
var
  AControl: TUniSpeedButton;
begin
  AControl := TUniSpeedButton(Sender);
  WriteAsInteger2(AControl, FSpeedButtonPath, 'Down', iIIf(AControl.Down, 1, 0 ));
end;

function  TIQRegForm.ReadUpDown( Sender:TObject ):Boolean;
var
  AControl: TUpDown;
  AValue: Integer;
begin
  AControl := TUpDown(Sender);
  AValue := ReadAsInteger(AControl, 'Position' );
  Result:= (AValue <> - 1);
  if Result then
    try
      AControl.Position := AValue;
    except
    end;
end;

procedure TIQRegForm.WriteUpDown( Sender:TObject );
var
  AControl: TUpDown;
begin
  AControl := TUpDown(Sender);
  WriteAsInteger(AControl, 'Position', AControl.Position);
end;

procedure TIQRegForm.WriteStringGrid( AObject : TObject );
var
  I: Integer;
begin
  with TUniStringGrid( AObject ) do
    for I:= 0 to ColCount - 1 do
    try
      Path:= Format( '%s\%s\%d', [ FormPath, Name, I ]);   {Form1\StringGrid1\1}
      if KeyIsOpen then
        WriteInteger( 'Width', ColWidths[ I ] );
    except
    end;
end;

function TIQRegForm.ReadQuery( AObject : TObject ):Boolean;
var
  S:string;
begin
  S:= ReadAsString( AObject as TFDQuery, 'SQL.Text' );

  if S <> '' then
  with (AObject as TFDQuery) do
  begin
    SQL.Clear;
    SQL.Add(S);
  end;
end;

procedure TIQRegForm.WriteQuery( AObject : TObject );
begin
  with (AObject as TFDQuery) do
    WriteAsString( AObject as TFDQuery, 'SQL.Text', SQL.Text );
end;

function TIQRegForm.ReadMenuItem(  Sender : TObject ):Boolean;
var
  MenuItem:TUniMenuItem;
  Res:Integer;
begin
   MenuItem:= TUniMenuItem(Sender);
   Res:= ReadAsInteger2( MenuItem, FMenuItemPath, 'Checked' );
   Result:= (Res <> - 1);
   if Result then
     MenuItem.Checked:= ( Res = 1 );
end;

procedure TIQRegForm.WriteMenuItem(  Sender : TObject );
var
  MenuItem: TUniMenuItem;
begin
   MenuItem:= TUniMenuItem(Sender);
   WriteAsInteger2( MenuItem, FMenuItemPath, 'Checked', iIIf( MenuItem.Checked, 1, 0 ));
end;

function TIQRegForm.ReadPageControl(  Sender : TObject ):Boolean;
var
  PageControl : TUniPageControl;
  Res:Integer;
begin
   PageControl:= TUniPageControl(Sender);
   Res:= ReadAsInteger( PageControl, 'PageIndex' );
   Result:= (Res > - 1) and (Res < PageControl.PageCount);
   if Result and PageControl.Pages[ Res ].TabVisible then
      PageControl.ActivePage:= PageControl.Pages[ Res ];
   ReadControl( Sender );
end;

procedure TIQRegForm.WritePageControl(  Sender : TObject );
var
  PageControl : TUniPageControl;
begin
  PageControl:= TUniPageControl(Sender);
  WriteAsInteger( PageControl, 'PageIndex', PageControl.ActivePage.PageIndex );
  WriteControl( Sender );
end;

function TIQRegForm.ReadComboBox( Sender : TObject ):Boolean;
var
  ComboBox: TUniComboBox;
  Res:Integer;
begin
   ComboBox:= TUniComboBox( Sender );
   Res:= ReadAsInteger( ComboBox, 'ItemIndex' );
   Result:= (Res > - 1);
   if Result and (ComboBox.Items.Count > 0) then
      ComboBox.ItemIndex:= Res;
end;

procedure TIQRegForm.WriteComboBox(  Sender : TObject );
var
  ComboBox: TUniComboBox;
begin
  ComboBox:= TUniComboBox( Sender );
  WriteAsInteger( ComboBox, 'ItemIndex', ComboBox.ItemIndex );
end;

function TIQRegForm.ReadWWComboBox( Sender : TObject ):Boolean;
var
//  ComboBox: TwwDBComboBox;
  Res:Integer;
begin
//   ComboBox:= TwwDBComboBox( Sender );
//   Res:= ReadAsInteger( ComboBox, 'ItemIndex' );
//   Result:= (Res > - 1);
//   if Result and (ComboBox.Items.Count > 0) then
//      ComboBox.ItemIndex:= Res;
end;

procedure TIQRegForm.WriteWWComboBox(  Sender : TObject );
//var
//  ComboBox: TwwDBComboBox;
begin
//  ComboBox:= TwwDBComboBox( Sender );
//  WriteAsInteger( ComboBox, 'ItemIndex', ComboBox.ItemIndex );
end;

function TIQRegForm.ReadListView(Sender: TObject): Boolean;
var
//  ListView: TListView;
  ColsList: TList;
  I, J: Integer;
  ABasePath: string;
begin
//  ListView := TListView(Sender);
//  if (ListView.ViewStyle = vsReport) then
//    try
//      ListView.Items.BeginUpdate;
//      ColsList := TList.Create;
//      try
//        ABasePath := Format('%s\%s\Columns', [FormPath, ListView.Name]);
//        Path := ABasePath;
//
//        for I := 0 to ListView.Columns.Count - 1 do
//          ColsList.Add(ListView.Columns[I]);
//
//        for I := 0 to ListView.Columns.Count - 1 do
//          with ListView.Columns[I] do
//            try
//              Path := Format('%s\%s', [ABasePath, Format('Column%d', [I])]);
//              if KeyIsOpen and ValueExists('Width') then
//                Width := ReadInteger('Width');
//              Result := TRUE;
//            except
//            end;
//      finally
//        ColsList.Free;
//      end;
//    finally
//      ListView.Items.EndUpdate;
//    end;
end;

procedure TIQRegForm.WriteListView(Sender: TObject);
var
//  ListView: TListView;
  I: Integer;
  ABasePath: string;
begin
//  ListView := TListView(Sender);
//  if (ListView.ViewStyle = vsReport) then
//    begin
//      ABasePath := Format('%s\%s\Columns', [FormPath, ListView.Name]);
//      Path := ABasePath;
//      for I := 0 to ListView.Columns.Count - 1 do
//        try
//          Path := Format('%s\%s', [ABasePath, Format('Column%d', [I])]);
//          if KeyIsOpen then
//            WriteInteger('Width', ListView.Columns[I].Width);
//          if KeyIsOpen then
//            WriteInteger('Index', I);
//        except
//        end;
//    end;
end;

function TIQRegForm.ReadControl( Sender:TObject ):Boolean;
var
  AControl:TWinControl;
  I:Integer;
begin
   //if Sender is TCustomControl then
   if Sender is TUniControl then
   begin
      Result:= TRUE;
      //AControl:= TCustomControl( Sender )
      AControl:= TUniControl( Sender )
   end
   else
   begin
      Result:= FALSE;
      EXIT;
   end;

   case AControl.Align of
     alTop..alBottom:
       begin
         I:= ReadAsInteger( AControl, 'Height');
         if I > 0 then
           AControl.Height:= I
         else
           Result:= FALSE;
       end;
     alLeft..alRight:
       begin
         I:= ReadAsInteger( AControl, 'Width' );
         if I > 0 then
           AControl.Width := I
         else
           Result:= FALSE;
       end;
   end;
end;

procedure TIQRegForm.WriteControl( Sender:TObject );
var
  //AControl:TCustomControl;
  AControl : TUniControl;
begin
   //if Sender is TCustomControl then
   if Sender is TUniControl then
   begin
      //AControl:= TCustomControl( Sender );
      AControl:= TUniControl( Sender );
      case AControl.Align of
        alTop..alBottom: WriteAsInteger( AControl, 'Height', AControl.Height);
        alLeft..alRight: WriteAsInteger( AControl, 'Width' , AControl.Width );
      end;
   end;
end;

class procedure TIQRegForm.ReadDialogCheckBox(const AKey: string;
  var AChecked: Boolean; var AModalResult: TModalResult;
  var AMessageText: string; var AShowDialog: Boolean;
  const ADefaultResult: TModalResult);
var
  APath: string;
begin
  // Initialization
  AChecked := False;
  AModalResult := ADefaultResult;
  AMessageText := '';
  AShowDialog := True;
  try
    if Trim(AKey) > '' then
      with Self.Create(nil) do
      try
        APath := DialogCheckBoxPath(AKey);
        if OpenKey( APath, False ) then
          begin
            CloseKey;
            if OpenKey( APath + 'CheckBox', False ) then
            begin
              AChecked := ReadInteger('Checked') = 1;
              AShowDialog := not AChecked;
              CloseKey;
            end;
            if OpenKey( APath + 'LastResult', False ) then
            begin
              AModalResult := TModalResult(ReadInteger('ScalarValue'));
              CloseKey;
            end;
            if OpenKey( APath + 'Msg', False ) then
            begin
              AMessageText := ReadString('ScalarValue');
              CloseKey;
            end;
          end;
      finally
        Free;
      end;
  except
    // suppress
  end;
end;

class procedure TIQRegForm.WriteDialogCheckBox(const AKey: string;
  const AChecked: Boolean; const AModalResult: TModalResult;
  const AMessageText: string);
var
  APath: string;
begin
  if Trim(AKey) > '' then
    with Self.Create(nil) do
    try
      APath := DialogCheckBoxPath(AKey);
      if OpenKey(APath + 'CheckBox', True ) then
      begin
        WriteInteger('Checked', Integer(AChecked));
        CloseKey;
      end;
      if OpenKey( APath + 'LastResult', True ) then
      begin
        WriteInteger('ScalarValue', Ord(AModalResult));
        CloseKey;
      end;
      if OpenKey( APath + 'Msg', True ) then
      begin
        WriteString('ScalarValue', AMessageText);
        CloseKey;
      end;
    finally
      Free;
    end;
end;

function TIQRegForm.ReadEdit( Sender:TObject ):Boolean;
var
 Edit : TUniEdit;
begin
   Result:= TRUE;
   Edit:= TUniEdit(Sender);
   Edit.Text:= ReadAsString( Edit, 'Text' );
end;

procedure TIQRegForm.WriteEdit( Sender:TObject );
var
 Edit : TUniEdit;
begin
   Edit:= TUniEdit(Sender);
   WriteAsString( Edit, 'Text', Edit.Text );
end;

function TIQRegForm.ReadCheckBox(  Sender : TObject ):Boolean;
var
  cb: TUniCheckBox;
  Res:Integer;
begin
   cb:= TUniCheckBox(Sender);
   if FIsDialogCheckBox then
     Res:= ReadAsInteger2( cb, FFormPath, 'Checked' )
   else
     Res:= ReadAsInteger2( cb, FCheckboxPath, 'Checked' );
   Result:= (Res <> - 1);
   if Result then
     cb.Checked:= ( Res = 1 );
end;

procedure TIQRegForm.WriteCheckBox(  Sender : TObject );
var
  cb : TUniCheckBox;
begin
  cb:= TUniCheckBox(Sender);
  if FIsDialogCheckBox then
    WriteAsInteger2( cb, FFormPath, 'Checked', iIIf( cb.Checked, 1, 0 ))
  else
    WriteAsInteger2( cb, FCheckboxPath, 'Checked', iIIf( cb.Checked, 1, 0 ));
end;

function TIQRegForm.ReadRadioButton(  Sender : TObject ):Boolean;
var
  AControl: TUniRadioButton;
  Res:Integer;
begin
   AControl := TUniRadioButton(Sender);
   if FIsDialogCheckBox then
     Res:= ReadAsInteger2( AControl, FFormPath, 'Checked' )
   else
     Res:= ReadAsInteger2( AControl, FCheckboxPath, 'Checked' );
   Result:= (Res <> - 1);
   if Result then
     AControl.Checked:= ( Res = 1 );
end;

procedure TIQRegForm.WriteRadioButton(  Sender : TObject );
var
  AControl: TUniRadioButton;
begin
  AControl:= TUniRadioButton(Sender);
  if FIsDialogCheckBox then
    WriteAsInteger2( AControl, FFormPath, 'Checked', iIIf( AControl.Checked, 1, 0 ))
  else
    WriteAsInteger2( AControl, FCheckboxPath, 'Checked', iIIf( AControl.Checked, 1, 0 ));
end;

function TIQRegForm.ReadRadioGroup(Sender: TObject): Boolean;
var
  AControl: TUniRadioGroup;
  Res:Integer;
begin
   AControl:= TUniRadioGroup( Sender );
   Res:= ReadAsInteger( AControl, 'ItemIndex' );
   Result:= (Res > - 1);
   if Result and (AControl.Items.Count > 0) then
      AControl.ItemIndex:= Res;
end;

procedure TIQRegForm.WriteRadioGroup(Sender: TObject);
var
  AControl: TUniRadioGroup;
begin
  AControl:= TUniRadioGroup( Sender );
  WriteAsInteger( AControl, 'ItemIndex', AControl.ItemIndex );
end;

function TIQRegForm.ReadAsString( AComponent:TComponent; const ValueName:string ):string;
begin
  try
    Path := Format( '%s\%s', [FormPath, AComponent.Name]);
    if KeyIsOpen then
      Result:= ReadString( ValueName );
  except
    Result:= '';
  end;
end;

procedure TIQRegForm.WriteAsString( AComponent:TComponent; const ValueName, Value : string );
begin
  Path:= Format( '%s\%s', [FormPath, AComponent.Name]);
  if KeyIsOpen then
     WriteString( ValueName, Value );
end;

function TIQRegForm.ReadAsInteger( AComponent:TComponent; const ValueName:string ):Integer;
begin
  try
    Path := Format( '%s\%s', [FormPath, AComponent.Name]);
    if KeyIsOpen and ValueExists(ValueName) then
       Result:= ReadInteger( ValueName )
    else
       Result:= -1;
  except
    Result:= -1;
  end;
end;

procedure TIQRegForm.WriteAsInteger( AComponent:TComponent; const ValueName : string; Value : Integer );
begin
  Path:= Format( '%s\%s', [FormPath, AComponent.Name]);
  if KeyIsOpen then
     WriteInteger( ValueName, Value );
end;

function TIQRegForm.ReadAsInteger2(AComponent: TComponent; const APath,
  ValueName: string): Integer;
begin
  Path := Format( '%s\%s', [APath, AComponent.Name]);
  try
    if KeyIsOpen and ValueExists(ValueName) then
       Result:= ReadInteger( ValueName )
    else
       Result:= -1;
  except
    Result:= -1;
  end;
end;

procedure TIQRegForm.WriteAsInteger2(AComponent: TComponent; const APath,
  ValueName: string; Value: Integer);
begin
  Path:= Format( '%s\%s', [APath, AComponent.Name]);
  if KeyIsOpen then
     WriteInteger( ValueName, Value );
end;

procedure TIQRegForm.WriteWWFilterDialog(Sender: TObject);
//var
//  I: Integer;
//  AFilterDialog: TwwFilterDialog;
//  AFieldInfo: TwwFieldInfo;
begin
//  AFilterDialog:= Sender as TwwFilterDialog;
//  WriteWWFilterDialog( Format('%s\%s', [ FormPath, AFilterDialog.Name ]), AFilterDialog );
end;

procedure TIQRegForm.WriteWWFilterDialog( APath: string; AFilterDialog: TObject );
//var
//  I: Integer;
//  AFieldInfo: TwwFieldInfo;
begin
//  IQDeleteKey( APath );
//
//  for I:= 0 to AFilterDialog.FieldInfo.Count - 1 do
//  try
//    AFieldInfo:= TwwFieldInfo( AFilterDialog.FieldInfo.Items[ I ]);
//
//    {FrmRealTime\wwFilterDialog1\Item #(ITEMNO)}
//    Path:= Format( '%s\%s(%s)', [ APath,
//                                  DefaultToString( AFieldInfo.DisplayLabel, Format( 'Field%d', [ I ] )),
//                                  DefaultToString( AFieldInfo.FieldName, Format( 'FieldName%d', [ i ] )) ]);
//    if KeyIsOpen then
//    begin
//      WriteInteger('MatchType',     Integer(AFieldInfo.MatchType));
//      WriteString ('FilterValue',   AFieldInfo.FilterValue);
//      WriteString ('MinValue',      AFieldInfo.MinValue);
//      WriteString ('MaxValue',      AFieldInfo.MaxValue);
//      WriteInteger('CaseSensitive', IIf(AFieldInfo.CaseSensitive, 1, 0 ));
//      WriteInteger('NonMatching',   IIf( AFieldInfo.NonMatching, 1, 0 ));
//      WriteString ('FieldName',     AFieldInfo.FieldName);
//      WriteString ('DisplayLabel',  AFieldInfo.DisplayLabel);
//    end;
//  except
//  end;
end;


function TIQRegForm.ReadWWFilterDialog( Sender: TObject): Boolean;
//var
//  AFilterDialog: TwwFilterDialog;
begin
  Result := False;
//  AFilterDialog:= Sender as TwwFilterDialog;
//  Result:= ReadWWFilterDialog( Format( '%s\%s', [ FormPath, AFilterDialog.Name ]), AFilterDialog );  // Ex Key: FrmRealTime\wwFilterDialog1
end;


function TIQRegForm.ReadWWFilterDialog( APath: string; AFilterDialog: TObject ): Boolean;
//var
//  I            : Integer;
//  AFieldInfo   : TwwFieldInfo;
//  AKey         : string;
//  AList        : TStringList;

//  procedure AddFieldToFilter( AKey: string );
//  begin
//    if not OpenKey( AKey, FALSE ) then
//       EXIT;
//    if (AFilterDialog.SelectedFields.Count > 0) and (AFilterDialog.SelectedFields.IndexOf( ReadString('FieldName')) = -1) then
//       EXIT;
//
//    AFieldInfo:= TwwFieldInfo.Create;
//
//    AFieldInfo.FieldName    := ReadString('FieldName');
//    AFieldInfo.DisplayLabel := ReadString('DisplayLabel');
//    AFieldInfo.MatchType    := TwwFilterMatchType( ReadInteger('MatchType'));
//    AFieldInfo.FilterValue  := ReadString ('FilterValue');
//    AFieldInfo.MinValue     := ReadString ('MinValue');
//    AFieldInfo.MaxValue     := ReadString ('MaxValue');
//    AFieldInfo.CaseSensitive:= ReadInteger('CaseSensitive') = 1;
//    AFieldInfo.NonMatching  := ReadInteger('NonMatching') = 1;
//
//    AFilterDialog.FieldInfo.Add( AFieldInfo );
//  end;

begin
  Result:= FALSE;

//  if not Assigned( AFilterDialog.DataSource ) then
//     EXIT;
//
//  AFilterDialog.ClearFilter;
//
//  if OpenKey( APath, FALSE ) then
//  begin
//    AList:= TStringList.Create;
//    try
//      GetKeyNames( AList );
//      Result:= AList.Count > 0;
//
//      for I:= 0 to AList.Count - 1 do
//         AddFieldToFilter( APath + '\' + AList[ I ]); {local proc above}
//
//      if Assigned( AFilterDialog.DataSource ) and Assigned( AFilterDialog.DataSource.DataSet) and ( AFilterDialog.DataSource.DataSet.State <> dsInactive ) then
//         AFilterDialog.ApplyFilter;
//    finally
//      AList.Free;
//    end;
//  end;
end;


function TIQRegForm.ReadWWDataInspector(Sender: TObject): Boolean;
//var
//  AControl: TwwDataInspector;
//  I: Integer;
begin
//   Result:= TRUE;
//   if not (Sender is TwwDataInspector) then
//   begin
//     Result:= FALSE;
//     EXIT;
//   end;
//
//   AControl:= TwwDataInspector( Sender );
//
//   case AControl.Align of
//     alTop..alBottom:
//       begin
//         I:= ReadAsInteger( AControl, 'Height');
//         if I > 0 then
//           AControl.Height:= I
//         else
//           Result:= FALSE;
//       end;
//     alLeft..alRight:
//       begin
//         I:= ReadAsInteger( AControl, 'Width' );
//         if I > 0 then
//           AControl.Width := I
//         else
//           Result:= FALSE;
//       end;
//   end;
end;

procedure TIQRegForm.WriteWWDataInspector(Sender: TObject);
begin
//   if (Sender is TwwDataInspector) then with TwwDataInspector( Sender ) do
//   begin
//      case Align of
//        alTop..alBottom: WriteAsInteger( TwwDataInspector( Sender ), 'Height', Height);
//        alLeft..alRight: WriteAsInteger( TwwDataInspector( Sender ), 'Width' , Width );
//      end;
//   end;
end;

function TIQRegForm.CheckPathExistsAssignValue( APath: string): Boolean;
begin
  Result:= FALSE;
  FPath:= APath;
  FKeyIsOpen:= OpenKey( FPath, FALSE );
  Result:= FKeyIsOpen;
end;


function CompareMRUEntries( List: TStringList; Index1, Index2: Integer ): Integer;
begin
  with List do
    if TMRUCargo(Objects[ Index1 ]).TimeStamp < TMRUCargo(Objects[ Index2 ]).TimeStamp then
       Result:= -1
    else if TMRUCargo(Objects[ Index1 ]).TimeStamp > TMRUCargo(Objects[ Index2 ]).TimeStamp then
       Result:= 1
    else
       Result:= 0;
end;


procedure TIQRegForm.KeepLastKeys( AKeyName: string; ACount: Integer );
var
  AList: TStringList;
  I    : Integer;
  S    : string;
begin
  Path:= AKeyName;
  AList:= TStringList.Create;
  try
    {get all the subnodes that hold the actual data}
    GetKeyNames( AList );

    if ACount >= AList.Count then
       EXIT;

    {append datetime stamp to every entry}
    for I:= 0 to AList.Count - 1 do
    begin
      Path:= Format( '%s\%s', [ AKeyName, AList[ I ]]);
      S:= ReadString( 'TimeStamp' );
      try
        AList.Objects[ I ]:= TMRUCargo.Create( StrToDateTime( S ));
      except
        AList.Objects[ I ]:= TMRUCargo.Create(now);  // in case the date time format does not match the windows settings
      end;
    end;

    {sort it in asc order of the timestamp}
    AList.CustomSort( CompareMRUEntries );

    {restore the path back to the MRU folder}
    Path:= AKeyName;

    {delete extras}
    for I:= AList.Count - ACount - 1 downto 0 do
       DeleteKey( AList[ I ] );
  finally
    ClearStringListOfObjects( AList );
    AList.Free;
  end;
end;


procedure TIQRegForm.LoadSubKeysIntegerValues( AKeyName: string; AResultValues: TStringList );
var
  AKeysList  : TStringList;
  AValuesList: TStringList;
  I,J        : Integer;
  S          : string;
  procedure AddToStr( X: string );
  begin
    if S = '' then
       S:= X
    else
       S:= S + #9 + X;
  end;
begin
  Path:= AKeyName;
  AKeysList  := TStringList.Create;
  AValuesList:= TStringList.Create;
  try
    GetKeyNames( AKeysList );

    for I:= 0 to AKeysList.Count - 1 do
    begin
      Path:= AKeysList[ I ]; //changed from windows code for WebIQ

      GetValueNames( AValuesList );
      S:= '';
      for J:= 0 to AValuesList.Count - 1 do
        AddToStr( ReadString ( AValuesList[ J ]) );

      if AValuesList.Count > 0 then
         AResultValues.Add(S);
    end;

  finally
    AKeysList.Free;
    AValuesList.Free;
  end;
end;

procedure TIQRegForm.RequestRedirectOnFormShow( Sender: TObject );
var
  AForm: TUniForm;
  ACargo: TIQRegFormOnShowCargo;
begin
//  if not Assigned(Sender) or not (Sender is TUniForm) or not Assigned(DB_DataModule) then
//     EXIT;

  AForm:= TUniForm(Sender);
  if not Assigned(AForm) then
     EXIT;

  // store current values in a cargo and then assign the reference to it into the form's tag
  ACargo:= TIQRegFormOnShowCargo.Create(AForm);
  ACargo.Tag   := AForm.Tag;
  ACargo.OnShow:= AForm.OnShow;

  // point the form tag to the cargo object so we could restore the original values in the redirected OnShow
  AForm.Tag:= LongInt(ACargo);

  // redirect the onshow event
//  AForm.OnShow:= DB_DataModule.RedirectOnFormShowToRestoreForm;
end;


procedure TIQRegForm.GetKeyNamesOf( AName: string; AList: TStringList );
var
  AKey: string;
begin
  // Ex Name = AdvancedFilterList
  //    AKey =  HKEY_CURRENT_USER\Software\IQMS\IQWin32\Iqwin32.exe\TBOM_DM\PkMfg\AdvancedFilterList
  AKey:= Format( '%s\%s', [ FormPath, AName ]);
  AList.Clear;
  if OpenKey( AKey, FALSE ) then
     GetKeyNames( AList );
end;

end.

