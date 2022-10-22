unit IQMS.Common.BomTV;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Printers,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniTreeView,
  uniGUIAbstractClasses,
  Vcl.DBCtrls,
  IQMS.Common.DataConst,
  IQMS.Common.CustomPrintInterface,
  IQMS.Common.CustomPrintClasses;

type
  TBomTreeKind = ( tkBOM, tkRouting );
  TBomTreeOption = (boItemNo, boDescrip, boPtsPer, boQty, boCost, boCntrType, boOpDesc);
  TBomTreeOptions = set of TBomTreeOption;

  TBomTreeConfigType = (ctStandard, ctActual);

  TIQWebBomTreeViewBase = class(TUniTreeView)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    CS       : TRTLCriticalSection;
    FBomExplodeQty: Double;
    FBomTreeKind: TBomTreeKind;

    function  GetDataField:string;
    procedure SetDataField( AValue:string );
    function  GetDataSource : TDataSource;
    procedure SetDataSource( AValue:TDataSource );
    procedure DataChange( Sender: TObject );

    procedure FreeNodesData;
    procedure CheckSubNodesLoaded( Node : TUniTreeNode );
    function LoadRootNode( AParent: TUniTreeNode; AID, AQty: Real ):TUniTreeNode; virtual; abstract;
    procedure LoadSubNodes( AParent:TUniTreeNode; AArinvtID, AStandardID : Real ); virtual; abstract;

    function GetArinvt_ID: Real;
    function GetStandard_ID: Real;
  protected
    { Protected declarations }
     FIs_Metric_Sys: Boolean;
     procedure Change(Sender: TObject; Node: TUniTreeNode);
     procedure NodeExpand(Sender: TObject; Node: TUniTreeNode);
  public
    { Public declarations }
    RootNode: TUniTreeNode;
    constructor Create( AOwner:TComponent ); override;
    destructor Destroy; override;
    procedure Refresh;

    property Arinvt_ID  : Real read GetArinvt_ID  ;
    property Standard_ID: Real read GetStandard_ID;
  published
    { Published declarations }
    property DataField:string        read GetDataField  write SetDataField;
    property DataSource:TDataSource  read GetDataSource write SetDataSource;
    property BomExplodeQty: Double read FBomExplodeQty write FBomExplodeQty;
    property BomTreeKind: TBomTreeKind read FBomTreeKind write FBomTreeKind;
  end;

  { TBomTreeView }

  TIQWebBomTreeView = class(TIQWebBomTreeViewBase)
  private
    { Private declarations }
    FOptions : TBomTreeOptions;
    FConfigType: TBomTreeConfigType;
    FTouchscreen: Boolean;
    function LoadRootNode( AParent: TUniTreeNode; AID, AQty: Real ):TUniTreeNode; override;
    procedure LoadSubNodes( AParent:TUniTreeNode; AArinvtID, AStandardID : Real ); override;
    procedure CheckAppendAsBlend( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
    procedure CheckAppendMainPL( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
    procedure CheckAppendAsOpMat( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
    procedure AppendNodesFrom( AQuery:TFDQuery; AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
    function TransformQtyDisp( AQty: Real; AArinvt_Unit: string ): string;
    function CheckConvertLBSToArinvtNative( AQty: Real; AArinvt_Unit: string; AArinvt_ID: Real ): Real;
    // procedure PrintAsMicrosoftWord;
    procedure PrintAsText;
    procedure SetTouchscreen(const Value: Boolean);
  public
    constructor Create( AOwner:TComponent ); override;
    procedure GetItemStandardID( var AStandardID : Real; var AItemNo : string; AArinvtID : Real );
    procedure PrintCRW;
    property Touchscreen: Boolean read FTouchscreen write SetTouchscreen;
  published
    property ConfigType: TBomTreeConfigType read FConfigType write FConfigType;
    property Options: TBomTreeOptions read FOptions write FOptions;
  end;


  { TTreeNodeCargo }

  TIQWebTreeNodeCargo = class
    private
      FArinvt_ID    : Real;
      FStandard_ID  : Real;
      SubNodesLoaded: Boolean;
      Qty           : Real;
      UOM_Factor    : Real;
    public
      constructor Create( AArinvt_ID, AStandard_ID, AQty : Real; AUOM_Factor: Real = 1 );
      property Arinvt_ID  : Real read FArinvt_ID   write FArinvt_ID;
      property Standard_ID: Real read FStandard_ID write FStandard_ID;
  end;

implementation

uses
  IQMS.Common.InvMisc,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.Print,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.UOM,
  IQMS.Common.PanelMsg,
  IQMS.WebVcl.ResourceStrings,
  Winapi.CommCtrl;


{ TTreeNodeCargo }

constructor TIQWebTreeNodeCargo.Create( AArinvt_ID, AStandard_ID, AQty : Real; AUOM_Factor: Real = 1 );
begin
  FArinvt_ID    := AArinvt_ID;
  FStandard_ID  := AStandard_ID;
  SubNodesLoaded:= FALSE;
  Qty           := AQty;
  UOM_Factor    := fIIf(AUOM_Factor = 0, 1, AUOM_Factor);
end;

{ TBomTreeViewBase }

constructor TIQWebBomTreeViewBase.Create( AOwner:TComponent );
begin
  inherited Create( AOwner );

  try
    FIs_Metric_Sys:= IsMetricSys;  {IQMS.Common.UOM.pas}
  except
    FIs_Metric_Sys:= FALSE;
  end;

  FDataLink:= TFieldDataLink.Create;
  FDataLink.OnDataChange:= DataChange;

  OnNodeExpand:=NodeExpand;
  OnChange:=Change;

  ReadOnly:= TRUE;
//  HideSelection:= FALSE;
  FBomTreeKind:= tkBOM;

  InitializeCriticalSection( CS );
end;

destructor TIQWebBomTreeViewBase.Destroy;
begin
  FreeNodesData;
  DeleteCriticalSection( CS );

  FDataLink.OnDataChange:= NIL;
  FDataLink.Free;
  inherited Destroy;
end;

procedure TIQWebBomTreeViewBase.FreeNodesData;
var
  Node:TUniTreeNode;
  i:integer;
begin
  try
    EnterCriticalSection( CS );
    if Items.Count > 0 then
    begin
      for i := 0 to Items.Count-1 do
        begin
           Node:= Items[i];
            if Assigned( Node ) then
              if Assigned( Node.Data ) then
               begin
                 TObject( Node.Data ).Free;
                 Node.Data:= NIL;
               end;
        end;
    end;
  finally
    LeaveCriticalSection( CS );
  end;
end;

function TIQWebBomTreeViewBase.GetDataField:string;
begin
  Result:= FDataLink.FieldName;
end;

procedure TIQWebBomTreeViewBase.SetDataField( AValue:string );
begin
  FDataLink.FieldName:= AValue;
end;

function TIQWebBomTreeViewBase.GetDataSource : TDataSource;
begin
  Result:= FDataLink.DataSource;
end;

procedure TIQWebBomTreeViewBase.SetDataSource( AValue:TDataSource );
begin
  FDataLink.DataSource:= AValue;
end;

function TIQWebBomTreeViewBase.GetArinvt_ID: Real;
begin
  if (Selected <> NIL) and Assigned(Selected.Data ) then
     Result:= TIQWebTreeNodeCargo( Selected.Data ).Arinvt_ID
  else
     Result:= 0;
end;

function TIQWebBomTreeViewBase.GetStandard_ID: Real;
begin
  if (Selected <> NIL) and Assigned(Selected.Data ) then
     Result:= TIQWebTreeNodeCargo( Selected.Data ).Standard_ID
  else
     Result:= 0;
end;

procedure TIQWebBomTreeViewBase.DataChange( Sender: TObject );
begin
  FreeNodesData;

  EnterCriticalSection( CS );
  if not( csDesigning in ComponentState ) then
  try
    Items.Clear;

    Selected:= NIL;
    RootNode:= NIL;

    if Assigned(FDataLink.Field) and Assigned(FDataLink.DataSource) then
    begin
       RootNode:= LoadRootNode( NIL, FDataLink.Field.asFloat, BomExplodeQty );
       Selected:= RootNode;         {this triggers OnChange -> CheckSubNodesLoaded -> LoadSubNodes}
       Selected.Expand( FALSE );
    end;
  finally
    LeaveCriticalSection( CS );
  end;
end;

procedure TIQWebBomTreeViewBase.Change(Sender: TObject; Node: TUniTreeNode);
begin
  try
    EnterCriticalSection( CS );
    if Assigned( Node.Data ) then
    begin
      CheckSubNodesLoaded( Node );
      inherited;
    end;
  finally
    LeaveCriticalSection( CS );
  end;
end;

procedure TIQWebBomTreeViewBase.NodeExpand(Sender: TObject; Node: TUniTreeNode);
begin
  try
    EnterCriticalSection( CS );
    if Assigned( Node.Data ) then
    begin
      CheckSubNodesLoaded( Node );
      inherited;
    end;
  finally
    LeaveCriticalSection( CS );
  end;
end;

procedure TIQWebBomTreeViewBase.CheckSubNodesLoaded( Node : TUniTreeNode );
begin
  if not( csDesigning in ComponentState ) then
     with TIQWebTreeNodeCargo( Node.Data ) do
       if not SubNodesLoaded then
          LoadSubNodes( Node, Arinvt_ID, Standard_ID );
end;

procedure TIQWebBomTreeViewBase.Refresh;
begin
  DataChange( NIL );
end;

{ TBomTreeView }

constructor TIQWebBomTreeView.Create( AOwner:TComponent );
begin
  inherited Create( AOwner );
  ConfigType:= ctStandard;
  Options   := [boItemNo, boDescrip];
  FBomExplodeQty:= 0;
end;

function TIQWebBomTreeView.LoadRootNode( AParent: TUniTreeNode; AID, AQty: Real ):TUniTreeNode;
var
  AStandardID: Real;
  AItemNo    : string;
begin
  {AID here is Arinvt_ID}
  if not( csDesigning in ComponentState ) then
  begin
    GetItemStandardID( AStandardID, AItemNo, AID );

    if boCntrType in Options then
       AItemNo:= Format( IQMS.WebVcl.ResourceStrings.cTXT0000002 {'CType: %s, '}, [ SelectValueByID('cntr_type', 'standard', AStandardID )]) + AItemNo;

    if (boQty in Options) and (BomExplodeQty > 0) and (AID > 0) then
       AItemNo:= AItemNo + Format( IQMS.WebVcl.ResourceStrings.cTXT0000003 {' (Qty: %s )'}, [ FloatToStr(AQty) ]);

    Result:= Items.AddChild( AParent, AItemNo);
    Result.Data:=TIQWebTreeNodeCargo.Create( AID, AStandardID, fIIf( AQty = 0, 1, AQty ));
  end
  else
    Result:= NIL;
end;

procedure TIQWebBomTreeView.LoadSubNodes( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
var
 i:integer;
begin
  if not( csDesigning in ComponentState ) then
  try
     //self.Items.BeginUpdate;
     for i := 0 to aparent.Count-1 do
        aparent.Item[i].Destroy;
//     AParent.DeleteChildren;

     if not SecurityManager.IsInvisibleAnotherEPlant( SelectValueByID('eplant_id', 'standard', AStandardID )) then
     begin
       CheckAppendMainPL( AParent, AArinvtID, AStandardID );
       CheckAppendAsOpMat( AParent, AArinvtID, AStandardID );
       CheckAppendAsBlend( AParent, AArinvtID, AStandardID );
     end;

     TIQWebTreeNodeCargo(AParent.Data).SubNodesLoaded:= TRUE;
  finally
     //self.Items.EndUpdate;
     AParent.Expanded:= TRUE;
  end;
end;

procedure TIQWebBomTreeView.CheckAppendAsOpMat( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
var
  AQuery: TFDQuery;
begin
  AQuery:= TFDQuery.Create(nil);
  with AQuery do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(        'select opmat.arinvt_id,'                                           );
    SQL.Add(               'arinvt.standard_id,'                                        );
    SQL.Add(               'arinvt.itemno,'                                             );
    SQL.Add(               'arinvt.descrip,'                                            );
    SQL.Add(               'arinvt.class,'                                              );
    SQL.Add(               'rtrim(arinvt.rev) as rev,'                                  );
    SQL.Add(               'arinvt.onhand,'                                             );
    SQL.Add(               'UOM.IQConvert( opmat.unit, arinvt.unit, 1, arinvt.id, ''Y'') * arinvt.std_cost as std_cost, ');  // July-27-2005
    SQL.Add(               'RTrim(arinvt.unit) as arinvt_unit,'                         );

    {In case of PK add scrap and all other cases subtract from 1 to calculate ptsper    }
    {The idea here is that PK scrap yields less parts per packaging                     }
 // SQL.Add(               'opmat.ptsper_disp / (1 + decode(sndop.op_class, ''PK'', 1, -1)* NVL(opmat.scrap / 100, 0)) as ptsper,' );  // 11-29-2012 replaced op_class with the arinvt.class
    SQL.Add(               '   case arinvt.class                                                      ');
    SQL.Add(               '     when ''PK'' then opmat.ptsper_disp * (1 - nvl(opmat.scrap / 100, 0)) ');
    SQL.Add(               '     else             opmat.ptsper_disp / (1 - nvl(opmat.scrap / 100, 0)) ');
    SQL.Add(               '   end as ptsper,                                                         ');

    SQL.Add(               'opmat.mbatch_percent,'                                      );
    SQL.Add(               'sndop.op_class,'                                      );
    SQL.Add(               'sndop.opdesc,'                                        );
    SQL.Add(               ''' [uom: ''||rtrim(opmat.unit)||''] '' as postfix,'         );
    SQL.Add(               '''OPMAT'' as source, '                                      );
    SQL.Add(               'UOM.IQConvert( opmat.unit, arinvt.unit, 1, arinvt.id, ''Y'') as uom_factor, ');  // Apr-19-2013
    SQL.Add(               'opmat.parent_batch_size '                                   );
    SQL.Add(          'from partno, ptoper, opmat, arinvt, sndop '                      );
    SQL.Add( IQFormat( 'where partno.arinvt_id = %f '         , [ AArinvtID ]  )        );
    SQL.Add( IQFormat(   'and partno.standard_id = %f '       , [ AStandardID ])        );
    SQL.Add(           'and partno.id = ptoper.partno_id '                              );
    SQL.Add(           'and ptoper.sndop_id = sndop.id '                                );
    SQL.Add(           'and sndop.id = opmat.sndop_id '                                 );
    SQL.Add(           'and opmat.arinvt_id = arinvt.id '                               );
    Open;
    AppendNodesFrom( AQuery, AParent, AArinvtID, AStandardID );
  finally
    Free;
  end;
end;

procedure TIQWebBomTreeView.CheckAppendAsBlend( AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
var
  AQuery: TFDQuery;
begin
  AQuery:= TFDQuery.Create(nil);
  with AQuery do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(      'select opmat.arinvt_id,'                      );
    SQL.Add(              'a.standard_id,'                       );
    SQL.Add(              'a.itemno,'                            );
    SQL.Add(              'a.descrip,'                           );
    SQL.Add(              'a.class,'                             );
    SQL.Add(              'rtrim(a.rev) as rev,'                 );
    SQL.Add(              'a.onhand,'                            );
    SQL.Add(              'a.std_cost,'                          );
    SQL.Add(              'RTrim(a.unit) as arinvt_unit,'        );
    // SQL.Add(              'opmat.ptsper as ptsper,'         );
    SQL.Add(              'opmat.ptsper_disp as ptsper,'         );
    SQL.Add(               '''%'' as postfix,'                   );
    SQL.Add(               '''BLEND'' as source'                 );
    SQL.Add(         'from sndop, arinvt a, opmat'               );
    SQL.Add(IQFormat( 'where sndop.arinvt_id = %f', [ AArinvtID ] ));
    SQL.Add(          'and opmat.sndop_id = sndop.id'            );
    SQL.Add(          'and opmat.arinvt_id = a.id'               );
    Open;
    AppendNodesFrom( AQuery, AParent, AArinvtID, AStandardID );
  finally
    Free;
  end;
end;

procedure TIQWebBomTreeView.CheckAppendMainPL( AParent:TUniTreeNode; AArinvtID, AStandardID: Real );
var
  AQuery          : TFDQuery;
  // AConvertFuncName: string;
  APostFixUOM     : string;
  AUom            : string;
begin
  AUom:= SelectValueFmtAsString('select rtrim(a.unit) from arinvt a, standard s where s.id = %f and s.arinvt_id_mat = a.id', [ AStandardID, AArinvtID ]);

  if IsWeightUom( AUom ) then   {pas}
     // begin
     //    if FIs_Metric_Sys then
     //    begin
     //      AConvertFuncName:= 'UOM.Gr_To_Kg';
     //      APostFixUOM     := ' Kg';
     //    end
     //    else
     //    begin
     //      AConvertFuncName:= 'UOM.Gr_To_LBS';
     //      APostFixUOM     := ' LBS';
     //    end;
     // end

     APostFixUOM     := ' '+ Trim(AUom)
  else
     APostFixUOM     := Format( IQMS.WebVcl.ResourceStrings.cTXT0000004 {' [uom: %s] '}, [ AUom ]);

  AQuery:= TFDQuery.Create(nil);
  with AQuery do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(                 'select s.arinvt_id_mat as arinvt_id,'               );
    SQL.Add(                 'a.standard_id,'                                     );
    SQL.Add(                 'a.itemno,'                                          );
    SQL.Add(                 'a.descrip,'                                         );
    SQL.Add(                 'a.class,'                                           );
    SQL.Add(                 'rtrim(a.rev) as rev,'                               );
    SQL.Add(                 'a.onhand,'                                          );
    SQL.Add(                 'a.std_cost,'                                        );
    SQL.Add(                 'RTrim(a.unit) as arinvt_unit,'                      );

    // 11-13-2014 EIQ-4952 BOM Tree can be incorrect when MFG primary material has a Standard Calc Quantity
    // SQL.Add( IQFormat(       'Round( 1 / UOM.Normalize(1, RTrim(a.unit)) *                                         '+
    //                          '       Round( decode( mfg.lookup_mfgtype( mfg_type ),                          '+
    //                          '                     ''EXTRUSION'',  appdef_bom_extrusion.part_pl_weight( %f, %f ),  '+
    //                          '                     ''EXTRUSION2'', appdef_bom_extrusion2.part_pl_weight( %f, %f ), '+
    //                          '                     ''COMPOUND1'',  appdef_bom_compound1.part_pl_weight( %f, %f ), '+
    //                          '                     ''EXTRUSION3'', appdef_bom_extrusion3.part_pl_weight( %f, %f ), '+
    //                          '                     ''FAB'',        appdef_bom_fab.part_pl_weight( %f, %f ),        '+
    //                          '                     ''THERMOFORM'', appdef_bom_thermoform.part_pl_weight( %f, %f ), '+
    //                          '                     ''TFORM2'',     appdef_bom_tform2.part_pl_weight( %f, %f ),     '+  // 07-03-2013 ..._ex is removed: Issue EIQ-467: TForm2 - Material Exceptions are being doubled with family BOM
    //                          '                       appdef_bom.part_pl_weight( %f, %f))                           '+
    //                          '              /                                                                      '+
    //                          '              decode( NVL(a.stdquan,0), 0, 1000, a.stdquan), 6) *  decode( NVL(a.stdquan,0), 0, 1000, a.stdquan ), 6 ) as ptsper,   ',
    //
    // 11-13-2014 EIQ-4952 BOM Tree can be incorrect when MFG primary material has a Standard Calc Quantity
    // same as commented above but w/o dividing by std quan, round 6 and multiply back by std quan
    SQL.Add( IQFormat(       'Round( 1 / UOM.Normalize(1, RTrim(a.unit)) *                                         '+
                             '       decode( mfg.lookup_mfgtype( mfg_type ),                          '+
                             '              ''EXTRUSION'',  appdef_bom_extrusion.part_pl_weight( %f, %f ),  '+
                             '              ''EXTRUSION2'', appdef_bom_extrusion2.part_pl_weight( %f, %f ), '+
                             '              ''COMPOUND1'',  appdef_bom_compound1.part_pl_weight( %f, %f ), '+
                             '              ''EXTRUSION3'', appdef_bom_extrusion3.part_pl_weight( %f, %f ), '+
                             '              ''FAB'',        appdef_bom_fab.part_pl_weight( %f, %f ),        '+
                             '              ''THERMOFORM'', appdef_bom_thermoform.part_pl_weight( %f, %f ), '+
                             '              ''TFORM2'',     appdef_bom_tform2.part_pl_weight( %f, %f ),     '+  // 07-03-2013 ..._ex is removed: Issue EIQ-467: TForm2 - Material Exceptions are being doubled with family BOM
                             '              ''SLITTING'',   appdef_bom_slitting.part_pl_weight( %f, %f )    '+
                             '                  * decode(mfg.is_weight( mfg_type), 1, 1, 12),               '+   // part_pl_weight is in ft for slitting by length. Convert to inches to match the Normalize call above.
                             '                appdef_bom.part_pl_weight( %f, %f))                           '+
                             '       , 6 ) as ptsper,                                                       ',
                             [ AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID,
                               AStandardID, AArinvtID ] ));

    SQL.Add( Format(        '''%s'' as postfix,' , [ APostFixUOM ]));
    SQL.Add(                '''MAIN_PL'' as source'                               );
    SQL.Add(         ' from standard s, arinvt a'                                );
    SQL.Add(         'where s.arinvt_id_mat = a.id '                             );
    SQL.Add( IQFormat( 'and s.id = %f', [ AStandardID ]                         ));
    Open;
    AppendNodesFrom( AQuery, AParent, AArinvtID, AStandardID );
  finally
    Free;
  end;
end;

procedure TIQWebBomTreeView.AppendNodesFrom( AQuery:TFDQuery; AParent:TUniTreeNode; AArinvtID, AStandardID : Real );
var
  Node         : TUniTreeNode;
  S            : string;
  APtsPer      : Real;
  AQty         : Real;
  ATmp         : Real;
  AQty_Disp    : string;
  ANonCommitted: Real;
  AMfgType     : string;
  AOpClass     : string;
  AOpDesc      : string;
  AUOM_Factor  : Real;
begin
  AMfgType:= SelectValueByID('mfg.lookup_mfgtype( mfg_type )', 'standard', AStandardID );

  { any AQuery with columns arinvt_id, itemno, descrip, ptsper will work with this function }
  with AQuery do
  while not Eof do
  begin
    {Special case - for tkRouting display only MFG items}
    if (BomTreeKind = tkRouting) and (FieldByName('standard_id').asFloat = 0) then
    begin
      Next;
      Continue;
    end;

    S   := '';
    AQty:= 0;

    AOpClass:= '';
    if Assigned(FindField('op_class')) then
       AOpClass:= FieldByName('op_class').asString;

    AOpDesc:= '';
    if Assigned(FindField('opdesc')) then
       AOpDesc:= Trim(FieldByName('opdesc').asString);

    {The following belongs to both tkBOM and tkRouting }
    if (boOpDesc in Options) and (AOpDesc > '') then
       S:= S + Format('%s ', [ AOpDesc ]);

    if boCntrType in Options then
       S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000002 {'CType: %s, '}, [ SelectValueByID('cntr_type', 'standard', FieldByName('standard_id').asFloat )]);

    if boItemNo in Options then
       S:= S + Format('%s %s', [ Trim(FieldByName('itemno').asString), FieldByName('rev').asString ]);

    if boDescrip in Options then
       S:= S + Format(' (%s)', [ Trim(FieldByName('descrip').asString) ]) ;

    {The following belongs to only tkBOM }
    if BomTreeKind = tkBOM then
    begin

      if boPtsPer in Options then
      begin
         if FieldByName('class').asString = 'PK' then
            S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000308 {':  %.6f%s per pkg'},
                            [ FieldByName('ptsper').asFloat,
                              FieldByName('postfix').asString ])

         else if (AMfgType = 'COMPOUND1')
                 and
                 (AOpClass = 'IN')
                 and
                 (FieldByName('source').asString = 'OPMAT')
                 and
                 Assigned(FindField('mbatch_percent')) then
            S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000408 {':  %.6f (%s%%) %s per item'},
                            [ FieldByName('ptsper').asFloat,
                              FieldByName('mbatch_percent').asString,
                              FieldByName('postfix').asString ])
         else
            S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000309 {':  %.6f%s per item'},
                            [ FieldByName('ptsper').asFloat,
                              FieldByName('postfix').asString ]);
      end;


      {calculate qty needed}
      if FieldByName('source').asString = 'OPMAT' then
         begin
           if FieldByName('class').asString = 'PK' then
              begin
                if FieldByName('ptsper').asFloat <> 0 then
                   AQty:= IQRoundEx( TIQWebTreeNodeCargo( AParent.Data ).Qty * TIQWebTreeNodeCargo( AParent.Data ).UOM_Factor * 1 / FieldByName('ptsper').asFloat, 6)  {IQMS.Common.Numbers.pas}
                else
                   AQty:= 0;
              end
           else
              AQty:= TIQWebTreeNodeCargo( AParent.Data ).Qty * TIQWebTreeNodeCargo( AParent.Data ).UOM_Factor * FieldByName('ptsper').asFloat;

           if (AMfgType = 'MBATCH2') and Assigned(FindField('parent_batch_size')) and (FieldByName('parent_batch_size').AsFloat > 0) then
             AQty:= AQty / FieldByName('parent_batch_size').AsFloat;
         end

      else if FieldByName('source').asString = 'MAIN_PL' then
         begin
           if AMfgType = 'EXTRUSION' then
              try
                // AQty:= AQty / SelectValueFmtAsFloat('select ptwt/12 from partno where standard_id = %f', [ AStandardID ]) * FieldByName('ptsper').asFloat
                // AQty:= SelectValueFmtAsFloat('select UOM.To_Native( %f, ''%s'') from dual', [ TTreeNodeCargo( AParent.Data ).Qty, SelectValueByID('uom', 'standard', AStandardID) ]);
                AQty:= TIQWebTreeNodeCargo( AParent.Data ).Qty *  TIQWebTreeNodeCargo( AParent.Data ).UOM_Factor;
                AQty:= AQty * FieldByName('ptsper').asFloat
              except on E:Exception do
                begin
                  AQty:= 0;
                  ShowMessage(Format( IQMS.WebVcl.ResourceStrings.cTXT0000007 {'Unable to calculate main material required.'#13#13'%s'}, [ E.Message ]));
                end
              end

           else
              AQty:= TIQWebTreeNodeCargo( AParent.Data ).Qty * TIQWebTreeNodeCargo( AParent.Data ).UOM_Factor * FieldByName('ptsper').asFloat
         end

      else if FieldByName('source').asString = 'BLEND' then
         AQty:= TIQWebTreeNodeCargo( AParent.Data ).Qty * FieldByName('ptsper').asFloat / 100;


      if (boQty in Options) and (BomExplodeQty > 0) then
      begin
         // ATmp:= SelectValueFmtAsFloat('select sum( NVL( tot_mat_qty, 0 )) from day_use_total where arinvt_id = %f', [FieldByName('arinvt_id').asFloat]);
         // ATmp:= CheckConvertLBSToArinvtNative( ATmp, FieldByName('arinvt_unit').asString, AArinvtID );
         // ANonCommitted:= FieldByName('onhand').asFloat - ATmp;
         ANonCommitted:= GetCalculateNonComitted( FieldByName('arinvt_id').asFloat );
         if ANonCommitted < 0 then ANonCommitted:= 0;

         if Pos( FieldByName('source').asString, '__MAIN_PL__BLEND__') > 0 then
            AQty_Disp:= TransformQtyDisp( AQty, FieldByName('arinvt_unit').asString )
         else
            AQty_Disp:= FormatFloat('###,###,##0.######', AQty );

         S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000008 {', Req: %s, Non-Cmt: %s'}, [ AQty_Disp, FormatFloat('###,###,##0.#####', ANonCommitted) ]);

         S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000310 {', On Hand: %s'}, [ FormatFloat('###,###,##0.#####', FieldByName('onhand').asFloat )]);
      end;

      if boCost in Options then
         S:= S + Format( IQMS.WebVcl.ResourceStrings.cTXT0000009 {', Ext Cost: %.6f'}, [ AQty * FieldByName('std_cost').asFloat ]);

    end;  { BomTreeKind = tkBOM }

    if FindField('uom_factor') <> nil then
       AUOM_Factor:= FieldByName('uom_factor').asFloat
    else
       AUOM_Factor:= 1;

    Node:= Items.AddChild( AParent,  S);
    node.Data:=TIQWebTreeNodeCargo.Create( FieldByName('arinvt_id').asFloat,
                                                        FieldByName('standard_id').asFloat,
                                                        AQty,
                                                        AUOM_Factor );
    Items.AddChild( Node, '' ); {to get +}
    Next;
  end;
end;

function TIQWebBomTreeView.TransformQtyDisp( AQty: Real; AArinvt_Unit: string ): string;
var
  ANative         : string;
  AConvertFuncName: string;
  ActualUnit      : string;
begin
  //if IsWeightUom( AArinvt_Unit ) then
  //   begin
  //      if FIs_Metric_Sys then ANative:= 'KG' else ANative:= 'LBS';
  //
  //      if ANative <> Trim(UpperCase(AArinvt_Unit)) then
  //      begin
  //        AConvertFuncName:= Format('UOM.%s_To_%s', [ ANative, AArinvt_Unit ]);
  //        try
  //          // AQty:= SelectValueFmtAsFloat( 'select %s( %f ) from dual', [ AConvertFuncName, AQty ]);
  //          // Dec 16, 99 AA - SelectValueFmtAsFloat funciton threw a warning if conversion function didn't exist. Replaced with a simple TFDQuery to keep it silent
  //          with TFDQuery.Create(Application) do
  //          try
  //             Connection := MainModule.FDConnection;
  //             SQL.Add( IQFormat( 'select %s( %f ) from dual', [ AConvertFuncName, AQty ] ));
  //             Open;
  //             AQty:= Fields[ 0 ].asFloat;
  //          finally
  //             Free;
  //          end;
  //          ActualUnit:= AArinvt_Unit;
  //        except
  //          ActualUnit:= ANative;
  //        end
  //      end
  //      else
  //        ActualUnit:= ANative;
  //   end
  //else
  //   {not weight UOM such as LBS, KG etc}
  //   begin
  //     ActualUnit:= AArinvt_Unit;
  //   end;
  ActualUnit:= AArinvt_Unit;

  Result:= Format( '%s (%s) ', [ FormatFloat('###,###,##0.######', AQty ), ActualUnit ]);
end;

function TIQWebBomTreeView.CheckConvertLBSToArinvtNative( AQty: Real; AArinvt_Unit: string; AArinvt_ID: Real ): Real;
var
  ANative         : string;
  AConvertFuncName: string;
begin
  Result:= AQty;

  if IsWeightUom( AArinvt_Unit ) then
  begin
     // if FIs_Metric_Sys then ANative:= 'KG' else ANative:= 'LBS';
     if IsMetricSysArinvt( AArinvt_ID ) then ANative:= 'KG' else ANative:= 'LBS';

     if ANative <> Trim(UpperCase(AArinvt_Unit)) then
     begin
       AConvertFuncName:= Format('UOM.%s_To_%s', [ ANative, AArinvt_Unit ]);
       try
         Result:= SelectValueFmtAsFloat('select %s( %f ) from dual', [ AConvertFuncName, AQty ]) ;
       except
         {suppress any conversion exception}
         Result:= AQty;
       end;
     end
  end
end;

procedure TIQWebBomTreeView.GetItemStandardID( var AStandardID : Real; var AItemNo : string; AArinvtID : Real );
var
  AField: TField;
begin
  if not( csDesigning in ComponentState ) then
  begin
     {Find Itemsno and Default Standard_ID}
     with TFDQuery.Create(nil) do
     try
       ConnectionName := cnstFDConnectionName;
       SQL.Add(IQFormat('select itemno, descrip, standard_id, rev from arinvt where id = %f', [ AArinvtID ]));
       Open;
       AItemNo:= Format( '%s %s (%s)', [ Fields[0].asString, Fields[3].asString, Fields[1].asString ]);
       AStandardID:= Fields[2].asFloat;
     finally
       Free;
     end;

     {In case we want to use ACTUAL standard_id}
     if (ConfigType = ctActual) and Assigned(FDataLink.DataSource) and Assigned(FDataLink.DataSource.DataSet) then
     begin
       AField:= FDataLink.DataSource.DataSet.FindField('standard_id');
       if Assigned( AField ) and (AField.asFloat > 0) then  {NOTE: 08-16-2012 AField.asFloat > 0 was added for ord_detail that may or may not have standard_id populated CL# 31567 }
          AStandardID:= AField.asFloat;
     end;
  end;
end;

(*
Jul 31,00 AA. Print form MS Word directly

procedure TIQWebBomTreeView.PrintCRW;
var
  SelectionList: TStringList;
  AFileName    : string;
  WordApp      : OLEVariant;
begin
  FullExpand;
  Items.GetFirstNode.Selected:= TRUE;

  {Export to File}
  AFileName:= IQGetLocalHomePath + 'BOM_Tree.doc';
  SaveToFile( AFileName );

  {Flip on a side - Landscape}
  WordApp:= CreateOleObject('Word.Application');
  try
    WordApp.Documents.Open( AFileName, FALSE, FALSE, FALSE );
    WordApp.ActiveDocument.PageSetup.LineNumbering.Active:= 0;
    WordApp.ActiveDocument.PageSetup.Orientation:= 1;         // wdOrientLandscape
    WordApp.ActiveDocument.PageSetup.LeftMargin := 18;        // 0.25 * 72 (72 = 1")
    WordApp.ActiveDocument.PageSetup.RightMargin:= 18;
    WordApp.ActiveDocument.PageSetup.PageWidth  := 1008;      // 14"
    WordApp.ActiveDocument.PageSetup.PageHeight := 612;       // 8.5"
    WordApp.ActiveDocument.SaveAs( AFileName, 0 );            // 0 = wdFormatDocument - save as a ms doc
  finally
    WordApp.Application.Quit;
  end;

  {Call CRW}
  try
    SelectionList := TStringList.Create;
    SelectionList.Add( Format('{STANDARD.ID} = %f', [ Standard_ID ]));
    PrintDefaultReportEx( self, 'BOM_TREE.RPT', SelectionList );  {in IQMS.Common.Print.pas}
  finally
    SelectionList.Free;
  end;
end;

*)

procedure TIQWebBomTreeView.PrintCRW;
begin
  // 12/31/2014 (Byron) Separated "print" methods, adding a method for
  // printing to text.  It is unused, but retained in case having
  // MS Word installed becomes an issue.  I made this changes for issue:
  // EIQ-5456 Issue printing BOM Tree when component description includes +/-.
  // CRM#1150652. H&L Manufacturing
  //PrintAsMicrosoftWord;
  // 10/14/2015 (Byron, EIQ-9064) Attempting to print while Microsoft Word
  // is open will cause problems because Word tries to save any unsaved
  // documents.  In the process, it shows modal dialog prompts.
  // Changed to print using simple text. Text is wrapped.
  PrintAsText;
end;

procedure TIQWebBomTreeView.SetTouchscreen(const Value: Boolean);
begin
  FTouchscreen:= Value;

  if FTouchscreen then
     begin
       Font.Size:= 8;
       Font.Style:= Font.Style + [fsBold];
       Winapi.CommCtrl.TreeView_SetItemHeight( self.handle, 20 );
     end
  else
     begin
       Font.Size:= 8;
       Font.Style:= Font.Style - [fsBold];
       Winapi.CommCtrl.TreeView_SetItemHeight( self.handle, 18 );
     end;
end;

(*
procedure TIQWebBomTreeView.PrintAsMicrosoftWord;
const
  wdCollapseEnd = 0;
  wdStory = 6;
  cWordInch = 72;
var
  AFileName: string;
  WordApp  : OLEVariant;
  hMsg     : TPanelMesg;
  i: Integer;

  function MSWordHandleValid: Boolean;
  begin
    try
      WordApp := System.Win.ComObj.GetActiveOleObject('Word.Application');
      Result := True;
    except
      Result := False;
    end;
  end;

  function MSWordHandleFound: Boolean;
  begin
    Result := MSWordHandleValid;
    if not Result then
      // Try to create the OLE Object.  If unsuccessful, generate exception.
      try
        WordApp := System.Win.ComObj.CreateOleObject('Word.Application');
        Result := True;
      except
        on E: EOLESysError do
          begin
            Result := False;
            raise;
          end;
      end;
    //WordApp.Visible := False;
  end;

begin
  // Expand all tree nodes.  This forces all nodes to load.
  FullExpand;
  Items.GetFirstNode.Selected:= True;

  {Flip on a side - Landscape}

  if MSWordHandleFound then
    begin
      try
        {Export to File}
        AFileName:= IQGetLocalHomePath + IQMS.WebVcl.ResourceStrings.cTXT0000010; // 'BOM_Tree.doc'
        // Delete the old file
        if FileExists(AFileName) then
          DeleteFile(AFileName);
        //CRM# 727062 Added this pause to allow enough time for MS Word 2010
        // to initialize/load Normal.dotm
        while WordAPP.Templates.Count = 0 do
          Sleep(200);
        WordApp.ScreenUpdating := False;
        WordApp.Documents.Add; // first add a new doc

        {Set Orientation and Sizes}
        WordApp.ActiveDocument.PageSetup.LineNumbering.Active:= 0;
        WordApp.ActiveDocument.PageSetup.Orientation:= 1;         // wdOrientLandscape
        WordApp.ActiveDocument.PageSetup.LeftMargin := 18;        // 0.25 * 72 (72 = 1")
        WordApp.ActiveDocument.PageSetup.RightMargin:= 18;

        {Change font to 8}
        WordApp.Selection.WholeStory;
        WordApp.Selection.Font.Size:= 8;
        WordApp.Selection.Collapse(wdCollapseEnd);                // wdCollapseEnd = 0
        WordApp.Selection.HomeKey(wdStory);                       // wdStory = 6

        {Add Header}
        WordApp.Selection.HomeKey( wdStory );                     // wdStory = 6
        WordApp.Selection.TypeParagraph;                          // 1 line wdLine = 5
        WordApp.Selection.MoveUp( 5, 1 );                         // wdLine = 5, Count = 1

        WordApp.Selection.TypeText( IQMS.WebVcl.ResourceStrings.cTXT0000011 {'Date:'} + #32 {space} + DateToStr(Date));
        WordApp.Selection.TypeParagraph;
        WordApp.Selection.TypeParagraph;

        WordApp.Selection.Font.Underline:= 1;                     // 1 = wdUnderlineSingle
        WordApp.Selection.TypeText( Format( IQMS.WebVcl.ResourceStrings.cTXT0000013 {'BOM Tree Mfg # %s'}, [ SelectValueByID('mfgno', 'standard', Standard_ID )]));
        WordApp.Selection.TypeParagraph;                          // 1 line down
        WordApp.Selection.Font.Underline:= 0;                     // 0 = wdUnderlineNone
        WordApp.Selection.TypeParagraph;                          // 1 line down

        // Add the BOM tree items
        for i := 0 to Items.Count - 1 do
          begin
            WordApp.Selection.TypeText(Repl(#9, Items[i].Level) + Items[i].Text);
            WordApp.Selection.TypeParagraph;
          end;

        WordApp.ActiveDocument.SaveAs( AFileName, 0 );            // 0 = wdFormatDocument - save as a ms doc
      finally
        WordApp.ScreenUpdating := True;
        WordApp.Application.Quit;
      end;

      hMsg:= hPleaseWait( IQMS.WebVcl.ResourceStrings.cTXT0000014 {'Printing, please wait...'} );
      try
        Sleep(1500);
        IQShellExecute( AFileName, 'print' );  {IQExtDoc.pas}
      finally
        hMsg.Free;
      end;
    end;
end;
*)

procedure TIQWebBomTreeView.PrintAsText;
const
  // This is the maximum line width for landscape.  For portrait, it is 75.
  c_max_line_width: Integer = 158;
var
  ACustomPrint: ICustomPrint;
  AFileName, ATitle: string;
  hMsg: TPanelMesg;
  // i: Integer;
  ALines: TStringList;
  // APixelsPerInch: Integer;

  procedure _AddLine(ANode: TUniTreeNode; AFont: TFont);
  var
    sl: TStringList;
    ADivisor: Real;
    j, ANodeLevel: Integer;
  begin
    // A divisor is required for converting pixels back to text width.
    // What would be the formula?  The value should be this:
    // ADivisor := 41.77215189873418;
    // AMaxTextWidth := Trunc((Printer.PageWidth - APixelsPerInch) / ADivisor) - ANodeLevel;

    // Node level is always just in characters (every 8 characters)
    ANodeLevel := ANode.Level * 8;
    sl := TStringList.Create;
    try
      sl.Text := IQMS.Common.StringUtils.BlockWrapText(
        ANode.Text,
        ANodeLevel,
        c_max_line_width
        );
      for j := 0 to sl.Count - 1 do
        begin
          ALines.Add(sl.Strings[j]);
        end;
      ALines.Add('');
    finally
      FreeAndNil(sl);
    end;
  end;

  procedure _BuildLines(AFont: TFont);
  var
    i: Integer;
  begin
    // IQMS.WebVcl.ResourceStrings.cTXT0000011 = 'Date:'
    ALines.Add(IQMS.WebVcl.ResourceStrings.cTXT0000011 + #32 {space} +
      FormatDateTime('ddddd', Date));
    // Get the title
    ATitle := Format( IQMS.WebVcl.ResourceStrings.cTXT0000013,
      [SelectValueByID('mfgno', 'standard', Standard_ID)]);
    // IQMS.WebVcl.ResourceStrings.cTXT0000013 = 'BOM Tree Mfg # %s'
    ALines.Add(ATitle);
    ALines.Add('');
    // Add the lines
    for i := 0 to Items.Count - 1 do
      _AddLine(Items[i], AFont);
  end;

begin
  FullExpand;
  Items.GetFirstNode.Selected:= TRUE;

  ALines := TStringList.Create;
  try
    // Print the file (Prn_Share.pas)
    ACustomPrint := TCustomPrint.Create;
    with ACustomPrint do
    begin
      ShowPrintFinished := False; // do not display the "done" message
      HeaderCaption := ATitle;
      ShowHeader := True;
      HeaderOnFirstPage := False;
      // Note:  If page numbers are requested, then set ShowFooter to True.
      ShowFooter := True;
      HeaderCaption := ATitle;
      Orientation := poLandscape;
      TopMargin := 0.5; // half inch
      LeftMargin := TopMargin;
      RightMargin := TopMargin;
      BottomMargin := TopMargin;
      if Screen.Fonts.IndexOf('Calibri') > -1 then
        begin
          TCustomPrint(ACustomPrint).Font.Name := 'Calibri';
          TCustomPrint(ACustomPrint).Font.Size := 10;
        end
      else if Screen.Fonts.IndexOf('Arial') > -1 then
        begin
          TCustomPrint(ACustomPrint).Font.Name := 'Arial';
          TCustomPrint(ACustomPrint).Font.Size := 10;
        end
      else if Screen.Fonts.IndexOf('Courier New') > -1 then
        begin
          TCustomPrint(ACustomPrint).Font.Name := 'Courier New';
          TCustomPrint(ACustomPrint).Font.Size := 10;
        end;
      TCustomPrint(ACustomPrint).Font.Color := clBlack;
      _BuildLines(TCustomPrint(ACustomPrint).Font);
      Lines.AddStrings(ALines);
      Execute;
    end;
  finally
    FreeAndNil(ALines);
  end;
end;

end.
