object FrmJCSelectWO: TFrmJCSelectWO
  Left = 282
  Top = 210
  ClientHeight = 406
  ClientWidth = 251
  Caption = 'Select WO #'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 251
    Height = 358
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 249
      Height = 356
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 32
      IQComponents.Grid.Height = 270
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWO
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
      IQComponents.Navigator.DataSource = SrcWO
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 32
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 270
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWO
      Columns = <
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'Work Order'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 358
    Width = 251
    Height = 48
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 33
      Top = 1
      Width = 218
      Height = 46
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object Cancel: TUniButton
        Left = 110
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object wwQryWO: TFDQuery
    BeforeOpen = wwQryWOBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct workorder_id '
      '  from translog'
      'where workorder_id > 0'
      '   and trans_date between :date_start and :date_end')
    Left = 88
    Top = 108
    ParamData = <
      item
        Name = 'DATE_START'
        ParamType = ptInput
      end
      item
        Name = 'DATE_END'
        ParamType = ptInput
      end>
    object wwQryWOWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order'
      DisplayWidth = 29
      FieldName = 'WORKORDER_ID'
      Origin = 'WORKORDER_ID'
      Size = 0
    end
  end
  object SrcWO: TDataSource
    DataSet = wwQryWO
    Left = 48
    Top = 111
  end
end
