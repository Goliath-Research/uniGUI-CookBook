object FrmRepDefFormulasDataEntry: TFrmRepDefFormulasDataEntry
  Left = 328
  Top = 196
  ClientHeight = 197
  ClientWidth = 349
  Caption = 'Report Parameters'
  OnResize = FormResize
  OldCreateOrder = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  ActiveControl = DBGrid1
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 349
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 162
    Width = 349
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 42
      Top = 1
      Width = 307
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 105
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 206
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        TabOrder = 2
        OnClick = btnCancelClick
      end
      object btnClear: TUniButton
        Left = 4
        Top = 5
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'C&lear'
        TabOrder = 3
        OnClick = btnClearClick
      end
    end
  end
  object PageControl1: TUniPageControl
    Left = 0
    Top = 3
    Width = 349
    Height = 159
    Hint = ''
    ActivePage = TabSheet2
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    TabStop = False
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object DBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 341
        Height = 131
        Hint = ''
        DataSource = DataSource1
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        LoadMask.Message = 'Loading data...'
        OnKeyDown = DBGrid1KeyDown
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnCellClick = DBGrid1CellClick
        Columns = <
          item
            FieldName = 'LABEL_TEXT'
            Title.Caption = 'Variable'
            Width = 173
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FORM_VALUE'
            Title.Caption = 'Value'
            Width = 85
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  object DataSource1: TDataSource
    Left = 224
    Top = 72
  end
end
