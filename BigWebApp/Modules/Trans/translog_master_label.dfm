object FrmTranslogMasterLabel: TFrmTranslogMasterLabel
  Left = 568
  Top = 144
  ClientHeight = 315
  ClientWidth = 408
  Caption = 'Serial Numbers'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 408
    Height = 29
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnLockSerialNumbersView: TUniSpeedButton
      Left = 3
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Lock Serial Numbers to Transaction'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB8BDBF528FAF5CA0C0509EB5B8BD
        BFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF7892B537BDF19CF9FF9DEFFF3183AD0075AA89A9C3FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0065B200CAFF84F7FF9FEBF91E00
        003692CB0094EE006B90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0267BC00B9FF60F1FF70AFBA000000459DCA29B5FF006CB4B8A394604632
        634935634935634935634935634935634935024DA60091F31CD8FF85F5FF91CE
        D377D6F636BDFF1175B7B7A293F9F3EDE7D9D1E3D4C9E2D1C5DFCBBFDDC7BCDE
        C6BA0043910681E204A0F43FA9E079C9F383E3FF4FBFFA006EAEBDA899FAF7F2
        FAF5F0FAF3ECF9F0E8FAEFE6FAEDE2F8EADF426B991D4360005A980082D30090
        DC3B99D03BAFEC2E91ACC6B0A1FCFBF8D8C4B9D6C0B5FBF4EECFB3A5CFB3A6FA
        EDE3B2B7B5574F48818B8897B7BD6396B13A5652449DAFFF00FFCCB6A7FCFDFB
        FCFCF9FBFAF6FBF8F3FBF5EFFAF3EBFAF0E7C9BFC7738C74DCC8BD75514BAAA0
        A25F7A57FF00FFFF00FFCCB6A7FCFEFCDBCAC0DAC8BDFBFAF7D3BCAFD6C0B3FA
        F3ECD4BAAD6972698D968D684E3AA499A3628762FF00FFFF00FFCCB6A7FCFEFC
        FCFEFCFCFEFCFCFDFAFCFBF7FBF9F4FBF6F1FBF4EDA5ABA5817E816A826A7173
        718AA68AFF00FFFF00FFCCB6A7FCFEFCDBCAC0DBCAC0FCFEFCD8C4B9D8C4B9FB
        F9F5D6C1B5D7C2B5A1B1A19292928E9F8EFF00FFFF00FFFF00FFCCB6A7FCFEFC
        FCFEFCFCFEFCFCFEFCFCFEFCFCFDFBFCFCF9FBFAF6FBF8F2FBF5EF684E3AFF00
        FFFF00FFFF00FFFF00FFEBAC8DEAAA8CEAA989E9A27EE89971E68F63E58555E3
        7B47E3743CE27238E37339CC6430FF00FFFF00FFFF00FFFF00FFEBAC8DFFC3A2
        FEBF9DFCBB98FBB692FAB08BF9AB83F8A67CF5A075F59A6DF59768D26C38FF00
        FFFF00FFFF00FFFF00FFEBAC8DEAAA8BEAAA8BEAA889E9A281E89C77E7946BE6
        8C60E58554E47D49E37740E27239FF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnLockSerialNumbersViewClick
    end
    object NavMain: TUniDBNavigator
      Left = 288
      Top = 1
      Width = 120
      Height = 27
      Hint = ''
      DataSource = SrcTransLogMasterLabel
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 29
    Width = 408
    Height = 286
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 191
    IQComponents.Grid.Height = 200
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTransLogMasterLabel
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
    IQComponents.Navigator.DataSource = SrcTransLogMasterLabel
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 191
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 200
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTransLogMasterLabel
    Columns = <
      item
        FieldName = 'SERIAL'
        Title.Caption = 'Serial #'
        Width = 161
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcTransLogMasterLabel: TDataSource
    DataSet = QryTransLogMasterLabel
    Left = 22
    Top = 166
  end
  object QryTransLogMasterLabel: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select t.id,'
      '       t.translog_id,'
      '       t.master_label_id,'
      '       m.serial'
      '  from translog_master_label t,'
      '       master_label m'
      ' where t.translog_id = :id'
      '   and t.master_label_id = m.id(+)'
      ' order by t.master_label_id  ')
    Left = 118
    Top = 185
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransLogMasterLabelSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 23
      FieldName = 'SERIAL'
      Size = 13
    end
    object QryTransLogMasterLabelID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryTransLogMasterLabelTRANSLOG_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TRANSLOG_ID'
      Visible = False
      Size = 0
    end
    object QryTransLogMasterLabelMASTER_LABEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
  end
end
