unit BomPtsPer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Grids;

type
  TOpmatParams = record
    {for all}
    PtsPer              : Real;

    {fab only}
    Alloc_Req           : Boolean;

    {class = IN and PK}
    Scrap               : Real;
    Exclude_Scrap_Dispo : Boolean;
    Dispo_Cycles_Based  : Boolean;
    Exclude_Backflush   : Boolean;

    {class = PK}
    Weight              : Real;
    Tare_Weight         : Real;
    Returnable_Container: Boolean;
    Verify_Asn_Qty      : Boolean;

    StartUpQty          : Real;
    IncludeStartUpQtyStdCost: Boolean;
  end;

  TFrmPtsPer = class(TUniForm)
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    wwDataInspector1: TwwDataInspector;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FPrompt: string;
    procedure Validate;
    procedure AssignInspectorItemVisibleByTagString( ATagString: string; AIsVisible: Boolean );
    procedure AssignInspectorItemCaptionByTagString( ATagString: string; ACaption: String);
    procedure SaveDataTo( var AOpmatParams: TOpmatParams );
    procedure LoadDataFrom( AOpmatParams: TOpmatParams );
    procedure SetAClass(const Value: string);
    procedure SetMfgType(const Value: string);
    procedure SetPrompt(const Value: string);
    procedure SetOpmatParams(const Value: TOpmatParams);
  public
    { Public declarations }
    class procedure PopulateOpmatParamsFromOpmat( AOpmat_ID: Real; var AOpmatParams: TOpmatParams );

    property Prompt: string write SetPrompt;
    property MfgType: string write SetMfgType;
    property AClass : string write SetAClass;
    property OpmatParams : TOpmatParams write SetOpmatParams;
  end;

function GetBOMPtsPer( APrompt, AMfgType, AClass: string; var AOpmatParams: TOpmatParams ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  Variants,
  IQMS.Common.Boolean,
  bom_secured_confirm_ptsper_zero,
  IQMS.Common.Numbers;

function GetBOMPtsPer( APrompt, AMfgType, AClass: string; var AOpmatParams: TOpmatParams ): Boolean;
var
  LFrmPtsPer : TFrmPtsPer;
begin
  LFrmPtsPer := TFrmPtsPer.Create( uniGUIApplication.UniApplication );

  LFrmPtsPer.Prompt := APrompt;
  LFrmPtsPer.MfgType := AMfgType;
  LFrmPtsPer.AClass := AClass;
  LFrmPtsPer.OpmatParams := AOpmatParams;

  Result:= LFrmPtsPer.ShowModal = mrOK;
  if Result then
     LFrmPtsPer.SaveDataTo( AOpmatParams );
end;

{ TFrmPtsPer }
procedure TFrmPtsPer.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmPtsPer.Validate;
var
  AItem: TwwInspectorItem;
  AValue: Real;
begin
  // AItem :=  wwDataInspector1.GetItemByCaption(FPrompt);
  AItem:= wwDataInspector1.GetItemByTagString( 'Item Per' );
  IQAssert( Assigned(AItem), 'Unable to identify ''Item Per'' row.');

  if not IQMS.Common.Numbers.IsStringValidFloat( Trim(AItem.EditText), AValue ) or ( AValue <= 0 ) then
  begin
    if TFrmBOMSecuredConfirmPtsPerZero.DoShowModal( FPrompt + ' should be a number greater than 0. Are you sure you want to continue?' ) <>  mrYes then // bom_secured_confirm_ptsper_zero.pas
       ABORT;
    // AItem.EditText:= '0';
  end;

  // IQAssert( Trim(AItem.EditText) > '', FPrompt + ' cannot be blank.');
  // IQAssert( StrToFloat( AItem.EditText ) <> 0, FPrompt + ' cannot be zero.');

  AItem:= wwDataInspector1.GetItemByTagString( 'Startup Qty' );
  IQAssert( Assigned(AItem), 'Unable to identify ''Startup Qty'' row.');
  if Trim(AItem.EditText) > '' then
     IQAssert( IQMS.Common.Numbers.IsStringValidFloat( Trim(AItem.EditText), AValue ), 'Invalid Startup Qty - operation aborted.' );
end;

procedure TFrmPtsPer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPtsPer.SaveDataTo(var AOpmatParams: TOpmatParams);

  function GetDataInspectorValueOf( ATagString: string ): string;
  var
    AItem: TwwInspectorItem;
  begin
    AItem:= wwDataInspector1.GetItemByTagString( ATagString );
    if (AItem<>NIL) and Assigned( AItem ) then Result:= AItem.EditText else Result:= '';
  end;

  function SafeStrToFloat( S: string ): Real;
  begin
    if S = '' then Result:= 0 else Result:= StrToFloat( S );
  end;

begin
  AOpmatParams.PtsPer:= SafeStrToFloat( GetDataInspectorValueOf( 'Item Per' ));

  {for fab}
  AOpmatParams.Alloc_Req:= IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Allocation Required' ));

  {class = IN and PK}
  AOpmatParams.Scrap               := SafeStrToFloat ( GetDataInspectorValueOf( 'Scrap %'           ));
  AOpmatParams.Exclude_Scrap_Dispo := IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Exclude From Calc' ));
  AOpmatParams.Dispo_Cycles_Based  := IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Dispo By Cycles'   ));
  AOpmatParams.Exclude_Backflush   := IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Exclude Backflush' ));

  {class = PK}
  AOpmatParams.Weight              := SafeStrToFloat ( GetDataInspectorValueOf( 'Gross Weight'   ));
  AOpmatParams.Tare_Weight         := SafeStrToFloat ( GetDataInspectorValueOf( 'Tare Weight'    ));
  AOpmatParams.Returnable_Container:= IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Ret. Container' ));
  AOpmatParams.Verify_Asn_Qty      := IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf( 'Verify ASN Qty' ));

  AOpmatParams.StartupQty          := SafeStrToFloat( GetDataInspectorValueOf( 'Startup Qty' ));
  AOpmatParams.IncludeStartUpQtyStdCost:= IQMS.Common.Boolean.YNToBool( GetDataInspectorValueOf('Include Startup in Std Cost'));
end;

procedure TFrmPtsPer.SetAClass(const Value: string);
begin
  AssignInspectorItemVisibleByTagString( 'Packaging', (Value = 'PK'));
end;

procedure TFrmPtsPer.SetMfgType(const Value: string);
begin
  AssignInspectorItemVisibleByTagString( 'Allocation Required', (Value = 'FAB'));
end;

procedure TFrmPtsPer.SetOpmatParams(const Value: TOpmatParams);
begin
  LoadDataFrom( Value );
end;

procedure TFrmPtsPer.SetPrompt(const Value: string);
begin
  FPrompt := Value;
  AssignInspectorItemCaptionByTagString( 'Item Per', FPrompt);
end;

procedure TFrmPtsPer.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmPtsPer.LoadDataFrom(AOpmatParams: TOpmatParams);

  procedure AssignDataInspectorByTagString( ACaption, AValue: string );
  var
    AItem: TwwInspectorItem;
  begin
    AItem:= wwDataInspector1.GetItemByTagString( ACaption );
    if (AItem<>NIL) and Assigned( AItem ) then
       AItem.EditText:= AValue;
  end;

begin
  AssignDataInspectorByTagString( 'Item Per', FloatToStr( AOpmatParams.PtsPer ));

  {for FAB}
  AssignDataInspectorByTagString( 'Allocation Required', IQMS.Common.Boolean.BoolToYN( AOpmatParams.Alloc_Req ));

  {class = IN and PK}
  AssignDataInspectorByTagString( 'Scrap %'          , FloatToStr( AOpmatParams.Scrap              ));
  AssignDataInspectorByTagString( 'Exclude From Calc', IQMS.Common.Boolean.BoolToYN( AOpmatParams.Exclude_Scrap_Dispo));
  AssignDataInspectorByTagString( 'Dispo By Cycles'  , IQMS.Common.Boolean.BoolToYN( AOpmatParams.Dispo_Cycles_Based ));
  AssignDataInspectorByTagString( 'Exclude Backflush', IQMS.Common.Boolean.BoolToYN( AOpmatParams.Exclude_Backflush  ));

  {class = PK}
  AssignDataInspectorByTagString( 'Gross Weight'  , FloatToStr( AOpmatParams.Weight              ));
  AssignDataInspectorByTagString( 'Tare Weight'   , FloatToStr( AOpmatParams.Tare_Weight         ));
  AssignDataInspectorByTagString( 'Ret. Container', IQMS.Common.Boolean.BoolToYN( AOpmatParams.Returnable_Container));
  AssignDataInspectorByTagString( 'Verify ASN Qty', IQMS.Common.Boolean.BoolToYN( AOpmatParams.Verify_Asn_Qty      ));


  AssignDataInspectorByTagString( 'Startup Qty',    FloatToStr( AOpmatParams.StartupQty ));
  AssignDataInspectorByTagString( 'Verify ASN Qty', IQMS.Common.Boolean.BoolToYN( AOpmatParams.IncludeStartUpQtyStdCost   ));
end;

class procedure TFrmPtsPer.PopulateOpmatParamsFromOpmat( AOpmat_ID: Real; var AOpmatParams: TOpmatParams );
var
  A: Variant;
begin
  with AOpmatParams do
  begin
    PtsPer              := 0;
    Alloc_Req           := FALSE;
    Scrap               := 0;
    Exclude_Scrap_Dispo := FALSE;
    Dispo_Cycles_Based  := FALSE;
    Exclude_Backflush   := FALSE;
    Weight              := 0;
    Tare_Weight         := 0;
    Returnable_Container:= FALSE;
    Verify_Asn_Qty      := FALSE;
  end;

  if AOpmat_ID <= 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select PtsPer_Disp,          '+
                      '       Alloc_Req,            '+
                      '       Scrap,                '+
                      '       Exclude_Scrap_Dispo,  '+
                      '       Dispo_Cycles_Based,   '+
                      '       Exclude_Backflush,    '+
                      '       Weight,               '+
                      '       Tare_Weight,          '+
                      '       Returnable_Container, '+
                      '       Verify_Asn_Qty,       '+
                      '       startup_qty,          '+
                      '       include_startup_qty_std_cost '+
                      '   from opmat                '+
                      '  where id = %f              ',
                      [ AOpmat_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  with AOpmatParams do
  begin
    PtsPer              := A[ 0 ];
    Alloc_Req           := A[ 1 ] = 'Y';
    Scrap               := A[ 2 ];
    Exclude_Scrap_Dispo := A[ 3 ] = 'Y';
    Dispo_Cycles_Based  := A[ 4 ] = 'Y';
    Exclude_Backflush   := A[ 5 ] = 'Y';
    Weight              := A[ 6 ];
    Tare_Weight         := A[ 7 ];
    Returnable_Container:= A[ 8 ] = 'Y';
    Verify_Asn_Qty      := A[ 9 ] = 'Y';
    StartUpQty          := A[ 10 ];
    IncludeStartUpQtyStdCost:= A[ 11 ] = 'Y';
  end;
end;

procedure TFrmPtsPer.AssignInspectorItemVisibleByTagString(
  ATagString: string; AIsVisible: Boolean);
var
  AItem: TwwInspectorItem;
begin
  AItem :=  wwDataInspector1.GetItemByTagString(ATagString);
  if (AItem <> NIL) and Assigned( AItem ) then
     AItem.Visible:= AIsVisible;
end;

procedure TFrmPtsPer.AssignInspectorItemCaptionByTagString(ATagString,
  ACaption: String);
var
  AItem: TwwInspectorItem;
begin
  AItem :=  wwDataInspector1.GetItemByTagString(ATagString);
  if (AItem <> NIL) and Assigned( AItem ) then
     AItem.Caption := ACaption;
end;

end.
