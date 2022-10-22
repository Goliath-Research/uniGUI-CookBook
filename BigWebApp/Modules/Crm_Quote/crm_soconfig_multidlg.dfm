object FrmSOConfigMultiDlg: TFrmSOConfigMultiDlg
  Left = 343
  Top = 311
  ClientHeight = 118
  ClientWidth = 351
  Caption = 'Dependencies - Multiple Inventory Items'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlClient01: TUniPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 87
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 140
      Top = 0
      Width = 6
      Height = 87
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 140
      Height = 85
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 16
        Top = 12
        Width = 32
        Height = 13
        Hint = ''
        Caption = 'Option'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 16
        Top = 36
        Width = 32
        Height = 13
        Hint = ''
        Caption = 'Choice'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 16
        Top = 60
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Operator'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Left = 146
      Top = 1
      Width = 205
      Height = 85
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        205
        85)
      object cmbGridSalesOption: TUniDBLookupComboBox
        Left = 1
        Top = 8
        Width = 201
        Height = 21
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'ID;DESCRIP'
        ListSource = SrcSalesOption
        KeyField = 'ID'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clWindow
        OnDropDown = cmbGridSalesOptionDropDown
      end
      object cmbGridSalesChoice: TUniDBLookupComboBox
        Left = 1
        Top = 32
        Width = 201
        Height = 21
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'DESCRIP;PRICE'
        ListSource = SrcSalesOptionChoice
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'SalesChoice'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clWindow
        OnDropDown = cmbGridSalesChoiceDropDown
      end
      object cmbGridOperator: TUniDBComboBox
        Left = 1
        Top = 59
        Width = 201
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OPERATOR'
        Style = csDropDownList
        Items.Strings = (
          'And'#9'AND'
          'Or'#9'OR')
        TabOrder = 2
      end
    end
  end
  object PnlBottom: TUniPanel
    Left = 0
    Top = 87
    Width = 351
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 136
      Top = 1
      Width = 215
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object QrySalesOption: TFDQuery
    Active = True
    BeforeOpen = QrySalesOptionBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '  a.id,'
      '  b.descrip'
      'from sales_config_option a, sales_option b'
      'where'
      ' b.id = a.sales_option_id'
      ' and a.sales_config_id = :ID'
      'order by b.descrip '
      ''
      ''
      '')
    Left = 56
    Top = 42
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySalesOptionID: TBCDField
      FieldName = 'ID'
      Origin = 'SALES_OPTION.ID'
      Size = 0
    end
    object QrySalesOptionDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'SALES_OPTION.DESCRIP'
      Size = 60
    end
  end
  object QrySalesOptionChoice: TFDQuery
    Active = True
    BeforeOpen = QrySalesOptionChoiceBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from sales_option_choice'
      'where sales_config_option_id = :SALES_OPTION_ID'
      'order by descrip')
    Left = 116
    Top = 26
    ParamData = <
      item
        Name = 'SALES_OPTION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySalesOptionChoiceDESCRIP: TStringField
      DisplayLabel = 'Choice'
      DisplayWidth = 60
      FieldName = 'DESCRIP'
      Origin = 'IQ.SALES_OPTION_CHOICE.DESCRIP'
      Size = 60
    end
    object QrySalesOptionChoicePRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'PRICE'
      Origin = 'IQ.SALES_OPTION_CHOICE.PRICE'
      Size = 6
    end
    object QrySalesOptionChoiceID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SALES_OPTION_CHOICE.ID'
      Visible = False
      Size = 0
    end
    object QrySalesOptionChoiceSALES_CONFIG_OPTION_ID: TBCDField
      FieldName = 'SALES_CONFIG_OPTION_ID'
      Origin = 'IQ.SALES_OPTION_CHOICE.SALES_CONFIG_OPTION_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSalesOption: TDataSource
    DataSet = QrySalesOption
    Left = 168
    Top = 64
  end
  object SrcSalesOptionChoice: TDataSource
    DataSet = QrySalesOptionChoice
    Left = 232
    Top = 56
  end
end
