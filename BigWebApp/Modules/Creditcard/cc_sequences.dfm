object FrmCCSequences: TFrmCCSequences
  Left = 0
  Top = 0
  ClientHeight = 371
  ClientWidth = 665
  Caption = 'Credit Card Transaction Sequences'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGrid: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 665
    Height = 371
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 663
      Height = 369
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 446
      IQComponents.Grid.Height = 283
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSequences
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcSequences
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 446
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 283
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcSequences
      Columns = <
        item
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEQUENCE_NAME'
          Title.Caption = 'Sequence Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEQUENCE_VALUE'
          Title.Caption = 'Current Value'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object cmbGridCurrentValue: TUniEdit
      Left = 144
      Top = 224
      Width = 142
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
  end
  object SrcSequences: TDataSource
    DataSet = QrySequences
    Left = 272
    Top = 192
  end
  object QrySequences: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT description, sequence_name, sequence_exists, sequence_val' +
        'ue'
      '  FROM v_credit_card_sequences'
      ' WHERE sequence_exists = 1')
    Left = 280
    Top = 200
    object QrySequencesDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 34
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 34
    end
    object QrySequencesSEQUENCE_NAME: TStringField
      DisplayLabel = 'Sequence Name'
      DisplayWidth = 35
      FieldName = 'SEQUENCE_NAME'
      Origin = 'SEQUENCE_NAME'
      Size = 29
    end
    object QrySequencesSEQUENCE_VALUE: TFMTBCDField
      DisplayLabel = 'Current Value'
      DisplayWidth = 23
      FieldName = 'SEQUENCE_VALUE'
      Origin = 'SEQUENCE_VALUE'
      Precision = 38
      Size = 38
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 384
    Top = 195
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TUniMenuItem
      Caption = '&Edit'
      object ChangeCurrentSequence1: TUniMenuItem
        Caption = 'Change Current Sequence'
        OnClick = ChangeCurrentSequence1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCCSequences'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195063 $'
    BuildVersion = '176554'
    Left = 328
    Top = 200
  end
  object PMain: TUniPopupMenu
    Left = 416
    Top = 195
    object ChangeCurrentSequence2: TUniMenuItem
      Caption = 'Change Current Sequence'
      OnClick = ChangeCurrentSequence1Click
    end
  end
end
