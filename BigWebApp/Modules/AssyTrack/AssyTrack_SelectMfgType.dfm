inherited FrmAssyTrackSelectMfgType: TFrmAssyTrackSelectMfgType
  ExplicitWidth = 334
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited GroupBox1: TUniGroupBox
      inherited Splitter1: TUniSplitter
        Top = 179
        ExplicitTop = 179
      end
      inherited bvlSplitMfgtypeCell: TUniPanel
        Top = 182
        ExplicitTop = 182
      end
      inherited pnlMfgType: TUniPanel
        Height = 179
        ExplicitHeight = 179
        inherited bvlMfgType01: TUniPanel
          Height = 130
          ExplicitHeight = 130
        end
        inherited DBGridMfgType: TUniDBGrid
          Height = 130
          Columns = <
            item
              FieldName = 'MFGTYPE'
              Title.Caption = 'MfgType'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STANDARD_MFGTYPE'
              Title.Caption = 'Default (Base)'
              Width = 125
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      inherited pnlMfgCell: TUniPanel
        Top = 184
        Height = 241
        ExplicitTop = 184
        ExplicitHeight = 241
        inherited bvlMfgCell01: TUniPanel
          Height = 192
          ExplicitHeight = 192
        end
        inherited DBGridCell: TUniDBGrid
          Height = 192
          Columns = <
            item
              FieldName = 'MFGCELL'
              Title.Caption = 'MFG Cell'
              Width = 101
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'MFG Type'
              Width = 118
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PLANT_NAME'
              Title.Caption = 'EPlant Name'
              Width = 76
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
    end
  end
  inherited QryCell: TFDQuery
    SQL.Strings = (
      'select c.id as mfgcell_id,'
      '       c.mfgcell, '
      '       c.mfgtype,'
      '       m.descrip,'
      '       c.eplant_id,'
      '       e.name as plant_name'
      '  from v_mfgcell c, '
      '       mfgtype m,'
      '       eplant e'
      ' where c.mfgtype = m.mfgtype(+)'
      
        '   and rtrim(nvl(m.standard_mfgtype, m.mfgtype)) in ('#39'ASSY1'#39', '#39'A' +
        'SSY2'#39')'
      '   and c.eplant_id = e.id(+)'
      'order by mfgcell'
      ' ')
  end
  inherited QryMfgType: TFDQuery
    SQL.Strings = (
      'select * '
      '  from v_mfgtype_similar_to_assy1'
      ' order by mfgtype')
  end
end
