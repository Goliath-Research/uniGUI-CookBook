object FrmAddVendorAccess: TFrmAddVendorAccess
  Left = 0
  Top = 0
  ClientHeight = 304
  ClientWidth = 585
  Caption = 'Append to Vendor Access'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 264
    Width = 585
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 373
      Top = 1
      Width = 212
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 107
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 585
    Height = 264
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 368
    IQComponents.Grid.Height = 178
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 368
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 178
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Vendor Name'
        Width = 231
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address 1'
        Width = 203
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address 2'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Adress 3'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'City'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COUNTRY'
        Title.Caption = 'Country'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ZIP'
        Title.Caption = 'Zip/Postal Code'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PHONE_NUMBER'
        Title.Caption = 'Phone #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRIME_CONTACT'
        Title.Caption = 'Contact Name'
        Width = 147
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 147
    Top = 75
  end
  object wwQuery1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select vendorno,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id'
      '  from vendor'
      'where NVL(pk_hide, '#39'N'#39') <> '#39'Y'#39)
    Left = 155
    Top = 105
    object wwQuery1VENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'vendorno'
      FixedChar = True
      Size = 10
    end
    object wwQuery1COMPANY: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 33
      FieldName = 'COMPANY'
      Origin = 'company'
      Size = 60
    end
    object wwQuery1ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 29
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object wwQuery1ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object wwQuery1ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
    object wwQuery1CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'city'
      FixedChar = True
      Size = 30
    end
    object wwQuery1STATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 7
      FieldName = 'STATE'
      Origin = 'state'
    end
    object wwQuery1COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'country'
      FixedChar = True
      Size = 100
    end
    object wwQuery1ZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'zip'
      FixedChar = True
      Size = 10
    end
    object wwQuery1PHONE_NUMBER: TStringField
      DisplayLabel = 'Phone #'
      DisplayWidth = 16
      FieldName = 'PHONE_NUMBER'
      Origin = 'phone_number'
      Size = 25
    end
    object wwQuery1PRIME_CONTACT: TStringField
      DisplayLabel = 'Contact Name'
      DisplayWidth = 21
      FieldName = 'PRIME_CONTACT'
      Origin = 'prime_contact'
      FixedChar = True
      Size = 30
    end
    object wwQuery1ID: TFloatField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
    end
  end
end
