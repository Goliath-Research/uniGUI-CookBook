object FrmInvGLAcct: TFrmInvGLAcct
  Left = 560
  Top = 150
  HelpContext = 1308402
  ClientHeight = 402
  ClientWidth = 488
  Caption = 'Set GL Accounts for inventory items'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbToggle: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Form - Table Toggle'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbToggleClick
    end
    object sbSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search Item'
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
      ParentColor = False
      Color = clWindow
      OnClick = sbSearchClick
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 27
    Width = 488
    Height = 375
    Hint = ''
    ActivePage = TabGrid
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabGrid: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabGrid'
      object Grid: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 480
        Height = 347
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Name = 'MS Sans Serif'
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 263
        IQComponents.Grid.Height = 261
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcArInvt
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
        IQComponents.Navigator.DataSource = SrcArInvt
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 263
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 261
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcArInvt
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item#'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CLASS'
            Title.Caption = 'Class'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Rev.'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctSales'
            Title.Caption = 'Sales GL Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctInv'
            Title.Caption = 'Inv. GL Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctProd'
            Title.Caption = 'Prod. Variance Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctIdWIP'
            Title.Caption = 'WIP Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctInter'
            Title.Caption = 'Interplant Sales Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctPPV'
            Title.Caption = 'PPV Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AcctShipment'
            Title.Caption = 'Shipment Account#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
      object DBAcctSalesGrid: TUniDBLookupComboBox
        Left = 24
        Top = 24
        Width = 41
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGlAcctInv3
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 1
        Color = clWindow
        OnDropDown = DBAcctSalesGridDropDown
      end
      object DBAcctInvGrid: TUniDBLookupComboBox
        Left = 24
        Top = 48
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGLAcctInv1
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
        OnDropDown = DBAcctInvGridDropDown
      end
      object DBAcctProdGrid: TUniDBLookupComboBox
        Left = 24
        Top = 72
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGLAcctInv1
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 3
        Color = clWindow
        OnDropDown = DBAcctProdGridDropDown
      end
      object DBAcctWIPGrid: TUniDBLookupComboBox
        Left = 23
        Top = 93
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGlAcctInv10
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 4
        Color = clWindow
        OnDropDown = DBAcctWIPGridDropDown
      end
      object DBAcctInterGrid: TUniDBLookupComboBox
        Left = 24
        Top = 120
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGlAcctInv11
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 5
        Color = clWindow
        OnDropDown = DBAcctInterGridDropDown
      end
      object DBAcctPPVGrid: TUniDBLookupComboBox
        Left = 24
        Top = 144
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGlAcctInv12
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 6
        Color = clWindow
        OnDropDown = DBAcctPPVGridDropDown
      end
      object DBAcctShipGrid: TUniDBLookupComboBox
        Left = 24
        Top = 170
        Width = 42
        Height = 21
        Hint = ''
        ListField = 'ID'
        ListSource = SrcwwQryGlAcctInv15
        KeyField = 'ACCT'
        ListFieldIndex = 0
        TabOrder = 7
        Color = clWindow
        OnDropDown = DBAcctPPVGridDropDown
      end
    end
    object TabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabForm'
      object PnlFormCarrier: TUniPanel
        Left = 0
        Top = 0
        Width = 480
        Height = 347
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 365
        object Splitter1: TUniSplitter
          Left = 166
          Top = 1
          Width = 6
          Height = 345
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 165
          Height = 345
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 1
            Top = 12
            Width = 30
            Height = 13
            Hint = ''
            Caption = 'Item #'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 1
            Top = 36
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 1
            Top = 60
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Class'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 1
            Top = 84
            Width = 41
            Height = 13
            Hint = ''
            Caption = 'Revision'
            TabOrder = 4
          end
          object Label5: TUniLabel
            Left = 1
            Top = 108
            Width = 96
            Height = 13
            Hint = ''
            Caption = 'Sales GL Account #'
            TabOrder = 5
          end
          object lblInvGLAccount: TUniLabel
            Left = 1
            Top = 153
            Width = 85
            Height = 13
            Hint = ''
            Caption = 'Inv GL Account #'
            TabOrder = 6
          end
          object lblProdVarAccount: TUniLabel
            Left = 1
            Top = 131
            Width = 123
            Height = 13
            Hint = ''
            Caption = 'Prod. Variance Account #'
            TabOrder = 7
          end
          object lbWIPGLAccont: TUniLabel
            Left = 1
            Top = 177
            Width = 115
            Height = 13
            Hint = ''
            Caption = 'WIP Process Account #'
            TabOrder = 8
          end
          object lblItrPlantAccount: TUniLabel
            Left = 1
            Top = 201
            Width = 126
            Height = 13
            Hint = ''
            Caption = 'Interplant Sales Account #'
            TabOrder = 9
          end
          object lblPPVAccount: TUniLabel
            Left = 1
            Top = 298
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'PPV Account #'
            TabOrder = 10
          end
          object lblPhysVar: TUniLabel
            Left = 1
            Top = 227
            Width = 141
            Height = 13
            Hint = ''
            Caption = 'Physical Inventory Variance #'
            TabOrder = 11
          end
          object lblInvCostRev: TUniLabel
            Left = 1
            Top = 251
            Width = 121
            Height = 13
            Hint = ''
            Caption = 'Inventory Cost Revalue #'
            TabOrder = 12
          end
          object LblShip: TUniLabel
            Left = 1
            Top = 275
            Width = 116
            Height = 13
            Hint = ''
            Caption = 'Shipments GL Account#'
            TabOrder = 13
          end
        end
        object PnlClient01: TUniPanel
          Left = 172
          Top = 1
          Width = 307
          Height = 345
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            307
            345)
          object DBItemNo: TUniDBEdit
            Left = 0
            Top = 8
            Width = 307
            Height = 21
            Cursor = crArrow
            Hint = ''
            DataField = 'ITEMNO'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBDescrip: TUniDBEdit
            Left = 0
            Top = 32
            Width = 307
            Height = 21
            Cursor = crArrow
            Hint = ''
            DataField = 'DESCRIP'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBClass: TUniDBEdit
            Left = 0
            Top = 56
            Width = 40
            Height = 21
            Cursor = crArrow
            Hint = ''
            DataField = 'CLASS'
            DataSource = SrcArInvt
            TabOrder = 2
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBRev: TUniDBEdit
            Left = 0
            Top = 80
            Width = 307
            Height = 21
            Cursor = crArrow
            Hint = ''
            DataField = 'REV'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object DBAcctSales: TUniDBLookupComboBox
            Left = 0
            Top = 104
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_SALES'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctInv: TUniDBLookupComboBox
            Left = 0
            Top = 152
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_INV'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctProd: TUniDBLookupComboBox
            Left = 0
            Top = 128
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_PRODVAR'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctWIP: TUniDBLookupComboBox
            Left = 0
            Top = 176
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_WIP'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctINTR: TUniDBLookupComboBox
            Left = 0
            Top = 200
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_INTPLANT_SALES'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 8
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctPPV: TUniDBLookupComboBox
            Left = 0
            Top = 294
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_PPV'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object dbePhysVar: TUniDBLookupComboBox
            Left = 0
            Top = 224
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_PHYS_VAR'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object dbeInvCostRev: TUniDBLookupComboBox
            Left = 0
            Top = 248
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_INV_COST_REV'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 11
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
          object DBAcctShipment: TUniDBLookupComboBox
            Left = 0
            Top = 271
            Width = 307
            Height = 21
            Hint = ''
            ListFieldIndex = 0
            DataField = 'ACCT_ID_SHIPMENT'
            DataSource = SrcArInvt
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 12
            Color = clWindow
            OnDropDown = DBAcctSalesDropDown
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 116
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search...'
        OnClick = sbSearchClick
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcArInvt: TDataSource
    DataSet = qryArInvt
    Left = 220
    Top = 81
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Inv. GL Account'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197113 $'
    BuildVersion = '176554'
    Left = 88
  end
  object PKArinvt: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select itemno, descrip, class, rev, id, eplant_id from arinvt'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 228
    Top = 119
    object PKArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PKArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PKArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PKArinvtREV: TStringField
      DisplayLabel = 'Rev.'
      FieldName = 'REV'
      Size = 15
    end
    object PKArinvtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'ARINVT.EPLANT_ID'
      Size = 0
    end
  end
  object wwQryGLAcctInv1: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct')
    Left = 268
    object wwQryGLAcctInv1ACCT: TStringField
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object wwQryGLAcctInv1DESCRIP: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object wwQryGLAcctInv1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object wwQryGLAcctInv1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object wwQryGLAcctInv1PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGlAcctInv2: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 300
    object wwQryGlAcctInv2ACCT: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object wwQryGlAcctInv2DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object wwQryGlAcctInv2EPLANT_ID: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object wwQryGlAcctInv2PK_HIDE: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object wwQryGlAcctInv2ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv3: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 404
    object StringField1: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField1: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object FloatField2: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object wwQryGlAcctInv3PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGLAcctInv4: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct ')
    Left = 388
    object StringField3: TStringField
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField4: TStringField
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField3: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object wwQryGLAcctInv4PK_HIDE: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField4: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGLAcctInv5: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct ')
    Left = 364
    object StringField5: TStringField
      DisplayWidth = 64
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField6: TStringField
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField5: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField7: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField6: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGLAcctInv6: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct ')
    Left = 348
    object StringField8: TStringField
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField9: TStringField
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField7: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object FloatField8: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object StringField10: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 144
    object SalesAccountsSplit1: TUniMenuItem
      Caption = 'Sa&les Accounts Split'
      OnClick = SalesAccountsSplit1Click
    end
  end
  object UpdateSQL3: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ARINVT_SALES_SPLIT'
      '  (ID, ARINVT_ID, GLACCT_ID, PERCENTAGE)'
      'values'
      '  (:ID, :ARINVT_ID, :GLACCT_ID, :PERCENTAGE)')
    ModifySQL.Strings = (
      'update ARINVT_SALES_SPLIT'
      'set'
      '  ID = :ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  GLACCT_ID = :GLACCT_ID,'
      '  PERCENTAGE = :PERCENTAGE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ARINVT_SALES_SPLIT'
      'where'
      '  ID = :OLD_ID')
    Left = 216
    Top = 8
  end
  object SrcDtlAcct: TDataSource
    DataSet = TblDtlAcct
    OnDataChange = SrcDtlAcctDataChange
    Left = 216
    Top = 27
  end
  object TblDtlAcct: TFDTable
    BeforeInsert = TblDtlAcctBeforeEdit
    BeforeEdit = TblDtlAcctBeforeEdit
    BeforePost = TblDtlAcctBeforePost
    CachedUpdates = True
    IndexFieldNames = 'ARINVT_ID'
    MasterSource = SrcArInvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARINVT_SALES_SPLIT'
    UpdateObject = UpdateSQL3
    TableName = 'ARINVT_SALES_SPLIT'
    Left = 216
    Top = 48
    object TblDtlAcctAcct: TStringField
      DisplayLabel = 'GL Account'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Acct'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Size = 50
      Lookup = True
    end
    object TblDtlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblDtlAcctGLACCT_ID: TBCDField
      DisplayLabel = 'Gl Account'
      DisplayWidth = 10
      FieldName = 'GLACCT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblDtlAcctARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object TblDtlAcctDescrip: TStringField
      FieldKind = fkLookup
      FieldName = 'descrip'
      LookupDataSet = wwQryGLAcctDtlSales
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'GLACCT_ID'
      Lookup = True
    end
    object TblDtlAcctPERCENTAGE: TFMTBCDField
      FieldName = 'PERCENTAGE'
      Size = 6
    end
  end
  object wwQryGLAcctDtlSales: TFDQuery
    BeforeOpen = wwQryGLAcctDtlSalesBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eplant_id, acct, descrip from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'and NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and acct > '#39' '#39
      'order by acct'
      '')
    Left = 328
    Top = 3
    object StringField21: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Size = 50
    end
    object StringField22: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object FloatField18: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField26: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv7: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 428
    object StringField11: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 64
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField12: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField9: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField13: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField10: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv8: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 268
    Top = 24
    object StringField14: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 64
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField15: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField11: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField16: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField12: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv9: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 292
    Top = 24
    object StringField17: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField18: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField13: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField19: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField14: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv10: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 316
    Top = 24
    object StringField20: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField23: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField15: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object FloatField16: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object StringField24: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGlAcctInv11: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 340
    Top = 24
    object StringField25: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField26: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField17: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object FloatField19: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object StringField27: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGlAcctInv12: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(AR_HIDE, '#39'N'#39') = '#39'N'#39
      'and NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 372
    Top = 24
    object StringField28: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 20
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField29: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField20: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object FloatField21: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
    object StringField30: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object wwQryGlAcctInv13: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 388
    Top = 24
    object StringField31: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 64
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField32: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField22: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField33: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField23: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv14: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 412
    Top = 24
    object StringField34: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField35: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField24: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField36: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField25: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGlAcctInv15: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, acct, descrip, eplant_id, pk_hide from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct '
      ' ')
    Left = 440
    Top = 24
    object StringField37: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 50
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object StringField38: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 64
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object FloatField27: TBCDField
      DisplayLabel = 'EPLant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object StringField39: TStringField
      DisplayWidth = 1
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object FloatField28: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object qryArInvt: TFDQuery
    BeforeOpen = qryArInvtBeforeOpen
    AfterPost = qryArInvtAfterScroll
    AfterScroll = qryArInvtAfterScroll
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ARINVT'
    SQL.Strings = (
      'Select * from ARINVT')
    Left = 324
    Top = 105
    object qryArInvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object qryArInvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 8
      FieldName = 'ITEMNO'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object qryArInvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object qryArInvtREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 5
      FieldName = 'REV'
      ReadOnly = True
      Required = True
      Size = 15
    end
    object qryArInvtAcctSales: TStringField
      DisplayLabel = 'Sales GL Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctSales'
      LookupDataSet = wwQryGLAcctInv4
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_SALES'
      Size = 50
      Lookup = True
    end
    object qryArInvtAcctInv: TStringField
      DisplayLabel = 'Inv. GL Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctInv'
      LookupDataSet = wwQryGLAcctInv1
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_INV'
      Size = 50
      Lookup = True
    end
    object qryArInvtAcctProd: TStringField
      DisplayLabel = 'Prod. Variance Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctProd'
      LookupDataSet = wwQryGLAcctInv5
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_PRODVAR'
      Size = 50
      Lookup = True
    end
    object qryArInvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object qryArInvtAcctIdWIP: TStringField
      DisplayLabel = 'WIP Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctIdWIP'
      LookupDataSet = wwQryGlAcctInv10
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_WIP'
      Size = 50
      Lookup = True
    end
    object qryArInvtAcctInter: TStringField
      DisplayLabel = 'Interplant Sales Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctInter'
      LookupDataSet = wwQryGlAcctInv11
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_INTPLANT_SALES'
      Size = 50
      Lookup = True
    end
    object qryArInvtAcctPPV: TStringField
      DisplayLabel = 'PPV Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctPPV'
      LookupDataSet = wwQryGlAcctInv12
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_PPV'
      Size = 50
      Lookup = True
    end
    object qryArInvtAcctShipment: TStringField
      DisplayLabel = 'Shipment Account#'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'AcctShipment'
      LookupDataSet = wwQryGlAcctInv15
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'ACCT_ID_SHIPMENT'
      Size = 50
      Lookup = True
    end
    object qryArInvtSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object qryArInvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
      Visible = False
      Size = 0
    end
    object qryArInvtDESCRIP2: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      ReadOnly = True
      Visible = False
      Size = 100
    end
    object qryArInvtACCT_ID_SALES: TBCDField
      DisplayLabel = 'Sales'
      DisplayWidth = 10
      FieldName = 'ACCT_ID_SALES'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_INV: TBCDField
      DisplayLabel = 'Inv Acct'
      DisplayWidth = 10
      FieldName = 'ACCT_ID_INV'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_PRODVAR: TBCDField
      FieldName = 'ACCT_ID_PRODVAR'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_WIP: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_WIP'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_PPV: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_PPV'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_INTPLANT_SALES: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_INTPLANT_SALES'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_PHYS_VAR: TBCDField
      FieldName = 'ACCT_ID_PHYS_VAR'
      Visible = False
      Size = 0
    end
    object qryArInvtACCT_ID_INV_COST_REV: TBCDField
      FieldName = 'ACCT_ID_INV_COST_REV'
      Visible = False
      Size = 0
    end
    object qryArInvtNON_MATERIAL: TStringField
      FieldName = 'NON_MATERIAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryArInvtACCT_ID_SHIPMENT: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_SHIPMENT'
      Visible = False
      Size = 0
    end
  end
  object SrcwwQryGlAcctInv3: TDataSource
    DataSet = wwQryGlAcctInv3
    Left = 240
    Top = 216
  end
  object SrcwwQryGLAcctInv1: TDataSource
    DataSet = wwQryGLAcctInv1
    Left = 400
    Top = 184
  end
  object SrcwwQryGlAcctInv10: TDataSource
    DataSet = wwQryGlAcctInv10
    Left = 336
    Top = 272
  end
  object SrcwwQryGlAcctInv11: TDataSource
    DataSet = wwQryGlAcctInv11
    Left = 232
    Top = 280
  end
  object SrcwwQryGlAcctInv12: TDataSource
    DataSet = wwQryGlAcctInv12
    Left = 424
    Top = 264
  end
  object SrcwwQryGlAcctInv15: TDataSource
    DataSet = wwQryGlAcctInv15
    Left = 312
    Top = 184
  end
end
