object FrmPRPrintCh: TFrmPRPrintCh
  Left = 45
  Top = 177
  ClientHeight = 263
  ClientWidth = 472
  Caption = 'Print Payroll Checks'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 259
    Top = 0
    Width = 6
    Height = 226
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 226
    Width = 472
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 5
      Top = 13
      Width = 82
      Height = 13
      Hint = ''
      Caption = 'Starting Check#:'
      TabOrder = 3
    end
    object Panel2: TUniPanel
      Left = 225
      Top = 1
      Width = 247
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnPrint: TUniButton
        Left = 86
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Print'
        TabOrder = 1
        OnClick = BtnPrintClick
      end
      object BtnCancel: TUniButton
        Left = 170
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
    object EditCheckNo: TUniEdit
      Left = 88
      Top = 8
      Width = 65
      Height = 21
      Hint = ''
      Text = 'EditCheckNo'
      TabOrder = 1
      OnChange = EditCheckNoChange
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 226
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 257
      Height = 18
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'Available Checks'
    end
    object gridChecks: TIQUniGridControl
      Left = 1
      Top = 18
      Width = 257
      Height = 208
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 40
      IQComponents.Grid.Height = 122
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = srcPRChecks
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
      IQComponents.Navigator.DataSource = srcPRChecks
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 40
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 122
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = srcPRChecks
      Columns = <
        item
          FieldName = 'CHECK_NO'
          Title.Caption = 'Check#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CHECK_AMOUNT'
          Title.Caption = 'Check Amount'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NAME'
          Title.Caption = 'Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMPNO'
          Title.Caption = 'Emp#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SSNMBR'
          Title.Caption = 'SSN'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR1'
          Title.Caption = 'Address1'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ADDR2'
          Title.Caption = 'Address2'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATE'
          Title.Caption = 'State'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ZIP'
          Title.Caption = 'Zip'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COUNTRY'
          Title.Caption = 'Country'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_NUMBER'
          Title.Caption = 'Phone#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEPARTMENT'
          Title.Caption = 'Department'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel4: TUniPanel
    Left = 265
    Top = 0
    Width = 27
    Height = 226
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object sbDD: TUniSpeedButton
      Left = 1
      Top = 155
      Width = 24
      Height = 24
      Hint = 'Select Direct Deposits only'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBDC0BEBEC0BEFF00FFFF00FF7E9AD096A8C5FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAAAFAC788D80426C4845
        5D45979B97C1C1C372C2FA99C2E2BABCC8FF00FFFF00FFFF00FFFF00FFC2C3C3
        6682702A5D3E02501B003D000041232F78723D84884E8FAD90F9FFD5FFFF98C4
        E4A1A9C3FF00FFFF00FFFF00FFA7ABA8014F1C05531B003A001753587FCDE5AE
        FFFFB0FFFFADFFFF9CFFFF8DFFFFC1FFFFACDFF49DA5C3FF00FFFF00FFB2B5B3
        084C1F0035000C483C74EBFF95FFFF7EFFFF7FFFFF7EFFFF78FAFF79FAFF6BF9
        FFA7FFFF83EDFF96A2C5FF00FFAFB2B0095A24194C122590A955FFFF48F4FF2B
        BAFF048AD022AFE145E7FF3DE9FF4AFFFF3EF7FF1598DD9398A2FF00FFC1C1C1
        8290865884513ABDDB22EDFF1694CB207B754B8B5E318DA016E1FF1FDEFF0388
        D81078B73D8893B9B9B9FF00FFFF00FF9CA09D0C460A1777A10B78D5094D06A3
        D67BFFFFFA86CBEC0081E0005FB232617773BAAF6ACEBCADADADFF00FFC8C8C8
        084C2002581000422E002A2D0A4D06307E3D599B6653A084326AAE4994A773CD
        A069B8A7547D6DBDBDBDFF00FF8C948F02551E06511F01430B0A570B168C1C3E
        A03D7BAEA264B09B5CC09F5483707E8A83B1B1B1FF00FFFF00FFFF00FF466651
        04571E034A1A0145191D8122078F0696DF99E9FFFF4CA060597B71FF00FFFF00
        FFFF00FFFF00FFFF00FFBABBBB04481B05501B00421A015013228F2046B74844
        A74D4F7A529EA09EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9FA4A101521E
        034D1B00370F21772986DD8A6B9F787F867FFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFCACACA9AA29D265A380A59204C975C839489C4C4C4FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        C0C1C06A8474A7AAA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbDDClick
    end
    object sbCheck: TUniSpeedButton
      Left = 1
      Top = 189
      Width = 24
      Height = 24
      Hint = 'Select Checks only'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFC2C0C08A746DCBCBCBFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C0757575CBCBCBFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF937A64B48B6581706DFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF787878888888717171FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF907C6BFFFCDFFFFFF9B48D6C84726EFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AF7F7F7FEFEFE8B8B8B73
        7373FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A8B82
        76543EA5784ED1C3AAAB9675BD9C7C90653F796E6EFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF8B8B8B535353757575C0C0C092929299999963
        63636F6F6FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C6C69B7957
        FFE9C6B18D68AB835CA07752A8815AC099748D653E8A6B4E8B705781695B8F7C
        76978886AAA1A1C4C2C1C6C6C6767676E4E4E48A8A8A8080807474747E7E7E96
        96966262626868686D6D6D6868687C7C7C898989A2A2A2C2C2C2A09A9AAB8D6C
        FFFFFFFFFFF3F4F4E2FFF7E4FFF9E7E5DBC5E4D1B8E4CCB2FFF4DDEEDEC7E7D4
        BCE0C7B49A765386715E9B9B9B8A8A8AFFFFFFFDFDFDF1F1F1F4F4F4F6F6F6D8
        D8D8CECECEC9C9C9F1F1F1DBDBDBD1D1D1C6C6C67373736F6F6FB9B6B6C1B19C
        DCDAD2CAC2B3E4DDD3DED6CBEEEFE9F3F3EFFFFCF8F0EEE9F3F5EFFFFFFFFFFF
        FFFFFFFFD1BCA4877161B6B6B6AEAEAED8D8D8BFBFBFDCDCDCD5D5D5EEEEEEF3
        F3F3FCFCFCEEEEEEF4F4F4FFFFFFFFFFFFFFFFFFB9B9B9707070B3AEAECBB8A4
        D3CCC2AA9A88CCC1B5BAADA0C1B4A7CBC0B4BCB2A4E5DDD3ECE6DFDDD8D4E3DA
        D2EDE9E6AE9B88998B82AFAFAFB6B6B6CBCBCB989898BFBFBFACACACB3B3B3BE
        BEBEB0B0B0DCDCDCE5E5E5D8D8D8D9D9D9E9E9E99999998B8B8BA39993DCCFC5
        BDB5ACA39685ACA191ACA192A19280B0A497A497879C8D7ACAC3BBE3DED8E4DE
        D8D5CDC27F644CAAA19D999999CECECEB4B4B49393939F9F9F9F9F9F909090A2
        A2A29595958B8B8BC2C2C2DDDDDDDEDEDECCCCCC626262A1A1A1928375F8F3EB
        FFFFFDFCFDFCE7E2DCDED8D1CDC6C0B4AAA0B8AFA49C8E7E85756183725E806F
        5AE8E3DC8E765FA59B9B828282F2F2F2FFFFFFFDFDFDE2E2E2D7D7D7C5C5C5A9
        A9A9AEAEAE8C8C8C7272727070706D6D6DE2E2E27474749C9C9CB7B2B0978879
        9584729C8E7FAA9988B8A79AE9E3D8F3E8DBDCD1C3F3EEEBF4EBE2E5DDD5E5E2
        DEFFFFFF8B70548A8080B2B2B28686868282828C8C8C979797A6A6A6E2E2E2E7
        E7E7CFCFCFEEEEEEEAEAEADCDCDCE2E2E2FFFFFF6D6D6D818181FF00FFFF00FF
        FF00FFFF00FFFF00FFC9C9C97C6862DACDBAC6BAAC604629977F63CABCADD2C5
        B8BBA3888D7C6FC6C5C5FF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9686868CA
        CACAB8B8B84444447C7C7CBABABAC4C4C4A0A0A07B7B7BC5C5C5FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF918278FFFFFFDEDBD4948776EEEDE8B097
        7A908383FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF81
        8181FFFFFFDADADA858585ECECEC939393848484FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A796DFFFFFFFFFFFFC6B29F8776
        75FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF787878FFFFFFFFFFFFB0B0B0777777FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF948474C5B8A989776FFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF828282B6B6B6777777FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3C2C2918271FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFC2C2C2808080FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbCheckClick
    end
    object BtnAppend: TUniButton
      Left = 1
      Top = 20
      Width = 24
      Height = 24
      Hint = ''
      Caption = '>'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 3
      OnClick = AssignRecordToStringGrid
    end
    object BtnAppendAll: TUniButton
      Left = 1
      Top = 54
      Width = 24
      Height = 24
      Hint = ''
      Caption = '>>'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 4
      OnClick = BtnAppendAllClick
    end
    object BtnDeleteAll: TUniButton
      Left = 1
      Top = 88
      Width = 24
      Height = 24
      Hint = ''
      Caption = '<<'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 5
      OnClick = BtnDeleteAllClick
    end
    object BtnDelete: TUniButton
      Left = 1
      Top = 121
      Width = 24
      Height = 24
      Hint = ''
      Caption = '<'
      ParentFont = False
      Font.Color = clBlack
      TabOrder = 6
      OnClick = BtnDeleteClick
    end
  end
  object Panel5: TUniPanel
    Left = 292
    Top = 0
    Width = 180
    Height = 226
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 178
      Height = 18
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'Checks to Print'
    end
    object GridToPrint: TUniStringGrid
      Left = 1
      Top = 18
      Width = 178
      Height = 208
      Hint = ''
      FixedCols = 0
      RowCount = 2
      ColCount = 3
      DefaultRowHeight = 17
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      Columns = <>
      OnMouseDown = GridToPrintMouseDown
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 97
    Top = 56
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object ChecksForm1: TUniMenuItem
        Caption = '&Checks Form'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = ChecksForm1Click
      end
      object DirectdepositForm1: TUniMenuItem
        Caption = '&Direct deposit Form'
        GroupIndex = 1
        RadioItem = True
        OnClick = DirectdepositForm1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object Reverseprintingorder1: TUniMenuItem
        Caption = 'Reverse printing order'
        GroupIndex = 1
        OnClick = Reverseprintingorder1Click
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
  object srcPRChecks: TDataSource
    DataSet = qryPrChecks
    Left = 24
    Top = 96
  end
  object qryPrChecks: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id as pr_prepost_employee_id,'
      '       p.pr_emp_id,'
      '       p.check_no,'
      '       PAYROLL.IQ_GETCHECKAMOUNT(p.id) as check_amount,'
      '       e.empno,'
      '       e.first_name,'
      '       e.last_name,'
      '       e.middle_name,'
      '       e.ssnmbr,'
      '       e.addr1,'
      '       e.addr2,'
      '       e.state,'
      '       e.zip,'
      '       e.country,'
      '       e.phone_number,'
      '       NVL(d.description, '#39' '#39') as department,'
      
        '       RTrim(LTrim(RTrim(LTrim(RTrim(LTrim(Nvl(e.first_name, '#39' '#39 +
        '))) || '#39' '#39' ||'
      
        '                   RTrim(LTrim(NVL(e.middle_name, '#39' '#39'))))) || '#39' ' +
        #39' ||'
      '                   RTrim(LTrim(NVL(e.last_name, '#39' '#39'))))) as name'
      '  from pr_prepost_employee p,'
      '       pr_emp e,'
      '       pr_department d'
      ' where p.pr_emp_id = e.id'
      '   and PAYROLL.IQ_GetEmployeeNetPay(p.id) > -0.001'
      '   and e.pr_department_id = d.id(+)'
      ''
      ''
      ' ')
    Left = 48
    Top = 96
    object qryPrChecksCHECK_NO: TBCDField
      DisplayLabel = 'Check#'
      DisplayWidth = 10
      FieldName = 'CHECK_NO'
      Size = 0
    end
    object qryPrChecksCHECK_AMOUNT: TFMTBCDField
      DisplayLabel = 'Check Amount'
      DisplayWidth = 10
      FieldName = 'CHECK_AMOUNT'
      currency = True
      Size = 38
    end
    object qryPrChecksNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 92
      FieldName = 'NAME'
      Size = 92
    end
    object qryPrChecksEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Size = 25
    end
    object qryPrChecksSSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Size = 11
    end
    object qryPrChecksADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object qryPrChecksADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Size = 60
    end
    object qryPrChecksSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
    end
    object qryPrChecksZIP: TStringField
      DisplayLabel = 'Zip'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Size = 10
    end
    object qryPrChecksCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Size = 30
    end
    object qryPrChecksPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 17
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object qryPrChecksDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 100
      FieldName = 'DEPARTMENT'
      Size = 100
    end
    object qryPrChecksPR_PREPOST_EMPLOYEE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PREPOST_EMPLOYEE_ID'
      Visible = False
      Size = 0
    end
    object qryPrChecksPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object qryPrChecksFIRST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Visible = False
      Size = 30
    end
    object qryPrChecksLAST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Visible = False
      Size = 30
    end
    object qryPrChecksMIDDLE_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Visible = False
      Size = 30
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmPRPrintCh'
    WebUse = False
    TouchScreen = False
    Left = 104
    Top = 96
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Print payroll checks'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192967 $'
    BuildVersion = '176554'
    Left = 152
    Top = 96
  end
  object procVoidCheck: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.PAYROLL_VOID.IQ_VOIDPRINTEDCHECK'
    Left = 40
    Top = 136
    ParamData = <
      item
        Name = 'V_PREPOST_EMP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnPrint'
      'BtnCancel'
      'BtnTest'
      'EditCheckNo'
      'gridChecks'
      'BtnAppend'
      'BtnAppendAll'
      'BtnDeleteAll'
      'BtnDelete'
      'GridToPrint'
      'qryPrChecks'
      'IQRepDef1'
      '')
    SecurityCode = 'FRMPRPRINTCH'
    Left = 112
    Top = 144
  end
  object PopupMenu1: TUniPopupMenu
    Left = 160
    Top = 139
    object SortbyEmp1: TUniMenuItem
      Caption = 'Sort by &Emp.#'
      Checked = True
      RadioItem = True
      OnClick = SortbyEmp1Click
    end
    object SortbyFirstName1: TUniMenuItem
      Caption = 'Sort by Emp &First Name'
      RadioItem = True
      OnClick = SortbyFirstName1Click
    end
    object SortbyLastName1: TUniMenuItem
      Caption = 'Sort by &Last Name'
      RadioItem = True
      OnClick = SortbyLastName1Click
    end
    object SortbyDepartment1: TUniMenuItem
      Caption = 'Sort by &Department, Last Name, First Name'
      RadioItem = True
      OnClick = SortbyDepartment1Click
    end
    object SortbyDepartmentEmp1: TUniMenuItem
      Caption = '&Sort by Department, Emp#'
      RadioItem = True
      OnClick = SortbyDepartmentEmp1Click
    end
  end
end
