object FrmCostParentMassCustFilter: TFrmCostParentMassCustFilter
  Left = 498
  Top = 331
  ClientHeight = 279
  ClientWidth = 499
  Caption = 'Customer Filter'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 239
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 497
      Height = 237
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 280
      IQComponents.Grid.Height = 151
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
      IQComponents.HiddenPanel.Left = 280
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 151
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
          FieldName = 'CUSTNO'
          Title.Caption = 'Cust #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Address 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR3'
          Title.Caption = 'Address 3'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CITY'
          Title.Caption = 'City'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATE'
          Title.Caption = 'State'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COUNTRY'
          Title.Caption = 'Country'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Zip/Postal Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Phone #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIME_CONTACT'
          Title.Caption = 'Contact Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 239
    Width = 499
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 238
      Top = 1
      Width = 260
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 175
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
      object btnIncludeAll: TUniButton
        Left = 1
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Include All'
        TabOrder = 3
        OnClick = btnIncludeAllClick
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 72
    Top = 72
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       a.arcusto_id,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       arcusto.addr1,'
      '       arcusto.addr2,'
      '       arcusto.addr3,'
      '       arcusto.city,'
      '       arcusto.state,'
      '       arcusto.country,'
      '       arcusto.zip,'
      '       arcusto.phone_number,'
      '       arcusto.prime_contact,'
      '       arcusto.eplant_id'
      '  from'
      '       arinvt_work w,'
      '       v_aka_arcusto a,'
      '       arcusto'
      ' where'
      '       w.batch = :batch'
      '   and w.arinvt_id = a.arinvt_id'
      '   and a.arcusto_id = arcusto.id'
      '')
    Left = 72
    Top = 88
    ParamData = <
      item
        Name = 'batch'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1CUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object wwQuery1COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 22
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQuery1ADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 25
      FieldName = 'ADDR1'
      Origin = 'ARCUSTO.ADDR1'
      Size = 60
    end
    object wwQuery1ADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 25
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object wwQuery1ADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 25
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object wwQuery1CITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 10
      FieldName = 'CITY'
      Origin = 'ARCUSTO.CITY'
      FixedChar = True
      Size = 30
    end
    object wwQuery1STATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 10
      FieldName = 'STATE'
      Origin = 'ARCUSTO.STATE'
    end
    object wwQuery1COUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 'ARCUSTO.COUNTRY'
      FixedChar = True
      Size = 30
    end
    object wwQuery1ZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'ARCUSTO.ZIP'
      FixedChar = True
      Size = 10
    end
    object wwQuery1PHONE_NUMBER: TStringField
      DisplayLabel = 'Phone #'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 'ARCUSTO.PHONE_NUMBER'
      Size = 25
    end
    object wwQuery1PRIME_CONTACT: TStringField
      DisplayLabel = 'Contact Name'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Origin = 'ARCUSTO.PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object wwQuery1ARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
