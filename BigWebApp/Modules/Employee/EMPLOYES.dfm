object FrmEmployee: TFrmEmployee
  Left = 7
  Top = 147
  ClientHeight = 231
  ClientWidth = 464
  Caption = 'Employee Maintenance'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnSearch: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Search...'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DD00
        0DDDD000DDDDDD000000D07E70DD07E70DDDDD000000D0E7E0DD0E7E0DDDDD00
        0000D0FE70DD0FE70DDDDD000000D0EFE0DD0EFE0DDDDD000000D8000D00D000
        8DDDDD000000DD0DDDDDDDDD0DDD0D000000DDD0DDD0DDDDD0DD0D000000DDDD
        0DD0DDDDDD0D0D000000DDDDD0D0DDDDDDD0DD000000DDDDDD0DDDDDDDDDDD00
        0000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSearchClick
    end
    object sbtnTableForm: TUniSpeedButton
      Left = 27
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Form - Table Toggle'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
        FFF07F3FF3FF3FFF3FF70F00F00F000F00F07F773773777377370FFFFFFFFFFF
        FFF07F3FF3FF33FFFFF70F00F00FF00000F07F773773377777F70FEEEEEFF0F9
        FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F737F70F0000FFF0FF
        FCF07F7777F337F337370F0000FFF0FFFFF07F777733373333370FFFFFFFFFFF
        FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
        C880733777777777733700000000000000007777777777777777333333333333
        3333333333333333333333333333333333333333333333333333}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTableFormClick
    end
    object navEmp: TUniDBNavigator
      Left = 224
      Top = 1
      Width = 240
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcEmp
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object pcEmp: TUniPageControl
    Left = 0
    Top = 27
    Width = 464
    Height = 204
    Hint = ''
    ActivePage = tabForm
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 467
    ExplicitHeight = 215
    object tabGrid: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'tabGrid'
      object gridEmp: TUniDBGrid
        Left = 0
        Top = 0
        Width = 456
        Height = 176
        Hint = ''
        DataSource = SrcEmp
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'EMPNO'
            Title.Caption = 'Emp#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'FIRST_NAME'
            Title.Caption = 'First Name'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MIDDLE_NAME'
            Title.Caption = 'Middle Name'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_NAME'
            Title.Caption = 'Last Name'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SSNMBR'
            Title.Caption = 'SSN'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR1'
            Title.Caption = 'Address1'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDR2'
            Title.Caption = 'Address2'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATE'
            Title.Caption = 'State'
            Width = 30
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'COUNTRY'
            Title.Caption = 'Country'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ZIP'
            Title.Caption = 'ZIP'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PHONE_NUMBER'
            Title.Caption = 'Phone#'
            Width = 154
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CITY'
            Title.Caption = 'City'
            Width = 184
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CHARGE_RATE'
            Title.Caption = 'Charge rate'
            Width = 82
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'STATUS_CODE'
            Title.Caption = 'Status Code'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DATE_HIRED'
            Title.Caption = 'Date Hired'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TERMINATION_DATE'
            Title.Caption = 'Date Terminated'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_REVIEW_DATE'
            Title.Caption = 'Last review date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'NEXT_REVIEW_DATE'
            Title.Caption = 'Next review date'
            Width = 112
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
    object tabForm: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'tabForm'
      object GroupBox1: TUniGroupBox
        Left = 0
        Top = 0
        Width = 456
        Height = 113
        Hint = ''
        Caption = ' Personal Info '
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ExplicitWidth = 459
        object Label1: TUniLabel
          Left = 8
          Top = 18
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Emp.#:'
          TabOrder = 13
        end
        object Label2: TUniLabel
          Left = 104
          Top = 18
          Width = 44
          Height = 13
          Hint = ''
          Caption = 'F. Name:'
          TabOrder = 14
        end
        object Label3: TUniLabel
          Left = 213
          Top = 18
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'M. Name:'
          TabOrder = 15
        end
        object Label4: TUniLabel
          Left = 314
          Top = 18
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'L. Name:'
          TabOrder = 16
        end
        object Label5: TUniLabel
          Left = 8
          Top = 41
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'SSN:'
          TabOrder = 17
        end
        object Label6: TUniLabel
          Left = 213
          Top = 41
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Address1:'
          TabOrder = 18
        end
        object Label7: TUniLabel
          Left = 213
          Top = 65
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Address2:'
          TabOrder = 19
        end
        object Label8: TUniLabel
          Left = 8
          Top = 65
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Phone:'
          TabOrder = 20
        end
        object Label9: TUniLabel
          Left = 8
          Top = 88
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'City:'
          TabOrder = 21
        end
        object Label10: TUniLabel
          Left = 135
          Top = 88
          Width = 30
          Height = 13
          Hint = ''
          Caption = 'State:'
          TabOrder = 22
        end
        object Label11: TUniLabel
          Left = 213
          Top = 88
          Width = 20
          Height = 13
          Hint = ''
          Caption = 'ZIP:'
          TabOrder = 23
        end
        object Label12: TUniLabel
          Left = 317
          Top = 88
          Width = 43
          Height = 13
          Hint = ''
          Caption = 'Country:'
          TabOrder = 24
        end
        object editEmpNo: TUniDBEdit
          Left = 48
          Top = 14
          Width = 48
          Height = 21
          Hint = ''
          DataField = 'EMPNO'
          DataSource = SrcEmp
          TabOrder = 0
        end
        object editFName: TUniDBEdit
          Left = 150
          Top = 14
          Width = 55
          Height = 21
          Hint = ''
          DataField = 'FIRST_NAME'
          DataSource = SrcEmp
          TabOrder = 1
        end
        object editMName: TUniDBEdit
          Left = 260
          Top = 14
          Width = 45
          Height = 21
          Hint = ''
          DataField = 'MIDDLE_NAME'
          DataSource = SrcEmp
          TabOrder = 2
        end
        object editLName: TUniDBEdit
          Left = 360
          Top = 14
          Width = 80
          Height = 21
          Hint = ''
          DataField = 'LAST_NAME'
          DataSource = SrcEmp
          TabOrder = 3
        end
        object editSSN: TUniDBEdit
          Left = 48
          Top = 37
          Width = 78
          Height = 21
          Hint = ''
          DataField = 'SSNMBR'
          DataSource = SrcEmp
          TabOrder = 4
        end
        object editAddr1: TUniDBEdit
          Left = 260
          Top = 37
          Width = 180
          Height = 21
          Hint = ''
          DataField = 'ADDR1'
          DataSource = SrcEmp
          TabOrder = 5
        end
        object editAddr2: TUniDBEdit
          Left = 260
          Top = 61
          Width = 180
          Height = 21
          Hint = ''
          DataField = 'ADDR2'
          DataSource = SrcEmp
          TabOrder = 6
        end
        object editPhone: TUniDBEdit
          Left = 48
          Top = 61
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'PHONE_NUMBER'
          DataSource = SrcEmp
          MaxLength = 12
          TabOrder = 7
        end
        object editCity: TUniDBEdit
          Left = 48
          Top = 84
          Width = 77
          Height = 21
          Hint = ''
          DataField = 'CITY'
          DataSource = SrcEmp
          TabOrder = 8
        end
        object editState: TUniDBEdit
          Left = 172
          Top = 84
          Width = 33
          Height = 21
          Hint = ''
          DataField = 'STATE'
          DataSource = SrcEmp
          TabOrder = 9
        end
        object editZip: TUniDBEdit
          Left = 260
          Top = 84
          Width = 45
          Height = 21
          Hint = ''
          DataField = 'ZIP'
          DataSource = SrcEmp
          TabOrder = 10
        end
        object editCountry: TUniDBEdit
          Left = 360
          Top = 84
          Width = 80
          Height = 21
          Hint = ''
          DataField = 'COUNTRY'
          DataSource = SrcEmp
          TabOrder = 11
        end
      end
      object GroupBox2: TUniGroupBox
        Left = 0
        Top = 113
        Width = 456
        Height = 63
        Hint = ''
        Caption = ' Employment Info '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ExplicitWidth = 459
        ExplicitHeight = 92
        object Label17: TUniLabel
          Left = 8
          Top = 43
          Width = 55
          Height = 13
          Hint = ''
          Caption = 'Date Hired:'
          TabOrder = 7
        end
        object Label100: TUniLabel
          Left = 269
          Top = 43
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Date Terminated:'
          TabOrder = 8
        end
        object Label101: TUniLabel
          Left = 269
          Top = 19
          Width = 63
          Height = 13
          Hint = ''
          Caption = 'Status Code:'
          TabOrder = 9
        end
        object Label20: TUniLabel
          Left = 8
          Top = 19
          Width = 65
          Height = 13
          Hint = ''
          Caption = 'Charge Rate:'
          TabOrder = 10
        end
        object Label21: TUniLabel
          Left = 8
          Top = 67
          Width = 84
          Height = 13
          Hint = ''
          Caption = 'Last review date:'
          TabOrder = 11
        end
        object Label102: TUniLabel
          Left = 269
          Top = 67
          Width = 87
          Height = 13
          Hint = ''
          Caption = 'Next review date:'
          TabOrder = 12
        end
        object editHired: TUniDBEdit
          Left = 93
          Top = 39
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'DATE_HIRED'
          DataSource = SrcEmp
          MaxLength = 10
          TabOrder = 2
        end
        object editTerm: TUniDBEdit
          Left = 369
          Top = 39
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'TERMINATION_DATE'
          DataSource = SrcEmp
          MaxLength = 10
          TabOrder = 3
        end
        object editStatus: TUniDBEdit
          Left = 369
          Top = 15
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'STATUS_CODE'
          DataSource = SrcEmp
          TabOrder = 1
        end
        object editCharge: TUniDBEdit
          Left = 93
          Top = 15
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'CHARGE_RATE'
          DataSource = SrcEmp
          TabOrder = 0
        end
        object editLast: TUniDBEdit
          Left = 93
          Top = 63
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'LAST_REVIEW_DATE'
          DataSource = SrcEmp
          MaxLength = 10
          TabOrder = 4
        end
        object editNext: TUniDBEdit
          Left = 369
          Top = 63
          Width = 70
          Height = 21
          Hint = ''
          DataField = 'NEXT_REVIEW_DATE'
          DataSource = SrcEmp
          MaxLength = 10
          TabOrder = 5
        end
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 298
    Top = 9
    object File1: TUniMenuItem
      Caption = '&File'
      object New1: TUniMenuItem
        Caption = '&New'
        HelpContext = 25
        OnClick = New1Click
      end
      object Delete1: TUniMenuItem
        Caption = '&Delete'
        OnClick = Delete1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Search1: TUniMenuItem
        Caption = '&Search'
        HelpContext = 2
        OnClick = sbtnSearchClick
      end
      object N7: TUniMenuItem
        Caption = '-'
      end
      object ToggleFormTable1: TUniMenuItem
        Caption = '&Form/Table View'
        HelpContext = 105
        OnClick = sbtnTableFormClick
      end
      object N6: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        HelpContext = 81
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
        Caption = 'Contents...'
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object About1: TUniMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object SrcEmp: TDataSource
    DataSet = TblEmp
    Left = 348
    Top = 49
  end
  object TblEmp: TFDQuery
    BeforePost = TblEmpBeforePost
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select  id,'
      '         empno,'
      #9' first_name,'
      #9' middle_name,'
      #9' last_name,'
      #9' ssnmbr,'
      #9' addr1,'
      #9' addr2,'
      #9' state,'
      #9' country,'
      #9' zip,'
      #9' phone_number,'
      #9' city,'
      #9' charge_rate,'
      #9' status_code,'
      #9' date_hired,'
      #9' termination_date,'
      #9' last_review_date,'
      #9' next_review_date'
      'from pr_emp')
    Left = 408
    Top = 8
    object TblEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object TblEmpEMPNO: TStringField
      FieldName = 'EMPNO'
      Size = 10
    end
    object TblEmpFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object TblEmpMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object TblEmpLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object TblEmpSSNMBR: TStringField
      FieldName = 'SSNMBR'
      Size = 11
    end
    object TblEmpADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 30
    end
    object TblEmpADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 30
    end
    object TblEmpSTATE: TStringField
      FieldName = 'STATE'
      Size = 2
    end
    object TblEmpCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object TblEmpZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblEmpPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      EditMask = '!999-000-0000;1; '
      Size = 25
    end
    object TblEmpCITY: TStringField
      FieldName = 'CITY'
      Size = 30
    end
    object TblEmpSTATUS_CODE: TStringField
      FieldName = 'STATUS_CODE'
      Size = 10
    end
    object TblEmpDATE_HIRED: TDateTimeField
      FieldName = 'DATE_HIRED'
      EditMask = '!99/99/0000;1; '
    end
    object TblEmpTERMINATION_DATE: TDateTimeField
      FieldName = 'TERMINATION_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblEmpLAST_REVIEW_DATE: TDateTimeField
      FieldName = 'LAST_REVIEW_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblEmpNEXT_REVIEW_DATE: TDateTimeField
      FieldName = 'NEXT_REVIEW_DATE'
      EditMask = '!99/99/0000;1; '
    end
    object TblEmpCHARGE_RATE: TBCDField
      FieldName = 'CHARGE_RATE'
      Origin = 'CHARGE_RATE'
      Precision = 12
      Size = 2
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'IQWeb / Employees'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 64
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmEmployee'
    WebUse = False
    TouchScreen = False
    Left = 104
  end
  object PkEmp: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id,'
      '       empno,'
      '       first_name,'
      '       middle_name,'
      '       last_name,'
      '       ssnmbr,'
      '       addr1,'
      '       addr2,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       city,'
      '       charge_rate,'
      '       status_code,'
      '       date_hired,'
      '       termination_date,'
      '       last_review_date,'
      '       next_review_date'
      ' from pr_emp')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcEmp
    ForceShowWaitForPrompt = False
    Left = 348
    Top = 1
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 10
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Origin = 'PR_EMP.MIDDLE_NAME'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
    object PkEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      FieldName = 'SSNMBR'
      Origin = 'PR_EMP.SSNMBR'
      Size = 11
    end
    object PkEmpADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Origin = 'PR_EMP.ADDR1'
      Size = 30
    end
    object PkEmpADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Origin = 'PR_EMP.ADDR2'
      Size = 30
    end
    object PkEmpSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'PR_EMP.STATE'
      Size = 2
    end
    object PkEmpCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Origin = 'PR_EMP.COUNTRY'
      Size = 30
    end
    object PkEmpZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'PR_EMP.ZIP'
      Size = 10
    end
    object PkEmpPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      FieldName = 'PHONE_NUMBER'
      Origin = 'PR_EMP.PHONE_NUMBER'
      Size = 25
    end
    object PkEmpCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'PR_EMP.CITY'
      Size = 30
    end
    object PkEmpSTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      FieldName = 'STATUS_CODE'
      Origin = 'PR_EMP.STATUS_CODE'
      Size = 10
    end
    object PkEmpDATE_HIRED: TDateTimeField
      DisplayLabel = 'Date Hired'
      FieldName = 'DATE_HIRED'
      Origin = 'PR_EMP.DATE_HIRED'
    end
    object PkEmpTERMINATION_DATE: TDateTimeField
      DisplayLabel = 'Date Terminated'
      FieldName = 'TERMINATION_DATE'
      Origin = 'PR_EMP.TERMINATION_DATE'
    end
    object PkEmpLAST_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Last review date'
      FieldName = 'LAST_REVIEW_DATE'
      Origin = 'PR_EMP.LAST_REVIEW_DATE'
    end
    object PkEmpNEXT_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Next review date'
      FieldName = 'NEXT_REVIEW_DATE'
      Origin = 'PR_EMP.NEXT_REVIEW_DATE'
    end
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object PkEmpCHARGE_RATE: TBCDField
      FieldName = 'CHARGE_RATE'
      Precision = 12
      Size = 2
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'navEmp'
      'sbtnSearch'
      'editSSN'
      'editCharge'
      'editHired'
      'editLast'
      'editStatus'
      'editTerm'
      'editNext'
      'gridEmp'
      'New1'
      'Delete1'
      'Print1'
      'Search1')
    SecurityCode = 'FRMEMPLOYEE'
    Left = 192
  end
end
