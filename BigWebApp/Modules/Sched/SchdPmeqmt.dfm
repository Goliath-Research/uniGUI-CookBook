inherited FrmSchdPmeqmt: TFrmSchdPmeqmt
  Left = 90
  Top = 174
  ClientHeight = 288
  ClientWidth = 575
  Caption = 'Associated Tool Equipment #'
  OldCreateOrder = True
  ExplicitWidth = 591
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 575
    ExplicitWidth = 575
  end
  inherited Panel1: TUniPanel
    Width = 575
    ExplicitWidth = 575
    inherited DBNavigator1: TUniDBNavigator
      Left = 474
      Width = 100
      ExplicitLeft = 474
      ExplicitWidth = 100
    end
  end
  inherited wwDBGrid1: TIQUniGridControl
    Width = 575
    Height = 258
    IQComponents.Grid.Width = 358
    IQComponents.Grid.Height = 172
    IQComponents.Navigator.Width = 100
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    IQComponents.Navigator.ExplicitWidth = 100
    IQComponents.HiddenPanel.Left = 358
    IQComponents.HiddenPanel.Height = 172
    IQComponents.HiddenPanel.ExplicitLeft = 358
    IQComponents.HiddenPanel.ExplicitHeight = 172
    IQComponents.FormTab.ExplicitWidth = 567
    IQComponents.FormTab.ExplicitHeight = 201
    ExplicitWidth = 575
    ExplicitHeight = 258
    Marker = 0
  end
  inherited Query1: TFDQuery
    Active = True
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select b.id, '
      '       b.eqno,'
      '       b.location,'
      '       b.descrip,'
      '       b.service_date_out,'
      '       b.service_date_in'
      '  from standard_pmeqmt a,'
      '       pmeqmt b'
      ' where a.standard_id = :standard_id'
      '   and a.pmeqmt_id = b.id'
      ''
      ' '
      ' ')
    Top = 80
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1EQNO: TStringField
      DisplayLabel = 'Tool #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'IQ.PMEQMT.EQNO'
      FixedChar = True
      Size = 25
    end
    object Query1LOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 30
      FieldName = 'LOCATION'
      Origin = 'IQ.PMEQMT.LOCATION'
      Size = 30
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 38
      FieldName = 'DESCRIP'
      Origin = 'IQ.PMEQMT.DESCRIP'
      Size = 50
    end
    object Query1SERVICE_DATE_OUT: TDateTimeField
      DisplayLabel = 'Service OUT'
      DisplayWidth = 18
      FieldName = 'SERVICE_DATE_OUT'
      Origin = 'IQ.PMEQMT.SERVICE_DATE_OUT'
    end
    object Query1SERVICE_DATE_IN: TDateTimeField
      DisplayLabel = 'Service IN'
      DisplayWidth = 18
      FieldName = 'SERVICE_DATE_IN'
      Origin = 'IQ.PMEQMT.SERVICE_DATE_IN'
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PMEQMT.ID'
      Visible = False
      Size = 0
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To MRO'
    end
  end
  inherited IQJump1: TIQWebJump
    DataField = 'ID'
    JumpTo = jtPM
  end
end
