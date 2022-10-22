object FrmEditForecast: TFrmEditForecast
  Left = 125
  Top = 149
  ClientHeight = 578
  ClientWidth = 688
  Caption = 'Edit Forecast'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object Panel2: TUniPanel
    Left = 0
    Top = 58
    Width = 688
    Height = 520
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 1
      Top = 165
      Width = 686
      Height = 3
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
    object pnlCust: TUniPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 164
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'pnlCust'
      object wwgridCust: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 684
        Height = 162
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
        IQComponents.Grid.Width = 467
        IQComponents.Grid.Height = 76
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcFore_Cust
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
        IQComponents.Navigator.DataSource = wwSrcFore_Cust
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 467
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 76
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcFore_Cust
        Columns = <
          item
            FieldName = 'ID'
            Title.Caption = 'ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CustNo'
            Title.Caption = 'Cust #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Company'
            Title.Caption = 'Company'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 168
      Width = 686
      Height = 34
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ''
      object DDApply: TIQWebDropDownButton
        Left = 5
        Top = 4
        Width = 45
        Height = 28
        Hint = 'Update Price'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Caption = ''
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFD
          FDFDFDFD002A00FDFDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFD
          FDFDFDFDFD00B21AFDFDFDFDFDFDFDFDFDFDFDFDFD00F75BFDFDFDFDFDFDFDFD
          FDFDFDFDFD00BA1AFDFDFDFDFDFDFDFDFDFDFDFDFD00075BFDFDFDFDFDFDFDFD
          00FDFDFDFD00BA1AFDFDFDFDFDFDFDFD00FDFDFDFD00075BFDFDFDFDFDFDFD00
          00FDFDFDFD00BE1AFDFDFDFDFDFDFD0000FDFDFDFD00085BFDFDFDFDFDFD002A
          00FDFDFD00B2F61AFDFDFDFDFDFD00A400FDFDFD00F7FF5BFDFDFDFDFD002AB2
          00000000B2BE1AFDFDFDFDFDFD00A4F700000000F7085BFDFDFDFDFD002AB2B2
          B22A2ABABEF61AFDFDFDFDFD00A4F7F7F7A4A40708FF5BFDFDFDFD002AB2BABA
          BABABEF6F61AFDFDFDFDFD00A4F70707070708FFFF5BFDFDFDFDFDFD00BABABE
          F6F6F61A1AFDFDFDFDFDFDFD00070708FFFFFF5B5BFDFDFDFDFDFDFDFD00BEF6
          1A1A1AFDFDFDFDFDFDFDFDFDFD0008FF5B5B5BFDFDFDFDFDFDFDFDFDFDFD00F6
          1AFDFDFDFDFDFDFDFDFDFDFDFDFD00FF5BFDFDFDFDFDFDFDFDFDFDFDFDFDFD00
          1AFDFDFDFDFDFDFDFDFDFDFDFDFDFD005BFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFDFDFD}
        TabOrder = 1
        OnClick = DDApplyClick
      end
    end
    object wwDBLookupCombo1: TUniDBLookupComboBox
      Left = 21
      Top = 58
      Width = 150
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListFieldIndex = 0
      TabStop = False
      TabOrder = 2
      Color = clWindow
    end
    object wwDBLookupCombo2: TUniDBLookupComboBox
      Left = 21
      Top = 91
      Width = 150
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListFieldIndex = 0
      TabStop = False
      TabOrder = 3
      Color = clWindow
    end
    object PageControl1: TUniPageControl
      Left = 1
      Top = 202
      Width = 686
      Height = 317
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = TabSheet1
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 4
      TabStop = False
      OnChange = PageControl1Change
      object TabSheet1: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Forecast'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object gridForeDtl: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 678
          Height = 285
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
          IQComponents.Grid.Width = 461
          IQComponents.Grid.Height = 199
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = wwSrcFore_Dtl
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
          IQComponents.Navigator.DataSource = wwSrcFore_Dtl
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 461
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 199
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcFore_Dtl
          Columns = <
            item
              FieldName = 'QTY'
              Title.Caption = 'Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PRICE'
              Title.Caption = 'Price'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REQ_DATE'
              Title.Caption = 'Required~Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ship_to_attn'
              Title.Caption = 'Ship To'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DivisionName'
              Title.Caption = 'Division Name'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NOTE1'
              Title.Caption = 'Note'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'WEEK'
              Title.Caption = 'Week'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ParentItemNo'
              Title.Caption = 'Parent Item #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIP_TO_ID'
              Title.Caption = 'Ship To ID'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          TabsVisible = True
          Marker = 0
        end
        object wwDBLookupComboShipTo: TUniDBLookupComboBox
          Left = 303
          Top = 96
          Width = 149
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          DataField = 'SHIP_TO_ID'
          DataSource = wwSrcFore_Dtl
          TabOrder = 1
          Color = clWindow
          OnDropDown = wwDBLookupComboShipToDropDown
        end
        object wwDBComboDlgDivision: TUniEdit
          Left = 459
          Top = 97
          Width = 149
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ''
          TabOrder = 2
          OnKeyDown = wwDBComboDlgDivisionKeyDown
        end
        object wwDBComboDlgNote: TUniEdit
          Left = 459
          Top = 138
          Width = 149
          Height = 25
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ''
          TabOrder = 3
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 1
        Caption = 'Summary'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object pnlSummary: TUniPanel
          Left = 0
          Top = 0
          Width = 678
          Height = 285
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object pgctrlSummary: TUniPageControl
            Left = 1
            Top = 1
            Width = 676
            Height = 283
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ActivePage = TabSumWeekly
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 680
            ExplicitHeight = 287
            object TabSumWeekly: TUniTabSheet
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'TabSumWeekly'
              object Label1: TUniLabel
                Left = 0
                Top = 0
                Width = 190
                Height = 17
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Forecast consumption: Weekly'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object Bevel1: TUniPanel
                Left = 0
                Top = 17
                Width = 668
                Height = 4
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
              object gridForeWk: TIQUniGridControl
                Left = 0
                Top = 21
                Width = 668
                Height = 230
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
                IQComponents.Grid.Width = 451
                IQComponents.Grid.Height = 144
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = wwSrcForeWk
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
                IQComponents.Navigator.DataSource = wwSrcForeWk
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 451
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 144
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = wwSrcForeWk
                Columns = <
                  item
                    FieldName = 'QTY'
                    Title.Caption = 'Qty'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'PRICE'
                    Title.Caption = 'Price'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'REQ_DATE'
                    Title.Caption = 'Required~Date'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'WEEK'
                    Title.Caption = 'Wk'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SHIPPED'
                    Title.Caption = 'Shipped'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ONORDER'
                    Title.Caption = 'On Order'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'UNCONSUMED'
                    Title.Caption = 'Unconsumed~Forecast'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ship_to_attn'
                    Title.Caption = 'Ship To'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SHIP_TO_ID'
                    Title.Caption = 'Ship To ID'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                TabsVisible = True
                Marker = 0
              end
              object wwDBLookupComboShipToWeekly: TUniDBLookupComboBox
                Left = 310
                Top = 96
                Width = 149
                Height = 25
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'SHIP_TO_ID'
                DataSource = wwSrcForeWk
                TabOrder = 1
                Color = clWindow
                OnDropDown = wwDBLookupComboShipToDropDown
              end
            end
            object TabSumMonthly: TUniTabSheet
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ImageIndex = 1
              Caption = 'TabSumMonthly'
              object lblForeConsMonthly: TUniLabel
                Left = 0
                Top = 0
                Width = 194
                Height = 17
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Forecast consumption: Monthly'
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
              object Bevel2: TUniPanel
                Left = 0
                Top = 17
                Width = 668
                Height = 4
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Align = alTop
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 3
                Caption = ''
              end
              object gridForeMonth: TIQUniGridControl
                Left = 0
                Top = 21
                Width = 668
                Height = 230
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
                IQComponents.Grid.Width = 451
                IQComponents.Grid.Height = 144
                IQComponents.Grid.Hint = ''
                IQComponents.Grid.DataSource = wwSrcForeMonth
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
                IQComponents.Navigator.DataSource = wwSrcForeMonth
                IQComponents.Navigator.LayoutConfig.Region = 'east'
                IQComponents.Navigator.TabOrder = 3
                IQComponents.HiddenPanel.Left = 451
                IQComponents.HiddenPanel.Top = 29
                IQComponents.HiddenPanel.Width = 209
                IQComponents.HiddenPanel.Height = 144
                IQComponents.HiddenPanel.Hint = ''
                IQComponents.HiddenPanel.Visible = True
                IQComponents.HiddenPanel.Align = alRight
                IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
                IQComponents.FormTab.Hint = ''
                IQComponents.FormTab.ImageIndex = 1
                IQComponents.FormTab.Caption = 'Form'
                IQComponents.FormTab.Layout = 'border'
                DataSource = wwSrcForeMonth
                Columns = <
                  item
                    FieldName = 'QTY'
                    Title.Caption = 'Qty'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'PRICE'
                    Title.Caption = 'Price'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'REQ_DATE'
                    Title.Caption = 'Required~Date'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'WEEK'
                    Title.Caption = 'Wk'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SHIPPED'
                    Title.Caption = 'Month~Shipped'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ONORDER'
                    Title.Caption = 'Month~On Order'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'UNCONSUMED'
                    Title.Caption = 'Unconsumed~Forecast'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'ship_to_attn'
                    Title.Caption = 'Ship To'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    FieldName = 'SHIP_TO_ID'
                    Title.Caption = 'Ship To ID'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end>
                TabsVisible = True
                Marker = 0
              end
              object wwDBLookupComboShipToMonthly: TUniDBLookupComboBox
                Left = 308
                Top = 84
                Width = 149
                Height = 25
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ListFieldIndex = 0
                DataField = 'SHIP_TO_ID'
                DataSource = wwSrcForeMonth
                TabOrder = 1
                Color = clWindow
                OnDropDown = wwDBLookupComboShipToDropDown
              end
            end
          end
        end
      end
    end
  end
  object PnlToolbar: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 688
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
      Width = 686
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
        Width = 79
        Height = 18
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Customers'
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
  object wwSrcFore_Cust: TDataSource
    DataSet = wwQryFore_Cust
    Left = 56
    Top = 306
  end
  object wwSrcForeWk: TDataSource
    DataSet = wwQryForeWk
    Left = 167
    Top = 306
  end
  object wwQryArcusto: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, custno, company, ecode from v_arcusto'
      'order by custno'
      ' ')
    Left = 155
    Top = 386
    object wwQryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQryArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object wwQryArcustoECODE: TStringField
      DisplayLabel = 'ECode'
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 'ARCUSTO.ECODE'
      Visible = False
      Size = 10
    end
    object wwQryArcustoID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 280
    Top = 88
    object CustomerPickList1: TUniMenuItem
      Caption = 'Customer PickList'
      OnClick = CustomerPickList1Click
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       addr1,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id'
      '  from v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 20
    Top = 306
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'NavQty'
      'wwTblFore_Cust'
      'TblFore_Dtl')
    SecurityCode = 'FRMEDITFORECAST'
    Left = 310
    Top = 88
  end
  object wwQryTotShip: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- NOT in Use'
      'select Sum(qtyshipped) as qty_shipped'
      '  from v_shipments'
      ' where arinvt_id = :arinvt_id'
      '   and arcusto_id = :arcusto_id'
      '   and shipdate between :date1 and :date2'
      ' '
      ' ')
    Left = 280
    Top = 135
    ParamData = <
      item
        Name = 'Arinvt_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object wwQryTotShipQTY_SHIPPED: TFMTBCDField
      FieldName = 'QTY_SHIPPED'
      Origin = 'V_SHIPMENTS.QTYSHIPPED'
      Size = 38
    end
  end
  object wwQryTotOrd: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '-- NOT in Use'
      'select Sum(ship_quan) as ord_quan'
      '  from v_backlog_releases_qk'
      ' where arinvt_id = :arinvt_id'
      '   and arcusto_id = :arcusto_id'
      '   and promise_date between :date1 and :date2'
      ''
      ''
      ' '
      ' ')
    Left = 308
    Top = 135
    ParamData = <
      item
        Name = 'Arinvt_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object wwQryTotOrdORD_QUAN: TFMTBCDField
      FieldName = 'ORD_QUAN'
      Origin = 'V_BACKLOG_RELEASES.SHIP_QUAN'
      Size = 38
    end
  end
  object wwQryForeWk: TFDQuery
    Tag = 1
    AfterOpen = wwQryForeWkAfterOpen
    BeforeClose = wwQryForeWkBeforeClose
    BeforeInsert = TblFore_DtlBeforeInsert
    AfterInsert = wwQryFore_DtlAfterEdit
    BeforeEdit = TblFore_DtlBeforeInsert
    AfterEdit = wwQryFore_DtlAfterEdit
    BeforePost = TblFore_DtlBeforePost
    AfterPost = PostAndRefreshParentsForm
    AfterDelete = PostAndRefreshParentsForm
    OnCalcFields = wwQryFore_DtlCalcFields
    OnNewRecord = TblFore_DtlNewRecord
    CachedUpdates = True
    MasterSource = wwSrcFore_Cust
    MasterFields = 'Arinvt_ID;ARCUSTO_ID;Date1;Date2;Fore_Head_ID'
    OnUpdateRecord = wwQryForeWkUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select fore_item_id,'
      '       fore_cust_id,'
      '       fore_dtl_id,'
      '       arcusto_id,'
      '       week,'
      '       year,'
      '       qty,'
      '       price,'
      '       req_date,'
      '       qty_shipped as shipped,'
      '       qty_ordered as onorder,'
      '       qty_unconsumed as unconsumed,'
      '       ship_to_id,'
      
        '       fore_dtl_id as id, -- used on the front end in BeforePost' +
        ' to validate'
      '       kind,'
      '       division_id'
      '  from'
      '       v_forecast_weekly '
      ' where '
      '       arinvt_id = :arinvt_id'
      '   and NVL(arcusto_id, 0) = NVL(:arcusto_id, 0)'
      '   and req_date between :date1 and :date2'
      '   and fore_head_id = :fore_head_id'
      ' order by '
      '       req_date,'
      '       fore_dtl_id'
      ' '
      ' '
      ' '
      ' ')
    Left = 167
    Top = 326
    ParamData = <
      item
        Name = 'Arinvt_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Fore_Head_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryForeWkQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 7
      FieldName = 'QTY'
      OnChange = TblFore_DtlQTYChange
      Size = 38
    end
    object wwQryForeWkPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 7
      FieldName = 'PRICE'
      Size = 38
    end
    object wwQryForeWkREQ_DATE: TDateTimeField
      DisplayLabel = 'Required~Date'
      DisplayWidth = 9
      FieldName = 'REQ_DATE'
      OnChange = TblFore_DtlQTYChange
    end
    object wwQryForeWkWEEK: TFMTBCDField
      DisplayLabel = 'Wk'
      DisplayWidth = 3
      FieldName = 'WEEK'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeWkSHIPPED: TFMTBCDField
      DisplayLabel = 'Shipped'
      DisplayWidth = 9
      FieldName = 'SHIPPED'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeWkONORDER: TFMTBCDField
      DisplayLabel = 'On Order'
      DisplayWidth = 8
      FieldName = 'ONORDER'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeWkUNCONSUMED: TFMTBCDField
      DisplayLabel = 'Unconsumed~Forecast'
      DisplayWidth = 10
      FieldName = 'UNCONSUMED'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeWkship_to_attn: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 22
      FieldKind = fkLookup
      FieldName = 'ship_to_attn'
      LookupDataSet = QryShip_To
      LookupKeyFields = 'ID'
      LookupResultField = 'ATTN'
      KeyFields = 'SHIP_TO_ID'
      Size = 30
      Lookup = True
    end
    object wwQryForeWkSHIP_TO_ID: TFMTBCDField
      DisplayLabel = 'Ship To ID'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Size = 38
    end
    object wwQryForeWkFORE_ITEM_ID: TFMTBCDField
      FieldName = 'FORE_ITEM_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeWkFORE_CUST_ID: TFMTBCDField
      FieldName = 'FORE_CUST_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeWkFORE_DTL_ID: TFMTBCDField
      FieldName = 'FORE_DTL_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeWkYEAR: TFMTBCDField
      DisplayLabel = 'Yr'
      FieldName = 'YEAR'
      ReadOnly = True
      Visible = False
      Size = 38
    end
    object wwQryForeWkARCUSTO_ID: TFMTBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeWkIs_Ship_To_Belongs_Arcusto: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Is_Ship_To_Belongs_Arcusto'
      Visible = False
      Size = 1
      Calculated = True
    end
    object wwQryForeWkID: TFMTBCDField
      FieldName = 'ID'
      Visible = False
      Size = 38
    end
    object wwQryForeWkKIND: TStringField
      FieldName = 'KIND'
      Visible = False
      Size = 1
    end
    object wwQryForeWkDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object updtForeSummary: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into FORE_DTL'
      
        '  (FORE_CUST_ID, ID, WEEK, YEAR, QTY, PRICE, REQ_DATE, SHIP_TO_I' +
        'D)'
      'values'
      
        '  (:FORE_CUST_ID, :FORE_DTL_ID, :WEEK, :YEAR, :QTY, :PRICE, :REQ' +
        '_DATE, :SHIP_TO_ID)'
      ' ')
    ModifySQL.Strings = (
      'update FORE_DTL'
      '   set FORE_CUST_ID = :FORE_CUST_ID,'
      '       ID = :FORE_DTL_ID,'
      '       WEEK = :WEEK,'
      '       YEAR = :YEAR,'
      '       QTY = :QTY,'
      '       PRICE = :PRICE,'
      '       REQ_DATE = :REQ_DATE,'
      '       SHIP_TO_ID = :SHIP_TO_ID'
      ' where'
      '       ID = :OLD_FORE_DTL_ID'
      '       ')
    DeleteSQL.Strings = (
      'delete from FORE_DTL'
      ' where ID = :OLD_FORE_DTL_ID')
    Left = 191
    Top = 335
  end
  object MainMenu1: TUniMainMenu
    Left = 340
    Top = 88
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Edit Forecast'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197128 $'
    BuildVersion = '176554'
    Left = 370
    Top = 88
  end
  object wwSrcFore_Dtl: TDataSource
    DataSet = wwQryFore_Dtl
    Left = 108
    Top = 306
  end
  object wwQryFore_Dtl: TFDQuery
    Tag = 1
    AfterOpen = wwQryForeWkAfterOpen
    BeforeClose = wwQryForeWkBeforeClose
    BeforeInsert = TblFore_DtlBeforeInsert
    AfterInsert = wwQryFore_DtlAfterEdit
    BeforeEdit = TblFore_DtlBeforeInsert
    AfterEdit = wwQryFore_DtlAfterEdit
    BeforePost = TblFore_DtlBeforePost
    AfterPost = PostAndRefreshParentsForm
    BeforeDelete = wwQryFore_DtlBeforeDelete
    AfterDelete = PostAndRefreshParentsForm
    OnCalcFields = wwQryFore_DtlCalcFields
    OnNewRecord = TblFore_DtlNewRecord
    CachedUpdates = True
    MasterSource = wwSrcFore_Cust
    MasterFields = 'ID;Date1;Date2'
    OnUpdateRecord = wwQryFore_DtlUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       fore_cust_id,'
      '       qty,'
      '       price,'
      '       req_date,'
      '       week,'
      '       year,'
      '       note1,'
      '       ship_to_id,'
      '       division_id,'
      '       parent_id'
      '  from'
      '       fore_dtl'
      ' where'
      '       fore_cust_id = :id'
      '   and req_date between :date1 and :date2'
      ' order by'
      '       req_date,'
      '       id'
      ' '
      ' '
      ' ')
    Left = 108
    Top = 322
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end>
    object wwQryFore_DtlQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 11
      FieldName = 'QTY'
      OnChange = TblFore_DtlQTYChange
      Size = 6
    end
    object wwQryFore_DtlPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 13
      FieldName = 'PRICE'
      Size = 6
    end
    object wwQryFore_DtlREQ_DATE: TDateTimeField
      DisplayLabel = 'Required~Date'
      DisplayWidth = 12
      FieldName = 'REQ_DATE'
      OnChange = TblFore_DtlQTYChange
    end
    object wwQryFore_DtlWEEK: TBCDField
      DisplayLabel = 'Week'
      DisplayWidth = 6
      FieldName = 'WEEK'
      ReadOnly = True
      Size = 0
    end
    object wwQryFore_Dtlship_to_attn: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'ship_to_attn'
      LookupDataSet = QryShip_To
      LookupKeyFields = 'ID'
      LookupResultField = 'ATTN'
      KeyFields = 'SHIP_TO_ID'
      Size = 60
      Lookup = True
    end
    object wwQryFore_DtlSHIP_TO_ID: TBCDField
      DisplayLabel = 'Ship To ID'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      OnChange = wwQryFore_DtlSHIP_TO_IDChange
      Size = 0
    end
    object wwQryFore_DtlDivisionName: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'DivisionName'
      LookupDataSet = PkDivision
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DIVISION_ID'
      Size = 30
      Lookup = True
    end
    object wwQryFore_DtlNOTE1: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 45
      FieldName = 'NOTE1'
      Size = 2000
    end
    object wwQryFore_DtlID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object wwQryFore_DtlFORE_CUST_ID: TBCDField
      FieldName = 'FORE_CUST_ID'
      Visible = False
      Size = 0
    end
    object wwQryFore_DtlIs_Ship_To_Belongs_Arcusto: TStringField
      FieldKind = fkCalculated
      FieldName = 'Is_Ship_To_Belongs_Arcusto'
      Visible = False
      Size = 1
      Calculated = True
    end
    object wwQryFore_DtlYEAR: TBCDField
      FieldName = 'YEAR'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwQryFore_DtlDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object wwQryFore_DtlParentItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'ParentItemNo'
      ReadOnly = True
      Size = 25
      Calculated = True
    end
    object wwQryFore_DtlPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object updtFore_Dtl: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into fore_dtl'
      
        '  (ID, FORE_CUST_ID, QTY, PRICE, REQ_DATE, WEEK, NOTE1, SHIP_TO_' +
        'ID, DIVISION_ID)'
      'values'
      
        '  (:ID, :FORE_CUST_ID, :QTY, :PRICE, :REQ_DATE, :WEEK, :NOTE1, :' +
        'SHIP_TO_ID, :DIVISION_ID)')
    ModifySQL.Strings = (
      'update fore_dtl'
      'set'
      '  ID = :ID,'
      '  FORE_CUST_ID = :FORE_CUST_ID,'
      '  QTY = :QTY,'
      '  PRICE = :PRICE,'
      '  REQ_DATE = :REQ_DATE,'
      '  WEEK = :WEEK,'
      '  NOTE1 = :NOTE1,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from fore_dtl'
      'where'
      '  ID = :OLD_ID')
    Left = 109
    Top = 341
  end
  object wwQryFore_Cust: TFDQuery
    BeforeOpen = wwQryFore_CustBeforeOpen
    AfterInsert = wwQryFore_CustAfterInsert
    BeforePost = AssignIDBeforePost
    AfterPost = RefreshParentForm
    AfterDelete = RefreshParentForm
    OnCalcFields = wwQryFore_CustCalcFields
    OnNewRecord = wwQryFore_CustNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = updtFore_Cust
    SQL.Strings = (
      'select id,'
      '       fore_item_id,'
      '       arcusto_id'
      '  from fore_cust'
      ' where fore_item_id = :fore_item_id'
      ' ')
    Left = 56
    Top = 320
    ParamData = <
      item
        Name = 'fore_item_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryFore_CustID: TBCDField
      DisplayWidth = 7
      FieldName = 'ID'
      Origin = 'IQ.FORE_CUST.ID'
      Size = 0
    end
    object wwQryFore_CustCustNo: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 19
      FieldKind = fkLookup
      FieldName = 'CustNo'
      LookupDataSet = wwQryArcusto
      LookupKeyFields = 'ID'
      LookupResultField = 'CUSTNO'
      KeyFields = 'ARCUSTO_ID'
      Lookup = True
    end
    object wwQryFore_CustCompany: TStringField
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'Company'
      LookupDataSet = wwQryArcusto
      LookupKeyFields = 'ID'
      LookupResultField = 'COMPANY'
      KeyFields = 'ARCUSTO_ID'
      Size = 35
      Lookup = True
    end
    object wwQryFore_CustFORE_ITEM_ID: TBCDField
      FieldName = 'FORE_ITEM_ID'
      Origin = 'IQ.FORE_CUST.FORE_ITEM_ID'
      Visible = False
      Size = 0
    end
    object wwQryFore_CustARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.FORE_CUST.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object wwQryFore_CustDate1: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Date1'
      Visible = False
      Calculated = True
    end
    object wwQryFore_CustDate2: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Date2'
      Visible = False
      Calculated = True
    end
    object wwQryFore_Custarinvt_id: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Arinvt_ID'
      Visible = False
      Calculated = True
    end
    object wwQryFore_CustKind: TStringField
      FieldKind = fkCalculated
      FieldName = 'Kind'
      Size = 1
      Calculated = True
    end
    object wwQryFore_CustFore_Head_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Fore_Head_ID'
      Calculated = True
    end
  end
  object updtFore_Cust: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into fore_cust'
      '  (ID, FORE_ITEM_ID, ARCUSTO_ID)'
      'values'
      '  (:ID, :FORE_ITEM_ID, :ARCUSTO_ID)')
    ModifySQL.Strings = (
      'update fore_cust'
      'set'
      '  ID = :ID,'
      '  FORE_ITEM_ID = :FORE_ITEM_ID,'
      '  ARCUSTO_ID = :ARCUSTO_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from fore_cust'
      'where'
      '  ID = :OLD_ID')
    Left = 56
    Top = 344
  end
  object QryShip_To: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       city,'
      '       state,'
      '       country,'
      '       zip'
      ' from ship_to'
      'where arcusto_id = :arcusto_id'
      '  and misc.eplant_filter( eplant_id ) = 1'
      '  and (:disp_all = 1'
      '       or'
      '       :disp_all = 0 and NVL(pk_hide, '#39'N'#39') = '#39'N'#39')'
      'order by attn')
    Left = 187
    Top = 386
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'disp_all'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShip_ToATTN: TStringField
      DisplayLabel = 'Attn'
      DisplayWidth = 25
      FieldName = 'ATTN'
      Origin = 'IQ.SHIP_TO.ATTN'
      Size = 60
    end
    object QryShip_ToADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 25
      FieldName = 'ADDR1'
      Origin = 'IQ.SHIP_TO.ADDR1'
      Size = 60
    end
    object QryShip_ToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'IQ.SHIP_TO.CITY'
      FixedChar = True
      Size = 30
    end
    object QryShip_ToSTATE: TStringField
      DisplayLabel = 'State/Prov'
      DisplayWidth = 5
      FieldName = 'STATE'
      Origin = 'IQ.SHIP_TO.STATE'
      FixedChar = True
    end
    object QryShip_ToCOUNTRY: TStringField
      DisplayLabel = 'Contry'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'IQ.SHIP_TO.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object QryShip_ToZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'IQ.SHIP_TO.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryShip_ToID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SHIP_TO.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcForeMonth: TDataSource
    DataSet = wwQryForeMonth
    Left = 217
    Top = 307
  end
  object wwQryForeMonth: TFDQuery
    Tag = 1
    AfterOpen = wwQryForeWkAfterOpen
    BeforeClose = wwQryForeWkBeforeClose
    BeforeInsert = TblFore_DtlBeforeInsert
    AfterInsert = wwQryFore_DtlAfterEdit
    BeforeEdit = TblFore_DtlBeforeInsert
    AfterEdit = wwQryFore_DtlAfterEdit
    BeforePost = TblFore_DtlBeforePost
    AfterPost = PostAndRefreshParentsForm
    AfterDelete = PostAndRefreshParentsForm
    OnCalcFields = wwQryFore_DtlCalcFields
    OnNewRecord = TblFore_DtlNewRecord
    CachedUpdates = True
    MasterSource = wwSrcFore_Cust
    MasterFields = 'Arinvt_ID;ARCUSTO_ID;Date1;Date2;Fore_Head_ID'
    OnUpdateRecord = wwQryForeWkUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select fore_item_id,'
      '       fore_cust_id,'
      '       fore_dtl_id,'
      '       arcusto_id,'
      '       week,'
      '       year,'
      '       qty,'
      '       price,'
      '       req_date,'
      '       qty_shipped as shipped,'
      '       qty_ordered as onorder,'
      '       qty_unconsumed as unconsumed,'
      '       ship_to_id,'
      
        '       fore_dtl_id as id, -- used on the front end in BeforePost' +
        ' to validate'
      '       kind,'
      '       division_id'
      '  from'
      '       v_forecast_monthly'
      ' where '
      '       arinvt_id = :arinvt_id'
      '   and NVL(arcusto_id, 0) = NVL(:arcusto_id, 0)'
      '   and req_date between :date1 and :date2'
      '   and fore_head_id = :fore_head_id'
      ' order by '
      '       req_date,'
      '       fore_dtl_id'
      ' '
      ' '
      ' '
      ' ')
    Left = 218
    Top = 328
    ParamData = <
      item
        Name = 'Arinvt_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date1'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Date2'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'Fore_Head_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryForeMonthQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 7
      FieldName = 'QTY'
      OnChange = TblFore_DtlQTYChange
      Size = 38
    end
    object wwQryForeMonthPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 7
      FieldName = 'PRICE'
      Size = 38
    end
    object wwQryForeMonthREQ_DATE: TDateTimeField
      DisplayLabel = 'Required~Date'
      DisplayWidth = 9
      FieldName = 'REQ_DATE'
      OnChange = TblFore_DtlQTYChange
    end
    object wwQryForeMonthWEEK: TFMTBCDField
      DisplayLabel = 'Wk'
      DisplayWidth = 3
      FieldName = 'WEEK'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeMonthSHIPPED: TFMTBCDField
      DisplayLabel = 'Month~Shipped'
      DisplayWidth = 9
      FieldName = 'SHIPPED'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeMonthONORDER: TFMTBCDField
      DisplayLabel = 'Month~On Order'
      DisplayWidth = 8
      FieldName = 'ONORDER'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeMonthUNCONSUMED: TFMTBCDField
      DisplayLabel = 'Unconsumed~Forecast'
      DisplayWidth = 10
      FieldName = 'UNCONSUMED'
      ReadOnly = True
      Size = 38
    end
    object wwQryForeMonthship_to_attn: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'ship_to_attn'
      LookupDataSet = QryShip_To
      LookupKeyFields = 'ID'
      LookupResultField = 'ATTN'
      KeyFields = 'SHIP_TO_ID'
      Size = 60
      Calculated = True
    end
    object wwQryForeMonthSHIP_TO_ID: TFMTBCDField
      DisplayLabel = 'Ship To ID'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Size = 38
    end
    object wwQryForeMonthFORE_ITEM_ID: TFMTBCDField
      FieldName = 'FORE_ITEM_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeMonthFORE_CUST_ID: TFMTBCDField
      FieldName = 'FORE_CUST_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeMonthFORE_DTL_ID: TFMTBCDField
      FieldName = 'FORE_DTL_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeMonthYEAR: TFMTBCDField
      DisplayLabel = 'Yr'
      FieldName = 'YEAR'
      ReadOnly = True
      Visible = False
      Size = 38
    end
    object wwQryForeMonthARCUSTO_ID: TFMTBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 38
    end
    object wwQryForeMonthIs_Ship_To_Belongs_Arcusto: TStringField
      FieldKind = fkCalculated
      FieldName = 'Is_Ship_To_Belongs_Arcusto'
      Visible = False
      Size = 1
      Calculated = True
    end
    object wwQryForeMonthID: TFMTBCDField
      FieldName = 'ID'
      Visible = False
      Size = 38
    end
    object wwQryForeMonthKIND: TStringField
      FieldName = 'KIND'
      Visible = False
      Size = 1
    end
    object wwQryForeMonthDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Size = 0
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 26
    Top = 385
    object Trace1: TUniMenuItem
      Caption = 'Trace'
      OnClick = Trace1Click
    end
  end
  object PkDivision: TIQWebHpick
    Active = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 256
    Top = 386
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 292
    Top = 388
    object UpdatehighlitedQuantity1: TUniMenuItem
      Caption = 'Update highlighted Quantity'
      OnClick = DDApplyClick
    end
    object UpdateTheseQuantities1: TUniMenuItem
      Caption = 'Update These Quantities'
      OnClick = UpdateTheseQuantities1Click
    end
  end
end
