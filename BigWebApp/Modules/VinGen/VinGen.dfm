object UniVinGen: TUniVinGen
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  OnCreate = UniFrameCreate
  Layout = 'fit'
  TabOrder = 0
  object UniURLFrame1: TUniURLFrame
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
    ExplicitLeft = 72
    ExplicitTop = 56
  end
end
