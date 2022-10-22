object FrmVoidArInvoice: TFrmVoidArInvoice
  Left = 400
  Top = 227
  HelpContext = 1003845
  ClientHeight = 214
  ClientWidth = 646
  Caption = 'Void AR Invoice'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 184
    Width = 646
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 440
      Top = 1
      Width = 206
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 23
      object BtnOk: TUniButton
        Left = 3
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 108
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 646
    Height = 184
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 171
    object Splitter1: TUniSplitter
      Left = 185
      Top = 0
      Width = 6
      Height = 184
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 171
    end
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 182
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 169
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'Date'
        TabOrder = 1
      end
      object Label9: TUniLabel
        Left = 8
        Top = 37
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Period'
        TabOrder = 2
      end
      object Label2: TUniLabel
        Left = 8
        Top = 60
        Width = 47
        Height = 13
        Hint = ''
        Caption = 'Voided By'
        TabOrder = 3
      end
      object Label3: TUniLabel
        Left = 8
        Top = 84
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'Reason'
        TabOrder = 4
      end
      object LblReconstruct: TUniLabel
        Left = 8
        Top = 143
        Width = 153
        Height = 13
        Hint = ''
        Caption = 'Reconstruct AR Prepost Invoice'
        TabOrder = 5
      end
    end
    object PnlClient: TUniPanel
      Left = 191
      Top = 1
      Width = 455
      Height = 182
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 169
      DesignSize = (
        455
        182)
      object EditDate: TUniDBDateTimePicker
        Left = 1
        Top = 8
        Width = 153
        Height = 21
        Hint = ''
        DateTime = 42656.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object DBEditPeriod: TUniEdit
        Left = 1
        Top = 32
        Width = 153
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object EditVoidBy: TUniEdit
        Left = 1
        Top = 56
        Width = 453
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object MemoReason: TUniMemo
        Left = 1
        Top = 80
        Width = 453
        Height = 57
        Hint = ''
        Lines.Strings = (
          '')
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object cbReconstruct: TUniCheckBox
        Left = 4
        Top = 141
        Width = 21
        Height = 17
        Hint = ''
        Caption = ''
        TabOrder = 4
      end
    end
  end
  object SrcGlPeriods: TDataSource
    DataSet = TblGlPeriods
    Left = 240
    Top = 80
  end
  object TblGlPeriods: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'GLPERIODS'
    TableName = 'GLPERIODS'
    Left = 256
    Top = 88
    object TblGlPeriodsID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsGLYEAR_ID: TBCDField
      FieldName = 'GLYEAR_ID'
      Required = True
      Size = 0
    end
    object TblGlPeriodsPERIOD: TBCDField
      FieldName = 'PERIOD'
      Required = True
      Size = 0
    end
    object TblGlPeriodsSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Required = True
    end
    object TblGlPeriodsEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Required = True
    end
    object TblGlPeriodsSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 2
    end
  end
  object QryInsArinvoiceVoid: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into arinvoice_void (id,'
      '                            glacct_id_ar,'
      '                            arcusto_id,'
      '                            bill_to_id,'
      '                            invoice_no,'
      '                            invoice_date,'
      '                            terms_id,'
      '                            due_date,'
      '                            notes,'
      '                            glperiods_id_ar,'
      '                            prior_entry,'
      '                            glbatchid_id,'
      '                            void_date,'
      '                            void_by,'
      '                            void_reason,'
      '                            glbatchid_id_void,'
      '                            glperiods_id_ar_void,'
      '                            arcusto_custno,'
      '                            arcusto_company,'
      '                            arcusto_addr1,'
      '                            arcusto_addr2,'
      '                            arcusto_addr3,'
      '                            arcusto_city,'
      '                            arcusto_state,'
      '                            arcusto_country,'
      '                            arcusto_zip,'
      '                            bill_to_attn,'
      '                            bill_to_addr1,'
      '                            bill_to_addr2,'
      '                            bill_to_addr3,'
      '                            bill_to_city,'
      '                            bill_to_state,'
      '                            bill_to_country,'
      '                            bill_to_zip,'
      '                            terms_descrip,'
      '                            terms_days,'
      '                            terms_discount,'
      '                            terms_discount_days,'
      '                            ecode,'
      '                            eid,'
      '                            edate_time,'
      '                            ecopy,'
      '                            inv_prefix,'
      '                            GLACCT_ID_FX,'
      '                            CURRENCY_ID,'
      '                            FX_RATE,'
      '                            arinvoice_id,'
      '                            eplant_id,'
      '                            ctrl_eplant_id,'
      '                            EXCLUDE_FROM_FIN_CHARGE,'
      '                            arcusto_credit_card_id,'
      '                            arcusto_credit_card_acctno,'
      '                            arcusto_credit_card_name_on,'
      '                            arcusto_credit_card_exp_mmyy,'
      '                            dunning_exclude,'
      '                            dunning_seq,'
      '                            NUM_OF_SUPP_DOCS,'
      '                            cuser1,'
      '                            cuser2,'
      '                            cuser3,'
      '                            cia_invoice,'
      '                            userid_posted,'
      '                            invoicetotal)'
      '                     select :nArinvoiceVoid_Id,'
      '                            glacct_id_ar,'
      '                            arcusto_id,'
      '                            bill_to_id,'
      '                            invoice_no,'
      '                            invoice_date,'
      '                            terms_id,'
      '                            due_date,'
      '                            notes,'
      '                            glperiods_id_ar,'
      '                            prior_entry,'
      '                            glbatchid_id,'
      '                            :dVoidDate,'
      '                            :cVoidBy,'
      '                            :cReason,'
      '                            :nGlBatchId_Id,'
      '                            :nGlPeriods_Id,'
      '                            arcusto_custno,'
      '                            arcusto_company,'
      '                            arcusto_addr1,'
      '                            arcusto_addr2,'
      '                            arcusto_addr3,'
      '                            arcusto_city,'
      '                            arcusto_state,'
      '                            arcusto_country,'
      '                            arcusto_zip,'
      '                            bill_to_attn,'
      '                            bill_to_addr1,'
      '                            bill_to_addr2,'
      '                            bill_to_addr3,'
      '                            bill_to_city,'
      '                            bill_to_state,'
      '                            bill_to_country,'
      '                            bill_to_zip,'
      '                            terms_descrip,'
      '                            terms_days,'
      '                            terms_discount,'
      '                            terms_discount_days,'
      '                            ecode,'
      '                            eid,'
      '                            edate_time,'
      '                            ecopy,'
      '                            inv_prefix,'
      '                            GLACCT_ID_FX,'
      '                            CURRENCY_ID,'
      '                            FX_RATE,'
      '                            arinvoice_id,'
      '                            eplant_id,'
      '                            ctrl_eplant_id,'
      '                            EXCLUDE_FROM_FIN_CHARGE,'
      '                            arcusto_credit_card_id,'
      '                            arcusto_credit_card_acctno,'
      '                            arcusto_credit_card_name_on,'
      '                            arcusto_credit_card_exp_mmyy,'
      '                            dunning_exclude,'
      '                            dunning_seq,'
      '                            NUM_OF_SUPP_DOCS,'
      '                            cuser1,'
      '                            cuser2,'
      '                            cuser3,'
      '                            cia_invoice,'
      '                            userid_posted,'
      '                            invoicetotal'
      '                       from arinvoice'
      '                      where id = :nArInvoice_Id'
      ''
      '')
    Left = 88
    Top = 72
    ParamData = <
      item
        Name = 'nArinvoiceVoid_Id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'dVoidDate'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'cVoidBy'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cReason'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'nGlBatchId_Id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'nGlPeriods_Id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'nArInvoice_Id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryInsArinvoiceDetailVoid: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into arinvoice_detail_void (id,'
      '                                   arinvoice_void_id,'
      '                                   shipment_dtl_id,'
      '                                   shipment_dtl_id2,'
      '                                   ord_detail_id,'
      '                                   invoice_qty,'
      '                                   unit_price,'
      '                                   glacct_id_sales,'
      '                                   freight_id,'
      '                                   tax_code_id,'
      '                                   salespeople_id,'
      '                                   freight_price,'
      '                                   arinvt_id,'
      '                                   misc_comment,'
      '                                   comm_pcnt,'
      '                                   salespeople_sales_code,'
      '                                   arinvt_class,'
      '                                   arinvt_itemno,'
      '                                   arinvt_rev,'
      '                                   arinvt_descrip,'
      '                                   arinvt_descrip2,'
      '                                   freight_descrip,'
      '                                   reference,'
      '                                   ref_code_descrip,'
      '                                   ref_code_category,'
      '                                   ref_code,'
      '                                   ref_code_id,'
      '                                   price_per_1000,'
      '                                   price_per_1000_YN,'
      '                                   cust_itemno,'
      '                                   cust_descrip,'
      '                                   cust_rev,'
      '                                   std_cost,'
      '                                   eplant_id,'
      '                                   rma_detail_id,'
      '                                   cm_arinvoice_id,'
      '                                   vmi_reference,'
      '                                   no_post_std_cost,'
      '                                   PO_RECEIPTS_ID,'
      '                                   glacct_id_freight,'
      '                                   rebate_params_id,'
      '                                   TOTAL_REBATE,'
      '                                   REBATE_CALC_DATE,'
      '                                   PONO_FROM_SO,'
      '                                   LIST_UNIT_PRICE,'
      '                                   DISCOUNT,'
      '                                   FREIGHT_REV_AMOUNT,'
      '                                   FREIGHT_REV_PCNT,'
      '                                   ACCT_ID_FREIGHT_REV,'
      '                                   orig_freight_price,'
      '                                   include_freight,'
      '                                   tax_rate,'
      '                                   ship_to_id,'
      '                                   misc_orders_id )'
      '                            select :nId,'
      '                                   :nArInvoiceVoid_Id,'
      '                                   shipment_dtl_id,'
      '                                   shipment_dtl_id2,'
      '                                   ord_detail_id,'
      '                                   invoice_qty,'
      '                                   unit_price,'
      '                                   glacct_id_sales,'
      '                                   freight_id,'
      '                                   tax_code_id,'
      '                                   salespeople_id,'
      '                                   freight_price,'
      '                                   arinvt_id,'
      '                                   misc_comment,'
      '                                   comm_pcnt,'
      '                                   salespeople_sales_code,'
      '                                   arinvt_class,'
      '                                   arinvt_itemno,'
      '                                   arinvt_rev,'
      '                                   arinvt_descrip,'
      '                                   arinvt_descrip2,'
      '                                   freight_descrip,'
      '                                   reference,'
      '                                   ref_code_descrip,'
      '                                   ref_code_category,'
      '                                   ref_code,'
      '                                   ref_code_id,'
      '                                   price_per_1000,'
      '                                   price_per_1000_YN,'
      '                                   cust_itemno,'
      '                                   cust_descrip,'
      '                                   cust_rev,'
      '                                   std_cost,'
      '                                   eplant_id,'
      '                                   rma_detail_id,'
      '                                   cm_arinvoice_id,'
      '                                   vmi_reference,'
      '                                   no_post_std_cost,'
      '                                   PO_RECEIPTS_ID,'
      '                                   glacct_id_freight,'
      '                                   rebate_params_id,'
      '                                   TOTAL_REBATE,'
      '                                   REBATE_CALC_DATE,'
      '                                   PONO_FROM_SO,'
      '                                   LIST_UNIT_PRICE,'
      '                                   DISCOUNT,'
      '                                   FREIGHT_REV_AMOUNT,'
      '                                   FREIGHT_REV_PCNT,'
      '                                   ACCT_ID_FREIGHT_REV,'
      '                                   orig_freight_price,'
      '                                   include_freight,'
      '                                   tax_rate,'
      '                                   ship_to_id,'
      '                                   misc_orders_id'
      '                              from arinvoice_detail'
      '                             where id = :nArInvoiceDetail_Id'
      ''
      '')
    Left = 136
    Top = 72
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
      end
      item
        Name = 'nArInvoiceVoid_Id'
        DataType = ftFloat
      end
      item
        Name = 'nArInvoiceDetail_Id'
        DataType = ftFloat
      end>
  end
end
