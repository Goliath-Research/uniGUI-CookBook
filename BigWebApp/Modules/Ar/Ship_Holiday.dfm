object FrmShipHoliday: TFrmShipHoliday
  Left = 78
  Top = 173
  HelpContext = 1136640
  ClientHeight = 183
  ClientWidth = 425
  Caption = 'Shipping/Receiving Holidays'
  OnShow = FormShow
  OldCreateOrder = False
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 425
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnRecalcMustShipDate: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Recalculate Must Ship Date for all sales orders'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C21E0000C21E00000001000000000000000000008000
        0000823C1B0091631600FF00FF00F8E0AF00FAE5BD00C0C0C000FAEBC900FBEF
        D900FBF0D800FCF5E500FDF9EF00FEFCF800FFFFFF0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0303030303030303030404040404040305050505050505050503040404040403
        06020606020606020603040404040403080E08080E08080E0803000000000003
        09090909090A090A0A030007070707030B020B0B020B0B020B0300070E070E03
        0C0E0C0C0E0C0C0E0C030007070707030D0D0D0D0D0D0D0D0D0300070E070E03
        0E020808080808080E030007070707030E020E0E0E0E0E080E0300070E070E03
        0E020202020202020E030007070707030E0E0E0E0E0E0E0E0E0300070E070E07
        0303030303030303030400070707070707070707070004040404010101010101
        0101010101010404040401010101010101010101010104040404}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRecalcMustShipDateClick
    end
    object NavMain: TUniDBNavigator
      Left = 200
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcShip_Calendar
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 425
    Height = 153
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 208
    IQComponents.Grid.Height = 67
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcShip_Calendar
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
    IQComponents.Navigator.DataSource = SrcShip_Calendar
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 208
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 67
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcShip_Calendar
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Holiday Description'
        Width = 196
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'START_TIME'
        Title.Caption = 'From'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_TIME'
        Title.Caption = 'To'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXCLUDE_TRANSIT'
        Title.Caption = 'Exclude Transit'
        Width = 98
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
      PendingWork.Strings = (
        'Field <EPLANT_ID> has custom editor <wwDBComboDlgEPlant>'
      )
    ExplicitTop = 32
    Marker = 0
  end
  object wwDBComboDlgEPlant: TUniEdit
    Left = 147
    Top = 75
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object SrcShip_Calendar: TDataSource
    DataSet = TblShip_Calendar
    Left = 35
    Top = 74
  end
  object TblShip_Calendar: TFDQuery
    BeforePost = TblShip_CalendarBeforePost
    OnNewRecord = TblShip_CalendarNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIP_CALENDAR'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      '  SELECT id,'
      '         descrip,'
      '         start_time,'
      '         end_time,'
      '         exclude_transit,'
      '         eplant_id'
      '    FROM ship_calendar'
      'ORDER BY start_time'
      '')
    Left = 35
    Top = 91
    object TblShip_CalendarDESCRIP: TStringField
      DisplayLabel = 'Holiday Description'
      DisplayWidth = 28
      FieldName = 'DESCRIP'
      Required = True
      Size = 50
    end
    object TblShip_CalendarSTART_TIME: TDateTimeField
      DisplayLabel = 'From'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      Required = True
    end
    object TblShip_CalendarEND_TIME: TDateTimeField
      DisplayLabel = 'To'
      DisplayWidth = 18
      FieldName = 'END_TIME'
    end
    object TblShip_CalendarEXCLUDE_TRANSIT: TStringField
      DisplayLabel = 'Exclude Transit'
      DisplayWidth = 14
      FieldName = 'EXCLUDE_TRANSIT'
      FixedChar = True
      Size = 1
    end
    object TblShip_CalendarEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblShip_CalendarID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 78
    Top = 74
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmShipHoliday'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 188242 $'
    BuildVersion = '176554'
    Left = 108
    Top = 74
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO SHIP_CALENDAR'
      '(ID, DESCRIP, START_TIME, END_TIME, EXCLUDE_TRANSIT, '
      '  EPLANT_ID)'
      
        'VALUES (:NEW_ID, :NEW_DESCRIP, :NEW_START_TIME, :NEW_END_TIME, :' +
        'NEW_EXCLUDE_TRANSIT, '
      '  :NEW_EPLANT_ID)')
    ModifySQL.Strings = (
      'UPDATE SHIP_CALENDAR'
      
        'SET ID = :NEW_ID, DESCRIP = :NEW_DESCRIP, START_TIME = :NEW_STAR' +
        'T_TIME, '
      
        '  END_TIME = :NEW_END_TIME, EXCLUDE_TRANSIT = :NEW_EXCLUDE_TRANS' +
        'IT, '
      '  EPLANT_ID = :NEW_EPLANT_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM SHIP_CALENDAR'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, DESCRIP, START_TIME, END_TIME, EXCLUDE_TRANSIT, EPLAN' +
        'T_ID'
      'FROM SHIP_CALENDAR'
      'WHERE ID = :ID')
    Left = 32
    Top = 136
  end
end
