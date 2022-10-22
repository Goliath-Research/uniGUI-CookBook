object FrmEmpAllocLabor: TFrmEmpAllocLabor
  Left = 192
  Top = 158
  HelpContext = 1064059
  ClientHeight = 326
  ClientWidth = 546
  Caption = 'Employee Labor Allocation'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 546
    Height = 307
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'New'
      object Splitter2: TUniSplitter
        Left = 242
        Top = 44
        Width = 6
        Height = 203
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel4: TUniPanel
        Left = 0
        Top = 44
        Width = 242
        Height = 203
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object IQSearch1: TIQUniGridControl
          Left = 1
          Top = 20
          Width = 218
          Height = 183
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 1
          IQComponents.Grid.Height = 97
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = wwSrcSndOp
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
          IQComponents.Navigator.DataSource = wwSrcSndOp
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 1
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 97
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = wwSrcSndOp
          Columns = <
            item
              FieldName = 'OPNO'
              Title.Caption = 'Oper #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          OnMouseDown = IQSearch1MouseDown
          Marker = 0
        end
        object Panel6: TUniPanel
          Left = 218
          Top = 20
          Width = 24
          Height = 183
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnRight: TUniSpeedButton
            Left = 4
            Top = 26
            Width = 18
            Height = 20
            Hint = ''
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777077777700077777700777770007777770607777000770000066077
              7000770666666607700077066666666070007706666666077000770000066077
              7000777777060777700077777700777770007777770777777000777777777777
              7000}
            Caption = ''
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Style = [fsBold]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnRightClick
          end
          object sbtnLeft: TUniSpeedButton
            Left = 4
            Top = 57
            Width = 18
            Height = 19
            Hint = ''
            Glyph.Data = {
              DE000000424DDE0000000000000076000000280000000D0000000D0000000100
              0400000000006800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7000777777077777700077777007777770007777060777777000777066000007
              7000770666666607700070666666660770007706666666077000777066000007
              7000777706077777700077777007777770007777770777777000777777777777
              7000}
            Caption = ''
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Style = [fsBold]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnLeftClick
          end
        end
        object Panel3: TUniPanel
          Left = 1
          Top = 1
          Width = 240
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 2
          Caption = ''
          Color = clBtnShadow
          object Label9: TUniLabel
            Left = 1
            Top = 1
            Width = 117
            Height = 13
            Hint = ''
            Caption = 'Standard Operations'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
      object Panel5: TUniPanel
        Left = 248
        Top = 44
        Width = 290
        Height = 203
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object grdSelSndOp: TUniStringGrid
          Left = 1
          Top = 20
          Width = 288
          Height = 183
          Hint = ''
          FixedCols = 0
          RowCount = 2
          ColCount = 4
          DefaultColWidth = 51
          DefaultRowHeight = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goEditing]
          Columns = <>
          OnSelectCell = grdSelSndOpSelectCell
          OnMouseDown = IQSearch1MouseDown
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 1
          Width = 288
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 1
          Caption = ''
          Color = clBtnShadow
          object Label10: TUniLabel
            Left = 1
            Top = 1
            Width = 114
            Height = 13
            Hint = ''
            Caption = 'Selected Operations'
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
      object Panel8: TUniPanel
        Left = 0
        Top = 247
        Width = 538
        Height = 32
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        DesignSize = (
          538
          32)
        object btnOK: TUniButton
          Left = 328
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&OK'
          Anchors = [akTop, akRight]
          TabOrder = 1
          OnClick = btnOKClick
        end
        object btnCancel: TUniButton
          Left = 432
          Top = 5
          Width = 97
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          Cancel = True
          ModalResult = 2
          Anchors = [akTop, akRight]
          TabOrder = 2
        end
      end
      object Panel17: TUniPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 44
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Caption = ''
        object Splitter5: TUniSplitter
          Left = 95
          Top = 0
          Width = 6
          Height = 44
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 95
          Height = 42
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 4
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Employee'
            TabOrder = 1
          end
        end
        object PnlClient01: TUniPanel
          Left = 101
          Top = 1
          Width = 437
          Height = 42
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object wwComboEmp: TUniDBLookupComboBox
            Left = 1
            Top = 1
            Width = 253
            Height = 21
            Hint = ''
            ListOnlyMode = lmFollowSource
            ListField = 'EMPNO;FIRST_NAME;LAST_NAME'
            ListSource = wwSrcEmp
            KeyField = 'ID'
            ListFieldIndex = 0
            TabOrder = 0
            Color = clWindow
          end
          object cboxAssignDefault: TUniCheckBox
            Left = 1
            Top = 24
            Width = 200
            Height = 16
            Hint = 'Clear and assign default operations for selected employee'
            ShowHint = True
            ParentShowHint = False
            Checked = True
            Caption = 'Assign employee default operation(s)'
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Previous'
      object Bevel2: TUniPanel
        Left = 0
        Top = 102
        Width = 538
        Height = 3
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
      object Panel2: TUniPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 102
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object Splitter4: TUniSplitter
          Left = 300
          Top = 31
          Width = 6
          Height = 71
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Bevel1: TUniPanel
          Left = 1
          Top = 27
          Width = 536
          Height = 4
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Caption = ''
        end
        object PnlLeft02: TUniPanel
          Left = 1
          Top = 31
          Width = 300
          Height = 71
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 85
            Top = 0
            Width = 6
            Height = 71
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft03: TUniPanel
            Left = 1
            Top = 1
            Width = 85
            Height = 69
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label4: TUniLabel
              Left = 8
              Top = 4
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Item #'
              TabOrder = 1
            end
            object Label8: TUniLabel
              Left = 8
              Top = 27
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 2
            end
            object Label6: TUniLabel
              Left = 8
              Top = 51
              Width = 72
              Height = 13
              Hint = ''
              Caption = 'Ext Description'
              TabOrder = 3
            end
          end
          object PnlClient02: TUniPanel
            Left = 91
            Top = 1
            Width = 209
            Height = 69
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              209
              69)
            object DBEdit3: TUniDBEdit
              Left = 1
              Top = 1
              Width = 207
              Height = 21
              Hint = ''
              DataField = 'ITEMNO'
              DataSource = wwSrcCost_Alloc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clBtnFace
              ReadOnly = True
            end
            object DBEdit5: TUniDBEdit
              Left = 1
              Top = 24
              Width = 207
              Height = 21
              Hint = ''
              DataField = 'DESCRIP'
              DataSource = wwSrcCost_Alloc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clBtnFace
              ReadOnly = True
            end
            object DBEdit6: TUniDBEdit
              Left = 1
              Top = 48
              Width = 207
              Height = 21
              Hint = ''
              DataField = 'Descrip2'
              DataSource = wwSrcCost_Alloc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
        object PnlClient03: TUniPanel
          Left = 306
          Top = 31
          Width = 232
          Height = 71
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Splitter3: TUniSplitter
            Left = 101
            Top = 0
            Width = 2
            Height = 71
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object PnlLeft04: TUniPanel
            Left = 1
            Top = 1
            Width = 101
            Height = 69
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label5: TUniLabel
              Left = 8
              Top = 4
              Width = 40
              Height = 13
              Hint = ''
              Caption = 'Revision'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 27
              Width = 80
              Height = 13
              Hint = ''
              Caption = 'Manufacturing #'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 8
              Top = 51
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Class'
              TabOrder = 3
            end
          end
          object PnlClient04: TUniPanel
            Left = 103
            Top = 1
            Width = 129
            Height = 69
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              129
              69)
            object DBEdit4: TUniDBEdit
              Left = 1
              Top = 1
              Width = 127
              Height = 21
              Hint = ''
              DataField = 'REV'
              DataSource = wwSrcCost_Alloc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              Color = clBtnFace
              ReadOnly = True
            end
            object DBEdit1: TUniDBEdit
              Left = 1
              Top = 24
              Width = 127
              Height = 21
              Hint = ''
              DataField = 'MFGNO'
              DataSource = wwSrcCost_Alloc
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clBtnFace
              ReadOnly = True
            end
            object DBEdit2: TUniDBEdit
              Left = 1
              Top = 47
              Width = 40
              Height = 21
              Hint = ''
              DataField = 'CLASS'
              DataSource = wwSrcCost_Alloc
              TabOrder = 2
              Color = clBtnFace
              ReadOnly = True
            end
          end
        end
        object Panel16: TUniPanel
          Left = 1
          Top = 1
          Width = 536
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Caption = ''
          object DBNavigator1: TUniDBNavigator
            Left = 461
            Top = 1
            Width = 75
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = wwSrcCost_Alloc
            VisibleButtons = [nbDelete, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object wwDBGrid1: TIQUniGridControl
        Left = 0
        Top = 105
        Width = 538
        Height = 174
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 321
        IQComponents.Grid.Height = 88
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcCost_ALloc_Dtl
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
        IQComponents.Navigator.DataSource = wwSrcCost_ALloc_Dtl
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 321
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 88
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcCost_ALloc_Dtl
        Columns = <
          item
            FieldName = 'SEQ'
            Title.Caption = 'Seq #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Oper #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Operation Description'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_DATE'
            Title.Caption = 'Prod Date'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACT_QTY'
            Title.Caption = 'Actual Qty'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ACT_HRS'
            Title.Caption = 'Actual Hours'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EMPNO'
            Title.Caption = 'Emp #'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FIRST_NAME'
            Title.Caption = 'Emp First Name'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_NAME'
            Title.Caption = 'Emp Last Name'
            Width = 64
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 307
    Width = 546
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Manufacturing #'
        Width = 200
      end
      item
        Text = 'Production Date'
        Width = 150
      end
      item
        Text = 'Item #'
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object wwSrcSndOp: TDataSource
    DataSet = wwQrySndOpAll
    Left = 32
    Top = 171
  end
  object wwQrySndOpAll: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select sndop.opno,'
      '       sndop.opdesc as descrip,'
      '       sndop.id as sndop_id'
      '  from sndop'
      ' where sndop.op_class = '#39'OP'#39
      ' ')
    Left = 32
    Top = 195
    object wwQrySndOpAllOPNO: TStringField
      DisplayLabel = 'Oper #'
      DisplayWidth = 9
      FieldName = 'OPNO'
      Origin = 'SNDOP.OPNO'
      Size = 15
    end
    object wwQrySndOpAllDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 21
      FieldName = 'DESCRIP'
      Origin = 'SNDOP.OPDESC'
      Size = 60
    end
    object wwQrySndOpAllSNDOP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SNDOP_ID'
      Origin = 'SNDOP.ID'
      Visible = False
      Size = 0
    end
  end
  object wwSrcEmp: TDataSource
    DataSet = wwQryEmp
    Left = 88
    Top = 171
  end
  object wwQryEmp: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       empno,'
      '       first_name,'
      '       last_name,'
      '       sndop_id'
      '  from pr_emp'
      ' where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      ' order by empno'
      ' '
      ' ')
    Left = 88
    Top = 187
    object wwQryEmpEMPNO: TStringField
      DisplayLabel = 'Emp #'
      DisplayWidth = 15
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object wwQryEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 20
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object wwQryEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 20
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
    object wwQryEmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object wwQryEmpSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'PR_EMP.SNDOP_ID'
      Visible = False
      Size = 0
    end
  end
  object procAppend_Free_Form: TFDStoredProc
    StoredProcName = 'IQMS.COST_OPER.APPEND_FREE_FORM'
    Left = 136
    Top = 188
    ParamData = <
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_STANDARD_ID_IN'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_SNDOP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_ACT_QTY'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ACT_HRS'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_PR_EMP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_DAY_PART_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object wwSrcCost_Alloc: TDataSource
    DataSet = wwTblCost_Alloc
    Left = 196
    Top = 168
  end
  object wwTblCost_Alloc: TFDTable
    BeforeOpen = wwTblCost_AllocBeforeOpen
    OnCalcFields = wwTblCost_AllocCalcFields
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'COST_ALLOC'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'COST_ALLOC'
    Left = 196
    Top = 184
    object wwTblCost_AllocID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object wwTblCost_AllocARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object wwTblCost_AllocSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object wwTblCost_AllocMFGNO: TStringField
      FieldName = 'MFGNO'
      Required = True
      Size = 50
    end
    object wwTblCost_AllocCLASS: TStringField
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object wwTblCost_AllocITEMNO: TStringField
      FieldName = 'ITEMNO'
      Required = True
      Size = 50
    end
    object wwTblCost_AllocREV: TStringField
      FieldName = 'REV'
      Size = 15
    end
    object wwTblCost_AllocDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 100
    end
    object wwTblCost_AllocDescrip2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descrip2'
      Size = 100
      Calculated = True
    end
  end
  object wwSrcCost_ALloc_Dtl: TDataSource
    DataSet = wwTblCost_ALloc_Dtl
    Left = 236
    Top = 168
  end
  object wwTblCost_ALloc_Dtl: TFDTable
    BeforeInsert = wwTblCost_ALloc_DtlBeforeInsert
    IndexFieldNames = 'COST_ALLOC_ID'
    MasterSource = wwSrcCost_Alloc
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'COST_ALLOC_DTL'
    TableName = 'COST_ALLOC_DTL'
    Left = 236
    Top = 184
    object wwTblCost_ALloc_DtlSEQ: TBCDField
      DisplayLabel = 'Seq #'
      DisplayWidth = 5
      FieldName = 'SEQ'
      ReadOnly = True
      Size = 0
    end
    object wwTblCost_ALloc_DtlOPNO: TStringField
      DisplayLabel = 'Oper #'
      DisplayWidth = 10
      FieldName = 'OPNO'
      ReadOnly = True
    end
    object wwTblCost_ALloc_DtlDESCRIP: TStringField
      DisplayLabel = 'Operation Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP'
      ReadOnly = True
      Size = 250
    end
    object wwTblCost_ALloc_DtlPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      DisplayWidth = 14
      FieldName = 'PROD_DATE'
      ReadOnly = True
    end
    object wwTblCost_ALloc_DtlACT_QTY: TFMTBCDField
      DisplayLabel = 'Actual Qty'
      DisplayWidth = 10
      FieldName = 'ACT_QTY'
      Size = 6
    end
    object wwTblCost_ALloc_DtlACT_HRS: TFMTBCDField
      DisplayLabel = 'Actual Hours'
      DisplayWidth = 10
      FieldName = 'ACT_HRS'
      Size = 6
    end
    object wwTblCost_ALloc_DtlEMPNO: TStringField
      DisplayLabel = 'Emp #'
      DisplayWidth = 8
      FieldName = 'EMPNO'
      ReadOnly = True
      Size = 25
    end
    object wwTblCost_ALloc_DtlFIRST_NAME: TStringField
      DisplayLabel = 'Emp First Name'
      DisplayWidth = 17
      FieldName = 'FIRST_NAME'
      ReadOnly = True
      Size = 30
    end
    object wwTblCost_ALloc_DtlLAST_NAME: TStringField
      DisplayLabel = 'Emp Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      ReadOnly = True
      Size = 30
    end
    object wwTblCost_ALloc_DtlELEMENTS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwTblCost_ALloc_DtlSTD_HRS_PART: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'STD_HRS_PART'
      ReadOnly = True
      Visible = False
      Size = 6
    end
    object wwTblCost_ALloc_DtlSTD_RATE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'STD_RATE'
      ReadOnly = True
      Visible = False
      Size = 6
    end
    object wwTblCost_ALloc_DtlPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object wwTblCost_ALloc_DtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 0
    end
    object wwTblCost_ALloc_DtlCOST_ALLOC_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COST_ALLOC_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
end
