object FrmTariffHistory: TFrmTariffHistory
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 635
  Caption = 'Tariff History'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch2: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 635
    Height = 337
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 418
    IQComponents.Grid.Height = 251
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcTariffHist
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
    IQComponents.Navigator.DataSource = SrcTariffHist
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 418
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 251
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcTariffHist
    Columns = <
      item
        FieldName = 'DATE_REVIEWED'
        Title.Caption = 'Review Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REASON'
        Title.Caption = 'Reason'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DATE_CHANGED'
        Title.Caption = 'Change Date/Time'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'User ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OLD_CODE'
        Title.Caption = 'Old Tariff Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_CODE'
        Title.Caption = 'New Tariff Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_DESCRIP'
        Title.Caption = 'New Tariff'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OLD_DESCRIP'
        Title.Caption = 'Old Tariff'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object SrcTariffHist: TDataSource
    DataSet = QryTariffHist
    Left = 32
    Top = 56
  end
  object QryTariffHist: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.id,'
      '       h.old_tariff_code_id,'
      '       h.date_reviewed,'
      '       h.reason,'
      '       h.date_changed,'
      '       h.arinvt_id,'
      '       h.userid,'
      '       h.new_tariff_code_id,'
      '       t1.descrip as old_descrip,'
      '       t2.descrip as new_descrip,'
      '       t1.code as old_code,'
      '       t2.code as new_code'
      '  from TARIFF_CODE_HISTORY h,'
      '       TARIFF_CODE t1,'
      '       TARIFF_CODE t2'
      ' where h.old_tariff_code_id = t1.id(+)'
      '   and h.new_tariff_code_id = t2.id(+)'
      '   and h.arinvt_id = :ID')
    Left = 48
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTariffHistDATE_REVIEWED: TDateTimeField
      DisplayLabel = 'Review Date'
      DisplayWidth = 18
      FieldName = 'DATE_REVIEWED'
      Origin = 'h.DATE_REVIEWED'
    end
    object QryTariffHistREASON: TStringField
      DisplayLabel = 'Reason'
      DisplayWidth = 10
      FieldName = 'REASON'
      Origin = 'h.REASON'
      Size = 2000
    end
    object QryTariffHistDATE_CHANGED: TDateTimeField
      DisplayLabel = 'Change Date/Time'
      DisplayWidth = 18
      FieldName = 'DATE_CHANGED'
      Origin = 'h.DATE_CHANGED'
    end
    object QryTariffHistUSERID: TStringField
      DisplayLabel = 'User ID'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'h.USERID'
      Size = 35
    end
    object QryTariffHistOLD_CODE: TStringField
      DisplayLabel = 'Old Tariff'
      DisplayWidth = 50
      FieldName = 'OLD_CODE'
      Origin = 't1.code'
      Size = 25
    end
    object QryTariffHistNEW_CODE: TStringField
      DisplayLabel = 'New Tariff'
      DisplayWidth = 50
      FieldName = 'NEW_CODE'
      Origin = 't2.code'
      Size = 25
    end
    object QryTariffHistID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.TARIFF_CODE_HISTORY.ID'
      Visible = False
      Size = 0
    end
    object QryTariffHistOLD_TARIFF_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'OLD_TARIFF_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryTariffHistARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'h.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryTariffHistNEW_TARIFF_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'NEW_TARIFF_CODE_ID'
      Origin = 'h.NEW_TARIFF_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryTariffHistOLD_DESCRIP: TStringField
      FieldName = 'OLD_DESCRIP'
      Origin = 't1.DESCRIP'
      Size = 50
    end
    object QryTariffHistNEW_DESCRIP: TStringField
      FieldName = 'NEW_DESCRIP'
      Origin = 't2.DESCRIP'
      Size = 50
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 200
    Top = 136
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
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
    ModuleName = 'Tariff History'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196399 $'
    BuildVersion = '176554'
    Left = 232
    Top = 80
  end
end
