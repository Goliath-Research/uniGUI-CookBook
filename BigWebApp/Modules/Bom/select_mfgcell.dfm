object FrmSelectMfgCell: TFrmSelectMfgCell
  Left = 199
  Top = 257
  ClientHeight = 211
  ClientWidth = 404
  Caption = 'Select Manufacturing Cell'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    404
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 168
    Width = 404
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 402
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel1: TUniPanel
      Tag = 1999
      Left = 192
      Top = 2
      Width = 212
      Height = 41
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 5
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 107
        Top = 10
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object rbtnAllCells: TUniRadioButton
    Left = 14
    Top = 12
    Width = 113
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include all'
    TabOrder = 1
    OnClick = EnableControlsOnForm
  end
  object rbtnOneCell: TUniRadioButton
    Left = 14
    Top = 35
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'Specific cell'
    TabOrder = 2
    OnClick = EnableControlsOnForm
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 32
    Top = 57
    Width = 371
    Height = 106
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 154
    IQComponents.Grid.Height = 20
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMfgCell
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
    IQComponents.Navigator.DataSource = SrcMfgCell
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 154
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 20
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcMfgCell
    Columns = <
      item
        FieldName = 'MFGCELL'
        Title.Caption = 'MfgCell'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGTYPE'
        Title.Caption = 'MfgType'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcMfgCell: TDataSource
    DataSet = QryMfgCell
    Left = 152
    Top = 85
  end
  object QryMfgCell: TFDQuery
    BeforeOpen = QryMfgCellBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.id as mfgcell_id,'
      '       c.mfgcell, '
      '       c.mfgtype,'
      '       m.descrip,'
      '       c.eplant_id,'
      '       e.name as plant_name'
      '  from v_mfgcell c, '
      '       mfgtype m,'
      '       eplant e'
      ' where c.mfgtype = m.mfgtype(+)'
      '   and c.eplant_id = e.id(+)'
      'order by mfgcell'
      ' ')
    Left = 152
    Top = 101
    object QryMfgCellMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Size = 15
    end
    object QryMfgCellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
    end
    object QryMfgCellMFGTYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object QryMfgCellEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryMfgCellPLANT_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'PLANT_NAME'
      Visible = False
      Size = 30
    end
    object QryMfgCellMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
end
