object FrmPMScheduleWarning: TFrmPMScheduleWarning
  Left = 272
  Top = 201
  ClientHeight = 293
  ClientWidth = 511
  Caption = 'Warning'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 252
    Width = 511
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 301
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnIgnore: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Ignore'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 77
    Width = 511
    Height = 175
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 509
      Height = 173
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 292
      IQComponents.Grid.Height = 87
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 292
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 87
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'CNTR_SEQ'
          Title.Caption = 'Schedule Position'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKCENTER_EQNO'
          Title.Caption = 'Work Center #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'Work Order #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGNO'
          Title.Caption = 'MFG #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_START_TIME'
          Title.Caption = 'Production Start'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROD_END_TIME'
          Title.Caption = 'Production End'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel5: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 511
    Height = 77
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 54
      Height = 75
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object imgWarning: TUniImage
        Left = 8
        Top = 8
        Width = 32
        Height = 32
        Hint = ''
        AutoSize = True
        Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C0000C40E0000C40E0000000000000000
          0000FF00FF9797976D6D6D666666666666666666666666666666666666666666
          6666666666666666666666666666666666666666666666666666666666666666
          666666666666666666666666666666666666666666666666666C6C6C969696FF
          00FF9B9B9B47799D1897F3129BFE129BFE129BFE129BFE129BFE129BFE129BFE
          129BFE129BFE129BFE129AFE129BFE129BFE129AFE129AFE129AFE129AFE129A
          FE1299FE1299FE129AFE129AFE1299FE129AFE1199FE1197FE1390F544769F9B
          9B9B71717126A6EF20B1FF21B2FF21B2FF21B2FF21B2FF20B1FF20B2FF21B1FF
          20B1FF20B1FF20B1FF1FADFB4580A363686A62686C4581A520ABF920B0FF20B0
          FF1FB0FF20AFFF1FB0FF1FAFFF1FAFFF1FAFFF1FAFFF1CABFF16A1FF1891EE71
          717175757530B1E929C0FF29BFFF29BFFF29BEFF29BFFF29BEFF28BEFF29BEFF
          29BEFF29BEFF28BCFE4A84A18F8F8FB9B9B9B2B2B28888884A829F27BCFE28BD
          FF27BCFF28BDFF28BCFF27BCFF27BCFF27BCFF27BCFF25B9FF1DACFF2291E07B
          7B7B9999994895B32CC4FF2CC3FF2CC3FF2CC3FF2BC3FF2BC2FF2CC3FF2BC3FF
          2BC2FF2BC2FF2FB8F0727272E5E5E5D6D6D6C3C3C3B7B7B771717131B1E72AC1
          FF29C1FF2AC0FF2AC1FF2AC0FF2AC0FF2ABFFF29C0FF27BDFF1FB0FF437EA6A1
          A1A1C3C3C3636A6D35BEEF2FC8FF2FC7FF2FC8FF2FC7FF2EC7FF2EC7FF2EC7FF
          2EC6FF2DC7FF38AEDB868686FFFFFFFFFFFFE4E4E4C7C7C78282823DA2CB2DC5
          FF2DC5FF2CC4FF2CC4FF2CC5FF2CC4FF2CC5FF2CC4FF27BDFF26A3E964676AC9
          C9C9FF00FF9B9B9B5090A532CDFF32CCFF32CDFF31CCFF31CCFF31CCFF31CCFF
          31CBFF31CBFF33C0F1717171FAFAFAFFFFFFFFFFFFE4E4E475757536B9E730CA
          FF2FCAFF2FC9FF2FC9FF30C9FF2FC9FF2FC9FF2DC7FF24BBFF4F7A939F9F9FFF
          00FFFF00FFCBCBCB6567683EBEE236D2FF36D1FF36D1FF35D1FF35D0FF35D0FF
          35D0FF34D0FF34CFFE4D8CA3A0A0A0F4F4F4F2F2F2A1A1A14E899F34CDFE33CF
          FF33CFFF33CEFF33CEFF33CEFF33CDFF31CCFF2CC5FF349DD2848484FF00FFFF
          00FFFF00FFFF00FFA3A3A35B808A3AD6FF3AD6FF3AD6FF3AD5FF3AD5FF39D5FF
          39D5FF39D5FF39D5FF38D0FC4D92A9626B6F616C704C93AA36CFFB37D4FF37D3
          FF37D3FF37D3FF37D3FF36D2FF37D3FF34CFFF29BEFB5B707BAEAEAEFF00FFFF
          00FFFF00FFFF00FFFF00FF8A8A8A4DB0C93FDAFF3FDAFF3FDAFF3FDAFF3EDAFF
          3ED9FF3ED9FF3ED9FF3ED9FF3DD9FF3DD9FF3DD8FF3CD9FF3CD8FF3CD8FF3DD8
          FF3CD8FF3BD7FF3CD7FF3BD7FF3BD6FF32CCFF3E97C0909090FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFB4B4B462727646DAFA45DEFF45DEFF44DDFF44DEFF
          44DDFF44DDFF44DDFF5692A1666666666666666666636B6D5398AA42DCFF42DB
          FF42DCFF41DBFF41DCFF41DCFF3CD6FF31BFF4616C71BABABAFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF93939357A7B74CE1FF4CE1FF4BE1FF4BE1FF
          4AE0FF4AE0FF4AE0FF666666D2D2D2C1C1C1B8B8B8B0B0B0646B6D49E0FF48DF
          FF48DFFF47E0FF47DFFF45DDFF39D2FF4C8BA5979797FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFC0C0C0656C6D55D7EF52E3FF52E4FF52E3FF
          52E4FF51E4FF51E3FF666666F3F3F3DDDDDDC4C4C4B2B2B2646B6D4FE3FF4FE3
          FF4EE3FF4EE3FF4DE3FF45DAFF3CB6E2656768CBCBCBFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9B61929C5BE7FF5BE6FF5AE6FF
          59E6FF59E6FF59E6FF666666FFFFFFF9F9F9D5D5D5B6B6B6646B6D57E5FF56E5
          FF57E5FF56E5FF51E2FF40D3FF587B8AA3A3A3FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7E7E7E64C9DB64E9FF63E9FF
          63E9FF62E9FF63E9FF666666FFFFFFFFFFFFDCDCDCB8B8B8646B6D60E8FF5FE8
          FF5FE8FF5EE7FF51DEFF48A9CB898989FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8A8A8667E836EECFF6EEBFF
          6DEBFF6DEBFF6DEBFF666666FFFFFFFFFFFFDCDCDCB8B8B8656B6D6AEBFF69EA
          FF69EAFF61E5FF4BD2FB5E737BB3B3B3FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8A8A71BDC978EEFF
          78EDFF77EEFF77EEFF666666FFFFFFFFFFFFDCDCDCB8B8B8656B6D74ECFF74ED
          FF71EBFF5FE0FF529CB7939393FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB4B4B468747682E9F8
          83F0FF83EFFF82F0FF666666FFFFFFFFFFFFDCDCDCB8B8B8666B6D7FEFFF7EEF
          FF74E8FF57CAEF646A6DC0C0C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF95959577A6AE
          8EF2FF8EF1FF8DF2FF666666FFFFFFFFFFFFE5E5E5BCBCBC666B6D8BF1FF85EE
          FF6DE1FF5B8A9C9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C667696A
          91E0E998F4FF98F3FF666666FFFFFFFFFFFFFFFFFFCFCFCF676B6D94F2FF83EB
          FF60BCDB7E7E7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9F9F9F
          779195A3F5FFA3F5FF666666FFFFFFFFFFFFFFFFFFF0F0F0686C6D98F1FF77E2
          FF617B84A8A8A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          7E7E7E9BD4DBACF7FF7E9CA1666666666666666666686C6D80A4AA90ECFF64AE
          C98A8A8AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          A8A8A8738183B3F6FDB4F8FFB4F8FFB3F9FFB3F9FFB3F8FFA6F3FF7DDCF86471
          76B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF90909097BCC0BCFAFFBBFAFFBAFAFFBBFAFFB6F8FF98EBFF669BAE9595
          95FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBABABA6B7071BAF0F4C0FBFFC0FBFFBFFBFFADF3FF7BD0E966686AC6C6
          C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF9797978AA4A7C1FBFFC1FBFFBAF8FF95E9FF6587939F9F9FFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC9C9C968696AB3E6E9BFFAFFA9F1FF73BED7818181FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF9F9F9F788688AAE4ED86D2E864777DABABABFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF9C9C9C7272727575759F9F9FFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        Transparent = True
      end
    end
    object Panel4: TUniPanel
      Tag = 1999
      Left = 54
      Top = 1
      Width = 457
      Height = 75
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel1: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 455
        Height = 46
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object lblPrompt: TUniLabel
          Left = 1
          Top = 1
          Width = 569
          Height = 13
          Hint = ''
          Caption = 
            'One or more work orders have been scheduled to run while this eq' +
            'uipment is out of service.  Do you want to continue?'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
      object Panel3: TUniPanel
        Tag = 1999
        Left = 1
        Top = 46
        Width = 455
        Height = 35
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object lblStartDateLabel: TUniLabel
          Left = 8
          Top = 1
          Width = 86
          Height = 13
          Hint = ''
          Caption = 'Service Date Out:'
          TabOrder = 1
        end
        object lblEndDateLabel: TUniLabel
          Left = 8
          Top = 16
          Width = 78
          Height = 13
          Hint = ''
          Caption = 'Service Date In:'
          TabOrder = 2
        end
      end
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 280
    Top = 96
  end
  object QryData: TFDQuery
    BeforeOpen = DoBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT c.pmeqmt_id AS pmeqmt_id, a.cntr_seq AS cntr_seq,'
      '       d.eqno AS workcenter_eqno, b.id AS workorder_id,'
      
        '       a.prod_start_time AS prod_start_time, a.prod_end_time AS ' +
        'prod_end_time,'
      '       f.mfgno AS mfgno, a.id AS cntr_sched_id'
      
        'FROM cntr_sched a, workorder b, standard_pmeqmt c, work_center d' +
        ', pmeqmt e,'
      '     standard f'
      'WHERE a.workorder_id = b.id AND'
      '      b.standard_id = c.standard_id AND'
      '      d.id = a.work_center_id AND'
      '      c.pmeqmt_id = e.id AND'
      '      f.id = c.standard_id AND'
      '      c.pmeqmt_id = :PMEQMT_ID AND'
      '      (:SQL_SWITCH = 0 AND'
      
        '         (:START_TIME BETWEEN a.prod_start_time AND a.prod_end_t' +
        'ime'
      '          OR a.prod_start_time >= :START_TIME)'
      '       OR'
      '       :SQL_SWITCH = 1 AND'
      '         (a.prod_start_time BETWEEN :START_TIME AND :END_TIME OR'
      '          a.prod_end_time BETWEEN :START_TIME AND :END_TIME OR'
      
        '          a.prod_start_time <= :START_TIME AND a.prod_end_time >' +
        '= :END_TIME))')
    Left = 296
    Top = 104
    ParamData = <
      item
        Name = 'PMEQMT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'SQL_SWITCH'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'START_TIME'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'END_TIME'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryDataCNTR_SEQ: TBCDField
      DisplayLabel = 'Schedule Position'
      DisplayWidth = 10
      FieldName = 'CNTR_SEQ'
      Origin = 'IQ.CNTR_SCHED.CNTR_SEQ'
      Size = 0
    end
    object QryDataWORKCENTER_EQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 10
      FieldName = 'WORKCENTER_EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      FixedChar = True
      Size = 60
    end
    object QryDataWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.WORKORDER.ID'
      Size = 0
    end
    object QryDataMFGNO: TStringField
      DisplayLabel = 'MFG #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object QryDataPROD_START_TIME: TDateTimeField
      DisplayLabel = 'Production Start'
      DisplayWidth = 18
      FieldName = 'PROD_START_TIME'
      Origin = 'IQ.CNTR_SCHED.PROD_START_TIME'
    end
    object QryDataPROD_END_TIME: TDateTimeField
      DisplayLabel = 'Production End'
      DisplayWidth = 18
      FieldName = 'PROD_END_TIME'
      Origin = 'IQ.CNTR_SCHED.PROD_END_TIME'
    end
    object QryDataPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Origin = 'IQ.STANDARD_PMEQMT.PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object QryDataCNTR_SCHED_ID: TBCDField
      FieldName = 'CNTR_SCHED_ID'
      Origin = 'IQ.CNTR_SCHED.ID'
      Visible = False
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    OnPopup = PMainPopup
    Left = 344
    Top = 97
    object JumpToSchedule1: TUniMenuItem
      Caption = 'Jump to Schedule'
      OnClick = JumpToSchedule1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPMScheduleWarning')
    SecurityItems.Strings = (
      'btnIgnore'
      'JumpToSchedule1')
    SecurityCode = 'FRMPMSCHEDULEWARNING'
    Left = 384
    Top = 97
  end
end
