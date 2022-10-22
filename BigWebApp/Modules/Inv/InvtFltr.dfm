inherited FrmInvClassFilter: TFrmInvClassFilter
  Left = 146
  Top = 161
  ClientHeight = 286
  ClientWidth = 295
  Caption = 'Inventory Class Filter'
  ExplicitWidth = 301
  ExplicitHeight = 315
  DesignSize = (
    295
    286)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMainInvParams: TUniPanel
    Top = 8
    Width = 287
    Height = 137
    TabOrder = 2
    ExplicitTop = 8
    ExplicitWidth = 284
    ExplicitHeight = 137
    DesignSize = (
      287
      137)
    inherited Label1: TUniLabel
      Left = 39
      Top = 16
      TabOrder = 6
      ExplicitLeft = 39
      ExplicitTop = 16
    end
    inherited wwLookupClass: TUniDBLookupComboBox
      Left = 39
      Top = 36
      TabOrder = 1
      ExplicitLeft = 39
      ExplicitTop = 36
    end
    object rbtnAllItems: TUniRadioButton
      Left = 15
      Top = 111
      Width = 268
      Height = 17
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      Caption = 'All Items'
      TabOrder = 4
      OnClick = EnableInventoryControls
    end
    object rbtnClass: TUniRadioButton
      Tag = 1999
      Left = 15
      Top = 14
      Width = 17
      Height = 17
      Hint = ''
      Checked = True
      Caption = ''
      TabOrder = 0
      OnClick = EnableInventoryControls
    end
    object rbtnManu: TUniRadioButton
      Left = 15
      Top = 63
      Width = 268
      Height = 17
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Manufactured Items'
      TabOrder = 2
      OnClick = EnableInventoryControls
    end
    object rbtnPurch: TUniRadioButton
      Left = 15
      Top = 87
      Width = 268
      Height = 17
      Hint = ''
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Purchased Items'
      TabOrder = 3
      OnClick = EnableInventoryControls
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 240
    Width = 295
    Height = 46
    TabOrder = 1
    ExplicitTop = 240
    ExplicitWidth = 295
    ExplicitHeight = 46
    DesignSize = (
      295
      46)
    inherited btnOK: TUniButton
      Left = 88
      ExplicitLeft = 88
    end
    inherited btnCancel: TUniButton
      Left = 192
      ExplicitLeft = 192
    end
  end
  object GroupBox1: TUniGroupBox [2]
    Left = 0
    Top = 148
    Width = 295
    Height = 99
    Hint = ''
    Caption = ''
    Align = alCustom
    TabOrder = 0
    object PnlClient02: TUniPanel
      Left = 2
      Top = 15
      Width = 291
      Height = 82
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 82
        Top = 1
        Width = 6
        Height = 80
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Left = 1
        Top = 1
        Width = 81
        Height = 80
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label2: TUniLabel
          Left = 8
          Top = 4
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Division'
          TabOrder = 1
        end
        object Label5: TUniLabel
          Left = 8
          Top = 28
          Width = 56
          Height = 13
          Hint = ''
          Caption = 'Buyer Code'
          TabOrder = 2
        end
      end
      object PnlClient01: TUniPanel
        Left = 88
        Top = 1
        Width = 202
        Height = 80
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitLeft = 87
        ExplicitWidth = 193
        ExplicitHeight = 54
        DesignSize = (
          202
          80)
        object wwLookupDivision: TUniDBLookupComboBox
          Left = 1
          Top = 1
          Width = 203
          Height = 21
          Hint = ''
          ListField = 'NAME'
          ListSource = DivisionSrc
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clWindow
        end
        object wwLookupBuyerCode: TUniDBLookupComboBox
          Left = 1
          Top = 24
          Width = 203
          Height = 21
          Hint = ''
          ListField = 'BUYER_CODE'
          ListSource = BuyerCodeSrc
          KeyField = 'ID'
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWindow
        end
      end
    end
  end
  inherited wwQuery1: TFDQuery
    Left = 202
  end
  object wwQryDivision: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select d.id, '
      '       d.name,'
      '       e.name as eplant_name'
      '  from division d,'
      '       eplant e'
      ' where d.eplant_id = e.id(+)       ')
    Left = 201
    Top = 48
    object wwQryDivisionNAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'NAME'
      Size = 25
    end
    object wwQryDivisionEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 15
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQryDivisionID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryBuyerCode: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       buyer_code,'
      '       descrip'
      '  from buyer_code'
      '')
    Left = 200
    Top = 80
    object wwQryBuyerCodeBUYER_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'BUYER_CODE'
      Origin = 'IQ.BUYER_CODE.BUYER_CODE'
      Size = 10
    end
    object wwQryBuyerCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'IQ.BUYER_CODE.DESCRIP'
      Size = 50
    end
    object wwQryBuyerCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.BUYER_CODE.ID'
      Visible = False
      Size = 0
    end
  end
  object DivisionSrc: TDataSource
    DataSet = wwQryDivision
    Left = 144
    Top = 48
  end
  object BuyerCodeSrc: TDataSource
    DataSet = wwQryBuyerCode
    Left = 144
    Top = 96
  end
end
