object FrmExpenseReportUsers: TFrmExpenseReportUsers
  Left = 70
  Top = 167
  HelpContext = 14820
  ClientHeight = 550
  ClientWidth = 591
  Caption = 'Expense Report Users'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 274
    Width = 591
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 277
    Width = 591
    Height = 273
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object GridDtl: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 589
      Height = 271
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 372
      IQComponents.Grid.Height = 185
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDtl
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
      IQComponents.Navigator.DataSource = SrcDtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 372
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 185
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDtl
      Columns = <
        item
          FieldName = 'DELEGATE_USER_NAME'
          Title.Caption = 'Delegate User Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object wwDBDelegate: TUniEdit
      Left = 336
      Top = 48
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 591
    Height = 274
    Hint = ''
    ActivePage = TabGrid
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabGrid: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabGrid'
      object IQSearch1: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 583
        Height = 246
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 366
        IQComponents.Grid.Height = 160
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcHdr
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
        IQComponents.Navigator.DataSource = SrcHdr
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 366
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 160
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcHdr
        Columns = <
          item
            FieldName = 'USER_NAME'
            Title.Caption = 'User'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EXP_APPROVER'
            Title.Caption = 'Approver'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MILEAGE_RATE'
            Title.Caption = 'Mileage Rate'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EMPNO'
            Title.Caption = 'Emp#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EMPLOYEE'
            Title.Caption = 'Employee'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDORNO'
            Title.Caption = 'Vendor#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Vendor'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VENDOR_CONTACT'
            Title.Caption = 'Vendor Contact'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NO_APPROVER_EDIT'
            Title.Caption = 'Do not allow approver edits'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'INACTIVE'
            Title.Caption = 'Inactive'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end
          item
            FieldName = 'WORKFLOW'
            Title.Caption = 'Workflow'
            Width = 64
            CheckBoxField.FieldValues = 'Y;N'
          end>
        TabsVisible = True
        Marker = 0
        object wwDBUserName: TUniEdit
          Left = 336
          Top = 48
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
        object wwDBEmployee: TUniEdit
          Left = 336
          Top = 72
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
        end
        object wwDBVendor: TUniEdit
          Left = 336
          Top = 96
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 4
        end
        object wwDBVendorContact: TUniEdit
          Left = 336
          Top = 120
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 6
        end
        object wwDBApprover: TUniEdit
          Left = 336
          Top = 144
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 5
        end
      end
    end
    object TabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabForm'
      DesignSize = (
        583
        246)
      object Label1: TUniLabel
        Left = 16
        Top = 15
        Width = 22
        Height = 13
        Hint = ''
        Caption = 'User'
        TabOrder = 11
      end
      object Label2: TUniLabel
        Left = 16
        Top = 42
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Approver'
        TabOrder = 12
      end
      object Label3: TUniLabel
        Left = 16
        Top = 71
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Mileage Rate'
        TabOrder = 13
      end
      object Label4: TUniLabel
        Left = 16
        Top = 100
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Emp#'
        TabOrder = 14
      end
      object Label5: TUniLabel
        Left = 248
        Top = 100
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Employee'
        TabOrder = 15
      end
      object Label6: TUniLabel
        Left = 16
        Top = 127
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Vendor#'
        TabOrder = 16
      end
      object Label7: TUniLabel
        Left = 16
        Top = 154
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Vendor Contact'
        TabOrder = 17
      end
      object Label8: TUniLabel
        Left = 248
        Top = 127
        Width = 34
        Height = 13
        Hint = ''
        Caption = 'Vendor'
        TabOrder = 18
      end
      object SBSearch: TUniSpeedButton
        Left = 554
        Top = 9
        Width = 25
        Height = 25
        Hint = 'Search...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = wwDBUserNameCustomDlg
      end
      object SpeedButton1: TUniSpeedButton
        Left = 555
        Top = 36
        Width = 25
        Height = 25
        Hint = 'Search...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = wwDBApproverCustomDlg
      end
      object SpeedButton2: TUniSpeedButton
        Left = 555
        Top = 94
        Width = 25
        Height = 25
        Hint = 'Search...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = wwDBEmployeeCustomDlg
      end
      object SpeedButton3: TUniSpeedButton
        Left = 555
        Top = 121
        Width = 25
        Height = 25
        Hint = 'Search...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = wwDBVendorCustomDlg
      end
      object SpeedButton4: TUniSpeedButton
        Left = 555
        Top = 148
        Width = 25
        Height = 25
        Hint = 'Search...'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        Anchors = [akTop, akRight]
        ParentColor = False
        Color = clWindow
        OnClick = wwDBVendorContactCustomDlg
      end
      object dbUsername: TUniDBEdit
        Left = 112
        Top = 11
        Width = 437
        Height = 21
        Hint = ''
        DataField = 'USER_NAME'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ReadOnly = True
      end
      object dbApprover: TUniDBEdit
        Left = 112
        Top = 38
        Width = 437
        Height = 21
        Hint = ''
        DataField = 'EXP_APPROVER'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object dbMilage: TUniDBEdit
        Left = 112
        Top = 67
        Width = 121
        Height = 21
        Hint = ''
        DataField = 'MILEAGE_RATE'
        DataSource = SrcHdr
        TabOrder = 2
      end
      object dbEmpno: TUniDBEdit
        Left = 112
        Top = 96
        Width = 121
        Height = 21
        Hint = ''
        DataField = 'EMPNO'
        DataSource = SrcHdr
        TabOrder = 3
        ReadOnly = True
      end
      object dbEmployee: TUniDBEdit
        Left = 304
        Top = 96
        Width = 245
        Height = 21
        Hint = ''
        DataField = 'EMPLOYEE'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ReadOnly = True
      end
      object dbVendorno: TUniDBEdit
        Left = 112
        Top = 123
        Width = 121
        Height = 21
        Hint = ''
        DataField = 'VENDORNO'
        DataSource = SrcHdr
        TabOrder = 5
        ReadOnly = True
      end
      object dbCompany: TUniDBEdit
        Left = 304
        Top = 123
        Width = 245
        Height = 21
        Hint = ''
        DataField = 'COMPANY'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        ReadOnly = True
      end
      object dbVendCont: TUniDBEdit
        Left = 112
        Top = 150
        Width = 437
        Height = 21
        Hint = ''
        DataField = 'VENDOR_CONTACT'
        DataSource = SrcHdr
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        ReadOnly = True
      end
      object dbNoApprEdit: TUniDBCheckBox
        Tag = 1999
        Left = 16
        Top = 177
        Width = 161
        Height = 17
        Hint = ''
        DataField = 'NO_APPROVER_EDIT'
        DataSource = SrcHdr
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Do not allow approver edits'
        TabOrder = 8
      end
      object dbInactive: TUniDBCheckBox
        Tag = 1999
        Left = 16
        Top = 196
        Width = 161
        Height = 17
        Hint = ''
        DataField = 'INACTIVE'
        DataSource = SrcHdr
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Inactive'
        TabOrder = 9
      end
      object dbWorkflow: TUniDBCheckBox
        Tag = 1999
        Left = 16
        Top = 217
        Width = 161
        Height = 17
        Hint = ''
        DataField = 'WORKFLOW'
        DataSource = SrcHdr
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Workflow'
        TabOrder = 10
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 424
    Top = 440
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
      object New1: TUniMenuItem
        Caption = 'New'
        Visible = False
        OnClick = New1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object ViewAll1: TUniMenuItem
        Caption = 'View All'
        GroupIndex = 1
        RadioItem = True
        OnClick = FilterPkHide
      end
      object ViewActive1: TUniMenuItem
        Caption = 'View Active'
        GroupIndex = 1
        RadioItem = True
        OnClick = FilterPkHide
      end
      object ViewInactive1: TUniMenuItem
        Caption = 'View Inactive'
        GroupIndex = 1
        RadioItem = True
        OnClick = FilterPkHide
      end
      object N1: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object DefaultMileageRate1: TUniMenuItem
        Caption = 'Default Mileage Rate'
        GroupIndex = 1
        OnClick = DefaultMileageRate1Click
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
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 112
    Top = 435
  end
  object QryHdr: TFDQuery
    BeforeOpen = QryHdrBeforeOpen
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterDelete
    BeforeDelete = QryHdrBeforeDelete
    AfterDelete = QryHdrAfterDelete
    OnNewRecord = QryHdrNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'exp_user'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select e.id,'
      '       e.user_name,'
      '       e.pr_emp_id,'
      '       e.vendor_id,'
      '       e.vendor_contact_id,'
      '       e.exp_approver,'
      '       e.mileage_rate,'
      '       e.inactive,'
      '       e.workflow,'
      
        '       e.NO_APPROVER_EDIT,                                      ' +
        '              '
      '       p.empno,'
      
        '       substrB( iqstring.Concat3W( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as employee,'
      '       v.vendorno,'
      '       v.company,'
      
        '       Trim(Trim(c.first_name) || '#39' '#39' || Trim(c.last_name)) as v' +
        'endor_contact'
      '  from exp_user e,'
      '       pr_emp p,'
      '       vendor v,'
      '       vendor_contact c'
      ' where e.pr_emp_id = p.id(+)'
      '   and e.vendor_id = v.id(+) '
      '   and e.vendor_contact_id = c.id(+)'
      
        '   and misc.pk_hide_filter( NVL(e.inactive, '#39'N'#39'), :selected_view' +
        ' ) = 1')
    Left = 120
    Top = 456
    ParamData = <
      item
        Name = 'selected_view'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHdrUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'e.USER_NAME'
      Size = 35
    end
    object QryHdrEXP_APPROVER: TStringField
      DisplayLabel = 'Approver'
      DisplayWidth = 35
      FieldName = 'EXP_APPROVER'
      Origin = 'e.EXP_APPROVER'
      Size = 35
    end
    object QryHdrMILEAGE_RATE: TBCDField
      DisplayLabel = 'Mileage Rate'
      DisplayWidth = 10
      FieldName = 'MILEAGE_RATE'
      Origin = 'e.MILEAGE_RATE'
    end
    object QryHdrEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Origin = 'p.EMPNO'
      Size = 25
    end
    object QryHdrEMPLOYEE: TStringField
      DisplayLabel = 'Employee'
      DisplayWidth = 61
      FieldName = 'EMPLOYEE'
      Origin = 'Trim(Trim(p.first_name) || '#39' '#39' || Trim(p.last_name))'
      Size = 255
    end
    object QryHdrVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryHdrCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 60
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object QryHdrVENDOR_CONTACT: TStringField
      DisplayLabel = 'Vendor Contact'
      DisplayWidth = 61
      FieldName = 'VENDOR_CONTACT'
      Origin = 'Trim(Trim(c.first_name) || '#39' '#39' || Trim(c.last_name))'
      Size = 61
    end
    object QryHdrNO_APPROVER_EDIT: TStringField
      DisplayLabel = 'Do not allow approver edits'
      DisplayWidth = 1
      FieldName = 'NO_APPROVER_EDIT'
      Origin = 'e.NO_APPROVER_EDIT'
      Size = 1
    end
    object QryHdrINACTIVE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'INACTIVE'
      Size = 1
    end
    object QryHdrWORKFLOW: TStringField
      DisplayLabel = 'Workflow'
      DisplayWidth = 1
      FieldName = 'WORKFLOW'
      Size = 1
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryHdrPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object QryHdrVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryHdrVENDOR_CONTACT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_CONTACT_ID'
      Visible = False
      Size = 0
    end
  end
  object QryDtl: TFDQuery
    BeforePost = QryDtlBeforePost
    AfterPost = QryDtlAfterPost
    AfterDelete = QryDtlAfterPost
    MasterSource = SrcHdr
    MasterFields = 'ID'
    DetailFields = 'EXP_USER_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'exp_user_delegate'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select id,'
      '       delegate_user_name,'
      '       exp_user_id'
      '  from exp_user_delegate'
      '     where exp_user_id = :ID')
    Left = 56
    Top = 328
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDtlDELEGATE_USER_NAME: TStringField
      DisplayLabel = 'Delegate User Name'
      DisplayWidth = 35
      FieldName = 'DELEGATE_USER_NAME'
      Origin = 'IQ.EXP_USER_DELEGATE.DELEGATE_USER_NAME'
      Size = 35
    end
    object QryDtlID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.EXP_USER_DELEGATE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryDtlEXP_USER_ID: TBCDField
      FieldName = 'EXP_USER_ID'
      Origin = 'IQ.EXP_USER_DELEGATE.EXP_USER_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 40
    Top = 316
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into exp_user'
      '  (ID, USER_NAME, PR_EMP_ID, VENDOR_ID, VENDOR_CONTACT_ID, '
      'EXP_APPROVER, '
      '   MILEAGE_RATE, NO_APPROVER_EDIT,   INACTIVE, WORKFLOW)'
      'values'
      '  (:ID, :USER_NAME, :PR_EMP_ID, :VENDOR_ID, :VENDOR_CONTACT_ID, '
      ':EXP_APPROVER, '
      '   :MILEAGE_RATE, :NO_APPROVER_EDIT, :INACTIVE, :WORKFLOW)')
    ModifySQL.Strings = (
      'update exp_user'
      'set'
      '  ID = :ID,'
      '  USER_NAME = :USER_NAME,'
      '  PR_EMP_ID = :PR_EMP_ID,'
      '  VENDOR_ID = :VENDOR_ID,'
      '  VENDOR_CONTACT_ID = :VENDOR_CONTACT_ID,'
      '  EXP_APPROVER = :EXP_APPROVER,'
      '  MILEAGE_RATE = :MILEAGE_RATE,'
      '  INACTIVE = :INACTIVE,'
      '  WORKFLOW = :WORKFLOW,'
      '  NO_APPROVER_EDIT = :NO_APPROVER_EDIT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from exp_user'
      'where'
      '  ID = :OLD_ID')
    Left = 136
    Top = 456
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Expense Report Users'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197091 $'
    BuildVersion = '176554'
    Left = 176
    Top = 459
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into exp_user_delegate'
      '  (ID, DELEGATE_USER_NAME, EXP_USER_ID)'
      'values'
      '  (:ID, :DELEGATE_USER_NAME, :EXP_USER_ID)')
    ModifySQL.Strings = (
      'update exp_user_delegate'
      'set'
      '  ID = :ID,'
      '  DELEGATE_USER_NAME = :DELEGATE_USER_NAME,'
      '  EXP_USER_ID = :EXP_USER_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from exp_user_delegate'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 344
  end
  object PkUsers: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select user_name as user_name from s_user_general'
      '  where user_name not in (select user_name from exp_user)'
      '      and misc.Eplant_Filter_Include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 451
    object PkUsersUSER_NAME: TStringField
      DisplayLabel = 'User'
      FieldName = 'USER_NAME'
      Size = 35
    end
  end
  object PkApprover: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select user_name as user_name from s_user_general'
      'where misc.Eplant_Filter_Include_nulls(eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 451
    object PkApproverUSER_NAME: TStringField
      DisplayLabel = 'Approver'
      FieldName = 'USER_NAME'
      Origin = 'IQ.S_USER_GENERAL.USER_NAME'
      Size = 35
    end
  end
  object PKVendors: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select id,'
      '       vendorno,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       city,'
      '       state,'
      '       zip,'
      '       currency_id,'
      '       pk_hide  '
      '  from v_vendor       ')
    OnIQModify = PKVendorsIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 450
    object PKVendorsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKVendorsCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PKVendorsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object PKVendorsADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PKVendorsADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PKVendorsCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PKVendorsSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PKVendorsZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PKVendorsCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Origin = 'VENDOR.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object PKVendorsPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkEmp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select e.id as id,'
      '       e.empno as empno,'
      
        '       substrB( iqstring.Concat3W( e.First_Name, e.Middle_Name, ' +
        'e.Last_Name), 1, 255) as employee,'
      '       e.first_name           as first_name,'
      '       e.middle_name          as middle_name,'
      '       e.last_name            as last_name,'
      '       e.ssnmbr               as ssnmbr,'
      '       e.addr1                as addr1,'
      '       e.addr2                as addr2,'
      '       e.state                as state,'
      '       e.country              as country,'
      '       e.zip                  as zip,'
      '       e.phone_number         as phone_number,'
      '       e.city                 as city,'
      '       e.charge_rate          as charge_rate,'
      '       e.status_code          as status_code,'
      '       e.date_hired           as date_hired,'
      '       e.termination_date     as termination_date,'
      '       e.last_review_date     as last_review_date,'
      '       e.next_review_date     as next_review_date,'
      '       e.PK_HIDE              as PK_HIDE'
      '  from pr_emp e,'
      '       pr_paygroup g'
      ' where misc.eplant_filter(g.eplant_id) = 1'
      '   and e.pr_paygroup_id = g.id(+)'
      '   and (e.pr_paygroup_id is null'
      '        or e.pr_paygroup_id in (select pr_paygroup_id'
      '                                  from s_user_paygroup'
      
        '                                 where misc.GetUserName = user_n' +
        'ame))'
      ''
      ''
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 361
    Top = 489
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object PkEmpEMPLOYEE: TStringField
      DisplayLabel = 'Employee'
      FieldName = 'EMPLOYEE'
      Size = 255
    end
    object PkEmpPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.PR_EMP.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkVendorConact: TIQWebHpick
    BeforeOpen = PkVendorConactBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       contact_seqno as contact_seqno,'
      
        '       Trim(Trim(first_name) || '#39' '#39' || Trim(last_name)) as conta' +
        'ct'
      '  from vendor_contact'
      ' where vendor_id = :AVendor_id')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 288
    Top = 488
    ParamData = <
      item
        Name = 'AVendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkVendorConactID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.VENDOR_CONTACT.ID'
      Visible = False
      Size = 0
    end
    object PkVendorConactCONTACT_SEQNO: TBCDField
      DisplayLabel = 'Seq #'
      FieldName = 'CONTACT_SEQNO'
      Origin = 'IQ.VENDOR_CONTACT.CONTACT_SEQNO'
      Size = 0
    end
    object PkVendorConactCONTACT: TStringField
      DisplayLabel = 'Vendor Contact'
      FieldName = 'CONTACT'
      Origin = 'IQ.VENDOR_CONTACT.FIRST_NAME'
      Size = 61
    end
  end
  object PkDelegates: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select user_name as user_name from s_user_general')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 192
    Top = 340
    object PkDelegatesUSER_NAME: TStringField
      DisplayLabel = 'User'
      FieldName = 'USER_NAME'
      Origin = 'IQ.S_USER_GENERAL.USER_NAME'
      Size = 35
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMEXPENSEREPORTUSERS'
    Left = 208
    Top = 459
  end
  object PkExpUsers: TIQWebHpick
    BeforeOpen = PkExpUsersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select e.id as id,'
      '       e.user_name as user_name,'
      '       e.exp_approver as approver,'
      '       e.mileage_rate as milage_rate,'
      '       NVL(e.workflow, '#39'N'#39') as workflow,'
      
        '       NVL(e.NO_APPROVER_EDIT, '#39'N'#39') as NO_APPROVER_EDIT,        ' +
        '                                            '
      '       p.empno as empno,'
      
        '       substrB( iqstring.Concat3W( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as employee,'
      '       v.vendorno as vendorno,'
      '       v.company as vendor,'
      
        '       Trim(Trim(c.first_name) || '#39' '#39' || Trim(c.last_name)) as v' +
        'endor_contact'
      '  from exp_user e,'
      '       pr_emp p,'
      '       vendor v,'
      '       vendor_contact c'
      ' where e.pr_emp_id = p.id(+)'
      '   and e.vendor_id = v.id(+) '
      '   and e.vendor_contact_id = c.id(+)'
      
        '   and misc.pk_hide_filter( NVL(e.inactive, '#39'N'#39'), :selected_view' +
        ' ) = 1')
    OnIQModify = PkExpUsersIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 403
    ParamData = <
      item
        Name = 'selected_view'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkExpUsersUSER_NAME: TStringField
      DisplayLabel = 'User'
      FieldName = 'USER_NAME'
      Size = 35
    end
    object PkExpUsersAPPROVER: TStringField
      DisplayLabel = 'Approver'
      FieldName = 'APPROVER'
      Size = 35
    end
    object PkExpUsersMILAGE_RATE: TBCDField
      DisplayLabel = 'Milage Rate'
      FieldName = 'MILAGE_RATE'
    end
    object PkExpUsersWORKFLOW: TStringField
      DisplayLabel = 'Workflow'
      FieldName = 'WORKFLOW'
      Size = 1
    end
    object PkExpUsersNO_APPROVER_EDIT: TStringField
      DisplayLabel = 'Do not allow approver edits'
      FieldName = 'NO_APPROVER_EDIT'
      Size = 1
    end
    object PkExpUsersEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PkExpUsersEMPLOYEE: TStringField
      DisplayLabel = 'Employee'
      FieldName = 'EMPLOYEE'
      Size = 255
    end
    object PkExpUsersVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object PkExpUsersVENDOR: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDOR'
      Size = 60
    end
    object PkExpUsersVENDOR_CONTACT: TStringField
      DisplayLabel = 'Vendor Contact'
      FieldName = 'VENDOR_CONTACT'
      Size = 61
    end
    object PkExpUsersID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
