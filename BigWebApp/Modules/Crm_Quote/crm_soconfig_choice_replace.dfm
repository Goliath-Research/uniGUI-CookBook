object FrmCRMConfigChoiceReplace: TFrmCRMConfigChoiceReplace
  Left = 520
  Top = 288
  ClientHeight = 164
  ClientWidth = 417
  Caption = 'Replace'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 123
    Width = 417
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 207
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 417
    Height = 123
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 121
      Top = 0
      Width = 6
      Height = 123
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 121
      Height = 121
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object chkReplaceCode: TUniCheckBox
        Left = 8
        Top = 10
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Replace Code'
        TabOrder = 0
        OnClick = chkReplaceCodeClick
      end
      object chkReplacePrice: TUniCheckBox
        Left = 8
        Top = 34
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Replace Price'
        TabOrder = 1
        OnClick = chkReplacePriceClick
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 127
      Top = 1
      Width = 290
      Height = 121
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        290
        121)
      object edtPrice: TUniEdit
        Left = 1
        Top = 32
        Width = 262
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtCode: TUniEdit
        Left = 1
        Top = 8
        Width = 262
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
    end
  end
  object PkSalesChoice: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, code, descrip from sales_choice')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 84
    Top = 72
    object PkSalesChoiceID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SALES_CHOICE.ID'
      Visible = False
      Size = 0
    end
    object PkSalesChoiceCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.SALES_CHOICE.CODE'
      Size = 30
    end
    object PkSalesChoiceDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.SALES_CHOICE.DESCRIP'
      Size = 60
    end
  end
end
