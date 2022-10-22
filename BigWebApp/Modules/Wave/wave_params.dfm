object FrmWaveParams: TFrmWaveParams
  Left = 0
  Top = 0
  ClientHeight = 224
  ClientWidth = 354
  Caption = 'Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 173
    Top = 0
    Width = 4
    Height = 182
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = 16250871
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 173
    Height = 182
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 12
      Width = 110
      Height = 13
      Hint = ''
      Caption = 'On Pick Ticket Creation'
      TabOrder = 1
    end
    object Label2: TUniLabel
      Left = 32
      Top = 36
      Width = 74
      Height = 13
      Hint = ''
      Caption = 'Print Pick Ticket'
      TabOrder = 2
    end
    object Label3: TUniLabel
      Left = 32
      Top = 60
      Width = 93
      Height = 13
      Hint = ''
      Caption = 'Print Shipping Label'
      TabOrder = 3
    end
    object Label4: TUniLabel
      Left = 8
      Top = 108
      Width = 123
      Height = 13
      Hint = ''
      Caption = 'Evaluate Requested Date'
      TabOrder = 4
    end
    object Label5: TUniLabel
      Left = 8
      Top = 132
      Width = 134
      Height = 13
      Hint = ''
      Caption = 'Sales Order Releases Scope'
      TabOrder = 5
    end
    object Label6: TUniLabel
      Left = 8
      Top = 84
      Width = 147
      Height = 13
      Hint = ''
      Caption = 'Populate Pending Transactions'
      TabOrder = 6
    end
  end
  object Panel2: TUniPanel
    Left = 177
    Top = 0
    Width = 177
    Height = 182
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object chkPrintPickTicket: TUniCheckBox
      Left = 0
      Top = 35
      Width = 17
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 0
    end
    object chkPrintShipLabel: TUniCheckBox
      Left = 0
      Top = 59
      Width = 17
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 1
    end
    object chkEvalReqDate: TUniCheckBox
      Left = 0
      Top = 107
      Width = 17
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 3
    end
    object edReleasesScope: TUniEdit
      Left = 0
      Top = 129
      Width = 121
      Height = 21
      Hint = ''
      Text = '0'
      TabOrder = 4
    end
    object chkPopulatePendTrans: TUniCheckBox
      Left = 0
      Top = 83
      Width = 17
      Height = 17
      Hint = ''
      Caption = ''
      TabOrder = 2
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 182
    Width = 354
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 126
      Top = 1
      Width = 227
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 118
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end
