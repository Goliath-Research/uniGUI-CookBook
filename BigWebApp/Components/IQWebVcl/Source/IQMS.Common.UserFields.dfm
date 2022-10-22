object FrmUserFields: TFrmUserFields
  Left = 279
  Top = 132
  HelpContext = 1214927
  ClientHeight = 329
  ClientWidth = 384
  Caption = 'User Fields'
  OnShow = FormShow
  FormStyle = fsStayOnTop
  Position = poDefault
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 290
    Width = 384
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 176
      Top = 1
      Width = 208
      Height = 37
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
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 290
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object sbMain: TUniScrollBox
      Left = 0
      Top = 0
      Width = 384
      Height = 290
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ScrollHeight = 277
      object PnlClient01: TUniPanel
        Tag = 1999
        Left = 0
        Top = 0
        Width = 382
        Height = 277
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 128
          Top = 0
          Width = 6
          Height = 277
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 128
          Height = 275
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object IQUserDefLabel1UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 12
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 1'
            TabOrder = 1
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel2UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 36
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 2'
            TabOrder = 2
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel3UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 60
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 3'
            TabOrder = 3
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel4UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 84
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 4'
            TabOrder = 4
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel5UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 108
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 5'
            TabOrder = 5
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel6UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 132
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 6'
            TabOrder = 6
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel7UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 156
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 1'
            TabOrder = 7
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel8UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 180
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 2'
            TabOrder = 8
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel9UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 204
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 3'
            TabOrder = 9
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel10UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 228
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 4'
            TabOrder = 10
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
          object IQUserDefLabel11UserFields: TIQWebUserDefLabel
            Left = 8
            Top = 252
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 5'
            TabOrder = 11
            OnGetOwnerName = IQUserDefLabel1UserFieldsGetOwnerName
            ParentAppName = 'IQWIN32.EXE'
          end
        end
        object PnlClient02: TUniPanel
          Tag = 1999
          Left = 134
          Top = 1
          Width = 248
          Height = 275
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            248
            275)
          object dbeNote1: TIQWebUDComboBox
            Left = 1
            Top = 8
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER1'
            DataSource = Src
            TabOrder = 0
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER1'
          end
          object dbeNote2: TIQWebUDComboBox
            Left = 1
            Top = 32
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER2'
            DataSource = Src
            TabOrder = 1
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER2'
          end
          object dbeNote3: TIQWebUDComboBox
            Left = 1
            Top = 56
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER3'
            DataSource = Src
            TabOrder = 2
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER3'
          end
          object dbeNote4: TIQWebUDComboBox
            Left = 1
            Top = 80
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER4'
            DataSource = Src
            TabOrder = 3
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER4'
          end
          object dbeNote5: TIQWebUDComboBox
            Left = 1
            Top = 104
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER5'
            DataSource = Src
            TabOrder = 4
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER5'
          end
          object dbeNote6: TIQWebUDComboBox
            Left = 1
            Top = 128
            Width = 243
            Height = 21
            Hint = 'Right click to edit the list'
            ShowHint = True
            ParentShowHint = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CUSER6'
            DataSource = Src
            TabOrder = 5
            KeyTableName = 'STANDARD'
            KeyFieldName = 'CUSER6'
          end
          object dbeValue1: TUniDBEdit
            Left = 1
            Top = 152
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'NUSER1'
            DataSource = Src
            TabOrder = 6
          end
          object dbeValue2: TUniDBEdit
            Left = 1
            Top = 176
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'NUSER2'
            DataSource = Src
            TabOrder = 7
          end
          object dbeValue3: TUniDBEdit
            Left = 1
            Top = 200
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'NUSER3'
            DataSource = Src
            TabOrder = 8
          end
          object dbeValue4: TUniDBEdit
            Left = 1
            Top = 224
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'NUSER4'
            DataSource = Src
            TabOrder = 9
          end
          object dbeValue5: TUniDBEdit
            Left = 1
            Top = 248
            Width = 93
            Height = 21
            Hint = ''
            DataField = 'NUSER5'
            DataSource = Src
            TabOrder = 10
          end
        end
      end
    end
  end
  object Src: TDataSource
    Left = 216
    Top = 168
  end
  object PopupUserDefLabel: TUniPopupMenu
    Left = 216
    Top = 201
    object DefineLabelText1: TUniMenuItem
      Caption = '&Define Label Text'
      OnClick = DefineLabelText1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMUSERFIELDS')
    SecurityItems.Strings = (
      'IQUserDefLabel1'
      'IQUserDefLabel2'
      'IQUserDefLabel3'
      'IQUserDefLabel8'
      'IQUserDefLabel9'
      'IQUserDefLabel7'
      'IQUserDefLabel4'
      'IQUserDefLabel5'
      'IQUserDefLabel6'
      'IQUserDefLabel10'
      'IQUserDefLabel11'
      'dbeNote1'
      'dbeNote2'
      'dbeNote3'
      'dbeNote4'
      'dbeNote5'
      'dbeNote6'
      'dbeValue1'
      'dbeValue2'
      'dbeValue3'
      'dbeValue4'
      'dbeValue5'
      'btnOk')
    SecurityCode = 'FRMUSERFIELDS'
    Left = 248
    Top = 169
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 168
    object File1: TUniMenuItem
      Caption = 'File'
      object Close1: TUniMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
  end
end
