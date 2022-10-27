object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 977
  ClientWidth = 600
  Caption = 'Point of Sale (demo)'
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  DesignOrientation = True
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object UnimContainerPanel1: TUnimContainerPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 977
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    AlignmentControl = uniAlignmentClient
    object btnEditUsers: TUnimBitBtn
      Left = 0
      Top = 0
      Width = 600
      Height = 169
      Action = UniMainModule.actEditUsers
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      UI = 'action'
      IconAlign = iaTop
      Images = UniMainModule.UniNativeImageList1
      ImageIndex = 0
    end
    object btnEditOrders: TUnimBitBtn
      Left = 0
      Top = 169
      Width = 600
      Height = 176
      Action = UniMainModule.actEditOrders
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      UI = 'action'
      IconAlign = iaTop
      Images = UniMainModule.UniNativeImageList1
      ImageIndex = 1
    end
    object btnReportSales: TUnimBitBtn
      Left = 0
      Top = 345
      Width = 600
      Height = 176
      Action = UniMainModule.actReportSales
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      UI = 'action'
      IconAlign = iaTop
      Images = UniMainModule.UniNativeImageList1
      ImageIndex = 4
    end
  end
end
