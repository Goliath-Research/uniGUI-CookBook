object FrmQuickOeAddMultipleItems: TFrmQuickOeAddMultipleItems
  Left = 0
  Top = 0
  ClientHeight = 541
  ClientWidth = 678
  Caption = 'Fast Order Entry Tool'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 678
    Height = 49
    Hint = ''
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 130
      Top = 1
      Width = 4
      Height = 47
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 129
      Height = 47
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 13
        Width = 101
        Height = 13
        Hint = ''
        Caption = 'Default Promise Date'
        TabOrder = 1
      end
    end
    object Panel6: TUniPanel
      Left = 134
      Top = 1
      Width = 543
      Height = 47
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBDateTimePicker1: TUniDBDateTimePicker
        Left = 0
        Top = 10
        Width = 170
        Height = 21
        Hint = ''
        DateTime = 42683.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 52
    Width = 678
    Height = 428
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object srchArinvt: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 676
      Height = 426
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 459
      IQComponents.Grid.Height = 340
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt
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
      IQComponents.Navigator.DataSource = SrcArinvt
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 459
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 340
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt
      Columns = <
        item
          FieldName = 'QTY'
          Title.Caption = 'Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROMISE_DATE'
          Title.Caption = 'Promise Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ITEMNO'
          Title.Caption = 'Item #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REV'
          Title.Caption = 'Rev'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP2'
          Title.Caption = 'Ext Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT'
          Title.Caption = 'UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ONHAND'
          Title.Caption = 'On Hand'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NON_COMMITTED'
          Title.Caption = 'Non-Committed'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 480
    Width = 678
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 449
      Top = 1
      Width = 228
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 119
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 522
    Width = 678
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Selected:  0'
        Width = 160
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 32
    Top = 137
  end
  object QryArinvt: TFDQuery
    Tag = 1
    BeforeOpen = QryArinvtBeforeOpen
    AfterEdit = QryArinvtAfterEdit
    BeforePost = QryArinvtBeforePost
    AfterPost = ApplyUpdate
    CachedUpdates = True
    OnUpdateRecord = QryArinvtUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       x.qty,'
      '       x.promise_date,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip2,'
      '       nvl(u.uom, a.unit) as unit,'
      '       a.onhand,'
      '       a.pk_hide,'
      '       inv_misc.GetNonCommited( a.id ) as non_committed'
      '/* AKA_SELECT_START */       '
      '/* AKA_SELECT_END */       '
      ''
      '  from arinvt a,'
      '       gtt_quick_oe_multi_arinvt x,'
      '       arinvt_uom_conv u'
      '/* AKA_FROM_START */       '
      '/* AKA_FROM_END */       '
      '       '
      '/* HPICK_SUBQUERY_FROM_START */'
      '/* HPICK_SUBQUERY_FROM_END */'
      ''
      ' where a.id = x.id(+) '
      '   and a.id = u.arinvt_id(+)'
      '   and nvl(u.default_oe(+), '#39'N'#39') = '#39'Y'#39
      '   and misc.eplant_filter( a.eplant_id ) = 1'
      '   and nvl(a.non_salable, '#39'N'#39') <> '#39'Y'#39
      '   and nvl(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      ''
      '/* AKA_WHERE_START */       '
      '/* AKA_WHERE_END */       '
      '   '
      '/* HPICK_SUBQUERY_WHERE_START */'
      '/* HPICK_SUBQUERY_WHERE_END */'
      '   ')
    Left = 32
    Top = 169
    object QryArinvtQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'x.qty'
      Size = 6
    end
    object QryArinvtPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 18
      FieldName = 'PROMISE_DATE'
      Origin = 'x.promise_date'
    end
    object QryArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.rev'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'a.class'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      ReadOnly = True
      Size = 100
    end
    object QryArinvtUNIT: TStringField
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'nvl(u.uom, a.unit) '
      ReadOnly = True
      Size = 10
    end
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'a.id'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryArinvtONHAND: TBCDField
      DisplayLabel = 'On Hand'
      FieldName = 'ONHAND'
      Origin = 'a.onhand'
      ReadOnly = True
    end
    object QryArinvtNON_COMMITTED: TFMTBCDField
      DisplayLabel = 'Non-Committed'
      FieldName = 'NON_COMMITTED'
      Origin = 'inv_misc.GetNonCommited( a.id ) '
      ReadOnly = True
      Size = 38
    end
    object QryArinvtPK_HIDE: TStringField
      DisplayLabel = 'Inactive?'
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 32
    Top = 252
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmQuickOeAddMultipleItems'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196070 $'
    BuildVersion = '176554'
    Left = 64
    Top = 252
  end
end
