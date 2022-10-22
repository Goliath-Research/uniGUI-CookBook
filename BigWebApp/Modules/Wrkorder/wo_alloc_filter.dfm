object FrmWOHardAllocFilter: TFrmWOHardAllocFilter
  Left = 0
  Top = 0
  ClientHeight = 168
  ClientWidth = 368
  Caption = 'Assign Filter'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 125
    Width = 368
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 142
      Top = 1
      Width = 226
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 116
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 368
    Height = 125
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object rbtnNone: TUniRadioButton
      Left = 14
      Top = 12
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'None'
      TabOrder = 0
    end
    object rbtnDivision: TUniRadioButton
      Left = 14
      Top = 40
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Division'
      TabOrder = 1
    end
    object rbtnWorkZone: TUniRadioButton
      Left = 14
      Top = 94
      Width = 125
      Height = 17
      Hint = ''
      Caption = 'Work Zone Locations'
      TabOrder = 2
    end
    object wwDBComboDlgDivision: TUniEdit
      Left = 31
      Top = 65
      Width = 324
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      ReadOnly = True
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMWOHARDALLOCFILTER'
    Left = 316
    Top = 8
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name, '
      '       d.descrip,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 284
    Top = 8
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
end
