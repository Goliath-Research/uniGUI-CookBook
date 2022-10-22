object DocDescrip: TDocDescrip
  Left = 351
  Top = 194
  ClientHeight = 215
  ClientWidth = 319
  Caption = 'Document Control'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 319
    Height = 174
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 5
      Top = 5
      Width = 308
      Height = 164
      Hint = ''
      TabOrder = 8
      Caption = ''
    end
    object Label2: TUniLabel
      Left = 32
      Top = 93
      Width = 47
      Height = 13
      Hint = ''
      Caption = 'Sequence'
      TabOrder = 9
    end
    object Label1: TUniLabel
      Left = 32
      Top = 118
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Description'
      TabOrder = 10
    end
    object Label3: TUniLabel
      Left = 32
      Top = 143
      Width = 47
      Height = 13
      Hint = ''
      Caption = 'Print With'
      TabOrder = 11
    end
    object rbNew: TUniRadioButton
      Left = 16
      Top = 12
      Width = 241
      Height = 17
      Hint = ''
      Caption = 'Create New Document'
      TabOrder = 0
      OnClick = rbPickClick
    end
    object rbPick: TUniRadioButton
      Left = 16
      Top = 31
      Width = 241
      Height = 17
      Hint = ''
      Caption = 'Pick Existing Document'
      TabOrder = 1
      OnClick = rbPickClick
    end
    object rbMemo: TUniRadioButton
      Left = 16
      Top = 51
      Width = 241
      Height = 17
      Hint = ''
      Caption = 'Edit Document Contents'
      TabOrder = 2
    end
    object rbChange: TUniRadioButton
      Left = 16
      Top = 70
      Width = 241
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Change Document Description or Sequence'
      TabOrder = 3
      OnClick = rbPickClick
    end
    object edSeq: TUniEdit
      Left = 111
      Top = 89
      Width = 50
      Height = 21
      Hint = ''
      MaxLength = 3
      Text = ''
      TabOrder = 4
      InputMask.Mask = '999;0;_'
    end
    object edDesc: TUniEdit
      Left = 111
      Top = 114
      Width = 194
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 5
      OnChange = edDescChange
    end
    object comboPrintWith: TUniDBComboBox
      Left = 111
      Top = 139
      Width = 194
      Height = 21
      Hint = ''
      Style = csDropDownList
      TabOrder = 6
      OnKeyDown = comboPrintWithKeyDown
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 174
    Width = 319
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 109
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BitBtnOK: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 0
        Default = True
        OnClick = BitBtnOKClick
      end
      object BitBtnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        OnClick = BitBtnCancelClick
      end
    end
  end
  object SrcDocsLink: TDataSource
    Left = 184
    Top = 98
  end
  object PkIQ_Docs: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select descrip, userid, timestamp, id from iq_docs')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 192
    Top = 16
    object PkIQ_DocsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      FixedChar = True
      Size = 30
    end
    object PkIQ_DocsUSERID: TStringField
      DisplayLabel = 'UserID'
      FieldName = 'USERID'
      Origin = 'USERID'
      Size = 35
    end
    object PkIQ_DocsTIMESTAMP: TDateTimeField
      DisplayLabel = 'DateTime'
      FieldName = 'TIMESTAMP'
      Origin = 'TIMESTAMP'
    end
    object PkIQ_DocsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end
