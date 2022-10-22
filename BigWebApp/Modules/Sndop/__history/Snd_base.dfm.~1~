object SndBase: TSndBase
  Left = 302
  Top = 207
  HelpContext = 1191326
  ClientHeight = 485
  ClientWidth = 1033
  Caption = 'SndOp Base Object'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 168
    Width = 1033
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PageControlHeader: TUniPageControl
    Left = 0
    Top = 27
    Width = 1033
    Height = 141
    Hint = ''
    ActivePage = TabSheetForm
    TabBarVisible = True
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    TabStop = False
    object TabSheetForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabForm'
      object PnlHeader01: TUniPanel
        Left = 0
        Top = 0
        Width = 231
        Height = 113
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object SplitterHeader01: TUniSplitter
          Left = 81
          Top = 0
          Width = 6
          Height = 113
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlHeaderLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 81
          Height = 111
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label2: TUniLabel
            Left = 8
            Top = 4
            Width = 59
            Height = 13
            Hint = ''
            Caption = 'Operation #'
            TabOrder = 1
          end
          object Label7: TUniLabel
            Left = 8
            Top = 28
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Class'
            TabOrder = 2
          end
          object Label1: TUniLabel
            Left = 8
            Top = 52
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Description'
            TabOrder = 3
          end
        end
        object PnlHeaderClient01: TUniPanel
          Left = 87
          Top = 1
          Width = 144
          Height = 111
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            144
            111)
          object dbeOpNo: TUniDBEdit
            Left = 1
            Top = 1
            Width = 100
            Height = 21
            Hint = ''
            DataField = 'OPNO'
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object dbeClass: TUniDBEdit
            Left = 1
            Top = 24
            Width = 37
            Height = 21
            Hint = ''
            DataField = 'OP_CLASS'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            TabOrder = 1
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
          end
          object dbeOpDesc: TUniDBEdit
            Left = 1
            Top = 47
            Width = 143
            Height = 21
            Hint = ''
            DataField = 'OPDESC'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object dbchkPkHide: TUniDBCheckBox
            Left = 1
            Top = 73
            Width = 97
            Height = 13
            Hint = ''
            DataField = 'PK_HIDE'
            DataSource = SndDM.SrcSndOp
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Inactive'
            TabOrder = 3
          end
          object dbchkSupermarket: TUniDBCheckBox
            Left = 1
            Top = 90
            Width = 97
            Height = 17
            Hint = ''
            DataField = 'IS_SUPERMARKET'
            DataSource = SndDM.SrcSndOp
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Supermarket'
            TabOrder = 4
          end
        end
      end
    end
    object TabSheetTable: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabTable'
      object dbgOperHeader: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 1025
        Height = 113
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 808
        IQComponents.Grid.Height = 27
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SndDM.SrcSndOp
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
        IQComponents.Navigator.DataSource = SndDM.SrcSndOp
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 808
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 27
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SndDM.SrcSndOp
        Columns = <
          item
            FieldName = 'OP_CLASS'
            Title.Caption = 'Class'
            Width = 40
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPNO'
            Title.Caption = 'Oper #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'OPDESC'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER1'
            Title.Caption = 'CUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER2'
            Title.Caption = 'CUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER3'
            Title.Caption = 'CUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER4'
            Title.Caption = 'CUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER5'
            Title.Caption = 'CUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER6'
            Title.Caption = 'CUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER7'
            Title.Caption = 'CUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER8'
            Title.Caption = 'CUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER9'
            Title.Caption = 'CUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CUSER10'
            Title.Caption = 'CUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER1'
            Title.Caption = 'NUSER1'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER2'
            Title.Caption = 'NUSER2'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER3'
            Title.Caption = 'NUSER3'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER4'
            Title.Caption = 'NUSER4'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER5'
            Title.Caption = 'NUSER5'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER6'
            Title.Caption = 'NUSER6'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER7'
            Title.Caption = 'NUSER7'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER8'
            Title.Caption = 'NUSER8'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER9'
            Title.Caption = 'NUSER9'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NUSER10'
            Title.Caption = 'NUSER10'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'IS_SUPERMARKET'
            Title.Caption = 'Supermarket'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object PageControlDetails: TUniPageControl
    Left = 0
    Top = 171
    Width = 1033
    Height = 314
    Hint = ''
    ActivePage = TabSheet1
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    TabStop = False
    object TabSheetOpInfo: TUniTabSheet
      Hint = ''
      Caption = 'Operation'
    end
    object TabSheetMaterials: TUniTabSheet
      Hint = ''
      Caption = 'Materials'
      object Splitter2: TUniSplitter
        Left = 859
        Top = 0
        Width = 4
        Height = 286
        Hint = ''
        Align = alRight
        ParentColor = False
        Color = clBtnFace
      end
      object pnlMaterials: TUniPanel
        Left = 0
        Top = 0
        Width = 859
        Height = 286
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object GridMaterials: TUniDBGrid
          Left = 1
          Top = 27
          Width = 857
          Height = 259
          Hint = ''
          DataSource = SndDM.SrcOpMat
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          ParentColor = False
          Color = clBtnFace
          Columns = <
            item
              FieldName = 'ItemNo'
              Title.Caption = 'Item #'
              Width = 154
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PTSPER_DISP'
              Title.Caption = 'Parts Per'
              Width = 60
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Class'
              Title.Caption = 'Class'
              Width = 30
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip'
              Title.Caption = 'Description'
              Width = 96
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'UNIT'
              Title.Caption = 'UOM'
              Width = 64
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Descrip2'
              Title.Caption = 'Ext Description'
              Width = 214
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Rev'
              Title.Caption = 'Rev'
              Width = 94
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Uom'
              Title.Caption = 'Native UOM'
              Width = 72
              ReadOnly = True
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STARTUP_QTY'
              Title.Caption = 'Startup Qty'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INCLUDE_STARTUP_QTY_STD_COST'
              Title.Caption = 'Include Startup Qty in Std Cost'
              Width = 154
              PickList.Strings = (
                'Y'
                'N')
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object Panel1: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 857
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object navMaterials: TUniDBNavigator
            Left = 632
            Top = 1
            Width = 225
            Height = 25
            Hint = ''
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object pnlMatQPB: TUniPanel
        Left = 863
        Top = 0
        Width = 162
        Height = 286
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'pnlMatQPB'
        object GridQtyBreaks: TUniDBGrid
          Left = 1
          Top = 27
          Width = 160
          Height = 259
          Hint = ''
          DataSource = SndDM.SrcArinvt_Breaks
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'QUAN'
              Title.Caption = 'Quantity'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'QPRICE'
              Title.Caption = 'Price Break'
              Width = 72
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object Panel2: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 160
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object navMatQPB: TUniDBNavigator
            Left = 35
            Top = 1
            Width = 125
            Height = 25
            Hint = ''
            DataSource = SndDM.SrcArinvt_Breaks
            VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Documents'
      object PageControl1: TUniPageControl
        Left = 0
        Top = 0
        Width = 1025
        Height = 286
        Hint = ''
        ActivePage = tabDocInternal
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object tabDocInternal: TUniTabSheet
          Hint = ''
          Caption = 'Internal'
          inline IQDocs1: TIQWebDocs
            Left = 0
            Top = 0
            Width = 1017
            Height = 258
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            BevelOuter = bvNone
            ColumnsWidth = 0
            DocClass = 'ST'
            SingleDoc = False
            object FQryIntDocs: TFDQuery
              Left = 176
              Top = 96
            end
          end
        end
        object tabDocExternal: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'External'
          inline IQExtDoc1: TIQWebExtDoc
            Left = 0
            Top = 0
            Width = 1017
            Height = 258
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            BevelOuter = bvNone
            Filter = '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf'
            MasterFields = 'ID'
            object FQryExtDocs: TFDQuery
              CachedUpdates = True
              IndexesActive = False
              IndexFieldNames = 'ID'
              UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
              UpdateOptions.RefreshMode = rmManual
              UpdateOptions.CheckRequired = False
              UpdateOptions.CheckReadOnly = False
              UpdateOptions.CheckUpdatable = False
              UpdateOptions.UpdateTableName = 'EXTERNAL_DOC'
              Left = 168
              Top = 80
            end
            object FSrcExtDocs: TDataSource
              DataSet = IQExtDoc1.FQryExtDocs
              Left = 104
              Top = 152
            end
            object PkDoc: TIQWebHpick
              Title = 'Select from Pick List'
              Touchscreen = False
              ForceShowWaitForPrompt = False
              Left = 200
              Top = 136
            end
          end
        end
      end
    end
  end
  object pnlToolBar: TUniPanel
    Left = 0
    Top = 0
    Width = 1033
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object sbtnTableForm: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table-Form View'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTableFormClick
    end
    object sbtnOpCost: TUniSpeedButton
      Left = 81
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Operation Cost'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C20E0000C20E00000001000000000000000000000000
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
        FDFD0000FDFDFDFDFDFDFDFDFDFDFDFD000003FB00000000FDFDFDFDFDFDFDFD
        00FB00000300030300FDFDFDFDFDFDFD000003FB000000000300FDFDFDFDFDFD
        00FB0000030003030000FDFDFDFDFDFD0000FB03000000000300000000000000
        00FFFBFB03000303000000FFFFFFFFFFA400FFFB00FBFB03030000FFA4A4A4FF
        A4A40000FFFFFBFB030000FFFFFFFFFFFFFFFFA400FFFFFB00FD000000000000
        00000000A4000000FDFD00FFFFFF00FFFFFFFFFF00FDFDFDFDFD00FFFFFF00FF
        FFFFFFFF00FDFDFDFDFD0000000000000000000000FDFDFDFDFD000000000000
        0000000000FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = OperationCost1Click
    end
    object sbtnEquip: TUniSpeedButton
      Left = 131
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Equipment'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB5BCCF334DE24050E0C4C7CDFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C081
        8181818181C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFCACACC6973D70744F5041EFE001AFF1459ED98B2D2FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCACACA90909085858581
        8181818181898989B8B8B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF9C9CD1231DE70920F9003DFF051BFE0020FF005AFF027AF85388DDCACB
        CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A97676767F7F7F88888881
        81818282829292929D9D9D9D9D9DCBCBCBFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF3A3ADD0902FA0728FA0039FF0516FE0025FF0060FF0080FF0060FD1E57
        E9AAB2D0FF00FFFF00FFFF00FFFF00FFFF00FF7878787C7C7C81818187878780
        8080828282959595A3A3A3949494878787B9B9B9FF00FFFF00FFFF00FFFF00FF
        FF00FF3535DD0905F90535FD0032FF0512FE002CFF1371FF0986FF005CFF0041
        FF0630F56B78D8FF00FFFF00FFFF00FFFF00FF7676767C7C7C85858585858580
        80808484849C9C9CA6A6A6939393898989808080939393FF00FFFF00FFFF00FF
        FF00FF3432DE0C05F90539FD002CFF020EFD0034FF207DFF3298FF1866FF0040
        FF002BFF0015FD4B4EDCFF00FFFF00FFFF00FF7676767C7C7C8686868484847F
        7F7F868686A2A2A2B1B1B19797978989898484847F7F7F7F7F7FFF00FFFF00FF
        FF00FF2F2DDF0C07F90045FD0027FF0009FD0E42FF2486FF3497FF588CE95C80
        F4072CFF0013FF2B2FE2FF00FFFF00FFFF00FF7575757C7C7C8A8A8A8383837F
        7F7F8A8A8AA7A7A7B0B0B0A3A3A3A1A1A1848484808080777777FF00FFFF00FF
        FF00FF4442C70E09F70047FF1534FD1E25FB1535FA2986FD1D86FF547DC8C1B7
        B62542FF0012FF2526E4FF00FFFF00FFFF00FF7171717C7C7C8B8B8B85858581
        8181848484A6A6A6A7A7A78F8F8FB8B8B88A8A8A808080767676FF00FFFF00FF
        FF00FF312EC21D20FA3247FD3B55F43745D32D63CA104FB66095DC627FB4B6B0
        B71B37FF0210FF1E1FE6FF00FFFF00FFFF00FF6767678080808A8A8A8C8C8C77
        77778080806E6E6EA5A5A58B8B8BB2B2B2878787808080757575FF00FFFF00FF
        3758D5121EC72527A32F32A73E57AF2F71D3099AD04C83C1C1C4CA949494626B
        8F0E25CB0714F11717E7FF00FFFF00FF8080806666665656565C5C5C7070708B
        8B8BA3A3A3909090C5C5C5949494737373696969797979757575CACACC3E3BD9
        0541FD000CEE0000D70000C22342CF2F85E62650B4595D75C7C7C7535C74B4B4
        B4273171424EAA7A7AC7CACACA7777778888887777776A6A6A5F5F5F7474749D
        9D9D6E6E6E626262C7C7C7616161B4B4B44444446A6A6A8F8F8F3D3CDF2B2CF3
        0017C70000B60000BC0000C10000BE0509B107078873738DABABAB7B7B7B9C9C
        9C707070B5B5B8FF00FF7A7A7A7F7F7F6464645959595C5C5C5E5E5E5D5D5D57
        5757414141797979ABABAB7B7B7B9C9C9C707070B6B6B6FF00FF2A2AE70606ED
        0202D40313C60217B800009B0000970000911B1E918D8D92A8A8A88D8D8D7A7A
        7ABCBCBC717171FF00FF7979797676766969696363635C5C5C4A4A4A48484845
        45454B4B4B8E8E8EA8A8A88D8D8D7A7A7ABCBCBC717171FF00FFABABD07070D1
        3F3FCE1B2FD60435F0023AF40229DC0218C80920F09E9EC1BEBEBEB5B5B58181
        81A2A2A27B7B7BFF00FFB4B4B48C8C8C7373737070707F7F7F82828272727265
        65657A7A7AA6A6A6BEBEBEB5B5B5818181A2A2A27B7B7BFF00FFFF00FFFF00FF
        FF00FFFF00FFC8C8CC9494D35E61D93543E09E9ED1FF00FFFF00FFFF00FFB1B1
        B16F6F6F919191FF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9A4A4A48787877C
        7C7CABABABFF00FFFF00FFFF00FFB1B1B16F6F6F919191FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = Equipment1Click
    end
    object sbtnQtyPrice: TUniSpeedButton
      Left = 106
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Qty Price Breaks'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF4848484848484848484848484848484848484848484848484848
        48484848484848FF00FFFF00FFFF00FFFF00FFFF00FF48484848484848484848
        4848484848484848484848484848484848484848484848FF00FFFF00FFFF00FF
        C8C8C8C8C8C8606060E8F9EED1F3DCBAEDCBA3E8BA86E0A463D88A40CF7033CC
        6633CC66484848FF00FFFF00FFFF00FFC8C8C8C8C8C8606060F6F6F6EDEDEDE3
        E3E3DCDCDCD0D0D0C5C5C5B9B9B9B5B5B5B5B5B5484848FF00FFFF00FF993300
        993300993300606060E8F9EED1F3DCBAEDCBA3E8BA86E0A463D88A40CF7033CC
        6633CC66484848FF00FFFF00FF3D3D3D3D3D3D3D3D3D606060F6F6F6EDEDEDE3
        E3E3DCDCDCD0D0D0C5C5C5B9B9B9B5B5B5B5B5B5484848FF00FFFF00FF993300
        C8C8C8FF00FF6060606060606060606060606060606060606060606060606060
        60606060484848FF00FFFF00FF3D3D3DC8C8C8FF00FF60606060606060606060
        6060606060606060606060606060606060606060484848FF00FFFF00FF993300
        C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300
        C8C8C8FF00FF4848484848484848484848484848484848484848484848484848
        48FF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8FF00FF48484848484848484848
        4848484848484848484848484848484848FF00FFFF00FFFF00FFFF00FF993300
        C8C8C8C8C8C8606060DBF7FFB8F0FF94E9FF68E0FF32D6FF00CCFF00CCFF4848
        48FF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8C8C8C8606060F8F8F8F0F0F0EA
        EAEAE2E2E2DADADAD2D2D2D2D2D2484848FF00FFFF00FFFF00FFFF00FF993300
        993300993300606060DBF7FFB8F0FF94E9FF68E0FF32D6FF00CCFF00CCFF4848
        48FF00FFFF00FFFF00FFFF00FF3D3D3D3D3D3D3D3D3D606060F8F8F8F0F0F0EA
        EAEAE2E2E2DADADAD2D2D2D2D2D2484848FF00FFFF00FFFF00FFFF00FF993300
        C8C8C8FF00FF6060606060606060606060606565656A6A6A6F6F6F7373737676
        76FF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8FF00FF60606060606060606060
        60606565656A6A6A6F6F6F737373767676FF00FFFF00FFFF00FFFF00FF993300
        C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300
        C8C8C8FF00FF6060605151514040402E2E2E2323231717170B0B0B000000FF00
        FFFF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8FF00FF6060605151514040402E
        2E2E2323231717170B0B0B000000FF00FFFF00FFFF00FFFF00FFFF00FF993300
        C8C8C8C8C8C8606060FFF6EEFFEEDEFFE6CDFFDAB6FFCE9DFFCC99080808FF00
        FFFF00FFFF00FFFF00FFFF00FF3D3D3DC8C8C8C8C8C8606060F5F5F5ECECECE3
        E3E3D6D6D6C9C9C9C7C7C7080808FF00FFFF00FFFF00FFFF00FFFF00FF993300
        993300993300606060FFF6EEFFEEDEFFE6CDFFDAB6FFCE9DFFCC99101010FF00
        FFFF00FFFF00FFFF00FFFF00FF3D3D3D3D3D3D3D3D3D606060F5F5F5ECECECE3
        E3E3D6D6D6C9C9C9C7C7C7101010FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF6060606060606060606363636969696F6F6F737373191919FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF60606060606060606063
        63636969696F6F6F737373191919FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = QtyPriceBreaks1Click
    end
    object bvToolbarBreak1: TUniPanel
      Left = 53
      Top = 3
      Width = 2
      Height = 21
      Hint = ''
      TabOrder = 7
      Caption = ''
    end
    object bbtnRouteNote: TUniSpeedButton
      Left = 56
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Routing notes'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80A0B0
        3060703060703058703050603048603048603040503040503038402030402028
        30202030101820FF00FFFF00FFA2A2A26161616161615C5C5C5252524D4D4D4D
        4D4D434343434343393939333333292929242424191919FF00FF80A0B0306070
        3060703058703050603048603048603040503040503038403048503068803078
        90207890202030FF00FFA2A2A26161616161615C5C5C5252524D4D4D4D4D4D43
        43434343433939394848486B6B6B7A7A7A7A7A7A242424FF00FF80A0B090E0F0
        60B8C060B0C060A8C050A0B050A0B04098B04090A03088A05060703038403078
        903080A0202830FF00FFA2A2A2E0E0E0B5B5B5B0B0B0AAAAAAA0A0A0A0A0A099
        99999090908A8A8A6363633939397A7A7A848484292929FF00FF80A8C090E0F0
        80D8F080D8F070D8F070C8E060C8E060C0D050B8D050B0D060788070D0E03038
        40307080203040FF00FFABABABE0E0E0D9D9D9D9D9D9D9D9D9C9C9C9C8C8C8BF
        BFBFB9B9B9B3B3B3787878CFCFCF393939717171333333FF00FF80B0C0A0E8F0
        80E0F080D8F080D8F070D8F070D0E070C8E060C0E060B8D07088906078805060
        70304850303840FF00FFB1B1B1E6E6E6DFDFDFD9D9D9D9D9D9D9D9D9CFCFCFC9
        C9C9C3C3C3BABABA888888787878636363484848393939FF00FF80B0C0A0E8F0
        90E0F080E0F080D8F080D8F080D8F070D0E070D0E070C8E060C0E060B8D04098
        B0303840304050FF00FFB1B1B1E6E6E6E0E0E0DFDFDFD9D9D9D9D9D9D9D9D9CF
        CFCFCFCFCFC9C9C9C3C3C3BABABA999999393939434343FF00FF90B8C0B0F0F0
        90E8F090E0F080E0F080E0F080D8F080D8F070D8F070D0E070D0E060C8E050A0
        B0304050304050FF00FFB7B7B7EDEDEDE5E5E5E0E0E0DFDFDFDFDFDFD9D9D9D9
        D9D9D9D9D9CFCFCFCFCFCFC8C8C8A0A0A0434343434343FF00FF90B8C080E0F0
        80E0F080E0F080E0F080E0F080E0F080E0F080D8F080D8F070D8F070D0E060A8
        C0304050304860FF00FFB7B7B7DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF
        DFDFD9D9D9D9D9D9D9D9D9CFCFCFAAAAAA4343434D4D4DFF00FF90B8C090E8F0
        90E0F090E0F090E8F090E0F090E8F090E0F080E0F080D8F080D8F080D8F060B0
        C0304860404860FF00FFB7B7B7E5E5E5E0E0E0E0E0E0E5E5E5E0E0E0E5E5E5E0
        E0E0DFDFDFD9D9D9D9D9D9D9D9D9B0B0B04D4D4D4D4D4DFF00FF90B8C0A0E8F0
        90E8F090E8F0A0E8F090E8F0A0E8F090E8F090E0F080E0F080E0F080D8F060B8
        C0404860404860FF00FFB7B7B7E6E6E6E5E5E5E5E5E5E6E6E6E5E5E5E6E6E6E5
        E5E5E0E0E0DFDFDFDFDFDFD9D9D9B5B5B54D4D4D4D4D4DFF00FF90B8C0A0F0F0
        A0E8F0A0E8F0A0F0F0A0E8F0A0F0F0A0E8F090E8F090E0F080E0F080E0F080D8
        F0404860708890FF00FFB7B7B7ECECECE6E6E6E6E6E6ECECECE6E6E6ECECECE6
        E6E6E5E5E5E0E0E0DFDFDFDFDFDFD9D9D94D4D4D888888FF00FF90B8C080A8C0
        80A8C080A8C080A8C080A8C080A8C080A0B080A0B07098A07090A07090A07088
        90708890FF00FFFF00FFB7B7B7ABABABABABABABABABABABABABABABABABABA2
        A2A2A2A2A2979797929292929292888888888888FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = bbtnRouteNoteClick
    end
    object NavMain: TUniDBNavigator
      Left = 799
      Top = 1
      Width = 234
      Height = 25
      Hint = ''
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      ConfirmDelete = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 316
    Top = 4
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        OnClick = Edit1Click
      end
      object Edit1: TUniMenuItem
        Caption = '&Edit'
        OnClick = Edit1Click
      end
      object Delete1: TUniMenuItem
        Caption = '&Delete'
        OnClick = Edit1Click
      end
      object Save1: TUniMenuItem
        Caption = 'S&ave'
        Visible = False
        OnClick = Edit1Click
      end
      object Cancel1: TUniMenuItem
        Caption = '&Cancel'
        Visible = False
        OnClick = Edit1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Search1: TUniMenuItem
        Caption = '&Search'
        OnClick = sbtnSearchClick
      end
      object SearchAll1: TUniMenuItem
        Caption = 'Search &All'
        OnClick = SearchAll1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object View1: TUniMenuItem
      Caption = '&View'
      object ToggleTableForm1: TUniMenuItem
        Caption = 'Toggle Table/Form'
        OnClick = sbtnTableFormClick
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object AttachedPackaging1: TUniMenuItem
        Caption = 'Attached &Packaging'
        GroupIndex = 1
        RadioItem = True
        OnClick = Standard1Click
      end
      object AttachedComponents1: TUniMenuItem
        Caption = 'Attached &Components'
        GroupIndex = 1
        RadioItem = True
        OnClick = Standard1Click
      end
      object Blends1: TUniMenuItem
        Caption = '&Blends'
        GroupIndex = 1
        RadioItem = True
        OnClick = Standard1Click
      end
      object Generic1: TUniMenuItem
        Caption = 'Process / Std Operation'
        GroupIndex = 1
        RadioItem = True
        OnClick = Standard1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object OperationCost1: TUniMenuItem
        Caption = 'Operation &Cost'
        Visible = False
        OnClick = OperationCost1Click
      end
      object Equipment1: TUniMenuItem
        Caption = '&Equipment'
        Visible = False
        OnClick = Equipment1Click
      end
      object QtyPriceBreaks1: TUniMenuItem
        Caption = '&Quantity Price Breaks'
        Visible = False
        OnClick = QtyPriceBreaks1Click
      end
      object WhereUsed1: TUniMenuItem
        Caption = 'Where Used'
        OnClick = WhereUsed1Click
      end
    end
    object Misc1: TUniMenuItem
      Caption = '&Miscellaneous'
      Visible = False
      object LaborRates1: TUniMenuItem
        Caption = '&Labor Rates'
        OnClick = LaborRates1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Print &Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Operations'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190461 $'
    BuildVersion = '176554'
    Left = 648
    Top = 251
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'SndBase'
    WebUse = False
    TouchScreen = False
    Left = 516
    Top = 203
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 480
    Top = 76
  end
  object popmMaterials: TUniPopupMenu
    Left = 310
    Top = 245
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to Inventory'
      OnClick = JumptoInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SndDM.SrcOpMat
    JumpTo = jtInventory
    Left = 414
    Top = 209
  end
  object IQWebSecurityRegister1: TIQWebSecurityRegister
    SecurityCode = 'SNDBASE'
    Left = 496
    Top = 272
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'New1'
      'Edit1'
      'Delete1'
      'ToggleTableForm1'
      'Reports1'
      'sbtnTableForm'
      'dbeOpDesc'
      'navMaterials'
      'navMatQPB'
      'dbeOpNo'
      'IQDocs1'
      'IQExtDoc1'
      'TblOpMat'
      'TblArinvt_Breaks'
      'dbchkPkHide'
      'bbtnRouteNote'
      'TblSndOp')
    SecurityCode = 'SNDOP'
    Left = 267
    Top = 68
  end
end
