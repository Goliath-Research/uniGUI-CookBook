object FrameMain: TFrameMain
  Left = 0
  Top = 0
  Width = 492
  Height = 406
  OnCreate = UniFrameCreate
  Layout = 'border'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  Color = clWhite
  Font.Height = -13
  TabOrder = 0
  ParentColor = False
  ParentFont = False
  ParentBackground = False
  ParentRTL = False
  object UniLabel2: TUniLabel
    Left = 0
    Top = 374
    Width = 492
    Height = 32
    Hint = ''
    Alignment = taCenter
    TextConversion = txtHTML
    AutoSize = False
    Caption = 'UniLabel2'
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentFont = False
    Font.Color = 6974058
    Font.Height = -13
    TabOrder = 0
    LayoutConfig.Region = 'south'
  end
  object UniImage1: TUniImage
    Left = 0
    Top = 0
    Width = 492
    Height = 374
    Hint = ''
    Center = True
    Proportional = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Transparent = True
    LayoutConfig.Region = 'center'
  end
end
