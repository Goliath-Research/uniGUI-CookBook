object FrmLaborAllocation: TFrmLaborAllocation
  Left = 347
  Top = 147
  HelpContext = 1064090
  ClientHeight = 461
  ClientWidth = 699
  Caption = 'Labor Allocation'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  ActiveControl = IQSearch1
  Font.Height = -14
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter1: TUniSplitter
    Left = 0
    Top = 145
    Width = 699
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
    ExplicitTop = 76
    ExplicitWidth = 483
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 342
    Width = 699
    Height = 71
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitTop = 265
    ExplicitWidth = 448
    object Splitter4: TUniSplitter
      Left = 255
      Top = 0
      Width = 4
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlOpLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 255
      Height = 69
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 119
        Top = 0
        Width = 4
        Height = 69
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlOpLeft02: TUniPanel
        Left = 1
        Top = 1
        Width = 119
        Height = 67
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label2: TUniLabel
          Left = 10
          Top = 10
          Width = 101
          Height = 17
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Manufacturing #'
          TabOrder = 1
        end
        object Label5: TUniLabel
          Left = 10
          Top = 39
          Width = 100
          Height = 17
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Production Date'
          TabOrder = 2
        end
      end
      object PnlOpClient02: TUniPanel
        Left = 123
        Top = 1
        Width = 132
        Height = 67
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          132
          67)
        object DateTimePicker1: TUniDateTimePicker
          Left = 1
          Top = 34
          Width = 130
          Height = 24
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          DateTime = 42663.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
    end
    object PnlOpClient01: TUniPanel
      Left = 259
      Top = 1
      Width = 440
      Height = 69
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 224
      object Splitter3: TUniSplitter
        Left = 117
        Top = 0
        Width = 4
        Height = 69
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlOpLeft03: TUniPanel
        Left = 1
        Top = 1
        Width = 117
        Height = 67
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label3: TUniLabel
          Left = 10
          Top = 10
          Width = 77
          Height = 17
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Actual Hours'
          TabOrder = 1
        end
        object Label4: TUniLabel
          Left = 10
          Top = 39
          Width = 94
          Height = 17
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Actual Quantity'
          TabOrder = 2
        end
      end
      object PnlOpClient03: TUniPanel
        Left = 121
        Top = 1
        Width = 319
        Height = 67
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitWidth = 103
        DesignSize = (
          319
          67)
        object edHrs: TUniEdit
          Left = 1
          Top = 5
          Width = 317
          Height = 24
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          ExplicitWidth = 101
        end
        object edQty: TUniEdit
          Left = 1
          Top = 34
          Width = 317
          Height = 24
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '0'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitWidth = 101
        end
      end
    end
    object wwcombMfg: TUniDBLookupComboBox
      Left = 128
      Top = 4
      Width = 125
      Height = 25
      Hint = ''
      ListField = 'MFGNO'
      ListSource = wwSrcMfg
      KeyField = 'STANDARD_ID'
      ListFieldIndex = 0
      ClearButton = True
      TabOrder = 4
      Color = clWindow
      RemoteQuery = True
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 699
    Height = 145
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Height = -14
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 482
    IQComponents.Grid.Height = 59
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwSrcItems
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
    IQComponents.Navigator.DataSource = wwSrcItems
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 482
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 59
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 266
    IQComponents.HiddenPanel.ExplicitHeight = 434
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 475
    IQComponents.FormTab.ExplicitHeight = 19
    DataSource = wwSrcItems
    Columns = <
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 119
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitWidth = 483
    ExplicitHeight = 76
    Marker = 0
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 149
    Width = 699
    Height = 193
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    ExplicitTop = 80
    ExplicitWidth = 483
    object PageControl1: TUniPageControl
      Left = 1
      Top = 25
      Width = 697
      Height = 168
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      TabStop = False
      ExplicitWidth = 481
      object TabSheet1: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Standard'
        ExplicitWidth = 473
        object DBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 689
          Height = 136
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TitleFont.Height = -14
          DataSource = SrcSndOp
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'SEQ'
              Title.Caption = '#'
              Width = 24
              Font.Height = -14
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPNO'
              Title.Caption = 'Operation #'
              Width = 110
              Font.Height = -14
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 201
              Font.Height = -14
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ImageIndex = 1
        Caption = 'All'
        ExplicitWidth = 473
        object IQSearch2: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 689
          Height = 136
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Height = -14
          TabStop = True
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 472
          IQComponents.Grid.Height = 50
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = wwSrcSndOp
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
          IQComponents.Navigator.DataSource = wwSrcSndOp
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 472
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 50
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.HiddenPanel.ExplicitLeft = 256
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          IQComponents.FormTab.ExplicitWidth = 465
          DataSource = wwSrcSndOp
          Columns = <
            item
              FieldName = 'OPNO'
              Title.Caption = 'Operation #'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 252
              CheckBoxField.FieldValues = 'true;false'
            end>
          ExplicitWidth = 473
          Marker = 0
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 697
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -15
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      ExplicitWidth = 481
      object Label6: TUniLabel
        Left = 1
        Top = 1
        Width = 83
        Height = 18
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Operations'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -15
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 413
    Width = 699
    Height = 48
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 344
    ExplicitWidth = 483
    object pnlBottomBtns: TUniPanel
      Left = 428
      Top = 1
      Width = 271
      Height = 46
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 212
      object btnOK: TUniButton
        Left = 4
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 139
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwSrcItems: TDataSource
    DataSet = wwQryItems
    OnDataChange = wwSrcItemsDataChange
    Left = 56
    Top = 80
  end
  object wwQryItems: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id as arinvt_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.standard_id,'
      '       s.mfgno'
      '  from arinvt a,'
      '       standard s'
      ' where s.id = a.standard_id'
      ' ')
    Left = 56
    Top = 104
    object wwQryItemsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 13
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      Size = 50
    end
    object wwQryItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object wwQryItemsMFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 17
      FieldName = 'MFGNO'
      Origin = 'S.MFGNO'
      Size = 50
    end
    object wwQryItemsREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 9
      FieldName = 'REV'
      Origin = 'A.REV'
      Size = 15
    end
    object wwQryItemsCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      Visible = False
      Size = 2
    end
    object wwQryItemsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'A.ID'
      Visible = False
      Size = 0
    end
    object wwQryItemsSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'A.STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSndOp: TDataSource
    DataSet = QrySndOp
    Left = 104
    Top = 80
  end
  object QrySndOp: TFDQuery
    MasterSource = wwSrcItems
    MasterFields = 'STANDARD_ID;ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ptoper.opseq as seq,'
      '       sndop.opno,'
      '       sndop.opdesc as descrip,'
      '       ptoper.sndop_id'
      '  from sndop,'
      '       partno,'
      '       ptoper'
      ' where partno.standard_id = :standard_id'
      '   and partno.arinvt_id = :arinvt_id'
      '   and ptoper.partno_id = partno.id'
      '   and ptoper.sndop_id = sndop.id'
      '   and sndop.op_class = '#39'OP'#39
      ' '
      ' ')
    Left = 104
    Top = 96
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySndOpSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'PTOPER.OPSEQ'
      Size = 0
    end
    object QrySndOpOPNO: TStringField
      FieldName = 'OPNO'
      Origin = 'SNDOP.OPNO'
      Size = 15
    end
    object QrySndOpSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'PTOPER.SNDOP_ID'
      Visible = False
      Size = 0
    end
    object QrySndOpDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'SNDOP.OPDESC'
      Size = 60
    end
  end
  object wwSrcMfg: TDataSource
    DataSet = wwQryMfg
    Left = 160
    Top = 80
  end
  object wwQryMfg: TFDQuery
    MasterSource = wwSrcItems
    MasterFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id as standard_id'
      '  from standard s,'
      '       partno p'
      ' where p.arinvt_id = :arinvt_id'
      '   and p.standard_id = s.id'
      ' ')
    Left = 160
    Top = 112
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object wwQryMfgMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'STANDARD.MFGNO'
      Size = 50
    end
    object wwQryMfgSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'STANDARD.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcSndOp: TDataSource
    DataSet = wwQrySndOpAll
    Left = 216
    Top = 80
  end
  object wwQrySndOpAll: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sndop.opno,'
      '       sndop.opdesc as descrip,'
      '       sndop.id as sndop_id'
      '  from sndop'
      ' where sndop.op_class = '#39'OP'#39
      ' ')
    Left = 216
    Top = 96
    object wwQrySndOpAllOPNO: TStringField
      DisplayLabel = 'Operation #'
      DisplayWidth = 18
      FieldName = 'OPNO'
      Origin = 'SNDOP.OPNO'
      Size = 15
    end
    object wwQrySndOpAllDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 36
      FieldName = 'DESCRIP'
      Origin = 'SNDOP.OPDESC'
      Size = 60
    end
    object wwQrySndOpAllSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Origin = 'SNDOP.ID'
      Visible = False
      Size = 0
    end
  end
  object procAppend_Free_Form: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.COST_OPER.APPEND_FREE_FORM'
    Left = 264
    Top = 88
    ParamData = <
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_STANDARD_ID_IN'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_SNDOP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_ACT_QTY'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ACT_HRS'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_PR_EMP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_DAY_PART_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
end
