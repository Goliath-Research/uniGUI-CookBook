object FrmRBomCloneInput: TFrmRBomCloneInput
  Left = 54
  Top = 145
  ClientHeight = 306
  ClientWidth = 608
  Caption = 'Items to be Cloned or Reused'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 608
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
    ExplicitWidth = 538
    object sbtnPopulateAll: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 26
      Height = 26
      Hint = 'Assign new Mfg# / Item# for all ...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000666666666666666666666666666666666666000066666486666486666666
        666F86666F86666600006666444866444866666666F66866F668666600006664
        44448444448666666F66668F66668666000066444444444444486666F6666666
        6666686600006444444444444444866F66666666666666860000F44444444444
        444486F666666666666666860000FFFF4448FF4447FF66FFFF6668FF6666FF66
        0000666F44486F44486666666F66686F666866660000666F44486F4448666666
        6F66686F666866660000666F44486F44486666666F66686F666866660000666F
        44486F44486666666F66686F666866660000666F44486F44486666666F66686F
        666866660000666FFFF66FFFF66666666FFFF66FFFF666660000666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPopulateAllClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 608
    Height = 240
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 391
    IQComponents.Grid.Height = 154
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRBom_Clone
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Grid.OnDrawColumnCell = wwDBGrid1DBGridDrawColumnCell
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcRBom_Clone
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = NavMainBeforeAction
    IQComponents.HiddenPanel.Left = 391
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 154
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 321
    IQComponents.HiddenPanel.ExplicitHeight = 89
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 530
    IQComponents.FormTab.ExplicitHeight = 118
    DataSource = SrcRBom_Clone
    Columns = <
      item
        FieldName = 'MFGNO_DISP'
        Title.Caption = 'BOM Tree'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_MFGNO'
        Title.Caption = 'New Mfg #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_MFG_DESCRIP'
        Title.Caption = 'New Mfg Description'
        Width = 161
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_ITEMNO'
        Title.Caption = 'New Item #'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_REV'
        Title.Caption = 'New Rev'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_DESCRIP'
        Title.Caption = 'New Description'
        Width = 189
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 154
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 35
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 35
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 538
    ExplicitHeight = 175
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 267
    Width = 608
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 202
    ExplicitWidth = 538
    object Panel3: TUniPanel
      Tag = 1999
      Left = 390
      Top = 1
      Width = 217
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 320
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
    object chkReuseOperations: TUniCheckBox
      Left = 10
      Top = 11
      Width = 129
      Height = 17
      Hint = ''
      Caption = 'Use Existing Processes'
      TabOrder = 1
    end
  end
  object wwDBComboDlgNewMfg: TUniEdit
    Left = 303
    Top = 64
    Width = 121
    Height = 21
    Hint = ''
    ParentShowHint = False
    Text = ''
    TabOrder = 3
  end
  object wwDBComboDlgNewItemNo: TUniEdit
    Left = 302
    Top = 89
    Width = 121
    Height = 21
    Hint = ''
    ParentShowHint = False
    Text = ''
    TabOrder = 4
  end
  object SrcRBom_Clone: TDataSource
    DataSet = QryRBom_Clone
    OnDataChange = SrcRBom_CloneDataChange
    Left = 55
    Top = 67
  end
  object QryRBom_Clone: TFDQuery
    BeforeOpen = QryRBom_CloneBeforeOpen
    BeforePost = QryRBom_CloneBeforePost
    AfterPost = ApplyUpdatesToTable
    CachedUpdates = True
    OnUpdateRecord = QryRBom_CloneUpdateRecord
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select'
      
        '       substrB( iqeval.substrW63Max( lpad('#39' '#39', (the_level-1)*5) ' +
        '|| standard.mfgno, 1, 255), 1, 255) as mfgno_disp,'
      '       arinvt.itemno,'
      '       arinvt.descrip,'
      '       arinvt.rev,'
      '       arinvt.class,'
      '       x.id, '
      '       x.standard_id,'
      '       x.arinvt_id,'
      '       x.new_mfgno,'
      '       x.new_itemno,'
      '       x.new_rev,'
      '       x.new_descrip,'
      '       x.kind,'
      '       x.new_mfg_descrip'
      '  from standard,'
      '       arinvt,'
      '       ( select id, '
      '                standard_id,'
      '                arinvt_id,'
      '                level as the_level,'
      '                new_mfgno,'
      '                new_itemno,'
      '                new_rev,'
      '                new_descrip,'
      '                kind,'
      '                new_mfg_descrip'
      '           from rbom_clone'
      '          where main_partno_id = :main_partno_id'
      '          start with'
      '                parent_id is NULL'
      '         connect by'
      '                prior id = parent_id ) x'
      '  where'
      '        x.arinvt_id = arinvt.id'
      '    and x.standard_id = standard.id'
      ''
      '                '
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 48
    Top = 129
    ParamData = <
      item
        Name = 'main_partno_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object QryRBom_CloneMFGNO_DISP: TStringField
      DisplayLabel = 'BOM Tree'
      DisplayWidth = 22
      FieldName = 'MFGNO_DISP'
      ReadOnly = True
      Size = 255
    end
    object QryRBom_CloneITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 16
      FieldName = 'ITEMNO'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryRBom_CloneNEW_MFGNO: TStringField
      DisplayLabel = 'New Mfg #'
      DisplayWidth = 16
      FieldName = 'NEW_MFGNO'
      Required = True
      Size = 25
    end
    object QryRBom_CloneNEW_MFG_DESCRIP: TStringField
      DisplayLabel = 'New Mfg Description'
      DisplayWidth = 23
      FieldName = 'NEW_MFG_DESCRIP'
      Size = 50
    end
    object QryRBom_CloneNEW_ITEMNO: TStringField
      DisplayLabel = 'New Item #'
      DisplayWidth = 17
      FieldName = 'NEW_ITEMNO'
      Required = True
      Size = 25
    end
    object QryRBom_CloneNEW_REV: TStringField
      DisplayLabel = 'New Rev'
      DisplayWidth = 11
      FieldName = 'NEW_REV'
      Size = 15
    end
    object QryRBom_CloneNEW_DESCRIP: TStringField
      DisplayLabel = 'New Description'
      DisplayWidth = 27
      FieldName = 'NEW_DESCRIP'
      Required = True
      Size = 100
    end
    object QryRBom_CloneDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 100
    end
    object QryRBom_CloneREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryRBom_CloneCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'CLASS'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryRBom_CloneID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryRBom_CloneSTANDARD_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'STANDARD_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryRBom_CloneARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryRBom_CloneKIND: TStringField
      DisplayLabel = 'Kind'
      DisplayWidth = 20
      FieldName = 'KIND'
      ReadOnly = True
      Visible = False
      Size = 30
    end
  end
end
