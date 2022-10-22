object FrmQLetter: TFrmQLetter
  Left = 201
  Top = 330
  HelpContext = 1081455
  Caption = 'Quote Letters'
  ClientHeight = 374
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  object Panel1: TUniPanel
    Left = 516
    Top = 0
    Width = 109
    Height = 374
    Align = alRight
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object btnPrint: TUniButton
      Left = 8
      Top = 67
      Width = 97
      Height = 25
      Hint = 'Print letter'
      Caption = '&Print'
      OnClick = btnPrintClick
    end
    object btnNew: TUniButton
      Left = 8
      Top = 7
      Width = 97
      Height = 25
      Hint = 'Create new quote letter using MS Word'
      Caption = '&New'
      OnClick = btnNewClick
    end
    object btnEdit: TUniButton
      Left = 8
      Top = 37
      Width = 97
      Height = 25
      Hint = 'Edit letter contents'
      Caption = '&Edit'
      OnClick = btnEditClick
    end
    object btnSetup: TUniButton
      Left = 8
      Top = 150
      Width = 97
      Height = 25
      Hint = 'Setup new letter options'
      Caption = '&Setup'
      OnClick = btnSetupClick
    end
    object Button1: TUniButton
      Left = 8
      Top = 97
      Width = 97
      Height = 25
      Caption = 'Printer Set&up'
      OnClick = Button1Click
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 374
    Align = alClient
    TabOrder = 1
    object Bevel1: TUniPanel
      Left = 2
      Top = 284
      Width = 512
      Height = 3
      Align = alBottom
      ExplicitTop = 119
      ExplicitWidth = 353
    end
    object GroupBox1: TUniGroupBox
      Left = 2
      Top = 287
      Width = 512
      Height = 85
      Align = alBottom
      Caption = '  New Letter Options  '
      TabOrder = 0
      DesignSize = (
        512
        85)
      object Label1: TUniLabel
        Left = 13
        Top = 61
        Width = 98
        Height = 13
        Caption = 'Quote Letter Library'
      end
      object chkInclReport: TUniCheckBox
        Left = 13
        Top = 16
        Width = 513
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Include report ? output'
        Checked = True
        TabOrder = 0
      end
      object chkFromTemplate: TUniCheckBox
        Left = 13
        Top = 36
        Width = 513
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Generate from ? template'
        Checked = True
        TabOrder = 1
      end
      object wwDBComboDlgQuoteLetterLib: TUniEdit
        Left = 134
        Top = 58
        Width = 369
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 2
      end
    end
    object extdocLetters: TIQWebExtDoc
      Left = 2
      Top = 2
      Width = 512
      Height = 282
      Align = alClient
      BevelOuter = bvNone
      Filter = '(*.doc)|*.doc|(*.*)|*.*'
      MasterFields = 'ID'
      ParentShowHint = False
      ShowHint = True
      Source = 'QUOTE_LETTER'
      TableName = 'QUOTE_LETTER'
      TabOrder = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnPrint'
      'btnNew'
      'btnEdit'
      'btnSetup'
      'chkInclReport'
      'chkFromTemplate'
      'extdocLetters')
    SecurityCode = 'QUOTE_LETTER'
    Left = 72
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 44
  end
end
