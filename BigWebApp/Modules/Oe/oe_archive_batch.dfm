object FrmOEArchiveBatch: TFrmOEArchiveBatch
  Left = 80
  Top = 172
  ClientHeight = 429
  ClientWidth = 634
  Caption = 'Archive Batch of Sales Orders'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 429
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 390
      Width = 632
      Height = 38
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel2: TUniPanel
        Left = 423
        Top = 1
        Width = 208
        Height = 36
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 3
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'OK'
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 105
          Top = 7
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          TabOrder = 2
          OnClick = Exit1Click
        end
      end
    end
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 632
      Height = 389
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 415
      IQComponents.Grid.Height = 303
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = DataSource1
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
      IQComponents.Navigator.DataSource = DataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 415
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 303
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = DataSource1
      Columns = <
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSTNO'
          Title.Caption = 'Customer #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DATE_TAKEN'
          Title.Caption = 'Date Taken'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BILL_TO_ATTN'
          Title.Caption = 'Bill To'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SHIP_TO_ATTN'
          Title.Caption = 'Ship To'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ORD_BY'
          Title.Caption = 'Taken By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CURR_CODE'
          Title.Caption = 'Currency Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CAN_BE_ARCHIVED'
          Title.Caption = 'Can Be ~Archived'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 112
    Top = 64
  end
  object Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select o.id,'
      '       o.orderno,'
      '       a.custno,'
      '       a.company,'
      '       o.date_taken,'
      '       b.attn as bill_to_attn,'
      '       s.attn as ship_to_attn,'
      '       o.pono,'
      '       o.ord_by,'
      '       c.curr_code,'
      
        '       decode( x.orders_id, NULL, decode( sched_so.orders_id, NU' +
        'LL, '#39'Y'#39', '#39'N'#39'), '#39'N'#39') as can_be_archived'
      '  from orders o, '
      '       bill_to b, '
      '       ship_to s,'
      '       arcusto a,'
      '       currency c,'
      '       '
      '       -- can close these sales orders '
      '       ( select o.id as orders_id '
      '         from ord_detail d, orders o, arcusto a, iqsys'
      '         where NVL(d.cumm_shipped, 0) >= 0 '
      '           and o.id = d.orders_id'
      '           and o.arcusto_id = a.id'
      
        '           and (NVL(d.total_qty_ord, 0) - NVL(d.cumm_shipped, 0)' +
        ') * 100 > NVL(a.undership, NVL(iqsys.closeorderwithin, 0)) * d.t' +
        'otal_qty_ord'
      '         group by o.id'
      '         having count(*) > 0 ) x,'
      ''
      '       -- schedule sales orders'
      '       ( select distinct p.order_id as orders_id'
      '           from '
      '                ptallocate p,'
      '                ptorder_rel r,'
      '                ptorder t,'
      '                cntr_sched s '
      '          where '
      '                p.id = r.ptallocate_id'
      '            and r.ptorder_id = t.id '
      '            and t.workorder_id = s.workorder_id ) sched_so'
      '         '
      ' where '
      '       o.bill_to_id = b.id(+)'
      '   and o.ship_to_id = s.id(+)'
      '   and o.arcusto_id = a.id(+)'
      '   and o.currency_id = c.id(+)'
      '   and misc.eplant_filter( o.eplant_id ) = 1'
      '   '
      '       -- link in those that can be closed'
      '   and o.id = x.orders_id(+)'
      ''
      '       -- link in those that scheduled'
      '   and o.id = sched_so.orders_id(+)')
    Left = 112
    Top = 80
    object Query1ORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'o.orderno'
      Size = 15
    end
    object Query1CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object Query1COMPANY: TStringField
      DisplayLabel = 'Company Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'a.company'
      Size = 60
    end
    object Query1DATE_TAKEN: TDateTimeField
      DisplayLabel = 'Date Taken'
      DisplayWidth = 18
      FieldName = 'DATE_TAKEN'
      Origin = 'o.date_taken'
    end
    object Query1BILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 35
      FieldName = 'BILL_TO_ATTN'
      Origin = 'b.attn'
      Size = 60
    end
    object Query1SHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 35
      FieldName = 'SHIP_TO_ATTN'
      Origin = 's.attn'
      Size = 60
    end
    object Query1PONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 10
      FieldName = 'PONO'
      Origin = 'o.pono'
      Size = 35
    end
    object Query1ORD_BY: TStringField
      DisplayLabel = 'Taken By'
      DisplayWidth = 20
      FieldName = 'ORD_BY'
      Origin = 'o.ord_by'
      FixedChar = True
      Size = 30
    end
    object Query1CURR_CODE: TStringField
      DisplayLabel = 'Currency Code'
      DisplayWidth = 11
      FieldName = 'CURR_CODE'
      Origin = 'c.curr_code'
      Size = 10
    end
    object Query1CAN_BE_ARCHIVED: TStringField
      DisplayLabel = 'Can Be ~Archived'
      DisplayWidth = 8
      FieldName = 'CAN_BE_ARCHIVED'
      Origin = 
        'decode( x.orders_id, NULL, decode( sched_so.orders_id, NULL, '#39'Y'#39 +
        ', '#39'N'#39'), '#39'N'#39')'
      Size = 1
    end
    object Query1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'o.id'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 160
    Top = 64
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
    ModuleName = 'FrmOEArchiveBatch'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197420 $'
    BuildVersion = '176554'
    Left = 192
    Top = 64
  end
  object IQJumpSO: TIQWebJump
    DataField = 'ID'
    DataSource = DataSource1
    JumpTo = jtSalesOrder
    Left = 224
    Top = 64
  end
  object PopupMenu1: TUniPopupMenu
    Left = 256
    Top = 64
    object JumpToSalesOrder1: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = JumpToSalesOrder1Click
    end
  end
end
