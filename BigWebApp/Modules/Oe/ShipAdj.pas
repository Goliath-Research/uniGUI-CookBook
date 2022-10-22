unit ShipAdj;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  System.Variants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TCumShipAdjustment = record
    Ship_To_ID_1: Real;
    Value_1     : Real;
    Ship_To_ID_2: Real;
    Value_2     : Real;
    Note     :String;
  end;

  TFrmAdjustShipment = class(TUniForm)
    QryShipments: TFDQuery;
    SrcOrd_Detail_Cum_Ship: TDataSource;
    QryCum: TFDQuery;
    QryCumID: TBCDField;
    QryCumORD_DETAIL_ID: TBCDField;
    QryCumSHIP_TO_ID: TBCDField;
    QryCumQUAN: TBCDField;
    UpdateSQLOrd_Detail_Cum_Ship: TFDUpdateSQL;
    wwDBGrid1: TIQUniGridControl;
    PkShipTo: TIQWebHPick;
    PkShipToID: TBCDField;
    PkShipToPRIME_CONTACT: TStringField;
    PkShipToATTN: TStringField;
    PkShipToADDR1: TStringField;
    PkShipToADDR2: TStringField;
    PkShipToADDR3: TStringField;
    PkShipToCITY: TStringField;
    PkShipToSTATE: TStringField;
    PkShipToCOUNTRY: TStringField;
    PkShipToZIP: TStringField;
    PkShipToPHONE_NUMBER: TStringField;
    PkShipToEXT: TStringField;
    PkShipToFAX: TStringField;
    PkShipToECODE: TStringField;
    PkShipToEPLANT_ID: TBCDField;
    QryCumShip_To_Info: TStringField;
    wwDBComboBoxShipTo: TUniDBComboBox;
    QryCumShip_Quan: TFloatField;
    QryCumDelta_Qty: TFloatField;
    QryCumCURR_QUAN: TBCDField;
    Bevel1: TUniPanel;
    QryCumNOTE: TStringField;
    cmbGridNote: TUniEdit;
    procedure FormActivate(Sender: TObject);
    procedure QryCumCalcFields(DataSet: TDataSet);
    procedure wwDBComboBoxShipToDropDown(Sender: TObject);
    procedure PkShipToBeforeOpen(DataSet: TDataSet);
    procedure QryCumNewRecord(DataSet: TDataSet);
    procedure QryCumBeforePost(DataSet: TDataSet);
    procedure QryCumAfterPost(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure NavMainBeforeAction(Sender: TObject;
      Button: TNavigateBtn);    }
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCumBeforeOpen(DataSet: TDataSet);
    procedure QryCumUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure cmbGridNoteCustomDlg(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOrd_Detail_ID  : Real;
    FDefault_Ship_To_ID: Real;

    FAdjustment     : Real;
    function  InsertShipments( AShip_To_ID: Real; ANote:String ):Real;

    function GetShipToInfo( AShip_To_ID: Real ): string;
    procedure AddToStrDelimited( var AMainStr: string; ASubStr: string; ASeparator: string = ' ' );
    function ConfirmAdjustment(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAdjustment: TCumShipAdjustment ): Boolean;
    procedure AdjustShip( AShip_To_ID, AQty: Real; ANote:String );
    procedure SetOrd_Detail_ID(const Value: Real);
  public
    { Public declarations }
    property Ord_Detail_ID: Real write SetOrd_Detail_ID;
  end;

procedure DoManualShipmentAjustment( AOrd_Detail_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils;

procedure DoManualShipmentAjustment(AOrd_Detail_ID:Real);
var
  LFrmAdjustShipment : TFrmAdjustShipment;
begin
  LFrmAdjustShipment := TFrmAdjustShipment.Create(UniGUIApplication.UniApplication);
  LFrmAdjustShipment.Ord_Detail_ID := AOrd_Detail_ID;
  LFrmAdjustShipment.ShowModal;
end;

procedure TFrmAdjustShipment.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  wwDBComboBoxShipTo.Visible := False;
  cmbGridNote.Visible := False;
end;

procedure TFrmAdjustShipment.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

function TFrmAdjustShipment.InsertShipments( AShip_To_ID: Real; ANote:String ):Real;
var
  A          : Variant;
  APackSlipNo: string;
  AEplantID  : string;
begin
  A:= SelectValueArrayFmt( 'select bill_to_id, id, fob, eplant_id ' +
                      '  from orders where id = (select orders_id from ord_detail where id = %f)', [ FOrd_Detail_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to locate Sales Order based on Order Detail ID = %.0f', [ FOrd_Detail_ID ]));

  Result     := GetNextID('SHIPMENTS');
  AEplantID  := A[ 3 ];
  APackSlipNo:= GetEPlantNextSequenceNumberA( AEplantId,  'PS', 'S_PACKSLIPNO' );  {IQSeq}

  QryShipments.Close;
  QryShipments.ParamByName('nPackSlipNo').AsString:= APackSlipNo;
  QryShipments.ParamByName('cShipDate').AsDate    := Date;
  QryShipments.ParamByName('cPSDate').AsDate      := Date;
  QryShipments.ParamByName('gBillToId').AsFloat   := A[ 0 ];
  QryShipments.ParamByName('gOrderId').AsFloat    := A[ 1 ];
  QryShipments.ParamByName('gShipToId').AsFloat   := AShip_To_ID;
  QryShipments.ParamByName('nShipmentId').AsFloat := Result;
  QryShipments.ParamByName('cFob').AsString       := A[ 2 ];
  QryShipments.ParamByName('AComment').AsString   := ANote;
  QryShipments.ExecSQL;
end;

procedure TFrmAdjustShipment.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAdjustShipment.QryCumCalcFields(DataSet: TDataSet);
begin
  {Ship-To Addr}
  QryCumShip_To_Info.asString:= GetShipToInfo( QryCumSHIP_TO_ID.asFloat );

  {Cumulative shipped based on shipmebts}
  QryCumShip_Quan.asFloat:= SelectValueFmtAsFloat('select sum(qtyshipped) from c_ship_hist '+
                                      ' where ord_detail_id = %f and NVL(ship_to_id, %f) = %f '+
                                      '   and NVL(shipment_type, ''*'') <> ''CUM SHIP ADJUSTMENT''',
                                      [ FOrd_Detail_ID,
                                        FDefault_Ship_To_ID,
                                        QryCumSHIP_TO_ID.asFloat ]);

  QryCumDelta_Qty.asFloat:= QryCumQUAN.asFloat - QryCumCURR_QUAN.asFloat;
end;

procedure TFrmAdjustShipment.AddToStrDelimited( var AMainStr: string; ASubStr: string; ASeparator: string = ' ' );
begin
  if Trim(ASubStr) = '' then
     EXIT;
  if AMainStr = '' then
     AMainStr:= ASubStr
  else
     AMainStr:= AMainStr + StrTran( ASeparator + ' ', '  ', ' ') + ASubStr;
end;

function TFrmAdjustShipment.GetShipToInfo( AShip_To_ID: Real ): string;
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select RTrim(attn),     '+
                      '       RTrim(addr1),    '+
                      '       RTrim(city),     '+
                      '       RTrim(state),    '+
                      '       RTrim(country),  '+
                      '       RTrim(zip)       '+
                      '  from ship_to   '+
                      ' where id = %f   ', [ AShip_To_ID ]);
  if VarArrayDimCount( A ) = 0 then
     EXIT;

  Result:= '';
  AddToStrDelimited( Result, A[ 0 ]);
  AddToStrDelimited( Result, A[ 1 ], ',');
  AddToStrDelimited( Result, A[ 2 ]);
  AddToStrDelimited( Result, A[ 3 ]);
  AddToStrDelimited( Result, A[ 4 ]);
  AddToStrDelimited( Result, A[ 5 ]);
end;

procedure TFrmAdjustShipment.wwDBComboBoxShipToDropDown(Sender: TObject);
begin
  with PkShipTo do
    if Execute then
    begin
      QryCum.Edit;
      QryCumSHIP_TO_ID.asFloat:= GetValue('ID');
    end;
end;

procedure TFrmAdjustShipment.PkShipToBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
  with DataSet as TFDQuery do
    ParamByName('arcusto_id').asFloat:= SelectValueFmtAsFloat('select o.arcusto_id from orders o, ord_detail d '+
                                                  ' where o.id = d.orders_id and d.id = %f', [ FOrd_Detail_ID ]);
end;

procedure TFrmAdjustShipment.QryCumNewRecord(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    FieldByName('ord_detail_id').asFloat:= FOrd_Detail_ID;
    FieldByName('ship_to_id').asFloat   := FDefault_Ship_To_ID;
  end;
end;

procedure TFrmAdjustShipment.QryCumBeforePost(DataSet: TDataSet);
begin
  if QryCumID.asFloat = 0 then
     QryCumID.asFloat:= GetNextID('ord_detail_cum_ship');
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmAdjustShipment.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;  }

procedure TFrmAdjustShipment.QryCumAfterPost(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
  RefreshDataSetByID( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmAdjustShipment.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
     EXIT;

  if wwDBGrid1.ColumnByName(Field.FieldName).ReadOnly then
     EXIT;

  ABrush.Color:= clWindow;
end;     }

procedure TFrmAdjustShipment.QryCumBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('ord_detail_id').asFloat:= FOrd_Detail_ID;
end;

procedure TFrmAdjustShipment.QryCumUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
var
  AAdjustment: TCumShipAdjustment;
begin
  if not ConfirmAdjustment( ASender, ARequest, AAdjustment ) then
  begin
    AAction := eaExitFailure;
    EXIT;
  end;

  UpdateSQLOrd_Detail_Cum_Ship.Apply( ARequest, AAction, AOptions);
  //IQApplyCachedUpdate(UpdateSQLOrd_Detail_Cum_Ship, UpdateKind);

  with AAdjustment do
  begin
    if Ship_To_ID_1 > 0 then
       AdjustShip( Ship_To_ID_1, Value_1, Note );

    if Ship_To_ID_2 > 0 then
       AdjustShip( Ship_To_ID_2, Value_2, Note );
  end;

  AAction := eaApplied;
end;

procedure TFrmAdjustShipment.SetOrd_Detail_ID(const Value: Real);
begin
  FOrd_Detail_ID := Value;
  FDefault_Ship_To_ID:= SelectValueFmtAsFloat('select o.ship_to_id from orders o, ord_detail d where d.id = %f and d.orders_id = o.id', [ FOrd_Detail_ID ]);
end;

procedure TFrmAdjustShipment.UniFormCreate(Sender: TObject);
begin
  QryCum.Close;
  IQSetTablesActive(TRUE, self);
end;

function TFrmAdjustShipment.ConfirmAdjustment(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAdjustment: TCumShipAdjustment ): Boolean;
const
  C_INDENT = '     ';
var
  S: string;
  AOldValue:Real;
  function FormatShipToInfo( AShip_To_ID: Real ): string;
  var
    A: Variant;
  begin
    A:= SelectValueArrayFmt( 'select RTrim(attn),     '+
                        '       RTrim(addr1),    '+
                        '       RTrim(city),     '+
                        '       RTrim(state),    '+
                        '       RTrim(country),  '+
                        '       RTrim(zip)       '+
                        '  from ship_to   '+
                        ' where id = %f   ', [ AShip_To_ID ]);
    IQAssert( VarArrayDimCount( A ) > 0, Format('Invalid Ship-To ID = %.0f', [ AShip_To_ID ]));

    Result:= 'Ship-To: '#13;
    AddToStrDelimited( Result, C_INDENT + A[ 0 ] + #13 );
    AddToStrDelimited( Result, C_INDENT + A[ 1 ] + #13 );
    AddToStrDelimited( Result, C_INDENT + A[ 2 ] + #13 );
    AddToStrDelimited( Result, C_INDENT + A[ 3 ]       );
    AddToStrDelimited( Result,            A[ 4 ]       );
    AddToStrDelimited( Result,            A[ 5 ] + #13 );
  end;
begin
  // Initial
  AOldValue := 0;

  with AAdjustment do
  begin
    Ship_To_ID_1:= 0;
    Ship_To_ID_2:= 0;
  end;

  if not System.Variants.VarIsNull(ASender.FieldByName('quan').OldValue) then
  try
    AOldValue := GetOldValueAsReal(ASender.FieldByName('quan'));
  except
    AOldValue := 0;
  end;

  with ASender do
    case ARequest of
      arUpdate:
         begin
           if GetOldValueAsReal(FieldByName('ship_to_id')) <> GetNewValueAsReal(FieldByName('ship_to_id')) then
              begin
                AAdjustment.Note := RTrim(FieldByName('Note').AsString);
                AAdjustment.Ship_To_ID_1:= GetOldValueAsReal(FieldByName('ship_to_id'));
                AAdjustment.Value_1     := - AOldValue;
//                AAdjustment.Value_1     := - FieldByName('quan').OldValue;

                AAdjustment.Ship_To_ID_2:= GetNewValueAsReal(FieldByName('ship_to_id'));
                AAdjustment.Value_2     := GetNewValueAsReal(FieldByName('quan'));
              end
           else
//              if FieldByName('quan').NewValue - FieldByName('quan').OldValue <> 0 then
              if GetNewValueAsReal(FieldByName('quan')) - AOldValue <> 0 then
              begin
                AAdjustment.Note := RTrim(FieldByName('Note').AsString);
                AAdjustment.Ship_To_ID_1:= GetNewValueAsReal(FieldByName('ship_to_id'));
                AAdjustment.Value_1     := GetNewValueAsReal(FieldByName('quan')) - AOldValue;
//                AAdjustment.Value_1     := FieldByName('quan').NewValue - FieldByName('quan').OldValue;
              end
         end;
      arInsert:
         begin
              AAdjustment.Note := RTrim(FieldByName('Note').AsString);
              AAdjustment.Ship_To_ID_1 := GetNewValueAsReal(FieldByName('ship_to_id'));
              AAdjustment.Value_1      := GetNewValueAsReal(FieldByName('quan'));
         end;
      arDelete:
         begin
              AAdjustment.Note := RTrim(FieldByName('Note').AsString);
              AAdjustment.Ship_To_ID_1:= GetOldValueAsReal(FieldByName('ship_to_id'));
              AAdjustment.Value_1     := - AOldValue;
//              AAdjustment.Value_1     := - FieldByName('quan').OldValue;
         end;
    end;

  if (AAdjustment.Ship_To_ID_1 = 0) and (AAdjustment.Ship_To_ID_2 = 0) then
  begin
     Result:= TRUE;
     EXIT;
  end;

  S:= 'Shipments are about to be adjusted as following '#13#13;

  if AAdjustment.Ship_To_ID_1 > 0 then
  begin
     S:= S + FormatShipToInfo( AAdjustment.Ship_To_ID_1 );
     S:= S + 'To be adjusted by: ' + FloatToStr( AAdjustment.Value_1 ) + #13#13
  end;

  if AAdjustment.Ship_To_ID_2 > 0 then
  begin
     S:= S + FormatShipToInfo( AAdjustment.Ship_To_ID_2 );
     S:= S + 'To be adjusted by: ' + FloatToStr( AAdjustment.Value_2 ) + #13#13
  end;

  S:= S + #13'Are you sure you wish to continue?';

  Result:= IQConfirmYN( S );
end;

procedure TFrmAdjustShipment.AdjustShip( AShip_To_ID, AQty: Real; ANote:String );
var
  AShipment_Dtl_ID: Real;
  AShipments_ID   : Real;
begin
  if (AQty = 0) or (AShip_To_ID = 0) then EXIT; {s/n happen}

//  AShipment_Dtl_ID:= SelectValueFmtAsFloat('select d.id from shipment_dtl d, shipments s '+
//                               ' where d.shipments_id = s.id ' +
//                               '   and NVL(s.shipment_type, '' '') = ''CUM SHIP ADJUSTMENT'' '+
//                               '   and d.order_dtl_id = %f '+
//                               '   and NVL(s.ship_to_id, %f) = %f',
//                               [ FOrd_Detail_ID,
//                                 FDefault_Ship_To_ID,
//                                 AShip_To_ID ]);

//  if AShipment_Dtl_ID = 0 then
//     begin
//       AShipments_ID:= InsertShipments( AShip_To_ID );
//       ExecuteCommandFmt('insert into shipment_dtl (shipments_id, order_dtl_id, qtyshipped, shipment_type) ' +
//                 'values (%f, %f, %f, ''CUM SHIP ADJUSTMENT'') ',
//                 [ AShipments_ID, FOrd_Detail_ID, AQty ]);
//     end
//  else
//     ExecuteCommandFmt('update shipment_dtl set qtyshipped = NVL(qtyshipped,0) + %f where id = %f ', [ AQty, AShipment_Dtl_ID ]);

  AShipments_ID:= InsertShipments( AShip_To_ID, ANote );
  ExecuteCommandFmt('insert into shipment_dtl (shipments_id, order_dtl_id, qtyshipped, shipment_type) ' +
            'values (%f, %f, %f, ''CUM SHIP ADJUSTMENT'') ',
            [ AShipments_ID, FOrd_Detail_ID, AQty ]);


  {Update releases vs shipments}
  ExecuteCommandFmt('begin shipment.update_releases_ship_date( %f ); end;', [ FOrd_Detail_ID ]);

  {Update ord_detail.cumm_shipped. Obsolete in Oracle 7 - just remove it - the trigger will automatically maintain it}
  ExecuteCommandFmt('update ord_detail '+
            '   set cumm_shipped = (select sum(quan) from ord_detail_cum_ship where ord_detail_id = %f) ' +
            ' where id = %f',
            [ FOrd_Detail_ID,
              FOrd_Detail_ID ]);
end;

procedure TFrmAdjustShipment.cmbGridNoteCustomDlg(Sender: TObject);
begin
  IQMS.Common.EditMemoStr.DoDBEditMemoStr(QryCumNOTE, SrcOrd_Detail_Cum_Ship);
end;

end.
