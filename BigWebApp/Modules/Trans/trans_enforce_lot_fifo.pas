unit trans_enforce_lot_fifo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQUniGrid,
  uniGUIFrame;

type
  TFifoExclusion = (feNoShip, feHardAllocated, feVMI, feInTransit, feMTO);
  TFifoExclusions = set of TFifoExclusion;
  
  TFGMultiCargo = class
    FGMulti_ID        : Real;
    Arinvt_Lot_Docs_ID: Real;
    Qty               : Real;
  end;

  // Collection of the above TFGMultiCargo
  TFGMultiList = class(TStringList)
  private
    function GetFGMutliCargo( I: Integer ): TFGMultiCargo;
    function GetFGMutliCargoByID(AFGMulti_ID: Real): TFGMultiCargo;
    procedure ClearStringsOfObjects;
  public
    procedure AddToList( AFGMulti_ID: Real ); overload;
    procedure AddToList( AFGMulti_ID, AQty: Real; AArinvt_Lot_Docs_ID: Real = 0 ); overload;
    procedure SortByArinvtLotDocs;
    procedure Clear; override;
    destructor Destroy; override;
    property Cargo[ I: Integer ]: TFGMultiCargo read GetFGMutliCargo;
    property CargoByID[ AFGMulti_ID: Real ]: TFGMultiCargo read GetFGMutliCargoByID;
    procedure LoadPickTiketReleases( APS_Ticket_Dtl_ID: Real);  // used for pickticket validation
  end;

  // The "Enforcer"
  TEnforceLotFifo = class
  private
    procedure LoadSortExisting;
  public
    Arinvt_ID: Real;
    Exclusions: TFifoExclusions;
    
    SelectedList: TFGMultiList;
    ExistingList: TFGMultiList;
    ViolatedArinvtLotDocs_ID: Real;

    constructor Create( AFGMulti_ID: Real ); overload;
    constructor Create( AFGMultiList: TStringList ); overload;
    destructor Destroy; override;
    function FindViolation: Boolean;
    procedure AssignDefaultExclusions;

    class function EnforcementRequired( ASrcFgMulti_ID: Real; ATrgFgMulti_ID: Real = 0): Boolean; overload;
    class function EnforcementRequired( AList: TStringList {list of fgmulti_id }): Boolean; overload;
  end;


  TFrmTransEnforceLotFIFO = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    DBNavigator1: TUniDBNavigator;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    btnContinue: TUniButton;
    btnCancel: TUniButton;
    SrcFGMulti: TDataSource;
    QryFGMulti: TFDQuery;
    QryFGMultiARINVT_LOT_DOCS_ID: TBCDField;
    QryFGMultiID: TBCDField;
    QryFGMultiLOC_DESC: TStringField;
    QryFGMultiLOTNO: TStringField;
    QryFGMultiONHAND: TBCDField;
    QryFGMultiIN_DATE: TDateTimeField;
    QryFGMultiDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryFGMultiBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnContinueClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    Enforce: TEnforceLotFifo;
    FViolated_Arinvt_Lot_Docs_ID: Real;

  public
    { Public declarations }
    class function DoShowModal(AEnforce: TEnforceLotFifo ): Boolean;
    property FEnforce: TEnforceLotFifo read Enforce write Enforce;
  end;


implementation

{$R *.dfm}

uses
  AnsiStrings,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{-- TFGMultiList --------------------------------------------------------------}
procedure TFGMultiList.AddToList(AFGMulti_ID: Real);
begin
  AddToList( AFGMulti_ID, SelectValueByID('onhand', 'fgmulti', AFGMulti_ID));
end;

procedure TFGMultiList.AddToList( AFGMulti_ID, AQty: Real; AArinvt_Lot_Docs_ID: Real = 0);
var
  AAFGMulti_ID_Str: string;
  ACargo: TFGMultiCargo;
begin
  AAFGMulti_ID_Str:= FloatToStr( AFGMulti_ID );
  if IndexOf( AAFGMulti_ID_Str ) > -1 then with TFGMultiCargo( Objects[ IndexOf( AAFGMulti_ID_Str )]) do
  begin
    Qty:= Qty + AQty;
    EXIT;
  end;

  ACargo:= TFGMultiCargo.Create;
  with ACargo do
  begin
    FGMulti_ID:= AFGMulti_ID;
    Qty       := AQty;
    if AArinvt_Lot_Docs_ID > 0 then
       Arinvt_Lot_Docs_ID:= AArinvt_Lot_Docs_ID
    else
       Arinvt_Lot_Docs_ID:= SelectValueFmtAsFloat('select d.id from fgmulti f, arinvt_lot_docs d where f.id = %f and f.arinvt_id = d.arinvt_id and f.lotno = d.lotno', [ AFGMulti_ID ]);
  end;
  inherited AddObject( AAFGMulti_ID_Str, ACargo );
end;


procedure TFGMultiList.ClearStringsOfObjects;
var
  I: Integer;
begin
  for I:= Count - 1 downto 0 do
    if Assigned(Objects[ I ]) then
      begin
        TObject(Objects[I]).Free;
        Objects[I]:= nil;
      end;
end;

procedure TFGMultiList.Clear;
begin
  ClearStringsOfObjects;
  inherited;
end;

destructor TFGMultiList.Destroy;
begin
  ClearStringsOfObjects;
  inherited;
end;

function TFGMultiList.GetFGMutliCargo( I: Integer ): TFGMultiCargo;
begin
  Result:= TFGMultiCargo(Objects[ I ]);
end;

function TFGMultiList.GetFGMutliCargoByID(AFGMulti_ID: Real): TFGMultiCargo;
var
  I: Integer;
begin
  I:= IndexOf( FloatToStr(AFGMulti_ID));
  if I > -1 then
     Result:= Cargo[ I ]
  else
     Result:= nil;
end;

function _CompareArinvtLotDocs( AList: TStringList; Index1, Index2: Integer): Integer;
var
  AArinvt_Lot_Docs1: Real;
  AArinvt_Lot_Docs2: Real;
begin
  AArinvt_Lot_Docs1:= TFGMultiCargo(AList.Objects[ Index1 ]).Arinvt_Lot_Docs_ID;
  AArinvt_Lot_Docs2:= TFGMultiCargo(AList.Objects[ Index2 ]).Arinvt_Lot_Docs_ID;

  if AArinvt_Lot_Docs1 < AArinvt_Lot_Docs2 then
    Result:= -1
  else if AArinvt_Lot_Docs1 > AArinvt_Lot_Docs2 then
    Result:= 1
  else
    Result:= 0;
end;


procedure TFGMultiList.SortByArinvtLotDocs;
begin
  CustomSort( _CompareArinvtLotDocs );
end;


procedure TFGMultiList.LoadPickTiketReleases( APS_Ticket_Dtl_ID: Real );
var
  Q: TFDQuery;
begin
  Clear;
  Q:= TFDQuery.Create(nil);
  try
    Q.Connection := UniMainModule.FDConnection1;
    Q.SQL.Add(IQFormat('select r.fgmulti_id, r.quan from ps_ticket_rel r where ps_ticket_dtl_id = %f', [ APS_Ticket_Dtl_ID ]));
    Q.Open;
    while not Q.Eof do
    begin
      AddToList( Q.FieldByName('fgmulti_id').asFloat, Q.FieldByName('quan').asFloat );
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;



{-- TEnforceLotFifo -----------------------------------------------------------}
constructor TEnforceLotFifo.Create(AFGMulti_ID: Real);
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.Add( FloatToStr( AFGMulti_ID ));
    self.Create( AList );  // see below
  finally
    AList.Free;
  end;
end;

procedure TEnforceLotFifo.AssignDefaultExclusions;
begin
  Exclusions:= [feNoShip, feHardAllocated, feVMI, feInTransit, feMTO];
end;

constructor TEnforceLotFifo.Create( AFGMultiList: TStringList );
var
  I: Integer;
begin
  // sometimes fgmulti list is just a list of the IDs and sometimes pairs of ID and QTY where the qty could be onhand or selected qty
  SelectedList:= TFGMultiList.Create;
  ExistingList:= TFGMultiList.Create;

  for I:= 0 to AFGMultiList.Count - 1 do
  begin
    if AFGMultiList is TFGMultiList then with TFGMultiCargo(AFGMultiList.Objects[ I ]) do
       SelectedList.AddToList( FGMulti_ID, Qty )
    else
       SelectedList.AddToList( StrToFloat(AFGMultiList[ I ]));
  end;

  Arinvt_ID:= 0;
  if SelectedList.Count > 0 then
     Arinvt_ID:= SelectValueByID('arinvt_id', 'fgmulti', StrToFloat(SelectedList[ 0 ]));  // just grab 1st fgmulti - all fgmultis belong to 1 arinvt
end;


destructor TEnforceLotFifo.Destroy;
begin
  SelectedList.Free;
  ExistingList.Free;
  inherited;
end;

procedure TEnforceLotFifo.LoadSortExisting;  // load all existing fgmulti records ordered by arinvt_lot_docs
var
  Q: TFDQuery;
  AGreatestArinvt_Lot_Docs_ID: Real;
begin
  // Note - the SelectedList MUST be ordered by arinvt_lot_docs prioir to calling this proc
  AGreatestArinvt_Lot_Docs_ID:= TFGMultiCargo(SelectedList.Objects[ SelectedList.Count - 1 ]).Arinvt_Lot_Docs_ID;
  
  // load existing fgmulti records up to the greatest used arinvt_lot_docs
  Q:= TFDQuery.Create(nil);
  try
    Q.Connection := UniMainModule.FDConnection1;
    Q.SQL.Add( Format('select f.id as fgmulti_id,               '+
                      '       f.onhand,                         '+
                      '       lot.id as arinvt_lot_docs_id      '+
                      '  from fgmulti f,                        '+
                      '       arinvt_lot_docs lot               '+
                      ' where                                   '+
                      '       f.arinvt_id = %f                  '+
                      '   and f.arinvt_id = lot.arinvt_id       '+
                      '   and rtrim(f.lotno) = rtrim(lot.lotno) '+
                      '   and nvl(f.onhand,0) > 0               '+   // consider only positive onhand
                      '   and f.non_conform_id is null          '+
                          sIIf( feNoShip in Exclusions, ' and nvl(f.no_ship, ''N'') <> ''Y'' ',
                                '') +
                          sIIf( feHardAllocated in Exclusions, ' and hard_alloc.is_fgmulti_hard_alloc( f.id ) = 0 ',
                                '') +
                          sIIf( feInTransit in Exclusions, ' and nvl(f.in_transit_origin,0) = 0 ',
                                '') +
                          sIIf( feMTO in Exclusions, ' and nvl(f.make_to_order_detail_id,0) = 0 ',
                                '') +
                          sIIf( feVMI in Exclusions, ' and (select nvl(l.vmi, ''N'') from locations l where f.loc_id = l.id) <> ''Y'' ',
                                '') +
                      '   and lot.id <= %f                      '+
                      ' order by lot.id, f.id                   ',   // note we order by lot.id
                      [ Arinvt_ID,
                        AGreatestArinvt_Lot_Docs_ID ]));
    Q.Open;
    while not Q.Eof do
    begin
      ExistingList.AddToList( Q.FieldByName('fgmulti_id').asFloat,
                              Q.FieldByName('onhand').asFloat,
                              Q.FieldByName('arinvt_lot_docs_id').asFloat );
      Q.Next;
    end;
  finally
    Q.Free;
  end;
end;


function TEnforceLotFifo.FindViolation: Boolean;
var
  I: Integer;
  J: Integer;
begin
  // sort selected list by arinvt_lot_docs_id
  SelectedList.SortByArinvtLotDocs;

  // load and sort existing fgmulti
  LoadSortExisting;

  for I:= 0 to SelectedList.Count - 1 do
  begin
    if ExistingList.Count = 0 then BREAK;  // s/n happen

    // if selected fgmulti arinvt_lot_docs_id is GREATER than existing/available oldest fgmulti arinvt_lot_docs_id then it is a violation
    if SelectedList.Cargo[ I ].Arinvt_Lot_Docs_ID > ExistingList.Cargo[ 0 ].Arinvt_Lot_Docs_ID then
    begin
       ViolatedArinvtLotDocs_ID:= ExistingList.Cargo[ 0 ].Arinvt_Lot_Docs_ID;
       EXIT (True);
    end;

    // check existing onhand vs selected
    J:= ExistingList.IndexOf( SelectedList[ I ]);
    if J = -1 then                                                             // s/n happen
       Continue;

    // reduce existing onhand
    ExistingList.Cargo[ J ].Qty:= ExistingList.Cargo[ J ].Qty - SelectedList.Cargo[ I ].Qty;

    // remove this entry from the existing (aka available) fgmulti list if zero or negative
    if ExistingList.Cargo[ J ].Qty <= 0 then
       ExistingList.Delete( 0 );
  end;

  Result:= FALSE;
  ViolatedArinvtLotDocs_ID:= 0;
end;


class function TEnforceLotFifo.EnforcementRequired( ASrcFgMulti_ID: Real; ATrgFgMulti_ID: Real = 0 ): Boolean;
var
  A: Variant;
begin
  Result:= FALSE;

  A:= SelectValueArrayFmt( 'select f.lotno, a.fifo from fgmulti f, arinvt a where f.id = %f and f.arinvt_id = a.id', [ ASrcFgMulti_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  if Trim(A[ 0 ]) = '' then
     EXIT;

  {05-28-2014 system default}
  if MatchStr( A[ 1 ], [ '', 'D' ]) then
     A[ 1 ]:= SelectValueAsString('select fifo from params');

  if A[ 1 ] <> 'N' then
     EXIT;

  Result:= TRUE;

  // if ATrgFgMulti_ID = 0 then we only dealing with ASrcFgMulti_ID - we are done
  if ATrgFgMulti_ID = 0 then
     EXIT;

  // if we made it so far then the enforcement depends on the target location
  Result:= (SelectValueByID('auto_dispo_default_loc', 'fgmulti', ATrgFgMulti_ID) = 'Y')
            or
           (SelectValueFmtAsFloat('select 1 from fgmulti_dispo_bom where fgmulti_id = %f and rownum < 2', [ ATrgFgMulti_ID ]) = 1);
end;


class function TEnforceLotFifo.EnforcementRequired( AList: TStringList {list of fgmulti_id }): Boolean;
var
  I: Integer;
  AFifo: string;
begin
  Result:= FALSE;
  if AList.Count = 0 then
     EXIT;

  AFifo:= SelectValueFmtAsString('select a.fifo from fgmulti f, arinvt a where f.id = %s and f.arinvt_id = a.id', [ AList[ 0 ]]);
  if MatchStr( AFifo, [ '', 'D' ]) then
     AFifo:= SelectValueAsString('select fifo from params');
  if AFifo <> 'N' then
     EXIT;

  for I:= AList.Count - 1 downto 0 do
   if SelectValueByID('lotno', 'fgmulti', StrToFloat(AList[ I ])) = '' then AList.Delete(I);

  Result:= AList.Count > 0;
end;



{-- TFrmTransEnforceLotFIFO ---------------------------------------------------}
class function TFrmTransEnforceLotFIFO.DoShowModal(AEnforce: TEnforceLotFifo): Boolean;
var
  FrmTransEnforceLotFIFO: TFrmTransEnforceLotFIFO;
begin
  FrmTransEnforceLotFIFO:=TFrmTransEnforceLotFIFO.Create(uniGUIApplication.UniApplication);
  with FrmTransEnforceLotFIFO do
  begin
    FEnforce:=AEnforce;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmTransEnforceLotFIFO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmTransEnforceLotFIFO.FormShow(Sender: TObject);
begin

  IQSetTablesActive( TRUE, self );
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmTransEnforceLotFIFO.QryFGMultiBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'violated_arinvt_lot_docs_id', FEnforce.ViolatedArinvtLotDocs_ID);
  AssignQueryParamValue(DataSet, 'arinvt_id', FEnforce.Arinvt_ID);
  AssignQueryParamValue(DataSet, 'exclude_no_ship', fIIf( feNoShip in FEnforce.Exclusions, 1, 0));
end;

procedure TFrmTransEnforceLotFIFO.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmTransEnforceLotFIFO.btnContinueClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

end.
