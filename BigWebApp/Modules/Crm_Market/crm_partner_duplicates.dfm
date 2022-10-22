object FrmCRMPartnerMatches: TFrmCRMPartnerMatches
  Left = 390
  Top = 267
  ClientHeight = 244
  ClientWidth = 407
  Caption = 'Matches'
  OldCreateOrder = False
  OnClose = FormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 74
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 1
      Top = 1
      Width = 511
      Height = 13
      Hint = ''
      Caption = 
        'Partner records were found that appear to match the Customer you' +
        ' want to add to the Partner database.'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object Label2: TUniLabel
      Left = 1
      Top = 16
      Width = 504
      Height = 13
      Hint = ''
      Caption = 
        'Do you want to add the selected Customer as a new Partner anyway' +
        '?  Click Cancel to abort the process.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 13
      Width = 405
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
  end
  object PnlGrid: TUniPanel
    Left = 0
    Top = 74
    Width = 407
    Height = 131
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'There are no duplicates to display.'
    Color = clWindow
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 405
      Height = 129
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 188
      IQComponents.Grid.Height = 43
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDuplicates
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
      IQComponents.Navigator.DataSource = SrcDuplicates
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 188
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 43
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDuplicates
      Columns = <
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
          Title.Caption = 'State or Region'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Postal Code'
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
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Telephone'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 205
    Width = 407
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Left = 193
      Top = 1
      Width = 214
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 110
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object SrcDuplicates: TDataSource
    DataSet = QryDuplicates
    Left = 280
    Top = 74
  end
  object QryDuplicates: TFDQuery
    BeforeOpen = QryDuplicatesBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '    partner.id,'
      '    partner.company,'
      '    partner.addr1,'
      '    partner.addr2,'
      '    partner.addr3,'
      '    partner.city,'
      '    partner.state,'
      '    partner.zip,'
      '    partner.country,'
      '    partner.phone_number'
      'from'
      '    partner,'
      '    arcusto'
      'where'
      '    arcusto.id = :arcusto_id and'
      
        '    Upper( LTrim( RTrim( partner.company ))) like Upper( LTrim( ' +
        'RTrim( arcusto.company )))'
      'order by partner.company')
    Left = 288
    Top = 80
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDuplicatesCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Origin = 'PARTNER.COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryDuplicatesADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 14
      FieldName = 'ADDR1'
      Origin = 'PARTNER.ADDR1'
      FixedChar = True
      Size = 60
    end
    object QryDuplicatesADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 13
      FieldName = 'ADDR2'
      Origin = 'PARTNER.ADDR2'
      FixedChar = True
      Size = 60
    end
    object QryDuplicatesADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 13
      FieldName = 'ADDR3'
      Origin = 'PARTNER.ADDR3'
      FixedChar = True
      Size = 60
    end
    object QryDuplicatesCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'PARTNER.CITY'
      FixedChar = True
      Size = 30
    end
    object QryDuplicatesSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 12
      FieldName = 'STATE'
      Origin = 'PARTNER.STATE'
      FixedChar = True
    end
    object QryDuplicatesZIP: TStringField
      DisplayLabel = 'Postal Code'
      DisplayWidth = 12
      FieldName = 'ZIP'
      Origin = 'PARTNER.ZIP'
      FixedChar = True
      Size = 10
    end
    object QryDuplicatesCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 16
      FieldName = 'COUNTRY'
      Origin = 'PARTNER.COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryDuplicatesPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      DisplayWidth = 14
      FieldName = 'PHONE_NUMBER'
      Origin = 'PARTNER.PHONE_NUMBER'
      Size = 25
    end
    object QryDuplicatesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PARTNER.ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'Self')
    SecurityItems.Strings = (
      'btnOk')
    SecurityCode = 'FRMCRMPARTNERMATCHES'
    Left = 320
    Top = 74
  end
end
