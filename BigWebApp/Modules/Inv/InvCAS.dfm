object FrmInvCAS: TFrmInvCAS
  Left = 161
  Top = 274
  HelpContext = 15580
  ClientHeight = 383
  ClientWidth = 475
  Caption = 'Chemical Abstract Service'
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
    Top = 216
    Width = 475
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 475
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRegulations: TUniSpeedButton
      Left = 0
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Environmental Regulations'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0949494656565ACACAC7878787474
        74C4C4C4FF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0949494656565ACACAC787878747474C4C4C4FF00FFFF00FFFF00FFC0C0C0
        808080808080808080808080808080808080939393565656494949ACACAC5A5A
        5AB8B8B8FF00FFFF00FFFF00FFC0C0C080808080808080808080808080808080
        8080939393565656494949ACACAC5A5A5AB8B8B8FF00FFFF00FFFF00FF808080
        808080E5D0B7E8D8BAE8D8BA8C8C8C5B5B5B949494B4B4B4B3B3B3ABABAB5656
        565D5D5D6D6D6DFF00FFFF00FF808080808080CDCDCDD4D4D4D4D4D48C8C8C5B
        5B5B949494B4B4B4B3B3B3ABABAB5656565D5D5D6D6D6DFF00FFFF00FF808080
        C0C0C0E4DBCFCBB4A5DCC5A5959595B1B1B1BCBCBC6464648A8A8A949494ABAB
        ABB1B1B1707070FF00FFFF00FF808080FF00FFD9D9D9B3B3B3C1C1C1959595B1
        B1B1BCBCBC6464648A8A8A949494ABABABB1B1B1707070FF00FFFF00FF808080
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFB6B6B68080808C8C8CCCCCCC8D8D8DB1B1
        B1494949A2A2A2FF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFB6
        B6B68080808C8C8CCCCCCC8D8D8DB1B1B1494949A2A2A2FF00FFFF00FF808080
        C0C0C0FFFFFFF0E4CCE5D0B76E6E6EC2C2C29494945050508A8A8A666666B4B4
        B45858585C5C5CFF00FFFF00FF808080FF00FFFF00FFE1E1E1A0A0A06E6E6EC2
        C2C29494945050508A8A8A666666B4B4B45858585C5C5CFF00FFFF00FF808080
        C0C0C0FFFFFFDCC5ABDCC5AB7E7E7E757575C7C7C7989898898989B8B8B89797
        978A8A8A8C8C8CFF00FFFF00FF808080FF00FFFF00FFA0A0A0A0A0A07E7E7E75
        7575C7C7C7989898898989B8B8B89797978A8A8A8C8C8CFF00FFFF00FF808080
        C0C0C0FFFFFFDEC4B9DCCBC1F3EEE5F4F4E77C7C7CC4C4C4B8B8B8B9B9B95B5B
        5BC6C6C6FF00FFFF00FFFF00FF808080FF00FFFF00FFA0A0A0A0A0A0A0A0A0A0
        A0A07C7C7CC4C4C4B8B8B8B9B9B95B5B5BC6C6C6FF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878787C7C7CD4C7BA7474748C8C
        8CFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF7878787C7C7CC6C6C67474748C8C8CFF00FFFF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFDEC4B9DCCBC1F3EEE5F6F6EEFDFDF6FDFDF6FCF7F4FFFFFF9493
        8EFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFA0A0A0A0A0A0A0A0A0A0
        A0A0A0A0A0E4E4E4E4E4E4E4E4E4929292FF00FFFF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E6D5E5D3C5D4C7BAFCF7F49993
        88FF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFD2D2D2C6C6C6E4E4E4808080FF00FFFF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFE2CBBBE5D3C5D9C9BAC9BDAEDCD3CCF3EEE5796D66DCC5ABDCC5
        ABFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFA0A0A0A0A0A0A0A0A0A0
        A0A0A0A0A0EDEDED6C6C6CC2C2C2C2C2C2FF00FFFF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC5ABDBCDB5E2E4
        DFFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFC2C2C2CACACAE3E3E3FF00FFFF00FFFF00FFFF00FF808080
        C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC5ABE5DCD5FF00
        FFFF00FFFF00FFFF00FFFF00FF808080FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFC2C2C2DBDBDBFF00FFFF00FFFF00FFFF00FFFF00FF808080
        808080808080808080808080808080808080808080808080808080FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF80808080808080808080808080808080808080
        8080808080808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRegulationsClick
    end
    object sbtnInvClassMSDS: TUniSpeedButton
      Left = 23
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Inventory Class MSDS Setup'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF707070505850000000D5DCDEFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA0
        A0A0FFFFFF5090B0101010D8E1E4FF00FFFF00FFFF00FFFF00FFFF00FF807060
        807060807060807060807060807060A0A0A090B8C070D0E05098B0101010D8E1
        E4FF00FFFF00FFFF00FFFF00FFC0A890FFF0F0FFF0F0FFF0F0FFF0F0FFF0F0DF
        E7EB50A0B090E0F060C0D05098B0101010D8DFE1FF00FFFF00FFFF00FFC0A890
        FFF8F0FFF8F0FFF8F0FFF0F0FFF0F0FFF0F0DFE7EB50A0B090E0F060C0D05098
        B0101010D8DFE1FF00FFFF00FFC0A890FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FF
        F8F0FFF0F0DFE7EB70B0C090E0F070C8E0808880303890BEC0D7FF00FFC0A8A0
        FFF8F0D0B0A0D0B0A0D0B0A0D0B0A0D0B0A0C0A890C0A090DFE7EB80B0C0D0B8
        B07088D06070B0303890FF00FFB0A890FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FF
        F8F0FFF8F0FFF8F0FFF0F0DFE7EB6070B07090E06078D06070B0FF00FFC0A890
        FFF8F0A08880A08870A08870A08870A08870A08070907860907060FFF8F0D2D7
        EB6070B06070B0E1E5F3FF00FFC0A890FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FF
        F8F0FFF8F0FFF0F0FFF0F0F0F0F0806860FF00FFFF00FFFF00FFFF00FFC0A890
        FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF8F0FFF0F0FFF0F08068
        50FF00FFFF00FFFF00FFFF00FFE09060E09060E09060E09060E08860E08860E0
        8050D08050D07840D07040D07030D06830FF00FFFF00FFFF00FFFF00FFE09060
        F0C0A0FFF0F0FFF0E0FFE8E0FFE8E0FFE8D0FFE0D0F0A080F0A080F0A070D068
        30FF00FFFF00FFFF00FFFF00FFE3A481F0C0B0F0C0A0F0B8A0F0B890F0B090F0
        B090F0A880F0A880F0A080F0A080DB9F7BFF00FFFF00FFFF00FFFF00FFFBF1EB
        E5AA8AE09060E08860E08860E08860E08050E08050D08050D08050E7AB93F3E1
        D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnInvClassMSDSClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 28
    Width = 475
    Height = 188
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 473
      Height = 186
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 256
      IQComponents.Grid.Height = 100
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCAS
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
      IQComponents.Navigator.DataSource = SrcCAS
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 256
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 100
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcCAS
      Columns = <
        item
          FieldName = 'CASNO'
          Title.Caption = 'CAS #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 220
    Width = 475
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Label1: TUniLabel
      Left = 7
      Top = 8
      Width = 182
      Height = 13
      Hint = ''
      Caption = 'Associated Environmental Regulations'
      TabOrder = 1
    end
  end
  object wwDBGrid2: TIQUniGridControl
    Left = 0
    Top = 248
    Width = 475
    Height = 135
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 258
    IQComponents.Grid.Height = 49
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcCasEnvReg
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
    IQComponents.Navigator.DataSource = SrcCasEnvReg
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 258
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 49
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcCasEnvReg
    Columns = <
      item
        FieldName = 'EnvRegName'
        Title.Caption = 'Regulation'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EnvRegDescrip'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object wwDBComboDlgRegNo: TUniEdit
    Left = 37
    Top = 301
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object SrcCAS: TDataSource
    DataSet = QryCAS
    Left = 70
    Top = 96
  end
  object QryCAS: TFDQuery
    BeforePost = QryCASBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CAS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       casno,'
      '       descrip'
      '  from cas'
      'order by casno  '
      '  ')
    Left = 70
    Top = 109
    object QryCASCASNO: TStringField
      DisplayLabel = 'CAS #'
      DisplayWidth = 30
      FieldName = 'CASNO'
      Origin = 'IQ.CAS.CASNO'
      Size = 30
    end
    object QryCASDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 43
      FieldName = 'DESCRIP'
      Origin = 'IQ.CAS.DESCRIP'
      Size = 60
    end
    object QryCASID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into cas'
      '  (ID, CASNO, DESCRIP)'
      'values'
      '  (:ID, :CASNO, :DESCRIP)')
    ModifySQL.Strings = (
      'update cas'
      'set'
      '  ID = :ID,'
      '  CASNO = :CASNO,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from cas'
      'where'
      '  ID = :OLD_ID')
    Left = 70
    Top = 123
  end
  object SrcCasEnvReg: TDataSource
    DataSet = QryCasEnvReg
    Left = 113
    Top = 97
  end
  object QryCasEnvReg: TFDQuery
    BeforeInsert = PostParents
    BeforeEdit = PostParents
    BeforePost = QryCasEnvRegBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryCasEnvRegCalcFields
    OnNewRecord = QryCasEnvRegNewRecord
    MasterSource = SrcCAS
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'cas_env_reg'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select id,'
      '       cas_id,'
      '       env_reg_id'
      '  from cas_env_reg'
      ' where cas_id = :id'
      ' order by id')
    Left = 113
    Top = 111
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryCasEnvRegEnvRegName: TStringField
      DisplayLabel = 'Regulation'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'EnvRegName'
      Size = 30
      Calculated = True
    end
    object QryCasEnvRegEnvRegDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 43
      FieldKind = fkCalculated
      FieldName = 'EnvRegDescrip'
      ReadOnly = True
      Size = 60
      Calculated = True
    end
    object QryCasEnvRegID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCasEnvRegCAS_ID: TBCDField
      FieldName = 'CAS_ID'
      Origin = 'CAS_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryCasEnvRegENV_REG_ID: TBCDField
      FieldName = 'ENV_REG_ID'
      Origin = 'ENV_REG_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into cas_env_reg'
      '  (ID, CAS_ID, ENV_REG_ID)'
      'values'
      '  (:ID, :CAS_ID, :ENV_REG_ID)')
    ModifySQL.Strings = (
      'update cas_env_reg'
      'set'
      '  ID = :ID,'
      '  CAS_ID = :CAS_ID,'
      '  ENV_REG_ID = :ENV_REG_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from cas_env_reg'
      'where'
      '  ID = :OLD_ID')
    Left = 112
    Top = 123
  end
  object PkEnvReg: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       regno,'
      '       descrip'
      '  from env_reg'
      '  ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 155
    Top = 116
    object PkEnvRegID: TFloatField
      FieldName = 'ID'
      Origin = 'IQ.ENV_REG.ID'
      Visible = False
    end
    object PkEnvRegREGNO: TStringField
      DisplayLabel = 'Regulation'
      FieldName = 'REGNO'
      Origin = 'IQ.ENV_REG.REGNO'
      Size = 30
    end
    object PkEnvRegDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ENV_REG.DESCRIP'
      Size = 60
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryCAS'
      'QryCasEnvReg')
    SecurityCode = 'FRMINVCAS'
    Left = 192
    Top = 116
  end
  object MainMenu1: TUniMainMenu
    Left = 280
    Top = 80
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object InventoryClassMSDSSetup1: TUniMenuItem
        Caption = 'Inventory Class MSDS Setup'
        OnClick = InventoryClassMSDSSetup1Click
      end
      object MSDSTracking1: TUniMenuItem
        Caption = 'Enable MSDS Tracking'
        OnClick = MSDSTracking1Click
      end
    end
  end
end
