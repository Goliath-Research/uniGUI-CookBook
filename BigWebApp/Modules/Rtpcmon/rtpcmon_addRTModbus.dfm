object FrmAddRTModbusDevice: TFrmAddRTModbusDevice
  Left = 684
  Top = 313
  ClientHeight = 382
  ClientWidth = 567
  Caption = 'Add RealTime Modbus Devices'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    567
    382)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 16
    Top = 216
    Width = 52
    Height = 13
    Hint = ''
    Caption = 'IP Address'
    TabOrder = 0
  end
  object Label2: TUniLabel
    Left = 16
    Top = 240
    Width = 20
    Height = 13
    Hint = ''
    Caption = 'Port'
    TabOrder = 8
  end
  object Label3: TUniLabel
    Left = 16
    Top = 192
    Width = 88
    Height = 13
    Hint = ''
    Caption = 'Device Description'
    TabOrder = 9
  end
  object Label4: TUniLabel
    Left = 16
    Top = 168
    Width = 62
    Height = 13
    Hint = ''
    Caption = 'Device Name'
    TabOrder = 10
  end
  object Label5: TUniLabel
    Left = 16
    Top = 264
    Width = 119
    Height = 13
    Hint = ''
    Caption = 'Start Position Part Count'
    TabOrder = 11
  end
  object Label6: TUniLabel
    Left = 16
    Top = 288
    Width = 96
    Height = 13
    Hint = ''
    Caption = 'Start Position Timer '
    TabOrder = 12
  end
  object Label7: TUniLabel
    Left = 16
    Top = 312
    Width = 74
    Height = 13
    Hint = ''
    Caption = 'Capability Type'
    TabOrder = 13
  end
  object lblPartCountEndPosition: TUniLabel
    Left = 275
    Top = 264
    Width = 114
    Height = 13
    Hint = ''
    Caption = 'lblPartCountEndPosition'
    TabOrder = 14
  end
  object lblDelayTimerEndPosition: TUniLabel
    Left = 275
    Top = 288
    Width = 114
    Height = 13
    Hint = ''
    Caption = 'lblPartCountEndPosition'
    TabOrder = 15
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 153
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 16
    Caption = 'RealTime Modbus Devices'
    ParentColor = True
    Text = 'text set at runtime'
    PictureLayout = plImageRight
    LayoutStyle = lsWindowsXP
    DesignSize = (
      567
      153)
  end
  object edIPAddress: TUniEdit
    Left = 147
    Top = 212
    Width = 217
    Height = 21
    Hint = ' '
    Text = ''
    TabOrder = 3
  end
  object edPort: TUniEdit
    Left = 147
    Top = 236
    Width = 121
    Height = 21
    Hint = 'The default port for IQMS RealTime PLCs is listed.'
    Text = '502'
    TabOrder = 4
    OnKeyPress = NumericOnlyKeyPress
  end
  object btnAdd: TUniButton
    Left = 392
    Top = 346
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Add'
    Anchors = [akRight, akBottom]
    TabOrder = 17
    OnClick = btnAddClick
    ExplicitTop = 327
  end
  object btnCancel: TUniButton
    Left = 480
    Top = 346
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 18
    OnClick = btnCancelClick
    ExplicitTop = 327
  end
  object edDeviceDescription: TUniEdit
    Left = 147
    Top = 188
    Width = 217
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object edDeviceName: TUniEdit
    Left = 147
    Top = 164
    Width = 217
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edPositionPartCount: TUniEdit
    Left = 147
    Top = 260
    Width = 121
    Height = 21
    Hint = 'The default position for IQMS RealTime PLCs is listed.'
    Text = '100'
    TabOrder = 5
    OnChange = edPositionPartCountChange
    OnKeyPress = NumericOnlyKeyPress
  end
  object edPositionTimer: TUniEdit
    Left = 147
    Top = 284
    Width = 121
    Height = 21
    Hint = 'The default position for IQMS RealTime PLCs is listed.'
    Text = '400'
    TabOrder = 6
    OnChange = edPositionTimerChange
    OnKeyPress = NumericOnlyKeyPress
  end
  object dbCmbCapabType: TUniEdit
    Left = 147
    Top = 308
    Width = 217
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 7
  end
end
