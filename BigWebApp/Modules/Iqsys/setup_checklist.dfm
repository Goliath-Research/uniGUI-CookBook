object FrmSetupCheckList: TFrmSetupCheckList
  Left = 0
  Top = 0
  HelpContext = 21511
  ClientHeight = 600
  ClientWidth = 734
  Caption = 'Setup Checklist'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 113
    Width = 734
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
    Width = 734
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbttnSetupTemplateChecklist: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Setup Template Checklists'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FF808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080FF00FF80808000000000000000000000000000000000000000
        0000000000000000000000000000000000000000808080FF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000808080FF00FF808080FFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF000000808080FF00FF808080C0C0C0
        808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000808080FF00FF808080FFFFFF000000FFFFFFC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0FFFFFF0000FFFFFFFFFFFFFF000000808080FF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000080C0C0C0FFFF
        FF000000808080FF00FF808080C0C0C0C0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFF0000FFFFFFFF0000FFC0C0C0000000808080FF00FF808080FFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        FFC0C0C0808080FF00FF808080FFFFFFC0C0C0FFFFFFC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF0000FFC0C0C0FF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0000000000FFC0C0C0808080C0C0C0808080FFFFFFC0C0C0C0C0C0C0C0C0FF
        FFFF808080000000000000800000000000808080FF00FF0000FF808080FFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFC0C0C00000
        00FF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF808080FFFFFFC0C0C0000000FF00FFFF00FFFF00FFFF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080C0C0C0808080FF00FFFF00
        FFFF00FFFF00FFFF00FF80808000000000000000000000000000000000000000
        0000808080808080FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbttnSetupTemplateChecklistClick
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 117
    Width = 734
    Height = 483
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 20
      Width = 732
      Height = 463
      Hint = ''
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 0
        Top = 217
        Width = 732
        Height = 4
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 221
        Width = 730
        Height = 242
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object wwDBGridDetail: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 728
          Height = 240
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 511
          IQComponents.Grid.Height = 154
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcSetupChecklistDetail
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
          IQComponents.Navigator.DataSource = SrcSetupChecklistDetail
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 511
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 154
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitHeight = 128
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitHeight = 157
          DataSource = SrcSetupChecklistDetail
          Columns = <
            item
              FieldName = 'SEQ'
              Title.Caption = '#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CHECK_TEXT'
              Title.Caption = 'Text'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CRITICAL'
              Title.Caption = 'Critical'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CHANGED'
              Title.Caption = 'Changed On'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CHANGEDBY'
              Title.Caption = 'Changed By'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'NOTES'
              Title.Caption = 'Notes'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitTop = 28
          ExplicitHeight = 214
          Marker = 0
        end
        object wwDBComboDlgDetailNote: TUniEdit
          Left = 528
          Top = 80
          Width = 177
          Height = 21
          Hint = ''
          Visible = False
          Text = ''
          TabOrder = 1
        end
      end
      object IQSearchHeader: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 730
        Height = 217
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 513
        IQComponents.Grid.Height = 131
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcSetupChecklist
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
        IQComponents.Navigator.DataSource = SrcSetupChecklist
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 513
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 131
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcSetupChecklist
        Columns = <
          item
            FieldName = 'SETUP_TEMPL_DESCRIP'
            Title.Caption = 'Setup Template Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SETUP_DATE'
            Title.Caption = 'Setup Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WORKORDER_ID'
            Title.Caption = 'Work Order'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CREATED'
            Title.Caption = 'Created On'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CREATEDBY'
            Title.Caption = 'Created By'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
    object Panel11: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 732
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label3: TUniLabel
        Left = 1
        Top = 1
        Width = 95
        Height = 13
        Hint = ''
        Caption = 'Checklist History'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object Panel10: TUniPanel
    Left = 0
    Top = 27
    Width = 734
    Height = 86
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Left = 1
      Top = 20
      Width = 732
      Height = 66
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 147
        Top = 0
        Width = 6
        Height = 66
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 147
        Height = 64
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 15
          Top = 15
          Width = 120
          Height = 13
          Hint = ''
          Caption = 'Setup Template Checklist'
          TabOrder = 1
        end
      end
      object Panel6: TUniPanel
        Left = 153
        Top = 1
        Width = 579
        Height = 64
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          579
          64)
        object wwDBComboDlgSetupChecklist: TUniEdit
          Left = 1
          Top = 12
          Width = 565
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ReadOnly = True
          OnKeyDown = wwDBComboDlgSetupChecklistKeyDown
        end
      end
    end
    object PnlCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 732
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblCaption: TUniLabel
        Left = 1
        Top = 1
        Width = 108
        Height = 13
        Hint = ''
        Caption = 'Assigned Template'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object PkTemplate: TIQWebHpick
    BeforeOpen = PkTemplateBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       descrip as descrip,'
      '       notes as notes,'
      '       eplant_id as eplant_id'
      '  from setup_templ_chklist'
      ' where source = :source'
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 432
    Top = 208
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end>
    object PkTemplateID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkTemplateDESCRIP: TStringField
      DisplayLabel = 'Template Description'
      DisplayWidth = 40
      FieldName = 'DESCRIP'
      Size = 150
    end
    object PkTemplateNOTES: TStringField
      DisplayLabel = 'Note'
      DisplayWidth = 40
      FieldName = 'NOTES'
      Size = 255
    end
    object PkTemplateEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object QryTemplate: TFDQuery
    BeforeOpen = QryTemplateBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select descrip'
      '  from setup_templ_chklist'
      ' where id = :setup_templ_chklist_id')
    Left = 48
    Top = 216
    ParamData = <
      item
        Name = 'setup_templ_chklist_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTemplateDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'SETUP_TEMPL_CHKLIST.DESCRIP'
      Size = 150
    end
  end
  object SrcTemplate: TDataSource
    DataSet = QryTemplate
    Left = 48
    Top = 248
  end
  object MainMenu1: TUniMainMenu
    Left = 464
    Top = 208
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
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmSetupCheckList'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 189264 $'
    Left = 496
    Top = 208
  end
  object QrySetupChecklist: TFDQuery
    BeforeOpen = QrySetupChecklistBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       setup_templ_chklist_id,'
      '       setup_templ_descrip,'
      '       setup_date,'
      '       workorder_id,'
      '       source,'
      '       source_id,'
      '       created,'
      '       createdby'
      '  from setup_chklist'
      ' where source = :source'
      '   and source_id = :source_id')
    Left = 96
    Top = 216
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySetupChecklistSETUP_TEMPL_DESCRIP: TStringField
      DisplayLabel = 'Setup Template Description'
      DisplayWidth = 45
      FieldName = 'SETUP_TEMPL_DESCRIP'
      Origin = 'SETUP_CHKLIST.SETUP_TEMPL_DESCRIP'
      Size = 150
    end
    object QrySetupChecklistSETUP_DATE: TDateTimeField
      DisplayLabel = 'Setup Date'
      DisplayWidth = 18
      FieldName = 'SETUP_DATE'
      Origin = 'SETUP_CHKLIST.SETUP_DATE'
    end
    object QrySetupChecklistWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order'
      DisplayWidth = 11
      FieldName = 'WORKORDER_ID'
      Origin = 'SETUP_CHKLIST.WORKORDER_ID'
      Size = 0
    end
    object QrySetupChecklistCREATED: TDateTimeField
      DisplayLabel = 'Created On'
      DisplayWidth = 18
      FieldName = 'CREATED'
      Origin = 'SETUP_CHKLIST.CREATED'
    end
    object QrySetupChecklistCREATEDBY: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 20
      FieldName = 'CREATEDBY'
      Origin = 'SETUP_CHKLIST.CREATEDBY'
      Size = 30
    end
    object QrySetupChecklistID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'SETUP_CHKLIST.ID'
      Visible = False
      Size = 0
    end
    object QrySetupChecklistSETUP_TEMPL_CHKLIST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SETUP_TEMPL_CHKLIST_ID'
      Origin = 'SETUP_CHKLIST.SETUP_TEMPL_CHKLIST_ID'
      Visible = False
      Size = 0
    end
    object QrySetupChecklistSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'SETUP_CHKLIST.SOURCE'
      Visible = False
      Size = 30
    end
    object QrySetupChecklistSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'SETUP_CHKLIST.SOURCE_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSetupChecklist: TDataSource
    DataSet = QrySetupChecklist
    Left = 96
    Top = 248
  end
  object SrcSetupChecklistDetail: TDataSource
    DataSet = QrySetupChecklistDetail
    Left = 144
    Top = 248
  end
  object QrySetupChecklistDetail: TFDQuery
    MasterSource = SrcSetupChecklist
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       setup_chklist_id,'
      '       seq,'
      '       check_text,'
      '       critical,'
      '       notes,'
      '       status,'
      '       changed,'
      '       changedby'
      '  from setup_chklist_dtl'
      ' where setup_chklist_id = :id'
      ' order by seq')
    Left = 144
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QrySetupChecklistDetailSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 4
      FieldName = 'SEQ'
      Origin = 'IQ.SETUP_CHKLIST_DTL.SEQ'
      Size = 0
    end
    object QrySetupChecklistDetailCHECK_TEXT: TStringField
      DisplayLabel = 'Text'
      DisplayWidth = 26
      FieldName = 'CHECK_TEXT'
      Origin = 'IQ.SETUP_CHKLIST_DTL.CHECK_TEXT'
      Size = 150
    end
    object QrySetupChecklistDetailCRITICAL: TStringField
      DisplayLabel = 'Critical'
      DisplayWidth = 7
      FieldName = 'CRITICAL'
      Origin = 'IQ.SETUP_CHKLIST_DTL.CRITICAL'
      Size = 1
    end
    object QrySetupChecklistDetailSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 8
      FieldName = 'STATUS'
      Origin = 'IQ.SETUP_CHKLIST_DTL.STATUS'
      Size = 3
    end
    object QrySetupChecklistDetailCHANGED: TDateTimeField
      DisplayLabel = 'Changed On'
      DisplayWidth = 18
      FieldName = 'CHANGED'
      Origin = 'IQ.SETUP_CHKLIST_DTL.CHANGED'
    end
    object QrySetupChecklistDetailCHANGEDBY: TStringField
      DisplayLabel = 'Changed By'
      DisplayWidth = 18
      FieldName = 'CHANGEDBY'
      Origin = 'IQ.SETUP_CHKLIST_DTL.CHANGEDBY'
      Size = 30
    end
    object QrySetupChecklistDetailNOTES: TStringField
      DisplayLabel = 'Notes'
      DisplayWidth = 29
      FieldName = 'NOTES'
      Origin = 'IQ.SETUP_CHKLIST_DTL.NOTES'
      Size = 2000
    end
    object QrySetupChecklistDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.SETUP_CHKLIST_DTL.ID'
      Visible = False
      Size = 0
    end
    object QrySetupChecklistDetailSETUP_CHKLIST_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SETUP_CHKLIST_ID'
      Origin = 'IQ.SETUP_CHKLIST_DTL.SETUP_CHKLIST_ID'
      Visible = False
      Size = 0
    end
  end
end
