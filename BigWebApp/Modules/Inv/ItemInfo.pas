unit ItemInfo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  Vcl.Buttons,
  ItemInfoFilter,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmItemInfo = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    pgctrlDetails: TUniPageControl;
    Splitter1: TUniSplitter;
    srchArinvt: TIQUniGridControl;
    shPurchased: TUniTabSheet;
    shManufactured: TUniTabSheet;
    srchPO: TIQUniGridControl;
    srchSO: TIQUniGridControl;
    wwSrcArinvt: TDataSource;
    wwQryArinvt: TFDQuery;
    wwQryArinvtCLASS: TStringField;
    wwQryArinvtITEMNO: TStringField;
    wwQryArinvtREV: TStringField;
    wwQryArinvtDESCRIP: TStringField;
    wwQryArinvtDESCRIP2: TStringField;
    wwQryArinvtUNIT: TStringField;
    wwQryArinvtEPLANT_ID: TBCDField;
    wwSrcPO: TDataSource;
    wwQryPO: TFDQuery;
    wwQryPOPONO: TStringField;
    wwQryPOPO_ID: TBCDField;
    wwQryPOPO_DETAIL_ID: TBCDField;
    wwQryPOARINVT_ID: TBCDField;
    wwQryPOTOTAL_QTY_ORD: TBCDField;
    wwQryPOQTY_RECEIVED: TBCDField;
    wwQryPOUNIT_PRICE: TFMTBCDField;
    wwQryPOPRICE_PER_1000: TFMTBCDField;
    wwQryPOPO_DATE: TDateTimeField;
    wwQryPOVENDOR_ID: TBCDField;
    wwQryPOVENDORNO: TStringField;
    wwQryPOVENDOR_NAME: TStringField;
    wwQryPOCONFIRM_TO: TStringField;
    wwQryPOSTATUS: TStringField;
    wwQryPOSOURCE: TStringField;
    wwQryArinvtARINVT_ID: TBCDField;
    wwSrcMfg: TDataSource;
    wwQrySO: TFDQuery;
    wwQrySOORDERS_ID: TBCDField;
    wwQrySOORD_DETAIL_ID: TBCDField;
    wwQrySOORDERNO: TStringField;
    wwQrySOPONO: TStringField;
    wwQrySOCUMM_SHIPPED: TBCDField;
    wwQrySOUNIT_PRICE: TFMTBCDField;
    wwQrySODATE_TAKEN: TDateTimeField;
    wwQrySOARCUSTO_ID: TBCDField;
    wwQrySOCUSTNO: TStringField;
    wwQrySOCOMPANY: TStringField;
    wwQrySOSOURCE: TStringField;
    wwQryArinvtSTANDARD_ID: TBCDField;
    wwQryArinvtMFGNO: TStringField;
    Panel3: TUniPanel;
    popmPO: TUniPopupMenu;
    IQJumpPO: TIQWebJump;
    IQJumpVendor: TIQWebJump;
    JumptoPO1: TUniMenuItem;
    JumptoVendor1: TUniMenuItem;
    popmSO: TUniPopupMenu;
    IQJumpOrdDetail: TIQWebJump;
    IQJumpCustomer: TIQWebJump;
    JumptoOrder1: TUniMenuItem;
    JumptoCustomer1: TUniMenuItem;
    sbtnFilter: TUniSpeedButton;
    wwQrySOTOTAL_QTY_ORD: TBCDField;
    wwQrySOPRICE_PER_1000: TFMTBCDField;
    wwQryPOArcRec: TFloatField;
    Panel4: TUniPanel;
    sbtnRefresh1: TUniSpeedButton;
    Panel5: TUniPanel;
    sbtnRefresh2: TUniSpeedButton;
    TabRMA: TUniTabSheet;
    TabVendRMA: TUniTabSheet;
    srchRMA: TIQUniGridControl;
    srchVendRMA: TIQUniGridControl;
    SrcRMA: TDataSource;
    wwQryRMA: TFDQuery;
    SrcVendRMA: TDataSource;
    wwQryVendRMA: TFDQuery;
    wwQryRMARMA_ID: TBCDField;
    wwQryRMARMANO: TStringField;
    wwQryRMAARCUSTO_ID: TBCDField;
    wwQryRMARMA_DATE: TDateTimeField;
    wwQryRMAUSERID: TStringField;
    wwQryRMACLOSED: TStringField;
    wwQryRMARMA_DETAIL_ID: TBCDField;
    wwQryRMAARINVT_ID: TBCDField;
    wwQryRMAQTYRETURNED: TFMTBCDField;
    wwQryRMACUSTNO: TStringField;
    wwQryRMACOMPANY: TStringField;
    popmRMA: TUniPopupMenu;
    JumpToRMA: TUniMenuItem;
    JumpToCustomerRMA: TUniMenuItem;
    IQJumpCustomerRMA: TIQWebJump;
    wwQryVendRMAVENDOR_RMA_ID: TBCDField;
    wwQryVendRMARMANO: TStringField;
    wwQryVendRMAVENDOR_ID: TBCDField;
    wwQryVendRMARMA_DATE: TDateTimeField;
    wwQryVendRMAUSERID: TStringField;
    wwQryVendRMACLOSED: TStringField;
    wwQryVendRMAVENDOR_RMA_DETAIL_ID: TBCDField;
    wwQryVendRMAARINVT_ID: TBCDField;
    wwQryVendRMAQTY_TO_RETURN: TBCDField;
    wwQryVendRMAVENDORNO: TStringField;
    wwQryVendRMACOMPANY: TStringField;
    popmVendRMA: TUniPopupMenu;
    JumptoVendorRMA: TUniMenuItem;
    JumptoVendor: TUniMenuItem;
    IQJumpVendorRma: TIQWebJump;
    wwQryRMAQTY_RECEIVED: TFMTBCDField;
    wwQryVendRMAQTY_RETURNED: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlDetailsChange(Sender: TObject);
    procedure JumptoVendor1Click(Sender: TObject);
    procedure JumptoPO1Click(Sender: TObject);
    procedure JumptoOrder1Click(Sender: TObject);
    procedure JumptoCustomer1Click(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure DoRefresh(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure wwQryArinvtBeforeOpen(DataSet: TDataSet);
    procedure wwQryPOBeforeOpen(DataSet: TDataSet);
    procedure wwSrcArinvtDataChange(Sender: TObject; Field: TField);
    procedure wwQryPOCalcFields(DataSet: TDataSet);
    procedure wwQryRMABeforeOpen(DataSet: TDataSet);
    procedure JumpToCustomerRMAClick(Sender: TObject);
    procedure JumpToRMAClick(Sender: TObject);
    procedure JumptoVendorRMAClick(Sender: TObject);
    procedure JumptoVendorClick(Sender: TObject);
    procedure wwQryVendRMABeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FItemInfoCargo: TItemInfoCargo;  {record in ItemInfoFilter.pas}
    FArinvtID:Real;
    FArinvt_ID: Real;
    procedure ReadParams;
    procedure WriteParams;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean;  var HintInfo: THintInfo );
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
  end;

procedure DoShowItemInfo(AArinvt_ID: Real = 0 );

implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Cursor,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;
{ TODO -oGPatil -cWebConvert : Dependency
  RMA_Main,
  Vend_Rma; }

procedure DoShowItemInfo(AArinvt_ID: Real = 0 );
var
  LFrmItemInfo : TFrmItemInfo;
begin
  LFrmItemInfo :=  TFrmItemInfo.Create(UniGUIApplication.UniApplication);
  LFrmItemInfo.Arinvt_ID := AArinvt_ID;
  LFrmItemInfo.Show;
end;

procedure TFrmItemInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
  Application.OnShowHint:= NIL;
  WriteParams;
end;

procedure TFrmItemInfo.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
  Application.OnShowHint:= DoOnShowHint;
end;

procedure TFrmItemInfo.pgctrlDetailsChange(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : navDetail deleted
  if pgctrlDetails.ActivePage = shManufactured then
     navDetail.DataSource:= srchSO.DataSource
  else if pgctrlDetails.ActivePage = shPurchased then
     navDetail.DataSource:= srchPO.DataSource
  else if pgctrlDetails.ActivePage = TabRMA then
     navDetail.DataSource:= srchRMA.DataSource
  else if pgctrlDetails.ActivePage = TabVendRMA then
     navDetail.DataSource:= srchVendRMA.DataSource;  }
end;

procedure TFrmItemInfo.JumptoVendor1Click(Sender: TObject);
begin
  IQJumpVendor.Execute;
end;

procedure TFrmItemInfo.JumptoPO1Click(Sender: TObject);
begin
  IQJumpPO.Execute;
end;

procedure TFrmItemInfo.JumptoOrder1Click(Sender: TObject);
begin
  IQJumpOrdDetail.Execute;
end;

procedure TFrmItemInfo.JumptoCustomer1Click(Sender: TObject);
begin
  IQJumpCustomer.Execute;
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmItemInfo.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
var
  AKeyField: string;
begin
  if Button = nbRefresh then
     with TUniDBNavigator(Sender) do
     begin
       if DataSource.DataSet = wwQryArinvt  then AKeyField:= 'ARINVT_ID'
       else if DataSource.DataSet = wwQryPO then AKeyField:= 'PO_DETAIL_ID'
       else if DataSource.DataSet = wwQrySO then AKeyField:= 'ORD_DETAIL_ID'
       else if DataSource.DataSet = wwQryRMA then AKeyField:= 'RMA_ID'
       else if DataSource.DataSet = wwQryVendRMA then AKeyField:= 'VENDOR_RMA_ID'
       else raise Exception.Create('Application Error:  Unable to determine key field in order to refresh dataset');

       RefreshDataSetByID( DataSource.DataSet, AKeyField );
       ABORT;
     end;
end; }

procedure TFrmItemInfo.DoRefresh(Sender: TObject);
  procedure RefreshDataSet( ADataSet: TFDQuery; AKeyFieldName: string );
  begin
    RefreshDataSetByID( ADataSet, AKeyFieldName );
  end;
begin
  if Sender = sbtnRefresh1 then
     RefreshDataSet( wwQryArinvt, 'ARINVT_ID' )
  else if Sender = sbtnRefresh2 then
     begin
       if pgctrlDetails.ActivePage = shManufactured then
          RefreshDataSet( wwQrySO, 'ORD_DETAIL_ID' )
       else if pgctrlDetails.ActivePage = shPurchased then
          RefreshDataSet( wwQryPO, 'PO_DETAIL_ID' )
       else if pgctrlDetails.ActivePage = TabRMA then
          RefreshDataSet( wwQryRMA, 'RMA_ID' )
       else if pgctrlDetails.ActivePage = TabVendRMA then
          RefreshDataSet( wwQryVendRMA, 'VENDOR_RMA_ID' )
     end
  else
     raise Exception.Create('Application Error:  Unable to determine key field in order to refresh dataset');
end;


procedure TFrmItemInfo.ReadParams;
var
  AInt : Integer;
begin
  with FItemInfoCargo do
  begin
    AInt:= 0;
{ TODO -oGPatil -cWebConvert : Invalid datatype for Scalalr Value
    if IQRegIntegerScalarRead( self, 'ItemInfoType', AInt ) then
       FType:= TItemInfoType(AInt)
    else
       FType:= TItemInfoType(0);

    AInt:= 0;
    if IQRegIntegerScalarRead( self, 'ItemInfoSource', AInt ) then
       FSource:= TItemInfoSource(AInt)
    else
       FSource:= TItemInfoSource(0);

    AInt:= 0;
    if IQRegIntegerScalarRead( self, 'ItemInfoPOStatus', AInt ) then
       FPOStatus:= TItemInfoPOStatus(AInt)
    else
       FPOStatus:= TItemInfoPOStatus(0);

    if not IQRegFloatScalarRead( self, 'Vendor_ID', FVendor_ID ) then
       FVendor_ID:= 0;

    if not IQRegFloatScalarRead( self, 'Arcusto_ID', FArcusto_ID ) then
       FArcusto_ID:= 0;

    if not IQRegDateTimeScalarRead( self, 'Date1', FDate1 ) then
       FDate1:= Date;

    if not IQRegDateTimeScalarRead( self, 'Date2', FDate2 ) then
       FDate2:= Date+90;     }
  end;
end;

procedure TFrmItemInfo.WriteParams;
begin
  with FItemInfoCargo do
  begin
    IQRegIntegerScalarWrite ( self, 'ItemInfoType',     Ord( FType     ));
    IQRegIntegerScalarWrite ( self, 'ItemInfoSource',   Ord( FSource   ));
    IQRegIntegerScalarWrite ( self, 'ItemInfoPOStatus', Ord( FPOStatus ));
    IQRegFloatScalarWrite   ( self, 'Vendor_ID',        FVendor_ID      );
    IQRegFloatScalarWrite   ( self, 'Arcusto_ID',       FArcusto_ID     );
    IQRegDateTimeScalarWrite( self, 'Date1',            FDate1          );
    IQRegDateTimeScalarWrite( self, 'Date2',            FDate2          );
  end;
end;

procedure TFrmItemInfo.DoOnShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
const
    ArrItemType   : array[0..2] of string = (inv_rscstr.cTXT0000094 {'Any'}, inv_rscstr.cTXT0000095 {'Purchased'}, inv_rscstr.cTXT0000096 {'Manufactured'});
    ArrItemSource : array[0..2] of string = (inv_rscstr.cTXT0000094 {'Any'}, inv_rscstr.cTXT0000097 {'Current'},   inv_rscstr.cTXT0000098 {'Archived'});
    ArrPOStatus   : array[0..2] of string = (inv_rscstr.cTXT0000094 {'Any'}, inv_rscstr.cTXT0000099 {'Open'},   inv_rscstr.cTXT0000100 {'Closed'});
var
  AVendor  : string;
  ACustomer: string;
begin
  with HintInfo, FItemInfoCargo do
    if HintControl = sbtnFilter then
    begin
       if FVendor_ID > 0 then
          AVendor:= SelectValueByID('company', 'vendor', FVendor_ID );
       if FArcusto_ID > 0 then
          ACustomer:= SelectValueByID('company', 'arcusto', FArcusto_ID );

       ReshowTimeout:= 6000;
       { 'Current Filter: '#13+
         '     Item Type: %s'#13+
         '     Source: %s'#13+
         '     Period: %s - %s'#13+
         '     PO Status: %s'#13+
         '     Vendor: %s'#13+
         '     Customer: %s'  }
       HintStr:= Format(  inv_rscstr.cTXT0000101,
                         [ ArrItemType  [ Ord(FType)   ],
                           ArrItemSource[ Ord(FSource) ],
                           DateToStr(FDate1),
                           DateToStr(FDate2),
                           ArrPOStatus  [ Ord( FPOStatus ) ],
                           IIf( FVendor_ID  = 0, inv_rscstr.cTXT0000102 {'Show All'}, AVendor  ),
                           IIf( FArcusto_ID = 0, inv_rscstr.cTXT0000102 {'Show All'}, ACustomer) ]);
    end;
end;

procedure TFrmItemInfo.sbtnFilterClick(Sender: TObject);
begin
  if DoGetItemInfoFilter( FItemInfoCargo ) then {ItemInfoFilter.pas}
    Reopen( wwQryArinvt );

  if FArinvtID > 0 then
     wwQryArinvt.Locate('arinvt_id', FArinvtID, []);

end;

procedure TFrmItemInfo.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
  if Value > 0 then
   wwQryArinvt.Locate('arinvt_id', Value, []);
end;

procedure TFrmItemInfo.UniFormCreate(Sender: TObject);
begin
  ReadParams;

  IQSetTablesActive( FALSE, self );
  IQSetTablesActive( TRUE,  self );
  IQRegFormRead(self, [self]);

  srchPO.DBGrid.Cursor      := crJump;
  srchSO.DBGrid.Cursor      := crJump;
  srchRMA.DBGrid.Cursor     := crJump;
  srchVendRMA.DBGrid.Cursor := crJump;
end;

procedure TFrmItemInfo.wwQryArinvtBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter(DataSet);
  with DataSet as TFDQuery do
    ParamByName('type').Value := Ord( FItemInfoCargo.FType  );         {0-All, 1-Purch,    2-Mfg }
end;

procedure TFrmItemInfo.wwQryPOBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('arinvt_id').Value := wwQryArinvtARINVT_ID.asFloat;

    ParamByName('source').Value := Ord( FItemInfoCargo.FSource );    {0-All, 1-Current, 2-Archived }
    ParamByName('date1').Value := FItemInfoCargo.FDate1;
    ParamByName('date2').Value := FItemInfoCargo.FDate2;

    if Params.FindParam('status') <> NIL then
       ParamByName('status').Value := Ord( FItemInfoCargo.FPOStatus ); {0-All, 1-Open, 2-Closed }

    if Params.FindParam('arcusto_id') <> NIL then
      ParamByName('arcusto_id').Value := FItemInfoCargo.FArcusto_ID;

    if Params.FindParam('vendor_id') <> NIL then
       ParamByName('vendor_id').Value := FItemInfoCargo.FVendor_ID;
  end;
end;

procedure TFrmItemInfo.wwSrcArinvtDataChange(Sender: TObject;  Field: TField);
begin
  if not Assigned(Sender) then
     EXIT;

  if (pgctrlDetails.ActivePage = shManufactured) or (pgctrlDetails.ActivePage = shPurchased)
  then
  begin
    if wwQryArinvtSTANDARD_ID.asFloat > 0 then
       pgctrlDetails.ActivePage:= shManufactured
    else
       pgctrlDetails.ActivePage:= shPurchased;
  end;


  wwQrySO.Close;
  wwQrySO.Open;
  IQRegFormRead(self, [ srchSO ]);
//  Reopen(wwQrySO);
//  Reopen(wwQryPO);
  wwQryPO.Close;
  wwQryPO.Open;
  IQRegFormRead(self, [ srchPO ]);

  wwQryRMA.Close;
  wwQryRMA.Open;
  IQRegFormRead(self, [ srchRMA ]);

  wwQryVendRMA.Close;
  wwQryVendRMA.Open;
  IQRegFormRead(self, [ srchVendRMA ]);

  pgctrlDetailsChange( NIL );
end;

procedure TFrmItemInfo.wwQryPOCalcFields(DataSet: TDataSet);
begin
  if wwQryPOSOURCE.asString = 'ARCHIVED' then
    wwQryPOArcRec.asFloat := SelectValueFmtAsFloat('select sum(qty_received) from  po_receipts where po_detail_id = %f',
                                        [wwQryPOPO_DETAIL_ID.asFloat]);
end;

procedure TFrmItemInfo.wwQryRMABeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('arinvt_id').Value := wwQryArinvtARINVT_ID.asFloat;

    ParamByName('date1').Value := FItemInfoCargo.FDate1;
    ParamByName('date2').Value := FItemInfoCargo.FDate2;

    if Params.FindParam('status') <> NIL then
       ParamByName('status').Value := Ord( FItemInfoCargo.FPOStatus ); {0-All, 1-Open, 2-Closed }

    if Params.FindParam('arcusto_id') <> NIL then
      ParamByName('arcusto_id').Value := FItemInfoCargo.FArcusto_ID;

  end;

end;

procedure TFrmItemInfo.JumpToCustomerRMAClick(Sender: TObject);
begin
  IQJumpCustomerRMA.Execute;
end;

procedure TFrmItemInfo.JumpToRMAClick(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  rma_main.DoJumpToRMADetail(self, wwQryRMARMA_DETAIL_ID.asFloat);  }
end;

procedure TFrmItemInfo.JumptoVendorRMAClick(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency
  vend_rma.DoJumpToRMADetail(self, wwQryVendRMAVENDOR_RMA_DETAIL_ID.asFloat); }
end;

procedure TFrmItemInfo.JumptoVendorClick(Sender: TObject);
begin
  IQJumpVendorRma.Execute;
end;

procedure TFrmItemInfo.wwQryVendRMABeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('arinvt_id').Value := wwQryArinvtARINVT_ID.asFloat;

    ParamByName('date1').Value := FItemInfoCargo.FDate1;
    ParamByName('date2').Value := FItemInfoCargo.FDate2;

    if Params.FindParam('status') <> NIL then
       ParamByName('status').Value := Ord( FItemInfoCargo.FPOStatus ); {0-All, 1-Open, 2-Closed }

    if Params.FindParam('vendor_id') <> NIL then
      ParamByName('vendor_id').Value := FItemInfoCargo.FVendor_ID;

  end;

end;

end.
