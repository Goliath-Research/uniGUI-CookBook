inherited FrmExistingLocksEx: TFrmExistingLocksEx
  ExplicitWidth = 574
  ExplicitHeight = 311
  PixelsPerInch = 96
  TextHeight = 13
  inherited wwDBGrid1: TIQUniGridControl
    Top = 30
    Height = 242
    IQComponents.Grid.Height = 156
    IQComponents.HiddenPanel.Height = 156
    IQComponents.HiddenPanel.ExplicitHeight = 156
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 550
    IQComponents.FormTab.ExplicitHeight = 185
    Columns = <
      item
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 30
    ExplicitHeight = 242
    Marker = 0
  end
  inherited Panel1: TUniPanel
    Height = 30
    ExplicitHeight = 30
    inherited DBNavigator1: TUniDBNavigator
      Height = 28
      ExplicitHeight = 28
    end
    object wwDBComboBox1: TUniDBComboBox
      Left = 4
      Top = 4
      Width = 163
      Height = 21
      Hint = ''
      Style = csDropDownList
      Items.Strings = (
        'IQMS-IQWin32'
        'IQMS-IRV32'
        'IQMS-Capacity'
        'IQMS-FRL'
        'IQMS-EXP'
        'IQMS-DOC_LIBRARY'
        'IQMS-EXTERNAL_DOC'
        'IQMS-AR_POST_ALL'
        'IQMS-EDI_CONVERT'
        'IQMS-PLM_PROJECT'
        'IQMS_OE_COMPRESS'
        'IQMS_PO_COMPRESS'
        'IQMS_DOC_SEARCH_INDEX'
        'IQMS_PIT')
      ItemIndex = 0
      TabOrder = 1
      OnCloseUp = wwDBComboBox1CloseUp
    end
  end
end
