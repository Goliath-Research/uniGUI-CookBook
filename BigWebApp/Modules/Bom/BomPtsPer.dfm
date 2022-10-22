object FrmPtsPer: TFrmPtsPer
  Left = 106
  Top = 149
  ClientHeight = 193
  ClientWidth = 364
  Caption = 'Items/Material Usage'
  OnShow = UniFormShow
  Constraints.MinHeight = 135
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  ActiveControl = wwDataInspector1
  DesignSize = (
    364
    193)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniButton
    Left = 153
    Top = 160
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    Anchors = [akRight, akBottom]
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 259
    Top = 160
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 153
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 364
      Height = 153
      DisableThemes = False
      Align = alClient
      TabOrder = 0
      Items = <
        item
          Caption = 'Item Per'
          Expanded = True
          TagString = 'Item Per'
          WordWrap = False
        end
        item
          Caption = 'Allocation Required'
          TagString = 'Allocation Required'
          WordWrap = False
        end
        item
          Caption = 'General'
          ReadOnly = True
          Items = <
            item
              Caption = 'Scrap %'
              TagString = 'Scrap %'
              WordWrap = False
            end
            item
              Caption = 'Exclude From Calculation'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Exclude From Calc'
              WordWrap = False
            end
            item
              Caption = 'Disposition By Cycles'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Dispo By Cycles'
              WordWrap = False
            end
            item
              Caption = 'Exclude Backflush'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Exclude Backflush'
              WordWrap = False
            end>
          TagString = 'General'
          WordWrap = False
        end
        item
          Caption = 'Packaging'
          ReadOnly = True
          Items = <
            item
              Caption = 'Gross Weight'
              TagString = 'Gross Weight'
              WordWrap = False
            end
            item
              Caption = 'Tare Weight'
              TagString = 'Tare Weight'
              WordWrap = False
            end
            item
              Caption = 'Ret. Container'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Ret. Container'
              WordWrap = False
            end
            item
              Caption = 'Verify ASN Quantity'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Verify ASN Qty'
              WordWrap = False
            end>
          TagString = 'Packaging'
          WordWrap = False
        end
        item
          Caption = 'Startup Qty'
          Items = <
            item
              Caption = 'Include in Std Cost'
              PickList.Items.Strings = (
                'Y'
                'N')
              PickList.DisplayAsCheckbox = True
              TagString = 'Include Startup in Std Cost'
              WordWrap = False
            end>
          TagString = 'Startup Qty'
          WordWrap = False
        end>
      CaptionWidth = 149
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
end
