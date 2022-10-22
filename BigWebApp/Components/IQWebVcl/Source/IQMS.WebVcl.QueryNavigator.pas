(* *****************************************************************************
   ***  Instructions ***

   1.  Add the required components:
       - Add a TFDQuery and TDataSource to either the form or datamodule.
       - Add TIQWebQueryNavigator on the form and connect it to the datasource.
       
   2.  Populate the Origin property of every field in the query, especially
       the ID field.  Include the dataset alias; for example, "arinvt.id" or
       "a.id".

   3.  You may wish to add constants to help identify the SQL sections
       during parsing.  This is purely optional, and should only be done
       if required. The list of constants are noted below in this unit.
       For instance, this SQL example requires the use of these place
       holders because of the nested query:

          SELECT a.id AS id,

                 (SELECT company
                    FROM arcusto
                   WHERE id = a.arcusto_id)
                   AS customer,

                 a.rfq AS rfq,
                 a.project AS project
          /* _FROM_START */
            FROM tool_rfq a
          /* _WHERE_START */
           WHERE iqms.misc.eplant_filter(a.eplant_id) = 1
 

   4.  Modify the main query SQL.  How you modify the SQL will depend on
       whether or not you intend to support sort and scope.  If not,
       modify the SQL for the basic filtering option as follows; otherwise,
       skip to the section for sort and scope.

       4.1.  Option 1:  Modifying the SQL for basic filtering:

             4.1.1.  If do not plan to support sort and scope, add the
                     following section to the "where" clause of the main
                     query:

                      -- do not delete these lines
                      -- _NAV_WHERE_START
                      (id = :ID)
                      -- _NAV_WHERE_END

                     For example:

                      SELECT id
                        FROM arinvt
                       WHERE arcusto_id = :ARCUSTO_ID AND
                             -- do not delete these lines
                             -- _NAV_WHERE_START
                             (id = :ID)
                             -- _NAV_WHERE_END

             4.1.2.  In the BeforeOpen event of the query, you must populate
                     the 'ID' parameter.  Use the MainID property of the
                     Query Navigator. For example:

                     AssignQueryParamValue(DataSet, 'ID', QueryNavigator1.MainID);

       4.2.  Option 2: Modifying the SQL to support Sort and Scope:

             4.2.1.  If you intend to support Sort and Scope, first set the
                     pick list property, AssociatedQueryNavigator, to the
                     Query Navigator.

             4.2.2.  To support Sort, add the following to the main query's SQL:

                     -- HPICK_PROPAGATE_SORT_START
                     -- do not remove these comments
                     -- HPICK_PROPAGATE_SORT_END

             4.2.3.  To support Scope, obtain the batch id from table,
                     gtt_picklist_scope, in the main query's SQL.

                     For example (where SQL alias, "a", refers to the
                     main dataset table):

                    -- _NAV_WHERE_START
                       ((SELECT COUNT( * ) FROM gtt_picklist_scope WHERE batch = :SCOPE_BATCH) = 0 AND a.id = :ID
                         OR
                         EXISTS (SELECT 1 FROM gtt_picklist_scope WHERE batch = :SCOPE_BATCH AND id = a.id ))
                    -- _NAV_WHERE_END

             4.2.4.  In the BeforeOpen event of the main query, populate the
                     required parameters.  For example:

                     AssignQueryParamValue(DataSet, 'ID', TInvt_Shell(Self.Owner).QueryNavigatorArinvt.MainID);
                     AssignQueryParamValue(DataSet, 'SCOPE_BATCH', TInvt_Shell(Self.Owner).QueryNavigatorArinvt.ScopeBatch);

   5.  When locating a query record using picklist, assign the MainID property
       of the Query Navigator.  For example:

         QueryNavigator1.MainID:= PkShipments.GetValue('ID')
       
       Note: If "sort" is propagated, then the sorting column name must
             exist in the main TFDQuery.

   6.  After inserting a new record, use the Query Navigator's
       AssignMainID() procedure to keep the Query Navigator and the
       main query in sync.

*)


unit IQMS.WebVcl.QueryNavigator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ExtCtrls, DB, Grids, DBGrids, Buttons, DBCtrls, Menus,
  SqlExpr, DBClient, ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDBNavigator,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.DBExpress,
  IQMS.WebVcl.Time,
  IQMS.Common.Exceptions;

type
  TViewMode = (vmSingle, vmScope);

  TIQWebQueryNavigator = class(TUniDBNavigator)
  private
    FNavQuery: TDataSet;
    FMainID: Int64;
    FOrderByFieldName: string;
    FScopeBatch: Int64;   // used in conjuction with HPick to track scope
    FInterPopMenu: TPopupMenu;
    // FOriginal_NAV_WHERE_START_Text: string;
    FVersion: string;
    FHidePleaseWait: Boolean;
    FPleaseWaitText: string;
    FLastSQL: string;
    function GetDataSet: TDataSet;
    function GetNavNextID(ACheckOtherWay: Boolean = FALSE ): Int64;
    function GetNavPriorID(ACheckOtherWay: Boolean = FALSE ): Int64;
    function FieldExists(AFieldName: string): Boolean;
    function OpenNavQuery( ADirection: Real; AFindLast: Boolean = FALSE): Boolean;
    procedure SetMainID(const Value: Real);
    procedure DeleteSQLTextBetweenKeyWords(ASQL: TStrings; AKeyword1, AKeyword2: string; var I: Integer);
    // procedure InsertSQLTextBetweenKeyWords(ASQL: TStrings; AText, AKeyword1, AKeyword2: string);
    procedure LocalBeforeOpen(ADataSet: TDataSet);                            
    procedure SetOrderByFieldName(const Value: string);
    procedure DisplayNavigatorGeneralInfo(Sender: TObject);
    procedure DisplayNavigatorScopeInfo(Sender: TObject);
    procedure DisplayNavigatorQuery(Sender: TObject);
    procedure AssignNavQueryParams(const ASource: TIQWebDbxQuery); overload;
    procedure AssignNavQueryParams(const ASource: TSQLQuery); overload;
    procedure AssignNavQueryParams(const ASource: TFDQuery); overload;
    function GetScopeBatch: Real;
    procedure InsertFakeSQLQueryParameters(ASQL: TStrings; var I: Integer);
    function GetScopeRecordsCount: Int64;
    procedure AssignInternalPopupMenu;
    function GetViewMode: TViewMode;
    procedure DeleteRecordInternal;
    function FieldByOrigin(AOrigin: string): TField;
    function GetOrderByFieldName: string;
    procedure DataSetFirst;
    procedure DataSetLast;
    procedure DataSetNext;
    procedure DataSetPrior;
    procedure CheckUsingScopeAssignMainIDFromDataSet;
    procedure CheckCreateNavQuery;
    procedure PrepareNavQuery(var ASQL: TStringList);
    procedure AssignNavQuerySQL(const ASQL: TStringList);
    procedure ClearScopeBatch;
    function GetMainID: Real;
    procedure SetScopeBatch(const Value: Real);
  protected
    FTimeIt: TIQWebTimeIt; // IQMS.WebVcl.Time.pas
    procedure ResetNavigatorButtons;
    procedure ReopenMainQuery;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BtnClick(Index: TNavigateBtn); //override;
    function CanEditDataSet: Boolean;
    function AssignMainID( AValue: Real ): Boolean;
    function GotoNext(ACheckOtherWay: Boolean = FALSE): Boolean;
    function GotoPrior(ACheckOtherWay: Boolean = FALSE): Boolean;
    function GotoFirst: Boolean;
    function GotoLast: Boolean;
    function RefreshDataSet: Boolean;
    procedure EnsureExistsInScope( AID: Int64 );
    procedure DeleteFromScope( AID: Int64 );

    property OrderByFieldName: string read GetOrderByFieldName write SetOrderByFieldName;
    property ViewMode: TViewMode read GetViewMode;
    property MainID: Real read GetMainID write SetMainID;
    property DataSet: TDataSet read GetDataSet;
    property ScopeBatch: Real read GetScopeBatch write SetScopeBatch;   // used in conjuction with HPick to track scope
  published
    property HidePleaseWait: Boolean read FHidePleaseWait write FHidePleaseWait stored True;
    property PleaseWaitText: String read FPleaseWaitText write FPleaseWaitText stored True;
end;

const
  // Standard constants
  C_NAV_WHERE_START = '_NAV_WHERE_START';
  C_NAV_WHERE_END = '_NAV_WHERE_END';

  // Optional constants to assist parsing
  C_FROM_START = '_FROM_START';
  C_WHERE_START = '_WHERE_START';
  C_ORDER_BY_START = '_ORDER_BY_START';



implementation

uses
  IQMS.DBTrans.dbtdbexp,
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.InfoBox,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Sequence,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.QueryInfo,
  IQMS.WebVcl.QueryNavigatorScopeInfo,
  StrUtils,
  TypInfo,
  IQMS.WebVcl.ResourceStrings;


{ TIQWebQueryNavigator }

constructor TIQWebQueryNavigator.Create(AOwner: TComponent);
begin
  inherited;
  VisibleButtons:= VisibleButtons - [nbEdit];
  Width:= 234;
  FLastSQL := '';
  FOrderByFieldName:= '';
  FVersion:= '7.8.1.2';
  FHidePleaseWait := False;
  FMainID := 0;
  {PopupMenu}
  AssignInternalPopupMenu;
  FTimeIt := TIQWebTimeIt.Create;
end;

destructor TIQWebQueryNavigator.Destroy;
begin
  ClearScopeBatch;
  if Assigned(FNavQuery) then
    FNavQuery.Free;
  if Assigned(FTimeIt) then
    FreeAndNil(FTimeIt);
  inherited Destroy;
end;

procedure TIQWebQueryNavigator.AssignInternalPopupMenu;
var
  NewItem: TMenuItem;
begin
  FInterPopMenu:= TPopupMenu.Create( Self );

  NewItem:= TMenuItem.Create( FInterPopMenu );
//  IQMS.WebVcl.ResourceStrings.cTXT0000481 = 'Summary';
  NewItem.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000481;
  NewItem.OnClick:= DisplayNavigatorGeneralInfo;
  FInterPopMenu.Items.Add( NewItem );

  NewItem:= TMenuItem.Create( FInterPopMenu );
//   IQMS.WebVcl.ResourceStrings.cTXT0000482 = 'Scope';
  NewItem.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000482;
  NewItem.OnClick:= DisplayNavigatorScopeInfo;
  FInterPopMenu.Items.Add( NewItem );

  NewItem:= TMenuItem.Create( FInterPopMenu );
//   IQMS.WebVcl.ResourceStrings.cTXT0000483 = 'Last SQL';
  NewItem.Caption:= IQMS.WebVcl.ResourceStrings.cTXT0000483;
  NewItem.OnClick:= DisplayNavigatorQuery;
  FInterPopMenu.Items.Add( NewItem );
end;


function TIQWebQueryNavigator.FieldExists( AFieldName: string ): Boolean;
begin
  Result:= (DataSet <> nil) and (DataSet.FindField(AFieldName) <> nil)
end;

 
function TIQWebQueryNavigator.GetDataSet: TDataSet;
begin
  if (DataSource <> nil) then
      Result:= DataSource.DataSet
  else
      Result:= nil
end;


function TIQWebQueryNavigator.GetMainID: Real;
begin
  Result := FMainID;
end;

procedure TIQWebQueryNavigator.SetMainID(const Value: Real);
var
  ACursor: Integer;
  ANewValue: Int64;
begin
  ANewValue := Trunc(Value);

  ACursor := Screen.Cursors[crSQLWait];
  Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
  try
    if (DataSet <> nil) and DataSet.Active then
       DataSet.CheckBrowseMode;

    if (ANewValue <> Value) and (ANewValue > 0) and (Value > 0) and
      Assigned( DataSet ) and Assigned(DataSet.BeforeScroll) then
      DataSet.BeforeScroll( DataSet );

    FMainID := ANewValue;

    if (ViewMode = vmScope) then
       EnsureExistsInScope(FMainID);

    if (DataSet <> nil) then
       ReopenMainQuery;

    if Assigned( DataSet ) and (ViewMode = vmScope) then
       DataSet.Locate('ID', FMainID, []);
  finally
    Screen.Cursor := crArrow;
    Screen.Cursors[crSQLWait] := ACursor;
  end;
end;


procedure TIQWebQueryNavigator.BtnClick(Index: TNavigateBtn);
begin
  if (DataSource = nil) or (DataSource.State = dsInactive) then
     EXIT;

//  if not (csDesigning in ComponentState) and Assigned(BeforeAction) then
//     BeforeAction(Self, Index);

  if not (csDesigning in ComponentState) and FieldExists('ID') then
     case Index of
       nbPrior  : if ViewMode = vmScope then DataSetPrior else GotoPrior;
       nbNext   : if ViewMode = vmScope then DataSetNext  else GotoNext;
       nbFirst  : if ViewMode = vmScope then DataSetFirst else GotoFirst;
       nbLast   : if ViewMode = vmScope then DataSetLast  else GotoLast;

       nbRefresh: RefreshDataSet;

       nbInsert : DataSet.Insert;
       nbEdit   : DataSet.Edit;
       nbCancel : DataSet.Cancel;
       nbPost   : DataSet.Post;
       // IQMS.WebVcl.ResourceStrings.cTXT0000485 = 'Delete record?';
       nbDelete : if not ConfirmDelete or
         (MessageDlg(IQMS.WebVcl.ResourceStrings.cTXT0000485, mtConfirmation,
         mbOKCancel, 0) <> idCancel) then
         DeleteRecordInternal;
     end;

//  if not (csDesigning in ComponentState) and Assigned(OnClick) then
//     OnClick(Self, Index);
end;


procedure TIQWebQueryNavigator.DataSetPrior;
begin
  DataSet.Prior;
  CheckUsingScopeAssignMainIDFromDataSet;
end;

procedure TIQWebQueryNavigator.DataSetNext;
begin
  DataSet.Next;
  CheckUsingScopeAssignMainIDFromDataSet;
end;

procedure TIQWebQueryNavigator.DataSetFirst;
begin
  DataSet.First;
  CheckUsingScopeAssignMainIDFromDataSet;
end;

procedure TIQWebQueryNavigator.DataSetLast; 
begin
  DataSet.Last;
  CheckUsingScopeAssignMainIDFromDataSet;
end;

procedure TIQWebQueryNavigator.CheckUsingScopeAssignMainIDFromDataSet;
begin
  if (ViewMode = vmScope) and Assigned( DataSet.FindField('id')) then
  begin
    FMainID:= DataSet.FieldByName('id').AsLargeInt;
    EnsureExistsInScope( FMainID );
  end;
end;

function TIQWebQueryNavigator.GotoNext(ACheckOtherWay: Boolean = FALSE): Boolean;
begin
  try
    MainID:= GetNavNextID(ACheckOtherWay);
    Result:= TRUE;
  except on E: Exception do
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000137 = 'Error';
      if not IgnoreCOMRaisedEAbort(E) then
         MessageBox(0, PWideChar(E.Message),
           PWideChar(IQMS.WebVcl.ResourceStrings.cTXT0000137),
           MB_OK or MB_ICONSTOP or MB_TASKMODAL);
      Result:= FALSE
    end;
  end;
end;

function TIQWebQueryNavigator.GotoPrior(ACheckOtherWay: Boolean = FALSE): Boolean;
begin
  try
    MainID:= GetNavPriorID(ACheckOtherWay);
    Result:= TRUE;
  except on E: Exception do
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000137 = 'Error';
      if not IgnoreCOMRaisedEAbort(E) then
         MessageBox(0, PWideChar(E.Message),
           PWideChar(IQMS.WebVcl.ResourceStrings.cTXT0000137),
           MB_OK or MB_ICONSTOP or MB_TASKMODAL);
      Result:= FALSE;
    end;
  end;
end;

function TIQWebQueryNavigator.GotoFirst: Boolean;
begin
  Result:= False;

  try
    if OpenNavQuery( -1 {up}, TRUE ) then
       MainID:= FNavQuery.FieldByName('id').AsLargeInt;
    Result:= True;
  except on E: Exception do
    begin
      IQWarning(E.Message);
    end;
  end;
end;

function TIQWebQueryNavigator.GotoLast: Boolean;
begin
  Result := False;

  try
    if OpenNavQuery( 1 {down}, TRUE ) then
       MainID:= FNavQuery.FieldByName('id').AsLargeInt;
    Result := True;
  except on E: Exception do
    begin
      IQWarning(E.Message);
    end;
  end;
end;

function TIQWebQueryNavigator.RefreshDataSet: Boolean;
begin
  Result := False;

  try
    if CanEditDataSet then
       DataSet.CheckBrowseMode;

    if OpenNavQuery( 0 {verify/refresh} ) then
       MainID := FNavQuery.FieldByName('id').AsLargeInt
    else
       MainID := 0;

    Result := True;
  except on E: Exception do
    begin
      IQWarning(E.Message);
      Result := FALSE;
    end;
  end;
end;

function TIQWebQueryNavigator.GetNavNextID( ACheckOtherWay: Boolean = FALSE ): Int64;
begin     
  {try moving down}
  if OpenNavQuery( 1 {down}) and
    (FNavQuery.FieldByName('id').AsLargeInt <> FMainID) then
    Result:= FNavQuery.FieldByName('id').AsLargeInt
  
  {are we allowed moving back like in case of deleting current record while at the eof}
  else if ACheckOtherWay then
     Result:= GetNavPriorID
     
  else if OpenNavQuery( 0 {verify current exists} ) then
     Result:= FMainID   {keep current}
     
  else   
     Result:= 0;
end;

function TIQWebQueryNavigator.GetNavPriorID(ACheckOtherWay: Boolean): Int64;
begin
  {try moving up}
  if OpenNavQuery( -1 {up}) then
    Result:= FNavQuery.FieldByName('id').AsLargeInt

  {are we allowed moving forward}
  else if ACheckOtherWay then                        
     Result:= GetNavNextID
     
  else if OpenNavQuery( 0 {verify current exists} ) then
     Result := FMainID   {keep current}
     
  else   
     Result:= 0;
end;

procedure TIQWebQueryNavigator.DeleteRecordInternal;
var
  ANextID: Int64;
begin
  ANextID:= GetNavNextID( TRUE );
  DeleteFromScope( DataSet.FieldByName('id').AsLargeInt );
  DataSet.Delete;
  MainID:= ANextID;
end;

procedure TIQWebQueryNavigator.PrepareNavQuery(var ASQL: TStringList);
begin
  // Construct and open navigational query
  CheckCreateNavQuery;

  // make sure SQL is up to date
  FNavQuery.Close;

  if Self.DataSet is TIQWebDbxQuery then
    begin
      TIQWebDbxQuery(FNavQuery).SQL.Assign(TIQWebDbxQuery(DataSet).SQL);
      ASQL.Text := TIQWebDbxQuery(FNavQuery).SQL.Text;
    end
  else if Self.DataSet is TSQLQuery then
    begin
      TSQLQuery(FNavQuery).SQL.Assign(TSQLQuery(DataSet).SQL);
      ASQL.Text := TSQLQuery(FNavQuery).SQL.Text;
    end
  else if Self.DataSet is TFDQuery then
    begin
      TFDQuery(FNavQuery).SQL.Assign(TFDQuery(DataSet).SQL);
      ASQL.Text := TFDQuery(FNavQuery).SQL.Text;
    end
  else
    raise EIQMSInvalidDatasetType.Create(INVALID_DATASET_TYPE);
end;

procedure TIQWebQueryNavigator.CheckCreateNavQuery;
begin
  if Assigned(FNavQuery) then
    Exit;

  if (DataSet is TSQLQuery) then
    begin
      FNavQuery := TSQLQuery.Create(Self);
      TSQLQuery(FNavQuery).SQLConnection := TSQLQuery(DataSet).SQLConnection;
    end
  else if (DataSet is TIQWebDbxQuery) then
    begin
      FNavQuery := TIQWebDbxQuery.Create(Self);
      TIQWebDbxQuery(FNavQuery).SQLConnection := TIQWebDbxQuery(DataSet).SQLConnection;
    end
  else if (DataSet is TFDQuery) then
    begin
      FNavQuery := TFDQuery.Create(Self);
      TFDQuery(FNavQuery).Connection := TFDQuery(DataSet).Connection;
    end
  else
    raise EIQMSInvalidDatasetType.Create(
      'Application Error:  The query class type is not supported by the ' +
      'Query Navigator.');

  FNavQuery.BeforeOpen:= LocalBeforeOpen;

end;

procedure TIQWebQueryNavigator.AssignNavQuerySQL(const ASQL: TStringList);
begin
  // Assign private variable
  FLastSQL := ASQL.Text;

  if Self.DataSet is TIQWebDbxQuery then
    begin
      TIQWebDbxQuery(FNavQuery).SQL.Text := ASQL.Text;
      AssignNavQueryParams(TIQWebDbxQuery(DataSet))
    end
  else if Self.DataSet is TSQLQuery then
    begin
      TSQLQuery(FNavQuery).SQL.Text := ASQL.Text;
      AssignNavQueryParams(TSQLQuery(DataSet));
    end
  else if Self.DataSet is TFDQuery then
    begin
     TFDQuery(FNavQuery).SQL.Text := ASQL.Text;
     AssignNavQueryParams(TFDQuery(DataSet));
    end
  else
    EIQMSInvalidDatasetType.Create(INVALID_DATASET_TYPE);
end;

function TIQWebQueryNavigator.OpenNavQuery( ADirection: Real;
  AFindLast: Boolean): Boolean;
label
  OPEN_QUERY_LABEL, DONE_LABEL;
var
  I, J: Integer;
  AField: TField;
  ASign: string;
  ACurrentID: Int64;
  ANewSelectStr: string;

  AWantsBottom: Boolean;
  AWantsPrior: Boolean;
  AWantsRefresh: Boolean;
  AWantsTop: Boolean;
  ACursor: Integer;
  ASQL: TStringList;
begin

  // initialize
  Result:= FALSE;

  ASQL := TStringList.Create;
  try
    ACursor := Screen.Cursors[crSQLWait];
    Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
    try
      // 08/05/2010 Added these lines (Byron).  If last record is selected,
      // and user clicks Next button, the dataset could be inactive the
      // second time this method executes.  If the dataset is inactive, then
      // the ID value will be zero (0).  So, instead, get the current
      // MainID value.
      if Assigned(Self.DataSet) and
         Self.DataSet.Active then
         ACurrentID := Self.DataSet.FieldByName('ID').AsLargeInt
      else
         ACurrentID := FMainID;

      AWantsBottom   := (ADirection = 1 ) and AFindLast;
      AWantsTop      := (ADirection = -1 ) and AFindLast;
      AWantsPrior    := (ADirection = -1) and not AFindLast;
      AWantsRefresh  := ADirection = 0;
      case Trunc(ADirection) of
         1: ASign:= ' >= ';
        -1: ASign:= ' <= ';
         0: ASign:= ' = ';
      end;

      // validate
      try
        AField:= FieldByOrigin(OrderByFieldName);
      except on E: Exception do
        raise Exception.CreateFmt(
          'Application Error:  Unable to establish dataset sort. ' +
          'Field, %s, must be defined.'#13#13 + E.Message ,
          [FOrderByFieldName]);
      end;

      // Construct and open navigational query
      PrepareNavQuery({var} ASQL);

      I := PosOfWord('SELECT', ASQL.Text);
      J := PosOfWord('SELECT DISTINCT', ASQL.Text);
      if (J > 0) and (J = I) then
         Inc(I, Length('SELECT DISTINCT '))
      else
         Inc(I, Length('SELECT '));

      // SELECT: throw out the entire list of fields and replace with
      // just ID and the order by field if other than ID
      J := PosOfWord(C_FROM_START, ASQL.Text);
      // find the text length between SELECT and FROM
      if (J > 0) then
         J:= PosEx('FROM', UpperCase(ASQL.Text), J + length(C_FROM_START)) - I
      else
         J:= Pos( ' FROM ', UpperCase(ASQL.Text)) - I;

      // 01-10-2012 - is this a bandaid?
      if J <= 0 then
         J := PosOfWord('FROM', ASQL.Text) - I;

      if CompareText( AField.FieldName, 'ID' ) <> 0 then
         ANewSelectStr:= ANewSelectStr + Format(' %s AS id, %s AS %s '#13,
          [LowerCase(Self.DataSet.FieldByName('ID').Origin),
           LowerCase(AField.Origin), LowerCase(AField.FieldName) ])
      else
        ANewSelectStr:= Format(' %s AS id '#13,
        [LowerCase(Self.DataSet.FieldByName('ID').Origin)]);

      ASQL.Text := StuffString(ASQL.Text, I, J,  ANewSelectStr);

      // ORDER BY and asc vs desc
      I := Pos(C_ORDER_BY_START, UpperCase(ASQL.Text));
      if (I > 0) then
         I := PosEx('ORDER BY ', UpperCase(ASQL.Text), I);
      if I = 0 then
         I:= Pos( 'ORDER BY ', UpperCase(ASQL.Text));
      if I > 0 then
        ASQL.Text := Copy(ASQL.Text, 1, I-1);
      case AField.DataType of
        // 04-15-2010 avoid NVL to preserve use of index.
        // Snapware - speed issues in packslip (during skip to the next
        // record). We may need to remove that for all not just ID
        ftFloat, ftFMTBcd, ftBCD:
                    if AField.FieldName = 'ID' then
                       ASQL.Add( Format('ORDER BY %s', [ AField.Origin ]))
                    else
                       ASQL.Add( Format('ORDER BY NVL(%s, -999999999999999)',
                       [AField.Origin]));
        ftDateTime: ASQL.Add( 'ORDER BY ' + AField.Origin );
      else
        ASQL.Add( Format('ORDER BY NVL(RTRIM(%s),'' '')', [ AField.Origin ]));
      end;

      // special case when we need to add DESC in order to locate quickly the bottom or prior record}
      if AWantsBottom or AWantsPrior then
         ASQL.Add( 'DESC' );

      // if not ordered by ID add it so we can properly goto the next record while FOrderByFieldName is the same. For instance: custno=ABC id=1 custno=ABC id=5 etc
      if CompareText( FieldByOrigin( OrderByFieldName ).FieldName, 'ID' ) <> 0 then
      begin
        ASQL.Add( ', ' + Self.DataSet.FieldByName('ID').Origin );
        if AWantsBottom or AWantsPrior then
           ASQL.Add( 'DESC' );
      end;

      // WHERE
      DeleteSQLTextBetweenKeyWords(ASQL, C_NAV_WHERE_START, C_NAV_WHERE_END, I );
      Inc(I);

      // Since the main query always references :ID and we are going to call the
      // same BeforeOpen procedure - lets fake :ID and :scope_batch is necessary
      InsertFakeSQLQueryParameters(ASQL, I);

      // if just refreshing and wants to verify the ID exists
      if AWantsRefresh then
      begin
         ASQL.Insert( I, Format(' AND %s = %d ',
           [Self.DataSet.FieldByName('ID').Origin, ACurrentID]));
         goto OPEN_QUERY_LABEL;
      end;

      // now add the actual condition that will force the records to be
      // greater or less than the current value of the order by column
      case AField.DataType of
        ftFloat, ftFMTBcd, ftBCD:
          ASQL.Insert(I, IQFormat(' AND NVL(%s, -999999999999999) %s %d ',
            [AField.Origin, ASign, AField.AsLargeInt]));
        ftDateTime:
          ASQL.Insert(I, Format(
            ' AND %s %s TO_DATE(''%s'', ''mm/dd/yyyy hh24:mi:ss'') ',
            [AField.Origin, ASign,
            FormatDateTime('mm/dd/yyyy hh:nn:ss', AField.AsDateTime)]));
      else
        // ftString
        ASQL.Insert(I,
          Format(' AND NVL(RTRIM(%s),'' '') %s NVL(''%s'', '' '') ',
          [AField.Origin, ASign, FixStr(Trim(AField.AsString))]));
      end;
      Inc(I);

      // scope
      if (FScopeBatch > 0) and (ViewMode = vmScope) then
      begin
        ASQL.Insert(I, IQFormat(
        ' AND %s IN (SELECT id FROM GTT_picklist_scope WHERE batch = %d)',
        [Self.DataSet.FieldByName('id').Origin, FScopeBatch ]));
        Inc(I);
      end;

      // open query
      OPEN_QUERY_LABEL:

      // Apply the modified SQL to the navigator query
      AssignNavQuerySQL(ASQL);

      // Open the navigator query
      FTimeIt.Start;
      try
        ReOpen(FNavQuery);
      finally
        FTimeIt.Stop;
      end;

      if AWantsBottom or AWantsRefresh or AWantsTop then
         goto DONE_LABEL;

      while (CompareText(FNavQuery.FieldByName(AField.FieldName).AsString,
        AField.AsString) = 0) and not FNavQuery.Eof do
      begin
        if FNavQuery.FieldByName('ID').AsLargeInt = ACurrentID then
           BREAK;
        FNavQuery.Next
      end;
      if FNavQuery.FieldByName('ID').AsLargeInt = ACurrentID then
         {one more to go to the next one}
         FNavQuery.Next
      else
         FNavQuery.First;

      // finally!
      DONE_LABEL:
      {---------------}
      Result:= not (FNavQuery.Eof and FNavQuery.Bof);
    finally
      Screen.Cursor := crArrow;
      Screen.Cursors[crSQLWait] := ACursor;
    end;
  finally
    if Assigned(ASQL) then
      FreeAndNil(ASQL);
  end;
end;

procedure TIQWebQueryNavigator.AssignNavQueryParams(const ASource: TIQWebDbxQuery);
var
   i: Integer;
   param: TParam;
begin
  if not Assigned(ASource) then Exit;
  for i := 0 to ASource.Params.Count - 1 do
   begin
     param := TIQWebDbxQuery(FNavQuery).Params.FindParam(ASource.Params[i].Name);
     if Assigned(param) then
        begin
          if (param.DataType = ftUnknown) then
             begin
               if (ASource.Params[i].DataType in [ftBCD, ftFMTBcd]) then
                  param.DataType := ftFloat
               else if (ASource.Params[i].DataType in [ftTimeStamp]) then
                  param.DataType :=  ftDateTime
               else
                  param.DataType := ASource.Params[i].DataType;
             end;
          param.ParamType :=  ASource.Params[i].ParamType;
          param.Value := ASource.Params[i].Value;
        end;
   end;
end;

procedure TIQWebQueryNavigator.AssignNavQueryParams(const ASource: TSQLQuery);
var
   i: Integer;
   param: TParam;
begin
  if not Assigned(ASource) then Exit;
  for i := 0 to ASource.Params.Count - 1 do
   begin
     param := TSQLQuery(FNavQuery).Params.FindParam(ASource.Params[i].Name);
     if Assigned(param) then
        begin
          if (param.DataType = ftUnknown) then
             begin
               if (ASource.Params[i].DataType in [ftBCD, ftFMTBcd]) then
                  param.DataType := ftFloat
               else if (ASource.Params[i].DataType in [ftTimeStamp]) then
                  param.DataType :=  ftDateTime
               else
                  param.DataType := ASource.Params[i].DataType;
             end;
          param.ParamType :=  ASource.Params[i].ParamType;
          param.Value := ASource.Params[i].Value;
        end;
   end;
end;

procedure TIQWebQueryNavigator.AssignNavQueryParams(const ASource: TFDQuery);
var
   i: Integer;
   param: TFDParam;
begin
  if not Assigned(ASource) then Exit;
  for i := 0 to ASource.Params.Count - 1 do
   begin
     param := TFDQuery(FNavQuery).Params.FindParam(ASource.Params[i].Name);
     if Assigned(param) then
        begin
          if (param.DataType = ftUnknown) then
             begin
               if (ASource.Params[i].DataType in [ftBCD, ftFMTBcd]) then
                  param.DataType := ftFloat
               else if (ASource.Params[i].DataType in [ftTimeStamp]) then
                  param.DataType :=  ftDateTime
               else
                  param.DataType := ASource.Params[i].DataType;
             end;
          param.ParamType :=  ASource.Params[i].ParamType;
          param.Value := ASource.Params[i].Value;
        end;
   end;
end;

procedure TIQWebQueryNavigator.DeleteSQLTextBetweenKeyWords(ASQL: TStrings;
  AKeyword1, AKeyword2: string; var I: Integer );
var
  J, K: Integer;
begin
  {Delete between Keyword1 and Keyword2}
  I:= LinePosInList( AKeyword1, ASQL );
  J:= LinePosInList( AKeyword2, ASQL );
  IQAssert( (I > 0) and (J > 0),
    Format('Application Error:  Unable to find keyword %s or %s. '#13 +
    '[DataSet %s]', [AKeyword1, AKeyword2, DataSet.Name]));

  for K:= 1 to J-(I+1) do
    ASQL.Delete(I + 1);
end;


{procedure TIQWebQueryNavigator.InsertSQLTextBetweenKeyWords(ASQL: TStrings; AText, AKeyword1, AKeyword2: string);
var
  I: Integer;
begin
  if FNavQuery = nil then
     EXIT;

  DeleteSQLTextBetweenKeyWords(ASQL, AKeyword1, AKeyword2, I );

  ASQL.Insert( I, AText );
end;}

procedure TIQWebQueryNavigator.ResetNavigatorButtons;
begin
  if (DataSet <> nil) and DataSet.Active and
    not (DataSet.Eof and DataSet.Bof) then
    begin
      Buttons[nbFirst].Enabled   := Enabled;
      Buttons[nbPrior].Enabled   := Enabled;
      Buttons[nbNext].Enabled    := Enabled;
      Buttons[nbLast].Enabled    := Enabled;
      Buttons[nbRefresh].Enabled := Enabled;
    end;
end;

procedure TIQWebQueryNavigator.ReopenMainQuery;
var
  hMsg: TPanelMesg;
  AText: String;
begin
  hMsg := NIL;

  if Trim(FPleaseWaitText) > '' then
    AText := FPleaseWaitText
  else
    // IQMS.WebVcl.ResourceStrings.cTXT0000486 = 'Accessing data.  Please wait...';
    AText := IQMS.WebVcl.ResourceStrings.cTXT0000486;
  try
    if not FHidePleaseWait then
      hMsg:= hPleaseWait(AText);
    try
      ReOpen(DataSet);
      ResetNavigatorButtons;
    finally
      if not FHidePleaseWait and Assigned(hMsg) then
        FreeAndNil(hMsg);
    end;
  except on E: Exception do
    raise Exception.CreateFmt('%s'#13'DataSet:  %s'#13'Owner:  %s'#13 +
      'Class:  %s', [E.Message, DataSet.Name, DataSet.Owner.Name,
      DataSet.ClassName]);
  end;
end;

function TIQWebQueryNavigator.CanEditDataSet: Boolean;
begin
  Result:= (DataSet <> nil)
           and 
           (DataSet.State <> dsInactive)
           and
           (
            ((DataSet is TIQWebDbxQuery) and Assigned(TIQWebDbxQuery(DataSet).BeforeUpdateRecord))
           );
end;

function TIQWebQueryNavigator.AssignMainID(AValue: Real): Boolean;
begin
  Result:= FALSE;
  
  if (DataSet = nil) or (DataSet.State = dsInactive) then
     EXIT;

  if CanEditDataSet then
     DataSet.CheckBrowseMode;
     
  MainID := Trunc(AValue);
  
  Result:= not (DataSet.Eof and DataSet.Bof);
end;

procedure TIQWebQueryNavigator.LocalBeforeOpen(ADataSet: TDataSet);
begin
  if Assigned(Self.DataSet.BeforeOpen) then
     Self.DataSet.BeforeOpen(ADataSet);
end;

procedure TIQWebQueryNavigator.SetOrderByFieldName(const Value: string);
begin
  FOrderByFieldName:= Value;
end;

procedure TIQWebQueryNavigator.SetScopeBatch(const Value: Real);
begin
  FScopeBatch := Trunc(Value);
end;

procedure TIQWebQueryNavigator.DisplayNavigatorGeneralInfo(Sender: TObject);
var
  AList: TStringList; 
  ACount: Int64;
begin
  AList:= TStringList.Create;
  try
    AList.Add(Format('%s=%s', [ 'Name', Self.Name]));
    AList.Add(Format('%s=%s', [ 'Version', Self.FVersion]));
    AList.Add(Format('%s=%s [%s]', [ 'Order By',
      FieldByOrigin( OrderByFieldName ).DisplayLabel, OrderByFieldName]));
    AList.Add(Format('%s=%s', [FieldByOrigin(OrderByFieldName).DisplayLabel,
      FixStr(FieldByOrigin( OrderByFieldName ).AsString)]));
    if CompareText( FieldByOrigin( OrderByFieldName ).FieldName, 'ID') <> 0 then
       AList.Add(Format('%s=%s', [ 'ID', Self.DataSet.FieldByName('id').AsString ]));

    if (FScopeBatch > 0) then
       ACount:= GetScopeRecordsCount
    else   
       ACount:= 0;
    if ACount = 0 then   
       AList.Add(Format('%s=%s', [ 'Scope', 'Not Assigned' ]))
    else
       AList.Add(Format('%s=%d records', [ 'Scope', ACount ]));

    // See TypInfo.pas
    AList.Add(Format('%s=%s', [ 'View Mode',
      Copy(GetEnumName(TypeInfo(TViewMode), Ord(ViewMode)), 3, 255) ]));

    // Show the data
    DoShowInfoBox_Ex( AList );
  finally
    AList.Free;
  end;
end;

procedure TIQWebQueryNavigator.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
     begin
       Self.PopupMenu:= FInterPopMenu;
       // 09/12/2014
//       IQMS.Common.Controls.AutoSizeNavBar(Self);
     end;
end;

function TIQWebQueryNavigator.GetScopeBatch: Real;
begin
  if FScopeBatch = 0 then
     FScopeBatch := Trunc(IQMS.Common.Sequence.GetNextSequenceNumber( 'S_GTT_PICKLIST_SCOPE' ));
     
  Result:= FScopeBatch;
end;


procedure TIQWebQueryNavigator.InsertFakeSQLQueryParameters(ASQL: TStrings; var I: Integer);
var
  AOriginalLine: Integer;

  procedure AddToSQLText(AText: string );
  begin
    if AOriginalLine = I then
       ASQL.Insert( I, AText )
    else
       ASQL.Insert( I, ' AND ' + AText );
     Inc( I );
  end;

begin
  AOriginalLine := I;

  if (DataSet is TSQLQuery) then
    with TSQLQuery(DataSet) do
      begin
        if (Params.FindParam('ID') <> nil) then
           AddToSQLText(' :ID > -1 ');
        if Params.FindParam('scope_batch') <> nil then
           AddToSQLText(' :scope_batch > -1 ');

        if AOriginalLine = I then
           Exit;

        ASQL[ AOriginalLine ]:= '( ' + ASQL[ AOriginalLine ];
        ASQL[ I - 1 ]:= ASQL[ I - 1 ] + ' ) ';

      end
  else if (DataSet is TIQWebDbxQuery) then
    with TIQWebDbxQuery(DataSet) do
      begin
        if (Params.FindParam('ID') <> nil) then
           AddToSQLText(' :ID > -1 ');
        if Params.FindParam('scope_batch') <> nil then
           AddToSQLText(' :scope_batch > -1 ');

        if AOriginalLine = I then
           Exit;

        ASQL[ AOriginalLine ]:= '( ' + ASQL[ AOriginalLine ];
        ASQL[ I - 1 ]:= ASQL[ I - 1 ] + ' ) ';

      end
  else if (DataSet is TFDQuery) then
    with TFDQuery(DataSet) do
      begin
        if (Params.FindParam('ID') <> nil) then
           AddToSQLText(' :ID > -1 ');
        if Params.FindParam('scope_batch') <> nil then
           AddToSQLText(' :scope_batch > -1 ');

        if AOriginalLine = I then
           Exit;

        ASQL[ AOriginalLine ]:= '( ' + ASQL[ AOriginalLine ];
        ASQL[ I - 1 ]:= ASQL[ I - 1 ] + ' ) ';

      end
  else
    EIQMSInvalidDatasetType.Create(INVALID_DATASET_TYPE);
end;

procedure TIQWebQueryNavigator.ClearScopeBatch;
begin
  if FScopeBatch > 0 then
    begin
      if Assigned(DataSet) and (DataSet is TSQLQuery) then
        DBX_RunSQLFmt(
          TSQLQuery(DataSet).SQLConnection,
          'DELETE FROM gtt_picklist_scope WHERE batch = %d',
          [FScopeBatch])

      else if Assigned(DataSet) and (DataSet is TIQWebDbxQuery) then
        DBX_RunSQLFmt(
          TIQWebDbxQuery(DataSet).SQLConnection,
          'DELETE FROM gtt_picklist_scope WHERE batch = %d',
          [FScopeBatch])

      else if Assigned(DataSet) and (DataSet is TFDQuery) then
        ExecuteCommandFmt(
          'DELETE FROM gtt_picklist_scope WHERE batch = %d',
          [FScopeBatch], TFDQuery(DataSet).ConnectionName)

      else
        ExecuteCommandFmt(
          'DELETE FROM gtt_picklist_scope WHERE batch = %d',
          [FScopeBatch]);
    end;
end;

function TIQWebQueryNavigator.GetScopeRecordsCount: Int64;
begin
  Result := 0;
  if Assigned(DataSet) and (DataSet is TSQLQuery) then
    Result := DBX_GetValIntFmt(
      TSQLQuery(DataSet).SQLConnection,
      'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d',
      [FScopeBatch])

  else if Assigned(DataSet) and (DataSet is TIQWebDbxQuery) then
    Result := DBX_GetValIntFmt(
      TIQWebDbxQuery(DataSet).SQLConnection,
      'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d',
      [FScopeBatch])

  else if Assigned(DataSet) and (DataSet is TFDQuery) then
    Result := SelectValueFmtAsInt64(
      'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d',
      [FScopeBatch], TFDQuery(DataSet).ConnectionName)

  else
    Result := SelectValueFmtAsInteger(
      'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d',
      [FScopeBatch]);
end;


procedure TIQWebQueryNavigator.EnsureExistsInScope( AID: Int64 );
begin
  if (ScopeBatch = 0) or (AID = 0) then
     Exit;
  
  if Assigned(DataSet) and (DataSet is TSQLQuery) then
    begin
      if DBX_GetValFmt(
        TSQLQuery(DataSet).SQLConnection,
        'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
        [FScopeBatch, AID]) > 0 then
        Exit;

      DBX_RunSQLFmt(
        TSQLQuery(DataSet).SQLConnection,
        'INSERT INTO gtt_picklist_scope( batch, id ) VALUES (%d, %d)',
        [FScopeBatch, AID]);
    end
  else if Assigned(DataSet) and (DataSet is TIQWebDbxQuery) then
    begin
      if DBX_GetValFmt(
        TIQWebDbxQuery(DataSet).SQLConnection,
        'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
        [FScopeBatch, AID]) > 0 then
        Exit;

      DBX_RunSQLFmt(
        TIQWebDbxQuery(DataSet).SQLConnection,
        'INSERT INTO gtt_picklist_scope( batch, id ) VALUES (%d, %d)',
        [FScopeBatch, AID]);
    end
  else if Assigned(DataSet) and (DataSet is TFDQuery) then
    begin
      if SelectValueFmtAsInt64(
        'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
        [FScopeBatch, AID], TFDQuery(DataSet).ConnectionName) > 0 then
        Exit;

      ExecuteCommandFmt(
        'INSERT INTO gtt_picklist_scope( batch, id ) VALUES (%d, %d)',
        [FScopeBatch, AID], TFDQuery(DataSet).ConnectionName);
    end
  else
    begin
      if SelectValueFmt(
        'SELECT COUNT(*) FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
        [FScopeBatch, AID]) > 0 then
        Exit;

      ExecuteCommandFmt(
        'INSERT INTO gtt_picklist_scope( batch, id ) VALUES (%d, %d)',
        [FScopeBatch, AID]);
    end;
end;

procedure TIQWebQueryNavigator.DeleteFromScope( AID: Int64 );
begin
  if Assigned(DataSet) and (DataSet is TSQLQuery) then
    DBX_RunSQLFmt(
      TSQLQuery(DataSet).SQLConnection,
      'DELETE FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
      [FScopeBatch, AID])

  else if Assigned(DataSet) and (DataSet is TIQWebDbxQuery) then
    DBX_RunSQLFmt(
      TIQWebDbxQuery(DataSet).SQLConnection,
      'DELETE FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
      [FScopeBatch, AID])

  else if Assigned(DataSet) and (DataSet is TFDQuery) then
    ExecuteCommandFmt(
      'DELETE FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
      [FScopeBatch, AID], TFDQuery(DataSet).ConnectionName)

  else
    ExecuteCommandFmt(
      'DELETE FROM gtt_picklist_scope WHERE batch = %d AND id = %d',
      [FScopeBatch, AID]);
end;


procedure TIQWebQueryNavigator.DisplayNavigatorScopeInfo(Sender: TObject);
begin
  // Declared in QueryNavigatorScopeInfo.pas
  TFrmQueryNavigatorScopeInfo.DoShow( Self, FScopeBatch );
end;

procedure TIQWebQueryNavigator.DisplayNavigatorQuery(Sender: TObject);
begin
  // 08/24/2010 (Byron) Show query info, like we do in pick list.
  if not Assigned(FNavQuery) and (FLastSQL = '') then
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000484 = 'SQL information is unavailable.';
      IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000484);
      Exit;
    end;

  // 02/27/2015 (Byron) if the query is not assigned, but there is a
  // "last SQL" value, then just show the text.
  if not Assigned(FNavQuery) and (FLastSQL > '') then
    begin
      DoViewMemoStr( FLastSQL, 'Last SQL');
      Exit;
    end;
//
//   Declared in QryInfo.pas
  with TFrmQueryInfo.Create(Application, FNavQuery, nil) do
  try
    AssignTiming(FTimeIt);
    ShowModal;
  finally
    Free;
  end;
end;

function TIQWebQueryNavigator.GetViewMode: TViewMode;
begin
   if GetScopeRecordsCount > 0 then
      Result:= vmScope
   else
      Result:= vmSingle
end;


function TIQWebQueryNavigator.FieldByOrigin( AOrigin: string ): TField;
var
  i: Integer;
begin
  for i := 0 to DataSet.FieldCount - 1 do
    if CompareText(Trim(AOrigin), Trim(DataSet.Fields[i].Origin)) = 0 then
    begin
       Result:= DataSet.Fields[i];
       Exit;
    end;
  raise Exception.CreateFmt(
    'Application Error:  QueryNavigator is unable to resolve origin of ' +
    '"%s". Operation aborted.', [AOrigin]);
end;

function TIQWebQueryNavigator.GetOrderByFieldName: string;
begin
  if FOrderByFieldName = '' then
  begin
    IQAssert(Self.DataSet.FindField('id') <> nil,
      'Application Error:  Main dataset must contain field, "ID".  ' +
      'Operation aborted.');
    FOrderByFieldName:= Self.DataSet.FieldByName('ID').Origin;
  end;

  Result:= FOrderByFieldName;
end;

end.

