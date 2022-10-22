object FrmOverShipCheck: TFrmOverShipCheck
  Left = 251
  Top = 124
  ClientHeight = 353
  ClientWidth = 542
  Caption = 'Over-Shipment Quantity Exceeds Release Quantity'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 542
    Height = 353
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 293
    object PnlButtons: TUniPanel
      Left = 1
      Top = 314
      Width = 540
      Height = 39
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object PnlButtonsInner: TUniPanel
        Left = 326
        Top = 1
        Width = 214
        Height = 37
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object btnOK: TUniButton
          Left = 4
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'OK'
          ModalResult = 1
          TabOrder = 1
        end
        object btnCancel: TUniButton
          Left = 111
          Top = 8
          Width = 97
          Height = 25
          Hint = ''
          Caption = 'Cancel'
          ModalResult = 2
          TabOrder = 2
        end
      end
    end
    object PnlSelectActionGroup: TUniPanel
      Left = 1
      Top = 241
      Width = 540
      Height = 73
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object GroupBox3: TUniGroupBox
        Left = 1
        Top = 1
        Width = 538
        Height = 71
        Hint = ''
        Caption = ' Select Action '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 532
        ExplicitHeight = 63
        object rbtnChangeRelease: TUniRadioButton
          Left = 9
          Top = 17
          Width = 280
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Change release quantity based on over-shipment'
          TabOrder = 0
        end
        object rbtnAddReleases: TUniRadioButton
          Left = 9
          Top = 38
          Width = 344
          Height = 17
          Hint = ''
          Caption = 
            'Add multiple lines to shipment details, one line for each releas' +
            'e'
          TabOrder = 1
        end
      end
    end
    object PnlPORelease: TUniPanel
      Left = 1
      Top = 1
      Width = 540
      Height = 241
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      object GroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 538
        Height = 239
        Hint = ''
        Caption = ' PO Release '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 5
        ExplicitWidth = 532
        ExplicitHeight = 171
        object Panel1: TUniPanel
          Left = 2
          Top = 15
          Width = 200
          Height = 222
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 7
            Top = 71
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Release Qty'
            TabOrder = 7
          end
          object Label2: TUniLabel
            Left = 7
            Top = 92
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Cum release'
            TabOrder = 8
          end
          object Label7: TUniLabel
            Left = 7
            Top = 121
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Shipped so far'
            TabOrder = 9
          end
          object Label4: TUniLabel
            Left = 7
            Top = 170
            Width = 84
            Height = 13
            Hint = ''
            Caption = 'This shipment qty'
            TabOrder = 10
          end
          object Label8: TUniLabel
            Left = 7
            Top = 142
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Room left'
            TabOrder = 11
          end
          object Label9: TUniLabel
            Left = 7
            Top = 191
            Width = 62
            Height = 13
            Hint = ''
            Caption = 'Exceeded by'
            TabOrder = 12
          end
          object Label3: TUniLabel
            Left = 7
            Top = 3
            Width = 39
            Height = 13
            Hint = ''
            Caption = 'Order #'
            TabOrder = 13
          end
          object Label5: TUniLabel
            Left = 7
            Top = 24
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Item #'
            TabOrder = 14
          end
          object Label6: TUniLabel
            Left = 7
            Top = 43
            Width = 58
            Height = 13
            Hint = ''
            Caption = 'Sequence #'
            TabOrder = 15
          end
          object lblOrderno: TUniLabel
            Left = 111
            Top = 3
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'lblOrderno'
            TabOrder = 16
          end
          object lblItemno: TUniLabel
            Left = 111
            Top = 24
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'Label10'
            TabOrder = 17
          end
          object lblOrdDtlSeqno: TUniLabel
            Left = 111
            Top = 43
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'Label10'
            TabOrder = 18
          end
          object edRelQty: TUniEdit
            Left = 111
            Top = 68
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            TabOrder = 0
            TabStop = False
            ReadOnly = True
          end
          object edRelCum: TUniEdit
            Left = 111
            Top = 89
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            TabOrder = 1
            TabStop = False
            ReadOnly = True
          end
          object edRecvCumBefore: TUniEdit
            Left = 111
            Top = 118
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            TabOrder = 2
            TabStop = False
            ReadOnly = True
          end
          object edRecvQty: TUniEdit
            Left = 111
            Top = 167
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            TabOrder = 3
            TabStop = False
            ReadOnly = True
          end
          object edRecvRoom: TUniEdit
            Left = 111
            Top = 139
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            TabOrder = 4
            TabStop = False
            ReadOnly = True
          end
          object edExceed: TUniEdit
            Left = 111
            Top = 188
            Width = 83
            Height = 19
            Hint = ''
            Text = '0'
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 5
            TabStop = False
            Color = clRed
            ReadOnly = True
          end
        end
        object Panel2: TUniPanel
          Left = 200
          Top = 15
          Width = 338
          Height = 222
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object wwDBGrid1: TIQUniGridControl
            Left = 1
            Top = 1
            Width = 336
            Height = 220
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 119
            IQComponents.Grid.Height = 134
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = wwDataSource1
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
            IQComponents.Navigator.DataSource = wwDataSource1
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 119
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 134
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = wwDataSource1
            Columns = <
              item
                FieldName = 'SEQ'
                Title.Caption = '#'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QUAN'
                Title.Caption = 'Release Qty'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'SHIPPED_QUAN'
                Title.Caption = 'Shipped'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QTY_LEFT_ONORDER'
                Title.Caption = 'Left On Order'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end>
            TabsVisible = True
            Marker = 0
          end
        end
      end
    end
  end
  object wwDataSource1: TDataSource
    DataSet = QryRel
    Left = 299
    Top = 69
  end
  object QryRel: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id as releases_id,'
      '       r.seq,'
      '       r.quan,'
      '       r.shipped_quan,'
      
        '       Greatest(0, NVL(r.quan,0) - NVL(r.shipped_quan,0)) as qty' +
        '_left_onorder,'
      '       h.orderno,'
      '       d.itemno, /*covers arinvt and misc items*/'
      '       d.ord_det_seqno'
      '  from releases r, v_ord_detail_ex d, orders h'
      ' where d.ord_detail_id = :ord_detail_id'
      '   and h.id = d.orders_id'
      '   and r.ord_detail_id = :ord_detail_id'
      '   and NVL(r.ship_to_id, :default_ship_to_id) = :ship_to_id'
      ' order by'
      '       r.promise_date,'
      '       r.id')
    Left = 299
    Top = 82
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'default_ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ship_to_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryRelSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 2
      FieldName = 'SEQ'
      Size = 0
    end
    object QryRelQUAN: TBCDField
      DisplayLabel = 'Release Qty'
      DisplayWidth = 11
      FieldName = 'QUAN'
      Origin = 'IQ.PO_RELEASES.QUAN'
    end
    object QryRelSHIPPED_QUAN: TBCDField
      DisplayLabel = 'Shipped'
      DisplayWidth = 10
      FieldName = 'SHIPPED_QUAN'
    end
    object QryRelQTY_LEFT_ONORDER: TFMTBCDField
      DisplayLabel = 'Left On Order'
      DisplayWidth = 13
      FieldName = 'QTY_LEFT_ONORDER'
      Origin = 'IQ.V_PO_RELEASES_CUM.QTY_LEFT_ONORDER'
      Size = 38
    end
    object QryRelRELEASES_ID: TBCDField
      FieldName = 'RELEASES_ID'
      Visible = False
      Size = 0
    end
    object QryRelORDERNO: TStringField
      FieldName = 'ORDERNO'
      Origin = 'ORDERNO'
      Size = 15
    end
    object QryRelITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryRelORD_DET_SEQNO: TBCDField
      FieldName = 'ORD_DET_SEQNO'
      Origin = 'ORD_DET_SEQNO'
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'rbtnChangeRelease'
      'rbtnAddReleases'
      'btnOK')
    SecurityCode = 'FRMOVERSHIPCHECK'
    Left = 24
    Top = 240
  end
  object PopupMenu1: TUniPopupMenu
    Left = 71
    Top = 241
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Over-Shipment Check'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195778 $'
    BuildVersion = '176554'
    Left = 106
    Top = 241
  end
end
