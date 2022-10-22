object FrmEmpPrePostShiftSched: TFrmEmpPrePostShiftSched
  Left = 258
  Top = 187
  ClientHeight = 360
  ClientWidth = 470
  Caption = 'Shift'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 282
    Width = 470
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 130
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 609
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 468
      Height = 128
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Settings '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object PnlSettingsInner: TUniPanel
        Tag = 1999
        Left = 2
        Top = 15
        Width = 464
        Height = 111
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 337
          Top = 0
          Width = 4
          Height = 111
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlSettingsLeft2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 337
          Height = 109
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 122
            Top = 0
            Width = 4
            Height = 109
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlSettingsLeft1: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 122
            Height = 107
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 12
              Width = 53
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Description'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 34
              Width = 108
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Round to Nearest (m.)'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 8
              Top = 56
              Width = 86
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Break Length (m.)'
              TabOrder = 3
            end
          end
          object PnlSettingsClient1: TUniPanel
            Tag = 1999
            Left = 126
            Top = 1
            Width = 211
            Height = 107
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              211
              107)
            object dbDescrip: TUniDBEdit
              Left = 1
              Top = 10
              Width = 204
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'DESCRIP'
              DataSource = SrcSet
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              TabStop = False
              Color = clBtnFace
            end
            object dbRoundTm: TUniDBEdit
              Left = 1
              Top = 32
              Width = 86
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'ROUNDTM'
              DataSource = SrcSet
              TabOrder = 1
              TabStop = False
              Color = clBtnFace
            end
            object dbBreak: TUniDBEdit
              Left = 1
              Top = 54
              Width = 86
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'PAYBREAKTM'
              DataSource = SrcSet
              TabOrder = 2
              TabStop = False
              Color = clBtnFace
            end
          end
        end
        object PnlSettingsClient3: TUniPanel
          Tag = 1999
          Left = 341
          Top = 1
          Width = 123
          Height = 109
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter4: TUniSplitter
            Left = 149
            Top = 0
            Width = 4
            Height = 109
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlSettingsLeft3: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 149
            Height = 107
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label4: TUniLabel
              Left = 8
              Top = 12
              Width = 135
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Pay for Non-Scheduled Time'
              TabOrder = 1
            end
            object Label5: TUniLabel
              Left = 8
              Top = 34
              Width = 65
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Pay Overtime'
              TabOrder = 2
            end
            object Label6: TUniLabel
              Left = 8
              Top = 56
              Width = 116
              Height = 13
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Clock IN/OUT for Breaks'
              TabOrder = 3
            end
          end
          object PnlSettingsClient2: TUniPanel
            Tag = 1999
            Left = 153
            Top = 1
            Width = 105
            Height = 107
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object dbPayNS: TUniDBEdit
              Left = 8
              Top = 10
              Width = 34
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'PAYNS'
              DataSource = SrcSet
              TabOrder = 0
              TabStop = False
              Color = clBtnFace
            end
            object dbOt: TUniDBEdit
              Left = 8
              Top = 32
              Width = 34
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'PAYOT'
              DataSource = SrcSet
              TabOrder = 1
              TabStop = False
              Color = clBtnFace
            end
            object dbClockInBreaks: TUniDBEdit
              Left = 8
              Top = 54
              Width = 34
              Height = 19
              Cursor = crArrow
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              DataField = 'CLOCK_IN_BREAK'
              DataSource = SrcSet
              TabOrder = 2
              TabStop = False
              Color = clBtnFace
            end
          end
        end
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 286
    Width = 470
    Height = 74
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object gridSched: TUniDBGrid
      Left = 1
      Top = 54
      Width = 468
      Height = 20
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = SrcSched
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'START_TIME'
          Title.Caption = 'Start Time'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_TIME'
          Title.Caption = 'End Time'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 468
      Height = 54
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 466
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label7: TUniLabel
          Left = 1
          Top = 1
          Width = 96
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Shift Time Blocks'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel7: TUniPanel
        Tag = 1999
        Left = 1
        Top = 25
        Width = 466
        Height = 29
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object NavSched: TUniDBNavigator
          Left = 366
          Top = 1
          Width = 100
          Height = 27
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcSched
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object PnlSchedule: TUniPanel
    Tag = 1999
    Left = 0
    Top = 130
    Width = 470
    Height = 152
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object grid: TUniDBGrid
      Left = 1
      Top = 54
      Width = 468
      Height = 98
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = Src
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Columns = <
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Shift'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'START_DATE'
          Title.Caption = 'Start Date'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'END_DATE'
          Title.Caption = 'End Date'
          Width = 112
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 468
      Height = 54
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object PnlToolbarCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 466
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblCaptionLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 80
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Shift Schedule'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object PnlToolbarInner: TUniPanel
        Tag = 1999
        Left = 1
        Top = 25
        Width = 466
        Height = 29
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Nav: TUniDBNavigator
          Left = 366
          Top = 1
          Width = 100
          Height = 27
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ShowHint = True
          ParentShowHint = False
          DataSource = Src
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 24
    Top = 128
  end
  object Qry: TFDQuery
    OnCalcFields = QryCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.*,'
      '       s.descrip,'
      '       s.id as shift_id'
      '  from V_TA_EMP_SCHED v,'
      '       ta_shift s'
      'where v.id = :nId'
      '  and v.ta_shift_id = s.id'
      '  and :dDate between Trunc(v.start_date)'
      '                      and Trunc(Trunc(v.end_date) - 1/86400) + 1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 128
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'dDate'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QrySTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
    end
    object QryTA_SHIFT_ID: TFMTBCDField
      FieldName = 'TA_SHIFT_ID'
      Size = 38
    end
    object QryEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object QryDESCRIP: TStringField
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QrySHIFT_ID: TBCDField
      FieldName = 'SHIFT_ID'
      Size = 0
    end
    object QryPROD_DATE: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'PROD_DATE'
      Calculated = True
    end
  end
  object SrcSched: TDataSource
    DataSet = QrySched
    Left = 152
    Top = 232
  end
  object QrySched: TFDQuery
    MasterSource = Src
    MasterFields = 'SHIFT_ID;PROD_DATE;START_DATE'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select *'
      '  from ta_calendar'
      'where ta_shift_id = :SHIFT_ID'
      '  and Trunc(start_time) = :PROD_DATE'
      '  and start_time >= :START_DATE'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 232
    ParamData = <
      item
        Name = 'SHIFT_ID'
        DataType = ftFloat
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'START_DATE'
        DataType = ftDateTime
      end>
  end
  object SrcSet: TDataSource
    DataSet = QrySet
    Left = 88
    Top = 128
  end
  object QrySet: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       decode(NVL(payot, '#39'N'#39'), '#39'N'#39', '#39'No'#39', '#39'Yes'#39') as payot,'
      '       decode(NVL(deductns, '#39'N'#39'), '#39'N'#39', '#39'No'#39', '#39'Yes'#39') as deductns,'
      '       NVL(roundtm, 0) as roundtm,'
      '       NVL(paybreaktm, 0) as paybreaktm,'
      '       descrip,'
      '       decode(NVL(payns, '#39'N'#39'), '#39'N'#39', '#39'No'#39', '#39'Yes'#39') as payns,'
      
        '       decode(NVL(clock_in_break, '#39'N'#39'), '#39'N'#39', '#39'No'#39', '#39'Yes'#39') as clo' +
        'ck_in_break'
      '  from ta_settings'
      ' where id = :nId'
      ' ')
    Left = 104
    Top = 128
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QrySetID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QrySetPAYOT: TStringField
      FieldName = 'PAYOT'
      Size = 3
    end
    object QrySetROUNDTM: TFMTBCDField
      FieldName = 'ROUNDTM'
      Size = 38
    end
    object QrySetPAYBREAKTM: TFMTBCDField
      FieldName = 'PAYBREAKTM'
      Size = 38
    end
    object QrySetDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object QrySetPAYNS: TStringField
      FieldName = 'PAYNS'
      Size = 3
    end
    object QrySetCLOCK_IN_BREAK: TStringField
      FieldName = 'CLOCK_IN_BREAK'
      Size = 3
    end
  end
end
