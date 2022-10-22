object FrmCCLogFilter: TFrmCCLogFilter
  Left = 296
  Top = 183
  ClientHeight = 349
  ClientWidth = 355
  Caption = 'Filter'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 308
    Width = 355
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 146
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 355
    Height = 308
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 308
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 306
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Source'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 132
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Class'
        TabOrder = 2
      end
      object lblUserID: TUniLabel
        Left = 8
        Top = 228
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'User ID'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 87
      Top = 1
      Width = 268
      Height = 306
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object cmbUserID: TUniDBLookupComboBox
        Left = 1
        Top = 224
        Width = 249
        Height = 21
        Hint = ''
        ListFieldIndex = 0
        TabOrder = 0
        Color = clWindow
      end
      object chkAllUsers: TUniCheckBox
        Left = 1
        Top = 248
        Width = 97
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'All users'
        TabOrder = 1
        OnClick = chkAllUsersClick
      end
      object chkPkHide: TUniCheckBox
        Left = 1
        Top = 264
        Width = 169
        Height = 17
        Hint = ''
        Caption = 'Show archived records'
        TabOrder = 2
      end
      object chkAllSources: TUniCheckBox
        Left = 1
        Top = 92
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'All sources'
        TabOrder = 3
        OnClick = chkAllSourcesClick
      end
      object chkAllClasses: TUniCheckBox
        Left = 1
        Top = 196
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'All classes'
        TabOrder = 4
        OnClick = chkAllClassesClick
      end
      object lstClass: TCheckListBox
        Left = 0
        Top = 120
        Width = 249
        Height = 73
        ItemHeight = 13
        PopupMenu = PList
        TabOrder = 6
      end
      object lstSource: TCheckListBox
        Left = 0
        Top = 8
        Width = 249
        Height = 81
        ItemHeight = 13
        PopupMenu = PList
        TabOrder = 7
      end
    end
  end
  object SrcUsers: TDataSource
    Left = 172
    Top = 24
  end
  object QryUsers: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct createdby as user_id'
      'from credit_card_log'
      'order by 1')
    Left = 184
    Top = 40
    object QryUsersUSER_ID: TStringField
      DisplayWidth = 30
      FieldName = 'USER_ID'
      Origin = 'IQ.CREDIT_CARD_LOG.CREATEDBY'
      Size = 30
    end
  end
  object PList: TUniPopupMenu
    OnPopup = PListPopup
    Left = 244
    Top = 32
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object UnselectAll1: TUniMenuItem
      Caption = 'Unselect All'
      OnClick = UnselectAll1Click
    end
  end
end
