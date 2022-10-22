inherited FrmVoidCr: TFrmVoidCr
  ClientWidth = 539
  Caption = 'Void Cash Receipt'
  ExplicitWidth = 551
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 539
    ExplicitWidth = 539
    inherited Panel2: TUniPanel
      Left = 333
      ExplicitLeft = 333
    end
  end
  inherited PnlCarrier: TUniPanel
    Width = 539
    ExplicitWidth = 539
    inherited Splitter1: TUniSplitter
      Left = 201
      ExplicitLeft = 201
    end
    inherited PnlLeft: TUniPanel
      Width = 201
      ExplicitWidth = 201
      inherited LblReconstruct: TUniLabel
        Width = 169
        Caption = 'Reconstruct Cash Receipts Prepost'
        ExplicitWidth = 169
      end
    end
    inherited PnlClient: TUniPanel
      Left = 207
      Width = 332
      ExplicitLeft = 204
      ExplicitWidth = 335
      inherited EditVoidBy: TUniEdit
        Width = 330
        ExplicitWidth = 330
      end
      inherited MemoReason: TUniMemo
        Width = 330
        ExplicitWidth = 330
      end
    end
  end
  inherited TblGlPeriods: TFDTable
    Active = True
  end
  object QryInsCrVoid: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into cashrec_void (id,'
      '                          ref_no,'
      '                          deposit_date,'
      '                          ref_amount,'
      '                          bankinfo_dtl_id,'
      '                          glacct_id_cash,'
      '                          arcusto_id,'
      '                          ref_type,'
      '                          arcusto_custno,'
      '                          arcusto_company,'
      '                          arcusto_addr1,'
      '                          arcusto_addr2,'
      '                          arcusto_addr3,'
      '                          arcusto_city,'
      '                          arcusto_state,'
      '                          arcusto_country,'
      '                          arcusto_zip,'
      '                          glacct_acct,'
      '                          check_status,'
      '                          currency_id,'
      '                          currency_code,'
      '                          currency_descrip,'
      '                          fx_rate,'
      '                          eplant_id,'
      '                          bank_amount,'
      '                          exchange_rate,'
      '                          bankdep_currency_id,'
      '                          bankdep_currency_code,'
      '                          bankdep_currency_descrip,'
      '                          void_date,'
      '                          void_by,'
      '                          void_reason,'
      '                          glbatchid_id_void,'
      '                          bank_charge,'
      '                          glacct_id_bank,'
      '                          comment1)'
      ''
      '     select :nCrVoidId,'
      '            ref_no,'
      '            deposit_date,'
      '            ref_amount,'
      '            bankinfo_dtl_id,'
      '            glacct_id_cash,'
      '            arcusto_id,'
      '            ref_type,'
      '            arcusto_custno,'
      '            arcusto_company,'
      '            arcusto_addr1,'
      '            arcusto_addr2,'
      '            arcusto_addr3,'
      '            arcusto_city,'
      '            arcusto_state,'
      '            arcusto_country,'
      '            arcusto_zip,'
      '            glacct_acct,'
      '            check_status,'
      '            currency_id,'
      '            currency_code,'
      '            currency_descrip,'
      '            fx_rate,'
      '            eplant_id,'
      '            bank_amount,'
      '            exchange_rate,'
      '            bankdep_currency_id,'
      '            bankdep_currency_code,'
      '            bankdep_currency_descrip,'
      '            :dDate,'
      '            :cVoidBy,'
      '            :cReason,'
      '            :nGlBatchId_Id,'
      '            bank_charge,'
      '            glacct_id_bank,'
      '            comment1'
      '       from cashrec where id = :nCrId'
      '')
    Left = 184
    Top = 72
    ParamData = <
      item
        Name = 'nCrVoidId'
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
        Name = 'nCrId'
        DataType = ftFloat
      end>
  end
  object QryInsCrVoidDetail: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into cashrec_detail_void (cashrec_void_id,'
      '                                 arcusto_id,'
      '                                 arinvoice_id,'
      '                                 amount_applied,'
      '                                 discount_applied,'
      '                                 glacct_id_disc,'
      '                                 glacct_id_adjust,'
      '                                 arcusto_custno,'
      '                                 arcusto_company,'
      '                                 arcusto_addr1,'
      '                                 arcusto_addr2,'
      '                                 arcusto_addr3,'
      '                                 arcusto_city,'
      '                                 arcusto_state,'
      '                                 arcusto_country,'
      '                                 arcusto_zip,'
      '                                 reference,'
      '                                 ref_code_descrip,'
      '                                 ref_code_category,'
      '                                 ref_code,'
      '                                 ref_code_id,'
      '                                 comment1,'
      '                                 eplant_id)'
      '     select :nCrVoidId,'
      '            arcusto_id,'
      '            arinvoice_id,'
      '            amount_applied,'
      '            discount_applied,'
      '            glacct_id_disc,'
      '            glacct_id_adjust,'
      '            arcusto_custno,'
      '            arcusto_company,'
      '            arcusto_addr1,'
      '            arcusto_addr2,'
      '            arcusto_addr3,'
      '            arcusto_city,'
      '            arcusto_state,'
      '            arcusto_country,'
      '            arcusto_zip,'
      '            reference,'
      '            ref_code_descrip,'
      '            ref_code_category,'
      '            ref_code,'
      '            ref_code_id,'
      '            comment1,'
      '            eplant_id'
      '       from cashrec_detail'
      '      where cashrec_id = :nCrId'
      '')
    Left = 224
    Top = 72
    ParamData = <
      item
        Name = 'nCrVoidId'
        DataType = ftFloat
      end
      item
        Name = 'nCrId'
        DataType = ftFloat
      end>
  end
end
