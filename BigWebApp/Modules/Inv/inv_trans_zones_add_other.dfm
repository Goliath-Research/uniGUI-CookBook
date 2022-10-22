object FrmInvZonesAddOther: TFrmInvZonesAddOther
  Left = 0
  Top = 0
  ClientHeight = 490
  ClientWidth = 920
  Caption = 'Add Locations From Other Zones'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 85
    Width = 920
    Height = 361
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 691
    ExplicitHeight = 314
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 918
      Height = 359
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 701
      IQComponents.Grid.Height = 273
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcInvZones
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
      IQComponents.Navigator.DataSource = SrcInvZones
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 701
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 273
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 472
      IQComponents.HiddenPanel.ExplicitHeight = 226
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 681
      IQComponents.FormTab.ExplicitHeight = 255
      DataSource = SrcInvZones
      Columns = <
        item
          FieldName = 'CODE'
          Title.Caption = 'Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Zone Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DIVISION_NAME'
          Title.Caption = 'Division Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZONE_TYPE_DISP'
          Title.Caption = 'Zone Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitLeft = 2
      ExplicitTop = -1
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 446
    Width = 920
    Height = 44
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 399
    ExplicitWidth = 691
    object Panel4: TUniPanel
      Left = 694
      Top = 1
      Width = 226
      Height = 42
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 465
      object btnOK: TUniButton
        Left = 5
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 116
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 920
    Height = 82
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 691
    object GroupBox1: TUniGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 6
      Width = 914
      Height = 73
      Hint = ''
      Margins.Top = 6
      Caption = '  Update Criteria  '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitWidth = 685
      object rbtnBlankLocations: TUniRadioButton
        Left = 32
        Top = 21
        Width = 193
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Only add locations with blank zone'
        TabOrder = 0
      end
      object rbtnAllLocations: TUniRadioButton
        Left = 32
        Top = 44
        Width = 225
        Height = 17
        Hint = ''
        Caption = 'Add all locations that match selected zones'
        TabOrder = 1
      end
    end
  end
  object SrcInvZones: TDataSource
    DataSet = QryInvZones
    Left = 96
    Top = 174
  end
  object QryInvZones: TFDQuery
    BeforeOpen = QryInvZonesBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select z.id as id, '
      '       z.code as code, '
      '       z.descrip as descrip,'
      '       z.eplant_id as eplant_id,'
      '       d.name as division_name,'
      '       case '
      '         when z.zone_type = '#39'LO'#39' then '#39'Locating Zone'#39
      '         when z.zone_type = '#39'AL'#39' then '#39'Allocating Zone'#39
      '         when z.zone_type = '#39'DZ'#39' then '#39'Drop Zone'#39
      '         when z.zone_type = '#39'WK'#39' then '#39'Work Zone'#39
      '       end as zone_type_disp'
      '            '
      '  from inv_zone z,'
      '       division d'
      ' where '
      '       (:eplant_id = 0'
      '        or'
      '        z.eplant_id is null'
      '        or'
      '        z.eplant_id = :eplant_id)'
      '        '
      '   and (:division_id = 0'
      '        or'
      '        z.division_id is null'
      '        or'
      '        z.division_id = :division_id)'
      ''
      '   and z.zone_type <> :zone_type'
      ''
      '   and z.division_id = d.id(+)'
      '')
    Left = 96
    Top = 206
    ParamData = <
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'zone_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryInvZonesCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'z.code'
      Size = 25
    end
    object QryInvZonesDESCRIP: TStringField
      DisplayLabel = 'Zone Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'z.descrip'
      Size = 100
    end
    object QryInvZonesEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'z.rplant_id'
      Size = 0
    end
    object QryInvZonesDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object QryInvZonesZONE_TYPE_DISP: TStringField
      DisplayLabel = 'Zone Type'
      DisplayWidth = 15
      FieldName = 'ZONE_TYPE_DISP'
      Origin = 
        'case when z.zone_type = '#39'LO'#39' then '#39'Locating Zone'#39'  when z.zone_t' +
        'ype = '#39'AL'#39' then '#39'Allocating Zone'#39' when z.zone_type = '#39'DZ'#39' then '#39 +
        'Drop Zone'#39' when z.zone_type = '#39'WK'#39' then '#39'Work Zone'#39' end'
      Size = 15
    end
    object QryInvZonesID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'z.id'
      Visible = False
      Size = 0
    end
  end
end
