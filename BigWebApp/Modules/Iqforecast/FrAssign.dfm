object FrmFrAssign: TFrmFrAssign
  Left = 120
  Top = 163
  HelpContext = 1000081
  ClientHeight = 540
  ClientWidth = 742
  Caption = 'Assign Forecast Group to Inventory Items'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnFilter: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Filter'
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
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
        4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
        6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
        90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
        ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
        C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
        D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
        96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
        E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
        E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
        10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
        F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
        808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
        50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
        FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
        D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
        60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
        F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
        C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
        70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
        B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnFilterClick
    end
    object Label1: TUniLabel
      Left = 32
      Top = 7
      Width = 74
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Forecast Group'
      TabOrder = 3
    end
    object SBAssign: TUniSpeedButton
      Left = 299
      Top = -2
      Width = 30
      Height = 32
      Hint = 'Assign selected Forecast Group to the selected Inv. Items'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
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
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD000000
        FDFDFDFDFDFDFDFDFDFDFDFDFD000000FDFDFDFDFDFDFDFDFDFDFDFD002A00FD
        FDFDFDFDFDFDFDFDFDFDFDFD00A400FDFDFDFDFDFDFDFDFDFDFDFD1AB200FDFD
        FDFDFDFDFDFDFDFDFDFDFD5BF700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
        FDFDFDFDFDFDFDFDFDFDFD5B0700FDFDFDFDFDFDFDFDFDFDFDFDFD1ABA00FDFD
        FDFD00FDFDFDFDFDFDFDFD5B0700FDFDFDFD00FDFDFDFDFDFDFDFD1ABE00FDFD
        FDFD0000FDFDFDFDFDFDFD5B0800FDFDFDFD0000FDFDFDFDFDFDFD1AF6B200FD
        FDFD002A00FDFDFDFDFDFD5BFFF700FDFDFD00A400FDFDFDFDFDFDFD1ABEB200
        000000B22A00FDFDFDFDFDFD5B08F700000000F7A400FDFDFDFDFDFD1AF6BEBA
        2A2AB2B2B22A00FDFDFDFDFD5BFF0807A4A4F7F7F7A400FDFDFDFDFDFD1AF6F6
        BEBABABABAB22A00FDFDFDFDFD5BFFFF0807070707F7A400FDFDFDFDFDFD1A1A
        F6F6F6BEBABA00FDFDFDFDFDFDFD5B5BFFFFFF08070700FDFDFDFDFDFDFDFDFD
        1A1A1AF6BE00FDFDFDFDFDFDFDFDFDFD5B5B5BFF0800FDFDFDFDFDFDFDFDFDFD
        FDFD1AF600FDFDFDFDFDFDFDFDFDFDFDFDFD5BFF00FDFDFDFDFDFDFDFDFDFDFD
        FDFD1A00FDFDFDFDFDFDFDFDFDFDFDFDFDFD5B00FDFDFDFDFDFDFDFDFDFDFDFD
        FDFD1AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD5BFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = SBAssignClick
    end
    object dbFr: TUniDBLookupComboBox
      Left = 120
      Top = 4
      Width = 173
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 742
    Height = 513
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 525
    IQComponents.Grid.Height = 427
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcArinvt
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
    IQComponents.Navigator.DataSource = SrcArinvt
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 525
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 427
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcArinvt
    Columns = <
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
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
        FieldName = 'CODE'
        Title.Caption = 'Group Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FR_DESCRIP'
        Title.Caption = 'Code Description'
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
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Customer Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 28
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 320
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
      object AssignFrCode1: TUniMenuItem
        Caption = '&Assign Forecast Group'
        OnClick = SBAssignClick
      end
      object ClearFrCode1: TUniMenuItem
        Caption = '&Clear Forecast Group'
        OnClick = ClearFrCode1Click
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
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 24
    Top = 107
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.eplant_id,'
      '       f.code,'
      '       f.descrip as fr_descrip,'
      '       c.custno,'
      '       c.company'
      '  from arinvt a,'
      '       fr_group f,'
      '       arcusto c'
      ' where a.fr_group_id = f.id(+)'
      
        '   and (a.standard_id is not NULL or NVL(a.fr_include, '#39'N'#39') = '#39'Y' +
        #39')'
      '   and NVL(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      ''
      '   and a.arcusto_id = c.id(+)'
      ' ')
    Left = 40
    Top = 108
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 17
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      Size = 50
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 7
      FieldName = 'REV'
      Origin = 'a.rev'
      Size = 15
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 26
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryArinvtCODE: TStringField
      DisplayLabel = 'Group Code'
      DisplayWidth = 11
      FieldName = 'CODE'
      Origin = 'f.code'
      Size = 10
    end
    object QryArinvtFR_DESCRIP: TStringField
      DisplayLabel = 'Code Description'
      DisplayWidth = 19
      FieldName = 'FR_DESCRIP'
      Origin = 'f.descrip'
      Size = 35
    end
    object QryArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'c.custno'
      FixedChar = True
      Size = 10
    end
    object QryArinvtCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'c.company'
      Size = 60
    end
    object QryArinvtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      Visible = False
      Size = 0
    end
  end
  object QryFr: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '          code,'
      '         descrip'
      '  from fr_group')
    Left = 42
    Top = 165
    object QryFrCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 9
      FieldName = 'CODE'
      Origin = 'FR_GROUP.CODE'
      Size = 10
    end
    object QryFrDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'FR_GROUP.DESCRIP'
      Size = 35
    end
    object QryFrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'FR_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Assign Fr Group'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190495 $'
    BuildVersion = '176554'
    Left = 352
    Top = 16
  end
  object wwFilterDialog1: TwwFilterDialog
    DataSource = SrcArinvt
    SortBy = fdSortByFieldNo
    Caption = 'Inventory Items'
    FilterMethod = fdByFilter
    DefaultMatchType = fdMatchStart
    DefaultFilterBy = fdSmartFilter
    FieldOperators.OrChar = 'or'
    FieldOperators.AndChar = 'and'
    FieldOperators.NullChar = 'null'
    Rounding.Epsilon = 0.000100000000000000
    Rounding.RoundingMethod = fdrmFixed
    FilterPropertyOptions.LikeWildcardChar = '%'
    SelectedFields.Strings = (
      'CLASS'
      'CODE'
      'DESCRIP'
      'DESCRIP2'
      'EPLANT_ID'
      'FR_DESCRIP'
      'ITEMNO'
      'REV')
    FilterOptimization = fdNone
    QueryFormatDateMode = qfdMonthDayYear
    SQLTables = <>
    Left = 289
    Top = 16
  end
  object PopupMenu1: TUniPopupMenu
    Left = 184
    Top = 107
    object AssignFrCode2: TUniMenuItem
      Caption = '&Assign Forecast Group'
      OnClick = SBAssignClick
    end
    object ClearFrCode2: TUniMenuItem
      Caption = '&Clear Forecast Group'
      OnClick = ClearFrCode1Click
    end
  end
end
