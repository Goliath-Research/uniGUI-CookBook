object FrmCRMReferencesList: TFrmCRMReferencesList
  Left = 334
  Top = 282
  BorderStyle = bsDialog
  Caption = 'References'
  ClientHeight = 221
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 221
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlTop: TUniPanel
      Left = 1
      Top = 1
      Width = 358
      Height = 61
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object lblMessage: TUniLabel
        Left = 1
        Top = 1
        Width = 708
        Height = 13
        Hint = ''
        Caption = 
          'This activity is referenced by other modules.  Deleting this act' +
          'ivity will permanently break those links.  Are you sure you want' +
          ' to delete this activity?'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object PnlMiddle: TUniPanel
      Left = 1
      Top = 61
      Width = 358
      Height = 119
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object lstReferences: TUniListBox
        Left = 1
        Top = 1
        Width = 356
        Height = 117
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object PnlBottom: TUniPanel
      Left = 1
      Top = 180
      Width = 358
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object PnlOK: TUniPanel
        Left = 152
        Top = 1
        Width = 103
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniBitBtn
          Left = 1
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          ModalResult = 1
          TabOrder = 0
        end
      end
      object PnlCancel: TUniPanel
        Left = 255
        Top = 1
        Width = 103
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object btnCancel: TUniBitBtn
          Left = 1
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          Cancel = True
          ModalResult = 2
          TabOrder = 0
        end
      end
    end
  end
end
