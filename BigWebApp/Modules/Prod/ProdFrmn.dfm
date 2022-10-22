object FrmForman: TFrmForman
  Left = 331
  Top = 209
  HelpContext = 1063709
  ClientHeight = 171
  ClientWidth = 400
  Caption = 'Assign Foreman'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 120
    Width = 400
    Height = 51
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 398
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 129
      Top = 4
      Width = 271
      Height = 47
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 57
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 162
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 29
    Width = 400
    Height = 91
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 36
    ExplicitHeight = 112
    object Splitter1: TUniSplitter
      Left = 60
      Top = 0
      Width = 6
      Height = 91
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 60
      Height = 89
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 10
        Top = 17
        Width = 42
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Foreman'
        TabOrder = 1
      end
    end
    object Panel5: TUniPanel
      Left = 66
      Top = 1
      Width = 334
      Height = 89
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
        334
        89)
      object wwDBLookupComboForeMan: TUniDBLookupComboBox
        Left = 3
        Top = 17
        Width = 325
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ListOnlyMode = lmFollowSource
        ListField = 'NAME;MFG_TYPE;SHIFT'
        ListSource = SrcForman
        KeyField = 'NAME'
        ListFieldIndex = 0
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clWindow
      end
      object cbAll: TUniCheckBox
        Left = 1
        Top = 46
        Width = 332
        Height = 20
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Show all foremen'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnClick = cbAllClick
      end
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 29
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnEditForeman: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'View/Edit Foremen ...'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD000DDDD
        DDDDDDDDD777FFFFDDDDDDDD08880000DDDDDDDD78887777FFDDDDDD0FFF8888
        00DDDDDD7FDD888877FDDDDD0FFFFFFF880DDDDD7FDDDDDD887FDDDD0FFFFFFF
        FF0DDDDD7FDDDDDDDD7FDDDD0FF0FFFFFF0DDDDD7FD7DDDDDD7FDDDD0F007777
        8F0DDDDD7F7777778D7FDDDD00B0FFFFFF0DDDDD77F7DDDDDD7FDDDD0B077777
        8F0DDDDD7F7777778D7FDDD0B0FFFFFFFF0DDDD7F7DDDDDDDD7FDD0B0FF77778
        FF0DDD7F7FD77778DD7FD0B00FFFFFFFFF0DD7F77FDDDDDDDD7F0B0D0FFFFFFF
        FF0D7F7D7FFFFFFFFF7F90DD00000000000DD7DD77777777777DDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnEditForemanClick
    end
    object Bevel2: TUniPanel
      Left = 1
      Top = 25
      Width = 398
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
    end
  end
  object QryForman: TFDQuery
    BeforeOpen = QryFormanBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select name,'
      '       mfg_type,'
      '       shift'
      '  from foreman'
      ' where (:mfg_type is null'
      '        or'
      '        rtrim(mfg_type) = :mfg_type )'
      '        '
      '   and (:shift = 0'
      '        or'
      '        :shift > 0 and shift = :shift )'
      ''
      'order by name        '
      '         ')
    Left = 40
    Top = 104
    ParamData = <
      item
        Name = 'mfg_type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'shift'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFormanNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 30
      FieldName = 'NAME'
      Origin = 'IQ.FOREMAN.NAME'
      FixedChar = True
      Size = 30
    end
    object QryFormanMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.FOREMAN.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryFormanSHIFT: TBCDField
      DisplayLabel = 'Shift'
      DisplayWidth = 10
      FieldName = 'SHIFT'
      Origin = 'IQ.FOREMAN.SHIFT'
      Size = 0
    end
  end
  object SrcForman: TDataSource
    DataSet = QryForman
    Left = 192
    Top = 88
  end
end
