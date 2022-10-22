object FrmIQWebSecAddItem: TFrmIQWebSecAddItem
  Left = 521
  Top = 291
  ClientHeight = 364
  ClientWidth = 322
  Caption = 'Add Security Items'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 323
    Width = 322
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 143
      Top = 1
      Width = 179
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 94
        Top = 9
        Width = 75
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
    Width = 322
    Height = 323
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object ListView1: TUniDBGrid
      Left = 1
      Top = 1
      Width = 320
      Height = 321
      Hint = ''
      DataSource = ds
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgMultiSelect, dgTitleClick]
      WebOptions.Paged = False
      WebOptions.KeyNavigation = knDisabled
      WebOptions.FetchAll = True
      WebOptions.RetainCursorOnSort = True
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnColumnSort = ListView1ColumnSort
      Columns = <
        item
          FieldName = 'ItemName'
          Title.Caption = 'Item Name'
          Width = 171
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ClassName'
          Title.Caption = 'Class Name'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 62
    Top = 61
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQWebAbout1: TIQWebAbout
    ModuleName = 'TFrmIQWEBSecAddItem'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 129
    Top = 61
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 203
    Top = 61
    object Blink1: TUniMenuItem
      Caption = 'Blink'
      OnClick = Blink1Click
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    PacketRecords = 0
    Params = <>
    Left = 168
    Top = 136
    object cdsItemName: TStringField
      DisplayLabel = 'Item Name'
      FieldName = 'ItemName'
    end
    object cdsClassName: TStringField
      DisplayLabel = 'Class Name'
      FieldName = 'ClassName'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 216
    Top = 136
  end
end
