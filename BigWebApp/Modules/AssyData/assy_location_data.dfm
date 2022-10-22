object FrmAssyLocationData: TFrmAssyLocationData
  Left = 265
  Top = 206
  ClientHeight = 267
  ClientWidth = 476
  Caption = 'Create new non-conform location'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Style = [fsBold]
  PixelsPerInch = 96
  TextHeight = 16
  object Panel13: TUniPanel
    Left = 0
    Top = 181
    Width = 476
    Height = 86
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel14: TUniPanel
      Left = 189
      Top = 1
      Width = 286
      Height = 84
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 146
        Top = 12
        Width = 129
        Height = 60
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666668666666666666666666666666666666
          0000666608866666666666666686666666666666000066691086666688666666
          6888666666666666000066691088666008866666688866666886666600006669
          1108869110866666688886668888666600006666911089111066666666888868
          8888666600006666911191110666666666888888888666660000666669111110
          6666666666688888886666660000666666911108866666666666888886666666
          0000666666911110866666666666888888666666000066666911011088666666
          6668888888666666000066666910691108866666666888688886666600006666
          9106669110886666668886668888666600006666910666691108666666888666
          6888866600006666696666669106666666686666668886660000666666666666
          6966666666666666666866660000666666666666666666666666666666666666
          0000}
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 0
      end
      object btnFinish: TUniBitBtn
        Tag = 1
        Left = 2
        Top = 12
        Width = 129
        Height = 60
        Hint = ''
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666660666
          6666660000006666666006666666660000006666667007666666660000006666
          67F0076666666600000066660FF0FF6666666600000066600F00F77666666600
          000066700000700666667000000067FF0F0080006667F000000067F00F78F70F
          767B0600000067000700F0FFF7F06600000066007000000F7B06660000006608
          800F0007F066660000006678F0FFF07B0666660000006667700FF7F066666600
          0000666600007B0666666600000066666007F0666666660000006666667B0666
          666666000000666666706666666666000000}
        Caption = 'Finish'
        TabOrder = 1
        OnClick = btnFinishClick
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 181
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 13
      Top = 27
      Width = 55
      Height = 16
      Hint = ''
      Caption = 'Location'
      TabOrder = 4
    end
    object Label2: TUniLabel
      Left = 13
      Top = 76
      Width = 34
      Height = 16
      Hint = ''
      Caption = 'Lot #'
      TabOrder = 5
    end
    object Label3: TUniLabel
      Left = 13
      Top = 126
      Width = 48
      Height = 16
      Hint = ''
      Caption = 'Reason'
      TabOrder = 6
    end
    object wwDBComboDlgLocation: TUniEdit
      Left = 102
      Top = 15
      Width = 370
      Height = 40
      Hint = ''
      Text = ''
      TabOrder = 0
    end
    object wwDBComboDlgFGLotNo: TUniEdit
      Left = 102
      Top = 64
      Width = 370
      Height = 40
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object wwDBComboDlgNonConf: TUniEdit
      Left = 102
      Top = 114
      Width = 370
      Height = 40
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
  object PkLocations: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.start_row as path,'
      '       l.descrip as description,'
      '       '#39'['#39' || e.ID || '#39']  '#39' || e.name as eplant_name,'
      '       d.name as division'
      '  from locations l,'
      '       eplant e,'
      '       division d'
      ' where l.eplant_id = e.id(+)'
      '   and l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and l.non_conform = '#39'Y'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 8
    Top = 204
    object PkLocationsID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationsLOCATION: TStringField
      FieldName = 'Location'
      FixedChar = True
      Size = 30
    end
    object PkLocationsDESCRIPTION: TStringField
      DisplayLabel = 'Location Description'
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocationsEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant Name'
      FieldName = 'EPLANT_NAME'
      Size = 74
    end
    object PkLocationsDIVISION: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION'
      Size = 25
    end
  end
  object PkNonConform: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, code, descrip from non_conform')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 204
    object PkNonConformID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.NON_CONFORM.ID'
      Visible = False
      Size = 0
    end
    object PkNonConformCODE: TStringField
      DisplayLabel = 'Non-Conform Code'
      FieldName = 'CODE'
      Origin = 'IQ.NON_CONFORM.CODE'
      Size = 10
    end
    object PkNonConformDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.NON_CONFORM.DESCRIP'
      Size = 30
    end
  end
end
