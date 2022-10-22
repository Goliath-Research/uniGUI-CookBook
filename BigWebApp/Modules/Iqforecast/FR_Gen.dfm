object FrmFR_Generate: TFrmFR_Generate
  Left = 193
  Top = 148
  HelpContext = 1000119
  ClientHeight = 332
  ClientWidth = 656
  Caption = 'Generate Forecast'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Segoe UI'
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TUniGroupBox
    Left = 5
    Top = 6
    Width = 342
    Height = 104
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Customers  '
    TabOrder = 0
    object Label6: TUniLabel
      Left = 32
      Top = 74
      Width = 49
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Customer'
      TabOrder = 4
    end
    object sbtnSearchCustomer: TUniSpeedButton
      Left = 310
      Top = 70
      Width = 27
      Height = 26
      Hint = 'Search Customer'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
      OnClick = sbtnSearchCustomerClick
    end
    object rbtnAll_Cust: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'All Customers'
      TabOrder = 0
      OnClick = rbtnOne_CustClick
    end
    object rbtnOne_Cust: TUniRadioButton
      Left = 10
      Top = 47
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select Customer'
      TabOrder = 1
      OnClick = rbtnOne_CustClick
    end
    object wwcombCustomer: TUniDBLookupComboBox
      Left = 116
      Top = 69
      Width = 190
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'CUSTNO;COMPANY'
      ListSource = SrcwwQryCustomer
      KeyField = 'ARCUSTO_ID'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 357
    Top = 6
    Width = 289
    Height = 104
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Forecast Group  '
    TabOrder = 1
    object Label1: TUniLabel
      Left = 32
      Top = 74
      Width = 63
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Group Code'
      TabOrder = 4
    end
    object wwcombFR_Group: TUniDBLookupComboBox
      Left = 134
      Top = 69
      Width = 147
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'CODE;DESCRIP'
      ListSource = SrcFr_Group
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
      OnChange = wwcombFR_GroupChange
    end
    object rbtnSel_Item: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'Selected Item'
      TabOrder = 1
      OnClick = rbtnGroup_ItemClick
    end
    object rbtnGroup_Item: TUniRadioButton
      Left = 10
      Top = 47
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Items in the group'
      TabOrder = 2
      OnClick = rbtnGroup_ItemClick
    end
  end
  object btnOK: TUniButton
    Left = 390
    Top = 289
    Width = 120
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 526
    Top = 289
    Width = 119
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 4
  end
  object PageControl1: TUniPageControl
    Left = 9
    Top = 121
    Width = 640
    Height = 160
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ActivePage = TabSheet1
    TabBarVisible = True
    TabOrder = 2
    object TabSheet1: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'By Period'
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 0
      ExplicitHeight = 128
      object GroupBox5: TUniGroupBox
        Left = 7
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Source '
        TabOrder = 0
        object Label4: TUniLabel
          Left = 12
          Top = 54
          Width = 33
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Period'
          TabOrder = 2
        end
        object Label7: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 3
        end
        object cboxSrcPeriod: TUniComboBox
          Left = 122
          Top = 53
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            '1'
            '2'
            '3'
            '4')
          TabOrder = 4
          OnDropDown = cboxSrcPeriodDropDown
        end
        object wwcomboSrcGLYearPeriod: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListOnlyMode = lmFollowSource
          ListField = 'DESCRIP;START_DATE;END_DATE'
          ListSource = wwSrcGLYear
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
      object GroupBox6: TUniGroupBox
        Left = 320
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Target '
        TabOrder = 1
        object Label8: TUniLabel
          Left = 12
          Top = 84
          Width = 52
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '% Change'
          TabOrder = 3
        end
        object Label11: TUniLabel
          Left = 12
          Top = 54
          Width = 33
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Period'
          TabOrder = 4
        end
        object Label12: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 5
        end
        object edPrcntPeriod: TUniEdit
          Left = 122
          Top = 79
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '0'
          TabOrder = 2
        end
        object cboxTrgPeriod: TUniComboBox
          Left = 122
          Top = 49
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            '1'
            '2'
            '3'
            '4')
          TabOrder = 6
          OnDropDown = cboxSrcPeriodDropDown
        end
        object wwcomboTrgGLYearPeriod: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListOnlyMode = lmFollowSource
          ListField = 'DESCRIP;START_DATE;END_DATE'
          ListSource = wwSrcGLYear
          KeyField = 'ID'
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImageIndex = 1
      Caption = 'By Quarter'
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 0
      ExplicitHeight = 128
      object GroupBox3: TUniGroupBox
        Left = 7
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Source '
        TabOrder = 0
        object Label5: TUniLabel
          Left = 12
          Top = 54
          Width = 39
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Quarter'
          TabOrder = 2
        end
        object Label10: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 3
        end
        object cboxSrcQtr: TUniComboBox
          Left = 122
          Top = 53
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            '1'
            '2'
            '3'
            '4')
          TabOrder = 4
        end
        object wwcomboSrcGLYear: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
      object GroupBox4: TUniGroupBox
        Left = 320
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Target '
        TabOrder = 1
        object Label9: TUniLabel
          Left = 12
          Top = 84
          Width = 52
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '% Change'
          TabOrder = 3
        end
        object Label2: TUniLabel
          Left = 12
          Top = 54
          Width = 39
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Quarter'
          TabOrder = 4
        end
        object Label3: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 5
        end
        object edPrcnt: TUniEdit
          Left = 122
          Top = 80
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '0'
          TabOrder = 2
        end
        object cboxTrgQtr: TUniComboBox
          Left = 122
          Top = 50
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            '1'
            '2'
            '3'
            '4')
          TabOrder = 6
        end
        object wwcomboTrgGLYear: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
    end
    object TabSheet4: TUniTabSheet
      Hint = ''
      ImageIndex = 3
      Caption = 'By Fiscal Year'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object GroupBox7: TUniGroupBox
        Left = 7
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Source '
        TabOrder = 0
        object Label14: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 2
        end
        object wwcomboSrcGLFiscalYear: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
      object GroupBox8: TUniGroupBox
        Left = 320
        Top = 0
        Width = 300
        Height = 116
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = ' Target '
        TabOrder = 1
        object Label15: TUniLabel
          Left = 12
          Top = 84
          Width = 52
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = '% Change'
          TabOrder = 3
        end
        object Label17: TUniLabel
          Left = 12
          Top = 25
          Width = 51
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Fiscal Year'
          TabOrder = 4
        end
        object edPrcntFiscalYear: TUniEdit
          Left = 122
          Top = 80
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '0'
          TabOrder = 1
        end
        object wwcomboTrgGLFiscalYear: TUniDBLookupComboBox
          Left = 122
          Top = 20
          Width = 155
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ListFieldIndex = 0
          DataField = 'GLYEAR_ID'
          TabOrder = 0
          Color = clWindow
        end
      end
    end
    object TabSheet3: TUniTabSheet
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ImageIndex = 2
      Caption = 'By Formula'
      object chkEvalBest: TUniCheckBox
        Left = 11
        Top = 9
        Width = 268
        Height = 21
        Hint = 
          'Determine best forecast formula based on past forecast and actua' +
          'l figures'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        Caption = 'Evaluate best forecast formula'
        TabOrder = 0
      end
      object chkApplyBest: TUniCheckBox
        Left = 11
        Top = 34
        Width = 316
        Height = 21
        Hint = 'Generate forecast based on best formula assigned'
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Apply most recent best formula'
        TabOrder = 1
      end
    end
  end
  object wwQryCustomer: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       id as arcusto_id'
      '  from'
      '       v_arcusto'
      ' where '
      '       NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      ' order by'
      '       custno'
      ' '
      ' '
      ' ')
    Left = 142
    Top = 12
    object wwQryCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object wwQryCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQryCustomerARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       addr1,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id,'
      '       pk_hide'
      '  from v_arcusto'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 211
    Top = 20
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 100
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryFr_Group: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from'
      '       fr_group'
      'order by'
      '       code'
      ' ')
    Left = 386
    Top = 17
    object QryFr_GroupCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'FR_GROUP.CODE'
      Size = 10
    end
    object QryFr_GroupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'FR_GROUP.DESCRIP'
      Size = 35
    end
    object QryFr_GroupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'FR_GROUP.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryGLYear: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from glyear')
    Left = 29
    Top = 279
    object wwQryGLYearDESCRIP: TStringField
      DisplayLabel = 'Fiscal Year'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Origin = 'GLYEAR.DESCRIP'
      Size = 25
    end
    object wwQryGLYearSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'START_DATE'
      Origin = 'GLYEAR.START_DATE'
    end
    object wwQryGLYearEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'END_DATE'
      Origin = 'GLYEAR.END_DATE'
    end
    object wwQryGLYearID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLYEAR.ID'
      Visible = False
      Size = 0
    end
  end
  object procGet_Quarter: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.GET_QUARTER_BY_DATE'
    Left = 48
    Top = 222
    ParamData = <
      item
        Name = 'V_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_QUARTER'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'V_QTR_START_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end
      item
        Name = 'V_QTR_END_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end>
  end
  object procGet_Quarter_Dates: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.GET_QUARTER_DATES'
    Left = 80
    Top = 222
    ParamData = <
      item
        Name = 'V_YR_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_YR_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_QUARTER'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_QTR_START_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end
      item
        Name = 'V_QTR_END_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end>
  end
  object procBackup: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.DOBACKUP'
    Left = 112
    Top = 222
    ParamData = <
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ARCUSTO_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_KIND'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object procAppend: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.APPEND'
    Left = 144
    Top = 222
    ParamData = <
      item
        Name = 'V_FORE_HEAD_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_FR_GROUP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_ARCUSTO_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_SRC_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_SRC_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_TRG_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_TRG_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_PERCENT'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object procAdjustDates: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.ADJUST_START_DATES'
    Left = 176
    Top = 221
    ParamData = <
      item
        Name = 'V_SRC_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_SRC_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_TRG_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_TRG_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_SRC_START_ACT'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end
      item
        Name = 'V_TRG_START_ACT'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end>
  end
  object SrcwwQryCustomer: TDataSource
    DataSet = wwQryCustomer
    Left = 280
    Top = 8
  end
  object SrcFr_Group: TDataSource
    DataSet = QryFr_Group
    Left = 448
    Top = 16
  end
  object wwSrcGLYear: TDataSource
    DataSet = wwQryGLYear
    Left = 112
    Top = 288
  end
end
