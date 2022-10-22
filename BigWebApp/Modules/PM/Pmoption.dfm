object FrmPMOptions: TFrmPMOptions
  Left = 363
  Top = 156
  ClientHeight = 317
  ClientWidth = 344
  Caption = 'Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 3
    Width = 344
    Height = 281
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 342
      Height = 279
      Hint = ''
      ActivePage = TabGeneral
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGeneral: TUniTabSheet
        Hint = ''
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        DesignSize = (
          334
          251)
        object GroupBox1: TUniGroupBox
          Left = 3
          Top = 1
          Width = 334
          Height = 168
          Hint = ''
          Caption = ' Task Unit Count '
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            334
            168)
          object rbResetUnitsY: TUniRadioButton
            Left = 8
            Top = 16
            Width = 313
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Checked = True
            Caption = 'Reset when adding task to Work Order'
            TabOrder = 0
            OnClick = DoResetOptionClick
          end
          object rbResetUnitsN: TUniRadioButton
            Left = 8
            Top = 33
            Width = 313
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Reset when closing task on Work Order'
            TabOrder = 1
            OnClick = DoResetOptionClick
          end
          object rbResetUnitsZero: TUniRadioButton
            Left = 8
            Top = 50
            Width = 313
            Height = 17
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Zero when closing task on Work Order'
            TabOrder = 2
            OnClick = DoResetOptionClick
          end
          object memResetPrompt: TRichEdit
            Left = 8
            Top = 72
            Width = 314
            Height = 83
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = bsNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = True
            ParentFont = False
            PlainText = True
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 4
            Zoom = 100
          end
        end
        object chkShowTax: TUniDBCheckBox
          Left = 8
          Top = 175
          Width = 329
          Height = 17
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'SHOW_TAX'
          DataSource = SrcPMOption
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Show Tax for AR Values in Activity Summary'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object dbCommentEqualsDescrip: TUniDBCheckBox
          Left = 8
          Top = 192
          Width = 331
          Height = 17
          Hint = 
            'When adding a new miscellaneous MRO Work Order item, update the ' +
            'comment field with the task description.'
          DataField = 'MISC_COMMENT_EQUALS_DESCRIP'
          DataSource = SrcPMOption
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Populate Comment with Miscellaneous Task Description'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 284
    Width = 344
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 30
      Top = 1
      Width = 314
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 3
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = SaveOptions
      end
      object btnCancel: TUniBitBtn
        Left = 107
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnApply: TUniBitBtn
        Left = 210
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Apply'
        TabOrder = 2
        OnClick = SaveOptions
      end
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 158
    Top = 93
  end
  object TblParams: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 168
    Top = 104
    object TblParamsRESET_PMWO_ON_OPEN: TStringField
      FieldName = 'RESET_PMWO_ON_OPEN'
      Size = 1
    end
    object TblParamsZERO_PMWO_TASK: TStringField
      FieldName = 'ZERO_PMWO_TASK'
      FixedChar = True
      Size = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'chkResetTaskCount'
      'btnOk'
      'btnApply')
    SecurityCode = 'FRMPMOPTIONS'
    Left = 198
    Top = 93
  end
  object SrcPMOption: TDataSource
    DataSet = TblPMOption
    Left = 174
    Top = 165
  end
  object TblPMOption: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PMOPTION'
    TableName = 'PMOPTION'
    Left = 184
    Top = 176
    object TblPMOptionSHOW_TAX: TStringField
      FieldName = 'SHOW_TAX'
      FixedChar = True
      Size = 1
    end
    object TblPMOptionMISC_COMMENT_EQUALS_DESCRIP: TStringField
      FieldName = 'MISC_COMMENT_EQUALS_DESCRIP'
      FixedChar = True
      Size = 1
    end
  end
  object PMain: TUniPopupMenu
    Left = 230
    Top = 165
    object Help1: TUniMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end
