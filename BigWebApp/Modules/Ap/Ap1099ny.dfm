object Frm1099NewYear: TFrm1099NewYear
  Left = 347
  Top = 222
  ClientHeight = 100
  ClientWidth = 299
  Caption = '1099 New Year'
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 4
    Top = 14
    Width = 168
    Height = 13
    Hint = ''
    Caption = 'Please Choose the new 1099 year:'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 4
    Top = 36
    Width = 57
    Height = 13
    Hint = ''
    Caption = 'Description:'
    TabOrder = 4
  end
  object edDescrip: TUniEdit
    Left = 75
    Top = 36
    Width = 220
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object seYear: TUniSpinEdit
    Left = 229
    Top = 9
    Width = 65
    Height = 22
    Hint = ''
    Value = 1900
    MaxValue = 2100
    MinValue = 1900
    TabOrder = 1
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 66
    Width = 299
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Left = 113
      Top = 1
      Width = 185
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 18
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 5
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Qry1099: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'begin'
      ''
      '  if :AEin_Id = 0 then'
      '    insert into ap1099_detail (vendor_id,'
      '                               vendor_vendorno,'
      '                               vendor_company,'
      '                               vendor_attn,'
      '                               vendor_addr1,'
      '                               vendor_addr2,'
      '                               vendor_addr3,'
      '                               vendor_city,'
      '                               vendor_state,'
      '                               vendor_zip,'
      '                               vendor_fed_tax_id,'
      '                               payers_name,'
      '                               payers_addr1,'
      '                               payers_addr2,'
      '                               payers_city,'
      '                               payers_state,'
      '                               payers_zip,'
      '                               payers_phone_number,'
      '                               payers_fed_tax_id,'
      '                               year,'
      '                               AP1099_YEARS_ID,'
      '                               Field9,'
      '                               Field7)'
      '                         select n.id         as vendor_id,'
      '                                n.vendorno   as vendor_vendorno,'
      '                                n.company    as vendor_company,'
      '                                n.attn       as vendor_attn,'
      '                                n.addr1      as vendor_addr1,'
      '                                n.addr2      as vendor_addr2,'
      '                                n.addr3      as vendor_addr3,'
      '                                n.city       as vendor_city,'
      '                                n.state      as vendor_state,'
      '                                n.zip        as vendor_zip,'
      
        '                                n.fed_tax_id as vendor_fed_tax_i' +
        'd,'
      '                                i.company    as payers_company,'
      '                                i.address1   as payear_addr1,'
      '                                i.address2   as payear_addr2,'
      '                                i.city       as payers_city,'
      '                                i.state      as payers_state,'
      '                                i.zip        as payers_zip,'
      
        '                                i.phone      as payers_phone_num' +
        'ber,'
      
        '                                i.fed_id     as payers_fed_tax_i' +
        'd,'
      '                                :ADate,'
      '                                :NID,'
      
        '                                decode(Sign(NVL(t.total_paid, 0)' +
        ' - 5000.01), -1, '#39'N'#39', '#39'Y'#39'),'
      '                                t.total_paid'
      '                           from vendor n,'
      '                                iqsys i,'
      '                                (select a.vendor_id,'
      
        '                                        Sum(v.amount_paid) as to' +
        'tal_paid'
      '                                   from apinvoice a,'
      '                                        (select q.apinvoice_id,'
      
        '                                                sum(NVL(q.amount' +
        '_paid, 0)) as amount_paid,'
      
        '                                                sum(NVL(q.ap_dis' +
        'count_taken, 0)) as discount_taken'
      '                                           from cheque_detail q,'
      '                                                cheque c'
      
        '                                          where NVL(q.apinvoice_' +
        'id, 0) <> 0'
      
        '                                            and q.cheque_id = c.' +
        'id'
      
        '                                            and c.check_status <' +
        '> '#39'VOID'#39
      
        '                                            and To_Char(c.check_' +
        'date, '#39'YYYY'#39') = :ADate'
      
        '                                          group by q.apinvoice_i' +
        'd) v'
      '                                  where a.id = v.apinvoice_id'
      '                                    and a.include_in_1099 = '#39'Y'#39
      '                                  group by a.vendor_id) t'
      
        '                          where n.id in (select distinct a.vendo' +
        'r_id'
      '                                         from apinvoice a,'
      
        '                                              (select q.apinvoic' +
        'e_id'
      
        '                                                 from cheque_det' +
        'ail q,'
      '                                                      cheque c'
      
        '                                                where NVL(q.apin' +
        'voice_id, 0) <> 0'
      
        '                                                  and q.cheque_i' +
        'd = c.id'
      
        '                                                  and c.check_st' +
        'atus <> '#39'VOID'#39
      
        '                                                  and To_Char(c.' +
        'check_date, '#39'YYYY'#39') = :ADate'
      
        '                                                group by q.apinv' +
        'oice_id) v'
      
        '                                       where a.id = v.apinvoice_' +
        'id)'
      '                             and n.id = t.vendor_id(+)'
      
        '                             and NVL(n.include_in_1099, '#39'N'#39') = '#39 +
        'Y'#39';'
      ''
      ''
      ''
      '  else'
      ''
      '    insert into ap1099_detail (vendor_id,'
      '                               vendor_vendorno,'
      '                               vendor_company,'
      '                               vendor_attn,'
      '                               vendor_addr1,'
      '                               vendor_addr2,'
      '                               vendor_addr3,'
      '                               vendor_city,'
      '                               vendor_state,'
      '                               vendor_zip,'
      '                               vendor_fed_tax_id,'
      '                               payers_name,'
      '                               payers_addr1,'
      '                               payers_addr2,'
      '                               payers_city,'
      '                               payers_state,'
      '                               payers_zip,'
      '                               payers_phone_number,'
      '                               payers_fed_tax_id,'
      '                               year,'
      '                               AP1099_YEARS_ID,'
      '                               Field9,'
      '                               Field7)'
      '                         select n.id         as vendor_id,'
      '                                n.vendorno   as vendor_vendorno,'
      '                                n.company    as vendor_company,'
      '                                n.attn       as vendor_attn,'
      '                                n.addr1      as vendor_addr1,'
      '                                n.addr2      as vendor_addr2,'
      '                                n.addr3      as vendor_addr3,'
      '                                n.city       as vendor_city,'
      '                                n.state      as vendor_state,'
      '                                n.zip        as vendor_zip,'
      
        '                                n.fed_tax_id as vendor_fed_tax_i' +
        'd,'
      '                                i.company    as payers_company,'
      '                                i.address1   as payear_addr1,'
      '                                i.address2   as payear_addr2,'
      '                                i.city       as payers_city,'
      '                                i.state      as payers_state,'
      '                                i.zip        as payers_zip,'
      
        '                                i.phone      as payers_phone_num' +
        'ber,'
      '                                :AEin_Descrip,'
      '                                :ADate,'
      '                                :NID,'
      
        '                                decode(Sign(NVL(t.total_paid, 0)' +
        ' - 5000.01), -1, '#39'N'#39', '#39'Y'#39'),'
      '                                t.total_paid'
      '                           from vendor n,'
      '                                iqsys i,'
      '                                (select a.vendor_id,'
      
        '                                        Sum(v.amount_paid) as to' +
        'tal_paid'
      '                                   from apinvoice a,'
      '                                        eplant e,'
      '                                        (select q.apinvoice_id,'
      
        '                                                sum(NVL(q.amount' +
        '_paid, 0)) as amount_paid,'
      
        '                                                sum(NVL(q.ap_dis' +
        'count_taken, 0)) as discount_taken'
      '                                           from cheque_detail q,'
      '                                                cheque c'
      
        '                                          where NVL(q.apinvoice_' +
        'id, 0) <> 0'
      
        '                                            and q.cheque_id = c.' +
        'id'
      
        '                                            and c.check_status <' +
        '> '#39'VOID'#39
      
        '                                            and To_Char(c.check_' +
        'date, '#39'YYYY'#39') = :ADate'
      
        '                                          group by q.apinvoice_i' +
        'd) v'
      '                                  where a.id = v.apinvoice_id'
      '                                    and a.include_in_1099 = '#39'Y'#39
      '                                    and a.eplant_id = e.id'
      '                                    and e.ein_id = :AEin_Id'
      '                                  group by a.vendor_id) t'
      
        '                          where n.id in (select distinct a.vendo' +
        'r_id'
      '                                         from apinvoice a,'
      '                                              eplant e,'
      
        '                                              (select q.apinvoic' +
        'e_id'
      
        '                                                 from cheque_det' +
        'ail q,'
      '                                                      cheque c'
      
        '                                                where NVL(q.apin' +
        'voice_id, 0) <> 0'
      
        '                                                  and q.cheque_i' +
        'd = c.id'
      
        '                                                  and c.check_st' +
        'atus <> '#39'VOID'#39
      
        '                                                  and To_Char(c.' +
        'check_date, '#39'YYYY'#39') = :ADate'
      
        '                                                group by q.apinv' +
        'oice_id) v'
      
        '                                       where a.id = v.apinvoice_' +
        'id'
      '                                         and a.eplant_id = e.id'
      
        '                                         and e.ein_id = :AEin_Id' +
        ')'
      '                             and n.id = t.vendor_id(+)'
      
        '                             and NVL(n.include_in_1099, '#39'N'#39') = '#39 +
        'Y'#39';'
      ''
      ''
      '  end if;'
      ''
      ''
      ''
      ''
      'end;'
      ''
      ' '
      ' ')
    Left = 32
    Top = 67
    ParamData = <
      item
        Name = 'AEin_Id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'AEin_Descrip'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'AEin_Id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'ADate'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'AEin_Id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object PkEin: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct e.id,'
      '                e.descrip'
      '  from ein e,'
      '       eplant p'
      ' where p.ein_id = e.id'
      '   and misc.eplant_filter(p.id) = 1'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 64
    Top = 66
    object PkEinID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.EIN.ID'
      Visible = False
      Size = 0
    end
    object PkEinDESCRIP: TStringField
      DisplayLabel = 'Fed ID'
      FieldName = 'DESCRIP'
      Origin = 'IQ.EIN.DESCRIP'
      Size = 15
    end
  end
end
