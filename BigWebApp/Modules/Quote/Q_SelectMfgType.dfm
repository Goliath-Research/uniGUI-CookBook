inherited FrmSelectionQuoteMfgType: TFrmSelectionQuoteMfgType
  Left = 167
  Top = 143
  ClientHeight = 505
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TUniPanel
    Top = 471
    ExplicitTop = 471
    inherited Panel3: TUniPanel
      ExplicitLeft = 104
    end
  end
  inherited Panel1: TUniPanel
    Height = 471
    ExplicitHeight = 471
    object Bevel1: TUniPanel [0]
      Left = 1
      Top = 33
      Width = 316
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    inherited GroupBox1: TUniGroupBox
      Top = 37
      Height = 433
      ExplicitTop = 37
      ExplicitHeight = 433
      inherited Splitter1: TUniSplitter
        ExplicitLeft = 0
        ExplicitTop = 210
      end
      inherited bvlSplitMfgtypeCell: TUniPanel
        ExplicitTop = 213
      end
      inherited pnlMfgType: TUniPanel
        inherited bvlMfgType01: TUniPanel
          ExplicitTop = 49
          ExplicitHeight = 161
        end
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
        inherited pnlMfgtypeSearch: TUniPanel
          ExplicitLeft = 18
          ExplicitTop = 22
          ExplicitWidth = 294
        end
      end
      inherited pnlMfgCell: TUniPanel
        Height = 201
        ExplicitHeight = 201
        inherited bvlMfgCell01: TUniPanel
          Height = 150
          ExplicitTop = 49
        end
        inherited DBGridCell: TUniDBGrid
          Height = 150
          Columns = <
            item
              FieldName = 'MFGCELL'
              Title.Caption = 'MFG Cell'
              Width = 64
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
        inherited pnlSearchMfgcell: TUniPanel
          inherited wwIncrementalSearchMfgcell: TwwIncrementalSearch
            ExplicitWidth = 294
          end
        end
      end
    end
    object pnlNote: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 316
      Height = 32
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblNote: TUniLabel
        Left = 1
        Top = 1
        Width = 331
        Height = 13
        Hint = ''
        Caption = 'New RFQ or RFQ place holder detected - you must provide MfgType.'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  inherited wwIncrementalSearchMfgType: TwwIncrementalSearch
    Left = 8
    Top = 39
    ExplicitLeft = 8
    ExplicitTop = 39
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
      '   and misc.eplant_filter( c.eplant_id ) = 1'
      'order by mfgcell'
      ' ')
  end
end
