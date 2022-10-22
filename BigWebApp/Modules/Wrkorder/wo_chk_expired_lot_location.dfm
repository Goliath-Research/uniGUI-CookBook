inherited FrmLotExpiredException: TFrmLotExpiredException
  ExplicitWidth = 413
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 40
        Caption = 'Location'
        ExplicitWidth = 40
      end
      inherited Label3: TUniLabel
        Width = 15
        Caption = 'Lot'
        ExplicitWidth = 15
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'LOC_DESC'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'LOTNO'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select loc_desc,'
      '       lotno,'
      '       :message_text as status_id'
      '  from v_fgmulti_locations'
      ' where id = :id'
      '')
    ParamData = <
      item
        Name = 'MESSAGE_TEXT'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
end
