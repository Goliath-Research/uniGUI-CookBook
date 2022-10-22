object FrmWO_Alloc_Substitute: TFrmWO_Alloc_Substitute
  Left = 0
  Top = 0
  ClientHeight = 469
  ClientWidth = 529
  Caption = 'Select Substitute'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 428
    Width = 529
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 349
      Top = 1
      Width = 180
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 94
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object GroupBox1: TUniGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 6
    Width = 523
    Height = 169
    Hint = ''
    Margins.Top = 6
    Margins.Bottom = 6
    Caption = '  Inventory Item  '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object pnlArinvt: TUniPanel
      Left = 2
      Top = 27
      Width = 519
      Height = 142
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 141
        Top = 0
        Width = 6
        Height = 142
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel4: TUniPanel
        Left = 1
        Top = 1
        Width = 141
        Height = 140
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 12
          Top = 8
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Item #'
          TabOrder = 1
        end
        object lblItemDescrip: TUniLabel
          Left = 22
          Top = 32
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 2
        end
        object lblItemDescripExt: TUniLabel
          Left = 22
          Top = 56
          Width = 72
          Height = 13
          Hint = ''
          Caption = 'Ext Description'
          TabOrder = 3
        end
        object lblItemClass: TUniLabel
          Left = 22
          Top = 80
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Class'
          TabOrder = 4
        end
        object lblItemRev: TUniLabel
          Left = 22
          Top = 104
          Width = 19
          Height = 13
          Hint = ''
          Caption = 'Rev'
          TabOrder = 5
        end
      end
      object Panel5: TUniPanel
        Left = 147
        Top = 1
        Width = 372
        Height = 140
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          372
          140)
        object wwDBComboDlgArinvt: TUniEdit
          Left = 1
          Top = 5
          Width = 366
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ReadOnly = True
        end
        object edItemDescrip: TUniEdit
          Left = 1
          Top = 29
          Width = 366
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clBtnFace
          ReadOnly = True
        end
        object edItemExtDescrip: TUniEdit
          Left = 1
          Top = 53
          Width = 366
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clBtnFace
          ReadOnly = True
        end
        object edItemClass: TUniEdit
          Left = 1
          Top = 77
          Width = 127
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object edItemRev: TUniEdit
          Left = 1
          Top = 101
          Width = 127
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 4
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
    object Panel1: TUniPanel
      Left = 2
      Top = 15
      Width = 519
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnAlternateItems: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Use Alternate Items List'
        ShowHint = True
        ParentShowHint = False
        GroupIndex = 1
        AllowAllUp = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD0000000DDDDDDDDD0FF
          FFF0DDDDDDDDD0FFFFF0DDDDDDDDD0FFFFF0DDDDDDDDD0CCCCC00000000DD000
          00000FFFFF0DDDDD0DDD0FFFFF0DDDD000DD0FFFFF0DDDDD0DDD0CCCCC000000
          0DDD0000000DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
        Caption = ''
        ParentColor = False
        Color = clWindow
      end
    end
  end
  object GroupBox2: TUniGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 181
    Width = 523
    Height = 247
    Hint = ''
    Margins.Top = 0
    Margins.Bottom = 0
    Caption = '  Consumption Type  '
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    DesignSize = (
      523
      247)
    object chkUnknown: TUniCheckBox
      Left = 14
      Top = 20
      Width = 97
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Unknown or N/A'
      TabOrder = 0
      OnClick = ProcessCheckBoxClick
    end
    object chkPrimary: TUniCheckBox
      Left = 14
      Top = 44
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Primary Material'
      TabOrder = 1
      OnClick = ProcessCheckBoxClick
    end
    object chkProcess: TUniCheckBox
      Left = 14
      Top = 68
      Width = 111
      Height = 17
      Hint = ''
      Caption = 'Process/Operation'
      TabOrder = 2
      OnClick = ProcessCheckBoxClick
    end
    object wwDBGridProcess: TIQUniGridControl
      Left = 29
      Top = 98
      Width = 486
      Height = 138
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 269
      IQComponents.Grid.Height = 52
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcProcess
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
      IQComponents.Navigator.DataSource = SrcProcess
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 269
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 52
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcProcess
      Columns = <
        item
          FieldName = 'OPSEQ'
          Title.Caption = '#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPNO'
          Title.Caption = 'Process/Operation'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPDESC'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OP_CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object PkArinvt: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.class     as class,'
      '       a.rev       as rev,  '
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.unit      as unit, '
      '       c.custno    as custno,'
      '       c.company   as company,'
      '       a.id        as id,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide   as pk_hide,'
      '       a.standard_id as standard_id,'
      '       a.phantom   as phantom'
      ' from arinvt a, v_arcusto c'
      'where a.arcusto_id = c.id(+)'
      '  and misc.eplant_filter( a.eplant_id ) = 1'
      '  and nvl(a.non_material, '#39'N'#39') <> '#39'Y'#39
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 443
    Top = 134
    object StringField1: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField2: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtPHANTOM: TStringField
      DisplayLabel = 'Phantom'
      FieldName = 'PHANTOM'
      FixedChar = True
      Size = 1
    end
  end
  object SrcProcess: TDataSource
    DataSet = QryProcess
    Left = 72
    Top = 296
  end
  object QryProcess: TFDQuery
    BeforeOpen = QryProcessBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ptoper.id as ptoper_id,'
      '       ptoper.opseq,'
      '       sndop.id as sndop_id,'
      '       sndop.opno,'
      '       sndop.opdesc,'
      '       sndop.op_class'
      '  from partno,'
      '       ptoper,'
      '       sndop'
      ' where partno.arinvt_id = :arinvt_id'
      '   and partno.standard_id = :standard_id'
      '   and partno.id = ptoper.partno_id'
      '   and ptoper.sndop_id = sndop.id')
    Left = 72
    Top = 320
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryProcessOPSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 3
      FieldName = 'OPSEQ'
      Origin = 'IQ.PTOPER.OPSEQ'
      Size = 0
    end
    object QryProcessOPNO: TStringField
      DisplayLabel = 'Process/Operation'
      DisplayWidth = 19
      FieldName = 'OPNO'
      Origin = 'IQ.SNDOP.OPNO'
      Size = 15
    end
    object QryProcessOPDESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 45
      FieldName = 'OPDESC'
      Origin = 'IQ.SNDOP.OPDESC'
      Size = 60
    end
    object QryProcessOP_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 5
      FieldName = 'OP_CLASS'
      Origin = 'IQ.SNDOP.OP_CLASS'
      FixedChar = True
      Size = 2
    end
    object QryProcessPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Origin = 'IQ.PTOPER.ID'
      Visible = False
      Size = 0
    end
    object QryProcessSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'IQ.SNDOP.ID'
      Visible = False
      Size = 0
    end
  end
end
