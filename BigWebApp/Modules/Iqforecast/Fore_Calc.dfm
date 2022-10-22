object FrmForeCalc: TFrmForeCalc
  Left = 160
  Top = 166
  ClientHeight = 450
  ClientWidth = 940
  Caption = 'Best Forecast Formula Evaluation'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter2: TUniSplitter
    Left = 0
    Top = 192
    Width = 940
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 34
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRecalc: TUniSpeedButton
      Left = 32
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Recalculate best forecast formula'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF034464034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4A4A4A4AFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4AD6D6D64A4A4AFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00669A14D3FF034464FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070D7D7D74A
        4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D9D9D9D9
        D9D94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00669A22D7FF22D7FF034464FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DA
        DADADADADA4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070DC
        DCDC4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00669A30DCFF30DCFF034464FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DEDEDEDE
        DEDE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DF
        DFDFDFDFDF4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF00669A3DE0FF3DE0FF3DE0FF034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E1
        E1E1E1E1E1E1E1E14A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070707070E3
        E3E34A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00669A4BE5FF4BE5FF4BE5FF4BE5FF034464FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E5E5E5E5E5E5E5
        E5E5E5E5E54A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E9E9E9E9
        E9E9E9E9E9E9E9E94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0099CC00669A70F1FE70F1FE70F1FE70F1FE034464FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1707070EE
        EEEEEEEEEEEEEEEEEEEEEE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
        64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A14A
        4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRecalcClick
    end
    object sbtnForecastFormulas: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 31
      Height = 31
      Hint = 'Forecast Formulas'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        6F63633E38346D635AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF808080808080626262FFFFFFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        909890CBB9AE0E0D0C7D7167FF00FFDCC4B0FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF969696B9B9B9808080707070FFFFFFC2
        C2C2FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF867A7B0E0D0CFF00FF2C29262E2F258B7B6D1E1A170E0C0A2B20
        15FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B7B7B808080FFFFFF80
        80808080807A7A7A808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB5A9A00000007D7066FF00FFFCE1CB6154540000004B4139D6B6
        9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA8A8A88080806F6F6FFF
        FFFFFF00FF808080808080808080B4B4B4FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFECD7C65050503E3732FF00FFDEC7B68E897B2020200E0C0AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6808080808080FF
        FFFFFF00FF868686808080808080FFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF7876750E0D0CFF00FF968B80969493A397869280731D19
        153B312AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF767676808080FF
        FFFF8A8A8A9494948080807F7F7F808080808080FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF7C7E74000000ECD2BDFF00FFE7CFB9D1BBA6FF00FFDEBE
        A5C6A78EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7C7C7C808080FF
        FFFFFF00FFCDCDCDB9B9B9FF00FFBCBCBC808080FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFACA2992018207D7064FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A18080806E
        6E6EFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFAA9E94B0B0B0808080100810100800FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9DB0B0B080808080
        8080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF969C931E2218FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A9A9A80
        8080FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBFB3AA606060DCC4B13A2F2457483AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2B2B280
        8080808080808080808080FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFB0ABA7786F751D140B3D3B2EFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB
        ABAB808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFECD4C1CEB8A6FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFD3D3D3B7B7B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = ForecastFormulas1Click
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 34
    Width = 940
    Height = 158
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object gridForeCalc: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 938
      Height = 156
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -14
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 721
      IQComponents.Grid.Height = 70
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcFore_Calc
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
      IQComponents.Navigator.DataSource = SrcFore_Calc
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 721
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 70
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcFore_Calc
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'Calculation ID # '
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TIMESTAMP'
          Title.Caption = 'Time Stamp'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CustNo'
          Title.Caption = 'Customer #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Best_Formula_Name'
          Title.Caption = 'Best Formula Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description / Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ACT_VALUE'
          Title.Caption = 'Actual Value'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTR_START'
          Title.Caption = 'Eval Quarter Start'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QTR_END'
          Title.Caption = 'Eval Quarter End'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBLookupComboBestFormula: TUniDBLookupComboBox
      Left = 324
      Top = 55
      Width = 149
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'NAME;INFIX;DESCRIP'
      ListSource = SrcFormulas
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
    end
    object wwDBLookupComboCust: TUniDBLookupComboBox
      Left = 325
      Top = 92
      Width = 149
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'CUSTNO;COMPANY'
      ListSource = SrcArcusto
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 197
    Width = 940
    Height = 253
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 521
      Top = 0
      Width = 6
      Height = 253
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 521
      Height = 251
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object gridForeEval: TIQUniGridControl
        Left = 1
        Top = 58
        Width = 519
        Height = 193
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Height = -14
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 302
        IQComponents.Grid.Height = 107
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcFore_Eval
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
        IQComponents.Navigator.DataSource = SrcFore_Eval
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 302
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 107
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcFore_Eval
        Columns = <
          item
            FieldName = 'Formula_Name'
            Title.Caption = 'Formula Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'RESULT_VALUE'
            Title.Caption = 'Result'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Deviation'
            Title.Caption = 'Deviation'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Formula_Descrip'
            Title.Caption = 'Formula Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object PnlToolbar: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 519
        Height = 58
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object PnlToolbarCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 517
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -15
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblCaptionLabel: TUniLabel
            Left = 1
            Top = 1
            Width = 144
            Height = 18
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Calculation Results'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -15
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object Panel6: TUniPanel
      Left = 527
      Top = 1
      Width = 413
      Height = 251
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = 'Panel6'
      object PageControl1: TUniPageControl
        Left = 1
        Top = 1
        Width = 411
        Height = 249
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet1
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabSheet1: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Deviation'
          object DBChart1: TDBChart
            Left = 0
            Top = 0
            Width = 403
            Height = 217
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            BackWall.Brush.Gradient.Direction = gdBottomTop
            BackWall.Brush.Gradient.EndColor = 11118482
            BackWall.Brush.Gradient.StartColor = 15395562
            BackWall.Brush.Gradient.Visible = True
            BackWall.Transparent = False
            Border.Color = 14645801
            Border.Width = 7
            BottomWall.Brush.Gradient.EndColor = 16580349
            BottomWall.Brush.Gradient.StartColor = 3114493
            Foot.Font.Color = clBlue
            Foot.Font.Name = 'Verdana'
            Gradient.Direction = gdBottomTop
            Gradient.EndColor = clWhite
            Gradient.MidColor = 15395562
            Gradient.StartColor = 15395562
            Gradient.Visible = True
            LeftWall.Brush.Gradient.EndColor = 2413052
            LeftWall.Brush.Gradient.StartColor = 900220
            LeftWall.Color = 14745599
            RightWall.Color = 14745599
            Title.Font.Name = 'Verdana'
            Title.Text.Strings = (
              'TDBChart')
            Title.Visible = False
            BottomAxis.Axis.Color = 4210752
            BottomAxis.Grid.Color = 11119017
            BottomAxis.LabelsFormat.Font.Name = 'Verdana'
            BottomAxis.TicksInner.Color = 11119017
            BottomAxis.Title.Font.Name = 'Verdana'
            DepthAxis.Axis.Color = 4210752
            DepthAxis.Grid.Color = 11119017
            DepthAxis.LabelsFormat.Font.Name = 'Verdana'
            DepthAxis.TicksInner.Color = 11119017
            DepthAxis.Title.Font.Name = 'Verdana'
            DepthTopAxis.Axis.Color = 4210752
            DepthTopAxis.Grid.Color = 11119017
            DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
            DepthTopAxis.TicksInner.Color = 11119017
            DepthTopAxis.Title.Font.Name = 'Verdana'
            LeftAxis.Axis.Color = 4210752
            LeftAxis.Grid.Color = 11119017
            LeftAxis.LabelsFormat.Font.Name = 'Verdana'
            LeftAxis.TicksInner.Color = 11119017
            LeftAxis.Title.Font.Name = 'Verdana'
            Legend.Brush.Gradient.Direction = gdTopBottom
            Legend.Brush.Gradient.EndColor = clYellow
            Legend.Brush.Gradient.StartColor = clWhite
            Legend.Font.Name = 'Verdana'
            Legend.Shadow.Transparency = 0
            Legend.Visible = False
            RightAxis.Axis.Color = 4210752
            RightAxis.Grid.Color = 11119017
            RightAxis.LabelsFormat.Font.Name = 'Verdana'
            RightAxis.TicksInner.Color = 11119017
            RightAxis.Title.Font.Name = 'Verdana'
            Shadow.Color = clBlack
            TopAxis.Axis.Color = 4210752
            TopAxis.Grid.Color = 11119017
            TopAxis.LabelsFormat.Font.Name = 'Verdana'
            TopAxis.TicksInner.Color = 11119017
            TopAxis.Title.Font.Name = 'Verdana'
            Align = alClient
            TabOrder = 0
            DefaultCanvas = 'TGDIPlusCanvas'
            PrintMargins = (
              15
              20
              15
              20)
            ColorPaletteIndex = 0
            object Series1: TLineSeries
              DataSource = QryFore_Eval
              XLabelsSource = 'Formula_Name'
              Brush.BackColor = clDefault
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              XValues.Name = 'X'
              XValues.Order = loAscending
              XValues.ValueSource = 'FORE_FORMULA_ID'
              YValues.Name = 'Y'
              YValues.Order = loNone
              YValues.ValueSource = 'Deviation'
            end
          end
        end
        object TabSheet2: TUniTabSheet
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ImageIndex = 1
          Caption = 'Calculation Log'
          object DBMemo1: TUniDBMemo
            Left = 0
            Top = 0
            Width = 403
            Height = 217
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            DataField = 'TEXT_LOG'
            DataSource = SrcFore_Eval
            ScrollBars = ssBoth
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Height = -15
            Font.Name = 'Courier New'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            WordWrap = False
          end
        end
      end
    end
  end
  object SrcFore_Calc: TDataSource
    DataSet = QryFore_Calc
    Left = 57
    Top = 74
  end
  object QryFore_Calc: TFDQuery
    BeforeOpen = QryFore_CalcBeforeOpen
    AfterInsert = QryFore_CalcAfterInsert
    BeforePost = QryFore_CalcBeforePost
    AfterPost = ApplyUpdateToDataSet
    AfterDelete = ApplyUpdateToDataSet
    AfterScroll = QryFore_CalcAfterScroll
    CachedUpdates = True
    OnUpdateRecord = QryFore_CalcUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLForeCalc
    SQL.Strings = (
      'select c.id,'
      '       c.fore_item_id,'
      '       c.descrip,'
      '       c.timestamp,'
      '       c.fore_formula_id_best,'
      '       c.qtr_start,'
      '       c.qtr_end,'
      '       c.act_value,'
      '       c.arcusto_id'
      '  from fore_calc c'
      ' where c.fore_item_id = :fore_item_id'
      ' order by id desc'
      ''
      '')
    Left = 57
    Top = 90
    ParamData = <
      item
        Name = 'fore_item_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFore_CalcID: TBCDField
      DisplayLabel = 'Calculation ID # '
      DisplayWidth = 8
      FieldName = 'ID'
      ReadOnly = True
      Size = 0
    end
    object QryFore_CalcTIMESTAMP: TDateTimeField
      DisplayLabel = 'Time Stamp'
      DisplayWidth = 20
      FieldName = 'TIMESTAMP'
      ReadOnly = True
    end
    object QryFore_CalcCustNo: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'CustNo'
      LookupDataSet = QryArcusto
      LookupKeyFields = 'ID'
      LookupResultField = 'CUSTNO'
      KeyFields = 'ARCUSTO_ID'
      Size = 25
      Lookup = True
    end
    object QryFore_CalcBest_Formula_Name: TStringField
      DisplayLabel = 'Best Formula Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Best_Formula_Name'
      LookupDataSet = QryFormulas
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FORE_FORMULA_ID_BEST'
      Size = 25
      Lookup = True
    end
    object QryFore_CalcDESCRIP: TStringField
      DisplayLabel = 'Description / Comment'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QryFore_CalcACT_VALUE: TFMTBCDField
      DisplayLabel = 'Actual Value'
      DisplayWidth = 18
      FieldName = 'ACT_VALUE'
      Size = 6
    end
    object QryFore_CalcQTR_START: TDateTimeField
      DisplayLabel = 'Eval Quarter Start'
      DisplayWidth = 18
      FieldName = 'QTR_START'
    end
    object QryFore_CalcQTR_END: TDateTimeField
      DisplayLabel = 'Eval Quarter End'
      DisplayWidth = 18
      FieldName = 'QTR_END'
      ReadOnly = True
    end
    object QryFore_CalcFORE_FORMULA_ID_BEST: TBCDField
      DisplayWidth = 23
      FieldName = 'FORE_FORMULA_ID_BEST'
      Visible = False
      Size = 0
    end
    object QryFore_CalcFORE_ITEM_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FORE_ITEM_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryFore_CalcARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcFore_Eval: TDataSource
    DataSet = QryFore_Eval
    Left = 102
    Top = 74
  end
  object QryFore_Eval: TFDQuery
    BeforeInsert = AvoidAppend
    OnCalcFields = QryFore_EvalCalcFields
    CachedUpdates = True
    MasterSource = SrcFore_Calc
    MasterFields = 'ID'
    OnUpdateRecord = QryFore_EvalUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       fore_calc_id,'
      '       fore_formula_id,'
      '       result_value,'
      '       text_log'
      '  from fore_eval'
      ' where fore_calc_id = :id'
      ' order by'
      '       id')
    Left = 118
    Top = 130
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFore_EvalFormula_Name: TStringField
      DisplayLabel = 'Formula Name'
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'Formula_Name'
      LookupDataSet = QryFormulas
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FORE_FORMULA_ID'
      Size = 25
      Lookup = True
    end
    object QryFore_EvalRESULT_VALUE: TFMTBCDField
      DisplayLabel = 'Result'
      DisplayWidth = 18
      FieldName = 'RESULT_VALUE'
      Origin = 'IQ.FORE_EVAL.RESULT_VALUE'
      Size = 6
    end
    object QryFore_EvalDeviation: TFloatField
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'Deviation'
      Calculated = True
    end
    object QryFore_EvalFormula_Descrip: TStringField
      DisplayLabel = 'Formula Description'
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'Formula_Descrip'
      LookupDataSet = QryFormulas
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'FORE_FORMULA_ID'
      Size = 100
      Lookup = True
    end
    object QryFore_EvalTEXT_LOG: TStringField
      DisplayWidth = 10
      FieldName = 'TEXT_LOG'
      Origin = 'IQ.FORE_EVAL.TEXT_LOG'
      Visible = False
      Size = 2000
    end
    object QryFore_EvalID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.FORE_EVAL.ID'
      Visible = False
      Size = 0
    end
    object QryFore_EvalFORE_CALC_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FORE_CALC_ID'
      Origin = 'IQ.FORE_EVAL.FORE_CALC_ID'
      Visible = False
      Size = 0
    end
    object QryFore_EvalFORE_FORMULA_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FORE_FORMULA_ID'
      Origin = 'IQ.FORE_EVAL.FORE_FORMULA_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 18
    Top = 74
    object File1: TUniMenuItem
      Caption = 'File'
      object ForecastFormulas1: TUniMenuItem
        Caption = 'Forecast Formulas'
        OnClick = ForecastFormulas1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Report1: TUniMenuItem
      Caption = 'Report'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Forecast Formula Evaluation'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191076 $'
    BuildVersion = '176554'
    Left = 397
    Top = 70
  end
  object UpdateSQLForeCalc: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into fore_calc'
      
        '  (ID, FORE_ITEM_ID, DESCRIP, TIMESTAMP, FORE_FORMULA_ID_BEST, Q' +
        'TR_START, '
      '   QTR_END, ACT_VALUE, ARCUSTO_ID)'
      'values'
      
        '  (:ID, :FORE_ITEM_ID, :DESCRIP, :TIMESTAMP, :FORE_FORMULA_ID_BE' +
        'ST, :QTR_START, '
      '   :QTR_END, :ACT_VALUE, :ARCUSTO_ID)')
    ModifySQL.Strings = (
      'update fore_calc'
      'set'
      '  ID = :ID,'
      '  FORE_ITEM_ID = :FORE_ITEM_ID,'
      '  DESCRIP = :DESCRIP,'
      '  TIMESTAMP = :TIMESTAMP,'
      '  FORE_FORMULA_ID_BEST = :FORE_FORMULA_ID_BEST,'
      '  QTR_START = :QTR_START,'
      '  QTR_END = :QTR_END,'
      '  ACT_VALUE = :ACT_VALUE,'
      '  ARCUSTO_ID = :ARCUSTO_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from fore_calc'
      'where'
      '  ID = :OLD_ID')
    Left = 57
    Top = 104
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmForeCalc'
    WebUse = False
    TouchScreen = False
    Left = 431
    Top = 70
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 467
    Top = 70
  end
  object QryFormulas: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name, descrip, infix'
      '  from fore_formula'
      'order by id')
    Left = 198
    Top = 138
    object QryFormulasNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'IQ.FORE_FORMULA.NAME'
      Size = 25
    end
    object QryFormulasINFIX: TStringField
      DisplayLabel = 'Formula'
      DisplayWidth = 30
      FieldName = 'INFIX'
      Origin = 'IQ.FORE_FORMULA.INFIX'
      Size = 255
    end
    object QryFormulasDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.FORE_FORMULA.DESCRIP'
      Size = 100
    end
    object QryFormulasID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.FORE_FORMULA.ID'
      Visible = False
      Size = 0
    end
  end
  object QryArcusto: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, custno, company from arcusto'
      'order by custno')
    Left = 202
    Top = 75
    object QryArcustoCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'IQ.ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 60
      FieldName = 'COMPANY'
      Origin = 'IQ.ARCUSTO.COMPANY'
      Size = 60
    end
    object QryArcustoID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMFORECALC')
    SecurityCode = 'FRMFORECALC'
    Left = 500
    Top = 72
  end
  object SrcFormulas: TDataSource
    DataSet = QryFormulas
    Left = 256
    Top = 144
  end
  object SrcArcusto: TDataSource
    DataSet = QryArcusto
    Left = 264
    Top = 80
  end
end
