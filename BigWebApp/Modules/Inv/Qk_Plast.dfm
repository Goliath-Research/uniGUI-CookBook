inherited QuickAddPlastic: TQuickAddPlastic
  HelpContext = 1182778
  Caption = 'Quick Add'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited PnlClient01: TUniPanel
        inherited Splitter1: TUniSplitter
          ExplicitHeight = 199
        end
        inherited PnlClient02: TUniPanel
          inherited dbcUNIT: TUniDBComboBox
            Items.Strings = (
              'EACH'
              'LBS'
              'KG'
              'GALL'
              'ROLL'
              'FT'
              'IN')
          end
        end
      end
    end
    inherited TabCostElem: TUniTabSheet
      inherited pnlStdCostGrid: TUniPanel
        inherited Panel9: TUniPanel
          inherited NavCost: TUniDBNavigator
          end
        end
      end
    end
  end
  inherited FDUpdateSQLArinvt: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO ARINVT'
      '(ID, CLASS, ITEMNO, REV, DESCRIP, DESCRIP2, '
      '  UNIT, LEAD_DAYS, LEAD_TIME, SPG, NON_MATERIAL, '
      '  GAUGE)'
      
        'VALUES (:NEW_ID, :NEW_CLASS, :NEW_ITEMNO, nvl(:NEW_REV, '#39' '#39'), :N' +
        'EW_DESCRIP, :NEW_DESCRIP2, '
      
        '  :NEW_UNIT, :NEW_LEAD_DAYS, :NEW_LEAD_TIME, :NEW_SPG, :NEW_NON_' +
        'MATERIAL, '
      '  :NEW_GAUGE)')
    ModifySQL.Strings = (
      'UPDATE ARINVT'
      
        'SET ID = :NEW_ID, CLASS = :NEW_CLASS, ITEMNO = :NEW_ITEMNO, REV ' +
        '= :NEW_REV, '
      
        '  DESCRIP = :NEW_DESCRIP, DESCRIP2 = :NEW_DESCRIP2, UNIT = :NEW_' +
        'UNIT, '
      '  LEAD_DAYS = :NEW_LEAD_DAYS, LEAD_TIME = :NEW_LEAD_TIME, '
      
        '  SPG = :NEW_SPG, NON_MATERIAL = :NEW_NON_MATERIAL, GAUGE = :NEW' +
        '_GAUGE'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARCUSTO_ID, CLASS, ITEMNO, REV, DESCRIP, DESCRIP2, AV' +
        'G_COST, '
      '  VENDOR_ID, UNIT, BLEND, CUSER1, CUSER2, CUSER3, NUSER1, '
      '  NUSER2, NUSER3, BOM_ACTIVE, ONHAND, RG_ONHAND, NON_SALABLE, '
      '  NON_CONFORM_TOTAL, SERIALIZED, SAFETY_STOCK, MIN_ORDER_QTY, '
      
        '  MAX_ORDER_QTY, MULTIPLE, YTDQTY, PTDQTY, CODE, LDATE, LBUY_DAT' +
        'E, '
      '  "TYPE" AS "TYPE", SERIES, LEAD_DAYS, LEAD_TIME, SPG, DRYTIME, '
      '  DRYTEMP, RGPRCNT, AUTO_MJO, MFG_QUAN, AUX_AMT, STDQUAN, '
      
        '  LOW_LEVEL_CODE, MPS_CODE, ARINVT_FAMILY_ID, BACKFLUSH, DRAWING' +
        ', '
      
        '  ECNO, STD_PRICE, STD_COST, STANDARD_ID, ACCT_ID_SALES, ACCT_ID' +
        '_INV, '
      
        '  MFG_SPLIT, PRICE_PER_1000, COMIS_PRCNT, UNQUE_DATE_IN, SHELF_L' +
        'IFE, '
      '  ECODE, EID, EDATE_TIME, ECOPY, ACCT_ID_PPV, ACCT_ID_OH_DISPO, '
      '  ACCT_ID_LABOR_DISPO, ACCT_ID_HOLDING, ITEM_TYPE_ID, NMFC_ID, '
      
        '  VOLUME, AUTO_MRP_REORD_POINT, AUTO_MRP_ORDER_QTY, AUTO_MRP_LEA' +
        'D_DAYS, '
      
        '  EPLANT_ID, COMMISSIONS_ID, STD_COST_CONTROL, PO_SCOPE, PO_SAFE' +
        'TY, '
      '  PO_MOVE_RANGE, LM_IMAGE_FILENAME, CYCLE_COUNT_CODE, CUSER4, '
      '  CUSER5, CUSER6, CUSER7, CUSER8, CUSER9, CUSER10, NUSER4, '
      
        '  NUSER5, NUSER6, NUSER7, NUSER8, NUSER9, NUSER10, PROCESS_SAFET' +
        'Y_STOCK, '
      
        '  MX_GROUP_ID, FR_GROUP_ID, SETUP_CHARGE, MOVE_TIME, CARTONS_PAL' +
        'LET, '
      
        '  PIECES_CARTON, AUTO_MRP_FIRM_WO, FLOOR_BACKFLUSH, MPS, CUM_LEA' +
        'DTIME, '
      '  PHANTOM, CRITICAL_FENCE, USER_NAME, PK_HIDE, ACCT_ID_PRODVAR, '
      
        '  PHANTOM_ONHAND, LM_LABELS_ID, DRIVE_PHANTOM_NEGATIVE, NO_STDCO' +
        'ST_RECALC, '
      '  ACCT_ID_INTPLANT_SALES, IMAGE_FILENAME, NON_ALLOCATE_TOTAL, '
      
        '  INSP_RECEIPT_THRES, INSP_RECEIPT_COUNT, COST_STANDARD_ID_FUTUR' +
        'E, '
      
        '  COST_STANDARD_ID, COST_DESCRIP_FUTURE, COST_DESCRIP, COST_CALC' +
        '_DATE_FUTURE, '
      
        '  COST_CALC_DATE, AUTO_MRP_INCLUDE_VMI, PROD_CODE_ID, DO_NOT_DIS' +
        'PO_FLOOR_PARTIAL, '
      '  INFO_SO, INFO_PO, EXCL_RECEIPT_TIME_PPV, CYCLE_COUNT_ID, '
      '  CYCLE_COUNT_DATE, NON_MATERIAL, MFG_MIN_QTY, MFG_MULTIPLE, '
      '  BUYER_CODE_ID, COST_CALC_BATCH, INTRASTAT_CODE, FAB_START, '
      '  MFG_SAFETY_QTY, PLANNER_CODE_ID, IS_LOT_MANDATORY, PK_WEIGHT, '
      
        '  PK_PTSPER, DO_NOT_SCHED_FORECAST_WO, IS_PALLET, IS_AUTO_RT_LAB' +
        'ELS, '
      
        '  IS_LINKED_TO_SERIAL, FR_INCLUDE, MIN_CPK, LBL_ASSIST_LAST_PRIN' +
        'T, '
      '  LBL_ASSIST_PRINT_INTERVAL, COC_EXCLUDE, ICT_REORD_POINT, '
      '  ICT_REPLENISH_SCOPE_DAYS, ICT_LEAD_DAYS, ICT_SHIP_TO_ID, '
      '  AUTO_MRP_KANBAN_LOT_SIZE, ICT_FIRE_TRIGGER, COLOR_GROUP_ID, '
      
        '  FR_WO_TIME_FENCE, PK_LENGTH, PK_WIDTH, PK_HEIGHT, PALLET_LENGT' +
        'H, '
      '  PALLET_WIDTH, PALLET_HEIGHT, PALLET_VOLUME, PALLET_PTSPER, '
      
        '  PALLET_WEIGHT, LENGTH, WIDTH, GAUGE, IS_BY_PRODUCT, EXCLUDE_FR' +
        'OM_COMMISSIONS, '
      
        '  AUTO_RT_LABELS_PK_SEQ, PALLET_PATTERN_ID, WEB_SALABLE, PO_MULT' +
        'IPLE, '
      
        '  FIFO_THRESHOLD, COST_STANDARD_ID_FORECAST, COST_STANDARD_ID_BU' +
        'DGET, '
      
        '  COST_DESCRIP_FORECAST, COST_DESCRIP_BUDGET, COST_CALC_DATE_FOR' +
        'ECAST, '
      
        '  COST_CALC_DATE_BUDGET, KEEP_LABEL_BOM_INTERPLANT_TRAN, ECO_ORI' +
        'G_CLASS, '
      
        '  INFO_REC, ACCT_ID_WIP, IRV32_NO_PLAN_WO, IS_LOT_DATE_MANDATORY' +
        ', '
      '  USE_THIS_UOM_FOR_MRP, BOL_CALC_OVERRIDE, RFQ_USE_STD_COST, '
      
        '  ACCT_ID_PHYS_VAR, ACCT_ID_INV_COST_REV, WAIT_TIME, EXCLUDE_BAC' +
        'KFLUSH, '
      '  NONTAXABLE, ACCT_ID_SHIPMENT, AUTO_MRP_EXCLUDE_HARD_ALLOC, '
      
        '  MIN_PPK, RUN_RULES, REBATE_PARAMS_ID, TARIFF_CODE_ID, WEBDIREC' +
        'T_LEAD_DAYS, '
      
        '  USE_COST_DEFAULT_STANDARD_ID, ARINVT_GROUP_ID, CLONED_FROM_ARI' +
        'NVT_ID, '
      
        '  USE_LOT_CHARGE, LOT_CHARGE, AUTO_POP_SERV_CTR, UNIQUE_DISPO_LO' +
        'C, '
      
        '  RTPM_TRG_RTLABEL, EXCL_MARK_WO_MAT_XCPT, AUTO_MRP_INCLUDE_VMI_' +
        'MFG_CALC, '
      
        '  HEIJUNKA_SINCE_SCHED_DEMAND, CONFIG_CODE, FR_WO_SCOPE, AUTO_MR' +
        'P_APPLY_TO_SCHED_ALLOC, '
      '  SCHED_CASCADE_PARENT_MTO, PHANTOM_COMPONENTS_ON_SO, IS_ALC, '
      
        '  MARK_ORD_DETAIL_MTO, ENFORCE_LOT_FIFO, IS_DROP_SHIP, MAX_PALLE' +
        'T_STACK, '
      
        '  LOOSE_INV_MOVE_CLASS_ID, PACK_INV_MOVE_CLASS_ID, PALLET_INV_MO' +
        'VE_CLASS_ID, '
      '  PK_UNIT_TYPE, LOOSE_MOVE_RANK_COUNT, PACK_MOVE_RANK_COUNT, '
      '  PALLET_MOVE_RANK_COUNT, MSDS_AUTHORABLE, EXCL_WORKORDER_MAT, '
      
        '  NONTAXABLE_PO, FIFO, COMPANY_ID, RECV_LOCATION_ID, SPC_INSPECT' +
        'ION_ID, '
      
        '  OVERRIDE_REC_LOC, AR_DISCOUNT_WATERFALL_ID, EXCL_FROM_CTP_EXCE' +
        'PTION, '
      
        '  LBL_LAST_PRINT, CORE_SIZE, OD, PS_CONVERT_INFO, LOOSE_MOVE_RAN' +
        'K_LOCK, '
      '  PACK_MOVE_RANK_LOCK, PALLET_MOVE_RANK_LOCK, WMS_INV_GROUP_ID, '
      
        '  CYCLE_COUNT_RANK_LOCK, MIN_SELL_QTY, INSP_LEAD_DAYS, IS_LOT_EX' +
        'PIRY_DATE_MANDATORY, '
      
        '  LOOSE_WEIGHT, LOOSE_VOLUME, LOOSE_LENGTH, LOOSE_WIDTH, LOOSE_H' +
        'EIGHT, '
      
        '  ICT_TRUCK_PTSPER, SAFETY_STOCK2, COST_CALC_USER_NAME, IS_MSDS,' +
        ' '
      
        '  MSDS_UPLOAD, SHELF_LIFE2, ICT_AUTO_MRP_ORDER_QTY, ICT_SHIP_PUL' +
        'L_DEMAND, '
      
        '  PLT_WRP_USE_QC, PLT_WRP_LOC_ID, GROUP_CODE, PROPRIETARY_EFFECT' +
        '_DATE, '
      
        '  PROPRIETARY_DEACTIVE_DATE, DEMAND_CHANGE, HARD_ALLOC_ROUND_PRE' +
        'CISION, '
      
        '  DISCOUNT_GROUPS_ID, TAX_CLASS_ID, PHYS_CHAR_VOLUME, BACKFLUSH_' +
        'BY_SERIAL, '
      
        '  CAROUSEL_TARGET_ID, CAROUSEL_OPERATOR, PHANTOM_KIT_USE_COMP_PR' +
        'ICE'
      'FROM ARINVT'
      'WHERE ID = :ID')
  end
end
