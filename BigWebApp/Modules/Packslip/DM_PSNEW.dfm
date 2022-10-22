object PSNew_DM: TPSNew_DM
  OldCreateOrder = True
  Height = 479
  Width = 741
  object QryShipments: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into shipments'
      '  (id,'
      '   to_invoice,'
      '   packslipno,'
      '   fob,'
      '   userid,'
      '   shipdate,'
      '   ps_date,'
      '   arcusto_id,'
      '   arcusto_custno,'
      '   arcusto_company,'
      '   arcusto_addr1,'
      '   arcusto_addr2,'
      '   arcusto_addr3,'
      '   arcusto_city,'
      '   arcusto_state,'
      '   arcusto_country,'
      '   arcusto_zip,'
      '   arcusto_phone_number,'
      '   arcusto_ext,'
      '   arcusto_fax_number,'
      '   arcusto_prime_contact,'
      '   ship_to_attn,'
      '   ship_to_addr1,'
      '   ship_to_addr2,'
      '   ship_to_addr3,'
      '   ship_to_city,'
      '   ship_to_state,'
      '   ship_to_country,'
      '   ship_to_zip,'
      '   ship_to_ship_time,'
      '   ship_to_tax_code_id,'
      '   ship_to_phone_number,'
      '   ship_to_ext,'
      '   ship_to_fax,'
      '   ship_to_prime_contact,'
      '   ship_to_note,'
      '   bill_to_attn,'
      '   bill_to_addr1,'
      '   bill_to_addr2,'
      '   bill_to_addr3,'
      '   bill_to_city,'
      '   bill_to_state,'
      '   bill_to_country,'
      '   bill_to_zip,'
      '   bill_to_phone_number,'
      '   bill_to_ext,'
      '   bill_to_fax,'
      '   bill_to_prime_contact,'
      '   terms_descrip,'
      '   terms_days,'
      '   terms_discount,'
      '   terms_discount_days,'
      '   freight_descrip,'
      '   ship_to_id,'
      '   bill_to_id,'
      '   freight_id,'
      '   fob_third_party_id )'
      'select'
      '   :nShipmentId,'
      '   '#39'Y'#39','
      '   :nPackSlipNo,'
      '   :cFob,'
      '   NVL(misc.GetUserName, o.userid),'
      '   :cShipDate,'
      '   :cPSDate,'
      '   a.id,'
      '   a.custno,'
      '   a.company,'
      '   a.addr1,'
      '   a.addr2,'
      '   a.addr3,'
      '   a.city,'
      '   a.state,'
      '   a.country,'
      '   a.zip,'
      '   a.phone_number,'
      '   a.ext,'
      '   a.fax_number,'
      '   a.prime_contact,'
      '   s.attn,'
      '   s.addr1,'
      '   s.addr2,'
      '   s.addr3,'
      '   s.city,'
      '   s.state,'
      '   s.country,'
      '   s.zip,'
      '   s.ship_time,'
      '   s.tax_code_id,'
      '   s.phone_number,'
      '   s.ext,'
      '   s.fax,'
      '   s.prime_contact,'
      '   s.notes,'
      '   b.attn,'
      '   b.addr1,'
      '   b.addr2,'
      '   b.addr3,'
      '   b.city,'
      '   b.state,'
      '   b.country,'
      '   b.zip,'
      '   b.phone_number,'
      '   b.ext,'
      '   b.fax,'
      '   b.prime_contact,'
      '   t.description,'
      '   t.days,'
      '   t.discount,'
      '   t.discount_days,'
      '   :cFreight,'
      '   Decode(:gShipToId2, 0, '#39#39', :gShipToId3),'
      '   Decode(:gBillToId2, 0, '#39#39', :gBillToId3),'
      '   decode(:freight_id, 0, NULL, :freight_id ),'
      '   decode(:gThird_party_id, 0, NULL, :gThird_party_id )'
      'from orders o, arcusto a, ship_to s, bill_to b, terms t'
      'where o.id = :gOrderId'
      '  and o.arcusto_id = a.id'
      '  and s.id(+) = :gShipToId'
      
        '  -- and b.id(+) = gBillToId replaced on Oct 12-2005 to support ' +
        'null bill_to'
      
        '  and b.id(+) = decode( sign( NVL(o.bill_to_id,0) - NVL(:gBillTo' +
        'Id, 0)),  '
      '                        0, o.bill_to_id,'
      '                        :gBillToId)'
      '  and t.id(+) = o.terms_id'
      ''
      ' '
      ' ')
    Left = 26
    Top = 11
    ParamData = <
      item
        Name = 'nShipmentId'
        DataType = ftFloat
      end
      item
        Name = 'nPackSlipNo'
        DataType = ftString
      end
      item
        Name = 'cFob'
        DataType = ftString
      end
      item
        Name = 'cShipDate'
        DataType = ftDate
      end
      item
        Name = 'cPSDate'
        DataType = ftDate
      end
      item
        Name = 'cFreight'
        DataType = ftString
      end
      item
        Name = 'gShipToId2'
        DataType = ftFloat
      end
      item
        Name = 'gShipToId3'
        DataType = ftFloat
      end
      item
        Name = 'gBillToId2'
        DataType = ftFloat
      end
      item
        Name = 'gBillToId3'
        DataType = ftFloat
      end
      item
        Name = 'freight_id'
        DataType = ftFloat
      end
      item
        Name = 'freight_id'
        DataType = ftFloat
      end
      item
        Name = 'gThird_party_id'
        DataType = ftFloat
      end
      item
        Name = 'gThird_party_id'
        DataType = ftFloat
      end
      item
        Name = 'gOrderId'
        DataType = ftFloat
      end
      item
        Name = 'gShipToId'
        DataType = ftFloat
      end
      item
        Name = 'gBillToId'
        DataType = ftFloat
      end
      item
        Name = 'gBillToId'
        DataType = ftFloat
      end>
  end
  object ProcReleaseShipDate: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.SHIPMENT.UPDATE_RELEASES_SHIP_DATE'
    Left = 115
    Top = 11
    ParamData = <
      item
        Name = 'V_SHIP_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_ORDER_DTL_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
end
