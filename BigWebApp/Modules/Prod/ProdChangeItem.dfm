object FrmProdChangeItem: TFrmProdChangeItem
  Left = 310
  Top = 162
  ClientHeight = 196
  ClientWidth = 449
  Caption = 'Change Item To ...'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object DI: TwwDataInspector
    Left = 0
    Top = 0
    Width = 449
    Height = 146
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    DisableThemes = False
    Align = alClient
    Color = clWindow
    Ctl3D = True
    CaptionColor = clWindow
    ParentCtl3D = False
    TabOrder = 0
    DataSource = SrcArinvt
    Items = <
      item
        DataSource = SrcArinvt
        DataField = 'CLASS'
        Caption = 'Class'
        CustomControl = wwDBLookupComboClass
        TagString = 'Class'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'ITEMNO'
        Caption = 'Item #'
        TagString = 'Item'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'REV'
        Caption = 'Rev'
        CustomControl = IQUDComboBoxRev
        TagString = 'Rev'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'DESCRIP'
        Caption = 'Description'
        TagString = 'Descrip'
        WordWrap = False
      end>
    CaptionWidth = 100
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    object IQUDComboBoxRev: TIQWebUDComboBox
      Left = 135
      Top = 44
      Width = 343
      Height = 19
      Hint = 'Right click to edit the list'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = False
      ShowHint = True
      ParentShowHint = False
      DataField = 'REV'
      DataSource = SrcArinvt
      TabStop = False
      TabOrder = 0
      KeyTableName = 'ARINVT'
      KeyFieldName = 'REV'
    end
    object wwDBLookupComboClass: TUniDBLookupComboBox
      Left = 127
      Top = 4
      Width = 343
      Height = 23
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Visible = False
      ListFieldIndex = 0
      DataField = 'CLASS'
      DataSource = SrcArinvt
      TabStop = False
      TabOrder = 1
      Color = clWindow
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 146
    Width = 449
    Height = 50
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      449
      50)
    object btnOK: TUniButton
      Left = 250
      Top = 10
      Width = 92
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'OK'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnOKClick
    end
    object Cancel: TUniButton
      Left = 357
      Top = 10
      Width = 92
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 110
    Top = 74
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    CachedUpdates = True
    OnUpdateRecord = QryArinvtUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno, rev, class, descrip'
      '  from arinvt '
      ' where id = :arinvt_id')
    Left = 71
    Top = 74
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
  end
  object QryClass: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select class, descrip '
      '  from arinvt_class'
      ' where type is NULL'
      'order by class')
    Left = 163
    Top = 75
    object QryClassCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT_CLASS.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT_CLASS.DESCRIP'
      Size = 50
    end
  end
  object procCloneArinvt: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.IQCLONE.EXEC_ARINVT'
    Left = 208
    Top = 76
    ParamData = <
      item
        Name = 'Result'
        DataType = ftFMTBcd
        ParamType = ptResult
      end
      item
        Name = 'V_OLD_ARINVT'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_CLASS'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_ITEMNO'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_REV'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_EPLANT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object procMatSum: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.PROD_REP.PROD_MATSUM'
    Left = 240
    Top = 77
    ParamData = <
      item
        Name = 'V_DAYPROD_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
end
