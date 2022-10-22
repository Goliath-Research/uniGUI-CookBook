object FrmShipMainUPSVersion: TFrmShipMainUPSVersion
  Left = 450
  Top = 199
  ClientHeight = 310
  ClientWidth = 522
  Caption = 'UPS Version Information'
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 269
    Width = 522
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 312
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 522
    Height = 33
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 8
      Width = 345
      Height = 13
      Hint = ''
      Caption = 
        'The following version information is used when communicating wit' +
        'h UPS.'
      TabOrder = 1
    end
  end
  object PnlList: TUniPanel
    Tag = 1999
    Left = 0
    Top = 33
    Width = 522
    Height = 195
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object lvList: TUniListView
      Left = 1
      Top = 1
      Width = 520
      Height = 193
      Hint = ''
      RowCount = 1
      ColCount = 4
      Options = [goVertLine, goHorzLine, goRowSelect]
      Columns = <
        item
          Title.Caption = 'Code'
          Caption = 'Code'
          AutoSize = False
          Width = 0
        end
        item
          Title.Caption = 'Name'
          Caption = 'Name'
          AutoSize = False
          Width = 200
        end
        item
          Title.Caption = 'Value'
          Caption = 'Value'
          AutoSize = False
          Width = 200
        end
        item
          Title.Caption = 'Send Update'
          Caption = 'Send Update'
          AutoSize = False
          Width = 100
        end>
      Items = <>
      isRowSelect = True
      OnDrawCell = lvListDrawCell
      OnChange = lvListChange
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 228
    Width = 522
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel3: TUniPanel
      Tag = 1999
      Left = 412
      Top = 1
      Width = 109
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnModify: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Modify'
        TabOrder = 1
        OnClick = btnModifyClick
      end
    end
    object PnlClient01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 411
      Height = 39
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 82
        Top = 1
        Width = 6
        Height = 37
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft01: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 81
        Height = 37
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object lblValue: TUniLabel
          Left = 8
          Top = 12
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'Value'
          TabOrder = 1
        end
      end
      object PnlClient02: TUniPanel
        Tag = 1999
        Left = 88
        Top = 1
        Width = 322
        Height = 37
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          322
          37)
        object edtValue: TUniEdit
          Left = 1
          Top = 8
          Width = 315
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
    end
  end
  object QryList: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT'
      ' a.id as id,'
      ' a.displayname as displayname,'
      ' a.code as code,'
      ' a.value as value,'
      ' a.send_update as send_update,'
      ' a.receive_update as receive_update'
      'FROM ups_version a'
      'ORDER BY a.displayname')
    Left = 304
    Top = 121
    object QryListID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryListDISPLAYNAME: TStringField
      FieldName = 'DISPLAYNAME'
      Size = 60
    end
    object QryListCODE: TStringField
      FieldName = 'CODE'
      Size = 60
    end
    object QryListVALUE: TStringField
      FieldName = 'VALUE'
      Size = 250
    end
    object QryListSEND_UPDATE: TStringField
      FieldName = 'SEND_UPDATE'
      Size = 1
    end
    object QryListRECEIVE_UPDATE: TStringField
      FieldName = 'RECEIVE_UPDATE'
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 232
    Top = 121
    object File1: TUniMenuItem
      Caption = '&File'
      object UpdateLocalComputerFields1: TUniMenuItem
        Caption = 'Update Local Computer Fields'
        OnClick = UpdateLocalComputerFields1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
  end
end
