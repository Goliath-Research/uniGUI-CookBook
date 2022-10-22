object FrmQuotePriceBreaks: TFrmQuotePriceBreaks
  Left = 0
  Top = 0
  HelpContext = 17824
  ClientHeight = 526
  ClientWidth = 777
  Caption = 'Quote Price Breaks'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 249
    Top = 0
    Width = 6
    Height = 344
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 485
    Width = 777
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel3: TUniPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 568
      Top = 2
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 2
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 344
    Width = 777
    Height = 141
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlLeft02: TUniPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 139
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 126
        Top = 0
        Width = 6
        Height = 139
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Left = 1
        Top = 1
        Width = 126
        Height = 137
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 10
          Top = 6
          Width = 64
          Height = 13
          Hint = ''
          Caption = 'Increment By'
          TabOrder = 3
        end
        object Label2: TUniLabel
          Left = 8
          Top = 72
          Width = 68
          Height = 13
          Hint = ''
          Caption = 'Effective date'
          TabOrder = 4
        end
        object Label3: TUniLabel
          Left = 8
          Top = 96
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Precision'
          TabOrder = 5
        end
        object rbPercent: TUniRadioButton
          Left = 30
          Top = 24
          Width = 113
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Percentage'
          TabOrder = 0
        end
        object rbFlatAmount: TUniRadioButton
          Left = 30
          Top = 47
          Width = 113
          Height = 17
          Hint = ''
          Caption = 'Flat Amount'
          TabOrder = 1
        end
      end
      object Panel9: TUniPanel
        Left = 132
        Top = 1
        Width = 643
        Height = 137
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object EdPr: TUniDBNumberEdit
          Left = 2
          Top = 93
          Width = 107
          Height = 21
          Hint = ''
          TabOrder = 1
          MaxValue = 6.000000000000000000
          DecimalSeparator = '.'
        end
        object DTDate: TUniDateTimePicker
          Left = 2
          Top = 69
          Width = 107
          Height = 21
          Hint = ''
          DateTime = 42650.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object EdIn: TUniDBNumberEdit
          Left = 2
          Top = 21
          Width = 107
          Height = 21
          Hint = ''
          TabOrder = 2
          MaxValue = 100.000000000000000000
          MinValue = -100.000000000000000000
          DecimalSeparator = '.'
        end
        object wwDBSpinEditFlatAmount: TUniDBNumberEdit
          Left = 2
          Top = 45
          Width = 107
          Height = 21
          Hint = ''
          TabOrder = 3
          DecimalSeparator = '.'
        end
      end
    end
  end
  object PnlLeft03: TUniPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 344
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 247
      Height = 342
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 30
      IQComponents.Grid.Height = 256
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcQinvt
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
      IQComponents.Navigator.DataSource = SrcQinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 30
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 256
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcQinvt
      Columns = <
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Revision'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Extended Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel4: TUniPanel
    Left = 255
    Top = 0
    Width = 522
    Height = 344
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 520
      Height = 342
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel17: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 518
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label4: TUniLabel
          Left = 1
          Top = 1
          Width = 136
          Height = 13
          Hint = ''
          Caption = 'Quote Inventory Breaks'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object GridBreaks: TIQUniGridControl
        Left = 1
        Top = 20
        Width = 518
        Height = 322
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 301
        IQComponents.Grid.Height = 236
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcBreaks
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
        IQComponents.Navigator.DataSource = SrcBreaks
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 301
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 236
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitHeight = 211
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitHeight = 240
        DataSource = SrcBreaks
        Columns = <
          item
            FieldName = 'QUAN'
            Title.Caption = 'Quantity'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QPRICE'
            Title.Caption = 'Price'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PRICE_DATE'
            Title.Caption = 'Price Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EFFECT_DATE'
            Title.Caption = 'Effective Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEACTIVE_DATE'
            Title.Caption = 'Inactive Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitTop = 45
        ExplicitHeight = 297
        Marker = 0
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 152
    Top = 120
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Quote Price Breaks'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 191077 $'
    Left = 112
    Top = 120
  end
  object QryQinvt: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       class,'
      '       descrip2'
      'from qinvt'
      '')
    Left = 48
    Top = 112
    object QryQinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryQinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object QryQinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryQinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object QryQinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object QryQinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcQinvt: TDataSource
    DataSet = QryQinvt
    Left = 72
    Top = 112
  end
  object SrcBreaks: TDataSource
    DataSet = QryBreaks
    Left = 89
    Top = 197
  end
  object QryBreaks: TFDQuery
    MasterSource = SrcQinvt
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select qinvt_id,'
      '       quan,'
      '       qprice,'
      '       price_date,'
      '       effect_date,'
      '       deactive_date,'
      '       id'
      ' from qinvt_qty_breaks'
      '  where qinvt_id = :ID'
      
        '    and sysdate between NVL(effect_date, sysdate - 36500) and NV' +
        'L(deactive_date, sysdate + 36500)'
      ' order by quan'
      ''
      ' ')
    Left = 57
    Top = 197
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 31890000c
      end>
    object QryBreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Size = 0
    end
    object QryBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      Size = 6
    end
    object QryBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object QryBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object QryBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object QryBreaksID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryBreaksQINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'QINVT_ID'
      Visible = False
      Size = 0
    end
  end
end
