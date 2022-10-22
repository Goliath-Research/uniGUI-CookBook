object FrmInvalidObjectWarning: TFrmInvalidObjectWarning
  Left = 241
  Top = 201
  ClientHeight = 371
  ClientWidth = 497
  Caption = 'Warning'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlWarning: TUniPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 108
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      497
      108)
    object CaptionPanel1: TIQWebCaptionPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 68
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = 'Invalid objects found!'
      ParentColor = True
      Text = 
        'Some objects are in invalid, not validated or disabled state. Pl' +
        'ease fix the problem and run DD to resolve dependencies.'
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000130B0000130B0000000000000000
        0000FFFFFFADAEAD632C316330316330316330315A30315A30315A3031633031
        633031633031633031632C296B1C18D6E3E763D3EF00B2DE00B2DE00B2DE00B2
        DE00B2DE00BAE700CBFF00B6E700B2DE00B2DE00B2DE00B6E700C3EF524552A5
        92945AD7F700C3EF00DBFF00D7FF00D7FF00DBFF18384A6304104A9EBD00D7FF
        00D7FF00D7FF08E3FF00CBF74A4D5AFFFFFFFFFFFF00C3E710E3FF00D7FF00D7
        FF00DBFF101821180000215D7B00D7FF00D7FF00D7FF18EFFF00E3FF843431FF
        FFFFFFFFFF00C7EF00D3F708E3FF00DBFF00DBFF00EFFF00F7FF00EBFF00DBFF
        00DBFF18F3FF00D7FF298A9CD6E7EFFFFFFFFFFFFFFFFFFF00CBEF10EFFF00DF
        FF00DFFF00E7FF42101800EBFF00DFFF00DFFF18FBFF00EBFF843431FFFFFFFF
        FFFFFFFFFFFFFFFF08D7EF00D7F708EBFF00E3FF00FFFF6B000000FBFF00E3FF
        10F7FF00D7FF298A94D6E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00CFE710F7
        FF00E7FF00EBFFBD596B00F7FF00E7FF18FFFF00EFFF842C21FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00D7EF00E7FF00F3FF00A2B56B203100CFE708F7FF
        00E7FF29969CD6E3E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00DB
        EF10FFFF00081039001021556B21FFFF00F7FF842018FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00DFEF00F3FF000000310008294D5A00F3FF
        21AAB5CEDBDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6EB
        EF00E3EF10FFFF00BAC621FFFF00FFFF7B1810FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00E3EF00F7FF08FFFF00FBFF18BABD
        CED3D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFCEEBEF00EBEF6BFFFF00FFFF7B1010FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F3F700FFFF21CBCEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF9CF3F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      PictureLayout = plImageRight
      LayoutStyle = lsWindowsXP
      DesignSize = (
        495
        68)
    end
    object btnDetails: TUniButton
      Left = 335
      Top = 76
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Details'
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnDetailsClick
    end
    object btnOK: TUniButton
      Left = 422
      Top = 76
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      Cancel = True
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnOKClick
    end
  end
  object pnlDetails: TUniPanel
    Left = 0
    Top = 108
    Width = 497
    Height = 263
    Hint = ''
    Visible = False
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 215
    object Label1: TUniLabel
      Left = 1
      Top = 5
      Width = 87
      Height = 13
      Hint = ''
      Caption = ' Invalid objects'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object Bevel2: TUniPanel
      Left = 1
      Top = 1
      Width = 495
      Height = 5
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 18
      Width = 495
      Height = 185
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 278
      IQComponents.Grid.Height = 99
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
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
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 278
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 99
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 51
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 80
      DataSource = DataSource1
      Columns = <
        item
          FieldName = 'OBJECT_NAME'
          Title.Caption = 'Name'
          Width = 203
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OBJECT_TYPE'
          Title.Caption = 'Type'
          Width = 133
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORIGIN'
          Title.Caption = 'Origin'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 137
      Marker = 0
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 203
      Width = 495
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 155
      DesignSize = (
        495
        41)
      object btnResolveDependency: TUniButton
        Left = 416
        Top = 9
        Width = 75
        Height = 25
        Hint = 'Attempt to resolve dependencies'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Resolve'
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnClick = btnResolveDependencyClick
      end
    end
    object StatusBar1: TUniStatusBar
      Left = 1
      Top = 244
      Width = 495
      Height = 19
      Hint = ''
      Panels = <
        item
          Width = 495
        end>
      SizeGrip = False
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      ExplicitTop = 196
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 73
    Top = 194
  end
  object Query1: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * '
      '  from '
      
        '       (select object_name, object_type, status, '#39'OBJECT'#39' as ori' +
        'gin'
      '          from all_objects'
      '         where owner = '#39'IQMS'#39' '
      
        '           and object_type in ( '#39'PROCEDURE'#39', '#39'FUNCTION'#39', '#39'VIEW'#39',' +
        ' '#39'PACKAGE'#39', '#39'PACKAGE BODY'#39', '#39'TRIGGER'#39' )'
      '           and status = '#39'INVALID'#39' '
      '        UNION ALL   '
      
        '        select constraint_name, table_name, status, '#39'CONSTRAINT'#39 +
        ' '
      '          from user_constraints    '
      '         where status = '#39'DISABLED'#39
      '        UNION ALL   '
      
        '        select constraint_name, table_name, validated, '#39'CONSTRAI' +
        'NT'#39' '
      '          from user_constraints '
      
        '         where validated = '#39'NOT VALIDATED'#39' and constraint_type <' +
        '> '#39'V'#39' )'
      '         '
      '             ')
    Left = 74
    Top = 205
    object Query1OBJECT_NAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 29
      FieldName = 'OBJECT_NAME'
      Origin = 'OBJECT_NAME'
      Size = 30
    end
    object Query1OBJECT_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 19
      FieldName = 'OBJECT_TYPE'
      Origin = 'OBJECT_TYPE'
      Size = 30
    end
    object Query1ORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 12
      FieldName = 'ORIGIN'
      Origin = 'origin'
      Size = 10
    end
    object Query1STATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 13
    end
  end
end
