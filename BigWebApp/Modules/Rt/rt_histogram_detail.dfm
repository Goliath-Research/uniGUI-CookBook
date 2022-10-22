object TFrmRTHistogramDetail: TTFrmRTHistogramDetail
  Left = 408
  Top = 325
  ClientHeight = 104
  ClientWidth = 280
  Caption = 'RealTime Histogram Details'
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetails: TUniPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 104
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 280
      Height = 104
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      DataSource = SrcHistogram
      Items = <
        item
          DataSource = SrcHistogram
          DataField = 'PROD_DATE'
          Caption = 'Prod Date'
          Items = <
            item
              DataSource = SrcHistogram
              DataField = 'SHIFT'
              Caption = 'Shift'
              WordWrap = False
            end
            item
              DataSource = SrcHistogram
              DataField = 'DAYPROD_ID'
              Caption = 'Prod Rep ID'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = SrcHistogram
          DataField = 'START_TIME'
          Caption = 'Interval Start'
          WordWrap = False
        end
        item
          DataSource = SrcHistogram
          DataField = 'RAW_END_TIME'
          Caption = 'Interval End'
          WordWrap = False
        end
        item
          DataSource = SrcHistogram
          DataField = 'EVENT'
          Caption = 'Event'
          WordWrap = False
        end
        item
          DataSource = SrcHistogram
          DataField = 'STATE'
          Caption = 'State'
          WordWrap = False
        end>
      DefaultRowHeight = 18
      CaptionWidth = 87
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object SrcHistogram: TDataSource
    DataSet = QryHistogram
    Left = 97
    Top = 50
  end
  object QryHistogram: TFDQuery
    BeforeOpen = QryHistogramBeforeOpen
    AfterOpen = QryHistogramAfterOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select log.id,'
      '       log.hist_illum_rt_id,'
      '       log.dayprod_id,'
      '       log.prod_date,'
      '       log.shift,'
      '       log.start_time,'
      '       nvl(log.end_time, sysdate) as end_time,'
      '       log.end_time as raw_end_time,'
      '       log.event,'
      '       log.state'
      '  from '
      '       hist_illum_log log'
      ' where '
      '       log.id = :hist_illum_log_id'
      '')
    Left = 96
    Top = 69
    ParamData = <
      item
        Name = 'hist_illum_log_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHistogramID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryHistogramDAYPROD_ID: TBCDField
      FieldName = 'DAYPROD_ID'
      Size = 0
    end
    object QryHistogramPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object QryHistogramSHIFT: TBCDField
      FieldName = 'SHIFT'
      Size = 0
    end
    object QryHistogramSTART_TIME: TDateTimeField
      FieldName = 'START_TIME'
    end
    object QryHistogramEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
    object QryHistogramEVENT: TStringField
      FieldName = 'EVENT'
      Size = 30
    end
    object QryHistogramSTATE: TStringField
      FieldName = 'STATE'
    end
    object QryHistogramHIST_ILLUM_RT_ID: TBCDField
      FieldName = 'HIST_ILLUM_RT_ID'
      Size = 0
    end
    object QryHistogramRAW_END_TIME: TDateTimeField
      FieldName = 'RAW_END_TIME'
    end
  end
end
