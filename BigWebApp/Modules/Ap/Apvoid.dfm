inherited FrmVoidApInvoice: TFrmVoidApInvoice
  HelpContext = 0
  Caption = 'Void AP Invoice'
  ExplicitWidth = 652
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 186
    Height = 28
    ExplicitTop = 186
    ExplicitHeight = 28
    inherited Panel2: TUniPanel
      Left = 437
      Width = 208
      Height = 26
      ExplicitLeft = 437
      ExplicitWidth = 208
      ExplicitHeight = 26
    end
  end
  inherited PnlCarrier: TUniPanel
    Height = 186
    ExplicitHeight = 186
    inherited Splitter1: TUniSplitter
      Height = 184
      ExplicitLeft = 186
      ExplicitTop = 1
      ExplicitHeight = 184
    end
    inherited PnlLeft: TUniPanel
      Height = 184
      ExplicitHeight = 184
    end
    inherited PnlClient: TUniPanel
      Height = 184
      ExplicitLeft = 192
      ExplicitWidth = 453
      ExplicitHeight = 184
    end
  end
  object QryInsApinvoiceVoid: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into apinvoice_void (id,'
      '                            vendor_id,'
      '                            invoice_no,'
      '                            reference,'
      '                            invoice_amount,'
      '                            terms_id,'
      '                            invoice_date,'
      '                            due_date,'
      '                            glacct_id_ap,'
      '                            glbatchid_id,'
      '                            glperiods_id_ap,'
      '                            prior_entry,'
      '                            on_hold,'
      '                            void_date,'
      '                            void_by,'
      '                            void_reason,'
      '                            glbatchid_id_void,'
      '                            glperiods_id_ap_void,'
      '                            terms_descrip,'
      '                            terms_days,'
      '                            terms_discount,'
      '                            terms_discount_days,'
      '                            vendor_company,'
      '                            include_in_1099,'
      '                            A1099_CODE,'
      '                            remit_to_id,'
      '                            remit_to_attn,'
      '                            GLACCT_ID_FX,'
      '                            CURRENCY_ID,'
      '                            FX_RATE,'
      '                            USERID,'
      '                            eplant_id,'
      '                            disc_date,'
      '                            ap_group,'
      '                            disc_amount,'
      '                           vendorno,'
      '                           addr1,'
      '                           addr2,'
      '                           addr3,'
      '                           city,'
      '                           state,'
      '                           country,'
      '                           zip,'
      '                           FX_REVALUE_RATE,'
      '                           NUM_OF_SUPP_DOCS,'
      '                           CHEQUE_ID,'
      '                           cuser1,'
      '                           cuser2,'
      '                           cuser3,'
      '                           sequence_no,'
      '                           exp_header_id,'
      '                           apinvoice_id,'
      '                           auto_invoice,'
      '                           APPREPOST_ID,'
      '                           APPROVAL_REQUIRED,'
      '                           APPROVED,'
      '                           userid_posted)'
      '     select :nApInvoiceVoidId,'
      '            vendor_id,'
      '            invoice_no,'
      '            reference,'
      '            invoice_amount,'
      '            terms_id,'
      '            invoice_date,'
      '            due_date,'
      '            glacct_id_ap,'
      '            glbatchid_id,'
      '            glperiods_id_ap,'
      '            prior_entry,'
      '            on_hold,'
      '            :dDate,'
      '            :cVoidBy,'
      '            :cReason,'
      '            :nGlBatchId_Id,'
      '            :nGlPeriodsId,'
      '            terms_descrip,'
      '            terms_days,'
      '            terms_discount,'
      '            terms_discount_days,'
      '            vendor_company,'
      '            include_in_1099,'
      '            A1099_CODE,'
      '            remit_to_id,'
      '            remit_to_attn,'
      '            GLACCT_ID_FX,'
      '            CURRENCY_ID,'
      '            FX_RATE,'
      '            USERID,'
      '            eplant_id,'
      '            disc_date,'
      '            ap_group,'
      '            disc_amount,'
      '            vendorno,'
      '            addr1,'
      '            addr2,'
      '            addr3,'
      '            city,'
      '            state,'
      '            country,'
      '            zip,'
      '            FX_REVALUE_RATE,'
      '            NUM_OF_SUPP_DOCS,'
      '            CHEQUE_ID,'
      '            cuser1,'
      '            cuser2,'
      '            cuser3,'
      '            sequence_no,'
      '            exp_header_id,'
      '            apinvoice_id,'
      '            auto_invoice,'
      '            APPREPOST_ID,'
      '            APPROVAL_REQUIRED,'
      '            APPROVED,'
      '            userid_posted'
      '       from apinvoice where id = :nApInvoiceId'
      '')
    Left = 184
    Top = 64
    ParamData = <
      item
        Name = 'nApInvoiceVoidId'
        DataType = ftFloat
      end
      item
        Name = 'dDate'
        DataType = ftDate
      end
      item
        Name = 'cVoidBy'
        DataType = ftString
      end
      item
        Name = 'cReason'
        DataType = ftString
      end
      item
        Name = 'nGlBatchId_Id'
        DataType = ftFloat
      end
      item
        Name = 'nGlPeriodsId'
        DataType = ftFloat
      end
      item
        Name = 'nApInvoiceId'
        DataType = ftFloat
      end>
  end
  object QryInsApinvoiceVoidDetail: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into apinvoice_detail_void (apinvoice_void_id,'
      '                                   amount_distributed,'
      '                                   glacct_id_expense,'
      '                                   cost_object_id,'
      '                                   po_detail_id,'
      '                                   qty_invoiced,'
      '                                   unit_cost,'
      '                                   std_cost,'
      '                                   arinvt_itemno,'
      '                                   arinvt_rev,'
      '                                   arinvt_class,'
      '                                   arinvt_descrip,'
      '                                   arinvt_descrip2,'
      '                                   misc_comment,'
      '                                   reference,'
      '                                   ref_code_descrip,'
      '                                   ref_code_category,'
      '                                   ref_code,'
      '                                   ref_code_id,'
      '                                   glacct_id_ppv,'
      '                                   applydisc,'
      '                                   cost_object_source,'
      '                                   tax_code_id,'
      '                                   tax_rate,'
      '                                   vendor_rma_detail_id,'
      '                                   freight_id,'
      '                                   freight_price,'
      '                                   freight_descrip,'
      '                                   FREIGHT_INCL_IN_STDCOST,'
      '                                   ppvamount)'
      '     select :nApInvoiceVoidId,'
      '            amount_distributed,'
      '            glacct_id_expense,'
      '            cost_object_id,'
      '            po_detail_id,'
      '            qty_invoiced,'
      '            unit_cost,'
      '            std_cost,'
      '            arinvt_itemno,'
      '            arinvt_rev,'
      '            arinvt_class,'
      '            arinvt_descrip,'
      '            arinvt_descrip2,'
      '            misc_comment,'
      '            reference,'
      '            ref_code_descrip,'
      '            ref_code_category,'
      '            ref_code,'
      '            ref_code_id,'
      '            glacct_id_ppv,'
      '            applydisc,'
      '            cost_object_source,'
      '            tax_code_id,'
      '            tax_rate,'
      '            vendor_rma_detail_id,'
      '            freight_id,'
      '            freight_price,'
      '            freight_descrip,'
      '            FREIGHT_INCL_IN_STDCOST,'
      '            iq_apinvoice_fx.GetPPVAmountPosted(id)'
      '       from apinvoice_detail'
      '      where apinvoice_id = :nApInvoiceId'
      ''
      '')
    Left = 224
    Top = 72
    ParamData = <
      item
        Name = 'nApInvoiceVoidId'
        DataType = ftFloat
      end
      item
        Name = 'nApInvoiceId'
        DataType = ftFloat
      end>
  end
end
