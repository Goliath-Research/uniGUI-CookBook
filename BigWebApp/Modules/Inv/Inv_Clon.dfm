object FrmCloneArinvt: TFrmCloneArinvt
  Left = 76
  Top = 120
  HelpContext = 1301775
  ClientHeight = 367
  ClientWidth = 353
  Caption = 'Clone Inventory Item'
  OnShow = FormShow
  Constraints.MinHeight = 214
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtonCarrier: TUniPanel
    Left = 0
    Top = 326
    Width = 353
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 351
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object PnlButtons: TUniPanel
      Left = 138
      Top = 2
      Width = 215
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 7
        Top = 7
        Width = 96
        Height = 24
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 326
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 319
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 326
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 81
      Height = 324
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label3: TUniLabel
        Left = 6
        Top = 12
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Class'
        TabOrder = 2
      end
      object Label5: TUniLabel
        Left = 6
        Top = 36
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 6
        Top = 60
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Revision'
        TabOrder = 4
      end
      object Label1: TUniLabel
        Left = 6
        Top = 84
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'EPlant'
        TabOrder = 5
      end
      object PnlToolbarCheckBox: TUniPanel
        Left = 8
        Top = 105
        Width = 50
        Height = 25
        Hint = ''
        TabOrder = 0
        Caption = ''
        object sbtnSelectAll: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Select all'
          ShowHint = True
          ParentShowHint = False
          AllowAllUp = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
            7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
            9494949494949494949494949494949494949494949494949494FF00FFFF00FF
            B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
            FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
            D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
            B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
            FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
            D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
            B3977DA1A1A09393928787857E7D7C7978767978777F7E7C888685908F8D9796
            93979694979694B3977DFF00FFFF00FF949494A1A1A19393938787877D7D7D78
            78787878787E7E7E8686868F8F8F959595969696969696949494FF00FFFF00FF
            B3977D25B9FF28BEFF2CC4FF31CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
            FF8EF1FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D7
            D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F3949494FF00FFFF00FF
            B3977D24B9FF28BEFF2BC4FF31CBFF36D1FF3DD9FF45DEFF52E4FF63E9FF78ED
            FF8EF2FFA3F5FFB3977DFF00FFFF00FF949494C6C6C6C9C9C9CDCDCDD2D2D2D6
            D6D6DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F3949494FF00FFFF00FF
            508050407040305030203820B9B9B9ADADADA0A0A09292918686867D7D7D7A7A
            7A7B7A7A838281B3977DFF00FFFF00FF757575656565484848323232B9B9B9AD
            ADADA0A0A09292928686867D7D7D7A7A7A7A7A7A828282949494FF00FFFF00FF
            50905060A86050885030503031CBFF36D2FF3DD8FF46DFFF51E3FF63E8FF77EE
            FF8EF1FFA3F5FFB3977DFF00FFFF00FF8282829898987B7B7B484848D2D2D2D7
            D7D7DBDBDBE0E0E0E3E3E3E7E7E7ECECECEFEFEFF3F3F394949470A88060A070
            60986070B0705098504070403050302038203DD9FF45DEFF52E4FF63E9FF78ED
            FF8EF2FFA3F5FFB3977D9D9D9D9494948B8B8BA2A2A288888865656548484832
            3232DCDCDCE0E0E0E4E4E4E8E8E8ECECECF0F0F0F3F3F394949480B090A0D8A0
            70C08070B87060A060509050408840305030A17A57A17A57A17A57A17A57A17A
            57A17A57A17A57A17A57A7A7A7CACACAB0B0B0A8A8A891919182828279797948
            484877777777777777777777777777777777777777777777777790B8A0B0D8B0
            A0D8A090D0A070B87060A860509850407040FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB1B1B1CECECECACACAC3C3C3A8A8A898989888888865
            6565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0A090B8A0
            80B090A0D8A070C080609860509050508050FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A7CACACAB0B0B08B8B8B82828275
            7575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            90B8A0B0D8B0A0D8A060A070FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1CECECECACACA949494FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            90C0A090B8A080B09070A880FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A7A7A79D9D9DFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = CheckBoxesSelectAll1Click
        end
        object sbtnUnselectAll: TUniSpeedButton
          Left = 25
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Unselect All'
          ShowHint = True
          ParentShowHint = False
          AllowAllUp = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            B3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB3977DB397
            7DB3977DB3977DB3977DFF00FFFF00FF94949494949494949494949494949494
            9494949494949494949494949494949494949494949494949494FF00FFFF00FF
            B3977DF3EADCF2E8DBF1E8DAF1E6D8F1E5D7F0E5D6F0E4D5EFE4D3EFE3D2EFE2
            D1EFE2D0EEE1CFB3977DFF00FFFF00FF949494E8E8E8E7E7E7E6E6E6E4E4E4E3
            E3E3E3E3E3E2E2E2E2E2E2E1E1E1E0E0E0E0E0E0DFDFDF949494FF00FFFF00FF
            B3977DF7F1EAF7F1E9F6F0E7F5EFE6F6EEE4F5EEE2F4ECE1F3EBE0F3EADEF3EA
            DDF2E9DBF2E8DAB3977DFF00FFFF00FF949494F0F0F0F0F0F0EFEFEFEEEEEEED
            EDEDECECECEBEBEBEAEAEAE9E9E9E9E9E9E7E7E7E6E6E6949494FF00FFFF00FF
            B3977D9393928787857E7D7C7978767978777F7E7C888685908F8D9796939796
            949796949D9A98B3977DFF00FFFF00FF9494949393938787877D7D7D78787878
            78787E7E7E8686868F8F8F9595959696969696969A9A9A949494FF00FFFF00FF
            B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE949494FF00FFFF00FF
            B3977DFFF9F4FFFAF6FFFBF7FFFBF8FFFCF9FFFDFAFFFDFBFFFEFCFFFFFDFFFF
            FEFFFFFEFFFFFFB3977DFF00FFFF00FF949494F9F9F9FAFAFAFBFBFBFBFBFBFC
            FCFCFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF949494FF00FFFF00FF
            B3977DC2C2C2C1C1C1B9B9B9ADADADA0A0A09292918686867D7D7D7A7A7A7B7A
            7A838281929190B3977DFF00FFFF00FF949494C2C2C2C1C1C1B9B9B9ADADADA0
            A0A09292928686867D7D7D7A7A7A7A7A7A828282919191949494FF00FFFF00FF
            B3977DFFFEFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFEFEFEFEFEFDB3977DFF00FFFF00FF949494FEFEFEFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFE9494946078D01038B0
            1038B01030B01028A01028A0002090002090FFFDFAFFFDFBFFFEFCFFFFFDFFFF
            FEFFFFFEFFFFFFB3977D8F8F8F6161616161615E5E5E5555555555554A4A4A4A
            4A4AFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF9494946080D09098FF
            5060FF5060FF3048F03048E02040D01028A0A17A57A17A57A17A57A17A57A17A
            57A17A57A17A57A17A57949494B4B4B49696969696968585857E7E7E73737355
            55557777777777777777777777777777777777777777777777777088E0A0A8FF
            9090FF7080FF5068FF3058F02048F01038B0FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF9F9F9FBFBFBFB0B0B0A6A6A69999998B8B8B85858561
            6161FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7088E07088E0
            6080D06078D05070C05060C04058B04058B0FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF9F9F9F9F9F9F9494948F8F8F8585857C7C7C71717171
            7171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentColor = False
          Color = clWindow
          OnClick = CheckBoxesUnselectAll1Click
        end
      end
    end
    object PnlClient01: TUniPanel
      Left = 87
      Top = 1
      Width = 266
      Height = 324
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        266
        324)
      object wwLookupClass: TUniDBLookupComboBox
        Left = 1
        Top = 8
        Width = 57
        Height = 21
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'CLASS'
        ListSource = SrcClass
        KeyField = 'CLASS'
        ListFieldIndex = 0
        DataSource = SrcClass
        TabOrder = 0
        Color = clWindow
      end
      object edItemNo: TUniEdit
        Left = 1
        Top = 32
        Width = 268
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 50
        Text = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edRev: TUniEdit
        Left = 1
        Top = 60
        Width = 268
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 15
        Text = ''
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object wwcombPlant: TUniDBLookupComboBox
        Left = 1
        Top = 80
        Width = 268
        Height = 21
        Hint = ''
        ListOnlyMode = lmFollowSource
        ListField = 'PLANT_NAME; PLANT_ID; COMPANY_NAME'
        ListSource = SrcEPlant
        KeyField = 'PLANT_NAME'
        ListFieldIndex = 0
        DataSource = SrcEPlant
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clWindow
      end
      object chkIncludeAutoMrp: TUniCheckBox
        Left = 1
        Top = 102
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include AutoMrp Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object chkIncludeUDForm: TUniCheckBox
        Left = 1
        Top = 118
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include User Defined Form Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
      object chkIncludeAKAInfo: TUniCheckBox
        Left = 1
        Top = 134
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include AKA Selling Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
      end
      object chkSPCInspectionSetup: TUniCheckBox
        Left = 1
        Top = 167
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Inspection Setup Parameters'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
      end
      object chkIncludeCostingInformation: TUniCheckBox
        Left = 1
        Top = 183
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Costing Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
      end
      object chkIncludeInternalDocuments: TUniCheckBox
        Left = 1
        Top = 200
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Internal Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
      end
      object chkIncludeExternalDocuments: TUniCheckBox
        Left = 1
        Top = 216
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include External Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
      end
      object chkEmailCorrespondence: TUniCheckBox
        Left = 1
        Top = 232
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Email Correspondence'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object chkForecastGroup: TUniCheckBox
        Left = 1
        Top = 249
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Forecast Group'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
      end
      object chkTierDiscount: TUniCheckBox
        Left = 1
        Top = 265
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include Tier Discounts'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 14
      end
      object chkIncludePricing: TUniCheckBox
        Left = 1
        Top = 282
        Width = 159
        Height = 17
        Hint = ''
        Caption = 'Include Pricing Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
      end
      object chkIncludeAKAInfoBuying: TUniCheckBox
        Left = 1
        Top = 151
        Width = 273
        Height = 17
        Hint = ''
        Caption = 'Include AKA Buying Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
      end
      object chkIncludeGeneral: TUniCheckBox
        Left = 1
        Top = 299
        Width = 159
        Height = 17
        Hint = ''
        Caption = 'Include General Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 16
      end
    end
  end
  object wwQryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select c.code as ecode,'
      '       c.company as company_name,'
      '       p.id as plant_id,'
      '       p.name as plant_name'
      '  from ecompany c,'
      '       eplant p'
      ' where c.id = p.ecompany_id'
      ' order by p.name'
      ' ')
    Left = 272
    Top = 166
    object wwQryEPlantPLANT_NAME: TStringField
      DisplayLabel = 'Plant Name'
      DisplayWidth = 15
      FieldName = 'PLANT_NAME'
      Origin = 'EPLANT.NAME'
      Size = 30
    end
    object wwQryEPlantCOMPANY_NAME: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY_NAME'
      Origin = 'ECOMPANY.COMPANY'
      Size = 60
    end
    object wwQryEPlantPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 5
      FieldName = 'PLANT_ID'
      Origin = 'EPLANT.ID'
      Size = 0
    end
    object wwQryEPlantECODE: TStringField
      DisplayLabel = 'ECode'
      DisplayWidth = 5
      FieldName = 'ECODE'
      Origin = 'ECOMPANY.CODE'
      Visible = False
      Size = 10
    end
  end
  object wwQryClass: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select RTrim(class) as class,'
      '       descrip'
      '  from arinvt_class'
      ' order by class')
    Left = 234
    Top = 65534
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object StoredProc1: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.IQCLONE.EXEC_ARINVT'
    Left = 107
    Top = 173
    ParamData = <
      item
        Name = 'Result'
        DataType = ftFMTBcd
        ParamType = ptResult
      end
      item
        Name = 'V_OLD_ARINVT'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_CLASS'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_ITEMNO'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_REV'
        DataType = ftFixedChar
        ParamType = ptInput
      end
      item
        Name = 'V_EPLANT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'v_include_auto_mrp'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_ud_form'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_aka'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_aka_buying'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_costing'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_internal'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_external'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_email'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_fr_group_id'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_spcinspection'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_tier_disc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_pricing'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_include_general'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object prcSPCInspection: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.IQSPC.CLONEDIMENSIONS'
    Left = 211
    Top = 153
    ParamData = <
      item
        Name = 'v_from_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_from_source_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_to_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'v_to_source_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'chkIncludeAutoMrp'
      'chkIncludeUDForm'
      'chkIncludeAKAInfo'
      'chkSPCInspectionSetup'
      'chkIncludeCostingInformation'
      'chkIncludeInternalDocuments'
      'chkIncludeExternalDocuments'
      'chkEmailCorrespondence'
      'chkForecastGroup'
      'chkTierDiscount'
      'btnOK')
    SecurityCode = 'FRMCLONEARINVT'
    Left = 282
    Top = 227
  end
  object PControls: TUniPopupMenu
    Left = 168
    Top = 184
    object CheckBoxes1: TUniMenuItem
      Caption = 'Check Boxes'
      object CheckBoxesSelectAll1: TUniMenuItem
        Caption = 'Select All'
        OnClick = CheckBoxesSelectAll1Click
      end
      object CheckBoxesUnselectAll1: TUniMenuItem
        Caption = 'Unselect All'
        OnClick = CheckBoxesUnselectAll1Click
      end
    end
  end
  object SrcClass: TDataSource
    DataSet = wwQryClass
    Left = 274
  end
  object SrcEPlant: TDataSource
    DataSet = wwQryEPlant
    Left = 312
    Top = 152
  end
end
