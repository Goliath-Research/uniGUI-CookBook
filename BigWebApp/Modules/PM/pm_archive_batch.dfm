object FrmPMArchiveBatch: TFrmPMArchiveBatch
  Left = 273
  Top = 212
  HelpContext = 15592
  ClientHeight = 300
  ClientWidth = 555
  Caption = 'Archive Batch of MRO Work Orders'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 262
    Width = 555
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 346
      Top = 1
      Width = 208
      Height = 36
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 105
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = Exit1Click
      end
    end
  end
  object PnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 262
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 553
      Height = 260
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 336
      IQComponents.Grid.Height = 174
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
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
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 336
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 174
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'WO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_DATE'
          Title.Caption = 'WO Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'USERID'
          Title.Caption = 'Created By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEPARTMENT'
          Title.Caption = 'Department'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY'
          Title.Caption = 'Priority'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_TYPE'
          Title.Caption = 'WO Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'START_DATE'
          Title.Caption = 'Start Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_DATE'
          Title.Caption = 'End Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REQUESTED_BY'
          Title.Caption = 'Requested By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER1'
          Title.Caption = 'User Text 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER2'
          Title.Caption = 'User Text 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER3'
          Title.Caption = 'User Text 3'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER4'
          Title.Caption = 'User Text 4'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER5'
          Title.Caption = 'User Text 5'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER6'
          Title.Caption = 'User Text 6'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER7'
          Title.Caption = 'User Text 7'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER8'
          Title.Caption = 'User Text 8'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER9'
          Title.Caption = 'User Text 9'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER10'
          Title.Caption = 'User Text 10'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUSER1'
          Title.Caption = 'User Numeric 1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUSER2'
          Title.Caption = 'User Numeric 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUSER3'
          Title.Caption = 'User Numeric 3'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUSER4'
          Title.Caption = 'User Numeric 4'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NUSER5'
          Title.Caption = 'User Numeric 5'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 128
    Top = 64
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
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmPMArchiveBatch'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197388 $'
    BuildVersion = '176554'
    Left = 184
    Top = 64
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 232
    Top = 64
  end
  object QryData: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT a.id AS id, a.wo_date AS wo_date, a.userid AS userid,'
      
        '         a.department AS department, a.status AS status, a.prior' +
        'ity AS priority,'
      '         a.wo_type AS wo_type, a.start_date AS start_date,'
      
        '         a.end_date AS end_date, a.class AS class, a.eplant_id A' +
        'S eplant_id,'
      '         c.name AS eplant_name, a.requested_by AS requested_by,'
      
        '         a.cuser1 AS cuser1, a.cuser2 AS cuser2, a.cuser3 AS cus' +
        'er3,'
      
        '         a.cuser4 AS cuser4, a.cuser5 AS cuser5, a.cuser6 AS cus' +
        'er6,'
      
        '         a.cuser7 AS cuser7, a.cuser8 AS cuser8, a.cuser9 AS cus' +
        'er9,'
      
        '         a.cuser10 AS cuser10, a.nuser1 AS nuser1, a.nuser2 AS n' +
        'user2,'
      
        '         a.nuser3 AS nuser3, a.nuser4 AS nuser4, a.nuser5 AS nus' +
        'er5'
      '    FROM pmwo a, eplant c'
      '   WHERE c.id(+) = a.eplant_id AND'
      '         NVL(a.archived, '#39'N'#39') <> '#39'Y'#39' AND'
      '         misc.eplant_filter(a.eplant_id) = 1 AND'
      '         NOT EXISTS (SELECT 1'
      '                       FROM pmwo_dtl'
      '                      WHERE NVL(wo_open, '#39'N'#39') = '#39'Y'#39' AND'
      '                            pmwo_id = a.id AND'
      '                            ROWNUM < 2)')
    Left = 240
    Top = 72
    object QryDataID: TBCDField
      Tag = 1
      DisplayLabel = 'WO #'
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'a.id'
      Size = 0
    end
    object QryDataWO_DATE: TDateTimeField
      DisplayLabel = 'WO Date'
      DisplayWidth = 12
      FieldName = 'WO_DATE'
      Origin = 'a.wo_date'
    end
    object QryDataUSERID: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 12
      FieldName = 'USERID'
      Origin = 'a.userid'
      Size = 35
    end
    object QryDataDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 12
      FieldName = 'DEPARTMENT'
      Origin = 'a.department'
    end
    object QryDataSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 12
      FieldName = 'STATUS'
      Origin = 'a.status'
    end
    object QryDataPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 12
      FieldName = 'PRIORITY'
      Origin = 'a.priority'
    end
    object QryDataWO_TYPE: TStringField
      DisplayLabel = 'WO Type'
      DisplayWidth = 12
      FieldName = 'WO_TYPE'
      Origin = 'a.wo_type'
      Size = 35
    end
    object QryDataSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 12
      FieldName = 'START_DATE'
      Origin = 'a.start_date'
    end
    object QryDataEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 12
      FieldName = 'END_DATE'
      Origin = 'a.end_date'
    end
    object QryDataCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 12
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryDataEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Origin = 'c.name'
      Size = 30
    end
    object QryDataREQUESTED_BY: TStringField
      DisplayLabel = 'Requested By'
      DisplayWidth = 12
      FieldName = 'REQUESTED_BY'
      Origin = 'a.requested_by'
      Size = 35
    end
    object QryDataCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 12
      FieldName = 'CUSER1'
      Origin = 'a.cuser1'
      Size = 60
    end
    object QryDataCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 12
      FieldName = 'CUSER2'
      Origin = 'a.cuser2'
      Size = 60
    end
    object QryDataCUSER3: TStringField
      DisplayLabel = 'User Text 3'
      DisplayWidth = 12
      FieldName = 'CUSER3'
      Origin = 'a.cuser3'
      Size = 60
    end
    object QryDataCUSER4: TStringField
      DisplayLabel = 'User Text 4'
      DisplayWidth = 12
      FieldName = 'CUSER4'
      Origin = 'a.cuser4'
      Size = 60
    end
    object QryDataCUSER5: TStringField
      DisplayLabel = 'User Text 5'
      DisplayWidth = 12
      FieldName = 'CUSER5'
      Origin = 'a.cuser5'
      Size = 60
    end
    object QryDataCUSER6: TStringField
      DisplayLabel = 'User Text 6'
      DisplayWidth = 12
      FieldName = 'CUSER6'
      Origin = 'a.cuser6'
      Size = 60
    end
    object QryDataCUSER7: TStringField
      DisplayLabel = 'User Text 7'
      DisplayWidth = 12
      FieldName = 'CUSER7'
      Origin = 'a.cuser7'
      Size = 60
    end
    object QryDataCUSER8: TStringField
      DisplayLabel = 'User Text 8'
      DisplayWidth = 12
      FieldName = 'CUSER8'
      Origin = 'a.cuser8'
      Size = 60
    end
    object QryDataCUSER9: TStringField
      DisplayLabel = 'User Text 9'
      DisplayWidth = 12
      FieldName = 'CUSER9'
      Origin = 'a.cuser9'
      Size = 60
    end
    object QryDataCUSER10: TStringField
      DisplayLabel = 'User Text 10'
      DisplayWidth = 12
      FieldName = 'CUSER10'
      Origin = 'a.cuser10'
      Size = 60
    end
    object QryDataNUSER1: TFMTBCDField
      DisplayLabel = 'User Numeric 1'
      DisplayWidth = 12
      FieldName = 'NUSER1'
      Origin = 'nuser1'
      Size = 6
    end
    object QryDataNUSER2: TFMTBCDField
      DisplayLabel = 'User Numeric 2'
      DisplayWidth = 12
      FieldName = 'NUSER2'
      Origin = 'nuser2'
      Size = 6
    end
    object QryDataNUSER3: TFMTBCDField
      DisplayLabel = 'User Numeric 3'
      DisplayWidth = 12
      FieldName = 'NUSER3'
      Origin = 'nuser3'
      Size = 6
    end
    object QryDataNUSER4: TFMTBCDField
      DisplayLabel = 'User Numeric 4'
      DisplayWidth = 12
      FieldName = 'NUSER4'
      Origin = 'nuser4'
      Size = 6
    end
    object QryDataNUSER5: TFMTBCDField
      DisplayLabel = 'User Numeric 5'
      DisplayWidth = 12
      FieldName = 'NUSER5'
      Origin = 'nuser5'
      Size = 6
    end
    object QryDataEPLANT_ID: TBCDField
      Tag = 1
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Visible = False
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    OnPopup = PMainPopup
    Left = 156
    Top = 64
    object JumpToWorkOrder1: TUniMenuItem
      Caption = 'Jump to Work Order'
      OnClick = JumpToWorkOrder1Click
    end
  end
end
