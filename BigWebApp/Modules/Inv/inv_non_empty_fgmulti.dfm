object FrmInvNonEmpty: TFrmInvNonEmpty
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 635
  Caption = 'Existing Inventory'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 57
    Width = 635
    Height = 280
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 418
    IQComponents.Grid.Height = 194
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 418
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 194
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
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
        FieldName = 'ONHAND'
        Title.Caption = 'OnHand'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LOTNO'
        Title.Caption = 'Lot #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
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
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FGMULTI_ID'
        Title.Caption = 'Inv Location ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 57
    Caption = 'Existing Inventory Found'
    Text = 'Unable to change location status'
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF610000000774494D4507DB030E102429BC2E91150000
      00097048597300000B1200000B1201D2DD7EFC0000000467414D410000B18F0B
      FC6105000003454944415478DA6D937F4CD47518C75F9F3BEE4EBE88200767EA
      04E9FC15675368804E1D2D17D3863FB76C36B56CCB144DA4D4B9FE10F32F5DEB
      1FC18AFCA3C41242B3289AE28F25A3E9ECE4DC812204422ABF8EB83BE53AEE38
      E03E7D389763D9E7EFF7E7F53CCFFB793F422219FF1C76BB9CDC7816D39D3A64
      8F0B8647084FB2306CCBE1D192D7C9C8CE16E3F5623CA0F5BB4FA4E1D411BA9C
      1E023E1D9A6646A7D733E8F32AD51096A90918DFFB90B97B3E12CF003A3E2F90
      7F1D2BC1E7D29899B690704A32EEA828A5D061F2FB49ECEBA3D5E9243834C0AC
      77B733E7D871F114D072A658BA0F1532E24D246BCD7A3C2929DCED6867F917A5
      11F895FC7C5E98368D24978BFAAA2ABAFBBA9873E453E617EE111140F3AAE9B2
      EDDA00B92BD7624C4DE5762884DBEB21A7F4CB08E0F20785A42698B1AA71C20F
      1E70BEA202E38409BCDADB23C41F273E96CD4545A44DCFC46AB3415212AE680D
      A7EA20B7AC2C02B8B0772F0BE3E3792E1C867E37BD8D0D545DBD4AD6810388F6
      0D0BE4CD0B4ED6AD7C83289309264EC41B1D8D5D55CAADAC24AC3E9DDFFD3E8B
      E32693303A0203038403012ABE2D63CAEC7988E62C8BEC68F3B162DD9B30A204
      42E055AD5EBFD7CA6BBFD6E25706D6EECC67BED144F25881E16190924BDF57E2
      933AC4DD8CA9F2CFF647AC786B1BF87CA0E88C8E52E7F1B0A4A6069732AE79FF
      7EACAA9364D5194623A8ED5C3A7D129FCE8468C95B266FD5D4B17EDB4E0CC120
      3C7E0C8383B4F5F763501EF478BDE80E1591153B09C600B1B184A304A74B8F93
      94BE08D1F0F557D2B1F51D162D5DCADCB434E8ED0555BDDBE3C6619DC5DFAAE2
      2BDDDDE8D46889336680D9CCC3B63B945FAC555B2A7D9283DFD233645353139B
      F2F2D0C64650A171C4C731EFCC598C313138B7BECD4B9D5D910D853413277F3C
      47DCCCD96C68703EC9C1AD9F7E96CE8D1B311AF4ACB5BD88A6C668D9B285D482
      02422A13378A8B595E5D4D303E861FEC763AFD215E2E2F2773CD6AF134CAF5C5
      25F2E6BE7DCABF103916337A2D867B3B76115499B09CF80C8BBA878B9D7D04A4
      9E65478FB2B860B778E698EAAB7F915D070F72DBE14018401B3B053DF8D5E602
      43604B4FE7F9C387C95C9527FEF71AFF7DBF9FFA46BA4A4AB8DFD8884A1253AC
      569255EAB2376F12FFD5FE03C95665A0700127AF0000000049454E44AE426082}
    PictureLayout = plImageLeft
    LayoutStyle = lsBasic
    Align = alTop
    DesignSize = (
      635
      57)
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 76
    Top = 156
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.itemno,'
      '       a.descrip,'
      '       f.id as fgmulti_id,'
      '       f.onhand, '
      '       f.lotno,'
      '       a.class,'
      '       a.rev,'
      '       a.descrip2'
      '  from fgmulti f,'
      '       arinvt a'
      ' where f.loc_id = :loc_id'
      '   and f.arinvt_id = a.id'
      '   and nvl(f.onhand,0) <> 0')
    Left = 77
    Top = 184
    ParamData = <
      item
        Name = 'loc_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 100
    end
    object Query1ONHAND: TBCDField
      DisplayLabel = 'OnHand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Origin = 'f.ONHAND'
    end
    object Query1LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'f.LOTNO'
      Size = 25
    end
    object Query1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.CLASS'
      FixedChar = True
      Size = 2
    end
    object Query1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.REV'
      FixedChar = True
      Size = 15
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP2'
      Origin = 'a.DESCRIP2'
      Size = 100
    end
    object Query1FGMULTI_ID: TBCDField
      DisplayLabel = 'Inv Location ID'
      DisplayWidth = 12
      FieldName = 'FGMULTI_ID'
      Origin = 'f.id'
      Size = 0
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 128
    Top = 156
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
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
    ModuleName = 'FrmInvNonEmptyFGMulti'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189046 $'
    Left = 164
    Top = 156
  end
end
