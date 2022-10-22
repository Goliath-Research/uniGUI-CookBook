object FrmWorkCenterType: TFrmWorkCenterType
  Left = 293
  Top = 245
  HelpContext = 16265
  ClientHeight = 462
  ClientWidth = 876
  Caption = 'Master Center Type'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 241
    Width = 876
    Height = 5
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 1
      Top = 2
      Width = 25
      Height = 25
      Hint = 'Search Center Type ...'
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
    object NavMain: TUniDBNavigator
      Left = 619
      Top = 1
      Width = 257
      Height = 26
      Hint = ''
      DataSource = SrcCntrType
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
    object pnlLegend: TUniPanel
      Left = 589
      Top = 1
      Width = 30
      Height = 26
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Shape4: TShape
        Left = 6
        Top = 7
        Width = 10
        Height = 11
        Hint = 'Pending cost element changes have not been applied'
        Brush.Color = clRed
        Shape = stSquare
      end
    end
  end
  object pnlHeader: TUniPanel
    Left = 0
    Top = 28
    Width = 876
    Height = 213
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object wwDBGridCntrType: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 874
      Height = 211
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 657
      IQComponents.Grid.Height = 125
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCntrType
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
      IQComponents.Navigator.DataSource = SrcCntrType
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 657
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 125
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcCntrType
      Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = 'Center Type'
          Width = 182
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STD_COST'
          Title.Caption = 'Variable'
          Width = 84
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FIXED_COST'
          Title.Caption = 'Fixed'
          Width = 84
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FUTURE_STD_COST'
          Title.Caption = 'Variable'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FUTURE_FIXED_STD_COST'
          Title.Caption = 'Fixed'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUDGET_STD_COST'
          Title.Caption = 'Variable'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUDGET_FIXED_STD_COST'
          Title.Caption = 'Fixed'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FORECAST_STD_COST'
          Title.Caption = 'Variable'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FORECAST_FIXED_STD_COST'
          Title.Caption = 'Fixed'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IS_CHANGED'
          Title.Caption = 'Pending Changes'
          Width = 105
          ReadOnly = True
          CheckBoxField.FieldValues = 'Y;N'
        end>
      Marker = 0
    end
    object wwDBEditCenterType: TUniDBEdit
      Left = 17
      Top = 45
      Width = 153
      Height = 21
      Hint = ''
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object wwDBComboDlgEplant_ID: TUniEdit
      Left = 176
      Top = 45
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
  end
  object pnlDetails: TUniPanel
    Left = 0
    Top = 246
    Width = 876
    Height = 177
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 874
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object NavElements: TUniDBNavigator
        Left = 617
        Top = 1
        Width = 257
        Height = 26
        Hint = ''
        DataSource = SrcElements
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBGridElements: TIQUniGridControl
      Left = 1
      Top = 28
      Width = 874
      Height = 149
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 657
      IQComponents.Grid.Height = 63
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcElements
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
      IQComponents.Navigator.DataSource = SrcElements
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 657
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 63
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcElements
      Columns = <
        item
          FieldName = 'ELEM_DESCRIP'
          Title.Caption = 'Cost Element Description'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ELEM_TYPE'
          Title.Caption = 'Type'
          Width = 98
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STD_COST'
          Title.Caption = 'Variable Cost'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FIXED_STD_COST'
          Title.Caption = 'Fixed Cost'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end>
		PendingWork.Strings = (
                'Field <ELEM_DESCRIP> has custom editor <wwDBComboDlgElemDescrip>'
                'Field <Elem_Descrip> has custom editor <wwDBComboDlgElemDescrip>'
                )
      Marker = 0
    end
    object wwDBComboDlgElemDescrip: TUniEdit
      Left = 16
      Top = 72
      Width = 145
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 423
    Width = 876
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel3: TUniPanel
      Left = 739
      Top = 1
      Width = 137
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnApplyPending: TUniBitBtn
        Left = 4
        Top = 7
        Width = 120
        Height = 25
        Hint = ''
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FF8C4421E1BEA7FF00FFFF00FFB7A2936349356349356349356349356349
          35634935634935FF00FFFF00FFFF00FFFF00FF474747BCBCBCFF00FFFF00FFA1
          A1A1484848484848484848484848484848484848484848FF00FFFF00FFFF00FF
          EFD3BE904820904820E0BCA3FF00FFC0A890FFF0F0E0D0D0E0D0C0F0C8C0F0C8
          B0F0C8B0604830FF00FFFF00FFFF00FFD1D1D14A4A4A4A4A4ABABABAFF00FFA5
          A5A5F2F2F2D2D2D2CECECECACACAC7C7C7C7C7C7464646FF00FFFF00FFE9C3AD
          C06030C06840E08050904820F3CCB2C0A8A0FFF8F0B09880B09080B08870B088
          70F0C8B0604830FF00FFFF00FFC2C2C26464646B6B6B8282824A4A4ACACACAA8
          A8A8F7F7F79595958F8F8F878787878787C7C7C7464646FF00FFE9C4AFC07040
          F0B890FFA880FF9860E08050B06030C0A890FFF8F0FFF0F0FFF0E0FFE8E0FFE8
          D0F0C8C0604830FF00FFC3C3C3717171B6B6B6A9A9A99A9A9A828282626262A5
          A5A5F7F7F7F2F2F2EEEEEEE9E9E9E6E6E6CACACA464646FF00FFE5A076F0B090
          D08860F0C0A0FFA880B06030EBBA9DC0B0A0FFF8F0C0A090C09890C09880B090
          80F0D0C095765BFF00FF9F9F9FB0B0B0888888BEBEBEA9A9A9626262B9B9B9AE
          AEAEF7F7F7A0A0A09A9A9A9797978F8F8FD0D0D0737373FF00FFEE986CCB7241
          CDAB96D08050B06030CDAE997C644CC0B0A0FFFFFFFFF8F0FFF8F0FFF0F0FFE8
          E0F0D0C0B08D72FF00FF999999747474AAAAAA808080626262ACACAC616161AE
          AEAEFFFFFFF7F7F7F7F7F7F2F2F2E9E9E9D0D0D08B8B8BFF00FFD6835BCF997D
          FFE8E0D07850E0C0A0F0C8C0F0C8B0C0B0A0FFFFFFD0B0A0C0A8A0C0A890C0A0
          90E0D0D0904820DAA987858585999999E9E9E97A7A7ABDBDBDCACACAC7C7C7AE
          AEAEFFFFFFAFAFAFA8A8A8A5A5A5A0A0A0D2D2D24A4A4AA7A7A7C7794EDBBDAA
          FFF8F0D0B0A0C0A8A0B08870B08870D0B8A0FFFFFFFFFFFFFFFFFFFFF8F0FFF8
          F0E0D8D09B664DA05E377A7A7ABCBCBCF7F7F7AFAFAFA8A8A8878787878787B5
          B5B5FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7D7D7D76767675E5E5ED69C7CD6AB93
          FFF0F0FFF0F0FFF0E0FFE8E0FFE8D0D0B8A0FFFFFFD0C0B0D0B8B0D0B0A0C0B0
          A0E0D8D0BF95799048209B9B9BAAAAAAF2F2F2F2F2F2EEEEEEE9E9E9E6E6E6B5
          B5B5FFFFFFBEBEBEB8B8B8AFAFAFAEAEAED7D7D79494944A4A4AF1D6C6C77752
          FFF8F0C0A090C09890C09880B09080D0B8A0FFFFFFFFFFFFFFFFFFF0E8E0D068
          30FFF8F0A7724DA05030D5D5D5797979F7F7F7A0A0A09A9A9A9797978F8F8FB5
          B5B5FFFFFFFFFFFFFFFFFFE7E7E76C6C6CF7F7F7717171545454FF00FFE2CFBF
          FFFFFFFFF8F0FFF8F0FFF0F0FFE8E0D0B8A0D0B8A0C0B0A0E3B79ED06830A050
          20D4A891905030AE6B44FF00FFCDCDCDFFFFFFF7F7F7F7F7F7F2F2F2E9E9E9B5
          B5B5B5B5B5AEAEAEB6B6B66C6C6C535353A7A7A75151516B6B6BFF00FFCBBAAA
          FFFFFFD0B0A0C0A8A0C0A890C0A090E0D0D0604830FF00FFE07840FFA070C068
          40A05030C06840CD8F67FF00FFB8B8B8FFFFFFAFAFAFA8A8A8A5A5A5A0A0A0D2
          D2D2464646FF00FF7B7B7BA1A1A16B6B6B5454546B6B6B8D8D8DFF00FFD0B8A0
          FFFFFFFFFFFFFFFFFFFFF8F0FFF8F0E0D8D0705040E09870F0B890FFC8A0FFB0
          90F09060D07840E6B28DFF00FFB5B5B5FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7D7
          D7D7505050989898B6B6B6C6C6C6B1B1B1929292797979B0B0B0FF00FFD0B8A0
          FFFFFFD0C0B0D0B8B0D0B0A0C0B0A0E0D8D0604830F1C6A9E09870FFC0A0E090
          70F09060F1BE9DFF00FFFF00FFB5B5B5FFFFFFBEBEBEB8B8B8AFAFAFAEAEAED7
          D7D7464646C4C4C4989898C0C0C0929292929292BCBCBCFF00FFFF00FFD0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8FFFFF8F0604830FF00FFEFC3A5E09870D088
          50FF00FFFF00FFFF00FFFF00FFB5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7
          F7F7464646FF00FFC1C1C1989898868686FF00FFFF00FFFF00FFFF00FFD0B8A0
          D0B8A0C0B0A0C0B0A0C0B0A0C0A8A0C0A890C0A890FF00FFF7D7BEEEBFA1E098
          70FF00FFFF00FFFF00FFFF00FFB5B5B5B5B5B5AEAEAEAEAEAEAEAEAEA8A8A8A5
          A5A5A5A5A5FF00FFD5D5D5BDBDBD989898FF00FFFF00FFFF00FF}
        Caption = 'Apply Pending'
        TabOrder = 0
        OnClick = bbtnSyncWorkCentersClick
      end
    end
  end
  object SrcCntrType: TDataSource
    DataSet = QryCntrType
    Left = 24
    Top = 104
  end
  object QryCntrType: TFDQuery
    BeforePost = QryCntrTypeBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CNTR_TYPE'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLCntrType
    SQL.Strings = (
      'select id,'
      '       name,'
      
        '       ( select sum(std_cost) from cntr_type_elements e where e.' +
        'cntr_type_id = cntr_type.id ) as std_cost,'
      
        '       ( select sum(fixed_std_cost) from cntr_type_elements e wh' +
        'ere e.cntr_type_id = cntr_type.id ) as fixed_cost,'
      '       is_changed,'
      '       eplant_id,'
      ''
      '       future_std_cost,'
      '       future_fixed_std_cost,'
      '       '
      '       budget_std_cost,'
      '       budget_fixed_std_cost,'
      ''
      '       forecast_std_cost,'
      '       forecast_fixed_std_cost'
      '       '
      '  from cntr_type'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      ' order by'
      '       name'
      ''
      ''
      '')
    Left = 24
    Top = 132
    object QryCntrTypeNAME: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 26
      FieldName = 'NAME'
      Origin = 'IQ.CNTR_TYPE.NAME'
      Required = True
    end
    object QryCntrTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CNTR_TYPE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryCntrTypeSTD_COST: TFMTBCDField
      DisplayLabel = 'Variable Cost'
      FieldName = 'STD_COST'
      ReadOnly = True
      DisplayFormat = '########0.00####'
      Size = 38
    end
    object QryCntrTypeFIXED_COST: TFMTBCDField
      DisplayLabel = 'Fixed Cost'
      FieldName = 'FIXED_COST'
      ReadOnly = True
      DisplayFormat = '########0.00####'
      Size = 38
    end
    object QryCntrTypeIS_CHANGED: TStringField
      DisplayLabel = 'Pending Changes'
      DisplayWidth = 1
      FieldName = 'IS_CHANGED'
      Origin = 'IQ.CNTR_TYPE.IS_CHANGED'
      ReadOnly = True
      Size = 1
    end
    object QryCntrTypeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.CNTR_TYPE.EPLANT_ID'
      Size = 0
    end
    object QryCntrTypeFUTURE_STD_COST: TFMTBCDField
      FieldName = 'FUTURE_STD_COST'
      Size = 6
    end
    object QryCntrTypeFUTURE_FIXED_STD_COST: TFMTBCDField
      FieldName = 'FUTURE_FIXED_STD_COST'
      Size = 6
    end
    object QryCntrTypeBUDGET_STD_COST: TFMTBCDField
      FieldName = 'BUDGET_STD_COST'
      Size = 6
    end
    object QryCntrTypeBUDGET_FIXED_STD_COST: TFMTBCDField
      FieldName = 'BUDGET_FIXED_STD_COST'
      Size = 6
    end
    object QryCntrTypeFORECAST_STD_COST: TFMTBCDField
      FieldName = 'FORECAST_STD_COST'
      Size = 6
    end
    object QryCntrTypeFORECAST_FIXED_STD_COST: TFMTBCDField
      FieldName = 'FORECAST_FIXED_STD_COST'
      Size = 6
    end
  end
  object SrcElements: TDataSource
    DataSet = QryElements
    Left = 72
    Top = 104
  end
  object QryElements: TFDQuery
    BeforeInsert = QryElementsBeforeInsert
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = QryElementsBeforePost
    OnNewRecord = QryElementsNewRecord
    MasterSource = SrcCntrType
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'CNTR_TYPE_ELEMENTS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLElements
    SQL.Strings = (
      'SELECT c.id,'
      '       c.cntr_type_id,'
      '       c.elements_id,'
      '       b.elem_descrip,'
      '       b.elem_type,'
      '       c.std_cost,'
      '       c.fixed_std_cost'
      '  FROM cntr_type_elements c, elements b'
      ' WHERE c.cntr_type_id = :ID AND'
      '       b.id(+) = c.elements_id')
    Left = 72
    Top = 132
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element Description'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Size = 30
    end
    object QryElementsELEM_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 14
      FieldName = 'ELEM_TYPE'
      ReadOnly = True
    end
    object QryElementsSTD_COST: TFMTBCDField
      DisplayLabel = 'Variable Cost'
      DisplayWidth = 12
      FieldName = 'STD_COST'
      DisplayFormat = '########0.00####'
      Size = 6
    end
    object QryElementsFIXED_STD_COST: TFMTBCDField
      DisplayLabel = 'Fixed Cost'
      DisplayWidth = 14
      FieldName = 'FIXED_STD_COST'
      DisplayFormat = '########0.00####'
      Size = 6
    end
    object QryElementsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryElementsCNTR_TYPE_ID: TBCDField
      FieldName = 'CNTR_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryElementsELEMENTS_ID: TBCDField
      FieldName = 'ELEMENTS_ID'
      Required = True
      Visible = False
      DisplayFormat = 'Cost Element'
      Size = 0
    end
  end
  object PkCntrType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name,'
      '       rate,'
      '       cost,'
      '       eplant_id '
      '  from cntr_type'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 220
    Top = 148
    object PkCntrTypeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CNTR_TYPE.ID'
      Visible = False
      Size = 0
    end
    object PkCntrTypeNAME: TStringField
      DisplayLabel = 'Center Type'
      FieldName = 'NAME'
      Origin = 'IQ.CNTR_TYPE.NAME'
    end
    object PkCntrTypeRATE: TBCDField
      DisplayLabel = 'Center Rate'
      FieldName = 'RATE'
      Origin = 'IQ.CNTR_TYPE.RATE'
      Size = 2
    end
    object PkCntrTypeCOST: TFMTBCDField
      DisplayLabel = 'Center Cost'
      FieldName = 'COST'
      Origin = 'IQ.CNTR_TYPE.COST'
      Size = 6
    end
    object PkCntrTypeEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 156
    Top = 148
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmWorkCenterType'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 188629 $'
    BuildVersion = '176554'
    Left = 188
    Top = 148
  end
  object UpdateSQLCntrType: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into cntr_type'
      
        '  (ID, NAME, IS_CHANGED, EPLANT_ID, FUTURE_STD_COST, FUTURE_FIXE' +
        'D_STD_COST, '
      
        '   BUDGET_STD_COST, BUDGET_FIXED_STD_COST, FORECAST_STD_COST, FO' +
        'RECAST_FIXED_STD_COST)'
      'values'
      
        '  (:ID, :NAME, :IS_CHANGED, :EPLANT_ID, :FUTURE_STD_COST, :FUTUR' +
        'E_FIXED_STD_COST, '
      
        '   :BUDGET_STD_COST, :BUDGET_FIXED_STD_COST, :FORECAST_STD_COST,' +
        ' :FORECAST_FIXED_STD_COST)')
    ModifySQL.Strings = (
      'update cntr_type'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  IS_CHANGED = :IS_CHANGED,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  FUTURE_STD_COST = :FUTURE_STD_COST,'
      '  FUTURE_FIXED_STD_COST = :FUTURE_FIXED_STD_COST,'
      '  BUDGET_STD_COST = :BUDGET_STD_COST,'
      '  BUDGET_FIXED_STD_COST = :BUDGET_FIXED_STD_COST,'
      '  FORECAST_STD_COST = :FORECAST_STD_COST,'
      '  FORECAST_FIXED_STD_COST = :FORECAST_FIXED_STD_COST'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from cntr_type'
      'where'
      '  ID = :OLD_ID')
    Left = 24
    Top = 160
  end
  object UpdateSQLElements: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into cntr_type_elements'
      '  (ID, CNTR_TYPE_ID, ELEMENTS_ID, STD_COST, FIXED_STD_COST)'
      'values'
      '  (:ID, :CNTR_TYPE_ID, :ELEMENTS_ID, :STD_COST, :FIXED_STD_COST)')
    ModifySQL.Strings = (
      'update cntr_type_elements'
      'set'
      '  ID = :ID,'
      '  CNTR_TYPE_ID = :CNTR_TYPE_ID,'
      '  ELEMENTS_ID = :ELEMENTS_ID,'
      '  STD_COST = :STD_COST,'
      '  FIXED_STD_COST = :FIXED_STD_COST'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from cntr_type_elements'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 160
  end
  object PkCostElements: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '       id,'
      '       elem_descrip,'
      '       elem_type,'
      '       glacct_id'
      'from'
      '       elements')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 252
    Top = 148
    object PkCostElementsID: TBCDField
      FieldName = 'ID'
      Origin = 'id'
      Visible = False
      Size = 0
    end
    object PkCostElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element'
      FieldName = 'ELEM_DESCRIP'
      Origin = 'elem_descrip'
      Size = 30
    end
    object PkCostElementsELEM_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'ELEM_TYPE'
      Origin = 'elem_type'
      Size = 10
    end
    object PkCostElementsGLACCT_ID: TBCDField
      DisplayLabel = 'GL Account'
      FieldName = 'GLACCT_ID'
      Origin = 'glacct_id'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryCntrType'
      'QryElements'
      'btnApplyPending')
    SecurityCode = 'FRMWORKCENTERTYPE'
    AfterApply = SRAfterApply
    Left = 284
    Top = 148
  end
end
