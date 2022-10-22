inherited FrmWorkCenterSelectMfgType: TFrmWorkCenterSelectMfgType
  ClientHeight = 401
  ClientWidth = 298
  ExplicitWidth = 314
  ExplicitHeight = 440
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TUniPanel
    Top = 367
    Width = 298
    ExplicitTop = 367
    ExplicitWidth = 298
    inherited Panel3: TUniPanel
      Left = 83
      ExplicitLeft = 83
    end
  end
  inherited Panel1: TUniPanel
    Width = 298
    Height = 367
    ExplicitWidth = 298
    ExplicitHeight = 367
    inherited GroupBox1: TUniGroupBox
      Width = 296
      Height = 365
      ExplicitWidth = 296
      ExplicitHeight = 365
      inherited Splitter1: TUniSplitter
        Top = 194
        Width = 292
        ExplicitTop = 194
        ExplicitWidth = 292
      end
      inherited bvlSplitMfgtypeCell: TUniPanel
        Top = 197
        Width = 292
        ExplicitTop = 197
        ExplicitWidth = 292
      end
      inherited pnlMfgType: TUniPanel
        Width = 292
        Height = 179
        ExplicitWidth = 292
        ExplicitHeight = 179
        inherited bvlMfgType01: TUniPanel
          Height = 128
          ExplicitHeight = 128
        end
        inherited DBGridMfgType: TUniDBGrid
          Width = 272
          Height = 128
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
        inherited pnlMfgTypeRadioBtn: TUniPanel
          Width = 290
          ExplicitWidth = 290
        end
        inherited pnlMfgtypeSearch: TUniPanel
          Width = 272
          ExplicitWidth = 272
        end
      end
      inherited pnlMfgCell: TUniPanel
        Top = 199
        Width = 292
        Height = 164
        ExplicitTop = 199
        ExplicitWidth = 292
        ExplicitHeight = 164
        inherited bvlMfgCell01: TUniPanel
          Height = 113
          ExplicitHeight = 113
        end
        inherited DBGridCell: TUniDBGrid
          Width = 272
          Height = 113
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
        inherited pnlMfgCellRadioBtn: TUniPanel
          Width = 290
          ExplicitWidth = 290
        end
        inherited pnlSearchMfgcell: TUniPanel
          Width = 272
          ExplicitWidth = 272
          DesignSize = (
            272
            27)
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
      
        '   and mfg.lookup_mfgtype(c.mfgtype) not in ('#39'ASSY2'#39', '#39'ASSY3'#39', '#39 +
        'COMPLEX'#39')'
      'order by mfgcell'
      ' ')
  end
  inherited QryMfgType: TFDQuery
    SQL.Strings = (
      'select * from v_mfgtype_ex'
      ' where lookup_mfgtype not in ('#39'ASSY2'#39', '#39'ASSY3'#39', '#39'COMPLEX'#39')'
      'order by mfgtype')
  end
end
