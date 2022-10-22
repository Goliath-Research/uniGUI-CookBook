object FrmOnHandByPlant: TFrmOnHandByPlant
  Left = 224
  Top = 228
  ClientHeight = 184
  ClientWidth = 474
  Caption = 'On-Hand'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 91
    Width = 474
    Height = 93
    Hint = ''
    DataSource = SrcOnHand
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'ON_HAND'
        Title.Caption = 'On Hand'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RG_ONHAND'
        Title.Caption = 'Regrind On Hand'
        Width = 100
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 91
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 282
      Top = 1
      Width = 6
      Height = 89
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
    end
    object PnlClient01: TUniPanel
      Left = 1
      Top = 1
      Width = 281
      Height = 89
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 77
        Top = 1
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
        Width = 76
        Height = 87
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label3: TUniLabel
          Left = 10
          Top = 12
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Class'
          TabOrder = 1
        end
        object Label5: TUniLabel
          Left = 10
          Top = 36
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Item #'
          TabOrder = 2
        end
        object Label4: TUniLabel
          Left = 10
          Top = 60
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Revision'
          TabOrder = 3
        end
      end
      object PnlClient02: TUniPanel
        Left = 83
        Top = 1
        Width = 197
        Height = 87
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          197
          87)
        object dbcClass: TUniDBEdit
          Left = 0
          Top = 8
          Width = 40
          Height = 21
          Hint = ''
          DataField = 'CLASS'
          DataSource = SrcArinvt
          TabOrder = 0
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object dbeItemNo: TUniDBEdit
          Left = 0
          Top = 32
          Width = 203
          Height = 22
          Hint = ''
          DataField = 'ITEMNO'
          DataSource = SrcArinvt
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          TabOrder = 1
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
        object dbeRev: TUniDBEdit
          Left = 0
          Top = 56
          Width = 203
          Height = 22
          Hint = ''
          DataField = 'REV'
          DataSource = SrcArinvt
          CharCase = ecUpperCase
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          TabOrder = 2
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object PnlTotalBy: TUniPanel
      Left = 288
      Top = 1
      Width = 185
      Height = 89
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 183
        Height = 87
        Hint = ''
        Caption = '  Total By  '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        DesignSize = (
          183
          87)
        object chkByEPlant: TUniCheckBox
          Left = 8
          Top = 16
          Width = 167
          Height = 17
          Hint = ''
          ParentShowHint = False
          Caption = 'By EPlant'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnClick = RunTotal
        end
        object chkByDivision: TUniCheckBox
          Left = 8
          Top = 32
          Width = 167
          Height = 17
          Hint = ''
          Caption = 'By Division'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnClick = RunTotal
        end
        object chkByClassItem: TUniCheckBox
          Left = 8
          Top = 48
          Width = 167
          Height = 18
          Hint = ''
          Caption = 'Include same Inventory items'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnClick = RunTotal
        end
      end
    end
  end
  object SrcOnHand: TDataSource
    DataSet = QryOnHand
    Left = 80
    Top = 136
  end
  object QryOnHand: TFDQuery
    BeforeOpen = QryOnHandBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '')
    Left = 80
    Top = 152
  end
  object SrcArinvt: TDataSource
    Left = 32
    Top = 137
  end
end
