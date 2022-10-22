object FrmTerritories: TFrmTerritories
  Left = 0
  Top = 0
  HelpContext = 23605
  ClientHeight = 508
  ClientWidth = 831
  Caption = 'Territories'
  OnShow = FormShow
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
    Top = 137
    Width = 831
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlHeader: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 831
    Height = 137
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 829
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnSearch: TUniSpeedButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Hint = 'Search Customer'
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
      object NavMain: TUniDBNavigator
        Left = 604
        Top = 1
        Width = 224
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = SrcTerritory
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        BeforeAction = NavMainBeforeAction
      end
    end
    object PnlHeaderControls: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 829
      Height = 108
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 154
        Top = 1
        Width = 6
        Height = 106
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlHeaderControlsLeft1: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 153
        Height = 106
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object lblCode: TUniLabel
          Left = 8
          Top = 11
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Code'
          TabOrder = 1
        end
        object lblDescription: TUniLabel
          Left = 8
          Top = 35
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 2
        end
        object lblParentCode: TUniLabel
          Left = 8
          Top = 59
          Width = 60
          Height = 13
          Hint = ''
          Caption = 'Parent Code'
          TabOrder = 3
        end
        object lblParentDescription: TUniLabel
          Left = 8
          Top = 83
          Width = 88
          Height = 13
          Hint = ''
          Caption = 'Parent Description'
          TabOrder = 4
        end
      end
      object PnlHeaderControlsClient1: TUniPanel
        Tag = 1999
        Left = 160
        Top = 1
        Width = 668
        Height = 106
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          668
          106)
        object sbtnClear: TUniSpeedButton
          Left = 335
          Top = 56
          Width = 23
          Height = 22
          Hint = 'Clear'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000C21E0000C21E00000001000000000000473E7D005050
            500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
            5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
            650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
            7B0070707000717171007272720076767600473C800049388200533D8F004B40
            84004C448500534F83005655810059568D005B568D0054449700554598005D54
            93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
            B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
            A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
            8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
            910093939300959595009696960097979700949C9B0098989800999999009B9B
            9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
            B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
            B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
            A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
            B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
            BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
            CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
            D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
            E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
            E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
            F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
            C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
            D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
            D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
            E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
            F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
            FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
            FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
            E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
            EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
            FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
            F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
            3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
            4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
            343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
            9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
            9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
            C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
            E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
            F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
            9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
            9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
            CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
            DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
            0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
            3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
            3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
            3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = ClearParentCode1Click
        end
        object dbeCode: TUniDBEdit
          Left = 0
          Top = 8
          Width = 329
          Height = 21
          Hint = ''
          DataField = 'CODE'
          DataSource = SrcTerritory
          TabOrder = 0
        end
        object dbeDescription: TUniDBEdit
          Left = 0
          Top = 32
          Width = 662
          Height = 21
          Hint = ''
          DataField = 'DESCRIP'
          DataSource = SrcTerritory
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object cmbParent: TUniEdit
          Left = 0
          Top = 56
          Width = 329
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
          OnKeyDown = cmbParentKeyDown
        end
        object dbeParentDescription: TUniDBEdit
          Left = 0
          Top = 80
          Width = 662
          Height = 21
          Hint = ''
          DataField = 'PARENT_DESCRIP'
          DataSource = SrcTerritory
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object PnlDetail: TUniPanel
    Tag = 1999
    Left = 0
    Top = 140
    Width = 831
    Height = 368
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlToolbarDetail: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 829
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
    end
    object PnlGridDetail: TUniPanel
      Tag = 1999
      Left = 1
      Top = 28
      Width = 829
      Height = 339
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GridDetail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 827
        Height = 337
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 610
        IQComponents.Grid.Height = 251
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcTerritoryPrEmp
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
        IQComponents.Navigator.DataSource = SrcTerritoryPrEmp
        IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 610
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 251
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcTerritoryPrEmp
        Columns = <
          item
            FieldName = 'FIRST_NAME'
            Title.Caption = 'First Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MIDDLE_NAME'
            Title.Caption = 'Middle Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_NAME'
            Title.Caption = 'Last Name'
            Width = 210
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'USER_NAME'
            Title.Caption = 'User Name'
            Width = 245
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 355
    object File1: TUniMenuItem
      Caption = '&File'
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = Search1Click
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 496
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmTerritories'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195238 $'
    BuildVersion = '176554'
    Left = 468
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmTerritories'
    WebUse = False
    TouchScreen = False
    Left = 440
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmTerritories')
    SecurityCode = 'FRMTERRITORIES'
    Left = 412
  end
  object PkTerritory: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.code AS code,'
      '       a.descrip AS descrip,'
      '       a.parent_id AS parent_id,'
      '       b.code AS parent_code,'
      '       b.descrip AS parent_descrip'
      '  FROM territory a, territory b'
      ' WHERE b.id(+) = a.parent_id')
    OnIQModify = PkTerritoryIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 496
    Top = 48
    object PkTerritoryID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
    object PkTerritoryCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'a.code'
      Size = 50
    end
    object PkTerritoryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 250
    end
    object PkTerritoryPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'a.parent_id'
      Visible = False
      Size = 0
    end
    object PkTerritoryPARENT_CODE: TStringField
      DisplayLabel = 'Parent Code'
      FieldName = 'PARENT_CODE'
      Origin = 'b.code'
      Size = 50
    end
    object PkTerritoryPARENT_DESCRIP: TStringField
      DisplayLabel = 'Parent Description'
      DisplayWidth = 25
      FieldName = 'PARENT_DESCRIP'
      Origin = 'b.descrip'
      Size = 250
    end
  end
  object SrcTerritory: TDataSource
    DataSet = QryTerritory
    Left = 408
    Top = 272
  end
  object QryTerritory: TFDQuery
    BeforePost = QryTerritoryBeforePost
    OnNewRecord = QryTerritoryNewRecord
    IndexesActive = False
    IndexFieldNames = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'TERRITORY'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Territory
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.code AS code,'
      '       a.descrip AS descrip,'
      '       a.parent_id AS parent_id,'
      '       b.code AS parent_code,'
      '       b.descrip AS parent_descrip'
      '  FROM territory a, territory b'
      ' WHERE b.id(+) = a.parent_id')
    Left = 408
    Top = 312
    object QryTerritoryID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTerritoryCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 50
    end
    object QryTerritoryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 250
    end
    object QryTerritoryPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTerritoryPARENT_CODE: TStringField
      DisplayLabel = 'Parent Code'
      FieldName = 'PARENT_CODE'
      Origin = 'PARENT_CODE'
      Size = 50
    end
    object QryTerritoryPARENT_DESCRIP: TStringField
      DisplayLabel = 'Parent Description'
      DisplayWidth = 25
      FieldName = 'PARENT_DESCRIP'
      Origin = 'PARENT_DESCRIP'
      Size = 250
    end
  end
  object FDUpdateSQL_Territory: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO TERRITORY'
      '(ID, CODE, DESCRIP, PARENT_ID)'
      'VALUES (:NEW_ID, :NEW_CODE, :NEW_DESCRIP, :NEW_PARENT_ID)')
    ModifySQL.Strings = (
      'UPDATE TERRITORY'
      
        'SET CODE = :NEW_CODE, DESCRIP = :NEW_DESCRIP, PARENT_ID = :NEW_P' +
        'ARENT_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TERRITORY'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, CODE, DESCRIP, PARENT_ID'
      'FROM TERRITORY'
      'WHERE ID = :ID')
    Left = 552
    Top = 288
  end
  object SrcTerritoryPrEmp: TDataSource
    DataSet = QryTerritoryPrEmp
    Left = 408
    Top = 360
  end
  object QryTerritoryPrEmp: TFDQuery
    BeforeInsert = QryTerritoryPrEmpBeforeInsert
    AfterPost = QryTerritoryPrEmpAfterPost
    IndexesActive = False
    IndexFieldNames = 'TERRITORY_ID'
    MasterSource = SrcTerritory
    MasterFields = 'ID'
    DetailFields = 'ID'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'TERRITORY_PR_EMP'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_TerritoryPrEmp
    SQL.Strings = (
      'SELECT a.id,'
      '       a.territory_id,'
      '       a.pr_emp_id,'
      '       b.first_name,'
      '       b.middle_name,'
      '       b.last_name,'
      '       c.user_name'
      '  FROM territory_pr_emp a, pr_emp b, s_user_general c'
      ' WHERE a.territory_id = :id AND'
      '       b.id = a.pr_emp_id AND'
      '       c.pr_emp_id = b.id')
    Left = 408
    Top = 416
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryTerritoryPrEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object QryTerritoryPrEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'MIDDLE_NAME'
      Size = 30
    end
    object QryTerritoryPrEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object QryTerritoryPrEmpUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 35
    end
    object QryTerritoryPrEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTerritoryPrEmpTERRITORY_ID: TBCDField
      FieldName = 'TERRITORY_ID'
      Origin = 'TERRITORY_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryTerritoryPrEmpPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Origin = 'PR_EMP_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object FDUpdateSQL_TerritoryPrEmp: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO TERRITORY_PR_EMP'
      '(ID, TERRITORY_ID, PR_EMP_ID)'
      'VALUES (:NEW_ID, :NEW_TERRITORY_ID, :NEW_PR_EMP_ID)')
    ModifySQL.Strings = (
      'UPDATE TERRITORY_PR_EMP'
      'SET PR_EMP_ID = :NEW_PR_EMP_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM TERRITORY_PR_EMP'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, TERRITORY_ID, PR_EMP_ID'
      'FROM TERRITORY_PR_EMP'
      'WHERE ID = :ID')
    Left = 552
    Top = 376
  end
  object PkEmployee: TIQWebHpick
    Tag = 1
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT pr_emp_id AS id, '
      '       empno AS empno, '
      '       first_name AS first_name,'
      '       middle_name AS middle_name, '
      '       last_name AS last_name,'
      '       display_name AS display_name, '
      '       email AS email, '
      '       user_name AS user_name,'
      '       eplant_id AS eplant_id, '
      '       eplant_name AS eplant_name, '
      '       pk_hide AS pk_hide'
      '  FROM v_empuser'
      ' WHERE NVL(used_crm, '#39'N'#39') = '#39'Y'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 588
    Top = 48
    object PkEmployeeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'e.id'
      Visible = False
      Size = 0
    end
    object PkEmployeeEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'e.empno'
      Size = 25
    end
    object PkEmployeeFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 10
      FieldName = 'FIRST_NAME'
      Origin = 'e.first_name'
      Size = 30
    end
    object PkEmployeeMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Origin = 'e.middle_name'
      Size = 30
    end
    object PkEmployeeLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 10
      FieldName = 'LAST_NAME'
      Origin = 'e.last_name'
      Size = 30
    end
    object PkEmployeeEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 10
      FieldName = 'EMAIL'
      Origin = 'g.email'
      Size = 50
    end
    object PkEmployeeEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'g.eplant_id'
      Visible = False
      Size = 0
    end
    object PkEmployeeUSER_NAME: TStringField
      DisplayLabel = 'Login Name'
      DisplayWidth = 10
      FieldName = 'USER_NAME'
      Origin = 'g.user_name'
      Size = 35
    end
    object PkEmployeeEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 10
      FieldName = 'EPLANT_NAME'
      Origin = 'ep.name'
      Size = 30
    end
    object PkEmployeeDISPLAY_NAME: TStringField
      FieldName = 'DISPLAY_NAME'
      Origin = 'V_EMPUSER.DISPLAY_NAME'
      Visible = False
      Size = 61
    end
    object PkEmployeePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_EMPUSER.PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkParentTerritory: TIQWebHpick
    BeforeOpen = PkParentTerritoryBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT id,'
      '       code,'
      '       descrip'
      '  FROM territory'
      ' WHERE id <> :ID AND'
      '       NVL(parent_id, 0) <> :ID')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 688
    Top = 40
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkParentTerritoryID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
    object PkParentTerritoryCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 50
    end
    object PkParentTerritoryDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 40
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 250
    end
  end
  object PMain: TUniPopupMenu
    Left = 384
    object SelectParentCode1: TUniMenuItem
      Caption = 'Select Parent Code'
      OnClick = SelectParentCode1Click
    end
    object ClearParentCode1: TUniMenuItem
      Caption = 'Clear Parent Code'
      OnClick = ClearParentCode1Click
    end
  end
end
