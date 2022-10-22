object FrmForTrack: TFrmForTrack
  Left = 469
  Top = 164
  ClientHeight = 511
  ClientWidth = 365
  Caption = 'Tracking Foreign Serial Number '
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TUniPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 511
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 425
    object Splitter2: TUniSplitter
      Left = 1
      Top = 356
      Width = 363
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
      ExplicitTop = 261
    end
    object Splitter1: TUniSplitter
      Left = 1
      Top = 233
      Width = 363
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
      ExplicitTop = 138
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 359
      Width = 363
      Height = 151
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitTop = 264
      ExplicitHeight = 160
      object SgParent: TUniStringGrid
        Left = 1
        Top = 21
        Width = 361
        Height = 129
        Hint = ''
        FixedCols = 0
        RowCount = 2
        ColCount = 3
        DefaultColWidth = 220
        DefaultRowHeight = 17
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
        Columns = <>
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitHeight = 138
      end
      object PnlBelongstoPalletCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 361
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object lblBelongstoPalletCaption: TUniLabel
          Left = 1
          Top = 1
          Width = 94
          Height = 13
          Hint = ''
          Caption = 'Belongs to Pallet'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 236
      Width = 363
      Height = 120
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 141
      object SGMaster: TUniStringGrid
        Left = 1
        Top = 21
        Width = 361
        Height = 98
        Hint = ''
        FixedCols = 0
        RowCount = 2
        ColCount = 3
        DefaultColWidth = 220
        DefaultRowHeight = 17
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
        Columns = <>
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
      object PnlBelongstoLabelCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 361
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object lblBelongstoLabelCaption: TUniLabel
          Left = 1
          Top = 1
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Belongs to Label'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 363
      Height = 232
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object GridFor: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 361
        Height = 230
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 144
        IQComponents.Grid.Height = 144
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcForeignLbl
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
        IQComponents.Navigator.DataSource = SrcForeignLbl
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 144
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 144
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitHeight = 22
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitHeight = 51
        DataSource = SrcForeignLbl
        Columns = <
          item
            FieldName = 'SERIAL'
            Title.Caption = 'Serial #'
            Width = 140
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SCAN_DATE'
            Title.Caption = 'Scan Date'
            Width = 126
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        ExplicitTop = 28
        ExplicitHeight = 108
        Marker = 0
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 98
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object SearchSerial1: TUniMenuItem
        Caption = '&Search Serial#'
        OnClick = SearchSerial1Click
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Tracking Serial Number (Foreign)'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196432 $'
    BuildVersion = '176554'
    Left = 136
    Top = 40
  end
  object QryForeignLbl: TFDQuery
    AfterScroll = QryForeignLblAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       master_label_id,'
      '       serial,'
      '       scan_date'
      '  from foreign_label'
      ' where serial = :ASer'
      ''
      ' '
      ' ')
    Left = 176
    Top = 39
    ParamData = <
      item
        Name = 'ASer'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryForeignLblSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 20
      FieldName = 'SERIAL'
      Origin = 'IQ.FOREIGN_LABEL.SERIAL'
      Size = 50
    end
    object QryForeignLblSCAN_DATE: TDateTimeField
      DisplayLabel = 'Scan Date'
      DisplayWidth = 18
      FieldName = 'SCAN_DATE'
      Origin = 'IQ.FOREIGN_LABEL.SCAN_DATE'
    end
    object QryForeignLblID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.FOREIGN_LABEL.ID'
      Visible = False
      Size = 0
    end
    object QryForeignLblMASTER_LABEL_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'MASTER_LABEL_ID'
      Origin = 'IQ.FOREIGN_LABEL.MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
  end
  object QryMasterLbl: TFDQuery
    MasterSource = SrcForeignLbl
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       arcusto_id,'
      '       fg_lotno,'
      '       boxno,'
      '       print_date,'
      '       scanned,'
      '       serial,'
      '       qty,'
      '       parent_id,'
      '       lpad( parent_id, 9, '#39'0'#39') as parent_id_disp,'
      '       dispo_scan,'
      '       volume,'
      '       weight,'
      '       is_skid,'
      '       loc_desc,'
      '       box_id,'
      '       arinvt_id,'
      '       sys_date,'
      '       user_name'
      '  from master_label'
      ' where id = :MASTER_LABEL_ID'
      ' '
      ' ')
    Left = 216
    Top = 39
    ParamData = <
      item
        Name = 'MASTER_LABEL_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMasterLblEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'MASTER_LABEL.EQNO'
      Size = 60
    end
    object QryMasterLblCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'MASTER_LABEL.CLASS'
      Size = 2
    end
    object QryMasterLblITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'MASTER_LABEL.ITEMNO'
      Size = 50
    end
    object QryMasterLblREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'MASTER_LABEL.REV'
      Size = 15
    end
    object QryMasterLblDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'MASTER_LABEL.DESCRIP'
      Size = 100
    end
    object QryMasterLblDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'MASTER_LABEL.DESCRIP2'
      Size = 100
    end
    object QryMasterLblMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'MASTER_LABEL.MFGNO'
      Size = 50
    end
    object QryMasterLblPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'MASTER_LABEL.PONO'
      Size = 35
    end
    object QryMasterLblFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'MASTER_LABEL.FG_LOTNO'
      Size = 25
    end
    object QryMasterLblBOXNO: TBCDField
      DisplayLabel = 'Box #'
      DisplayWidth = 10
      FieldName = 'BOXNO'
      Origin = 'MASTER_LABEL.BOXNO'
      Size = 0
    end
    object QryMasterLblPRINT_DATE: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'MASTER_LABEL.PRINT_DATE'
    end
    object QryMasterLblSCANNED: TStringField
      DisplayLabel = 'Scanned'
      DisplayWidth = 1
      FieldName = 'SCANNED'
      Origin = 'MASTER_LABEL.SCANNED'
      Size = 1
    end
    object QryMasterLblSERIAL: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'MASTER_LABEL.SERIAL'
      Size = 13
    end
    object QryMasterLblQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'MASTER_LABEL.QTY'
      Size = 6
    end
    object QryMasterLblDISPO_SCAN: TStringField
      DisplayLabel = 'Dispo Scan'
      DisplayWidth = 1
      FieldName = 'DISPO_SCAN'
      Origin = 'MASTER_LABEL.DISPO_SCAN'
      Size = 1
    end
    object QryMasterLblVOLUME: TFMTBCDField
      DisplayLabel = 'Volume'
      DisplayWidth = 10
      FieldName = 'VOLUME'
      Origin = 'MASTER_LABEL.VOLUME'
      Size = 6
    end
    object QryMasterLblWEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Origin = 'MASTER_LABEL.WEIGHT'
      Size = 6
    end
    object QryMasterLblLOC_DESC: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'MASTER_LABEL.LOC_DESC'
      Size = 30
    end
    object QryMasterLblUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'MASTER_LABEL.USER_NAME'
      Size = 35
    end
    object QryMasterLblID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'MASTER_LABEL.ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblARCUSTO_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'MASTER_LABEL.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblPARENT_ID: TBCDField
      Tag = 1
      DisplayLabel = 'Parent Pallet #'
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'MASTER_LABEL.PARENT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblIS_SKID: TStringField
      Tag = 1
      DisplayWidth = 1
      FieldName = 'IS_SKID'
      Origin = 'MASTER_LABEL.IS_SKID'
      Visible = False
      Size = 1
    end
    object QryMasterLblBOX_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'BOX_ID'
      Origin = 'MASTER_LABEL.BOX_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblARINVT_ID: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'MASTER_LABEL.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryMasterLblSYS_DATE: TDateTimeField
      Tag = 1
      DisplayWidth = 18
      FieldName = 'SYS_DATE'
      Origin = 'MASTER_LABEL.SYS_DATE'
      Visible = False
    end
    object QryMasterLblPARENT_ID_DISP: TStringField
      DisplayLabel = 'Belongs to Pallet #'
      FieldName = 'PARENT_ID_DISP'
      Size = 9
    end
    object QryMasterLblORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'MASTER_LABEL.ORDERNO'
      Size = 15
    end
  end
  object SrcMasterLbl: TDataSource
    DataSet = QryMasterLbl
    Left = 216
    Top = 55
  end
  object SrcForeignLbl: TDataSource
    DataSet = QryForeignLbl
    Left = 176
    Top = 56
  end
  object QryParentLbl: TFDQuery
    MasterSource = SrcMasterLbl
    MasterFields = 'PARENT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2,'
      '       mfgno,'
      '       orderno,'
      '       pono,'
      '       arcusto_id,'
      '       fg_lotno,'
      '       boxno,'
      '       print_date,'
      '       scanned,'
      '       serial,'
      '       qty,'
      '       parent_id,'
      '       lpad( parent_id, 9, '#39'0'#39') as parent_id_disp,'
      '       dispo_scan,'
      '       volume,'
      '       weight,'
      '       is_skid,'
      '       loc_desc,'
      '       box_id,'
      '       arinvt_id,'
      '       sys_date,'
      '       user_name'
      '  from master_label'
      ' where id = :PARENT_ID'
      ' '
      ' '
      ' ')
    Left = 256
    Top = 39
    ParamData = <
      item
        Name = 'PARENT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'MASTER_LABEL.EQNO'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'MASTER_LABEL.CLASS'
      Size = 2
    end
    object StringField3: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'MASTER_LABEL.ITEMNO'
      Size = 50
    end
    object StringField4: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'MASTER_LABEL.REV'
      Size = 15
    end
    object StringField5: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'MASTER_LABEL.DESCRIP'
      Size = 100
    end
    object StringField6: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 100
      FieldName = 'DESCRIP2'
      Origin = 'MASTER_LABEL.DESCRIP2'
      Size = 100
    end
    object StringField7: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'MASTER_LABEL.MFGNO'
      Size = 50
    end
    object StringField8: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'MASTER_LABEL.PONO'
      Size = 35
    end
    object StringField9: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'MASTER_LABEL.FG_LOTNO'
      Size = 25
    end
    object FloatField1: TBCDField
      DisplayLabel = 'Box #'
      DisplayWidth = 10
      FieldName = 'BOXNO'
      Origin = 'MASTER_LABEL.BOXNO'
      Size = 0
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Print Date'
      DisplayWidth = 18
      FieldName = 'PRINT_DATE'
      Origin = 'MASTER_LABEL.PRINT_DATE'
    end
    object StringField10: TStringField
      DisplayLabel = 'Scanned'
      DisplayWidth = 1
      FieldName = 'SCANNED'
      Origin = 'MASTER_LABEL.SCANNED'
      Size = 1
    end
    object StringField11: TStringField
      DisplayLabel = 'Serial #'
      DisplayWidth = 9
      FieldName = 'SERIAL'
      Origin = 'MASTER_LABEL.SERIAL'
      Size = 13
    end
    object FloatField2: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'MASTER_LABEL.QTY'
      Size = 6
    end
    object StringField12: TStringField
      DisplayLabel = 'Dispo Scan'
      DisplayWidth = 1
      FieldName = 'DISPO_SCAN'
      Origin = 'MASTER_LABEL.DISPO_SCAN'
      Size = 1
    end
    object FloatField3: TFMTBCDField
      DisplayLabel = 'Volume'
      DisplayWidth = 10
      FieldName = 'VOLUME'
      Origin = 'MASTER_LABEL.VOLUME'
      Size = 6
    end
    object FloatField4: TFMTBCDField
      DisplayLabel = 'Weight'
      DisplayWidth = 10
      FieldName = 'WEIGHT'
      Origin = 'MASTER_LABEL.WEIGHT'
      Size = 6
    end
    object StringField13: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOC_DESC'
      Origin = 'MASTER_LABEL.LOC_DESC'
      Size = 30
    end
    object StringField14: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'MASTER_LABEL.USER_NAME'
      Size = 35
    end
    object FloatField5: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'MASTER_LABEL.ID'
      Visible = False
      Size = 0
    end
    object FloatField6: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'MASTER_LABEL.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object FloatField7: TBCDField
      Tag = 1
      DisplayLabel = 'Parent Pallet #'
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'MASTER_LABEL.PARENT_ID'
      Visible = False
      Size = 0
    end
    object StringField15: TStringField
      Tag = 1
      DisplayWidth = 1
      FieldName = 'IS_SKID'
      Origin = 'MASTER_LABEL.IS_SKID'
      Visible = False
      Size = 1
    end
    object FloatField8: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'BOX_ID'
      Origin = 'MASTER_LABEL.BOX_ID'
      Visible = False
      Size = 0
    end
    object FloatField9: TBCDField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'MASTER_LABEL.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object DateTimeField2: TDateTimeField
      Tag = 1
      DisplayWidth = 18
      FieldName = 'SYS_DATE'
      Origin = 'MASTER_LABEL.SYS_DATE'
      Visible = False
    end
    object StringField16: TStringField
      DisplayLabel = 'Belongs to Pallet #'
      FieldName = 'PARENT_ID_DISP'
      Size = 9
    end
    object StringField17: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'MASTER_LABEL.ORDERNO'
      Size = 15
    end
  end
end
