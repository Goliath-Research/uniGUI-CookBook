object FrmLotTracking: TFrmLotTracking
  Left = 85
  Top = 159
  HelpContext = 1423836
  ClientHeight = 591
  ClientWidth = 625
  Caption = ''
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 188
    Width = 625
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbFilter: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Set Filter'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
        4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
        6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
        90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
        ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
        C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
        D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
        96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
        E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
        E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
        10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
        F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
        808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
        50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
        FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
        D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
        60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
        F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
        C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
        70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
        B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbFilterClick
    end
  end
  object pgctrlHeader: TUniPageControl
    Left = 0
    Top = 27
    Width = 625
    Height = 161
    Hint = ''
    ActivePage = TabHeader
    TabBarVisible = True
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = pgctrlHeaderChange
    object TabHeader: TUniTabSheet
      Hint = ''
      Caption = 'Transactions'
      object pnlTransHeader: TUniPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 133
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object IQSearch1: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 615
          Height = 131
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 398
          IQComponents.Grid.Height = 45
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcTransLog
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
          IQComponents.Navigator.DataSource = SrcTransLog
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 398
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 45
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcTransLog
          Columns = <
            item
              FieldName = 'SUM_TRANS_QUAN'
              Title.Caption = 'Trans. Qty'
              Width = 10
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Item#'
              Width = 25
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CLASS'
              Title.Caption = 'Class'
              Width = 2
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev.'
              Width = 15
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIPTION'
              Title.Caption = 'Description'
              Width = 35
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'Unit'
              Width = 10
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LOTNO'
              Title.Caption = 'Lot#'
              Width = 25
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
    end
    object TabLotDocsHeader: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Lot Documents'
      object ScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 617
        Height = 133
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ScrollWidth = 350
        object IQExtDocLotDocsHeader: TIQWebExtDoc
          Left = 0
          Top = 0
          Width = 615
          Height = 131
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          BevelOuter = bvNone
          Filter = '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf'
          MasterFields = 'ID'
          MasterSource = SrcArinvtLotDocsHeader
          Source = 'ARINVT_LOT_DOCS'
          TableName = 'ARINVT_LOT_DOCS'
          BeforeInsert = IQExtDocLotDocsHeaderBeforeInsert
        end
      end
    end
    object tabLotControl: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'Lot Control'
      object ScrollBox3: TUniScrollBox
        Left = 0
        Top = 0
        Width = 617
        Height = 133
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ScrollHeight = 400
        object Panel2: TUniPanel
          Left = 0
          Top = 0
          Width = 598
          Height = 400
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter2: TUniSplitter
            Left = 84
            Top = 0
            Width = 6
            Height = 400
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Panel4: TUniPanel
            Left = 1
            Top = 1
            Width = 84
            Height = 398
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object IQUserDefLabelLotControl1: TIQWebUserDefLabel
              Left = 1
              Top = 6
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'CUser1'
              TabOrder = 1
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControl2: TIQWebUserDefLabel
              Left = 1
              Top = 30
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'CUser2'
              TabOrder = 2
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControl3: TIQWebUserDefLabel
              Left = 1
              Top = 54
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'CUser3'
              TabOrder = 3
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControl4: TIQWebUserDefLabel
              Left = 1
              Top = 78
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'CUser4'
              TabOrder = 4
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControl5: TIQWebUserDefLabel
              Left = 1
              Top = 102
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'CUser5'
              TabOrder = 5
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlN1: TIQWebUserDefLabel
              Left = 1
              Top = 126
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'NUser1'
              TabOrder = 6
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlN2: TIQWebUserDefLabel
              Left = 1
              Top = 150
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'NUser2'
              TabOrder = 7
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlN3: TIQWebUserDefLabel
              Left = 1
              Top = 174
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'NUser3'
              TabOrder = 8
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlN4: TIQWebUserDefLabel
              Left = 1
              Top = 198
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'NUser4'
              TabOrder = 9
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlN5: TIQWebUserDefLabel
              Left = 1
              Top = 222
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'NUser5'
              TabOrder = 10
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlD1: TIQWebUserDefLabel
              Left = 1
              Top = 246
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'DUser1'
              TabOrder = 11
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlD2: TIQWebUserDefLabel
              Left = 1
              Top = 270
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'DUser2'
              TabOrder = 12
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlD3: TIQWebUserDefLabel
              Left = 1
              Top = 294
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'DUser3'
              TabOrder = 13
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlD4: TIQWebUserDefLabel
              Left = 1
              Top = 318
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'DUser4'
              TabOrder = 14
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
            object IQUserDefLabelLotControlD5: TIQWebUserDefLabel
              Left = 1
              Top = 342
              Width = 35
              Height = 13
              Hint = ''
              Caption = 'DUser5'
              TabOrder = 15
              OnGetOwnerName = IQUserDefLabelLotControl1GetOwnerName
              ParentAppName = 'IQWIN32.EXE'
            end
          end
          object Panel5: TUniPanel
            Left = 90
            Top = 1
            Width = 508
            Height = 398
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            DesignSize = (
              508
              398)
            object DBEdit1: TUniDBEdit
              Left = 1
              Top = 4
              Width = 505
              Height = 19
              Hint = ''
              DataField = 'CUSER1'
              DataSource = SrcArinvtLotDocsHeader
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object DBEdit2: TUniDBEdit
              Left = 1
              Top = 28
              Width = 505
              Height = 19
              Hint = ''
              DataField = 'CUSER2'
              DataSource = SrcArinvtLotDocsHeader
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object DBEdit3: TUniDBEdit
              Left = 1
              Top = 52
              Width = 505
              Height = 19
              Hint = ''
              DataField = 'CUSER3'
              DataSource = SrcArinvtLotDocsHeader
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
            object DBEdit4: TUniDBEdit
              Left = 1
              Top = 76
              Width = 505
              Height = 19
              Hint = ''
              DataField = 'CUSER4'
              DataSource = SrcArinvtLotDocsHeader
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 3
            end
            object DBEdit5: TUniDBEdit
              Left = 1
              Top = 100
              Width = 505
              Height = 19
              Hint = ''
              DataField = 'CUSER5'
              DataSource = SrcArinvtLotDocsHeader
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 4
            end
            object DBEdit6: TUniDBEdit
              Left = 1
              Top = 124
              Width = 138
              Height = 19
              Hint = ''
              DataField = 'NUSER1'
              DataSource = SrcArinvtLotDocsHeader
              TabOrder = 5
            end
            object DBEdit7: TUniDBEdit
              Left = 1
              Top = 148
              Width = 138
              Height = 19
              Hint = ''
              DataField = 'NUSER2'
              DataSource = SrcArinvtLotDocsHeader
              TabOrder = 6
            end
            object DBEdit8: TUniDBEdit
              Left = 1
              Top = 172
              Width = 138
              Height = 19
              Hint = ''
              DataField = 'NUSER3'
              DataSource = SrcArinvtLotDocsHeader
              TabOrder = 7
            end
            object DBEdit9: TUniDBEdit
              Left = 1
              Top = 196
              Width = 138
              Height = 19
              Hint = ''
              DataField = 'NUSER4'
              DataSource = SrcArinvtLotDocsHeader
              TabOrder = 8
            end
            object DBEdit10: TUniDBEdit
              Left = 1
              Top = 220
              Width = 138
              Height = 19
              Hint = ''
              DataField = 'NUSER5'
              DataSource = SrcArinvtLotDocsHeader
              TabOrder = 9
            end
            object wwDBDateTimePicker1: TUniDBDateTimePicker
              Left = 1
              Top = 243
              Width = 138
              Height = 21
              Hint = ''
              DataField = 'DUSER1'
              DataSource = SrcArinvtLotDocsHeader
              DateTime = 42631.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 10
            end
            object wwDBDateTimePicker2: TUniDBDateTimePicker
              Left = 1
              Top = 267
              Width = 138
              Height = 21
              Hint = ''
              DataField = 'DUSER2'
              DataSource = SrcArinvtLotDocsHeader
              DateTime = 42631.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 11
            end
            object wwDBDateTimePicker3: TUniDBDateTimePicker
              Left = 1
              Top = 291
              Width = 138
              Height = 21
              Hint = ''
              DataField = 'DUSER3'
              DataSource = SrcArinvtLotDocsHeader
              DateTime = 42631.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 12
            end
            object wwDBDateTimePicker4: TUniDBDateTimePicker
              Left = 1
              Top = 315
              Width = 138
              Height = 21
              Hint = ''
              DataField = 'DUSER4'
              DataSource = SrcArinvtLotDocsHeader
              DateTime = 42631.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 13
            end
            object wwDBDateTimePicker5: TUniDBDateTimePicker
              Left = 1
              Top = 339
              Width = 138
              Height = 21
              Hint = ''
              DataField = 'DUSER5'
              DataSource = SrcArinvtLotDocsHeader
              DateTime = 42631.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              TabOrder = 14
            end
          end
        end
      end
    end
  end
  object pgctrlDependent: TUniPageControl
    Left = 0
    Top = 191
    Width = 625
    Height = 400
    Hint = ''
    ActivePage = TabDependednt
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabDependednt: TUniTabSheet
      Hint = ''
      Caption = 'Dependent Transactions'
      object pnlDetails: TUniPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 372
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object spliDetailsArchived: TUniSplitter
          Left = 0
          Top = 187
          Width = 617
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object Panel6: TUniPanel
          Left = 1
          Top = 1
          Width = 615
          Height = 187
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object bvlDetailsCurrentLeft: TUniPanel
            Left = 1
            Top = 20
            Width = 16
            Height = 167
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
          end
          object IQSearch2: TIQUniGridControl
            Left = 16
            Top = 20
            Width = 599
            Height = 167
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 382
            IQComponents.Grid.Height = 81
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcDetail
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
            IQComponents.Navigator.DataSource = SrcDetail
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 382
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 81
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcDetail
            Columns = <
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 2
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 35
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Rev'
                Width = 15
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNIT'
                Title.Caption = 'Unit'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RG_QUAN'
                Title.Caption = 'RG Qty.'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'TRANS_QUAN'
                Title.Caption = 'Trans. Qty.'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LOTNO'
                Title.Caption = 'RM Lot#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object pnlDetailsCurrentTop: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 613
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 1
            Caption = ''
            Color = clBtnShadow
            object lblCaption: TUniLabel
              Left = 1
              Top = 1
              Width = 119
              Height = 13
              Hint = ''
              Caption = 'Current Transactions'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
        object pnlDetailsArchived: TUniPanel
          Left = 1
          Top = 190
          Width = 615
          Height = 182
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object bvlDetailsArchivedLeft: TUniPanel
            Left = 1
            Top = 20
            Width = 16
            Height = 162
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
          end
          object IQSearch3: TIQUniGridControl
            Left = 16
            Top = 20
            Width = 599
            Height = 162
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 382
            IQComponents.Grid.Height = 76
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcDetailsArchived
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
            IQComponents.Navigator.DataSource = SrcDetailsArchived
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 382
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 76
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcDetailsArchived
            Columns = <
              item
                FieldName = 'CLASS'
                Title.Caption = 'Class'
                Width = 2
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'ITEMNO'
                Title.Caption = 'Item#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DESCRIP'
                Title.Caption = 'Description'
                Width = 35
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'REV'
                Title.Caption = 'Rev'
                Width = 15
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'UNIT'
                Title.Caption = 'Unit'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'RG_QUAN'
                Title.Caption = 'RG Qty.'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'TRANS_QUAN'
                Title.Caption = 'Trans. Qty.'
                Width = 10
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'LOTNO'
                Title.Caption = 'RM Lot#'
                Width = 25
                CheckBoxField.FieldValues = 'true;false'
              end>
            Marker = 0
          end
          object pnlDetailsArchivedTop: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 613
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
              Width = 126
              Height = 13
              Hint = ''
              Caption = 'Archived Transactions'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
      end
    end
    object TabLotDocsDependent: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Lot Documents'
      object pnlLotDocs: TUniPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 372
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 0
          Top = 201
          Width = 617
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object pnlLotDocsTop: TUniPanel
          Left = 1
          Top = 1
          Width = 615
          Height = 201
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object bvlLotDocsCurrentLeft: TUniPanel
            Left = 1
            Top = 20
            Width = 16
            Height = 181
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
          end
          object IQExtDocLotDocsDependent: TIQWebExtDoc
            Left = 16
            Top = 20
            Width = 599
            Height = 181
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            BevelOuter = bvNone
            Filter = '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf'
            MasterFields = 'ID'
            MasterSource = SrcArinvtLotDocsDetail
            Source = 'ARINVT_LOT_DOCS'
            TableName = 'ARINVT_LOT_DOCS'
            BeforeInsert = IQExtDocLotDocsDependentBeforeInsert
          end
          object pnlLotDocsCurrentTop: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 613
            Height = 20
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            TabOrder = 1
            Caption = ''
            Color = clBtnShadow
            object Label2: TUniLabel
              Left = 1
              Top = 1
              Width = 119
              Height = 13
              Hint = ''
              Caption = 'Current Transactions'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
        object pnlLotDocsArchived: TUniPanel
          Left = 1
          Top = 204
          Width = 615
          Height = 168
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object bvlLotDocsArchivedLeft: TUniPanel
            Left = 1
            Top = 20
            Width = 16
            Height = 148
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
            Caption = ''
          end
          object IQExtDocLotDocsDependentArchived: TIQWebExtDoc
            Left = 16
            Top = 20
            Width = 599
            Height = 148
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            BevelOuter = bvNone
            Filter = '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf'
            MasterFields = 'ID'
            MasterSource = SrcArinvtLotDocsDetailArchived
            Source = 'ARINVT_LOT_DOCS'
            TableName = 'ARINVT_LOT_DOCS'
            BeforeInsert = IQExtDocLotDocsDependentArchivedBeforeInsert
          end
          object pnlLotDocsArchivedTop: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 613
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
              Width = 126
              Height = 13
              Hint = ''
              Caption = 'Archived Transactions'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    Top = 65533
    object File1: TUniMenuItem
      Caption = '&File'
      object Filter1: TUniMenuItem
        Caption = '&Filter'
        OnClick = sbFilterClick
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 274
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Lot Number Tracking'
    Version = 'Feature unsupported'
    ChangeListNumber = '$Change: 187498 $'
    Left = 335
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmLotTracking'
    WebUse = False
    TouchScreen = False
    Left = 368
  end
  object SrcTransLog: TDataSource
    DataSet = QryTransLog
    Left = 192
    Top = 83
  end
  object QryTransLog: TFDQuery
    AfterScroll = QryTransLogAfterScroll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select trans_quan as sum_trans_quan,'
      '       itemno as itemno,'
      '       class,'
      '       rev,'
      '       DESCRIP as description,'
      '       unit,'
      '       lotno,'
      '       arinvt_id'
      '  from translog'
      ' ')
    Left = 192
    Top = 96
    object QryTransLogSUM_TRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans. Qty'
      DisplayWidth = 10
      FieldName = 'SUM_TRANS_QUAN'
      Size = 6
    end
    object QryTransLogITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryTransLogCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
    object QryTransLogREV: TStringField
      DisplayLabel = 'Rev.'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object QryTransLogDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryTransLogUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 10
    end
    object QryTransLogLOTNO: TStringField
      DisplayLabel = 'Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object QryTransLogARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDetail: TDataSource
    Left = 180
    Top = 284
  end
  object QryDtl: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select /*+ INDEX( translog ix_translog_trunc_fg_lotno ) */'
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       descrip,'
      '       rev,'
      '       unit,'
      '       trans_quan,'
      '       rg_quan,'
      '       lotno'
      '  from translog'
      ' where fg_lotno = '#39'ZZZ'#39
      '   and rtrim(fg_lotno) is not null'
      '   and itemno is not null '
      '   and batch in (select distinct batch '
      '                   from translog '
      '                  where fg_lotno = '#39'ZZZ'#39
      '                    and RTrim(fg_lotno) is not null '
      '                    and parent_arinvt_id = 9999999'
      '                    and itemno is not null)'
      ''
      '   '
      '')
    Left = 181
    Top = 297
    object QryDtlCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
    object QryDtlITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryDtlREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object QryDtlUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 10
    end
    object QryDtlRG_QUAN: TFMTBCDField
      DisplayLabel = 'RG Qty.'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 'RG_QUAN'
      Size = 6
    end
    object QryDtlTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans. Qty.'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 'TRANS_QUAN'
      Size = 6
    end
    object QryDtlLOTNO: TStringField
      DisplayLabel = 'RM Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object QryDtlARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 224
    Top = 84
    object ShowDetails1: TUniMenuItem
      Caption = '&Show Dependent Transactions'
      OnClick = ShowDetails1Click
    end
    object DrillDown2: TUniMenuItem
      Caption = '&Transaction Detail'
      OnClick = DrillDown2Click
    end
    object LotTree1: TUniMenuItem
      Caption = '&Lot# Tree'
      OnClick = LotTree1Click
    end
    object RevLotTree1: TUniMenuItem
      Caption = '&Reverse Lot# Tree'
      OnClick = RevLotTree1Click
    end
    object CountryOfOrigin1: TUniMenuItem
      Caption = 'Country Of Origin'
      OnClick = CountryOfOrigin1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object JumptoInventory1: TUniMenuItem
      Caption = '&Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 280
    Top = 284
    object DrillDown1: TUniMenuItem
      Caption = '&Transaction Detail'
      OnClick = DrillDown1Click
    end
    object LotTree2: TUniMenuItem
      Caption = '&Lot# Tree'
      OnClick = LotTree2Click
    end
    object RevLotTree2: TUniMenuItem
      Caption = '&Reverse Lot# Tree'
      OnClick = RevLotTree2Click
    end
    object CountryOfOrigin2: TUniMenuItem
      Caption = 'Country Of Origin'
      OnClick = CountryOfOrigin2Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object JumptoInventory2: TUniMenuItem
      Caption = '&Jump to Inventory'
      OnClick = JumptoInventory2Click
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'sbFilter'
      'Filter1'
      'Reports1'
      'Print1'
      'PrinterSetup1'
      'PrinterSetupDialog1'
      'ShowDetails1'
      'DrillDown2'
      'LotTree1'
      'RevLotTree1'
      'JumptoInventory1'
      'DrillDown1'
      'LotTree2'
      'RevLotTree2'
      'JumptoInventory2')
    SecurityCode = 'FRMLOTTRACKING'
    Left = 268
    Top = 84
  end
  object SrcArinvtLotDocsHeader: TDataSource
    DataSet = QryArinvtLotDocsHeader
    Left = 309
    Top = 84
  end
  object QryArinvtLotDocsHeader: TFDQuery
    MasterSource = SrcTransLog
    MasterFields = 'ARINVT_ID;LOTNO'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       country,'
      '       cuser1,'
      '       cuser2,'
      '       cuser3,'
      '       cuser4,'
      '       cuser5,'
      '       nuser1,'
      '       nuser2,'
      '       nuser3,'
      '       nuser4,'
      '       nuser5,'
      '       duser1,'
      '       duser2,'
      '       duser3,'
      '       duser4,'
      '       duser5'
      '  from arinvt_lot_docs'
      ' where arinvt_id = :arinvt_id'
      '   and NVL(rtrim(lotno), '#39'*'#39') = NVL(rtrim(:lotno), '#39'*'#39')'
      '  ')
    Left = 308
    Top = 105
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'LOTNO'
        DataType = ftString
        ParamType = ptInput
        Size = 26
      end>
    object QryArinvtLotDocsHeaderID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryArinvtLotDocsHeaderCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Visible = False
      Size = 100
    end
    object QryArinvtLotDocsHeaderCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object QryArinvtLotDocsHeaderCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object QryArinvtLotDocsHeaderCUSER3: TStringField
      FieldName = 'CUSER3'
      Size = 60
    end
    object QryArinvtLotDocsHeaderCUSER4: TStringField
      FieldName = 'CUSER4'
      Size = 60
    end
    object QryArinvtLotDocsHeaderCUSER5: TStringField
      FieldName = 'CUSER5'
      Size = 60
    end
    object QryArinvtLotDocsHeaderNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Size = 6
    end
    object QryArinvtLotDocsHeaderNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Size = 6
    end
    object QryArinvtLotDocsHeaderNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Size = 6
    end
    object QryArinvtLotDocsHeaderNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Size = 6
    end
    object QryArinvtLotDocsHeaderNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Size = 6
    end
    object QryArinvtLotDocsHeaderDUSER1: TDateTimeField
      FieldName = 'DUSER1'
    end
    object QryArinvtLotDocsHeaderDUSER2: TDateTimeField
      FieldName = 'DUSER2'
    end
    object QryArinvtLotDocsHeaderDUSER3: TDateTimeField
      FieldName = 'DUSER3'
    end
    object QryArinvtLotDocsHeaderDUSER4: TDateTimeField
      FieldName = 'DUSER4'
    end
    object QryArinvtLotDocsHeaderDUSER5: TDateTimeField
      FieldName = 'DUSER5'
    end
  end
  object SrcArinvtLotDocsDetail: TDataSource
    DataSet = QryArinvtLotDocsDetail
    Left = 177
    Top = 340
  end
  object QryArinvtLotDocsDetail: TFDQuery
    MasterSource = SrcDetail
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, country'
      '  from arinvt_lot_docs'
      ' where arinvt_id = :arinvt_id'
      '   and NVL(rtrim(lotno), '#39'*'#39') = NVL(rtrim(:lotno), '#39'*'#39')'
      '  ')
    Left = 177
    Top = 352
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'LOTNO'
        DataType = ftString
        ParamType = ptInput
        Size = 26
      end>
    object QryArinvtLotDocsDetailID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryArinvtLotDocsDetailCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Visible = False
      Size = 100
    end
  end
  object SrcDetailsArchived: TDataSource
    Left = 228
    Top = 287
  end
  object QryDetailsArchived: TFDQuery
    Tag = 1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       arinvt_id,'
      '       class,'
      '       itemno,'
      '       descrip,'
      '       rev,'
      '       unit,'
      '       trans_quan,'
      '       rg_quan,'
      '       lotno'
      '  from hist_translog'
      ' where fg_lotno = '#39'ZZZ'#39
      '   and rtrim(fg_lotno) is not null'
      '   and itemno is not null '
      '   and batch in (select distinct batch '
      '                   from hist_translog '
      '                  where fg_lotno = '#39'ZZZ'#39
      '                    and RTrim(fg_lotno) is not null '
      '                    and parent_arinvt_id = 9999999 '
      '                    and itemno is not null)'
      '')
    Left = 228
    Top = 298
    object QryDetailsArchivedCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Size = 2
    end
    object QryDetailsArchivedITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Size = 50
    end
    object QryDetailsArchivedDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryDetailsArchivedREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'REV'
      Size = 15
    end
    object QryDetailsArchivedUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 10
    end
    object QryDetailsArchivedRG_QUAN: TFMTBCDField
      DisplayLabel = 'RG Qty.'
      DisplayWidth = 10
      FieldName = 'RG_QUAN'
      Origin = 'RG_QUAN'
      Size = 6
    end
    object QryDetailsArchivedTRANS_QUAN: TFMTBCDField
      DisplayLabel = 'Trans. Qty.'
      DisplayWidth = 10
      FieldName = 'TRANS_QUAN'
      Origin = 'TRANS_QUAN'
      Size = 6
    end
    object QryDetailsArchivedLOTNO: TStringField
      DisplayLabel = 'RM Lot#'
      DisplayWidth = 25
      FieldName = 'LOTNO'
      Origin = 'LOTNO'
      Size = 25
    end
    object QryDetailsArchivedARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu3: TUniPopupMenu
    Left = 324
    Top = 285
    object TransactionDetail1: TUniMenuItem
      Caption = 'Transaction Detail'
      OnClick = TransactionDetail1Click
    end
    object CountryOfOrigin3: TUniMenuItem
      Caption = 'Country Of Origin'
      OnClick = CountryOfOrigin3Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object JumpToInventory3: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory3Click
    end
  end
  object SrcArinvtLotDocsDetailArchived: TDataSource
    DataSet = QryArinvtLotDocsDetailArchived
    Left = 228
    Top = 338
  end
  object QryArinvtLotDocsDetailArchived: TFDQuery
    Tag = 1
    MasterSource = SrcDetailsArchived
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, country'
      '  from arinvt_lot_docs'
      ' where arinvt_id = :arinvt_id'
      '   and NVL(rtrim(lotno), '#39'*'#39') = NVL(rtrim(:lotno), '#39'*'#39')'
      '  '
      '')
    Left = 228
    Top = 354
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'LOTNO'
        DataType = ftString
        ParamType = ptInput
        Size = 26
      end>
    object QryArinvtLotDocsDetailArchivedID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryArinvtLotDocsDetailArchivedCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 100
    end
  end
end
