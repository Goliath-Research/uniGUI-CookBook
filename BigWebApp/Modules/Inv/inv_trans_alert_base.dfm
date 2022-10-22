object FrmInvTransAlertBase: TFrmInvTransAlertBase
  Left = 0
  Top = 0
  ClientHeight = 523
  ClientWidth = 936
  Caption = 'Transaction Alert'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 936
    Height = 523
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pgctrlMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 934
      Height = 521
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Pending Transactions'
      end
    end
  end
end
