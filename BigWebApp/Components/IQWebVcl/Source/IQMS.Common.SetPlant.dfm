object FrmChangePlantID: TFrmChangePlantID
  Left = 163
  Top = 170
  ClientHeight = 142
  ClientWidth = 330
  Caption = 'Assign Plant Designation'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 8
    Top = 8
    Width = 313
    Height = 97
    Hint = ''
    TabOrder = 1
    Caption = ''
  end
  object btnCancel: TUniButton
    Left = 207
    Top = 111
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 2
  end
  object wwcombPlant: TUniDBLookupComboBox
    Left = 26
    Top = 70
    Width = 279
    Height = 21
    Hint = ''
    ListField = 'PLANT_ID;PLANT_NAME'
    ListSource = dsEPlants
    KeyField = 'PLANT_ID'
    ListFieldIndex = 0
    DataField = 'EPLANT_ID'
    DataSource = dsTarget
    TabOrder = 0
    Color = clWindow
  end
  object btnOK: TUniButton
    Left = 55
    Top = 111
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
  end
  object rgrp: TUniRadioGroup
    Left = 8
    Top = 8
    Width = 105
    Height = 56
    Hint = ''
    Items.Strings = (
      'Unassign'
      'One Plant')
    ItemIndex = 0
    Caption = ''
    TabOrder = 4
    OnClick = rgrpClick
  end
  object qryEPlants: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.code as ecode,'
      '       c.company as company_name,'
      '       p.id as plant_id,'
      '       p.name as plant_name'
      '  from ecompany c,'
      '       eplant p'
      ' where c.id = p.ecompany_id'
      ' order by p.name')
    Left = 232
    Top = 13
    object qryEPlantsPLANT_NAME: TStringField
      DisplayLabel = 'Plant Name'
      DisplayWidth = 15
      FieldName = 'PLANT_NAME'
      Origin = 'EPLANT.NAME'
      Size = 30
    end
    object qryEPlantsECODE: TStringField
      DisplayLabel = 'ECode'
      DisplayWidth = 5
      FieldName = 'ECODE'
      Origin = 'ECOMPANY.CODE'
      Size = 10
    end
    object qryEPlantsCOMPANY_NAME: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY_NAME'
      Origin = 'ECOMPANY.COMPANY'
      Size = 60
    end
    object qryEPlantsPLANT_ID: TBCDField
      DisplayLabel = 'Plant ID'
      DisplayWidth = 5
      FieldName = 'PLANT_ID'
      Origin = 'EPLANT.ID'
      Size = 0
    end
  end
  object dsEPlants: TDataSource
    DataSet = qryEPlants
    Left = 168
    Top = 16
  end
  object dsTarget: TDataSource
    Left = 112
    Top = 16
  end
end
