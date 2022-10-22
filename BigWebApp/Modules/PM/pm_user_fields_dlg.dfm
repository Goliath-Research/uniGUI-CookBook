object FrmPMUserFields: TFrmPMUserFields
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
          object IQUserDefLabel1: TIQWebUserDefLabel
            Left = 8
            Top = 11
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 1'
            TabOrder = 1
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel2: TIQWebUserDefLabel
            Left = 8
            Top = 35
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 2'
            TabOrder = 2
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel3: TIQWebUserDefLabel
            Left = 8
            Top = 59
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 3'
            TabOrder = 3
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel4: TIQWebUserDefLabel
            Left = 8
            Top = 83
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 4'
            TabOrder = 4
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel5: TIQWebUserDefLabel
            Left = 8
            Top = 107
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 5'
            TabOrder = 5
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel6: TIQWebUserDefLabel
            Left = 8
            Top = 131
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'User Text 6'
            TabOrder = 6
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel7: TIQWebUserDefLabel
            Left = 8
            Top = 155
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 1'
            TabOrder = 7
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel8: TIQWebUserDefLabel
            Left = 8
            Top = 179
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 2'
            TabOrder = 8
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel9: TIQWebUserDefLabel
            Left = 8
            Top = 203
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 3'
            TabOrder = 9
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel10: TIQWebUserDefLabel
            Left = 8
            Top = 227
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 4'
            TabOrder = 10
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
          end
          object IQUserDefLabel11: TIQWebUserDefLabel
            Left = 8
            Top = 251
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'User Numeric 5'
            TabOrder = 11
            OnGetOwnerName = DoGetOwnerName
            ParentAppName = 'IQPM.EXE'
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
          object dbeNote1: TUniDBEdit
            Left = 1
            Top = 8
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER1'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object dbeNote2: TUniDBEdit
            Left = 1
            Top = 32
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER2'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object dbeNote3: TUniDBEdit
            Left = 1
            Top = 56
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER3'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbeNote4: TUniDBEdit
            Left = 1
            Top = 80
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER4'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object dbeNote5: TUniDBEdit
            Left = 1
            Top = 104
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER5'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object dbeNote6: TUniDBEdit
            Left = 1
            Top = 128
            Width = 245
            Height = 21
            Hint = ''
            DataField = 'CUSER6'
            DataSource = Src
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
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
    SecurityCode = 'FRMPMUSERFIELDS_PMEQMT'
    Left = 248
    Top = 169
  end
end
