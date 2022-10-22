object FrmCRMToolbar_Base: TFrmCRMToolbar_Base
  Left = 407
  Top = 388
  Caption = 'Toolbar'
  ClientHeight = 67
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TUniPopupMenu
    OnPopup = PMainPopup
    Left = 36
    Top = 8
    object AutoHide1: TUniMenuItem
      Caption = 'Auto Hide'
      OnClick = AutoHide1Click
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
