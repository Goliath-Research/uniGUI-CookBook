object FrmQC_PkBase: TFrmQC_PkBase
  Left = 189
  Top = 164
  ClientHeight = 203
  ClientWidth = 463
  Caption = 'Pick List'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  inline IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 463
    Height = 154
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
    ExplicitWidth = 463
    ExplicitHeight = 154
    inherited PageControl: TUniPageControl
      Width = 463
      Height = 125
    end
    inherited TopToolBar: TUniToolBar
      Width = 463
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 154
    Width = 463
    Height = 49
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 191
      Top = 1
      Width = 272
      Height = 47
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
        Left = 1
        Top = 8
        Width = 127
        Height = 33
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 135
        Top = 8
        Width = 127
        Height = 33
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 49
    Top = 123
  end
  object wwQuery1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 49
    Top = 136
  end
end
