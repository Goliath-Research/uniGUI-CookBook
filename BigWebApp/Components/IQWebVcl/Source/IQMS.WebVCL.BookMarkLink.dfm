object FrmLinkDisplay: TFrmLinkDisplay
  Left = 0
  Top = 0
  ClientHeight = 91
  ClientWidth = 374
  Caption = 'Copy Link'
  BorderStyle = bsDialog
  Constraints.MaxHeight = 120
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 120
  Constraints.MinWidth = 380
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object URLCaption: TUniLabel
    Left = 7
    Top = 13
    Width = 19
    Height = 13
    Hint = ''
    Caption = 'URL'
    ParentColor = False
    Color = clBtnFace
    TabOrder = 0
  end
  object BtnCopy: TUniButton
    Left = 281
    Top = 40
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Copy'
    TabOrder = 2
  end
  object URLDisplay: TUniEdit
    Left = 35
    Top = 9
    Width = 321
    Height = 21
    Hint = ''
    Text = 'URLDisplay'
    TabOrder = 1
    ReadOnly = True
  end
end
