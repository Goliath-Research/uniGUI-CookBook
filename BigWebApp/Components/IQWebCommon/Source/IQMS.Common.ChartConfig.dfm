object FConfig: TFConfig
  Left = 223
  Top = 152
  ClientHeight = 245
  ClientWidth = 516
  Caption = 'Configuration'
  OnResize = FormResize
  OldCreateOrder = True
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 214
    Width = 516
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 185
    ExplicitWidth = 473
    object NewConfig: TUniLabel
      Left = 309
      Top = 10
      Width = 73
      Height = 13
      Hint = ''
      Caption = 'Save Config As'
      TabOrder = 1
    end
    object OK: TUniButton
      Left = 1
      Top = 5
      Width = 45
      Height = 25
      Hint = ''
      Caption = '&OK'
      TabOrder = 2
      OnClick = OKClick
    end
    object Save: TUniButton
      Left = 193
      Top = 5
      Width = 45
      Height = 25
      Hint = ''
      Caption = '&Save'
      TabOrder = 4
      OnClick = SaveClick
    end
    object Cancel: TUniButton
      Left = 65
      Top = 5
      Width = 45
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      TabOrder = 5
      OnClick = CancelClick
    end
    object SectionEdit: TUniEdit
      Left = 386
      Top = 7
      Width = 94
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      OnMouseDown = SectionEditMouseDown
    end
    object Load: TUniButton
      Left = 129
      Top = 5
      Width = 45
      Height = 25
      Hint = ''
      Caption = '&Load'
      TabOrder = 6
      OnClick = LoadClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 214
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 473
    ExplicitHeight = 185
    object Splitter1: TUniSplitter
      Left = 395
      Top = 0
      Width = 26
      Height = 214
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 352
      ExplicitHeight = 185
    end
    object pnlAvail: TUniPanel
      Left = 421
      Top = 1
      Width = 95
      Height = 212
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 378
      ExplicitHeight = 183
      object ListIni: TUniListBox
        Tag = 2
        Left = 1
        Top = 24
        Width = 93
        Height = 188
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnClick = ListIniClick
        OnDblClick = ListIniDblClick
        OnMouseDown = ListIniMouseDown
        ExplicitHeight = 159
      end
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 93
        Height = 24
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = ' Avail Config(s)'
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 395
      Height = 212
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 352
      ExplicitHeight = 183
      object Splitter2: TUniSplitter
        Left = 229
        Top = 0
        Width = 3
        Height = 212
        Hint = ''
        Align = alRight
        ParentColor = False
        Color = clBtnFace
        ExplicitLeft = 186
        ExplicitHeight = 183
      end
      object pnlSelected: TUniPanel
        Left = 232
        Top = 1
        Width = 163
        Height = 210
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = 'pnlSelected'
        ExplicitLeft = 189
        ExplicitHeight = 181
        object SelectColumn: TUniListBox
          Left = 1
          Top = 24
          Width = 161
          Height = 186
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnDblClick = SelectColumnDblClick
          OnKeyPress = SelectColumnKeyPress
          OnMouseDown = SelectColumnMouseDown
          ExplicitHeight = 157
        end
        object Panel5: TUniPanel
          Left = 1
          Top = 1
          Width = 161
          Height = 24
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ' Selected Column(s)'
        end
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 229
        Height = 210
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'Panel6'
        ExplicitWidth = 186
        ExplicitHeight = 181
        object AvailColumn: TUniListBox
          Left = 1
          Top = 24
          Width = 196
          Height = 186
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          MultiSelect = True
          OnDblClick = AvailColumnDblClick
          OnMouseDown = AvailColumnMouseDown
          ExplicitWidth = 153
          ExplicitHeight = 157
        end
        object Panel7: TUniPanel
          Left = 1
          Top = 1
          Width = 227
          Height = 24
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ' Available Columns'
          ExplicitWidth = 184
        end
        object Panel9: TUniPanel
          Left = 196
          Top = 24
          Width = 33
          Height = 186
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 2
          Caption = ''
          ExplicitLeft = 153
          ExplicitHeight = 157
          object Select: TUniButton
            Left = 6
            Top = 26
            Width = 25
            Height = 23
            Hint = ''
            Caption = '>'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            TabOrder = 1
            OnClick = SelectClick
          end
          object Deselect: TUniButton
            Left = 6
            Top = 58
            Width = 25
            Height = 23
            Hint = ''
            Caption = '<'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            TabOrder = 2
            OnClick = DeselectClick
          end
          object SelectAll: TUniButton
            Left = 6
            Top = 90
            Width = 25
            Height = 23
            Hint = ''
            Caption = '>>'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            TabOrder = 3
            OnClick = SelectAllClick
          end
          object DeselectAll: TUniButton
            Left = 6
            Top = 122
            Width = 25
            Height = 23
            Hint = ''
            Caption = '<<'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            TabOrder = 4
            OnClick = DeselectAllClick
          end
        end
      end
    end
  end
end
