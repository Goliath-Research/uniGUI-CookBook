unit EdiTblClasses;

interface
uses
  DB;


type
  TEDI_TABLE = class
  TABLENAME:String;
  ID: Real;

  TABLE_STATE:TDataSetState;

  procedure Post;
  procedure Edit;
end;

type
  TEDI_TABLE_HDR_DETAIL = class(TEDI_TABLE)
  ST_ATTN:String;
  BT_ATTN:String;
  ST_QUALIFIER:String;
  BT_QUALIFIER:String;
  ST_ID_CODE:String;
  BT_ID_CODE:String;
  INTER_CONSIGN:String;
  SUPPLIER_CODE:String;
  PONO:String;
  ST_ADDR1:String;
  BT_ADDR1:String;
  ST_ADDR2:String;
  ST_ADDR3:String;
  BT_ADDR2:String;
  ST_CITY:String;
  ST_STATE:String;
  ST_ZIP:String;
  BT_CITY:String;
  BT_STATE:String;
  BT_ZIP:String;
  DOCKID:String;
  LINEFEED:String;
  ReserveLocation:String;
  EMAIL_ADDRESS:String;
  PER_NAME:String;
  FAX_NUMBER:String;
  PHONE_NUMBER:String;
  QTY:Real;
  UNIT_PRICE:Real;
  CUMULATIVE:String;

end;

type
  TEDI_TS_HDR = class(TEDI_TABLE_HDR_DETAIL)
  EDI_ISA_HEDAER_ID: Real;
  TRANSACTION_SET_ID:String;
  GS06:String;
  EDI_PRINT_FILE:String;
  PURPOSE_CODE:String;
  RELEASE_NUMBER:String;
  DATE_TYPE:String;
  HORIZON_START_DATE:TDateTime;
  HORIZON_END_DATE:TDateTime;
  ST02:String;
  SCHEDULE_QUALIFIER:String;
  ORD_DATE:TDateTime;
  NTE_LINE:String;

  procedure InsertRecord(AEdi_Isa_Header_Id:Real);
end;

type
  TEDI_ORD_DETAIL = class(TEDI_TABLE_HDR_DETAIL)
  EDI_TS_HDR_ID: Real;
  NTE_LINE:String;
  DOCID:String;
  st_attn:String;
  aka_ptno:String;
  st_id_code:String;
  LAST_RECEIPT_DATE:TDateTime;
  cust_cum_ath_pq:Real;
  cust_cum_SHP_start:Real;
  LAST_RECEIPT_QTY:Real;
  EDI_OUT_LOG_ID:Real;
  PT_DESCRIP:String;
  ORD_DET_SEQNO:Real;
  ENG_CHANGE_LEVEL:String;
  UOM:String;
  KBTrigger:String;
  DESCRIP2:String;
  COMMENT1:String;
  CRPREPOST_DETAIL_ID:Real;
  fab_qty:Real;
  raw_mt_qty:Real;
  FAB_Start_Date:TDateTime;

  procedure InsertRecord(AEdi_Ts_Hdr_Id:Real);
end;

type
  TEDI_SHIP = class(TEDI_TABLE)
  EDI_ORD_DETAIL_ID: Real;
  INTRANSIT:Real;
  DELQUAN:Real;
  DELDATE:TDateTime;
  FORECAST:String;
  TIMING_QUALIFIER:String;
  DELORDERNO:String;
  JIT:String;

  procedure InsertRecord(AEDI_ORD_DETAIL_ID:Real);
end;




implementation
uses
  IQMS.Common.DataLib;


{ TEDI_TS_HDR }

procedure TEDI_TABLE.Post;
begin
  TABLE_STATE := dsBrowse;
end;

procedure TEDI_TABLE.Edit;
begin
  TABLE_STATE := dsEdit;
end;

procedure TEDI_TS_HDR.InsertRecord(AEdi_Isa_Header_Id:Real);
begin
  EDI_ISA_HEDAER_ID := AEdi_Isa_Header_Id;
  TABLENAME         := 'EDI_TS_HDR';
  TABLE_STATE := dsInsert;
end;

procedure TEDI_ORD_DETAIL.InsertRecord(AEDI_TS_HDR_ID:Real);
begin
  EDI_TS_HDR_ID := AEDI_TS_HDR_ID;
  TABLENAME     := 'EDI_ORD_DETAIL';
  TABLE_STATE := dsInsert;
end;

procedure TEDI_SHIP.InsertRecord(AEDI_ORD_DETAIL_ID:Real);
begin
  EDI_ORD_DETAIL_ID := AEDI_ORD_DETAIL_ID;
  TABLENAME     := 'EDI_SHIP';
  TABLE_STATE := dsInsert;
end;

end.
