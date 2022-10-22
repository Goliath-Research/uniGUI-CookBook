inherited FrmMCSalesman: TFrmMCSalesman
  ClientHeight = 202
  ClientWidth = 435
  Caption = 'Commissions'
  ExplicitWidth = 441
  ExplicitHeight = 251
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 435
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 435
    Height = 175
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 391
    ExplicitHeight = 126
    object Splitter1: TUniSplitter
      Left = 103
      Top = 0
      Width = 6
      Height = 175
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 126
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 103
      Height = 173
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 124
      object lblTotalPrice: TUniLabel
        Left = 8
        Top = 16
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Still to pay'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 42
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Total Commissions'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 64
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Paid so far'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 8
        Top = 88
        Width = 71
        Height = 13
        Hint = ''
        Caption = 'Amount to pay'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 109
      Top = 1
      Width = 326
      Height = 173
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 282
      ExplicitHeight = 124
      DesignSize = (
        326
        173)
      object edtComm: TUniEdit
        Left = 1
        Top = 13
        Width = 315
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 271
      end
      object EdtTotalComm: TUniEdit
        Left = 1
        Top = 38
        Width = 315
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 271
      end
      object Edipaid: TUniEdit
        Left = 1
        Top = 62
        Width = 315
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 271
      end
      object Edamount: TUniEdit
        Left = 1
        Top = 86
        Width = 315
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        ExplicitWidth = 271
      end
    end
  end
end
