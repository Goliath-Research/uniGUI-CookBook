object FrmInvEnvRegComponents: TFrmInvEnvRegComponents
  Left = 161
  Top = 274
  HelpContext = 15584
  ClientHeight = 273
  ClientWidth = 612
  Caption = 'Environmental Regulated Components'
  OnShow = FormShow
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
    Width = 612
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnCAS: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'CAS'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
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
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD040404040404
        04A41B1B1B1B1B1B1B1B04E2E2E2E2E2041B2A2A2A2A2A2A2A1B04E2EAEAE2E2
        042A0808083838382A1B04E2EAEAEAE204080404040838382A1B04E2EAEAEAE2
        0404E2E2040838382A1B04E2EAEAEAEAE2E2EAE2040838382A1B04E2EAEAEAEA
        EAEAEAE2040838382A1B04E2EAEAEAEA0909EAEA040838382A1B04E2EAEAEA09
        04040909040838382A1B04E2EAEAEA0904080404040838382A1B04E2EAEAEA09
        04083838383838382A1B040909090909041B080808080808081B040404040404
        04A41B1B1B1B1B1B1B1BFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnCASClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 612
    Height = 245
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 395
    IQComponents.Grid.Height = 159
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcArinvtCAS
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
    IQComponents.Navigator.DataSource = SrcArinvtCAS
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 395
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 159
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcArinvtCAS
    Columns = <
      item
        FieldName = 'CasName'
        Title.Caption = 'CAS Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CasDescrip'
        Title.Caption = 'CAS Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERCENT'
        Title.Caption = 'Percent'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMMENT1'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object wwDBComboDlgCAS: TUniEdit
    Left = 128
    Top = 94
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object SrcArinvtCAS: TDataSource
    DataSet = QryArinvtCAS
    Left = 70
    Top = 96
  end
  object QryArinvtCAS: TFDQuery
    BeforeOpen = QryArinvtCASBeforeOpen
    BeforePost = QryArinvtCASBeforePost
    AfterPost = ApplyUpdate
    AfterDelete = ApplyUpdate
    OnCalcFields = QryArinvtCASCalcFields
    OnNewRecord = QryArinvtCASNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'arinvt_cas'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,        '
      '       arinvt_id, '
      '       cas_id,    '
      '       percent,   '
      '       comment1  '
      '  from arinvt_cas'
      ' where arinvt_id = :arinvt_id'
      ' order by id')
    Left = 70
    Top = 109
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtCASCasName: TStringField
      DisplayLabel = 'CAS Name'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'CasName'
      Size = 30
      Calculated = True
    end
    object QryArinvtCASCasDescrip: TStringField
      DisplayLabel = 'CAS Description'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'CasDescrip'
      ReadOnly = True
      Size = 60
      Calculated = True
    end
    object QryArinvtCASPERCENT: TFMTBCDField
      DisplayLabel = 'Percent'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'PERCENT'
      Precision = 15
      Size = 6
    end
    object QryArinvtCASCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 36
      FieldName = 'COMMENT1'
      Origin = 'IQ.ARINVT_CAS.COMMENT1'
      Size = 255
    end
    object QryArinvtCASID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryArinvtCASARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryArinvtCASCAS_ID: TBCDField
      FieldName = 'CAS_ID'
      Origin = 'CAS_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt_cas'
      '  (ID, ARINVT_ID, CAS_ID, PERCENT, COMMENT1)'
      'values'
      '  (:ID, :ARINVT_ID, :CAS_ID, :PERCENT, :COMMENT1)')
    ModifySQL.Strings = (
      'update arinvt_cas'
      'set'
      '  ID = :ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  CAS_ID = :CAS_ID,'
      '  PERCENT = :PERCENT,'
      '  COMMENT1 = :COMMENT1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt_cas'
      'where'
      '  ID = :OLD_ID')
    Left = 70
    Top = 122
  end
  object PkCAS: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       casno,'
      '       descrip '
      '  from cas')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 262
    Top = 95
    object PkCASID: TFloatField
      FieldName = 'ID'
      Origin = 'IQ.CAS.ID'
      Visible = False
    end
    object PkCASCASNO: TStringField
      DisplayLabel = 'CAS Name'
      FieldName = 'CASNO'
      Origin = 'IQ.CAS.CASNO'
      Size = 30
    end
    object PkCASDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.CAS.DESCRIP'
      Size = 60
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryArinvtCAS')
    SecurityCode = 'FRMINVENVREGCOMPONENTS'
    Left = 298
    Top = 96
  end
  object MainMenu1: TUniMainMenu
    Left = 129
    Top = 121
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
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
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 166
    Top = 121
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmInvEnvRegComponents'
    WebUse = False
    TouchScreen = False
    Left = 199
    Top = 119
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmInvEnvRegComponents'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196611 $'
    BuildVersion = '176554'
    Left = 236
    Top = 123
  end
end
