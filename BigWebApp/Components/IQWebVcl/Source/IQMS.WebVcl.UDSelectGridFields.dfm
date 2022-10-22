object FrmSelectGridFields: TFrmSelectGridFields
  Tag = 1999
  Left = 107
  Top = 124
  ClientHeight = 287
  ClientWidth = 470
  Caption = 'Design Your Record Layout'
  Constraints.MinHeight = 308
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 162
    Top = 0
    Width = 6
    Height = 246
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 246
    Width = 470
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 468
      Height = 7
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel7: TUniPanel
      Left = 267
      Top = 7
      Width = 203
      Height = 34
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 7
        Width = 97
        Height = 25
        Hint = 'Save and exit'
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 7
        Width = 97
        Height = 25
        Hint = 'Cancel and exit'
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 168
    Top = 0
    Width = 302
    Height = 246
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object Panel3: TUniPanel
      Left = 198
      Top = 1
      Width = 104
      Height = 244
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnNewItem: TUniButton
        Left = 7
        Top = 13
        Width = 97
        Height = 25
        Hint = 'Create new free text node'
        ShowHint = True
        Caption = 'New Item'
        TabOrder = 1
        OnClick = NewItem1Click
      end
      object btnNewSubItem: TUniButton
        Left = 7
        Top = 43
        Width = 97
        Height = 25
        Hint = 'Create new free text subnode'
        ShowHint = True
        Caption = 'New Sub Item'
        TabOrder = 2
        OnClick = NewSubItem1Click
      end
      object btnDeleteItem: TUniButton
        Left = 7
        Top = 87
        Width = 97
        Height = 25
        Hint = 'Delete current item and its children'
        ShowHint = True
        Caption = 'Delete Item'
        TabOrder = 3
        OnClick = DeleteItem1Click
      end
      object btnDeleteAll: TUniButton
        Left = 7
        Top = 117
        Width = 97
        Height = 25
        Hint = 'Delete all items from the treeview'
        ShowHint = True
        Caption = 'Delete All'
        TabOrder = 4
        OnClick = DeleteAllItems1Click
      end
      object btnMoveUp: TUniButton
        Left = 7
        Top = 161
        Width = 97
        Height = 25
        Hint = 'Move item and its children ahead of its sibling'
        ShowHint = True
        Caption = 'Move Up'
        TabOrder = 5
        OnClick = MoveUp1Click
      end
      object btnMoveDown: TUniButton
        Left = 7
        Top = 191
        Width = 97
        Height = 25
        Hint = 'Move item and its children past its sibling'
        ShowHint = True
        Caption = 'Move Down'
        TabOrder = 6
        OnClick = MoveDown1Click
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 34
      Height = 244
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        34
        244)
      object Image1: TUniImage
        Left = 1
        Top = 226
        Width = 18
        Height = 18
        Hint = 'Drag and drop an item from the treeview to remove it'
        ShowHint = True
        Center = True
        AutoSize = True
        Picture.Data = {
          07544269746D61704E010000424D4E0100000000000076000000280000001200
          0000120000000100040000000000D80000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF008888888888888888880000008888000000000078880000008887F8F88887
          8708880000008887F08F08807808880000008887F0F808808708880000008887
          F08F08807808880000008887F0F808808708880000008887F08F088078088800
          00008887F0F808808708880000008887F00F00800808880000008887F8F8F8F8
          870888000000888777777777770888000000887000000000000088000000887F
          F8F8F88888708800000088877777777777788800000088888870887088888800
          0000888888870008888888000000888888888888888888000000}
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        Transparent = True
      end
      object Panel8: TUniPanel
        Left = 1
        Top = 93
        Width = 32
        Height = 64
        Hint = ''
        ShowHint = True
        Anchors = [akLeft]
        TabOrder = 0
        Caption = ''
        object sbtnRight: TUniSpeedButton
          Left = 5
          Top = 7
          Width = 25
          Height = 25
          Hint = 'Add field to the treeview'
          ShowHint = True
          Glyph.Data = {
            46010000424D460100000000000076000000280000001A0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDFDDDDD000000DDDDDD0DDDDDDDDDDDD7FFDDDD000000DDDDDD00DDDD
            DDDDDDD778FDDD000000DDDDDD060DDDDDDDFFF7F78FDD000000DD00000660DD
            DDD77777DD78FD000000DD066666660DDDD7FDDDDDD78F000000DD0666666660
            DDD7FDDDDDDD7D000000DD066666660DDDD7FFFFFDD7DD000000DD00000660DD
            DDD77777FD7DDD000000DDDDDD060DDDDDDDDDD7F7DDDD000000DDDDDD00DDDD
            DDDDDDD77DDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
            DDDDDDDDDDDDDD000000}
          Caption = ''
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnRightClick
        end
        object sbtnLeft: TUniSpeedButton
          Left = 5
          Top = 32
          Width = 25
          Height = 25
          Hint = 'Remove field from the treeview'
          ShowHint = True
          Glyph.Data = {
            46010000424D460100000000000076000000280000001A0000000D0000000100
            040000000000D000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDDDDDDDDD000000DDDDDD0DDDDDDDDDDDD7FDDDDD000000DDDDD00DDDDD
            DDDDDD77FDDDDD000000DDDD060DDDDDDDDDD7D7FFFFFD000000DDD06600000D
            DDDD7DD77777FD000000DD066666660DDDD7DDDDDDD7FD000000D0666666660D
            DD78FDDDDDD7FD000000DD066666660DDDD78FDDFFF7FD000000DDD06600000D
            DDDD78F77777DD000000DDDD060DDDDDDDDDD787FDDDDD000000DDDDD00DDDDD
            DDDDDD77FDDDDD000000DDDDDD0DDDDDDDDDDDD7DDDDDD000000DDDDDDDDDDDD
            DDDDDDDDDDDDDD000000}
          Caption = ''
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = DeleteItem1Click
        end
      end
    end
    object Panel6: TUniPanel
      Left = 34
      Top = 1
      Width = 164
      Height = 244
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = 'Panel6'
      object TreeView1: TUniTreeView
        Left = 1
        Top = 20
        Width = 162
        Height = 224
        Hint = ''
        Items.FontData = {0100000000}
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Color = clWindow
        OnMouseDown = TreeView1MouseDown
      end
      object Panel10: TUniPanel
        Left = 1
        Top = 1
        Width = 162
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 116
          Height = 13
          Hint = ''
          Caption = 'User-Defined Layout'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 162
    Height = 246
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object ListBox1: TUniListBox
      Left = 1
      Top = 20
      Width = 160
      Height = 226
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnMouseDown = ListBox1MouseDown
    end
    object Panel11: TUniPanel
      Left = 1
      Top = 1
      Width = 160
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object Label3: TUniLabel
        Left = 1
        Top = 1
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Available Fields'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object popmTreeView: TUniPopupMenu
    OnPopup = popmTreeViewPopup
    Left = 276
    Top = 130
    object NewItem1: TUniMenuItem
      Caption = 'New Item'
      OnClick = NewItem1Click
    end
    object NewSubItem1: TUniMenuItem
      Caption = 'New Sub Item'
      OnClick = NewSubItem1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object DeleteItem1: TUniMenuItem
      Caption = 'Delete Item'
      OnClick = DeleteItem1Click
    end
    object DeleteAllItems1: TUniMenuItem
      Caption = 'Delete All Items'
      OnClick = DeleteAllItems1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object MoveUp1: TUniMenuItem
      Caption = 'Move Up'
      OnClick = MoveUp1Click
    end
    object MoveDown1: TUniMenuItem
      Caption = 'Move Down'
      OnClick = MoveDown1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object EditLabel1: TUniMenuItem
      Caption = 'Edit Label'
      OnClick = EditLabel1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object Cancel1: TUniMenuItem
      Caption = 'Cancel'
    end
  end
  object QryUd_Rec_View: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, '
      '       parent_id,'
      '       level,'
      '       seq,'
      '       field_name,'
      '       ud_caption,'
      '       iq_caption'
      '  from '
      '       ud_rec_view'
      ' where '
      '       userid = :userid'
      '   and form_class = :class_form'
      '   and comp_path  = :comp_path'
      ' start with '
      '       parent_id is NULL'
      'connect by '
      '       parent_id = prior id'
      'order by '
      '       id'
      ''
      ' ')
    Left = 243
    Top = 130
    ParamData = <
      item
        Name = 'userid'
        DataType = ftString
      end
      item
        Name = 'class_form'
        DataType = ftString
      end
      item
        Name = 'comp_path'
        DataType = ftString
      end>
  end
end
