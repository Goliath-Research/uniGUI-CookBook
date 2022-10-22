object Q_CalcGauge: TQ_CalcGauge
  Left = 362
  Top = 285
  Cursor = crArrow
  ClientHeight = 90
  ClientWidth = 426
  Caption = 'Calculation Progress'
  OnShow = FormShow
  BorderStyle = bsToolWindow
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  BorderIcons = []
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 33
    Width = 426
    Height = 57
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 52
    ExplicitHeight = 38
    object btnCancel: TUniBitBtn
      Left = 164
      Top = 16
      Width = 97
      Height = 26
      Hint = ''
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
  end
  object PnlDisplay: TUniPanel
    Left = 0
    Top = 0
    Width = 426
    Height = 33
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 424
      Height = 31
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      Color = clWhite
      ExplicitHeight = 32
      object Label1: TUniLabel
        Left = 1
        Top = 1
        Width = 117
        Height = 13
        Hint = ''
        Alignment = taCenter
        Caption = 'Calculating Quantity:'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object CalcQty: TUniLabel
        Left = 123
        Top = 1
        Width = 6
        Height = 13
        Hint = ''
        Alignment = taCenter
        Caption = '0'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        TabOrder = 2
      end
      object Bevel1: TUniPanel
        Left = 117
        Top = 1
        Width = 6
        Height = 29
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
        ExplicitHeight = 48
      end
    end
  end
end
