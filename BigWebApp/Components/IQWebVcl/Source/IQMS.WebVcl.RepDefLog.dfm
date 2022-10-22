object FrmRepDefLog: TFrmRepDefLog
  Left = 199
  Top = 163
  ClientHeight = 353
  ClientWidth = 695
  Caption = 'Reports Execution Log'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 181
    Top = 0
    Width = 6
    Height = 353
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlCriteria: TUniPanel
    Left = 0
    Top = 0
    Width = 181
    Height = 353
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlClient01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 48
      Width = 179
      Height = 304
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 66
        Top = 1
        Width = 6
        Height = 302
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
        ExplicitLeft = 65
        ExplicitTop = 0
        ExplicitHeight = 306
      end
      object PnlLeft01: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 65
        Height = 302
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 304
        object Label4: TUniLabel
          Left = 8
          Top = 12
          Width = 50
          Height = 13
          Hint = ''
          Caption = 'From Date'
          TabOrder = 1
        end
        object Label5: TUniLabel
          Left = 8
          Top = 36
          Width = 38
          Height = 13
          Hint = ''
          Caption = 'To Date'
          TabOrder = 2
        end
      end
      object PnlClient02: TUniPanel
        Tag = 1999
        Left = 72
        Top = 1
        Width = 106
        Height = 302
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          106
          302)
        object DateTimePickerFrom: TUniDateTimePicker
          Left = 1
          Top = 8
          Width = 109
          Height = 21
          Hint = ''
          DateTime = 42647.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object DateTimePickerTo: TUniDateTimePicker
          Left = 1
          Top = 32
          Width = 111
          Height = 21
          Hint = ''
          DateTime = 42647.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object Panel16: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 179
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel17: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 177
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label6: TUniLabel
          Left = 1
          Top = 1
          Width = 97
          Height = 13
          Hint = ''
          Caption = 'Selection Criteria'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel4: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 177
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object PnlSelectedToolbuttons: TUniPanel
          Left = 151
          Top = 1
          Width = 26
          Height = 25
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object sbtnApply: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 23
            Hint = 'Apply selection criteria'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
              4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
              D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
              DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
              E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
              E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
              F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
              64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            TabOrder = 1
            OnClick = sbtnApplyClick
          end
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 187
    Top = 0
    Width = 508
    Height = 353
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 1
      Top = 155
      Width = 506
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 0
      ExplicitTop = 154
      ExplicitWidth = 508
    end
    object pnlDetail: TUniPanel
      Left = 1
      Top = 158
      Width = 506
      Height = 194
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      inline IQSearchDetail: TIQUniGridControl
        Left = 1
        Top = 21
        Width = 504
        Height = 172
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 21
        ExplicitWidth = 504
        ExplicitHeight = 172
        inherited PageControl: TUniPageControl
          Width = 504
          Height = 143
          ExplicitWidth = 504
          ExplicitHeight = 143
        end
        inherited TopToolBar: TUniToolBar
          Width = 504
        end
      end
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 504
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label2: TUniLabel
          Left = 1
          Top = 1
          Width = 39
          Height = 13
          Hint = ''
          Caption = 'Details'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 506
      Height = 22
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label3: TUniLabel
        Left = 1
        Top = 1
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Summary'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object pnlMain: TUniPanel
      Left = 1
      Top = 23
      Width = 506
      Height = 132
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      inline IQSearchMain: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 504
        Height = 130
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 504
        ExplicitHeight = 130
        inherited PageControl: TUniPageControl
          Width = 504
          Height = 101
          ExplicitWidth = 504
          ExplicitHeight = 101
        end
        inherited TopToolBar: TUniToolBar
          Width = 504
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 30
    Top = 201
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SrcMain: TDataSource
    DataSet = QryMain
    Left = 195
    Top = 98
  end
  object QryMain: TFDQuery
    Tag = 1
    BeforeOpen = QryMainBeforeOpen
    BeforeScroll = QryMainBeforeScroll
    AfterScroll = QryMainAfterScroll
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select repname,'
      '       exec_count,'
      '       last_exec_date,'
      '       longest_exe_time'
      '  from '
      '      ( select repname,'
      '         count(*) as exec_count,'
      '         max(timestamp) as last_exec_date,'
      '         max(exec_time) as longest_exe_time'
      '    from repdef_log'
      '   where timestamp between :from_date and :to_date'
      '   group by repname )'
      '   '
      ''
      ''
      '')
    Left = 195
    Top = 109
    ParamData = <
      item
        Name = 'from_date'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'to_date'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QryMainREPNAME: TStringField
      DisplayLabel = 'Report Name'
      DisplayWidth = 34
      FieldName = 'REPNAME'
      Origin = 'repname'
      Size = 50
    end
    object QryMainEXEC_COUNT: TFMTBCDField
      DisplayLabel = 'Executed'
      DisplayWidth = 10
      FieldName = 'EXEC_COUNT'
      Origin = 'EXEC_COUNT'
      Size = 38
    end
    object QryMainLAST_EXEC_DATE: TDateTimeField
      DisplayLabel = 'Last Executed'
      DisplayWidth = 20
      FieldName = 'LAST_EXEC_DATE'
      Origin = 'LAST_EXEC_DATE'
    end
    object QryMainLONGEST_EXE_TIME: TFMTBCDField
      DisplayLabel = 'Longest Execution'
      DisplayWidth = 16
      FieldName = 'LONGEST_EXE_TIME'
      Origin = 'LONGEST_EXE_TIME'
      Size = 38
    end
  end
  object SrcDetails: TDataSource
    DataSet = QryDetails
    Left = 251
    Top = 98
  end
  object QryDetails: TFDQuery
    Tag = 1
    MasterSource = SrcMain
    MasterFields = 'REPNAME'
    ConnectionName = 'IQFD'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       user_name,'
      '       timestamp,'
      '       exec_time,'
      '       destination'
      '  from repdef_log'
      ' where repname = :repname'
      '')
    Left = 251
    Top = 110
    ParamData = <
      item
        Name = 'REPNAME'
        DataType = ftString
        ParamType = ptInput
        Size = 51
        Value = Null
      end>
    object QryDetailsID: TBCDField
      DisplayLabel = 'Log ID'
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'id'
      Size = 0
    end
    object QryDetailsUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 22
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Size = 35
    end
    object QryDetailsTIMESTAMP: TDateTimeField
      DisplayLabel = 'Executed On'
      DisplayWidth = 20
      FieldName = 'TIMESTAMP'
      Origin = 'TIMESTAMP'
    end
    object QryDetailsEXEC_TIME: TFMTBCDField
      DisplayLabel = 'Execution Time'
      DisplayWidth = 13
      FieldName = 'EXEC_TIME'
      Origin = 'EXEC_TIME'
      Size = 6
    end
    object QryDetailsDESTINATION: TStringField
      DisplayLabel = 'Destination'
      DisplayWidth = 50
      FieldName = 'DESTINATION'
      Origin = 'DESTINATION'
      Size = 2000
    end
  end
end
