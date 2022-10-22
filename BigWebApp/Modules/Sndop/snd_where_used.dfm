object FrmSndWhereUsed: TFrmSndWhereUsed
  Left = 137
  Top = 236
  ClientHeight = 215
  ClientWidth = 552
  Caption = 'Where Used?'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAttachedMat: TUniPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 215
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object IQSearchOpMat: TIQUniGridControl
      Left = 1
      Top = 24
      Width = 550
      Height = 191
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 333
      IQComponents.Grid.Height = 105
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcBOM_OPMat
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
      IQComponents.Navigator.DataSource = SrcBOM_OPMat
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 333
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 105
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcBOM_OPMat
      Columns = <
        item
          FieldName = 'MFGNO'
          Title.Caption = 'Config #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTNO_CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTNO_ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTNO_REV'
          Title.Caption = 'Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PARTNO_DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STANDARD_PK_HIDE'
          Title.Caption = 'BOM Inactive'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'PARTNO_DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object PnlToolbarCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 4
      Width = 550
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblCaptionLabel: TUniLabel
        Left = 1
        Top = 1
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Attached To'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object QryBOM_Opmat: TFDQuery
    BeforeOpen = QryBOM_OpmatBeforeOpen
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id            as standard_id,'
      '       p.arinvt_id     as partno_arinvt_id,'
      '       a.class         as partno_class,'
      '       a.itemno        as partno_itemno,'
      '       a.rev           as partno_rev,'
      '       a.descrip       as partno_descrip,'
      '       a.descrip2      as partno_descrip2,'
      '       p.id            as partno_id,'
      '       ptoper.sndop_id as sndop_id,'
      '       s.pk_hide       as standard_pk_hide,'
      '       ptoper.id       as ptoper_id'
      '  from standard s, '
      '       partno p,'
      '       ptoper, '
      '       arinvt a'
      ' where'
      '       s.id = p.standard_id'
      '   and p.id = ptoper.partno_id'
      '   and ptoper.sndop_id = :sndop_id'
      '   and p.arinvt_id = a.id'
      ''
      ' ')
    Left = 258
    Top = 22
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBOM_OpmatMFGNO: TStringField
      DisplayLabel = 'Config #'
      DisplayWidth = 11
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryBOM_OpmatPARTNO_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'PARTNO_CLASS'
      Origin = 'a.class'
      Size = 2
    end
    object QryBOM_OpmatPARTNO_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 17
      FieldName = 'PARTNO_ITEMNO'
      Origin = 'a.itemno'
      Size = 50
    end
    object QryBOM_OpmatPARTNO_REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 4
      FieldName = 'PARTNO_REV'
      Origin = 'a.rev'
      Size = 15
    end
    object QryBOM_OpmatPARTNO_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'PARTNO_DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryBOM_OpmatSTANDARD_PK_HIDE: TStringField
      DisplayLabel = 'BOM Inactive'
      DisplayWidth = 12
      FieldName = 'STANDARD_PK_HIDE'
      Origin = 's.PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryBOM_OpmatPARTNO_DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'PARTNO_DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryBOM_OpmatSTANDARD_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'STANDARD_ID'
      Origin = 's.id'
      Visible = False
      Size = 0
    end
    object QryBOM_OpmatPARTNO_ARINVT_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'PARTNO_ARINVT_ID'
      Origin = 'p.arinvt_id'
      Visible = False
      Size = 0
    end
    object QryBOM_OpmatPARTNO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNO_ID'
      Origin = 'p.id'
      Visible = False
      Size = 0
    end
    object QryBOM_OpmatSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'IQ.PTOPER.SNDOP_ID'
      Visible = False
      Size = 0
    end
    object QryBOM_OpmatPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Origin = 'IQ.PTOPER.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcBOM_OPMat: TDataSource
    DataSet = QryBOM_Opmat
    Left = 307
    Top = 106
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 233
    Top = 149
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object SubstituteProcess1: TUniMenuItem
      Caption = 'Substitute Process'
      OnClick = SubstituteProcess1Click
    end
  end
  object IQJumpBOM: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcBOM_OPMat
    JumpTo = jtBom
    Left = 337
    Top = 34
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSndWhereUsed'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 171
    Top = 30
  end
  object PkSndOpAssy1: TIQWebHpick
    SQL.Strings = (
      'select opno, '
      '       opdesc, '
      '       op_class, '
      '       id,'
      '       pk_hide'
      '  from sndop'
      ' where op_class = '#39'AS'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 483
    Top = 111
    object StringField18: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object StringField19: TStringField
      DisplayLabel = 'Description'
      FieldName = 'OPDESC'
      Size = 60
    end
    object StringField20: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 6
      FieldName = 'OP_CLASS'
      Size = 2
    end
    object FloatField5: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSndOpAssy1PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SubstituteProcess1')
    SecurityCode = 'FRMSNDWHEREUSED'
    Left = 389
    Top = 119
  end
end
