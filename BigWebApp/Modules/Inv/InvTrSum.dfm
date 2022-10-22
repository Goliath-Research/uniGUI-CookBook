object FrmInvTransSummary: TFrmInvTransSummary
  Left = 265
  Top = 182
  HelpContext = 1135241
  ClientHeight = 211
  ClientWidth = 407
  Caption = 'Inventory Summary'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TUniSplitter
    Left = 169
    Top = 0
    Width = 5
    Height = 211
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object gbResult: TUniGroupBox
    Left = 174
    Top = 0
    Width = 233
    Height = 211
    Hint = ''
    Caption = '  Result  '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object Panel4: TUniPanel
      Left = 2
      Top = 15
      Width = 229
      Height = 194
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Left = 1
        Top = 163
        Width = 227
        Height = 30
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object SBDrillDown: TUniButton
          Left = 8
          Top = 0
          Width = 97
          Height = 25
          Hint = 'View the Transaction Log'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Transaction Log'
          TabOrder = 1
          OnClick = DoDrillDownToTransLog
        end
      end
      object PnlClient04: TUniPanel
        Left = 1
        Top = 1
        Width = 227
        Height = 162
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 98
          Top = 1
          Width = 6
          Height = 160
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft02: TUniPanel
          Left = 1
          Top = 1
          Width = 97
          Height = 160
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label3: TUniLabel
            Left = 9
            Top = 4
            Width = 10
            Height = 13
            Hint = ''
            Caption = 'In'
            TabOrder = 1
          end
          object Label5: TUniLabel
            Left = 9
            Top = 28
            Width = 18
            Height = 13
            Hint = ''
            Caption = 'Out'
            TabOrder = 2
          end
          object Label4: TUniLabel
            Left = 9
            Top = 52
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Amount In'
            TabOrder = 3
          end
          object Label6: TUniLabel
            Left = 9
            Top = 76
            Width = 58
            Height = 13
            Hint = ''
            Caption = 'Amount Out'
            TabOrder = 4
          end
        end
        object PnlClient02: TUniPanel
          Left = 104
          Top = 1
          Width = 122
          Height = 160
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            122
            160)
          object edIN: TUniEdit
            Left = 0
            Top = 0
            Width = 119
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
          object edOUT: TUniEdit
            Left = 0
            Top = 24
            Width = 119
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Color = clBtnFace
            ReadOnly = True
          end
          object edAmtIn: TUniEdit
            Left = 0
            Top = 48
            Width = 119
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Color = clBtnFace
            ReadOnly = True
          end
          object edAmtOut: TUniEdit
            Left = 0
            Top = 72
            Width = 119
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
    end
  end
  object gbFilter: TUniGroupBox
    Left = 0
    Top = 0
    Width = 169
    Height = 211
    Hint = ''
    Caption = '  Filter  '
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    object Panel6: TUniPanel
      Left = 2
      Top = 15
      Width = 165
      Height = 194
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 163
        Height = 50
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          163
          50)
        object radioMTD: TUniRadioButton
          Left = 8
          Top = 0
          Width = 155
          Height = 17
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Checked = True
          Caption = 'MTD'
          TabOrder = 0
          OnClick = GroupBox2Click
        end
        object radioYTD: TUniRadioButton
          Left = 8
          Top = 16
          Width = 155
          Height = 17
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Caption = 'YTD'
          TabOrder = 1
          OnClick = GroupBox2Click
        end
        object radioRange: TUniRadioButton
          Left = 8
          Top = 32
          Width = 155
          Height = 17
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Date Range'
          TabOrder = 2
          OnClick = GroupBox2Click
        end
      end
      object PnlClient03: TUniPanel
        Left = 1
        Top = 51
        Width = 163
        Height = 112
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 54
          Top = 1
          Width = 6
          Height = 110
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 53
          Height = 110
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 11
            Top = 4
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'From'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 11
            Top = 28
            Width = 12
            Height = 13
            Hint = ''
            Caption = 'To'
            TabOrder = 2
          end
        end
        object PnlClient01: TUniPanel
          Left = 60
          Top = 1
          Width = 102
          Height = 110
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            102
            110)
          object DateTimePicker1: TUniDateTimePicker
            Left = 0
            Top = 0
            Width = 107
            Height = 21
            Hint = ''
            DateTime = 42685.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object DateTimePicker2: TUniDateTimePicker
            Left = 0
            Top = 24
            Width = 107
            Height = 21
            Hint = ''
            DateTime = 42685.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
        end
      end
      object PnlButtonsRight: TUniPanel
        Left = 1
        Top = 163
        Width = 163
        Height = 30
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object btnCalculate: TUniButton
          Left = 8
          Top = 0
          Width = 97
          Height = 25
          Hint = 'Apply filter values'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Calculate'
          TabOrder = 1
          OnClick = btnCalculateClick
        end
      end
    end
  end
  object QrySum: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sum( NVL( trans_quan, 0) ) as total_qty'
      '  from translog '
      ' where arinvt_id = :arinvt_id'
      '   and rtrim(trans_type) not in ('#39'MOVE_LOCATION'#39', '
      '                                 '#39'CONSUME VMI SHIPMENT'#39','
      '                                 '#39'VMI MOVE_LOCATION'#39','
      '                                 '#39'VMI INTERPLANT XFER'#39' )'
      '   and RTrim(trans_in_out) = :trans_in_out'
      '   and Trunc(trans_date) between :date1 and :date2'
      ' '
      '   and case '
      
        '         when rtrim(trans_type) in ('#39'PO'#39', '#39'VOID RECEIVED PO'#39') th' +
        'en   '
      '              po_misc.both_receipt_and_void_found( arinvt_id,'
      '                                                   :date1,'
      '                                                   :date2,'
      '                                                   trans_type,'
      '                                                   receiptno )'
      '       else'
      '         0'
      '       end = 0 '
      '                                                           '
      ' ')
    Left = 144
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'trans_in_out'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
  end
  object QryMoneySum: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select Round(sum( NVL( trans_quan, 0) * Decode(a.standard_id, nu' +
        'll,'
      
        '            t.act_cost, NVL(a.std_price, 0)) ), 2) as total_amou' +
        'nt'
      '  from translog t,'
      '       arinvt a'
      ' where arinvt_id = :arinvt_id'
      '   and t.arinvt_id = a.id'
      '   and rtrim(trans_type) not in ('#39'MOVE_LOCATION'#39', '
      '                                 '#39'CONSUME VMI SHIPMENT'#39','
      '                                 '#39'VMI MOVE_LOCATION'#39','
      '                                 '#39'VMI INTERPLANT XFER'#39' )'
      '   and RTrim(trans_in_out) = :trans_in_out'
      '   and Trunc(trans_date) between :date1 and :date2'
      ''
      '   and case '
      
        '         when rtrim(trans_type) in ('#39'PO'#39', '#39'VOID RECEIVED PO'#39') th' +
        'en   '
      '              po_misc.both_receipt_and_void_found( arinvt_id,'
      '                                                   :date1,'
      '                                                   :date2,'
      '                                                   trans_type,'
      '                                                   receiptno )'
      '       else'
      '         0'
      '       end = 0 '
      '                                                           '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 116
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'trans_in_out'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 0d
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 0d
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
  end
  object PResult: TUniPopupMenu
    Left = 172
    object DrillDowntoTransactionLog1: TUniMenuItem
      Caption = 'Drill Down to Transaction Log'
      OnClick = DoDrillDownToTransLog
    end
  end
end
