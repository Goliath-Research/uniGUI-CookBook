inherited FrmWorkCenterSelectMfgTypeAssy2: TFrmWorkCenterSelectMfgTypeAssy2
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    inherited GroupBox1: TUniGroupBox
      inherited pnlMfgType: TUniPanel
        inherited DBGridMfgType: TUniDBGrid
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
        inherited DBGridCell: TUniDBGrid
          Columns = <
            item
              FieldName = 'MFGCELL'
              Title.Caption = 'MFG Cell'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'MFG Type'
              Width = 96
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
      '   and c.eplant_id = e.id(+)'
      
        '   and mfg.lookup_mfgtype(c.mfgtype) in ('#39'ASSY2'#39', '#39'ASSY3'#39', '#39'COMP' +
        'LEX'#39')'
      'order by mfgcell'
      ' ')
  end
  inherited QryMfgType: TFDQuery
    SQL.Strings = (
      'select * from v_mfgtype_ex'
      ' where lookup_mfgtype in ('#39'ASSY2'#39', '#39'ASSY3'#39', '#39'COMPLEX'#39')'
      'order by mfgtype')
  end
end
