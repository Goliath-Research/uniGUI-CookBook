object UniShipViaMaintenance: TUniShipViaMaintenance
  Left = 0
  Top = 0
  Width = 1036
  Height = 697
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'fit'
  TabOrder = 0
  ParentFont = False
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 697
    Hint = ''
    ParentColor = False
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Layout = 'fit'
    object IQUniGridControl1: TIQUniGridControl
      Left = 0
      Top = 0
      Width = 1036
      Height = 697
      Layout = 'border'
      LayoutConfig.Region = 'west'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -13
      TabOrder = 1
      ParentFont = False
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 819
      IQComponents.Grid.Height = 611
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SVM_DM.dsFreight
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
      IQComponents.Navigator.DataSource = SVM_DM.dsFreight
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 4
      IQComponents.HiddenPanel.Left = 819
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 611
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 226
      IQComponents.HiddenPanel.ExplicitTop = 0
      IQComponents.HiddenPanel.ExplicitHeight = 236
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'FormsTab'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 643
      IQComponents.FormTab.ExplicitHeight = 463
      DataSource = SVM_DM.dsFreight
      Columns = <
        item
          FieldName = 'ID'
          Title.Caption = 'ID'
          Width = 46
          Visible = False
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Width = 198
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GLACCT_ACCT_FREIGHT'
          Title.Alignment = taCenter
          Title.Caption = 'GL Account #'
          Width = 94
          Editor = IQUniGridControl1.GL_Account_No
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SCAC_IATA_CODE'
          Title.Alignment = taCenter
          Title.Caption = 'SCAC IATA'
          Width = 71
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE_QUALIFIER'
          Title.Alignment = taCenter
          Title.Caption = 'Code Qualifier'
          Width = 106
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANSPORT_CODE'
          Title.Alignment = taCenter
          Title.Caption = 'Transportation Method Code'
          Width = 166
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQUIP_OWNERS_CODE'
          Title.Alignment = taCenter
          Title.Caption = 'Equipment Owners Code'
          Width = 147
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GLACCT_ACCT_AP'
          Title.Alignment = taCenter
          Title.Caption = 'GL Account AP #'
          Width = 103
          Editor = IQUniGridControl1.GL_Account_AP
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CARRIER_PHONE'
          Title.Alignment = taCenter
          Title.Caption = 'Carrier Telephone #'
          Width = 122
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOAD_TIME'
          Title.Alignment = taCenter
          Title.Caption = 'Default Load Time'
          Width = 108
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'EPlant'
          Width = 129
          Editor = IQUniGridControl1.EPlant
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Alignment = taCenter
          Title.Caption = 'Comment'
          Width = 177
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FREIGHT_SERVICE_CARRIER'
          Title.Alignment = taCenter
          Title.Caption = 'Web Service Carrier'
          Width = 148
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WEB_SERVICE_PROVIDER'
          Title.Alignment = taCenter
          Title.Caption = 'Web Service Provider'
          Width = 145
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Vendor'
          Title.Alignment = taCenter
          Title.Caption = 'Vendor'
          Width = 208
          Editor = IQUniGridControl1.Vendor
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TRANSIT_ON_WEEKEND'
          Title.Alignment = taCenter
          Title.Caption = 'Transit on Weekends'
          Width = 123
          Alignment = taCenter
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'Y;N'
          CheckBoxField.DisplayValues = ';'
        end
        item
          FieldName = 'PK_HIDE'
          Title.Caption = 'Inactive'
          Width = 76
          Alignment = taCenter
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'Y;N'
          CheckBoxField.DisplayValues = ';'
        end>
      TabsVisible = False
      OnSearch = UniSpeedButtonSearchClick
      IQControlCount = 28
      IQParents = (
        'GeneralPanel=FormTab'
        'GeneralTabForm=GeneralPanel'
        'IQUniTabForm1=GeneralPanel'
        'IQUniPanel1=IQUniTabForm1'
        'IQUniPanel2=IQUniTabForm1'
        'FieldSetGeneral=GeneralTabForm'
        'FieldSetA=IQUniPanel1'
        'frmDescription=FieldSetGeneral'
        'FieldSetB=IQUniPanel2'
        'frmGL_Account_No=FieldSetGeneral'
        'frmSCAC_IATA=FieldSetGeneral'
        'frmCode_Qualifier=FieldSetGeneral'
        'frmTransport_Code=FieldSetGeneral'
        'frmEquip_Owners_Code=FieldSetGeneral'
        'frmGL_Account_AP=FieldSetGeneral'
        'frmCarrier_Phone=FieldSetGeneral'
        'frmLoad_Time=FieldSetGeneral'
        'frmEPlant=FieldSetGeneral'
        'frmComment=FieldSetGeneral'
        'frmFreight_Service_Carrier=FieldSetGeneral'
        'frmWeb_Service_Provider=FieldSetGeneral'
        'frmVendor=FieldSetGeneral'
        'frmTransit_On_Weekend=FieldSetGeneral'
        'frmPK_Hide=FieldSetGeneral'
        'EPlant=GridEditorsPanel'
        'GL_Account_No=GridEditorsPanel'
        'GL_Account_AP=GridEditorsPanel'
        'Vendor=GridEditorsPanel')
      Marker = 0
      object GeneralPanel: TIQUniPanel
        Left = 0
        Top = 0
        Width = 1028
        Height = 640
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        Layout = 'fit'
        LayoutConfig.BodyPadding = '10'
        LayoutConfig.Region = 'center'
        ExplicitWidth = 643
        ExplicitHeight = 463
      end
      object GeneralTabForm: TIQUniTabForm
        Hint = ''
        Caption = 'General'
        Layout = 'fit'
        LayoutConfig.BodyPadding = '10'
        ExplicitWidth = 633
        ExplicitHeight = 433
      end
      object IQUniTabForm1: TIQUniTabForm
        Hint = ''
        Caption = 'Additional'
        Layout = 'border'
        LayoutConfig.BodyPadding = '10'
      end
      object FieldSetGeneral: TIQUniFieldSet
        Left = 0
        Top = 0
        Width = 1018
        Height = 610
        Hint = ''
        Title = 'General'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitWidth = 633
        ExplicitHeight = 433
      end
      object IQUniPanel2: TIQUniPanel
        Left = 400
        Top = 0
        Width = 618
        Height = 610
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ShowCaption = False
        Caption = 'Center Panel'
        Layout = 'fit'
        LayoutConfig.BodyPadding = '10'
        LayoutConfig.Split = True
        LayoutConfig.Region = 'center'
      end
      object IQUniPanel1: TIQUniPanel
        Left = 0
        Top = 0
        Width = 400
        Height = 610
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        ShowCaption = False
        Caption = 'Left Panel'
        Layout = 'fit'
        LayoutConfig.BodyPadding = '10'
        LayoutConfig.Split = True
        LayoutConfig.Region = 'west'
      end
      object FieldSetB: TIQUniFieldSet
        Left = 1
        Top = 1
        Width = 616
        Height = 608
        Hint = ''
        Title = 'FieldSet-B'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object frmDescription: TUniDBEdit
        Left = 8
        Top = 8
        Width = 121
        Height = 22
        Hint = ''
        DataField = 'DESCRIP'
        DataSource = SVM_DM.dsFreight
        TabOrder = 1
        FieldLabel = 'Description'
        FieldLabelWidth = 200
      end
      object FieldSetA: TIQUniFieldSet
        Left = 1
        Top = 1
        Width = 398
        Height = 608
        Hint = ''
        Title = 'FieldSet-A'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
      object frmGL_Account_No: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 32
        Width = 145
        Hint = ''
        CreateOrder = 1
        TabOrder = 2
        FieldLabel = 'GL Account #'
        FieldLabelWidth = 200
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListOnlyMode = lmFollowSource
        ListField = 'ACCT'
        ListSource = SVM_DM.dsGLACCT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_FREIGHT'
        DataSource = SVM_DM.dsFreight
      end
      object frmSCAC_IATA: TUniDBEdit
        Left = 8
        Top = 56
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 2
        DataField = 'SCAC_IATA_CODE'
        DataSource = SVM_DM.dsFreight
        TabOrder = 3
        FieldLabel = 'SCAC IATA'
        FieldLabelWidth = 200
      end
      object frmCode_Qualifier: TUniDBEdit
        Left = 8
        Top = 80
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 3
        DataField = 'CODE_QUALIFIER'
        DataSource = SVM_DM.dsFreight
        TabOrder = 4
        FieldLabel = 'Code Qualifier'
        FieldLabelWidth = 200
      end
      object frmTransport_Code: TUniDBEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 4
        DataField = 'TRANSPORT_CODE'
        DataSource = SVM_DM.dsFreight
        TabOrder = 5
        FieldLabel = 'Transportation Method Code'
        FieldLabelWidth = 200
      end
      object frmEquip_Owners_Code: TUniDBEdit
        Left = 8
        Top = 128
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 5
        DataField = 'EQUIP_OWNERS_CODE'
        DataSource = SVM_DM.dsFreight
        TabOrder = 6
        FieldLabel = 'Equipment Owners Code'
        FieldLabelWidth = 200
      end
      object frmGL_Account_AP: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 152
        Width = 145
        Hint = ''
        CreateOrder = 6
        TabOrder = 7
        FieldLabel = 'GL Account AP #'
        FieldLabelWidth = 200
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListOnlyMode = lmFollowSource
        ListField = 'ACCT'
        ListSource = SVM_DM.dsGLACCT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_FREIGHT_AP'
        DataSource = SVM_DM.dsFreight
      end
      object frmCarrier_Phone: TUniDBEdit
        Left = 8
        Top = 176
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 7
        DataField = 'CARRIER_PHONE'
        DataSource = SVM_DM.dsFreight
        TabOrder = 8
        FieldLabel = 'Carrier Telephone #'
        FieldLabelWidth = 200
      end
      object frmLoad_Time: TUniDBNumberEdit
        Left = 8
        Top = 219
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 8
        DataField = 'LOAD_TIME'
        DataSource = SVM_DM.dsFreight
        TabOrder = 9
        FieldLabel = 'Load Time'
        FieldLabelWidth = 200
        DecimalSeparator = '.'
      end
      object frmEPlant: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 243
        Width = 145
        Hint = ''
        CreateOrder = 9
        TabOrder = 10
        FieldLabel = 'EPlant'
        FieldLabelWidth = 200
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListField = 'NAME'
        ListSource = SVM_DM.dsEPLANT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'EPLANT_ID'
        DataSource = SVM_DM.dsFreight
      end
      object frmComment: TUniDBEdit
        Left = 8
        Top = 267
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 10
        DataField = 'COMMENT1'
        DataSource = SVM_DM.dsFreight
        TabOrder = 11
        FieldLabel = 'Comment'
        FieldLabelWidth = 200
      end
      object frmFreight_Service_Carrier: TUniDBEdit
        Left = 8
        Top = 310
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 11
        DataField = 'FREIGHT_SERVICE_CARRIER'
        DataSource = SVM_DM.dsFreight
        TabOrder = 12
        FieldLabel = 'Web Service Carrier'
        FieldLabelWidth = 200
      end
      object frmWeb_Service_Provider: TUniDBEdit
        Left = 8
        Top = 334
        Width = 121
        Height = 22
        Hint = ''
        CreateOrder = 12
        DataField = 'WEB_SERVICE_PROVIDER'
        DataSource = SVM_DM.dsFreight
        TabOrder = 13
        FieldLabel = 'Web Service Provider'
        FieldLabelWidth = 200
      end
      object frmVendor: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 358
        Width = 145
        Hint = ''
        CreateOrder = 13
        TabOrder = 14
        ClearButton = True
        FieldLabel = 'Vendor'
        FieldLabelWidth = 200
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListField = 'COMPANY'
        ListSource = SVM_DM.dsVendor
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'VENDOR_ID'
        DataSource = SVM_DM.dsFreight
      end
      object frmTransit_On_Weekend: TUniDBCheckBox
        Left = 8
        Top = 200
        Width = 97
        Height = 17
        Hint = ''
        CreateOrder = 14
        DataField = 'TRANSIT_ON_WEEKEND'
        DataSource = SVM_DM.dsFreight
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = ''
        TabOrder = 15
        FieldLabel = 'Transit on Weekends'
        FieldLabelWidth = 200
      end
      object frmPK_Hide: TUniDBCheckBox
        Left = 8
        Top = 291
        Width = 97
        Height = 17
        Hint = ''
        CreateOrder = 15
        DataField = 'PK_HIDE'
        DataSource = SVM_DM.dsFreight
        Caption = ''
        TabOrder = 16
        FieldLabel = 'Inactive'
        FieldLabelWidth = 200
      end
      object GL_Account_AP: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 56
        Width = 145
        Hint = ''
        TabOrder = 3
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListOnlyMode = lmFollowSource
        ListField = 'ACCT'
        ListSource = SVM_DM.dsGLACCT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_FREIGHT_AP'
        DataSource = SVM_DM.dsFreight
      end
      object GL_Account_No: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 32
        Width = 145
        Hint = ''
        TabOrder = 2
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListOnlyMode = lmFollowSource
        ListField = 'ACCT'
        ListSource = SVM_DM.dsGLACCT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_FREIGHT'
        DataSource = SVM_DM.dsFreight
      end
      object EPlant: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 8
        Width = 145
        Hint = ''
        TabOrder = 1
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListField = 'NAME'
        ListSource = SVM_DM.dsEPLANT
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'EPLANT_ID'
        DataSource = SVM_DM.dsFreight
      end
      object Vendor: TIQUniEditorDlgPickDataSet
        Left = 8
        Top = 80
        Width = 145
        Hint = ''
        CreateOrder = 15
        TabOrder = 4
        Triggers = <
          item
            ImageIndex = 0
            ButtonId = 1
            HandleClicks = True
          end>
        ListField = 'COMPANY'
        ListSource = SVM_DM.dsVendor
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'VENDOR_ID'
        DataSource = SVM_DM.dsFreight
      end
    end
  end
  object FreightPicker: TIQUniEditorDlgPickDataSet
    Left = 336
    Top = 520
    Width = 145
    Hint = ''
    Visible = False
    TabOrder = 1
    Triggers = <
      item
        ImageIndex = 0
        ButtonId = 1
        HandleClicks = True
      end>
    OnDialogResult = FreightPickerDialogResult
    ListField = 'ID'
    ListSource = SVM_DM.dsFreight
    KeyField = 'ID'
    ListFieldIndex = 0
  end
  object UniMainMenu1: TUniMainMenu
    Left = 360
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
      end
      object ShippingHolidays1: TUniMenuItem
        Caption = 'Shipping Holidays'
        OnClick = UniSpeedButtonSearchClick
      end
      object ShippingTrailersContainers1: TUniMenuItem
        Caption = 'Shipping Trailers / Containers'
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
      end
      object About1: TUniMenuItem
        Caption = '&About'
      end
    end
  end
  object ActionList1: TActionList
    Left = 392
    Top = 440
    object Action1: TAction
      Caption = 'Action1'
      Hint = 'field1:AN;field3:D'
    end
  end
end
