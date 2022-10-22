object FrmHPickSortCriteriaPickList: TFrmHPickSortCriteriaPickList
  Left = 0
  Top = 0
  ClientHeight = 358
  ClientWidth = 399
  Caption = 'Select Sort Criteria'
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ActiveControl = wwDBGrid1
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 399
    Height = 358
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Panel2: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 397
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavMain: TUniDBNavigator
        Left = 347
        Top = 1
        Width = 50
        Height = 25
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = srcFilters
        VisibleButtons = [nbInsert, nbDelete]
        ConfirmDelete = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object pnlBottom: TUniPanel
      Tag = 1999
      Left = 1
      Top = 318
      Width = 397
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 319
      object Panel1: TUniPanel
        Left = 204
        Top = 1
        Width = 193
        Height = 37
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 1
          Top = 8
          Width = 90
          Height = 25
          Hint = ''
          Caption = 'OK'
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 96
          Top = 8
          Width = 90
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 2
        end
      end
    end
    object pnlGrid: TUniPanel
      Left = 1
      Top = 28
      Width = 397
      Height = 290
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      inline wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 395
        Height = 288
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 395
        ExplicitHeight = 288
        inherited PageControl: TUniPageControl
          Width = 395
          Height = 259
          ExplicitWidth = 395
          ExplicitHeight = 259
        end
        inherited TopToolBar: TUniToolBar
          Width = 395
        end
      end
    end
  end
  object cdsCriterias: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CRITERIA_NAME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeInsert = cdsCriteriasBeforeInsert
    BeforeDelete = cdsCriteriasBeforeDelete
    Left = 72
    Top = 192
    object cdsCriteriasCRITERIA_NAME: TStringField
      FieldName = 'CRITERIA_NAME'
      Size = 60
    end
  end
  object srcFilters: TDataSource
    DataSet = cdsCriterias
    Left = 32
    Top = 128
  end
end
