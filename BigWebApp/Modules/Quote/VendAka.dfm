object FrmVendAka: TFrmVendAka
  Left = 126
  Top = 154
  ClientHeight = 512
  ClientWidth = 805
  Caption = 'AKA Vendor/price breaks'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 242
    Width = 805
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PanelVendors: TUniPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 242
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Bevel18: TUniPanel
      Left = 1
      Top = 1
      Width = 803
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      ExplicitTop = 28
    end
    object IQSearchVendor: TIQUniGridControl
      Left = 1
      Top = 4
      Width = 803
      Height = 237
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 586
      IQComponents.Grid.Height = 151
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcVendor_Arinvt
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
      IQComponents.Navigator.DataSource = SrcVendor_Arinvt
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = NavAkaVendorBeforeAction
      IQComponents.HiddenPanel.Left = 586
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 151
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 124
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 153
      DataSource = SrcVendor_Arinvt
      Columns = <
        item
          FieldName = 'VENDORNO'
          Title.Caption = 'Vendor #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDORCOMP'
          Title.Caption = 'Vendor Name'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE_PER_1000'
          Title.Caption = 'Price/1000'
          Width = 7
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'VEND_REV'
          Title.Caption = 'Rev'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INFO_PO'
          Title.Caption = 'PO Item Info'
          Width = 350
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IS_DEFAULT'
          Title.Caption = 'Default'
          Width = 7
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'VEND_DESCRIP'
          Title.Caption = 'AKA Description'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VEND_ITEMNO'
          Title.Caption = 'AKA Item #'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SEQ'
          Title.Caption = 'Seq.'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CURRENCYDESCRIP'
          Title.Caption = 'Currency'
          Width = 105
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INFO_REC'
          Title.Caption = 'Receiving Item Info'
          Width = 350
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INSP_RECEIPT_THRES'
          Title.Caption = 'Rec Insp Threshold'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INSP_RECEIPT_COUNT'
          Title.Caption = 'Rec Insp Count'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VEND_DESCRIP2'
          Title.Caption = 'AKA Description2'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 31
      ExplicitHeight = 210
      Marker = 0
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 245
    Width = 805
    Height = 226
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel19: TUniPanel
      Left = 1
      Top = 28
      Width = 803
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Panel64: TUniPanel
      Left = 1
      Top = 1
      Width = 803
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Alignment = taLeftJustify
      Caption = ''
      object sbHideAkaBuying: TUniSpeedButton
        Left = 3
        Top = 3
        Width = 24
        Height = 22
        Hint = 'Click to hide inactives.'
        ShowHint = True
        ParentShowHint = False
        GroupIndex = 1
        AllowAllUp = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07040B05830B05830A05020A050209048209048
          20904020804020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7171715C
          5C5C5C5C5C5353535353534A4A4A4A4A4A454545424242FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFC07850F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0
          B0F0D0B0904020FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF797979D9
          D9D9D5D5D5D0D0D0CDCDCDCDCDCDCDCDCDCDCDCD454545FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFD08860FFF8F0FFF8F0FFF0E0FFF0E0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF888888F7
          F7F7F7F7F7EEEEEEEEEEEEE9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07040
          B05830B05830A05020A05020904820904820904020804020FFF0F0FFE8E0FFE8
          E0F0D0B0904820FF00FFFF00FF7171715C5C5C5C5C5C5353535353534A4A4A4A
          4A4A454545424242F2F2F2E9E9E9E9E9E9CDCDCD4A4A4AFF00FFFF00FFC07850
          F0D8D0F0D8C0F0D0C0F0D0B0F0D0B0F0D0B0F0D0B0904020FFF8F0FFF0E0FFF0
          E0F0D0C0A04820FF00FFFF00FF797979D9D9D9D5D5D5D0D0D0CDCDCDCDCDCDCD
          CDCDCDCDCD454545F7F7F7EEEEEEEEEEEED0D0D04D4D4DFF00FFFF00FFD08860
          FFF8F0E09060D08050D08050D08050D08050F0D0B0904820FFFFFFFFF0F0FFF0
          F0F0D8D0A05020FF00FFFF00FF888888F7F7F790909080808080808080808080
          8080CDCDCD4A4A4AFFFFFFF2F2F2F2F2F2D9D9D9535353FF00FFFF00FFD09070
          FFFFFFFFFFFFFFF0F0FFF0F0FFE8E0FFE8E0F0D0B0904820FFFFFFFFF8F0FFF8
          F0F0E0E0A05020FF00FFFF00FF909090FFFFFFFFFFFFF2F2F2F2F2F2E9E9E9E9
          E9E9CDCDCD4A4A4AFFFFFFF7F7F7F7F7F7E2E2E2535353FF00FFFF00FFE0A080
          FFFFFFF0A880E09870E09060D08050D08050F0D0C0A04820FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA0A0A0FFFFFFA8A8A898989890909080808080
          8080D0D0D04D4D4DFFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0A890
          FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0FFF0F0F0D8D0A05020FFFFFFFFFFFFFFFF
          FFFFFFFFA05020FF00FFFF00FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F2
          F2F2D9D9D9535353FFFFFFFFFFFFFFFFFFFFFFFF535353FF00FFFF00FFE0B8A0
          FFFFFFFFB090F0B090F0A880F09870E09060F0E0E0A05020E0A080D09070D088
          60C07850C07040FF00FFFF00FFB7B7B7FFFFFFB1B1B1B0B0B0A8A8A89A9A9A90
          9090E2E2E2535353A0A0A0909090888888797979717171FF00FFFF00FFF0C0A0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA05020FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF535353FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF0C8B0
          F0C0B0F0C0B0F0B8A0E0A080D09070D08860C07850C07040FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B8B8B8A0A0A090909088
          8888797979717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbHideAkaBuyingClick
      end
    end
    object GridAkaVendorBreaks: TIQUniGridControl
      Left = 1
      Top = 31
      Width = 803
      Height = 194
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 586
      IQComponents.Grid.Height = 108
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcArinvt_Vendors_Breaks
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
      IQComponents.Navigator.DataSource = SrcArinvt_Vendors_Breaks
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 586
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 108
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcArinvt_Vendors_Breaks
      Columns = <
        item
          FieldName = 'QUAN'
          Title.Caption = 'Quantity'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QPRICE'
          Title.Caption = 'Price'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EFFECT_DATE'
          Title.Caption = 'Effective Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEACTIVE_DATE'
          Title.Caption = 'Inactive Date'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 471
    Width = 805
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel3: TUniPanel
      Left = 494
      Top = 1
      Width = 310
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 224
        Top = 10
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 145
        Top = 10
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object SrcArinvt_Vendors_Breaks: TDataSource
    DataSet = TblArinvt_Vendors_Breaks
    Left = 48
    Top = 312
  end
  object TblArinvt_Vendors_Breaks: TFDTable
    BeforeInsert = TblArinvt_Vendors_BreaksBeforeEdit
    BeforeEdit = TblArinvt_Vendors_BreaksBeforeEdit
    AfterPost = TblArinvt_Vendors_BreaksAfterPost
    Filtered = True
    OnFilterRecord = TblArinvt_Vendors_BreaksFilterRecord
    IndexFieldNames = 'ARINVT_VENDORS_ID;EFFECT_DATE;QUAN'
    MasterSource = SrcVendor_Arinvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARINVT_VENDORS_BREAKS'
    TableName = 'ARINVT_VENDORS_BREAKS'
    Left = 48
    Top = 336
    object TblArinvt_Vendors_BreaksQUAN: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Required = True
      Size = 2
    end
    object TblArinvt_Vendors_BreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 10
      FieldName = 'QPRICE'
      DisplayFormat = '########0.000000#'
      Size = 6
    end
    object TblArinvt_Vendors_BreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object TblArinvt_Vendors_BreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object TblArinvt_Vendors_BreaksCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 30
      FieldName = 'COMMENT1'
      Size = 255
    end
    object TblArinvt_Vendors_BreaksARINVT_VENDORS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_VENDORS_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblArinvt_Vendors_BreaksPRICE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
      Visible = False
    end
    object TblArinvt_Vendors_BreaksID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object QryArinvtVendors: TFDQuery
    BeforeInsert = QryArinvtVendorsBeforeEdit
    AfterInsert = QryArinvtVendorsAfterInsert
    BeforeEdit = QryArinvtVendorsBeforeEdit
    BeforePost = QryArinvtVendorsBeforePost
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.arinvt_id,'
      '       a.vend_itemno,'
      '       a.vend_descrip,'
      '       a.vend_descrip2,'
      '       a.vendor_id,'
      '       a.price_per_1000,'
      '       a.currency_id,'
      '       a.cuser1,'
      '       a.cuser2,'
      '       a.cuser3,'
      '       a.cuser4,'
      '       a.cuser5,'
      '       a.cuser6,'
      '       a.cuser7,'
      '       a.cuser8,'
      '       a.cuser9,'
      '       a.cuser10,'
      '       a.nuser1,'
      '       a.nuser2,'
      '       a.nuser3,'
      '       a.nuser4,'
      '       a.nuser5,'
      '       a.vend_rev,'
      '       a.info_po,'
      '       a.info_rec,'
      '       a.nuser6,'
      '       a.nuser7,'
      '       a.nuser8,'
      '       a.nuser9,'
      '       a.nuser10,'
      '       a.seq,'
      '       a.is_default,'
      '       c.company as VendorComp,'
      '       c.vendorno,'
      '       r.descrip as CurrencyDescrip,'
      '       a.INSP_RECEIPT_THRES,'
      '       a.INSP_RECEIPT_COUNT'
      '  from arinvt_vendors a,'
      '       vendor c,'
      '       currency r'
      ' where a.vendor_id = c.id(+) '
      '   and a.currency_id = r.id(+)'
      '        and a.arinvt_id = :AID')
    Left = 80
    Top = 111
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtVendorsVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'c.vendorno'
      FixedChar = True
      Size = 10
    end
    object QryArinvtVendorsVENDORCOMP: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 30
      FieldName = 'VENDORCOMP'
      Origin = 'c.company'
      FixedChar = True
      Size = 60
    end
    object QryArinvtVendorsPRICE_PER_1000: TStringField
      DisplayLabel = 'Price/1000'
      DisplayWidth = 1
      FieldName = 'PRICE_PER_1000'
      Origin = 'a.PRICE_PER_1000'
      FixedChar = True
      Size = 1
    end
    object QryArinvtVendorsVEND_REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'VEND_REV'
      Origin = 'a.VEND_REV'
      Size = 15
    end
    object QryArinvtVendorsINFO_PO: TStringField
      DisplayLabel = 'PO Item Info'
      DisplayWidth = 50
      FieldName = 'INFO_PO'
      Origin = 'a.INFO_PO'
      Size = 2000
    end
    object QryArinvtVendorsIS_DEFAULT: TStringField
      DisplayLabel = 'Default'
      DisplayWidth = 1
      FieldName = 'IS_DEFAULT'
      Origin = 'a.IS_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object QryArinvtVendorsVEND_DESCRIP: TStringField
      DisplayLabel = 'AKA Description'
      DisplayWidth = 35
      FieldName = 'VEND_DESCRIP'
      Origin = 'a.VEND_DESCRIP'
      Size = 35
    end
    object QryArinvtVendorsVEND_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 25
      FieldName = 'VEND_ITEMNO'
      Origin = 'a.VEND_ITEMNO'
      Size = 25
    end
    object QryArinvtVendorsSEQ: TBCDField
      DisplayLabel = 'Seq.'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'a.seq'
      Size = 0
    end
    object QryArinvtVendorsCURRENCYDESCRIP: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 15
      FieldName = 'CURRENCYDESCRIP'
      Origin = 'r.descrip'
      Size = 50
    end
    object QryArinvtVendorsINFO_REC: TStringField
      DisplayLabel = 'Receiving Item Info'
      DisplayWidth = 50
      FieldName = 'INFO_REC'
      Size = 2000
    end
    object QryArinvtVendorsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.ID'
      Visible = False
      Size = 0
    end
    object QryArinvtVendorsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'a.ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryArinvtVendorsVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'a.VENDOR_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryArinvtVendorsCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'a.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryArinvtVendorsCUSER1: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER1'
      Origin = 'a.CUSER1'
      Visible = False
      Size = 60
    end
    object QryArinvtVendorsNUSER4: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER4'
      Origin = 'a.NUSER4'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsCUSER2: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER2'
      Origin = 'a.CUSER2'
      Visible = False
      Size = 60
    end
    object QryArinvtVendorsNUSER5: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER5'
      Origin = 'a.NUSER5'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsCUSER3: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER3'
      Origin = 'a.CUSER3'
      Visible = False
      Size = 60
    end
    object QryArinvtVendorsNUSER6: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER6'
      Origin = 'a.NUSER6'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsCUSER4: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER4'
      Origin = 'a.CUSER4'
      Visible = False
      Size = 60
    end
    object QryArinvtVendorsNUSER7: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER7'
      Origin = 'a.NUSER7'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsCUSER5: TStringField
      DisplayWidth = 60
      FieldName = 'CUSER5'
      Origin = 'a.CUSER5'
      Visible = False
      Size = 60
    end
    object QryArinvtVendorsNUSER8: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER8'
      Origin = 'a.NUSER8'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsNUSER1: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER1'
      Origin = 'a.NUSER1'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsNUSER9: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER9'
      Origin = 'a.NUSER9'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsNUSER2: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER2'
      Origin = 'a.NUSER2'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsNUSER10: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER10'
      Origin = 'a.NUSER10'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsNUSER3: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'NUSER3'
      Origin = 'a.NUSER3'
      Visible = False
      Size = 6
    end
    object QryArinvtVendorsINSP_RECEIPT_THRES: TBCDField
      DisplayLabel = 'Rec Insp Threshold'
      FieldName = 'INSP_RECEIPT_THRES'
      Origin = 'a.INSP_RECEIPT_THRES'
      Size = 0
    end
    object QryArinvtVendorsINSP_RECEIPT_COUNT: TBCDField
      DisplayLabel = 'Rec Insp Count'
      FieldName = 'INSP_RECEIPT_COUNT'
      Origin = 'a.INSP_RECEIPT_COUNT'
      Size = 0
    end
    object QryArinvtVendorsCUSER6: TStringField
      FieldName = 'CUSER6'
      Size = 60
    end
    object QryArinvtVendorsCUSER7: TStringField
      FieldName = 'CUSER7'
      Size = 60
    end
    object QryArinvtVendorsCUSER8: TStringField
      FieldName = 'CUSER8'
      Size = 60
    end
    object QryArinvtVendorsCUSER9: TStringField
      FieldName = 'CUSER9'
      Size = 60
    end
    object QryArinvtVendorsCUSER10: TStringField
      FieldName = 'CUSER10'
      Size = 60
    end
    object QryArinvtVendorsVEND_DESCRIP2: TStringField
      FieldName = 'VEND_DESCRIP2'
      Size = 100
    end
  end
  object SrcVendor_Arinvt: TDataSource
    DataSet = QryArinvtVendors
    Left = 80
    Top = 152
  end
  object MainMenu1: TUniMainMenu
    Left = 256
    Top = 86
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'AKA Vendor/price breaks'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 296
    Top = 86
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from v_vendor'
      'order by vendorno'
      '         '
      '         '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 194
    Top = 306
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object StringField2: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object StringField4: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
    end
    object StringField5: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkQCurr: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select c1.id,'
      '       c1.curr_code,'
      '       c1.descrip,'
      '       c1.glvalue,'
      '       c1.spot_rate,'
      '       c1.curr_symbol,'
      '       c1.ecode,'
      '       c1.eid,'
      '       c1.edate_time,'
      '       c1.ecopy,'
      '       c1.native_curr'
      '  from currency c1'
      ' where c1.native_curr = c1.curr_code'
      '  order by c1.descrip'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 304
    object PkQCurrCURR_CODE: TStringField
      DisplayLabel = 'Curr. Code'
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
    object PkQCurrID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CURRENCY.ID'
      Visible = False
      Size = 0
    end
    object PkQCurrDESCRIP: TStringField
      DisplayLabel = 'Currency'
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object PkQCurrGLVALUE: TStringField
      FieldName = 'GLVALUE'
      Origin = 'IQ.CURRENCY.GLVALUE'
      Visible = False
      Size = 50
    end
    object PkQCurrSPOT_RATE: TFMTBCDField
      FieldName = 'SPOT_RATE'
      Origin = 'IQ.CURRENCY.SPOT_RATE'
      Visible = False
      Size = 6
    end
    object PkQCurrCURR_SYMBOL: TStringField
      FieldName = 'CURR_SYMBOL'
      Origin = 'IQ.CURRENCY.CURR_SYMBOL'
      Visible = False
      Size = 10
    end
    object PkQCurrECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'IQ.CURRENCY.ECODE'
      Visible = False
      Size = 10
    end
    object PkQCurrEID: TBCDField
      FieldName = 'EID'
      Origin = 'IQ.CURRENCY.EID'
      Visible = False
      Size = 0
    end
    object PkQCurrEDATE_TIME: TDateTimeField
      FieldName = 'EDATE_TIME'
      Origin = 'IQ.CURRENCY.EDATE_TIME'
      Visible = False
    end
    object PkQCurrECOPY: TStringField
      FieldName = 'ECOPY'
      Origin = 'IQ.CURRENCY.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkQCurrNATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Visible = False
      Size = 3
    end
  end
end
