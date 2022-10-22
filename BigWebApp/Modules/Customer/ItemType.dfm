inherited FrmItem_Type: TFrmItem_Type
  Left = 314
  Top = 213
  HelpContext = 1463919
  Caption = 'Items Tier Type'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited TblTypes: TFDTable
    UpdateOptions.UpdateTableName = 'ITEM_TYPE'
    TableName = 'ITEM_TYPE'
  end
end
