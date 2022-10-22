object FrmCRMSelectSalesConfigTemplate: TFrmCRMSelectSalesConfigTemplate
  Left = 240
  Top = 170
  ClientHeight = 256
  ClientWidth = 465
  Caption = 'Select Sales Configuration Template'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 200
    Width = 465
    Height = 56
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 97
      Top = 0
      Width = 6
      Height = 56
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlDatesLeft: TUniPanel
      Left = 1
      Top = 1
      Width = 97
      Height = 54
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 7
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Request Date'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 31
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Promised Date'
        TabOrder = 2
      end
    end
    object PnlDatesClient: TUniPanel
      Left = 103
      Top = 1
      Width = 154
      Height = 54
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object dtRequested: TUniDateTimePicker
        Left = 1
        Top = 3
        Width = 129
        Height = 21
        Hint = ''
        DateTime = 42666.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
        OnChange = dtRequestedChange
      end
      object dtPromised: TUniDateTimePicker
        Left = 1
        Top = 27
        Width = 129
        Height = 21
        Hint = ''
        DateTime = 42666.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
        OnChange = dtPromisedChange
      end
    end
    object Panel1: TUniPanel
      Left = 257
      Top = 1
      Width = 208
      Height = 54
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 24
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = DoOKBtnClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 24
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
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 200
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 463
      Height = 198
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 246
      IQComponents.Grid.Height = 112
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
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
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 246
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 112
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Template Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_ITEMNO'
          Title.Caption = 'Inventory Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_DESCRIP'
          Title.Caption = 'Inventory Item Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_DESCRIP2'
          Title.Caption = 'Inventory Item Extended Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_CLASS'
          Title.Caption = 'Inventory Item Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_REV'
          Title.Caption = 'Inventory Item Revision'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE'
          Title.Caption = 'Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 352
    Top = 40
  end
  object QryData: TFDQuery
    BeforeOpen = QryDataBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT c.id AS id, c.descrip AS descrip, a.itemno AS arinvt_item' +
        'no,'
      
        '       a.descrip AS arinvt_descrip, a.descrip2 AS arinvt_descrip' +
        '2,'
      
        '       a.class AS arinvt_class, a.rev AS arinvt_rev, c.price AS ' +
        'price,'
      '       c.eplant_id, d.name AS eplant_name'
      '  FROM sales_config c, arinvt a, eplant d'
      ' WHERE a.id(+) = c.arinvt_id AND'
      '       (NVL(c.pk_hide, '#39'N'#39') = :pk_hide) AND'
      
        '       iqms.misc.eplant_filter_include_nulls(c.eplant_id) = 1 AN' +
        'D'
      '       d.id(+) = c.eplant_id')
    Left = 360
    Top = 48
    ParamData = <
      item
        Name = 'pk_hide'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryDataDESCRIP: TStringField
      DisplayLabel = 'Template Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'c.descrip'
      Size = 60
    end
    object QryDataARINVT_ITEMNO: TStringField
      DisplayLabel = 'Inventory Item #'
      DisplayWidth = 25
      FieldName = 'ARINVT_ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryDataARINVT_DESCRIP: TStringField
      DisplayLabel = 'Inventory Item Description'
      DisplayWidth = 25
      FieldName = 'ARINVT_DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryDataARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Inventory Item Extended Description'
      DisplayWidth = 25
      FieldName = 'ARINVT_DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryDataARINVT_CLASS: TStringField
      DisplayLabel = 'Inventory Item Class'
      DisplayWidth = 2
      FieldName = 'ARINVT_CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryDataARINVT_REV: TStringField
      DisplayLabel = 'Inventory Item Revision'
      DisplayWidth = 15
      FieldName = 'ARINVT_REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryDataPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'PRICE'
      Origin = 'c.price'
      Size = 6
    end
    object QryDataEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Origin = 'd.name'
      Size = 30
    end
    object QryDataEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'c.eplant_id'
      Size = 0
    end
    object QryDataID: TBCDField
      FieldName = 'ID'
      Origin = 'c.id'
      Visible = False
      Size = 0
    end
  end
end
