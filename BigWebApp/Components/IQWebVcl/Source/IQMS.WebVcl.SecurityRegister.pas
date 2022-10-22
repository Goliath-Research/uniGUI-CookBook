(* For user interface use the following methods:
   --------------------------------------------
   0. Drop TIQWebSecurityRegister component on a form and list secured components names in SecurityItems TStrings property

   1. if SR.Enabled[ 'DBNavigator1' ] then ...      - to see if DBNavigator1 is enabled according to security schema

   2. SR.ApplySecurity( 'DBNavigator1' )            - to reassign component properties such as enabled, visible etc

   3. SR.Refresh                                    - to refresh component pointers and reload data from SecurityManager
                                                      Usefull when child form is inserted into current shell form as a child

   4. SecureColumnByName( DBGrid1, 'Act_Cost', SR ) - to reflect read/write and visible of the field that connected to that
                                                      column. Field must be registered in the Security Register list ex:
                                                      Table1ACT_COST
*)
unit IQMS.WebVcl.SecurityRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls,
  Vcl.Menus, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.UI.Intf,
  IQMS.WebVcl.UDRecView,
  IQMS.WebVcl.HyperlinkCombo,
  IQMS.WebVcl.PictureGallery,
  uniGUIServer,uniGUIServerUtils, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes,uniGUIForm,uniDBGrid,uniFileUpload,UniDBNavigator,uniDBEdit,uniMainMenu,
  uniPageControl;

const
  WEB_REPDEF_SECURITY_CODE = '_IQWEBDIRECT_REPORTS_';

type
  TSecurityAdminClass = class of TSecurityAdmin;
  TInsufficientRights = class( Exception );

  {forward declarations }
  TSecurityCargo = class;    {run time information only}
  TIQWebSecurityRegister = class; {security register component on the form}
  TSecurityRepDef = class;   {repdef record encapsulated in a component}

  { TSecurityAdministrator }

  TSecurityAdmin = class
  private
     FOwner : TSecurityCargo;
     function IsAccessForced( ASecurityRegister: TIQWebSecurityRegister ): Boolean;
  public
     constructor Create( AOwner : TSecurityCargo );
     procedure Apply( ASecurityRegister: TIQWebSecurityRegister ); virtual;
     procedure HandleComponentSecurity; virtual;
     procedure RaiseInsifficientRightsException; virtual;
  end;

  TSecurityAdminTForm = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
     procedure RaiseInsifficientRightsException; override;
  end;

  TSecurityAdminTDBNavigator = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQUDRecView = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTPictureGallery = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTDBEdit = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTMenuItem  = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTFDTable = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTQuery = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTFDQuery = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTField = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQDocs = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQExtDoc = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQEMailCorrespondence = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTTabSheet = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTwwDBComboBox = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQUDComboBox = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTwwDBGrid = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIqSearch = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQwwDBComboDlg = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;

  TSecurityAdminTIQHyperlinkComboDlg = class( TSecurityAdmin )
     procedure HandleComponentSecurity; override;
  end;


  { TSecurityCargo }

  TSecurityCargo = class  {run time information only}
    SEnabled  : Boolean;
    SInsert   : Boolean;
    SDelete   : Boolean;
    SReadWrite: Boolean;
    SVisible  : Boolean;
    SecuredComponent: TComponent;
    SecurityAdmin   : TSecurityAdmin;
    IsUserAdded: Boolean;  // 01-08-2009 support user added components
    constructor Create( AIsUserAdded: Boolean );
  end;

  TIQWebSecurityRegister = class(TComponent)
  private
    { Private declarations }
    FSecurityCode  : string;
    FSecurityItems : TStrings;
    FForceAccessItems : TStrings;
    FAfterApply: TNotifyEvent;
    FBeforeApply: TNotifyEvent;
    procedure SetSecurityItems( Value : TStrings );
    procedure SetForceAccessItems( Value : TStrings );
    procedure SetSecurityCode( AValue : string );
    procedure ClearSecurityItems;
    function GetSecurityAdmin( I:Integer ) : TSecurityAdmin;
    procedure SetSecurityAdmin( I:Integer; AValue : TSecurityAdmin );
    function GetEnabled( const S:string ) : Boolean;
    function GetInsert( const S:string ) : Boolean;
    function GetDelete( const S:string ) : Boolean;
    function GetReadWrite( const S:string ) : Boolean;
    function GetVisible( const S:string ) : Boolean;
    procedure InitializeSecurityDataPropertiesToFalse;
    procedure FreeSecurityItemObjectAt(Index: Integer);
    procedure InsertUserAddedItems;
    function GetSecurityAdminByName(const S: string): TSecurityAdmin;
  protected
    { Protected declarations }
    procedure ValidateSecurityItems( Value : TStrings );
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    function GetSecurityCargo( const AField : string ): TSecurityCargo;
    procedure AddSecurityCargoFields;
    function CreateSecurityAdmin( SecurityCargoParent : TSecurityCargo): TSecurityAdmin;
  public
    { Public declarations }
    property SecurityAdmin[ I:Integer ] : TSecurityAdmin read GetSecurityAdmin write SetSecurityAdmin;
    property SecurityAdminByName[ const S:string ] : TSecurityAdmin read GetSecurityAdminByName;

    property Enabled  [ const S:string ] : Boolean read GetEnabled;
    property Insert   [ const S:string ] : Boolean read GetInsert;
    property Delete   [ const S:string ] : Boolean read GetDelete;
    property ReadWrite[ const S:string ] : Boolean read GetReadWrite;
    property Visible  [ const S:string ] : Boolean read GetVisible;

    procedure SaveComponentsToFile;
    procedure SaveComponentsToStringList( AOwner:TComponent; AList : TStringList );

    procedure Assign(Source: TPersistent); override;
    procedure Apply;
    procedure ApplySecurity( const S : string );
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;
    function LocateComponent( AForm : TComponent; const ComponentName: string ) : TComponent;
    function SameOrSharesOwner( AComponentInFocus, AOwner: TComponent):Boolean;
    procedure AddSecurityItem(const AName: string);
    procedure AddInternalSecurityItem(const AName: string);
    procedure AddSecurityItemsList(AList: TStrings);
    procedure RemoveSecurityItem(const AName: string);
    procedure RemoveSecurityItemsList(AList: TStrings);
    procedure InsertSecurityItems( Index: Integer; const AName : string; AIsUserAdded: Boolean = False );
    procedure ReadSecurityData( const AUserName : string );
    procedure RefreshSecurityRegisterFrom( SR : TIQWebSecurityRegister );
    procedure MapSecurityItemsToComponents;
    procedure Refresh;
    function DeriveComponentNameFrom( S: string ): string;
    function ConvertFormNameToOriginal( const AFormName: string ): string;
    procedure Sort;
    function HasInsertRights( AComponent: TComponent ): Boolean;

    // procedure AddToForceAccessItems(const AName: string);
  published
    { Published declarations }
    property ForceAccessItems: TStrings read FForceAccessItems write SetForceAccessItems;
    property SecurityItems: TStrings  read FSecurityItems write SetSecurityItems;
    property SecurityCode : string read FSecurityCode write SetSecurityCode;
    property AfterApply: TNotifyEvent read FAfterApply write FAfterApply;
    property BeforeApply: TNotifyEvent read FBeforeApply write FBeforeApply;
  end;

  {We create TSecurityRepDef object on fly per record in repdef table. Owner = Form the SR is on}
  TSecurityRepDef = class(TComponent)
  private
    FReportName: string;
  public
    property ReportName: string read FReportName write FReportName;
  end;


function FindSecurityRegister( AForm : TUniForm ) : TIQWebSecurityRegister;
procedure SecureColumnByName( ADBGrid: TUniDBGrid; AFieldName: string; SR: TIQWebSecurityRegister );
//procedure AssignDataInspectorItemVisible( DI: TwwDataInspector; AFieldName, AComponentName: string; SR: TIQWebSecurityRegister );


implementation

uses
  IQMS.WebVcl.SecurityManager,
  IQMS.WebVcl.EmailCorrespondence,
  IQMS.Common.DataServices,
  IQMS.Common.Controls,
  IQMS.WebVcl.RepDef,
  IQMS.Common.StringUtils,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Documents,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.WebVcl.ResourceStrings,
  IQMS.WebVcl.Search;




function FindSecurityRegister( AForm : TUniForm ) : TIQWebSecurityRegister;
var
  I:Integer;
begin
  if Assigned( AForm ) then with AForm do
    for I:= 0 to ComponentCount - 1 do
      if Components[ I ] is TIQWebSecurityRegister then
      begin
        Result:= Components[ I ] as TIQWebSecurityRegister;
        EXIT;
      end;
  Result:= NIL;
end;

procedure SecureColumnByName( ADBGrid: TUniDBGrid; AFieldName: string; SR: TIQWebSecurityRegister );
var
  AColumn: TUniDBGridColumn;
begin
//  AColumn:= IQColumnByName( ADBGrid, AFieldName );
  if Assigned( AColumn ) and Assigned( AColumn.Field ) then with AColumn do
  begin
     Field.ReadOnly:= not SR.ReadWrite[ Field.Name ];
     if not SR.Visible[ Field.Name ] then
        Collection:= NIL;
  end;
end;

//procedure AssignDataInspectorItemVisible( DI: TwwDataInspector; AFieldName, AComponentName: string; SR: TIQWebSecurityRegister );
//var
//  I: Integer;
//  AItem: TwwInspectorItem;
//begin
//  if not (Assigned( DI ) and Assigned( SR )) then
//     EXIT;
//
//  // if Assigned( DI.GetItemByFieldName( AFieldName )) then
//  AItem:= DI.GetFirstChild(false);
//  while Assigned( AItem ) do
//  begin
//    if (CompareText( AItem.DataField, AFieldName) = 0)
//       and
//       Assigned(AItem.DataSource)
//       and
//       Assigned(AItem.DataSource.DataSet)
//       and
//       Assigned(AItem.DataSource.DataSet.FindField( AFieldName ))
//       and
//       (CompareText(AItem.DataSource.DataSet.FieldByName(AFieldName).Name, AComponentName ) = 0) then
//    begin
//      AItem.Visible:= SR.Visible[ AComponentName ];
//      BREAK;
//    end;
//
//    AItem:= AItem.GetNext( False );
//  end;
//end;


{ TIQWebSecurityRegister }

constructor TIQWebSecurityRegister.Create(AOwner:TComponent);
begin
  inherited;
  FSecurityItems := TStringList.Create;
  FForceAccessItems := TStringList.Create;
  SecurityCode := AOwner.Name;
end;

destructor TIQWebSecurityRegister.Destroy;
begin
  if (SecurityManager <> nil) then
     SecurityManager.RemoveSecurityManager( self );
  ClearSecurityItems;
  FSecurityItems.Free;
  FForceAccessItems.Free;
  inherited Destroy;
end;

procedure TIQWebSecurityRegister.ClearSecurityItems;
var
  I:Integer;
begin
  {remove run time information only}
  for I:= SecurityItems.Count - 1 downto 0 do
    FreeSecurityItemObjectAt( I )
end;

procedure TIQWebSecurityRegister.FreeSecurityItemObjectAt( Index:Integer );
begin
  if Assigned( TSecurityCargo( SecurityItems.Objects[ Index ] )) then with TSecurityCargo( SecurityItems.Objects[ Index ] ) do
  begin
    SecurityAdmin.Free;
    Free;
  end;
end;

procedure TIQWebSecurityRegister.Notification(AComponent: TComponent; Operation: TOperation);
var
  I:Integer;
begin
  inherited Notification(AComponent, Operation);
  (*
  if (not (csDesigning in ComponentState)) then
     if (Operation = opRemove) and (AComponent.Name <> '') and (AComponent <> self) and not (csDestroying in ComponentState) then
     begin
       I:= SecurityItems.IndexOf( AComponent.Name );
       if I >= 0 then
       begin
         SecurityAdmin[ I ].Free;
         TSecurityCargo( SecurityItems.Objects[ I ] ).Free;
         SecurityItems.Delete( I );
       end;
     end;
  *)
end;

procedure TIQWebSecurityRegister.Loaded;
begin
  inherited Loaded;
  Refresh; 
end;

procedure TIQWebSecurityRegister.Refresh;

  procedure InsertRepDefRecords(const AppId: string);
  var
    ASecurityRepDef: TSecurityRepDef;
    AComponentName : string;
  begin
    with TIQCommonDataServices.InitQuery(Format('select repname from repdef where app_id = ''%s''', [ AppId ])) do
      while not Eof do
      begin
        AComponentName:= DeriveComponentNameFrom( Fields[ 0 ].asString );
        if self.Owner.FindComponent( AComponentName ) = nil then
        begin
          ASecurityRepDef:= TSecurityRepDef.Create( self.Owner );
          ASecurityRepDef.Name      := AComponentName;
          ASecurityRepDef.ReportName:= Fields[ 0 ].asString;
        end;
        InsertSecurityItems(  1, AComponentName );
        Next;
      end;
  end;

  procedure HandleReportSecurity;
  begin
//    if (Owner is TFrmRepDef) then
//    begin
//      if TIQWebRepDef( TFrmRepDef(Owner).Owner ).WebUse then
//         SecurityCode:= WEB_REPDEF_SECURITY_CODE
//      else
//         SecurityCode:= TFrmRepDef(Owner).App_ID;
//
//      InsertRepDefRecords(TFrmRepDef(Owner).App_ID);
//    end;
  end;

begin
  if (not (csDesigning in ComponentState)) then
  begin
    HandleReportSecurity;

    InsertSecurityItems( 0, ConvertFormNameToOriginal( Owner.Name ));  {Make sure the form itsef (owner) is in the SecurityItems list}
    InsertUserAddedItems;                                              {Insert components added by user to S_ITEM table. Create Cargo at the same time}
    AddSecurityCargoFields;                                            {Add run time information structure with securityadmin object}
    if (SecurityManager <> nil) then                                {Keep all security access info in SecurityManager's list}
       SecurityManager.AssignSecurityRegister( self );                 {And copy it back into current SecurityRegister}

    Apply;                                                             {Apply Enabled, ReadWrite etc to all the components in the SecurityItems List}
  end;
end;

procedure TIQWebSecurityRegister.SetSecurityCode( AValue : string );
begin
  if AValue <> FSecurityCode then
     FSecurityCode:= UpperCase( AValue );
end;

procedure TIQWebSecurityRegister.SetSecurityItems( Value : TStrings );
var
  I: Integer;
begin
  if SecurityItems.Text <> Value.Text then
  begin
    SecurityItems.BeginUpdate;
    try
      SecurityItems.Assign(Value);
      // SecurityItems.Clear;
      // for I:= 0 to Value.Count - 1 do
      // begin
      //   if Trim(Value[ I ]) > '' then
      //      SecurityItems.Add( Trim(Value[ I ]));
      // end;
    finally
      SecurityItems.EndUpdate;
    end;
  end;
end;

procedure TIQWebSecurityRegister.SetForceAccessItems( Value : TStrings );
begin
  if ForceAccessItems.Text <> Value.Text then with ForceAccessItems do
  begin
    BeginUpdate;
    try
      Assign( Value );
    finally
      EndUpdate;
    end;
  end;
end;

procedure TIQWebSecurityRegister.ValidateSecurityItems( Value : TStrings );
var
  I:Integer;
  S:string;
begin
  S:= '';
  for I:= Value.Count - 1 downto 0 do
    if not Assigned( Owner.FindComponent( Value[ I ] )) then
    begin
      S:= S + #13 + Value[ I ];
      Value.Delete( I );
    end;
//  if S <> '' then
//     {'The following components have not been found on %s and '+
//      'have been removed from the Registered Security Components list:'}
//     IQWarning(Format(  IQMS.WebVcl.ResourceStrings.cTXT0000178 + #13 + S, [ Owner.Name ] ));
end;

procedure TIQWebSecurityRegister.SaveComponentsToFile;
var
  I,J     : Integer;
  List    : TStringList;
  FileName,DestName: String;
begin
   if not DirectoryExists(UniServerInstance.StartPath+'FilesFolder\') then
    CreateDir(UniServerInstance.StartPath+'FilesFolder\');

  DestName := UniServerInstance.StartPath+'FilesFolder\';
  FileName := Copy(Owner.Name,1,8);
  List:= TStringList.Create;
  try
    SaveComponentsToStringList( Owner, List );
    List.Sort;
    List.SaveToFile( DestName+FileName );
  finally
    List.Free;
  end;
end;

procedure TIQWebSecurityRegister.SaveComponentsToStringList( AOwner:TComponent; AList : TStringList );
var
  I:Integer;
begin
    AList.Add( AOwner.ClassName + ' ' + AOwner.Name );
    {Components on a form}
    for I:= 0 to AOwner.ComponentCount - 1 do with AOwner.Components[ I ] do
      AList.Add( ClassName + ' ' + Name );

    {We have a component that belongs to another form that has switched it's Parents}
    for I:= 0 to UniSession.FormsList.Count - 1 do
      if (TUniForm(UniSession.FormsList[ I ]).Owner = AOwner) and (TUniForm(UniSession.FormsList[ I ]).ControlCount = 0) then
         SaveComponentsToStringList( TUniForm(UniSession.FormsList[ I ]), AList );

    {Oh boy - is this a DataModule? }
    for i:= 0 to UniSession.DataModules.Count - 1 do
      if TDataModule(UniSession.DataModules[ I ]).Owner = AOwner then
         SaveComponentsToStringList( TDataModule(UniSession.DataModules[ I ]), AList );
end;


function TIQWebSecurityRegister.LocateComponent( AForm : TComponent; const ComponentName: string ) : TComponent;
var
  I, n: Integer;
  s: String;
  o: TComponent;

  // 01-08-2014
  function _IsEmbeddedUserFieldsForm( AUDForm: TUniForm ): Boolean;
  var
    AOwner: TComponent;
  begin
    // is it TFrmUserFieldsBuiltIn
//    Result:= (AUDForm is TFrmUserFieldsBuiltIn);
    if not Result then
       EXIT;

    // user fields form is wrapped (owned by) IQMS.WebVcl.UDEmbeddedForm component that in turn sits on AForm (the owner) - make sure the owners match
    AOwner:= AUDForm.Owner; // such as IQUDEmbeddedForm1
    if AOwner = nil then
       EXIT (False);

    AOwner:= AOwner.Owner; //  the actual owner of the IQUDEmbeddedForm1 such as IN_Inv or IN_Inv_1

    Result:= AOwner = AForm;
  end;

begin
  if AnsiCompareText( AForm.Name, ComponentName ) = 0 then
  begin
     Result:= AForm;
     EXIT;
  end;

  Result:= AForm.FindComponent( ComponentName );
  if Result <> NIL then
     EXIT;

  {We have a component that belongs to another form that has switched it's Parents}
  {1. check if this Screen.Forms[ I ]'s owner is AForm and go into recursion to retrieve the components from Screen.Forms[ I ]
      or
   2. check if this Screen.Forms[ I ] is an embedded user defined form whose owner (that is not a form) is a IQMS.WebVcl.UDEmbeddedForm component whose owner in turn is AForm}

  //for i:= 0 to Screen.FormCount - 1 do
  for i:= 0 to UniSession.FormsList.Count - 1 do
    if (TUniForm( UniSession.FormsList[i]).ControlCount = 0)
       and
       ((TUniForm( UniSession.FormsList[i]).Owner = AForm)
        or
         // 01-08-2014 (Screen.Forms[ I ] is TFrmUserFieldsBuiltIn) and Assigned( AForm.FindComponent( Screen.Forms[ I ].Owner.Name ))) then
        _IsEmbeddedUserFieldsForm( TUniForm( UniSession.FormsList[i]) )) then
    begin
       Result:= LocateComponent( TUniForm( UniSession.FormsList[i]), ComponentName );
       if Result <> NIL then
          EXIT;
    end;

  {Oh boy - is this a DataModule? Check exact owner of the datamodule first}
      {Oh boy - is this a DataModule? }
  for i:= 0 to UniSession.DataModules.Count - 1 do
     if AForm = TDataModule(UniSession.DataModules[ I ]).Owner then
     begin
       Result:= TDataModule(UniSession.DataModules[ I ]).FindComponent( ComponentName );
       if Result <> NIL then
          EXIT;
    end;

  {Check for DataModule shared between the owners}
  for i:= 0 to UniSession.DataModules.Count - 1 do
    if SameOrSharesOwner( AForm,  TDataModule(UniSession.DataModules[ I ]).Owner ) then
    begin
       Result:= TDataModule(UniSession.DataModules[ I ]).FindComponent( ComponentName );
       if Result <> NIL then
          EXIT;
    end;

  // Check if component name is a path (such as, ParentComponent.ChildComponent)
  n := NumToken(ComponentName, '.');
  if n > 1 then
     begin
       s := GetToken(ComponentName, '.', 1);
       o := AForm.FindComponent(s);
       if (o <> NIL) then
          for i := 2 to n do
            begin
              s := GetToken(ComponentName, '.', i);
              o := o.FindComponent(s);
              Result := o;
              if (i = n) then
                 Exit;
            end;
     end;

  Result:= NIL;
end;

function TIQWebSecurityRegister.SameOrSharesOwner( AComponentInFocus, AOwner: TComponent):Boolean;
var
  ATemp: TComponent;
begin
  ATemp:= AComponentInFocus;
  while Assigned( ATemp ) and Assigned( AOwner ) and not (AOwner is TApplication) do
  begin
    if ATemp = AOwner then
    begin
       Result:= True;
       EXIT;
    end;
    ATemp:= ATemp.Owner;
  end;
  Result:= False;
end;

function TIQWebSecurityRegister.ConvertFormNameToOriginal( const AFormName: string ): string;
var
  iPosLastUndrscr : integer;

  {Added for EIQ-11111. Users converted PT -> PS and cancelled the print dialog >= 10 times
   and the old logic blocked them out of the screen because it only worked up to FormName_9...
  AMB 04-13-16}
  function endswith_n : Boolean;
  var
    i, iTest: integer;
  begin
    Result:= False;
    //Is the last char in AFormName an integer?
//    if not IQNumber.IsStringValidInteger( AFormName[Length(AFormName)], iTest  ) then
//      EXIT(False);

    //Find index of last underscore in name like "Name_1", Name_100000"
    for i:= Length(AFormName) downto 1 do
      begin
        if AFormName[i] = '_' then
          begin
            iPosLastUndrscr:= i;
            break;
          end;
      end;

    Result:= iPosLastUndrscr > 0;
  end;

begin
  iPosLastUndrscr:= 0;
  {if it's a form make sure the name is the original one ie not Form_1 etc}
  if endswith_n then
     Result:= Copy( AFormName, 1, iPosLastUndrscr - 1 )
  else
     Result:= AFormName;
end;


{The following procedures are used during run time!}

procedure TIQWebSecurityRegister.Sort;
begin
  (SecurityItems as TStringList).Sort;
end;

procedure TIQWebSecurityRegister.Assign(Source: TPersistent);
begin
  if Source is TIQWebSecurityRegister then
  begin
    SecurityCode:= TIQWebSecurityRegister( Source ).SecurityCode;
    ClearSecurityItems;
    SecurityItems.Assign( TIQWebSecurityRegister(Source).SecurityItems );
    AddSecurityCargoFields;
    EXIT;
  end;
  inherited Assign(Source);
end;

procedure TIQWebSecurityRegister.InsertSecurityItems( Index: Integer; const AName : string; AIsUserAdded: Boolean = False );
var
  I: Integer;
begin
  if (AName = '') or (SecurityItems.IndexOf( AName ) > -1) then
     EXIT;

  if not AIsUserAdded then
     SecurityItems.InsertObject( Index, UpperCase( AName ), TSecurityCargo.Create( AIsUserAdded ))
  else
     SecurityItems.AddObject( UpperCase( AName ), TSecurityCargo.Create( AIsUserAdded ));

  // SecurityItems.Objects[ I ]:= TSecurityCargo.Create( AIsUserAdded );
end;

function TIQWebSecurityRegister.DeriveComponentNameFrom( S: string ): string;
begin
  {is used when report name is passed and I need a valid component name based on it}
  S:= StrTran( StrTran( StrTran( StrTran( S, '.', '_'), '\', '_'), ':', '_'), ' ', '_');

  {if first letter is a digit append an underscore as a prefix}
  if S[ 1 ] in ['0','1','2','3','4','5','6','7','8','9'] then
     S:= '_' + S;

  Result:= S;
end;

procedure TIQWebSecurityRegister.AddSecurityCargoFields;
var
  I:Integer;
  AIsUserAdded: Boolean;
begin
  for I:= 0 to SecurityItems.Count - 1 do
    if not Assigned( SecurityItems.Objects[ I ] ) then
       SecurityItems.Objects[ I ]:= TSecurityCargo.Create( False );
end;

procedure TIQWebSecurityRegister.InitializeSecurityDataPropertiesToFalse;
var
  I: Integer;
begin
  for I:= 0 to SecurityItems.Count - 1 do if Assigned( SecurityItems.Objects[ I ]) then
    with SecurityItems.Objects[ I ] as TSecurityCargo do
    begin
       SEnabled  := False;
       SInsert   := False;
       SDelete   := False;
       SReadWrite:= False;
       SVisible  := False;
    end;
end;

procedure TIQWebSecurityRegister.ReadSecurityData( const AUserName : string );
var
  I:Integer;
  AIsUserNameAltered: Boolean;
begin
   InitializeSecurityDataPropertiesToFalse;

   TSecurityManager.CheckEnsureUserNameLookupIsAssigned( AIsUserNameAltered );
   try
     with TIQCommonDataServices.InitQuery(
       Format('select s_detail.c_name,                                            '+
                      '       max(s_detail.c_enabled) as c_enabled,                       '+
                      '       max(s_detail.c_insert) as c_insert,                         '+
                      '       max(s_detail.c_delete) as c_delete,                         '+
                      '       max(s_detail.c_rd_wr) as c_rd_wr,                           '+
                      '       max(s_detail.c_visible) as c_visible                        '+
                      '  from (select * from s_detail where app_s_code = ''%s'') s_detail '+
                      ' where exists (select 1 from v_current_user_roles where role_name = s_detail.role_name) '+
                      'group by s_detail.c_name                                           ',
                      [ SecurityCode ])) do
       while not Eof do
       begin
         I:= SecurityItems.IndexOf( FieldByName('C_NAME').asString );
         if I >= 0 then with SecurityItems.Objects[ I ] as TSecurityCargo do
         begin
            SEnabled  := FieldByName('C_ENABLED').asString = 'Y';
            SInsert   := FieldByName('C_INSERT').asString  = 'Y';
            SDelete   := FieldByName('C_DELETE').asString  = 'Y';
            SReadWrite:= FieldByName('C_RD_WR').asString   = 'Y';
            SVisible  := FieldByName('C_VISIBLE').asString = 'Y';
         end;
         Next;
       end;
   finally
     if AIsUserNameAltered then
        TSecurityManager.ResetUserNameLookup;
   end;
end;

procedure TIQWebSecurityRegister.RefreshSecurityRegisterFrom( SR : TIQWebSecurityRegister );
var
  I:Integer;
begin
  {Update from SR that keeps security information in tables. This SR belongs to SecurityManager}
  for I:= 0 to SecurityItems.Count - 1 do with SecurityItems.Objects[ I ] as TSecurityCargo do
  begin
    SEnabled  := (SR.SecurityItems.Objects[ I ] as TSecurityCargo).SEnabled;
    SInsert   := (SR.SecurityItems.Objects[ I ] as TSecurityCargo).SInsert ;
    SDelete   := (SR.SecurityItems.Objects[ I ] as TSecurityCargo).SDelete ;
    SReadWrite:= (SR.SecurityItems.Objects[ I ] as TSecurityCargo).SReadWrite;
    SVisible  := (SR.SecurityItems.Objects[ I ] as TSecurityCargo).SVisible;
  end;
end;

procedure TIQWebSecurityRegister.AddSecurityItem(const AName : string);
begin
  AddInternalSecurityItem(UpperCase(AName));
end;

procedure TIQWebSecurityRegister.AddInternalSecurityItem(const AName: string);
var
  I: Integer;
  Cargo: TSecurityCargo;
begin
  if (AName = '') or (SecurityItems.IndexOf( AName ) > -1) then
    Exit;

  Cargo:= TSecurityCargo.Create(False);
  with Cargo do begin
    I:= SecurityItems.AddObject(AName, Cargo );

    SecuredComponent:= LocateComponent( Owner as TUniForm, SecurityItems[ I ] );

    SecurityAdmin:= CreateSecurityAdmin( Cargo );

    with SecurityAdmin do Apply( self );
  end;
end;

procedure TIQWebSecurityRegister.AddSecurityItemsList( AList: TStrings );
var
  I: Integer;
begin
  for I:= 0 to AList.Count - 1 do
    AddSecurityItem( AList[ I ]);
end;

procedure TIQWebSecurityRegister.RemoveSecurityItem(const AName : string);
var
  I: Integer;
begin
  if AName = '' then
    Exit;

  I:= SecurityItems.IndexOf( AName );
  if I = -1 then
    Exit;

  if Assigned( TSecurityCargo( SecurityItems.Objects[ I ]) ) then
  begin
    FreeSecurityItemObjectAt( I );
    SecurityItems.Delete( I );
  end;
end;

procedure TIQWebSecurityRegister.RemoveSecurityItemsList( AList: TStrings );
var
  I: Integer;
begin
  for I:= 0 to AList.Count - 1 do
    RemoveSecurityItem( AList[ I ]);
end;


procedure TIQWebSecurityRegister.MapSecurityItemsToComponents;
var
  I : Integer;
  SecurityCargo : TSecurityCargo;
begin
  {Update RunTime info}
  for I:= 0 to SecurityItems.Count - 1 do with SecurityItems.Objects[ I ] as TSecurityCargo do
  begin
    SecuredComponent:= LocateComponent( Owner as TUniForm, SecurityItems[ I ]);

    SecurityCargo:= TSecurityCargo(SecurityItems.Objects[ I ]);

    if Assigned( SecurityCargo.SecurityAdmin ) then
       SecurityCargo.SecurityAdmin.Free;

    SecurityCargo.SecurityAdmin:= CreateSecurityAdmin( SecurityCargo );
  end;
end;

function TIQWebSecurityRegister.CreateSecurityAdmin( SecurityCargoParent : TSecurityCargo): TSecurityAdmin;
var
  Reference: TSecurityAdminClass;
begin
   with SecurityCargoParent do
     if SecuredComponent is TUniForm                 then Reference:= TSecurityAdminClass( TSecurityAdminTForm        )
     else if SecuredComponent is TUniDBNavigator     then Reference:= TSecurityAdminClass( TSecurityAdminTDBNavigator )
     else if SecuredComponent is TUniDBEdit          then Reference:= TSecurityAdminClass( TSecurityAdminTDBEdit      )
     else if SecuredComponent is TUniMenuItem        then Reference:= TSecurityAdminClass( TSecurityAdminTMenuItem    )
     else if SecuredComponent is TFDTable         then Reference:= TSecurityAdminClass( TSecurityAdminTFDTable       )
     else if SecuredComponent is TFDQuery         then Reference:= TSecurityAdminClass( TSecurityAdminTFDQuery     )
     else if SecuredComponent is TField           then Reference:= TSecurityAdminClass( TSecurityAdminTField       )
     else if SecuredComponent is TIQWebDocs       then Reference:= TSecurityAdminClass( TSecurityAdminTIQDocs      )
     else if SecuredComponent is TIQWebExtDoc     then Reference:= TSecurityAdminClass( TSecurityAdminTIQExtDoc    )
//     else if SecuredComponent is TIQWebEMailCorrespondence then Reference:= TSecurityAdminClass( TSecurityAdminTIQEMailCorrespondence )
     else if SecuredComponent is TUniTabSheet        then Reference:= TSecurityAdminClass( TSecurityAdminTTabSheet    )
//     else if SecuredComponent is TIQWebUDComboBox    then Reference:= TSecurityAdminClass( TSecurityAdminTIQUDComboBox)
//     else if SecuredComponent is TwwDBComboBox    then Reference:= TSecurityAdminClass( TSecurityAdminTwwDBComboBox)
//     else if SecuredComponent is TwwDBGrid        then Reference:= TSecurityAdminClass( TSecurityAdminTwwDBGrid    )
     else if SecuredComponent is TIQWebSearch     then Reference:= TSecurityAdminClass( TSecurityAdminTIqSearch )
     else if SecuredComponent is TIQWebUDRecView  then Reference:= TSecurityAdminClass( TSecurityAdminTIQUDRecView )
     else if SecuredComponent is TIQWebPictureGallery    then Reference:= TSecurityAdminClass( TSecurityAdminTPictureGallery )
//     else if SecuredComponent is TIQwwDBComboDlg  then Reference:= TSecurityAdminClass( TSecurityAdminTIQwwDBComboDlg)
     else if SecuredComponent is TIQWebHyperlinkComboDlg then Reference:= TSecurityAdminClass( TSecurityAdminTIQHyperlinkComboDlg)
     else
        Reference:= TSecurityAdminClass( TSecurityAdmin );

  Result:= Reference.Create( SecurityCargoParent );
end;

function TIQWebSecurityRegister.GetSecurityCargo( const AField : string ): TSecurityCargo;
var
  I:Integer;
begin
  I:= SecurityItems.IndexOf( AField );
  if (I >= 0) and Assigned( TSecurityCargo( SecurityItems.Objects[ I ] )) then
     Result:= TSecurityCargo( SecurityItems.Objects[ I ] )
  else
     Result:= NIL;
end;

function TIQWebSecurityRegister.GetEnabled( const S : string ) : Boolean;
var
  SC : TSecurityCargo;
begin
  Result := True;
  if (SecurityManager <> nil) then
    begin
      if SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
         Result:= TRUE
      else begin
         SC:= GetSecurityCargo( S );
         if Assigned( SC ) then
            Result:= SC.SEnabled
         else
            Result:= TRUE;
      end;
    end;
end;

function TIQWebSecurityRegister.GetInsert( const S : string ) : Boolean;
var
  SC : TSecurityCargo;
begin
  Result := True;
  if (SecurityManager <> nil) then
    begin
      if SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
         Result:= TRUE
      else begin
         SC:= GetSecurityCargo( S );
         if Assigned( SC ) then
            Result:= SC.SInsert
         else
            Result:= TRUE;
      end;
    end;
end;

function TIQWebSecurityRegister.GetDelete( const S : string ) : Boolean;
var
  SC : TSecurityCargo;
begin
  Result := True;
  if (SecurityManager <> nil) then
    begin
      if SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
         Result := True
      else begin
         SC:= GetSecurityCargo( S );
         if Assigned( SC ) then
            Result:= SC.SDelete
         else
            Result:= TRUE;
      end;
    end;
end;

function TIQWebSecurityRegister.GetReadWrite( const S : string ) : Boolean;
var
  SC : TSecurityCargo;
begin
  Result := True;
  if (SecurityManager <> nil) then
    begin
      if SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
         Result := True
      else begin
         SC:= GetSecurityCargo( S );
         if Assigned( SC ) then
            Result:= SC.SReadWrite
         else
            Result:= TRUE;
      end;
    end;
end;

function TIQWebSecurityRegister.GetVisible( const S : string ) : Boolean;
var
  SC : TSecurityCargo;
begin
  Result := True;
  if (SecurityManager <> nil) then
    begin
      if SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
         Result := True
      else begin
         SC:= GetSecurityCargo( S );
         if Assigned( SC ) then
            Result:= SC.SVisible
         else
            Result:= TRUE;
      end;
    end;
end;

function TIQWebSecurityRegister.GetSecurityAdmin( I:Integer ) : TSecurityAdmin;
begin
  if (I >= 0) and (I < SecurityItems.Count) and Assigned( TSecurityCargo( SecurityItems.Objects[ I ] )) then
     Result:= TSecurityCargo( SecurityItems.Objects[ I ] ).SecurityAdmin
  else
     Result:= NIL;
end;

function TIQWebSecurityRegister.GetSecurityAdminByName(const S: string): TSecurityAdmin;
var
  I:Integer;
begin
  I:= SecurityItems.IndexOf( S );
  Result:= GetSecurityAdmin( I );
end;

procedure TIQWebSecurityRegister.SetSecurityAdmin( I:Integer; AValue : TSecurityAdmin );
begin
  if SecurityAdmin[ I ] <> AValue then
  begin
    if Assigned(SecurityAdmin[ I ]) then
       SecurityAdmin[ I ].Free;
    SecurityAdmin[ I ]:= AValue;
  end;
end;

procedure TIQWebSecurityRegister.Apply;
var
  I:Integer;
begin
  // Execute "before" apply
 if Assigned(FBeforeApply) then
   FBeforeApply(Self);

  for I:= 0 to SecurityItems.Count - 1 do
    if Assigned( SecurityAdmin[ I ] ) then with SecurityAdmin[ I ] do
       Apply( self );

  // Execute "after" apply
  if Assigned(FAfterApply) then
    FAfterApply(Self);
end;

procedure TIQWebSecurityRegister.ApplySecurity( const S : string );
var
  I:Integer;
begin
  I:= SecurityItems.IndexOf( S );
  if (I >= 0) and Assigned( SecurityAdmin[ I ] ) then with SecurityAdmin[ I ] do
     Apply( self );
end;

// procedure TIQWebSecurityRegister.AddToForceAccessItems(const AName: string);
// var
//   I: Integer;
// begin
//   if (AName = '') or (ForceAccessItems.IndexOf( AName ) > -1) then
//     Exit;
//
//   ForceAccessItems.Add( AName );
// end;


procedure TIQWebSecurityRegister.InsertUserAddedItems;
var
  intf: IIQDataset;
begin
  // load user items
  with TIQCommonDataServices.InitQuery(Format('select c_name from s_item where app_s_code = ''%s''', [ UpperCase(SecurityCode)])) do
    while not Eof do
    begin
      InsertSecurityItems( -1, FieldByName('c_name').asString, True );
      Next;
    end;
end;


function TIQWebSecurityRegister.HasInsertRights( AComponent: TComponent ): Boolean;
begin
  Result:= self.Insert[ AComponent.Name ];
//  if not Result then
//     IQError(Format( IQMS.WebVcl.ResourceStrings.cTXT0000180 {'Insufficient rights.  Access denied. [%s]'}, [ AComponent.Name ]));
end;


{ TSecurityCargo }

constructor TSecurityCargo.Create(AIsUserAdded: Boolean);
begin
  inherited Create;
  IsUserAdded:= AIsUserAdded;
end;




{ TSecurityAdmin }

constructor TSecurityAdmin.Create( AOwner : TSecurityCargo );
begin
  FOwner:= AOwner;
end;

procedure TSecurityAdmin.Apply( ASecurityRegister: TIQWebSecurityRegister );
begin
  if (SecurityManager <> nil) and SecurityManager.IsUserDBA and not SecurityManager.DBANeedsSecurityRoles then
     EXIT;

  if IsAccessForced( ASecurityRegister ) then
     EXIT;

  {06-11-2010 designed to allow temporary full access to a form granted in the code. See IQRF\RF_Repack.pas}
  if (SecurityManager <> nil) and SecurityManager.IsFullAccessGrantedToSecurityCode( ASecurityRegister.SecurityCode ) then
     EXIT;

  {10-26-2011 designed to allow full access to IQClock with auto login and user=rtbox}
  if (SecurityManager <> nil) and SecurityManager.HasUnrestrictedAccess then
     EXIT;

  HandleComponentSecurity;
end;

function TSecurityAdmin.IsAccessForced( ASecurityRegister: TIQWebSecurityRegister ): Boolean;
var
  S: string;
begin
  Result:= False;
  with ASecurityRegister.ForceAccessItems do
    if Assigned( FOwner.SecuredComponent ) then    { FOwner is TSecurityCargo }
    begin
      if FOwner.SecuredComponent is TUniForm then
         S:= ASecurityRegister.ConvertFormNameToOriginal( FOwner.SecuredComponent.Name )  { Convert Form_1 to Form (original) }
      else
         S:= FOwner.SecuredComponent.Name;
      Result:= IndexOf( S ) > -1;
    end;
end;

procedure TSecurityAdmin.HandleComponentSecurity;
begin
   with FOwner do  {TSecurityCargo}
     if Assigned(SecuredComponent) and (SecuredComponent is TControl) then
     begin
        (SecuredComponent as TControl).Enabled:= SEnabled;
        (SecuredComponent as TControl).Visible:= SVisible;
     end
end;

procedure TSecurityAdmin.RaiseInsifficientRightsException;
begin
  // 09/08/2014 Modified this procedure by calling IQError instead of
  // raising TInsufficientRights because IQError ensures the form will
  // not be hidden behind the form, if called through DCOM (Byron).
  // Change made for YouTrack issue:
  // EIQ-3999 Receiving - Jump to SPC, insufficient rights AV and error  - internal
  try
   // IQMS.WebVcl.ResourceStrings.cTXT0000180 =
   // 'Insufficient rights.  Access denied. [%s]'
//    IQError(Format(IQMS.WebVcl.ResourceStrings.cTXT0000180, [FOwner.SecuredComponent.Name]));
  finally
    System.SysUtils.Abort;
  end;

//   MessageBeep(0);
//   raise TInsufficientRights.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000180 {'Insufficient rights.  Access denied. [%s]'},
// [ FOwner.SecuredComponent.Name ]);
end;



{ TSecurityAdminTForm  }

procedure TSecurityAdminTForm.HandleComponentSecurity;
begin
  if Assigned(FOwner) and not FOwner.SEnabled then  {TSecurityCargo}
     RaiseInsifficientRightsException
end;

procedure TSecurityAdminTForm.RaiseInsifficientRightsException;
begin
  // 09/08/2014 Modified this procedure by calling IQError instead of
  // raising TInsufficientRights because IQError ensures the form will
  // not be hidden behind the form, if called through DCOM (Byron).
  // Change made for YouTrack issue:
  // EIQ-3999 Receiving - Jump to SPC, insufficient rights AV and error  - internal
  // 03/17/2015 (Byron) Check if FOwner and SecuredComponent is assigned
  // before attempting to use.  Prevent AV.
  // EIQ-6468 CRM - Access Violation if User Doesn't Have Security Rights
  if Assigned(FOwner) and Assigned(FOwner.SecuredComponent) then
  try
    // IQMS.WebVcl.ResourceStrings.cTXT0000176 =
    // 'Insufficient rights.  Access denied. [%s, %s]'
//    IQError(Format(IQMS.WebVcl.ResourceStrings.cTXT0000176,
//      [TUniForm(FOwner.SecuredComponent).Caption, FOwner.SecuredComponent.Name]));
  finally
    // 03/17/2015 (Byron) Calling SysUtils.Abort will generate a GPF if
    // the Application.MainForm is nil.  So, if the user does not have
    // access to the main form, just close the application.
    // EIQ-6468 CRM - Access Violation if User Doesn't Have Security Rights
    if (UniGUIApplication.UniApplication = nil) then
      Application.Terminate
    else
      System.SysUtils.Abort;
  end;
//   raise TInsufficientRights.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000176 {'Insufficient rights.  Access denied. [%s, %s]'},
//                                       [ TUniForm(FOwner.SecuredComponent).Caption, FOwner.SecuredComponent.Name ]);
end;


{ TSecurityAdminTDBNavigator  }

procedure TSecurityAdminTDBNavigator.HandleComponentSecurity;
begin
  inherited;        {Set Enabled}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TDBNavigator do
    begin
      if not SInsert then
         VisibleButtons:= VisibleButtons - [nbInsert];

      if not SDelete then
         VisibleButtons:= VisibleButtons - [nbDelete];

      if not SReadWrite then
         VisibleButtons:= VisibleButtons - [nbEdit];
    end;
end;


{ TSecurityAdminTDBEdit }

procedure TSecurityAdminTDBEdit.HandleComponentSecurity;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TUniDBEdit do
    begin
      Visible := SVisible;
      ReadOnly:= not SReadWrite;
    end;
end;



{ TSecurityAdminTMenuItem }
procedure TSecurityAdminTMenuItem.HandleComponentSecurity;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TUniMenuItem do
      Enabled := SEnabled;
end;

{ TSecurityAdminTFDTable }

procedure TSecurityAdminTFDTable.HandleComponentSecurity;
var
  AState: TDataSetState;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then
    with SecuredComponent as TFDTable do
    begin
      if UpdateOptions.ReadOnly <>  not SReadWrite then
      try
        AState:= State;
        if State <> dsInactive then
           Close;
        UpdateOptions.ReadOnly:= not SReadWrite;
      finally
        if AState = dsBrowse then
           Open;
      end;
    end;
end;

{ TSecurityAdminTQuery }

procedure TSecurityAdminTQuery.HandleComponentSecurity;
var
  AUpdateable: Boolean;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TFDQuery do
    begin
//  Cashed Updated Queries with no UpdateObject and no OnNewRecord were skipped by.  Dec 15 2009 Z.
//      AUpdateable:= Assigned(UpdateObject) or Assigned(OnNewRecord);
      AUpdateable:= Assigned(UpdateObject) or Assigned(OnUpdateRecord);
      if AUpdateable and (CachedUpdates <> SReadWrite) then
         CachedUpdates:= SReadWrite;
    end;
end;


{ TSecurityAdminTField }

procedure TSecurityAdminTField.HandleComponentSecurity;
var
  AState: TDataSetState;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TField do
    begin
      Visible := SVisible;
      ReadOnly:= not SReadWrite;
    end;
end;

{ TSecurityAdminTIQDocs }

procedure TSecurityAdminTIQDocs.HandleComponentSecurity;
begin
  inherited;        {Set Enabled}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TIQWebDocs do
    begin
//      AddBtn.Visible := SInsert;
//      DelBtn.Visible := SDelete;
//      EditBtn.Visible:= SReadWrite;
    end;
end;

{ TSecurityAdminTIQExtDoc }

procedure TSecurityAdminTIQExtDoc.HandleComponentSecurity;
var
  AState: TDataSetState;
begin
  // 08-10-2010 Enabled property is not surfaced - why to set it? Caused component being disabled if s_enabled = False for whatever reason
  // inherited;        {Set Visible and Enabled}

  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TIQWebExtDoc, ExtDocs do
    begin
      Visible:= SVisible;

      // SReadWrite overwrites Insert and Delete switches
      if IsReadOnly <> not SReadWrite then
      try
        AState:= State;
        if State <> dsInactive then
           Close;
        IsReadOnly:= not SReadWrite;
      finally
        if AState = dsBrowse then
           Open;
      end;

      // navigator insert and delete
      if not IsReadOnly then
      begin
//        if not SDelete then
//           ExtNav.VisibleButtons:= ExtNav.VisibleButtons - [nbDelete]
//        else
//           ExtNav.VisibleButtons:= ExtNav.VisibleButtons + [nbDelete];
//
//        if not SInsert then
//           ExtNav.VisibleButtons:= ExtNav.VisibleButtons - [nbInsert]
//        else
//           ExtNav.VisibleButtons:= ExtNav.VisibleButtons + [nbInsert];
      end;
    end;
end;

{ TSecurityAdminTIQEMailCorrespondence }

procedure TSecurityAdminTIQEMailCorrespondence.HandleComponentSecurity;
begin
  // Overwrite this
  FOwner.SEnabled := True;
  inherited;        {Set Visible and Enabled}
  with FOwner do    {TSecurityCargo}
   if Assigned(SecuredComponent) then
      with SecuredComponent as TIQWebEMailCorrespondence do
      begin
        if IsReadOnly <> not SReadWrite then
           IsReadOnly:= not SReadWrite;

        if not IsReadOnly and Assigned( IQSearch ) and Assigned( IQSearch.DBNav ) then
        begin
          if not SDelete then
             IQSearch.DBNav.VisibleButtons:= IQSearch.DBNav.VisibleButtons - [nbDelete]
          else
             IQSearch.DBNav.VisibleButtons:= IQSearch.DBNav.VisibleButtons + [nbDelete]
        end;
      end;
end;

{ TSecurityAdminTTabSheet }

procedure TSecurityAdminTTabSheet.HandleComponentSecurity;
begin
  // inherited;     {Do NOT call inherited - it may set visible to True and then pagecontrol is out of sync with tabs}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TTabSheet do
    begin
       Enabled   := SEnabled;
       TabVisible:= TabVisible and SVisible;
    end;
end;

procedure TSecurityAdminTwwDBComboBox.HandleComponentSecurity;
begin
  // inherited;     {Do NOT call inherited - it may set visible to TRUE and then wwDBComboBox is visible on the grid}
//  with FOwner do    {TSecurityCargo}
//    if Assigned(SecuredComponent) then with SecuredComponent as TwwDBComboBox do
//    begin
//       Enabled:= SEnabled;
//    end;
end;


{ TSecurityAdminTIQUDComboBox }

procedure TSecurityAdminTIQUDComboBox.HandleComponentSecurity;
begin
  // inherited;     {Do NOT call inherited - it may set visible to True and then wwDBComboBox is visible on the grid}

  with FOwner do    {TSecurityCargo}
//    if Assigned(SecuredComponent) then with SecuredComponent as TIQUDComboBox do
//    begin
//       EditEnabled:= SReadWrite;
//       Enabled   := SEnabled;
////       Enabled:= SReadWrite; // 10-28-2010 RE: Security - add security to Vendor Rating User text 1 and 2 - CRM# 467385
//    end;
end;

{ TSecurityAdminTwwDBGrid }

procedure TSecurityAdminTwwDBGrid.HandleComponentSecurity;
begin
  // inherited;
//   with FOwner do  {TSecurityCargo}
//     if Assigned(SecuredComponent) and (SecuredComponent is TwwDBGrid) then
//     begin
//        TwwDBGrid(SecuredComponent).Visible := SVisible;
//        // 09-28-2008 note we assign enabled to readonly property.
//        TwwDBGrid(SecuredComponent).ReadOnly:= not SEnabled;
//     end
end;

procedure TSecurityAdminTIqSearch.HandleComponentSecurity;
begin
  // inherited;
//   with FOwner do  {TSecurityCargo}
//     if Assigned(SecuredComponent) and (SecuredComponent is TIQWebSearch) then
//     begin
//        TwwDBGrid(TIQWebSearch(SecuredComponent).wwDBGrid).Visible := SVisible;
//        // 09-28-2008 note we assign enabled to readonly property.
//        TwwDBGrid(TIQWebSearch(SecuredComponent).wwDBGrid).ReadOnly:= not SEnabled;
//     end
end;


{ TSecurityAdminTIQUDRecView }

procedure TSecurityAdminTIQUDRecView.HandleComponentSecurity;
begin
  inherited;        {Set Enabled}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TIQWebUDRecView do
    begin
      Enabled := SEnabled;
      Visible := SVisible;
//      ReadOnly := not SReadWrite;
    end;
end;

{ TSecurityAdminTPictureGallery }

procedure TSecurityAdminTPictureGallery.HandleComponentSecurity;
begin
  inherited;        {Set Enabled}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TIQWebPictureGallery do
    begin
      Enabled := SEnabled;
      Visible := SVisible;
      ReadOnly := not SReadWrite;
    end;
end;

{ TSecurityAdminTIQwwDBComboDlg }

procedure TSecurityAdminTIQwwDBComboDlg.HandleComponentSecurity;
begin
  with FOwner do    {TSecurityCargo}
//    if Assigned(SecuredComponent) then with SecuredComponent as TIQwwDBComboDlg do
//    begin
//      Visible := SVisible;
//      ReadOnly:= not SReadWrite;
//    end;
end;

{ TSecurityAdminTIQHyperlinkComboDlg }

procedure TSecurityAdminTIQHyperlinkComboDlg.HandleComponentSecurity;
begin
  inherited;        {Set Enabled}
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then with SecuredComponent as TIQWebHyperlinkComboDlg do
    begin
      Enabled := SEnabled;
      Visible := SVisible;
      ReadOnly := not SReadWrite;
    end;
end;

{ TSecurityAdminTFDQuery }

procedure TSecurityAdminTFDQuery.HandleComponentSecurity;
var
  AUpdateable: Boolean;
begin
  with FOwner do    {TSecurityCargo}
    if Assigned(SecuredComponent) then
      with SecuredComponent as TFDQuery do
        begin
          AUpdateable:= Assigned(UpdateObject) or Assigned(OnUpdateRecord);
          if AUpdateable and (CachedUpdates <> SReadWrite) then
             UpdateOptions.ReadOnly:= not SReadWrite;
//             CachedUpdates:= SReadWrite;
        end;
end;

end.

