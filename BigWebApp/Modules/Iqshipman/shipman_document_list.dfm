object FrmShipManDocumentList: TFrmShipManDocumentList
  Left = 311
  Top = 219
  ClientHeight = 185
  ClientWidth = 408
  Caption = 'International Documents'
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 27
    Width = 408
    Height = 158
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 406
      Height = 156
      Hint = ''
      ActivePage = TabForm
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabForm: TUniTabSheet
        Hint = ''
        Caption = 'TabForm'
        object PnlClient01: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 398
          Height = 128
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 129
            Top = 0
            Width = 6
            Height = 128
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft01: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 129
            Height = 126
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 12
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 1
            end
            object lblMFGCountry: TUniLabel
              Left = 8
              Top = 36
              Width = 116
              Height = 13
              Hint = 
                'Country where commodity is manufactured.  Select "Multiple" for ' +
                'multiple countries of manufacture.'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Country of Manufacture'
              TabOrder = 2
            end
          end
          object PnlClient02: TUniPanel
            Tag = 1999
            Left = 135
            Top = 1
            Width = 263
            Height = 126
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              263
              126)
            object cmbCountry: TUniDBComboBox
              Left = 1
              Top = 32
              Width = 261
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'MFG_COUNTRY'
              DataSource = SrcFreightDoc
              Style = csDropDownList
              TabOrder = 1
            end
            object cmbDescription: TUniDBComboBox
              Left = 1
              Top = 8
              Width = 261
              Height = 21
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'DESCRIP'
              DataSource = SrcFreightDoc
              Items.Strings = (
                'AccountingDocuments'
                'Analysis Reports'
                'Applications (Completed)'
                'Bank Statements'
                'Bid Quotations'
                'Bills of Sale'
                'Birth Certificates'
                'Bonds'
                'Business Correspondence'
                'Checks (Completed)'
                'Claim Files'
                'Closing Statements'
                'Conference Reports'
                'Contracts'
                'Correspondence/No Commercial Value'
                'Cost Estimates'
                'Court Transcripts'
                'Credit Applications'
                'Data Sheets'
                'Deeds'
                'Employment Papers'
                'Escrow Instructions'
                'Export Papers'
                'Financial Statements'
                'Immigration Papers'
                'Income Statements'
                'Insurance Documents'
                'Interoffice Memos'
                'Inventory Reports'
                'Invoices (Completed)'
                'Leases'
                'Legal Documents'
                'Letter of Credit Packets'
                'Letters and Cards'
                'Loan Documents'
                'Marriage Certificates'
                'Medical Records'
                'Office Records'
                'Operating Agreements'
                'Patent Applications'
                'Permits'
                'Photocopies'
                'Proposals'
                'Prospectuses'
                'Purchase Orders'
                'Quotations'
                'Reservation Confirmation'
                'Resumes'
                'Sales Agreements'
                'Sales Reports'
                'Shipping Documents'
                'Statements/Reports'
                'Statistical Data'
                'Stock Information'
                'Tax Papers'
                'Trade Confirmations'
                'Transcripts'
                'Warranty Deeds')
              TabOrder = 0
            end
          end
        end
      end
      object TabGrid: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'TabGrid'
        object Grid: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 398
          Height = 128
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 181
          IQComponents.Grid.Height = 42
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcFreightDoc
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
          IQComponents.Navigator.DataSource = SrcFreightDoc
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 181
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 42
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcFreightDoc
          Columns = <
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MFG_COUNTRY'
              Title.Caption = 'Country of Manufacture'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnSearchPackages: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
      OnClick = Search1Click
    end
    object sbtnToggleView: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table/Form View'
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
      OnClick = sbtnToggleViewClick
    end
    object NavMain: TUniDBNavigator
      Left = 183
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcFreightDoc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 160
    Top = 65535
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = 'Search'
        OnClick = Search1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
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
    ModuleName = 'International Shipping Documents'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 216
    Top = 65535
  end
  object PkDoc: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'SELECT '
      '  a.id as id, '
      '  a.descrip as descrip, '
      '  a.mfg_country as mfg_country'
      'FROM freight_document a')
    OnIQModify = PkDocIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 188
    Top = 65535
    object PkDocID: TBCDField
      FieldName = 'ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object PkDocDESCRIP: TStringField
      DisplayLabel = 'Document'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 50
    end
    object PkDocMFG_COUNTRY: TStringField
      DisplayLabel = 'Country of Manufacture'
      FieldName = 'MFG_COUNTRY'
      Origin = 'A.MFG_COUNTRY'
      Size = 2
    end
  end
  object SrcFreightDoc: TDataSource
    DataSet = TblFreightDoc
    Left = 288
  end
  object TblFreightDoc: TFDTable
    BeforePost = TblFreightDocBeforePost
    OnNewRecord = TblFreightDocNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FREIGHT_DOCUMENT'
    TableName = 'FREIGHT_DOCUMENT'
    Left = 296
    Top = 8
    object TblFreightDocDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblFreightDocMFG_COUNTRY: TStringField
      DisplayLabel = 'Country of Manufacture'
      DisplayWidth = 2
      FieldName = 'MFG_COUNTRY'
      Size = 2
    end
    object TblFreightDocID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain')
    SecurityCode = 'FRMSHIPMANDOCUMENTS'
    Left = 244
    Top = 65535
  end
end
