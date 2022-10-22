object FrmHPickFilterPickList: TFrmHPickFilterPickList
  Left = 0
  Top = 0
  ClientHeight = 358
  ClientWidth = 257
  Caption = 'Select Advanced Filter'
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
    Width = 257
    Height = 358
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    Color = clWindow
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 255
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 282
      object NavMain: TUniDBNavigator
        Left = 197
        Top = 1
        Width = 60
        Height = 26
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        DataSource = srcFilters
        VisibleButtons = [nbInsert, nbDelete]
        ConfirmDelete = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 208
      end
    end
    object pnlBottom: TUniPanel
      Left = 1
      Top = 318
      Width = 255
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 319
      object Panel1: TUniPanel
        Left = 56
        Top = 1
        Width = 201
        Height = 37
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 55
        ExplicitHeight = 40
        object btnOK: TUniButton
          Left = 3
          Top = 8
          Width = 90
          Height = 25
          Hint = ''
          Caption = 'OK'
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 103
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
      Top = 29
      Width = 255
      Height = 289
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      inline wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 253
        Height = 287
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 253
        ExplicitHeight = 287
        inherited PageControl: TUniPageControl
          Width = 253
          Height = 258
          ExplicitWidth = 253
          ExplicitHeight = 258
        end
        inherited TopToolBar: TUniToolBar
          Width = 253
          ExplicitWidth = 253
        end
      end
    end
  end
  object cdsFilters: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FILTER_NAME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    IndexFieldNames = 'FILTER_NAME'
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 160
    object cdsFiltersFILTER_NAME: TStringField
      DisplayLabel = 'Advanced Filter Name'
      DisplayWidth = 40
      FieldName = 'FILTER_NAME'
      Size = 60
    end
  end
  object srcFilters: TDataSource
    DataSet = cdsFilters
    Left = 32
    Top = 128
  end
end
