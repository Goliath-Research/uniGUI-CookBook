object FrmCRMPickEmployee: TFrmCRMPickEmployee
  Left = 334
  Top = 293
  ClientHeight = 343
  ClientWidth = 673
  Caption = 'Select Employee'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGrid: TUniPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 307
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 671
      Height = 305
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 454
      IQComponents.Grid.Height = 219
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
      IQComponents.HiddenPanel.Left = 454
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 219
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
          FieldName = 'EMPNO'
          Title.Caption = 'Employee #'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FIRST_NAME'
          Title.Caption = 'First Name'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NICKNAME'
          Title.Caption = 'Nickname'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MIDDLE_NAME'
          Title.Caption = 'Middle Name'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LAST_NAME'
          Title.Caption = 'Last Name'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CITY'
          Title.Caption = 'City'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATE'
          Title.Caption = 'State or Region'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Postal Code'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COUNTRY'
          Title.Caption = 'Country'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMAIL'
          Title.Caption = 'Email'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USER_NAME'
          Title.Caption = 'Login Name'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 307
    Width = 673
    Height = 36
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 460
      Top = 1
      Width = 212
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 4
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 108
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 224
    Top = 64
  end
  object QryData: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT pr_emp_id AS id, empno AS empno, first_name AS first_name' +
        ','
      '       nickname AS nickname, middle_name AS middle_name,'
      
        '       last_name AS last_name, display_name AS display_name, add' +
        'r1 AS addr1,'
      
        '       city AS city, state AS state, country AS country, zip AS ' +
        'zip,'
      
        '       email AS email, user_name AS user_name, eplant_id AS epla' +
        'nt_id,'
      '       eplant_name AS eplant_name'
      '  FROM v_empuser'
      ' WHERE NVL(used_crm, '#39'N'#39') = '#39'Y'#39)
    Left = 272
    Top = 48
    object QryDataEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 12
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      Size = 25
    end
    object QryDataFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 12
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object QryDataNICKNAME: TStringField
      DisplayLabel = 'Nickname'
      DisplayWidth = 12
      FieldName = 'NICKNAME'
      Origin = 'NICKNAME'
      Size = 30
    end
    object QryDataMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 10
      FieldName = 'MIDDLE_NAME'
      Origin = 'MIDDLE_NAME'
      Size = 30
    end
    object QryDataLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 12
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object QryDataADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 12
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object QryDataCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 30
    end
    object QryDataSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object QryDataZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object QryDataCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 100
    end
    object QryDataEMAIL: TStringField
      DisplayLabel = 'Email'
      DisplayWidth = 12
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 250
    end
    object QryDataUSER_NAME: TStringField
      DisplayLabel = 'Login Name'
      DisplayWidth = 12
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 35
    end
    object QryDataEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Size = 30
    end
    object QryDataID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataDISPLAY_NAME: TStringField
      FieldName = 'DISPLAY_NAME'
      Origin = 'DISPLAY_NAME'
      Visible = False
      Size = 255
    end
    object QryDataEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
