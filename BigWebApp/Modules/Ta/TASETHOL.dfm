object FrmTaSetHol: TFrmTaSetHol
  Left = 380
  Top = 229
  ClientHeight = 111
  ClientWidth = 359
  Caption = 'Set Holiday Start/End Dates'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 70
    Width = 359
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 142
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 359
    Height = 70
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 188
      Top = 0
      Width = 6
      Height = 70
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 188
      Height = 68
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 74
        Top = 0
        Width = 6
        Height = 68
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft1: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 74
        Height = 66
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 16
          Top = 20
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'Start Date'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 16
          Top = 44
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'End Date'
          TabOrder = 2
        end
      end
      object PnlClient1: TUniPanel
        Tag = 1999
        Left = 80
        Top = 1
        Width = 108
        Height = 66
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          108
          66)
        object dtStartdate: TUniDateTimePicker
          Left = 1
          Top = 16
          Width = 105
          Height = 21
          Hint = ''
          DateTime = 42660.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object dtEnddate: TUniDateTimePicker
          Left = 1
          Top = 40
          Width = 105
          Height = 21
          Hint = ''
          DateTime = 42660.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object PnlClient3: TUniPanel
      Tag = 1999
      Left = 194
      Top = 1
      Width = 165
      Height = 68
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 65
        Top = 0
        Width = 6
        Height = 68
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlLeft2: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 65
        Height = 66
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label3: TUniLabel
          Left = 8
          Top = 20
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Start Time'
          TabOrder = 1
        end
        object Label4: TUniLabel
          Left = 8
          Top = 44
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'End Time'
          TabOrder = 2
        end
      end
      object PnlClient2: TUniPanel
        Tag = 1999
        Left = 71
        Top = 1
        Width = 94
        Height = 66
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          94
          66)
        object dtStartTime: TUniDateTimePicker
          Left = 1
          Top = 16
          Width = 90
          Height = 21
          Hint = ''
          DateTime = 42660.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = dtStartTimeChange
        end
        object dtEndTime: TUniDateTimePicker
          Left = 1
          Top = 40
          Width = 90
          Height = 21
          Hint = ''
          DateTime = 42660.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
  end
end
