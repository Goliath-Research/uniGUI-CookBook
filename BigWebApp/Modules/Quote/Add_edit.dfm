object AddEdit: TAddEdit
  Left = 241
  Top = 251
  HelpContext = 1165505
  ClientHeight = 242
  ClientWidth = 450
  Caption = 'Modify Quote Inventory Item'
  OnShow = UniFormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 242
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 132
      Top = 0
      Width = 6
      Height = 242
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 132
      Height = 240
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 4
        Top = 7
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Class'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 4
        Top = 31
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 4
        Top = 55
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'Rev'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 4
        Top = 79
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 4
      end
      object lblDescrip2: TUniLabel
        Left = 4
        Top = 103
        Width = 102
        Height = 13
        Hint = ''
        Caption = 'Extended Description'
        TabOrder = 5
      end
      object Label5: TUniLabel
        Left = 4
        Top = 127
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'Unit'
        TabOrder = 6
      end
      object lblSPG: TUniLabel
        Left = 4
        Top = 189
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'SPG'
        TabOrder = 7
      end
      object lblGauge: TUniLabel
        Left = 4
        Top = 213
        Width = 31
        Height = 13
        Hint = ''
        Caption = 'Gauge'
        TabOrder = 8
      end
    end
    object PnlClient: TUniPanel
      Left = 138
      Top = 1
      Width = 209
      Height = 240
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        209
        240)
      object LookupClass: TUniDBLookupComboBox
        Left = 1
        Top = 3
        Width = 60
        Height = 21
        Hint = ''
        ListField = 'CLASS'
        ListSource = SrcArinvt_Class
        KeyField = 'CLASS'
        ListFieldIndex = 0
        DataField = 'CLASS'
        DataSource = DataSource1
        TabOrder = 0
        Color = clWindow
      end
      object EditITEMNO: TUniDBEdit
        Left = 1
        Top = 27
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'ITEMNO'
        DataSource = DataSource1
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object EditREV: TUniDBEdit
        Left = 1
        Top = 51
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'REV'
        DataSource = DataSource1
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object EditDESCRIP: TUniDBEdit
        Left = 1
        Top = 75
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'DESCRIP'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object dbeDescrip2: TUniDBEdit
        Left = 1
        Top = 99
        Width = 199
        Height = 21
        Hint = ''
        DataField = 'DESCRIP2'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object dbcUNIT: TUniDBComboBox
        Left = 1
        Top = 123
        Width = 88
        Height = 21
        Hint = ''
        DataField = 'UNIT'
        DataSource = DataSource1
        Items.Strings = (
          'EACH'
          'LBS'
          'KG'
          'GALL'
          'ROLL'
          'FT'
          'IN')
        TabOrder = 5
      end
      object dbeSPG: TUniDBEdit
        Left = 1
        Top = 186
        Width = 88
        Height = 21
        Hint = ''
        DataSource = DataSource1
        TabOrder = 8
      end
      object chkRFQRequired: TUniCheckBox
        Left = 1
        Top = 147
        Width = 201
        Height = 17
        Hint = ''
        Caption = 'RFQ Required'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object dbeGauge: TUniDBEdit
        Left = 1
        Top = 210
        Width = 88
        Height = 21
        Hint = ''
        DataSource = DataSource1
        TabOrder = 9
      end
      object dbchkPkHide: TUniDBCheckBox
        Left = 1
        Top = 165
        Width = 97
        Height = 17
        Hint = ''
        DataField = 'PK_HIDE'
        DataSource = DataSource1
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Inactive'
        TabOrder = 7
      end
    end
    object PnlButtons: TUniPanel
      Left = 347
      Top = 1
      Width = 103
      Height = 240
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object BitBtnOK: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
          FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
          800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303030303030303030303030303030303030313030303030303030303
          030303030303030404030303030303030303030303030303030C0C1303030303
          030303030303030303030402020403030303030303030303030303030C03030C
          130303030303030303030303030402020202040303030303030303030303030C
          030303030C130303030303030303030304020202020202040303030303030303
          03030C0303030303030C130303030303030303040202020E0202020204030303
          03030303030C1303030C130303030C13030303030303030202020E030E020202
          0403030303030303030C13030C030C1303030C13030303030303030E020E0303
          030E02020204030303030303030C130C0303030C1303030C1303030303030303
          0E03030303030E02020204030303030303030C03030303030C1303030C130303
          03030303030303030303030E02020204030303030303030303030303030C1303
          030C13030303030303030303030303030E020202040303030303030303030303
          03030C1303030C13030303030303030303030303030E02020204030303030303
          030303030303030C1303030C13030303030303030303030303030E0202020403
          0303030303030303030303030C1303030C13030303030303030303030303030E
          02020403030303030303030303030303030C13030C1303030303030303030303
          030303030E02020303030303030303030303030303030C130C03030303030303
          0303030303030303030E03030303030303030303030303030303030C03030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Caption = 'OK'
        TabOrder = 0
        OnClick = BitBtnOKClick
      end
      object BitBtn3: TUniBitBtn
        Left = 1
        Top = 40
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        Caption = 'Cancel'
        TabOrder = 1
      end
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 279
    Top = 89
  end
  object QryArinvt_Class: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(class) as class,'
      '       descrip'
      '  from arinvt_class'
      ' order by class'
      '')
    Left = 313
    Top = 89
    object QryArinvt_ClassCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Size = 2
    end
    object QryArinvt_ClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object SrcArinvt_Class: TDataSource
    DataSet = QryArinvt_Class
    Left = 313
    Top = 112
  end
  object TblQinvt: TFDTable
    Tag = 1
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    Left = 283
    Top = 143
  end
end
