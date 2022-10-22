object FrmIQSearchPickList: TFrmIQSearchPickList
  Left = 127
  Top = 230
  ClientHeight = 319
  ClientWidth = 723
  Caption = 'Select from Picklist'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 278
    Width = 723
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 504
      Top = 1
      Width = 219
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
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
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 278
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    inline IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 721
      Height = 276
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 721
      ExplicitHeight = 276
      inherited PageControl: TUniPageControl
        Width = 721
        Height = 247
        ExplicitWidth = 721
        ExplicitHeight = 247
      end
      inherited TopToolBar: TUniToolBar
        Width = 721
        ExplicitWidth = 721
      end
    end
  end
  object SrcPickList: TDataSource
    DataSet = QryData
    Left = 79
    Top = 100
  end
  object QryData: TFDQuery
    BeforeOpen = QryDataBeforeOpen
    AfterOpen = QryDataAfterOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 141
    Top = 100
  end
end
