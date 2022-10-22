inherited FrmBoilerPlatesViewSelect: TFrmBoilerPlatesViewSelect
  Left = 194
  Top = 210
  Caption = 'View/Select Boiler Plate'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    inherited PnlHeader: TUniPanel
      inherited PageControl1: TUniPageControl
        ActivePage = TabSheet2
        inherited TabSheet1: TUniTabSheet
          inherited PnlClient01: TUniPanel
            inherited PnlClient02: TUniPanel
              inherited dbcombType: TUniDBComboBox
                Width = 145
                Items.Strings = (
                  'PO'
                  'PACKING SLIP'
                  'OE'
                  'RFQ')
                ExplicitWidth = 145
              end
              inherited dbeDescription: TUniDBEdit
                Width = 346
                ExplicitWidth = 346
              end
              inherited dbeID: TUniDBEdit
                Width = 145
                ExplicitWidth = 145
              end
            end
          end
        end
        inherited TabSheet2: TUniTabSheet
          inherited DBGrid1: TUniDBGrid
            Columns = <
              item
                FieldName = 'ID'
                Title.Caption = 'ID'
                Width = 64
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 209
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'TYPE'
                Title.Caption = 'Type'
                Width = 94
                ReadOnly = True
                CheckBoxField.FieldValues = 'true;false'
              end>
          end
        end
      end
    end
    inherited dbreText: TDBRichEdit
      Height = 158
      PopupMenu = PopupMenu1
      ExplicitLeft = 1
      ExplicitTop = 125
      ExplicitHeight = 158
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 283
      Width = 445
      Height = 41
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object Panel4: TUniPanel
        Left = 236
        Top = 1
        Width = 208
        Height = 39
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnSelect: TUniButton
          Left = 1
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Select'
          ModalResult = 1
          TabOrder = 1
          OnClick = btnSelectClick
        end
        object btnClose: TUniButton
          Left = 105
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Close'
          ModalResult = 2
          TabOrder = 2
        end
      end
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 192
    Top = 136
    object CheckSpelling1: TUniMenuItem
      Caption = 'Check Spelling'
      ShortCut = 118
      OnClick = CheckSpelling1Click
    end
  end
end
