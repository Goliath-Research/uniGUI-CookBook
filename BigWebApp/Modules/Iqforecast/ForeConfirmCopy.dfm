object FrmConfirmCopy: TFrmConfirmCopy
  Left = 247
  Top = 260
  ClientHeight = 454
  ClientWidth = 491
  Caption = 'Confirm'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Splitter1: TUniSplitter
    Left = 0
    Top = 82
    Width = 491
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 82
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Panel5: TUniPanel
      Left = 42
      Top = 1
      Width = 449
      Height = 80
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ParentColor = True
      object lblHeader: TUniLabel
        Left = 1
        Top = 1
        Width = 708
        Height = 18
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 
          'About to paste %s forecast data starting %s. Any existing foreca' +
          'st for %s will be overwritten.'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Height = -15
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 42
      Height = 80
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      ParentColor = True
      object Image1: TUniImage
        Left = 1
        Top = 1
        Width = 16
        Height = 16
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Center = True
        AutoSize = True
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFF808080808080808080808080808080808080808080808080
          808080808080808080808080808080FFFFFFFFFFFF0080800000000000000000
          0000000000000000000000000000000000000000000000000000000080808080
          808000808000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00000080808000808000FFFF00FFFF00FFFF00FF
          FF00FFFF80808000000080808000FFFF00FFFF00FFFF00FFFF00FFFF00000080
          808000808000FFFF00FFFF00FFFF00FFFF00FFFF80808000000080808000FFFF
          00FFFF00FFFF00FFFF00FFFF000000FFFFFFFFFFFF00808000FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF000000808080FF
          FFFFFFFFFF00808000FFFF00FFFF00FFFF00FFFF00FFFF00000000FFFF00FFFF
          00FFFF00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00808000FFFF00FF
          FF00FFFF00808000000000808000FFFF00FFFF00FFFF000000808080FFFFFFFF
          FFFFFFFFFFFFFFFF00808000FFFF00FFFF00FFFF00000000000000000000FFFF
          00FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808000FF
          FF00FFFF00000000000000000000FFFF00FFFF000000808080FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00808000FFFF00FFFF00000000000000000000FFFF
          00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0080
          8000FFFF00FFFF00000000FFFF00FFFF000000808080FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00808000FFFF00FFFF00FFFF00FFFF00FFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00808000FFFF00FFFF00FFFF000000808080FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00808000FFFF00FFFF00FFFF000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 402
    Width = 491
    Height = 52
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 489
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
    object pnlBottomBtns: TUniPanel
      Left = 236
      Top = 4
      Width = 255
      Height = 48
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 9
        Width = 120
        Height = 30
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 128
        Top = 9
        Width = 119
        Height = 30
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 87
    Width = 491
    Height = 315
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Bevel2: TUniPanel
      Left = 1
      Top = 71
      Width = 43
      Height = 211
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 4
      Caption = ''
    end
    object IQSearchShipTo: TIQUniGridControl
      Left = 43
      Top = 71
      Width = 448
      Height = 211
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -14
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 231
      IQComponents.Grid.Height = 125
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcShipTo
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
      IQComponents.Navigator.DataSource = SrcShipTo
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 231
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 125
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcShipTo
      Columns = <
        item
          FieldName = 'CUSTNO'
          Title.Caption = 'Cust #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ATTN'
          Title.Caption = 'Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address'
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
          Title.Caption = 'Zip'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Phone'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIME_CONTACT'
          Title.Caption = 'Contact'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 489
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Label3: TUniLabel
        Left = 1
        Top = 1
        Width = 108
        Height = 17
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '  Selection Criteria'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object Bevel3: TUniPanel
        Left = 1
        Top = 17
        Width = 487
        Height = 5
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Caption = ''
      end
      object rbtnShipOne: TUniRadioButton
        Left = 18
        Top = 49
        Width = 140
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Specific Ship To'
        TabOrder = 0
        OnClick = rbtnShipOneClick
      end
      object rbtnShipAny: TUniRadioButton
        Left = 18
        Top = 25
        Width = 140
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Checked = True
        Caption = 'Any Ship To'
        TabOrder = 1
        OnClick = rbtnShipOneClick
      end
    end
    object Panel7: TUniPanel
      Left = 1
      Top = 282
      Width = 489
      Height = 33
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object chkDelete: TUniCheckBox
        Left = 18
        Top = 11
        Width = 419
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Delete original/source forecast releases'
        TabOrder = 0
      end
    end
  end
  object SrcShipTo: TDataSource
    DataSet = QryShipTo
    Left = 89
    Top = 147
  end
  object QryShipTo: TFDQuery
    BeforeOpen = QryShipToBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '       a.custno,'
      '       v.ship_to_id,'
      '       s.attn,'
      '       s.addr1,'
      '       s.city,'
      '       s.state,'
      '       s.country,'
      '       s.zip,'
      '       s.phone_number,'
      '       s.prime_contact'
      '  from '
      '       v_forecast v, '
      '       arcusto a,'
      '       ship_to s'
      ' where'
      '       v.fore_head_id = :fore_head_id'
      '   and v.arinvt_id = :arinvt_id'
      '   and v.req_date >= :cut_off_date'
      '   and v.arcusto_id = a.id'
      '   and v.ship_to_id = s.id')
    Left = 89
    Top = 171
    ParamData = <
      item
        Name = 'fore_head_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'cut_off_date'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryShipToCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryShipToATTN: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 18
      FieldName = 'ATTN'
      Origin = 's.attn'
      Size = 60
    end
    object QryShipToADDR1: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 25
      FieldName = 'ADDR1'
      Origin = 's.ADDR1'
      Size = 60
    end
    object QryShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 's.city'
      FixedChar = True
      Size = 30
    end
    object QryShipToSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 5
      FieldName = 'STATE'
      Origin = 's.state'
      FixedChar = True
    end
    object QryShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 10
      FieldName = 'COUNTRY'
      Origin = 's.country'
      FixedChar = True
      Size = 30
    end
    object QryShipToZIP: TStringField
      DisplayLabel = 'Zip'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 's.zip'
      FixedChar = True
      Size = 10
    end
    object QryShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      DisplayWidth = 10
      FieldName = 'PHONE_NUMBER'
      Origin = 's.phone_number'
      Size = 25
    end
    object QryShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Contact'
      DisplayWidth = 25
      FieldName = 'PRIME_CONTACT'
      Origin = 's.prime_contact'
      FixedChar = True
      Size = 30
    end
    object QryShipToSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Origin = 'v.ship_to_id'
      Visible = False
      Size = 0
    end
  end
end
