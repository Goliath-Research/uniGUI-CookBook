object FrmPOApproverTree: TFrmPOApproverTree
  Left = 210
  Top = 180
  ClientHeight = 111
  ClientWidth = 310
  Caption = 'PO Approver Tree'
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 310
    Height = 111
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 144
    Top = 48
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select SubStr(LPad('#39' '#39', (level-1) * 6) || user_name, 1, 35) as u' +
        'ser_name,'
      '       po_approver'
      '  from s_user_general'
      '  start with po_approver = :user_name'
      'connect by prior user_name = po_approver'
      ''
      ' ')
    Left = 152
    Top = 56
    ParamData = <
      item
        Name = 'user_name'
        DataType = ftString
        ParamType = ptInput
      end>
    object Query1USER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 40
      FieldName = 'USER_NAME'
      Size = 35
    end
    object Query1PO_APPROVER: TStringField
      DisplayLabel = 'PO Approver'
      DisplayWidth = 16
      FieldName = 'PO_APPROVER'
      Size = 35
    end
  end
end
