object FrmIQFGLotno: TFrmIQFGLotno
  Left = 236
  Top = 182
  ClientHeight = 132
  ClientWidth = 308
  Caption = 'Select FG Lot Number'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 308
    Height = 91
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 306
      Height = 89
      Hint = ''
      Caption = ' Lot Number Source '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DesignSize = (
        306
        89)
      object rbtnCurrent: TUniRadioButton
        Left = 10
        Top = 17
        Width = 283
        Height = 17
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        Checked = True
        Caption = 'Current Lot Number'
        TabOrder = 0
        OnClick = DoRadioButtonClick
      end
      object rbtnPast: TUniRadioButton
        Left = 10
        Top = 39
        Width = 255
        Height = 17
        Hint = ''
        Caption = 'Past Lot Numbers (choose from list)'
        TabOrder = 1
        OnClick = DoRadioButtonClick
      end
      object cmbLotno: TUniDBLookupComboBox
        Left = 29
        Top = 57
        Width = 237
        Height = 21
        Hint = ''
        ListField = 'LOTNO'
        ListSource = SrcFinished
        KeyField = 'LOTNO'
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 91
    Width = 308
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      308
      41)
    object btnOk: TUniBitBtn
      Left = 155
      Top = 8
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&OK'
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TUniBitBtn
      Left = 235
      Top = 8
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object SrcFinished: TDataSource
    DataSet = QryFinished
    Left = 168
    Top = 28
  end
  object QryFinished: TFDQuery
    BeforeOpen = QryFinishedBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct lotno'
      'from translog'
      'where arinvt_id = :arinvt_id'
      ''
      ' ')
    Left = 200
    Top = 28
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFinishedLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'IQ.TRANSLOG.LOTNO'
      FixedChar = True
      Size = 25
    end
  end
end
