object FrmCRMAddHoliday: TFrmCRMAddHoliday
  Left = 412
  Top = 350
  Caption = 'Add Holiday'
  ClientHeight = 132
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  object PnlButtons: TUniPanel
    Left = 0
    Top = 98
    Width = 325
    Height = 34
    Align = alBottom
    TabOrder = 0
    object PnlButtonsRight: TUniPanel
      Left = 120
      Top = 0
      Width = 205
      Height = 34
      Align = alRight
      TabOrder = 0
      object btnOk: TUniBitBtn
        Left = 0
        Top = 3
        Width = 97
        Height = 25
        Caption = '&OK'
        Default = True
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 3
        Width = 97
        Height = 25
        Cancel = True
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 98
    Align = alClient
    TabOrder = 1
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Height = 98
      ExplicitHeight = 102
    end
    object PnlLeft01: TUniPanel
      Left = 0
      Top = 0
      Width = 81
      Height = 98
      Align = alLeft
      TabOrder = 0
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 35
        Height = 13
        Caption = 'Holiday'
      end
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 50
        Height = 13
        Caption = 'Start Date'
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 44
        Height = 13
        Caption = 'End Date'
      end
    end
    object PnlClient01: TUniPanel
      Left = 84
      Top = 0
      Width = 241
      Height = 98
      Align = alClient
      TabOrder = 1
      DesignSize = (
        241
        98)
      object edtHoliday: TUniEdit
        Left = 0
        Top = 8
        Width = 241
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object cmbStart: TUniDateTimePicker
        Left = 0
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object cmbEnd: TUniDateTimePicker
        Left = 0
        Top = 56
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
  end
end
