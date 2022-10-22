object FrmTranAcctDetails: TFrmTranAcctDetails
  Left = 165
  Top = 151
  ClientHeight = 218
  ClientWidth = 383
  Caption = 'Transaction Details'
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TUniPanel
    Left = 0
    Top = 0
    Width = 383
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object navAcct: TUniDBNavigator
      Left = 283
      Top = 1
      Width = 100
      Height = 25
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object gridAccts: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 383
    Height = 191
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 166
    IQComponents.Grid.Height = 105
    IQComponents.Grid.Hint = ''
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
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 166
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 105
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    Columns = <
      item
        FieldName = 'COST_ELEMENT'
        Title.Caption = 'Cost Element'
        Width = 12
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Acct'
        Title.Caption = 'Account'
        Width = 20
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 31
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEBIT'
        Title.Caption = 'Debit'
        Width = 19
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CREDIT'
        Title.Caption = 'Credit'
        Width = 14
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
end
