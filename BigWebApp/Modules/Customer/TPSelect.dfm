object FrmTPSelect: TFrmTPSelect
  Left = 55
  Top = 189
  ClientHeight = 422
  ClientWidth = 528
  Caption = 'Select Trading Partner'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 528
    Height = 386
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 311
    IQComponents.Grid.Height = 300
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTP
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.OnDblClick = BtnSelectClick
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcTP
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 311
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 300
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitLeft = 247
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitWidth = 456
    DataSource = SrcTP
    Columns = <
      item
        FieldName = 'TP_INTERCHANGE_CODE'
        Title.Caption = 'Trading Partner ISA ID Code'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OUR_INTERCHANGE_CODE'
        Title.Caption = 'Your ISA ID'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitWidth = 464
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 386
    Width = 528
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 464
    object Panel2: TUniPanel
      Left = 295
      Top = 1
      Width = 232
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 231
      object BtnCancel: TUniBitBtn
        Left = 147
        Top = 4
        Width = 75
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
        TabOrder = 0
        OnClick = BtnCancelClick
      end
      object BtnSelect: TUniBitBtn
        Left = 64
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFBFC7C1A4BDAA89B39389B393A4BDAABFC7C1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB9C5BC6DA97C469A5C4B9B6054
          9F6957A16C529F674A9C5F6DA97CB9C5BCFF00FFFF00FFFF00FFFF00FFFF00FF
          ABC0B04F9E64489D5E55A46965AD7872B38374B48572B38369AE7B56A46A519F
          64ACC0B1FF00FFFF00FFFF00FFBBC6BE4D9E6241A45655B36857AB6B58A56B52
          A66664B5756DBD7D6DBD7D68BB7955AE69519F64BBC6BEFF00FFFF00FF6DA97C
          39A84F46BB5955B16867AD79F0F7F1BDDBC5489C5E63C27366C77667C67662C5
          724BB05E6FAA7EFF00FFB7C5BB3FA15632C1484EB66258A56BEBF4EEFFFFFFFF
          FFFFA5CEAF52B06665D07665D07665D0764FCA6343A159B9C5BC95B89E3AAF54
          3BC35553A268E2F0E6FFFFFFFFFFFFFFFFFFFFFFFF91C49E53B56966DA7B5DD8
          734CD4653FB15895B89E87B3933EBB5C43B25EBBDAC3FFFFFFFFFFFFA7CFB1D5
          E8DAFFFFFFFFFFFF86BE9450B96A58E1794EDF7042BD6087B39387B39350C470
          57D87B5CA76FE9F3ECB2D5BB52BC6F4FA064DCECE0FFFFFFFBFDFB7DB98C50BF
          6F5CEA854EC36F87B39397B9A05CC17880F4A364C9814D9F625BBE7771E39364
          CF8353A268E5F1E8FFFFFFF6FAF7489C5E77F19B53BD7197B9A0BDC6C0479B5D
          91F6B097F7B494F3B098F7B598F7B598F7B572CD8C58A56BE0EEE482BB906CC5
          8591F6AF459A5BBFC7C1FF00FF74AC8279CC90ABF9C2ABF9C2ACF9C1ACF8C3AD
          F9C3ADF9C380D19755AA6B7ED094A9F9C07ACD9175AC83FF00FFFF00FFBFC7C1
          529F6591D8A5BDFBCFBDFACEBDFBCEBDFBCEBCFBCEBBFACDB9FACBB9F9CC90D7
          A354A167BFC7C1FF00FFFF00FFFF00FFB3C3B759A16B85C897CAF9D8CFFBDCCE
          FBDCCEFBDBCDFBDBCEFBDB8FCFA0529F65B1C2B5FF00FFFF00FFFF00FFFF00FF
          FF00FFC7CAC881B08D51A2667CBE8E8FCA9F8FCB9F7EBF9054A46979AD86BFC7
          C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C8C29CBAA48D
          B5978DB5979CBAA4C1C8C2FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = 'Select'
        TabOrder = 1
        OnClick = BtnSelectClick
      end
    end
    object CheckBox1: TUniCheckBox
      Left = 9
      Top = 7
      Width = 176
      Height = 17
      Hint = ''
      Caption = 'Current Customer records only'
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object SrcTP: TDataSource
    DataSet = QryTP
    Left = 80
    Top = 184
  end
  object QryTP: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.id,'
      '       e.arcusto_id,'
      '       e.tp_interchange_code,'
      '       e.our_interchange_code,'
      '       a.custno,'
      '       a.company'
      '  from edi_partners e,'
      '       arcusto a'
      ' where e.arcusto_id = a.id '
      '   and ( (a.id = :aId) or (:ADummy = 1) )'
      ''
      '')
    Left = 136
    Top = 184
    ParamData = <
      item
        Name = 'aId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryTPTP_INTERCHANGE_CODE: TStringField
      DisplayLabel = 'Trading Partner ISA ID Code '
      DisplayWidth = 15
      FieldName = 'TP_INTERCHANGE_CODE'
      Origin = 'e.TP_INTERCHANGE_CODE'
      Size = 15
    end
    object QryTPOUR_INTERCHANGE_CODE: TStringField
      DisplayLabel = 'Your ISA ID'
      DisplayWidth = 15
      FieldName = 'OUR_INTERCHANGE_CODE'
      Origin = 'e.OUR_INTERCHANGE_CODE'
      FixedChar = True
      Size = 15
    end
    object QryTPCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryTPCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'a.COMPANY'
      Size = 60
    end
    object QryTPID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'e.ID'
      Visible = False
      Size = 0
    end
    object QryTPARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'e.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
  end
end
