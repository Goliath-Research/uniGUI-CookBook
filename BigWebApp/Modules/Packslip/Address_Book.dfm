object UniAddress_Book: TUniAddress_Book
  Left = 0
  Top = 0
  Width = 714
  Height = 572
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'border'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object IQUniGridControl1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 714
    Height = 572
    Layout = 'border'
    LayoutConfig.Region = 'center'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DataSource = Address_Book_DM.SrcManual_PS_Addr
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 497
    IQComponents.Grid.Height = 486
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Address_Book_DM.SrcManual_PS_Addr
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
    IQComponents.Navigator.DataSource = Address_Book_DM.SrcManual_PS_Addr
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 497
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 486
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.TabVisible = False
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    TabsVisible = False
    IQControlCount = 12
    IQParents = (
      'IQUniFieldSet1=FormTab'
      'edtPrimeContact=IQUniFieldSet1'
      'edtAddress1=IQUniFieldSet1'
      'edtAddress2=IQUniFieldSet1'
      'edtAddress3=IQUniFieldSet1'
      'edtCity=IQUniFieldSet1'
      'edtState=IQUniFieldSet1'
      'edtCountry=IQUniFieldSet1'
      'numZip=IQUniFieldSet1'
      'edtFaxNumber=IQUniFieldSet1'
      'edtPhoneNumber=IQUniFieldSet1'
      'chkUseUsaMask=IQUniFieldSet1')
    Marker = 0
    object IQUniFieldSet1: TIQUniFieldSet
      Left = 0
      Top = 0
      Width = 256
      Height = 128
      Hint = ''
      Title = 'Contact'
      TabOrder = 0
    end
    object edtPrimeContact: TUniDBEdit
      Left = 8
      Top = 8
      Width = 121
      Height = 22
      Hint = ''
      DataField = 'PRIME_CONTACT'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 1
      FieldLabel = 'Prime Contact'
    end
    object edtAddress1: TUniDBEdit
      Left = 8
      Top = 32
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 1
      DataField = 'ADDR1'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 2
      FieldLabel = 'Address 1'
    end
    object edtAddress2: TUniDBEdit
      Left = 8
      Top = 56
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 2
      DataField = 'ADDR2'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 3
      FieldLabel = 'Address 2'
    end
    object edtAddress3: TUniDBEdit
      Left = 8
      Top = 80
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 3
      DataField = 'ADDR3'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 4
      FieldLabel = 'Address 3'
    end
    object edtCity: TUniDBEdit
      Left = 8
      Top = 104
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 4
      DataField = 'CITY'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 5
      FieldLabel = 'City'
    end
    object edtState: TUniDBEdit
      Left = 8
      Top = 128
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 5
      DataField = 'STATE'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 6
      FieldLabel = 'State'
    end
    object edtCountry: TUniDBEdit
      Left = 8
      Top = 152
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 6
      DataField = 'COUNTRY'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 7
      FieldLabel = 'Country'
    end
    object numZip: TUniDBNumberEdit
      Left = 8
      Top = 176
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 7
      DataField = 'ZIP'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 8
      FieldLabel = 'Zip'
      DecimalSeparator = '.'
    end
    object edtFaxNumber: TUniDBEdit
      Left = 8
      Top = 200
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 8
      DataField = 'FAX_NUMBER'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 9
      FieldLabel = 'Fax Number'
    end
    object edtPhoneNumber: TUniDBEdit
      Left = 8
      Top = 224
      Width = 121
      Height = 22
      Hint = ''
      CreateOrder = 9
      DataField = 'PHONE_NUMBER'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      TabOrder = 10
      FieldLabel = 'Phone Number'
    end
    object chkUseUsaMask: TUniDBCheckBox
      Left = 8
      Top = 248
      Width = 97
      Height = 17
      Hint = ''
      CreateOrder = 10
      DataField = 'USE_USA_MASK'
      DataSource = Address_Book_DM.SrcManual_PS_Addr
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = ''
      TabOrder = 11
      FieldLabel = 'Use USA Mask'
    end
  end
end
