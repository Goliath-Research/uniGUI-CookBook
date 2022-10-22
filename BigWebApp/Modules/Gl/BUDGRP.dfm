object FrmBudGrp: TFrmBudGrp
  Left = 207
  Top = 155
  ClientHeight = 362
  ClientWidth = 600
  Caption = 'Create Budgets by Group'
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 164
    Width = 600
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 167
    Width = 600
    Height = 195
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 598
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object DBNavigator2: TUniDBNavigator
        Left = 423
        Top = 1
        Width = 175
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 27
      Width = 598
      Height = 168
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBGrid5: TUniDBGrid
        Left = 1
        Top = 1
        Width = 596
        Height = 166
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            Title.Caption = 'Period'
            Width = 53
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Last % Alloc'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Alignment = taRightJustify
            Title.Caption = 'Last Amount'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Cur % Alloc'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Cur Amount'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Next % Alloc'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Next Amount'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object Panel4: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 600
    Height = 164
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 598
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object ComboBox1: TUniComboBox
        Left = 5
        Top = 3
        Width = 161
        Height = 21
        Hint = ''
        Text = 'ComboBox1'
        Items.Strings = (
          'Sales Revenue'
          'Sales Expense'
          'Maintenance'
          'Marketing/Advertising')
        TabOrder = 1
      end
    end
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 27
      Width = 598
      Height = 137
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBGrid2: TUniDBGrid
        Left = 1
        Top = 1
        Width = 596
        Height = 135
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            Title.Caption = 'Account'
            Width = 100
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Cur Alloc%'
            Width = 88
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'Last Alloc%'
            Width = 91
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            Title.Caption = 'NextAlloc%'
            Width = 81
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
end
