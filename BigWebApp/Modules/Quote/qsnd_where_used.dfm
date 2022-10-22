object FrmQSndWhereUsed: TFrmQSndWhereUsed
  Left = 137
  Top = 236
  ClientHeight = 215
  ClientWidth = 552
  Caption = 'Where Used?'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Name = 'MS Sans Serif'
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAttachedMat: TUniPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 215
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 4
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object IQSearchOpMat: TIQUniGridControl
      Left = 1
      Top = 25
      Width = 550
      Height = 189
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Name = 'MS Sans Serif'
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 333
      IQComponents.Grid.Height = 103
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcBOM_OPMat
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcBOM_OPMat
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 333
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 103
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcBOM_OPMat
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 14
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 245
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object PnlToolbarCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 5
      Width = 550
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Name = 'MS Sans Serif'
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblCaptionLabel: TUniLabel
        Left = 1
        Top = 1
        Width = 71
        Height = 13
        Hint = ''
        Caption = 'Attached To'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object QryBOM_Opmat: TFDQuery
    BeforeOpen = QryBOM_OpmatBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select q.rfq,'
      '       q.id as quote_id,'
      '       part.id as qinvt_id,'
      '       part.class,'
      '       part.itemno,'
      '       part.rev,'
      '       part.descrip,'
      '       part.descrip2'
      '  from quote q, '
      '       qinvt part,'
      '       qptoper'
      ' where'
      '       q.id = part.quote_id'
      '   and part.id = qptoper.qinvt_id'
      '   and qptoper.qsndop_id = :sndop_id'
      '')
    Left = 154
    Top = 101
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryBOM_OpmatRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 20
      FieldName = 'RFQ'
      Origin = 'Q.RFQ'
      FixedChar = True
    end
    object QryBOM_OpmatITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'part.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryBOM_OpmatDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'part.DESCRIP'
      FixedChar = True
      Size = 100
    end
    object QryBOM_OpmatCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'part.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryBOM_OpmatREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'part.REV'
      FixedChar = True
      Size = 15
    end
    object QryBOM_OpmatDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'part.DESCRIP2'
      Size = 100
    end
    object QryBOM_OpmatQUOTE_ID: TBCDField
      FieldName = 'QUOTE_ID'
      Origin = 'Q.ID'
      Visible = False
      Size = 0
    end
    object QryBOM_OpmatQINVT_ID: TBCDField
      FieldName = 'QINVT_ID'
      Origin = 'part.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcBOM_OPMat: TDataSource
    DataSet = QryBOM_Opmat
    Left = 155
    Top = 146
  end
end
