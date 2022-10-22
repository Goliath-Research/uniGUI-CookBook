object FrmAssyTrackDispatch: TFrmAssyTrackDispatch
  Left = 95
  Top = 201
  ClientHeight = 458
  ClientWidth = 918
  Caption = 'Assembly Dispatch List'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 361
    Top = 3
    Width = 5
    Height = 455
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel2: TUniPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
  end
  object pnlLeft01: TUniPanel
    Left = 0
    Top = 3
    Width = 361
    Height = 455
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 21
      Width = 359
      Height = 433
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 142
      IQComponents.Grid.Height = 347
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcWorkCenter
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
      IQComponents.Navigator.DataSource = SrcWorkCenter
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 142
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 347
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcWorkCenter
      Columns = <
        item
          FieldName = 'EQNO'
          Title.Caption = 'Work Center #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_DESC'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CNTR_TYPE'
          Title.Caption = 'Center Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGCELL'
          Title.Caption = 'Mfg Cell'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object Panel2: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 359
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 1
      Alignment = taLeftJustify
      Caption = ' Work Centers'
      Color = clAppWorkSpace
    end
  end
  object pnlClient01: TUniPanel
    Left = 366
    Top = 3
    Width = 552
    Height = 455
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 1
      Top = 321
      Width = 550
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 21
      Width = 550
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object sbtnInsert: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Insert Process'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFBCC3B86F965B3B75252665122664133B75256E955ABCC3B7FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF769B63185F0607580203790701
          8401018504027A0B055605155906749A61FF00FFFF00FFFF00FFFF00FFFF00FF
          5E8E470A590105861800C41D02BC0B01C30101C10101D11600C72D05831D0854
          015B8B44FF00FFFF00FFFF00FF83A2720A5B0105982C00D43C00D12010BD1CDD
          EDE2C6D5D103AF1501D43201D54C0998340A54017E9F6DFF00FFC5C8C31F6D10
          0E812505D65D00D34200D22812C025FFFFFFFFFFFF02B11801D43301D54D0ED7
          67108127176109C4C7C281A17007711221C15E05D55901CE3D01D53009C824FF
          FFFFFFFFFF03B11D00DC3D00D65309D76621C4620569107C9E6A4F914B078124
          22DD7027AB5122933C28A13E35B149FFFFFFFFFFFF2CA3424FB4695AB2762F9E
          541ED571057E204886383D8E4908932F0CDF6473D28FC8E4CDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF73AF820ED467099B32397F2D3F904E048F2B
          01D75A60C179E7FBE7F7FFF7FFFFFFFFFFFFFFFFFFFFFFFFF9FFFCF1FBF174B7
          8300D46009962C3B7F2C599C6407802701D35203AC3302B73A0AC14A21BA58FF
          FFFFC8E4CD23AF5223C96215C15B05C15102D560057410538A3B92AC8B0D8E40
          05A83701CD490DCA5430D07054C383FFFFFFFFFFFF40AF684DDB8D2ED87809D7
          6707BA49096D028CA77BFF00FF2B9257077F2702C84C18CC5D41CC786DBC90FF
          FFFFFFFFFF5CB77E5EDC9737D88010D5670778172A7512FF00FFFF00FFA0B49B
          149156067D2213C45548CE814CAE6A65AE7A67B37C51B7715AD99420D26C0783
          21146E0D9FB293FF00FFFF00FFFF00FF8BAC8B1491590673250B9B3430CF6E50
          D9894DDD8B31D8760CA63C056F15146F1988A679FF00FFFF00FFFF00FFFF00FF
          FF00FFA3B7A13699670D8B56077333057128057025076D250A722E35843EA1B4
          99FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85AA884296631D
          91591D8D513F905584A781FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnInsertClick
      end
      object sbtnRemove: TUniSpeedButton
        Left = 27
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Remove Process'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          0800000000000002000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDAF5FFDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FFFDFD5FAFFDFD
          FDFDFDFDFDFDFD670F5FFDFDA4FFFDFDFDFDFDFDFDFDFDA4A4FFFD5F0F0F67FD
          FDFDFDFDFDFD5F0F5FFDFDA4A4A4FFFDFDFDFDFDFDFDA4A4FFFDFDFD170F0F67
          FDFDFDFDFD5F0F67FDFDFDFDA4A4A4FFFDFDFDFDFDA4A4FFFDFDFDFDFD5F0F0F
          5FFDFDFD170F67FDFDFDFDFDFDA4A4A4FFFDFDFDA4A4FFFDFDFDFDFDFDFDA70F
          0F5FAF170F67FDFDFDFDFDFDFDFDA4A4A4FFFFA4A4FFFDFDFDFDFDFDFDFDFDFD
          170F0F0F67FDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFDFDFD
          67171717FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FFFDFDFDFDFDFDFDFDFDFD5F
          1717671717FDFDFDFDFDFDFDFDFDFDA4A4A4FFA4A4FFFDFDFDFDFDFDFDFD1717
          17AFFDFD5F17FDFDFDFDFDFDFDFDA4A4A4FFFDFDA4A4FFFDFDFDFDFDFD171717
          AFFDFDFDFD6717FDFDFDFDFDFDA4A4A4FFFDFDFDFDA4A4FFFDFDFDFD171717AF
          FDFDFDFDFDFDAF5FFDFDFDFDA4A4A4FFFDFDFDFDFDFDA4A4FFFDFD171717FDFD
          FDFDFDFDFDFDFDFDFDFDFDA4A4A4FDFDFDFDFDFDFDFDFDFDFDFDFDAF5FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRemoveClick
      end
      object pnlLegend: TUniPanel
        Left = 518
        Top = 1
        Width = 31
        Height = 26
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitLeft = 369
        object Panel9: TUniPanel
          Tag = 1999
          Left = 3
          Top = 7
          Width = 13
          Height = 13
          Hint = ''
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold, fsItalic]
          TabOrder = 0
          Caption = 'B'
          Color = clWhite
          object Shape8: TUniPanel
            Left = 1
            Top = 1
            Width = 11
            Height = 11
            Hint = 'Process is scheduled in finite scheduling'
            ShowHint = True
            ParentShowHint = False
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 2
          end
        end
      end
    end
    object wwDBGridDispatch: TIQUniGridControl
      Left = 1
      Top = 49
      Width = 550
      Height = 272
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 333
      IQComponents.Grid.Height = 186
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSndop_Dispatch
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
      IQComponents.Navigator.DataSource = SrcSndop_Dispatch
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 333
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 186
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcSndop_Dispatch
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDER_ID'
          Title.Caption = 'WO #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPNO'
          Title.Caption = 'Process #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPDESC'
          Title.Caption = 'Process Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PartsToGo'
          Title.Caption = 'Parts To Go'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'HoursToGo'
          Title.Caption = 'Hours To Go'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY_NOTE'
          Title.Caption = 'Priority Note'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ID'
          Title.Caption = 'Dispatch ID'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY_NOTE2'
          Title.Caption = 'Priority Note 2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object Panel4: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 550
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      Font.Style = [fsBold]
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = ' Dispatch Priority List'
      Color = clAppWorkSpace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 324
      Width = 550
      Height = 130
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 3
      Caption = ''
      object wwDBGrid2: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 548
        Height = 128
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 331
        IQComponents.Grid.Height = 42
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcPtOrder
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
        IQComponents.Navigator.DataSource = SrcPtOrder
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 331
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 42
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitHeight = 14
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitHeight = 43
        DataSource = SrcPtOrder
        Columns = <
          item
            FieldName = 'ORDERNO'
            Title.Caption = 'Order #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COMPANY'
            Title.Caption = 'Customer'
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
            FieldName = 'REL_DATE'
            Title.Caption = 'WO Ship Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REL_QUAN_DISP'
            Title.Caption = 'WO Release QTY'
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
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
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
            FieldName = 'DESCRIP'
            Title.Caption = 'Item Description'
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
            FieldName = 'REQUEST_DATE'
            Title.Caption = 'Request Date'
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
            FieldName = 'FG_LOTNO'
            Title.Caption = 'FG Lot #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'JOB_SEQ'
            Title.Caption = 'Job Sequence'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        ExplicitTop = 29
        ExplicitHeight = 100
        Marker = 0
      end
    end
  end
  object SrcWorkCenter: TDataSource
    DataSet = QryWorkCenter
    Left = 46
    Top = 203
  end
  object QryWorkCenter: TFDQuery
    Tag = 1
    BeforeOpen = QryWorkCenterBeforeOpen
    AfterScroll = QryWorkCenterAfterScroll
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.cntr_type,'
      '       w.mfgcell,'
      '       w.eplant_id'
      '  from work_center w'
      ' where misc.eplant_filter( w.eplant_id ) = 1'
      '   and nvl(w.pk_hide, '#39'N'#39') = '#39'N'#39
      '   and mfg.lookup_mfgtype(w.mfg_type) = :like_mfg_type'
      '       ')
    Left = 46
    Top = 220
    ParamData = <
      item
        Name = 'like_mfg_type'
        DataType = ftString
        ParamType = ptInput
      end>
    object QryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 12
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      FixedChar = True
      Size = 60
    end
    object QryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'CNTR_DESC'
      Origin = 'w.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object QryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Origin = 'w.CNTR_TYPE'
      FixedChar = True
    end
    object QryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'w.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryWorkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'w.EPLANT_ID'
      Size = 0
    end
    object QryWorkCenterID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcSndop_Dispatch: TDataSource
    DataSet = QrySndop_Dispatch
    Left = 83
    Top = 203
  end
  object QrySndop_Dispatch: TFDQuery
    BeforeInsert = AbortOnInsert
    OnCalcFields = QrySndop_DispatchCalcFields
    CachedUpdates = True
    MasterSource = SrcWorkCenter
    MasterFields = 'ID'
    DetailFields = 'ID'
    OnUpdateRecord = QrySndop_DispatchUpdateRecord
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select d.id,'
      '       d.sndop_id,'
      '       d.seq,'
      '       d.workorder_id,'
      '       d.partno_id,'
      '       d.work_center_id,'
      '       s.opno,'
      '       s.opdesc,'
      
        '       (select id from ptorder where workorder_id = d.workorder_' +
        'id and partno_id = d.partno_id) as ptorder_id,'
      '       d.ptoper_id,'
      '       w.priority_note,'
      '       w.priority_note2,'
      
        '       (select id from cntr_sched where sndop_dispatch_id = d.id' +
        ') as cntr_sched_id,'
      '       w.standard_id,'
      '       mfg.lookup_mfgtype( bom.mfg_type ) as lookup_mfgtype'
      '  from sndop_dispatch d,'
      '       sndop s,'
      '       workorder w,'
      '       standard bom'
      ' where '
      '       d.sndop_id = s.id'
      '   and d.workorder_id = w.id    '
      '   and d.work_center_id = :id'
      '   and w.standard_id = bom.id'
      ' order by '
      '       d.seq ')
    Left = 82
    Top = 220
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QrySndop_DispatchSEQ: TBCDField
      DisplayLabel = '# '
      DisplayWidth = 2
      FieldName = 'SEQ'
      Origin = 'IQ.SNDOP_DISPATCH.SEQ'
      Size = 0
    end
    object QrySndop_DispatchWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.SNDOP_DISPATCH.WORKORDER_ID'
      Size = 0
    end
    object QrySndop_DispatchOPNO: TStringField
      DisplayLabel = 'Process #'
      DisplayWidth = 15
      FieldName = 'OPNO'
      Origin = 'IQ.SNDOP.OPNO'
      Size = 15
    end
    object QrySndop_DispatchOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 23
      FieldName = 'OPDESC'
      Origin = 'IQ.SNDOP.OPDESC'
      Size = 60
    end
    object QrySndop_DispatchPartsToGo: TFloatField
      DisplayLabel = 'Parts To Go'
      DisplayWidth = 11
      FieldKind = fkCalculated
      FieldName = 'PartsToGo'
      DisplayFormat = '########0.00'
      Calculated = True
    end
    object QrySndop_DispatchHoursToGo: TFloatField
      DisplayLabel = 'Hours To Go'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'HoursToGo'
      DisplayFormat = '########0.00'
      Calculated = True
    end
    object QrySndop_DispatchPRIORITY_NOTE: TStringField
      DisplayLabel = 'Priority Note'
      DisplayWidth = 30
      FieldName = 'PRIORITY_NOTE'
      Origin = 'w.priority_note'
      Size = 255
    end
    object QrySndop_DispatchID: TBCDField
      DisplayLabel = 'Dispatch ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.SNDOP_DISPATCH.ID'
      Size = 0
    end
    object QrySndop_DispatchPRIORITY_NOTE2: TStringField
      DisplayLabel = 'Priority Note 2'
      DisplayWidth = 30
      FieldName = 'PRIORITY_NOTE2'
      Origin = 'w.priority_note2'
      Size = 255
    end
    object QrySndop_DispatchRejects: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Rejects'
      Visible = False
      Calculated = True
    end
    object QrySndop_DispatchSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'IQ.SNDOP_DISPATCH.SNDOP_ID'
      Visible = False
      Size = 0
    end
    object QrySndop_DispatchPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Origin = 'IQ.SNDOP_DISPATCH.PARTNO_ID'
      Visible = False
      Size = 0
    end
    object QrySndop_DispatchWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'IQ.SNDOP_DISPATCH.WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
    object QrySndop_DispatchPTORDER_ID: TFMTBCDField
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 38
    end
    object QrySndop_DispatchPTOPER_ID: TBCDField
      FieldName = 'PTOPER_ID'
      Visible = False
      Size = 0
    end
    object QrySndop_DispatchCNTR_SCHED_ID: TFMTBCDField
      FieldName = 'CNTR_SCHED_ID'
      Visible = False
      Size = 38
    end
    object QrySndop_DispatchSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QrySndop_DispatchLOOKUP_MFGTYPE: TStringField
      FieldName = 'LOOKUP_MFGTYPE'
      Visible = False
      Size = 4000
    end
  end
  object SrcPtOrder: TDataSource
    DataSet = QryPtOrder
    Left = 122
    Top = 202
  end
  object QryPtOrder: TFDQuery
    Filtered = True
    MasterSource = SrcSndop_Dispatch
    MasterFields = 'WORKORDER_ID'
    DetailFields = 'WORKORDER_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id,'
      '       v.workorder_id,'
      '       v.partno_id,'
      '       v.rel_date,'
      '       v.rel_quan,'
      '       v.orderno,'
      '       v.pono,'
      '       v.ptallocate_id,'
      '       v.arinvt_id,'
      '       s.id as standard_id, '
      '       v.class,'
      '       v.itemno,'
      '       v.rev,'
      '       v.descrip,'
      '       v.descrip2,'
      '       v.unit,'
      '       decode( a1.id, NULL, a2.company, a1.company) as company,'
      ''
      '       p.order_id as orders_id,'
      '       p.PROMISE_DATE,'
      '       p.REQUEST_DATE,'
      '       decode( mfg.lookup_mfgtype(s.mfg_type),'
      
        '               '#39'EXTRUSION'#39',  v.rel_quan / decode(v.ptwt/12,0,1,v' +
        '.ptwt/12),'
      '               '#39'EXTRUSION2'#39', v.rel_quan_disp,'
      '               '#39'COMPOUND1'#39',  v.rel_quan_disp,'
      '               v.rel_quan ) as Rel_Quan_Disp,'
      ''
      '       p.ord_detail_id,'
      ''
      
        '       substr(bom_misc.get_fg_lotno( w.standard_id, v.partno_id,' +
        ' w.id ), 1, 60) as fg_lotno,'
      '       v.job_seq'
      ''
      '  from V_PTORDER_PARTNO v,'
      '       arcusto a1,'
      '       arcusto a2,'
      '       workorder w,'
      '       ptallocate p,'
      '       standard s,'
      '       orders o,'
      '       cntr_sched sched, '
      '       ILLUM_RT rt'
      ' where '
      '       w.id = :workorder_id'
      
        '   and w.id = v.workorder_id           -- to get arcusto_id from' +
        ' workorder'
      '   and v.ptallocate_id = p.id(+)       -- ptallocate'
      '   and w.standard_id = s.id(+)         -- to get mfgtype'
      '   and p.order_id = o.id(+)            -- to get arcusto_id'
      '   and o.arcusto_id = a1.id(+)         -- to get company name'
      '   and w.arcusto_id = a2.id(+)         -- to get company name'
      ''
      '   and w.id = sched.workorder_id(+)    -- to get to illum_rt'
      '   and sched.id = rt.cntr_sched_id(+)  -- and calc parts to go'
      '   and rt.parent_work_center_id is null'
      '')
    Left = 121
    Top = 220
    ParamData = <
      item
        Name = 'WORKORDER_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryPtOrderORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object QryPtOrderCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 22
      FieldName = 'COMPANY'
      Size = 60
    end
    object QryPtOrderPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 11
      FieldName = 'PONO'
      Size = 35
    end
    object QryPtOrderREL_DATE: TDateTimeField
      DisplayLabel = 'WO Ship Date'
      DisplayWidth = 18
      FieldName = 'REL_DATE'
    end
    object QryPtOrderREL_QUAN_DISP: TFMTBCDField
      DisplayLabel = 'WO Release QTY'
      DisplayWidth = 14
      FieldName = 'REL_QUAN_DISP'
      DisplayFormat = '#########0.##'
      Size = 38
    end
    object QryPtOrderCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Size = 2
    end
    object QryPtOrderITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryPtOrderREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Size = 15
    end
    object QryPtOrderDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object QryPtOrderPROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      DisplayWidth = 18
      FieldName = 'PROMISE_DATE'
    end
    object QryPtOrderREQUEST_DATE: TDateTimeField
      DisplayLabel = 'Request Date'
      DisplayWidth = 18
      FieldName = 'REQUEST_DATE'
    end
    object QryPtOrderDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryPtOrderFG_LOTNO: TStringField
      DisplayLabel = 'FG Lot #'
      DisplayWidth = 30
      FieldName = 'FG_LOTNO'
      Size = 60
    end
    object QryPtOrderJOB_SEQ: TBCDField
      DisplayLabel = 'Job Sequence'
      DisplayWidth = 10
      FieldName = 'JOB_SEQ'
      Size = 0
    end
    object QryPtOrderREL_QUAN: TBCDField
      DisplayWidth = 10
      FieldName = 'REL_QUAN'
      Visible = False
      Size = 2
    end
    object QryPtOrderPTALLOCATE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PTALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderUNIT: TStringField
      DisplayWidth = 10
      FieldName = 'UNIT'
      Visible = False
      Size = 10
    end
    object QryPtOrderORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderWORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object QryPtOrderPARTNO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 49
    Top = 165
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
    ModuleName = 'FrmAssyTrackDispatch'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197122 $'
    BuildVersion = '176554'
    Left = 83
    Top = 166
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbtnInsert'
      'sbtnRemove')
    SecurityCode = 'FRMASSYTRACKDISPATCH'
    Left = 118
    Top = 167
  end
  object popmDisptachList: TUniPopupMenu
    OnPopup = popmDisptachListPopup
    Left = 50
    Top = 275
    object JumpToWorkOrder1: TUniMenuItem
      Caption = 'Jump To Work Order'
      OnClick = JumpToWorkOrder1Click
    end
    object JumpToSchedule1: TUniMenuItem
      Caption = 'Jump To Schedule'
      OnClick = JumpToSchedule1Click
    end
    object JumpToProcessMaintenance1: TUniMenuItem
      Caption = 'Jump To Process Maintenance'
      OnClick = JumpToProcessMaintenance1Click
    end
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
  end
  object IQJumpWorkOrder: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = SrcSndop_Dispatch
    JumpTo = jtWorkOrder
    Left = 80
    Top = 275
  end
  object IQJumpBOM: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcSndop_Dispatch
    JumpTo = jtBom
    Left = 108
    Top = 275
  end
  object popmOrderDtl: TUniPopupMenu
    Left = 48
    Top = 311
    object JumpToSalesOrder1: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = JumpToSalesOrder1Click
    end
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpOE: TIQWebJump
    DataField = 'ORDERS_ID'
    DataSource = SrcPtOrder
    JumpTo = jtSalesOrder
    Left = 80
    Top = 311
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcPtOrder
    JumpTo = jtInventory
    Left = 112
    Top = 311
  end
end
