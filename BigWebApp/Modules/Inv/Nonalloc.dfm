inherited NonAllocateTable: TNonAllocateTable
  Left = 315
  Top = 134
  HelpContext = 1096613
  Caption = 'Non Allocate Codes'
  ExplicitWidth = 302
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited IQSearch1: TIQUniGridControl
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 278
    IQComponents.FormTab.ExplicitHeight = 213
    Columns = <
      item
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'DBNavigator'
      'DataSource1')
    SecurityCode = 'NONALLOCATETABLE'
  end
  inherited Query1: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'non_allocate'
    SQL.Strings = (
      'select id, '
      'code, '
      'descrip,'
      #39'N'#39' as pk_hide'
      'from non_allocate')
    inherited Query1PK_HIDE: TStringField
      Origin = ''
      Visible = False
    end
  end
  inherited UpdateSQL1: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into non_allocate'
      '  (ID, CODE, DESCRIP)'
      'values'
      '  (:NEW_ID, :CODE, :DESCRIP)')
    ModifySQL.Strings = (
      'update non_allocate'
      'set'
      '  CODE = :CODE,'
      '  DESCRIP = :DESCRIP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from non_allocate'
      'where'
      '  ID = :OLD_ID')
  end
end
