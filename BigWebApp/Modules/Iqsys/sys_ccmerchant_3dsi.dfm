inherited FrmIQSysMerchant3DSI: TFrmIQSysMerchant3DSI
  Left = 362
  Top = 208
  ClientHeight = 208
  ClientWidth = 336
  Caption = '3DSI Merchant Account'
  OldCreateOrder = True
  ExplicitWidth = 352
  ExplicitHeight = 267
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 173
    Width = 336
    ExplicitTop = 173
    ExplicitWidth = 336
    inherited PnlButtons: TUniPanel
      Left = 124
      ExplicitLeft = 124
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 336
    Height = 173
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 130
      Top = 1
      Width = 6
      Height = 171
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 129
      Height = 171
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label87: TUniLabel
        Left = 8
        Top = 12
        Width = 103
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Merchant Login Name'
        TabOrder = 1
      end
      object Label89: TUniLabel
        Left = 8
        Top = 36
        Width = 94
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Merchant Password'
        TabOrder = 2
      end
      object Label1: TUniLabel
        Left = 8
        Top = 60
        Width = 36
        Height = 13
        Hint = 
          'Additional User ID to be used in "Credit" or "Charge Back" trans' +
          'actions'
        ShowHint = True
        ParentShowHint = False
        Caption = 'User ID'
        TabOrder = 3
      end
      object Label91: TUniLabel
        Left = 8
        Top = 84
        Width = 74
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Charge Method'
        TabOrder = 4
      end
      object lblProcessingClass: TUniLabel
        Left = 8
        Top = 107
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Processing Class'
        TabOrder = 5
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 136
      Top = 1
      Width = 199
      Height = 171
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtLoginName: TUniEdit
        Left = 0
        Top = 8
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtPassword: TUniEdit
        Left = 0
        Top = 32
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object edtUserID: TUniEdit
        Left = 0
        Top = 56
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object cmbChargeMethod: TUniComboBox
        Left = 0
        Top = 80
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        TabOrder = 4
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 104
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2'
          'Level 3')
        TabOrder = 6
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 128
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 5
      end
    end
  end
end
