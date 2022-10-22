object UniPackagingAssistant: TUniPackagingAssistant
  Left = 0
  Top = 0
  Width = 583
  Height = 358
  OnCreate = UniFrameCreate
  Layout = 'fit'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniURLFrame1: TUniURLFrame
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 577
    Height = 352
    Hint = ''
    URL = 
      'http://test-2015-2.iqms.com:8080/EnterpriseIQ/PackagingAssistant' +
      '/Manage'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
end
