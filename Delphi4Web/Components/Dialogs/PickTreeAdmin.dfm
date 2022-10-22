object PickTreeAdminForm: TPickTreeAdminForm
  Left = 0
  Top = 0
  ClientHeight = 407
  ClientWidth = 532
  Caption = 'PickTrees'
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
    Height = 407
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
        DataSource = dmPickTreeAdmin.dsPickTrees
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object grdPickTrees: TUniDBGrid
      Left = 1
      Top = 29
      Width = 248
      Height = 378
      Hint = ''
      DataSource = dmPickTreeAdmin.dsPickTrees
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
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Pick Tree'
          Width = 169
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LEVELS'
          Title.Alignment = taCenter
          Title.Caption = 'Levels'
          Width = 55
          Alignment = taRightJustify
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PICKTREENODE_ID'
          Title.Caption = 'PICKTREENODE_ID'
          Width = 97
          Visible = False
          Alignment = taRightJustify
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object pnlPickTreeNodes: TUniPanel
    Left = 256
    Top = 0
    Width = 276
    Height = 407
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'pnlPickTreeNodes'
    object UniToolBar1: TUniToolBar
      Left = 1
      Top = 1
      Width = 274
      Height = 29
      Hint = ''
      Images = dmPickTreeAdmin.ilPickTrees
      Anchors = [akLeft, akTop, akRight]
      Align = alTop
      TabOrder = 1
      ParentColor = False
      Color = clBtnFace
      object btnUp: TUniToolButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickTreeAdmin.acMoveUp
        ImageIndex = 6
      end
      object btnDown: TUniToolButton
        AlignWithMargins = True
        Left = 32
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickTreeAdmin.acMoveDown
        ImageIndex = 7
      end
      object btnNewChild: TUniToolButton
        AlignWithMargins = True
        Left = 61
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickTreeAdmin.acNewChild
        ImageIndex = 3
      end
      object btnDelete: TUniToolButton
        AlignWithMargins = True
        Left = 90
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickTreeAdmin.acDelete
        ImageIndex = 3
      end
      object btnEdit: TUniToolButton
        AlignWithMargins = True
        Left = 119
        Top = 3
        ShowHint = True
        ParentShowHint = False
        Action = dmPickTreeAdmin.acEditCaption
        ImageIndex = 1
      end
    end
    object UniTreeView1: TUniTreeView
      Left = 1
      Top = 29
      Width = 274
      Height = 378
      Hint = ''
      Items.FontData = {0100000000}
      AutoExpand = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Color = clWindow
    end
  end
  object UniSplitter1: TUniSplitter
    Left = 250
    Top = 0
    Width = 6
    Height = 407
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
end
