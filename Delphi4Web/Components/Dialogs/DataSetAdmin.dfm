object DataSetAdminForm: TDataSetAdminForm
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 635
  Caption = 'DataSets'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDataSets: TUniPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 299
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object tbDataSets: TUniToolBar
      Left = 1
      Top = 1
      Width = 248
      Height = 29
      Hint = ''
      ButtonAutoWidth = True
      Anchors = [akLeft, akTop, akRight]
      Align = alTop
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      object dbnavDataSets: TUniDBNavigator
        AlignWithMargins = True
        Left = 71
        Top = 3
        Width = 174
        Height = 23
        Hint = ''
        DataSource = dmDataSetAdmin.dsIQDataSets
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object grdDataSets: TUniDBGrid
      Left = 1
      Top = 30
      Width = 248
      Height = 268
      Hint = ''
      DataSource = dmDataSetAdmin.dsIQDataSets
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Columns = <
        item
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'ID'
          Width = 40
          Visible = False
        end
        item
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'DataSet'
          Width = 216
        end
        item
          FieldName = 'KEYFIELD_ID'
          Title.Caption = 'KEYFIELD_ID'
          Width = 67
          Visible = False
        end
        item
          FieldName = 'MASTERDATASET_ID'
          Title.Caption = 'MASTERDATASET_ID'
          Width = 106
          Visible = False
        end
        item
          FieldName = 'DETAILFIELD_ID'
          Title.Caption = 'DETAILFIELD_ID'
          Width = 84
          Visible = False
        end
        item
          FieldName = 'TABLENAME'
          Title.Caption = 'TABLENAME'
          Width = 388
          Visible = False
        end
        item
          FieldName = 'SQLQUERY'
          Title.Caption = 'SQLQUERY'
          Width = 12004
          Visible = False
        end
        item
          FieldName = 'DATAMODULE_ID'
          Title.Caption = 'DATAMODULE_ID'
          Width = 89
          Visible = False
        end
        item
          FieldName = 'ROWID'
          Title.Caption = 'ROWID'
          Width = 142
          Visible = False
        end>
    end
  end
  object pcDataSet: TUniPageControl
    Left = 256
    Top = 0
    Width = 379
    Height = 299
    Hint = ''
    ActivePage = tsSQL
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object tsSQL: TUniTabSheet
      Hint = ''
      Caption = 'SQL'
      object seSQL: TUniSyntaxEdit
        Left = 0
        Top = 0
        Width = 371
        Height = 271
        Hint = ''
        Lines.Strings = (
          'SELECT ID, COMPANY FROM VENDOR')
        Language = 'SQL'
        Font.Height = -13
        Font.Name = 'Courier New'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
    object tsFields: TUniTabSheet
      Hint = ''
      Caption = 'Fields'
    end
    object tsParams: TUniTabSheet
      Hint = ''
      Caption = 'Params'
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 250
    Top = 0
    Width = 6
    Height = 299
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
end
