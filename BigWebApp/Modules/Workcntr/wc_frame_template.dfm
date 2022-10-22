object FrmWorkCenterFrameTemplate: TFrmWorkCenterFrameTemplate
  Left = 281
  Top = 223
  ClientHeight = 363
  ClientWidth = 400
  Caption = 'Frame Template'
  OldCreateOrder = False
  OnClose = FormClose
  KeyPreview = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 118
    Width = 400
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object pnlTop01: TUniPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 118
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnSearch: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 25
        Height = 25
        Hint = ''
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
        OnClick = sbtnSearchClick
      end
      object NavMain: TUniDBNavigator
        Left = 157
        Top = 1
        Width = 240
        Height = 25
        Hint = ''
        DataSource = SrcFrame
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 28
      Width = 398
      Height = 89
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = SrcFrame
      Items = <
        item
          DataSource = SrcFrame
          DataField = 'FRAME_NO'
          Caption = 'Frame #'
          WordWrap = False
        end
        item
          DataSource = SrcFrame
          DataField = 'DESCRIP'
          Caption = 'Description'
          WordWrap = False
        end
        item
          DataSource = SrcFrame
          DataField = 'PmEqno'
          Caption = 'Tool Equipment #'
          CustomControl = wwDBComboDlgPmEqmt
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 118
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      object wwDBComboDlgPmEqmt: TUniEdit
        Left = 184
        Top = 88
        Width = 274
        Height = 18
        Hint = ''
        Visible = False
        BorderStyle = ubsNone
        Text = ''
        TabOrder = 0
        TabStop = False
        ReadOnly = True
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 122
    Width = 400
    Height = 241
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ' Frame Sets'
    end
    object wwDBGridFrameSets: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 398
      Height = 212
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 181
      IQComponents.Grid.Height = 126
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcFrameSet
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
      IQComponents.Navigator.DataSource = SrcFrameSet
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 181
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 126
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcFrameSet
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = 'Position #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_TYPE'
          Title.Caption = 'Set Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBLookupComboCntrType: TUniDBLookupComboBox
      Left = 128
      Top = 120
      Width = 121
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object SrcFrame: TDataSource
    DataSet = QryFrame
    Left = 112
    Top = 160
  end
  object QryFrame: TFDQuery
    BeforePost = QryFrameBeforePost
    OnCalcFields = QryFrameCalcFields
    OnNewRecord = QryFrameNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FRAME'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLFrame
    SQL.Strings = (
      'select id,'
      '       frame_no,'
      '       descrip,'
      '       pmeqmt_id'
      '  from frame'
      ' order by frame_no  ')
    Left = 112
    Top = 176
    object QryFrameID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FRAME.ID'
      Size = 0
    end
    object QryFrameFRAME_NO: TStringField
      DisplayLabel = 'Frame #'
      FieldName = 'FRAME_NO'
      Origin = 'IQ.FRAME.FRAME_NO'
      Size = 25
    end
    object QryFrameDESCRIP: TStringField
      DisplayLabel = 'Frame Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.FRAME.DESCRIP'
      Size = 100
    end
    object QryFramePMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Origin = 'IQ.FRAME.PMEQMT_ID'
      Size = 0
    end
    object QryFramePmEqno: TStringField
      FieldKind = fkCalculated
      FieldName = 'PmEqno'
      Size = 25
      Calculated = True
    end
  end
  object UpdateSQLFrame: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into frame'
      '  (ID, FRAME_NO, DESCRIP, PMEQMT_ID)'
      'values'
      '  (:ID, :FRAME_NO, :DESCRIP, :PMEQMT_ID)')
    ModifySQL.Strings = (
      'update frame'
      'set'
      '  ID = :ID,'
      '  FRAME_NO = :FRAME_NO,'
      '  DESCRIP = :DESCRIP,'
      '  PMEQMT_ID = :PMEQMT_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from frame'
      'where'
      '  ID = :OLD_ID')
    Left = 112
    Top = 200
  end
  object PkFrame: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.id as id,'
      '       f.frame_no as frame_no,'
      '       f.descrip as descrip,'
      '       p.eqno as eqno'
      '  from frame f,'
      '       pmeqmt p'
      ' where f.pmeqmt_id = p.id(+)'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 40
    object PkFrameID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkFrameFRAME_NO: TStringField
      DisplayLabel = 'Frame #'
      FieldName = 'FRAME_NO'
      Size = 25
    end
    object PkFrameDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkFrameEQNO: TStringField
      DisplayLabel = 'Tool Equipment #'
      FieldName = 'EQNO'
      Size = 25
    end
  end
  object SrcFrameSet: TDataSource
    DataSet = QryFrameSet
    Left = 152
    Top = 160
  end
  object QryFrameSet: TFDQuery
    BeforeInsert = PostParentBeforeEdit
    BeforeEdit = PostParentBeforeEdit
    BeforePost = QryFrameSetBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryFrameSetNewRecord
    MasterSource = SrcFrame
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FRAME_SET'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLFrameSet
    SQL.Strings = (
      'select id,'
      '       frame_id,'
      '       cntr_type,'
      '       seq'
      '  from frame_set'
      ' where frame_id = :id'
      ' order by seq')
    Left = 152
    Top = 176
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryFrameSetSEQ: TBCDField
      DisplayLabel = 'Position #'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'IQ.FRAME_SET.SEQ'
      Size = 0
    end
    object QryFrameSetCNTR_TYPE: TStringField
      DisplayLabel = 'Set Type'
      DisplayWidth = 26
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.FRAME_SET.CNTR_TYPE'
    end
    object QryFrameSetID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FRAME_SET.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryFrameSetFRAME_ID: TBCDField
      FieldName = 'FRAME_ID'
      Origin = 'IQ.FRAME_SET.FRAME_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLFrameSet: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into frame_set'
      '  (ID, FRAME_ID, CNTR_TYPE, SEQ)'
      'values'
      '  (:ID, :FRAME_ID, :CNTR_TYPE, :SEQ)')
    ModifySQL.Strings = (
      'update frame_set'
      'set'
      '  ID = :ID,'
      '  FRAME_ID = :FRAME_ID,'
      '  CNTR_TYPE = :CNTR_TYPE,'
      '  SEQ = :SEQ'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from frame_set'
      'where'
      '  ID = :OLD_ID')
    Left = 152
    Top = 203
  end
  object QrtCntrType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select distinct name as cntr_type from cntr_type where misc.epla' +
        'nt_filter( eplant_id ) = 1')
    Left = 200
    Top = 178
    object QrtCntrTypeCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.WORK_CENTER.CNTR_TYPE'
      FixedChar = True
    end
  end
end
