object FrmCCChargeProgress: TFrmCCChargeProgress
  Left = 330
  Top = 201
  ClientHeight = 327
  ClientWidth = 419
  Caption = 'Authorization'
  BorderStyle = bsDialog
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlStatus: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 419
    Height = 78
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 8
      Top = 8
      Width = 404
      Height = 21
      Hint = ''
      TabOrder = 0
      Caption = ''
      object lblStatusLabel: TUniLabel
        Left = 8
        Top = 1
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Status:'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object Bevel1: TUniPanel
        Left = 1
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        Caption = ''
      end
      object Bevel2: TUniPanel
        Left = 43
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object lblStatus: TUniLabel
        Left = 51
        Top = 1
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Idle'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 4
      end
    end
    object ProgressBar: TUniProgressBar
      Left = 8
      Top = 56
      Width = 404
      Height = 17
      Hint = ''
      TabOrder = 1
    end
    object Panel2: TUniPanel
      Left = 212
      Top = 32
      Width = 200
      Height = 21
      Hint = ''
      TabOrder = 2
      Caption = ''
      object lblErrorsLabel: TUniLabel
        Left = 8
        Top = 1
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Errors:'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object Bevel3: TUniPanel
        Left = 1
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        Caption = ''
      end
      object Bevel4: TUniPanel
        Left = 41
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object lblErrorCount: TUniLabel
        Left = 49
        Top = 1
        Width = 6
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        Caption = '0'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
      end
      object Bevel5: TUniPanel
        Left = 192
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 5
        Caption = ''
      end
    end
    object Panel3: TUniPanel
      Left = 8
      Top = 32
      Width = 200
      Height = 21
      Hint = ''
      TabOrder = 3
      Caption = ''
      object lblProcessedLabel: TUniLabel
        Left = 8
        Top = 1
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Processed:'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object Bevel6: TUniPanel
        Left = 1
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
        Caption = ''
      end
      object Bevel7: TUniPanel
        Left = 61
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 3
        Caption = ''
      end
      object lblCount: TUniLabel
        Left = 69
        Top = 1
        Width = 6
        Height = 13
        Hint = ''
        Alignment = taRightJustify
        Caption = '0'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 4
      end
      object Bevel8: TUniPanel
        Left = 192
        Top = 1
        Width = 8
        Height = 19
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 5
        Caption = ''
      end
    end
  end
  object PnlClient: TUniPanel
    Tag = 1999
    Left = 0
    Top = 78
    Width = 419
    Height = 208
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object bvTopBuffer: TUniPanel
      Left = 1
      Top = 1
      Width = 417
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
    end
    object bvLeftBuffer: TUniPanel
      Left = 1
      Top = 3
      Width = 3
      Height = 202
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      Caption = ''
    end
    object bvRightBuffer: TUniPanel
      Left = 416
      Top = 3
      Width = 3
      Height = 202
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 3
      Caption = ''
    end
    object bvBottomBuffer: TUniPanel
      Left = 1
      Top = 205
      Width = 417
      Height = 3
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 4
      Caption = ''
    end
    object rtfStatus: TUniMemo
      Left = 3
      Top = 3
      Width = 413
      Height = 202
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 286
    Width = 419
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 314
      Top = 1
      Width = 105
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnClose: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Done'
        TabOrder = 1
        OnClick = btnCloseClick
      end
    end
    object btnCopySelected: TUniButton
      Left = 3
      Top = 6
      Width = 94
      Height = 25
      Hint = ''
      Caption = 'Copy Selection'
      TabOrder = 2
    end
    object btnCopyAll: TUniButton
      Left = 103
      Top = 6
      Width = 94
      Height = 25
      Hint = ''
      Caption = 'Copy All'
      TabOrder = 3
    end
    object UniButton1: TUniButton
      Left = 203
      Top = 6
      Width = 94
      Height = 25
      Hint = ''
      Caption = 'Save To File'
      TabOrder = 4
      OnClick = UniButton1Click
    end
  end
end
