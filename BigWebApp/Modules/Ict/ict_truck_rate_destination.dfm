object FrmICT_NewTruckRateDestination: TFrmICT_NewTruckRateDestination
  Left = 0
  Top = 0
  ClientHeight = 219
  ClientWidth = 410
  Caption = 'New Truck Rate Destination'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 178
    Width = 410
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 185
      Top = 1
      Width = 224
      Height = 39
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
        Left = 115
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
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 410
    Height = 178
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 102
      Top = 1
      Width = 4
      Height = 176
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = 15921906
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 101
      Height = 176
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 12
        Top = 12
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Source'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 31
        Top = 36
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Origin'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 31
        Top = 60
        Width = 27
        Height = 13
        Hint = ''
        Caption = 'Name'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 12
        Top = 84
        Width = 65
        Height = 13
        Hint = ''
        Caption = 'Destination'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 4
      end
      object Label5: TUniLabel
        Left = 31
        Top = 108
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'Origin'
        TabOrder = 5
      end
      object Label6: TUniLabel
        Left = 31
        Top = 132
        Width = 27
        Height = 13
        Hint = ''
        Caption = 'Name'
        TabOrder = 6
      end
    end
    object Panel5: TUniPanel
      Left = 106
      Top = 1
      Width = 303
      Height = 176
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        303
        176)
      object edSoourceOrigin: TUniEdit
        Left = 1
        Top = 33
        Width = 292
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
        ReadOnly = True
      end
      object edSoourceName: TUniEdit
        Left = 1
        Top = 57
        Width = 292
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
        ReadOnly = True
      end
      object wwDBComboBoxTarget: TUniDBComboBox
        Left = 1
        Top = 105
        Width = 292
        Height = 21
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        Style = csDropDownList
        Items.Strings = (
          'EPLANT'
          'DIVISION')
        TabOrder = 2
      end
      object wwDBComboDlgTargetName: TUniEdit
        Left = 1
        Top = 129
        Width = 292
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ReadOnly = True
      end
    end
  end
  object PKEplant: TIQWebHpick
    BeforeOpen = PKEplantBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      'where id <> :id  '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 14
    Top = 183
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PKEplantID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
    object PKEplantNAME: TStringField
      DisplayLabel = 'Descrip'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object PkDivision: TIQWebHpick
    BeforeOpen = PkDivisionBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name, '
      '       d.descrip,'
      '       d.eplant_id'
      '  from division d'
      'where id <> :id  ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 43
    Top = 183
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
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
