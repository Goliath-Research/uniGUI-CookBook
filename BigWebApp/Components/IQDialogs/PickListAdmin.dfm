object PickListAdminForm: TPickListAdminForm
  Left = 0
  Top = 0
  ClientHeight = 376
  ClientWidth = 529
  Caption = 'Pick Lists'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPickLists: TUniPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 376
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object tbPickLists: TUniToolBar
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
      object dbnavPickLists: TUniDBNavigator
        AlignWithMargins = True
        Left = 71
        Top = 3
        Width = 174
        Height = 23
        Hint = ''
        DataSource = dmPickListAdmin.dsPickLists
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object grdPickLists: TUniDBGrid
      Left = 1
      Top = 29
      Width = 248
      Height = 347
      Hint = ''
      DataSource = dmPickListAdmin.dsPickLists
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Columns = <
        item
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Pick List'
          Width = 228
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object pnlPickListItems: TUniPanel
    Left = 256
    Top = 0
    Width = 273
    Height = 376
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object tbPickListItems: TUniToolBar
      Left = 1
      Top = 1
      Width = 271
      Height = 29
      Hint = ''
      Images = dmPickListAdmin.ilPickLists
      Anchors = [akLeft, akTop, akRight]
      Align = alTop
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      object btnMoveUp: TUniToolButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickListAdmin.acMoveUp
        ImageIndex = 0
      end
      object btnMoveDown: TUniToolButton
        AlignWithMargins = True
        Left = 32
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickListAdmin.acMoveDown
        ImageIndex = 1
      end
      object dbnavPickListItems: TUniDBNavigator
        AlignWithMargins = True
        Left = 94
        Top = 3
        Width = 174
        Height = 23
        Hint = ''
        DataSource = dmPickListAdmin.dsPickListItems
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object grdPickListItems: TUniDBGrid
      Left = 1
      Top = 29
      Width = 271
      Height = 347
      Hint = ''
      DataSource = dmPickListAdmin.dsPickListItems
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 40
          Visible = False
          Alignment = taRightJustify
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TEXT'
          Title.Alignment = taCenter
          Title.Caption = 'Text'
          Width = 250
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 250
    Top = 0
    Width = 6
    Height = 376
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
end
