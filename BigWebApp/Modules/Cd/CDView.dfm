inherited FrmCDView: TFrmCDView
  Left = 41
  Top = 161
  ClientHeight = 502
  ClientWidth = 760
  Caption = 'View Cash Disbursements'
  OnActivate = FormActivate
  OnCreate = FormCreate
  ExplicitWidth = 776
  ExplicitHeight = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited PC: TUniPageControl
    Width = 760
    Height = 475
    ExplicitWidth = 760
    ExplicitHeight = 475
    inherited TabDoc: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 752
      ExplicitHeight = 447
      inherited PageControl3: TUniPageControl
        Width = 752
        Height = 447
        ExplicitWidth = 752
        ExplicitHeight = 447
        inherited TabSheet6: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 744
          ExplicitHeight = 419
        end
        inherited TabSheet7: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 744
          ExplicitHeight = 419
        end
      end
    end
    inherited TabMain: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 752
      ExplicitHeight = 447
      inherited Panel2: TUniPanel
        Top = 420
        Width = 752
        ExplicitTop = 420
        ExplicitWidth = 752
      end
      inherited Panel3: TUniPanel
        Width = 752
        Height = 420
        ExplicitWidth = 752
        ExplicitHeight = 438
        inherited Splitter1: TUniSplitter
          Top = 163
          Width = 752
          ExplicitTop = 163
          ExplicitWidth = 752
        end
        inherited GridDetail: TUniDBGrid
          Top = 166
          Width = 750
          Height = 254
          Columns = <
            item
              FieldName = 'INVOICE_NO'
              Title.Caption = 'Invoice#'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AMOUNT_PAID'
              Title.Caption = 'Amount'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AP_DISCOUNT_TAKEN'
              Title.Caption = 'Discount'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DISC_ACCOUNT'
              Title.Caption = 'G/L Acct. Disc.'
              Width = 121
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MISC_ACCOUNT'
              Title.Caption = 'G/L Acct. Misc.'
              Width = 304
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INVOICE_DATE'
              Title.Caption = 'Invoice Date'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DISC_ACCOUNT_DESC'
              Title.Caption = 'Disc G/L Acct Description'
              Width = 304
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MISC_ACCOUNT_DESC'
              Title.Caption = 'Misc G/L Account Description'
              Width = 304
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        inherited PageControl1: TUniPageControl
          Width = 750
          Height = 163
          ExplicitWidth = 750
          ExplicitHeight = 163
          inherited TabGrid: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 742
            ExplicitHeight = 135
            inherited GridHeader: TUniDBGrid
              Width = 742
              Height = 135
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgMultiSelect, dgTabs, dgCancelOnExit]
              OnDblClick = DBcommentDblClick
              Columns = <
                item
                  FieldName = 'PAYEE'
                  Title.Caption = 'Payee'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CHECK_NO'
                  Title.Caption = 'Check#'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'AMOUNT'
                  Title.Caption = 'Amount'
                  Width = 56
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CHECK_DATE'
                  Title.Caption = 'Check Date'
                  Width = 112
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CHECK_STATUS'
                  Title.Caption = 'Status'
                  Width = 90
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ADDR1'
                  Title.Caption = 'Address1'
                  Width = 364
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ADDR2'
                  Title.Caption = 'Address2'
                  Width = 364
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'MISC_CITYSTATEZIP'
                  Title.Caption = 'City/State/Postal Code'
                  Width = 376
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'VOID_REASON'
                  Title.Caption = 'Reason if VOID'
                  Width = 304
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'START_DATE'
                  Title.Caption = 'Period Start Date'
                  Width = 112
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'END_DATE'
                  Title.Caption = 'Period End Date'
                  Width = 112
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'ACCT'
                  Title.Caption = 'G/L Acct. Cash'
                  Width = 266
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'PERIOD'
                  Title.Caption = 'Period'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'BATCHNUMBER'
                  Title.Caption = 'Batch#'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'VOID_BATCHNUMBER'
                  Title.Caption = 'Void Batch#'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'COMMENT1'
                  Title.Caption = 'Comment'
                  Width = 1534
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
          end
          inherited TabForm: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 6
            ExplicitWidth = 744
            ExplicitHeight = 153
            object Splitter2: TUniSplitter
              Left = 598
              Top = 0
              Width = 6
              Height = 135
              Hint = ''
              Align = alRight
              ParentColor = False
              Color = clBtnFace
            end
            object Panel4: TUniPanel
              Left = 604
              Top = 0
              Width = 138
              Height = 135
              Hint = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              object GroupBox1: TUniGroupBox
                Left = 1
                Top = 1
                Width = 136
                Height = 133
                Hint = ''
                Caption = ' Address '
                Align = alClient
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
                ExplicitHeight = 151
                object Memo1: TUniMemo
                  Left = 2
                  Top = 15
                  Width = 132
                  Height = 116
                  Hint = ''
                  Lines.Strings = (
                    '')
                  Align = alClient
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clBtnFace
                  TabOrder = 0
                end
              end
            end
            object Panel5: TUniPanel
              Left = 0
              Top = 0
              Width = 598
              Height = 135
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                598
                135)
              object Label1: TUniLabel
                Left = 4
                Top = 7
                Width = 37
                Height = 13
                Hint = ''
                Caption = 'Check#'
                TabOrder = 18
              end
              object Label2: TUniLabel
                Left = 159
                Top = 7
                Width = 27
                Height = 13
                Hint = ''
                Caption = 'Date:'
                TabOrder = 19
              end
              object Label3: TUniLabel
                Left = 274
                Top = 6
                Width = 91
                Height = 13
                Hint = ''
                Caption = 'Inv. Total Amount:'
                TabOrder = 20
              end
              object Label4: TUniLabel
                Left = 274
                Top = 42
                Width = 45
                Height = 13
                Hint = ''
                Caption = 'Discount:'
                TabOrder = 21
              end
              object Label5: TUniLabel
                Left = 4
                Top = 61
                Width = 34
                Height = 13
                Hint = ''
                Caption = 'Payee:'
                TabOrder = 22
              end
              object Label6: TUniLabel
                Left = 4
                Top = 97
                Width = 44
                Height = 13
                Hint = ''
                Caption = 'G/L Acct:'
                TabOrder = 23
              end
              object Label7: TUniLabel
                Left = 4
                Top = 79
                Width = 35
                Height = 13
                Hint = ''
                Caption = 'Status:'
                TabOrder = 24
              end
              object Label8: TUniLabel
                Left = 274
                Top = 114
                Width = 60
                Height = 13
                Hint = ''
                Caption = 'Check Type:'
                TabOrder = 25
              end
              object Label9: TUniLabel
                Left = 274
                Top = 78
                Width = 34
                Height = 13
                Hint = ''
                Caption = 'Period:'
                TabOrder = 26
              end
              object lblEPlant: TUniLabel
                Left = 4
                Top = 115
                Width = 34
                Height = 13
                Hint = ''
                Caption = 'EPlant:'
                TabOrder = 27
              end
              object Label112: TUniLabel
                Left = 159
                Top = 115
                Width = 35
                Height = 13
                Hint = ''
                Caption = 'Batch#'
                TabOrder = 28
              end
              object Label10: TUniLabel
                Left = 274
                Top = 95
                Width = 58
                Height = 13
                Hint = ''
                Caption = 'Void Batch#'
                TabOrder = 29
              end
              object Label34: TUniLabel
                Left = 4
                Top = 136
                Width = 49
                Height = 13
                Hint = ''
                Caption = 'Comment:'
                TabOrder = 30
              end
              object Label11: TUniLabel
                Left = 274
                Top = 60
                Width = 57
                Height = 13
                Hint = ''
                Caption = 'Void Period:'
                TabOrder = 31
              end
              object Label12: TUniLabel
                Left = 4
                Top = 43
                Width = 43
                Height = 13
                Hint = ''
                Caption = 'Check ID'
                TabOrder = 32
              end
              object Label13: TUniLabel
                Left = 160
                Top = 43
                Width = 18
                Height = 13
                Hint = ''
                Caption = 'EFT'
                TabOrder = 33
              end
              object Label14: TUniLabel
                Left = 274
                Top = 25
                Width = 73
                Height = 13
                Hint = ''
                Caption = 'Check Amount:'
                TabOrder = 34
              end
              object DBCheckDate: TUniDBEdit
                Left = 197
                Top = 4
                Width = 74
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'CHECK_DATE'
                DataSource = SrcQryHeader
                TabOrder = 0
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBCheckNo: TUniDBEdit
                Left = 56
                Top = 4
                Width = 99
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'CHECK_NO'
                DataSource = SrcQryHeader
                TabOrder = 1
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBCheckStatus: TUniDBEdit
                Left = 56
                Top = 76
                Width = 215
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'CHECK_STATUS'
                DataSource = SrcQryHeader
                TabOrder = 2
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBGlAcct: TUniDBEdit
                Left = 56
                Top = 94
                Width = 215
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'ACCT'
                DataSource = SrcQryHeader
                TabOrder = 3
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBPeriod: TUniDBEdit
                Left = 342
                Top = 76
                Width = 257
                Height = 19
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'PERIOD'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 4
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBCheckType: TUniDBEdit
                Left = 342
                Top = 112
                Width = 257
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'CHECK_TYPE'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 5
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBPayee: TUniDBEdit
                Left = 56
                Top = 58
                Width = 215
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'PAYEE'
                DataSource = SrcQryHeader
                TabOrder = 6
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBDisc: TUniDBEdit
                Left = 342
                Top = 40
                Width = 257
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'DISCOUNT'
                DataSource = SrcTotals
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 7
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object dbePlant: TUniDBEdit
                Left = 56
                Top = 112
                Width = 99
                Height = 19
                Hint = ''
                DataField = 'EPlant_Name'
                DataSource = SrcQryHeader
                TabOrder = 8
                TabStop = False
                Color = clBtnFace
              end
              object DBEdit1: TUniDBEdit
                Left = 376
                Top = 4
                Width = 223
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'AMOUNT'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 9
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBBatch: TUniDBEdit
                Left = 197
                Top = 112
                Width = 74
                Height = 19
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'BATCHNUMBER'
                DataSource = SrcQryHeader
                TabOrder = 10
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit2: TUniDBEdit
                Left = 342
                Top = 94
                Width = 257
                Height = 19
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'VOID_BATCHNUMBER'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 11
                Color = clBtnFace
                ReadOnly = True
              end
              object DBcomment: TUniDBEdit
                Left = 56
                Top = 133
                Width = 543
                Height = 19
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'COMMENT1'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 12
                Color = clBtnFace
                ReadOnly = True
                OnDblClick = DBcommentDblClick
              end
              object DBEdit3: TUniDBEdit
                Left = 342
                Top = 58
                Width = 257
                Height = 19
                Cursor = crArrow
                Hint = ''
                ShowHint = True
                ParentShowHint = False
                DataField = 'VOID_PERIOD'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 13
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit4: TUniDBEdit
                Left = 56
                Top = 40
                Width = 99
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'ID'
                DataSource = SrcQryHeader
                TabOrder = 14
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit5: TUniDBEdit
                Left = 196
                Top = 40
                Width = 75
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'EFT'
                DataSource = SrcQryHeader
                TabOrder = 15
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
              object DBEdit6: TUniDBEdit
                Left = 376
                Top = 22
                Width = 223
                Height = 19
                Cursor = crArrow
                Hint = ''
                DataField = 'BANK_AMOUNT'
                DataSource = SrcQryHeader
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 16
                TabStop = False
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 760
    ExplicitWidth = 760
    inherited SBCustomer: TUniSpeedButton
      Hint = 'Cash Disbursements by Vendor'
    end
    inherited SBPeriod: TUniSpeedButton
      Hint = 'Cash Disbursements by Period'
    end
    inherited SBAll: TUniSpeedButton
      Hint = 'All Cash Disbursements'
    end
    inherited SBOriginal: TUniSpeedButton
      Hint = 'Original Cash Disbursement'
    end
    inherited NavHeader: TUniDBNavigator
      Left = 660
      ExplicitLeft = 660
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 416
    inherited File1: TUniMenuItem
      inherited All1: TUniMenuItem
        Caption = '&All Cash Disbursements'
      end
      inherited ByCustomer1: TUniMenuItem
        Caption = 'Cash Disbursements by &Vendor'
      end
      inherited ByPeriod1: TUniMenuItem
        Caption = 'Cash Disbursements by &Period'
      end
      inherited Original1: TUniMenuItem
        Caption = '&Original Cash Disbursement'
      end
      object CreateEDIFile8201: TUniMenuItem [5]
        Caption = 'Create EDI File (&820)'
        OnClick = CreateEDIFile8201Click
      end
      object N4: TUniMenuItem [6]
        Caption = '-'
      end
      object VoidCheck1: TUniMenuItem [7]
        Caption = '&Void Check'
        OnClick = VoidCheck1Click
      end
      object N3: TUniMenuItem [8]
        Caption = '-'
      end
    end
    inherited Help1: TUniMenuItem
      object Contents1: TUniMenuItem [0]
        Caption = '&Contents'
        OnClick = Contents1Click
      end
    end
  end
  inherited PrinterSetupDialog1: TPrinterSetupDialog
    Left = 320
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'Cash Disbursements view'
    Left = 384
  end
  inherited QryDetail: TFDQuery
    MasterFields = 'ID'
    SQL.Strings = (
      'select i.id,'
      '       i.amount_paid,'
      '       i.apinvoice_id,'
      '       i.ap_discount_taken,'
      '       a.invoice_no,'
      '       a.invoice_date,'
      '       g1.acct as Disc_account,'
      '       g2.acct as Misc_Account,'
      '       g1.descrip as Disc_account_desc,'
      '       g2.descrip as Misc_Account_desc,'
      '       a.glacct_id_ap'
      '  from cheque_detail i,'
      '       apinvoice a,'
      '       glacct g1,'
      '       glacct g2'
      ' where i.apinvoice_id = a.id(+)                       '
      '   and i.glacct_id_ap_disc = g1.id(+)'
      '   and glacct_id_misc_expense = g2.id(+)           '
      '   and i.cheque_id = :ID'
      ' ')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDetailAMOUNT_PAID: TBCDField
      FieldName = 'AMOUNT_PAID'
      currency = True
      Size = 2
    end
    object QryDetailAPINVOICE_ID: TBCDField
      FieldName = 'APINVOICE_ID'
      Size = 0
    end
    object QryDetailAP_DISCOUNT_TAKEN: TBCDField
      FieldName = 'AP_DISCOUNT_TAKEN'
      currency = True
      Size = 2
    end
    object QryDetailINVOICE_NO: TStringField
      FieldName = 'INVOICE_NO'
      Size = 50
    end
    object QryDetailDISC_ACCOUNT: TStringField
      FieldName = 'DISC_ACCOUNT'
      Size = 50
    end
    object QryDetailMISC_ACCOUNT: TStringField
      FieldName = 'MISC_ACCOUNT'
      Size = 50
    end
    object QryDetailGLACCT_ID_AP: TBCDField
      FieldName = 'GLACCT_ID_AP'
      Size = 0
    end
    object QryDetailID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryDetailINVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object QryDetailDISC_ACCOUNT_DESC: TStringField
      FieldName = 'DISC_ACCOUNT_DESC'
      Size = 50
    end
    object QryDetailMISC_ACCOUNT_DESC: TStringField
      FieldName = 'MISC_ACCOUNT_DESC'
      Size = 50
    end
  end
  inherited SrcQryHeader: TDataSource
    OnDataChange = SrcQryHeaderDataChange
    Top = 203
  end
  inherited QryHeader: TFDQuery
    Tag = 1
    BeforeOpen = QryHeaderBeforeOpen
    AfterScroll = QryHeaderAfterScroll
    OnCalcFields = QryHeaderCalcFields
    SQL.Strings = (
      'select p.id,'
      '       v.id as vendor_id,'
      '       p.check_no,'
      '       p.check_date,'
      '       p.check_status,'
      '       p.glacct_id_fx,'
      '       p.eplant_id,'
      '       p.bank_amount,'
      '       p.exchange_rate as exchange_rate,'
      '       p.glperiods_id_cd         as glperiods_id_cd,'
      
        '       decode(NVL(vendor_id, 0), 0, NVL(p.misc_payto, '#39' '#39'), p.ve' +
        'ndor_company) as Payee,'
      '       NVL(p.misc_payto, '#39' '#39') as MISC_PAYTO,'
      
        '       decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr1, '#39' '#39'), p.ve' +
        'ndor_addr1) as ADDR1,'
      
        '       decode(NVL(vendor_id, 0), 0, NVL(p.misc_addr2, '#39' '#39'), p.ve' +
        'ndor_addr2) as ADDR2,'
      
        '       decode(NVL(vendor_id, 0), 0, LTrim(RTrim(p.misc_city)) ||' +
        ' '#39' '#39
      '       || LTrim(RTrim(p.misc_state)) || '#39' '#39
      '       || LTrim(RTrim(p.misc_zip)),'
      '       LTrim(RTrim(p.vendor_city)) || '#39' '#39
      '       || LTrim(RTrim(p.vendor_state)) || '#39' '#39
      '       || LTrim(RTrim(p.vendor_zip))) as Misc_CityStateZip,'
      '       NVL(p.void_reason, '#39' '#39') as VOID_REASON,'
      '       p.check_type,'
      '       NVL(p.vendor_company, '#39' '#39') as VENDOR,'
      '       g.period,'
      '       g.start_date,'
      '       g.end_date,'
      '       p.glacct_acct as acct,'
      '       h.batchnumber,'
      '       hv.batchnumber as void_batchnumber,'
      '       gv.period as void_period,'
      
        '       NVL(f.glacct_id_suspense, f.glacct_id_cash) as glacct_id_' +
        'cash,'
      '       p.comment1'
      'from cheque p,'
      '     bankinfo_dtl f,'
      '     v_vendor v,'
      '     glperiods g,'
      '     glperiods gv,'
      '     glbatchid h,'
      '     glbatchid hv,'
      '     glacct l'
      'where p.vendor_id = v.id(+)'
      'and p.glperiods_id_cd = g.id(+)'
      'and p.bankinfo_dtl_id = f.id(+)'
      'and p.glbatchid_id = h.id(+)'
      'and p.void_glbatchid_id = hv.id(+)'
      'and hv.glperiods_id = gv.id(+)'
      'and f.glacct_id_cash = l.id'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Top = 208
    object QryHeaderID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryHeaderCHECK_NO: TBCDField
      Tag = 1
      DisplayLabel = 'Check#'
      FieldName = 'CHECK_NO'
      Size = 0
    end
    object QryHeaderPAYEE: TStringField
      DisplayLabel = 'Payee'
      FieldName = 'PAYEE'
      Size = 60
    end
    object QryHeaderCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      FieldName = 'CHECK_DATE'
    end
    object QryHeaderCHECK_STATUS: TStringField
      DisplayLabel = 'Check Status'
      FieldName = 'CHECK_STATUS'
      Size = 15
    end
    object QryHeaderMISC_PAYTO: TStringField
      FieldName = 'MISC_PAYTO'
      Visible = False
      Size = 50
    end
    object QryHeaderMISC_CITYSTATEZIP: TStringField
      FieldName = 'MISC_CITYSTATEZIP'
      Visible = False
      Size = 62
    end
    object QryHeaderVOID_REASON: TStringField
      DisplayLabel = 'Reason if VOID'
      FieldName = 'VOID_REASON'
      Size = 50
    end
    object QryHeaderCHECK_TYPE: TStringField
      DisplayLabel = 'Check Type'
      FieldName = 'CHECK_TYPE'
      Size = 15
    end
    object QryHeaderVENDOR: TStringField
      FieldName = 'VENDOR'
      Visible = False
      Size = 60
    end
    object QryHeaderPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Size = 0
    end
    object QryHeaderSTART_DATE: TDateTimeField
      DisplayLabel = 'Period Start Date'
      FieldName = 'START_DATE'
    end
    object QryHeaderEND_DATE: TDateTimeField
      DisplayLabel = 'Period End Date'
      FieldName = 'END_DATE'
    end
    object QryHeaderACCT: TStringField
      DisplayLabel = 'G/L Acct'
      FieldName = 'ACCT'
      Size = 50
    end
    object QryHeaderGLPERIODS_ID_CD: TBCDField
      FieldName = 'GLPERIODS_ID_CD'
      Visible = False
      Size = 0
    end
    object QryHeaderADDR1: TStringField
      FieldName = 'ADDR1'
      Size = 60
    end
    object QryHeaderADDR2: TStringField
      FieldName = 'ADDR2'
      Size = 60
    end
    object QryHeaderGLACCT_ID_CASH: TFMTBCDField
      FieldName = 'GLACCT_ID_CASH'
      Size = 38
    end
    object QryHeaderEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object QryHeaderEPlant_Name: TStringField
      FieldKind = fkLookup
      FieldName = 'EPlant_Name'
      LookupDataSet = QryEPlant
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EPLANT_ID'
      Lookup = True
    end
    object QryHeaderAMOUNT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'AMOUNT'
      currency = True
      Calculated = True
    end
    object QryHeaderEXCHANGE_RATE: TFMTBCDField
      FieldName = 'EXCHANGE_RATE'
      Size = 6
    end
    object QryHeaderBANK_AMOUNT: TBCDField
      FieldName = 'BANK_AMOUNT'
      Size = 2
    end
    object QryHeaderGLACCT_ID_FX: TBCDField
      FieldName = 'GLACCT_ID_FX'
      Size = 0
    end
    object QryHeaderBATCHNUMBER: TBCDField
      FieldName = 'BATCHNUMBER'
      Size = 0
    end
    object QryHeaderVOID_BATCHNUMBER: TBCDField
      FieldName = 'VOID_BATCHNUMBER'
      Size = 0
    end
    object QryHeaderCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Size = 255
    end
    object QryHeaderVOID_PERIOD: TBCDField
      FieldName = 'VOID_PERIOD'
      Size = 0
    end
    object QryHeaderEFT: TStringField
      FieldKind = fkCalculated
      FieldName = 'EFT'
      Calculated = True
    end
    object QryHeaderVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
  end
  inherited IQRepDef1: TIQWebRepDef
    App_ID = 'FrmCDView'
    Left = 352
  end
  object PkPeriods: TIQWebHpick
    BeforeOpen = PkCDCustomersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct i.glperiods_id_cd as glperiods_id_cd,'
      '                i.eplant_id as eplant_id,'
      '                p.period as period,'
      '                p.start_date as start_date,'
      '                p.end_date as end_date,'
      '                y.descrip as descrip'
      ' from  cheque i,'
      '       glperiods p,'
      '       glyear y'
      'where i.glperiods_id_cd = p.id (+)'
      '  and p.glyear_id = y.id              '
      
        '  and not exists (select 1 from pr_check_hist where cheque_id = ' +
        'i.id)'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 248
    Top = 192
    object PkPeriodsGLPERIODS_ID_CD: TBCDField
      FieldName = 'GLPERIODS_ID_CD'
      Visible = False
      Size = 0
    end
    object PkPeriodsPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Size = 0
    end
    object PkPeriodsSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      FieldName = 'START_DATE'
    end
    object PkPeriodsEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      FieldName = 'END_DATE'
    end
    object PkPeriodsDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 25
    end
    object PkPeriodsEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkCDCustomers: TIQWebHpick
    BeforeOpen = PkCDCustomersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct i.vendor_id as vendor_id,'
      '                i.eplant_id as eplant_id,'
      '                v.company as company,'
      '                v.addr1 as addr1,'
      '                v.addr2 as addr2,'
      '                v.city as city,'
      '                v.state as state,'
      '                v.zip as zip'
      '  from v_vendor v,'
      '       cheque i'
      ' where i.vendor_id = v.id'
      
        ' and not exists (select 1 from pr_check_hist where cheque_id = i' +
        '.id)'
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 200
    object PkCDCustomersVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkCDCustomersCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkCDCustomersADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkCDCustomersADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkCDCustomersCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkCDCustomersSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkCDCustomersZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkCDCustomersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'CHEQUE.EPLANT_ID'
      Size = 0
    end
  end
  object PkSearch: TIQWebHpick
    BeforeOpen = PkCDCustomersBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select i.id                      as id,'
      '       v.id                      as vendor_id,'
      '       i.check_no                as check_no,'
      '       i.check_date              as check_date,'
      '       i.check_status            as check_status,'
      '       i.eplant_id               as eplant_id,'
      
        '       decode(NVL(vendor_id, 0), 0, NVL(i.misc_payto, '#39' '#39'), v.co' +
        'mpany) as Payee,'
      '       NVL(i.misc_payto, '#39' '#39')    as MISC_PAYTO,'
      '       NVL(i.misc_addr1, '#39' '#39')    as MISC_ADDR1,'
      '       NVL(i.misc_addr2, '#39' '#39')    as MISC_ADDR2,'
      '       LTrim(RTrim(i.misc_city)) || '#39' '#39' ||'
      '       LTrim(RTrim(i.misc_state)) || '#39' '#39' ||'
      '       LTrim(RTrim(i.misc_zip)) as Misc_CityStateZip,'
      '       NVL(i.void_reason, '#39' '#39') as VOID_REASON,'
      '       i.check_type  as check_type ,'
      '       v.company     as VENDOR,'
      '       g.period      as period,'
      '       g.start_date  as start_date,'
      '       g.end_date    as end_date,'
      '       l.acct        as acct,'
      '       i.bank_amount as bank_amount,'
      '       decode(NVL(i.check_no, 0), 0, '#39'Y'#39', '#39'N'#39') as eft'
      '  from cheque i,'
      '       v_vendor v,'
      '       glperiods g,'
      '       glacct l,'
      '       bankinfo_dtl b'
      ' where i.vendor_id = v.id(+)'
      '   and i.glperiods_id_cd = g.id(+)'
      '   and b.glacct_id_cash = l.id(+)'
      '   and i.bankinfo_dtl_id = b.id(+)'
      
        '   and (i.vendor_id is null or (i.vendor_id is not null and exis' +
        'ts (select id from v_vendor where id = i.vendor_id)))   '
      
        '   and not exists (select 1 from pr_check_hist where cheque_id =' +
        ' i.id)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 280
    Top = 195
    object PkSearchID: TBCDField
      DisplayLabel = 'Check ID'
      FieldName = 'ID'
      Size = 0
    end
    object PkSearchCHECK_NO: TBCDField
      DisplayLabel = 'Check#'
      FieldName = 'CHECK_NO'
      Size = 0
    end
    object PkSearchCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      FieldName = 'CHECK_DATE'
    end
    object PkSearchCHECK_STATUS: TStringField
      DisplayLabel = 'Check Status'
      FieldName = 'CHECK_STATUS'
      Size = 15
    end
    object PkSearchPAYEE: TStringField
      DisplayLabel = 'Payee'
      FieldName = 'PAYEE'
      Size = 60
    end
    object PkSearchMISC_PAYTO: TStringField
      DisplayLabel = 'Misc. Payee'
      FieldName = 'MISC_PAYTO'
      Visible = False
      Size = 50
    end
    object PkSearchMISC_ADDR1: TStringField
      DisplayLabel = 'Misc. Address1'
      FieldName = 'MISC_ADDR1'
      Visible = False
      Size = 60
    end
    object PkSearchMISC_ADDR2: TStringField
      DisplayLabel = 'Misc. Address2'
      FieldName = 'MISC_ADDR2'
      Visible = False
      Size = 60
    end
    object PkSearchMISC_CITYSTATEZIP: TStringField
      DisplayLabel = 'Misc. City/State/Zip'
      FieldName = 'MISC_CITYSTATEZIP'
      Visible = False
      Size = 62
    end
    object PkSearchVOID_REASON: TStringField
      DisplayLabel = 'Reason if VOID'
      FieldName = 'VOID_REASON'
      Size = 50
    end
    object PkSearchCHECK_TYPE: TStringField
      DisplayLabel = 'Check Type'
      FieldName = 'CHECK_TYPE'
      Size = 15
    end
    object PkSearchVENDOR: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'VENDOR'
      Visible = False
      Size = 60
    end
    object PkSearchPERIOD: TBCDField
      DisplayLabel = 'Period'
      FieldName = 'PERIOD'
      Size = 0
    end
    object PkSearchSTART_DATE: TDateTimeField
      FieldName = 'START_DATE'
      Visible = False
    end
    object PkSearchEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
      Visible = False
    end
    object PkSearchACCT: TStringField
      DisplayLabel = 'G/L Acct Cash'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkSearchEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkSearchEFT: TStringField
      FieldName = 'EFT'
      Size = 1
    end
    object PkSearchVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
    object PkSearchBANK_AMOUNT: TBCDField
      DisplayLabel = 'Bank Amount'
      FieldName = 'BANK_AMOUNT'
      currency = True
      Size = 2
    end
  end
  object SrcTotals: TDataSource
    DataSet = QryTotals
    Left = 368
    Top = 203
  end
  object QryTotals: TFDQuery
    MasterSource = SrcQryHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select cheque_id,'
      '          NVL(sum(amount_paid), 0) as amount,'
      '          NVL(sum(ap_discount_taken), 0) as discount'
      'from cheque_detail'
      'where cheque_id = :ID'
      'group by cheque_id'
      ''
      '')
    Left = 384
    Top = 208
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTotalsCHEQUE_ID: TBCDField
      FieldName = 'CHEQUE_ID'
      Size = 0
    end
    object QryTotalsAMOUNT: TFMTBCDField
      FieldName = 'AMOUNT'
      currency = True
      Size = 38
    end
    object QryTotalsDISCOUNT: TFMTBCDField
      FieldName = 'DISCOUNT'
      currency = True
      Size = 38
    end
  end
  object PM: TUniPopupMenu
    Left = 224
    Top = 236
    object JumptoAP1: TUniMenuItem
      Caption = '&Jump to AP'
      OnClick = JumptoAP1Click
    end
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant'
      '')
    Left = 32
    Top = 232
  end
  object wwMemoDialog10: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 176
    Top = 203
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'VoidCheck1')
    SecurityCode = 'FRMCDVIEW'
    Left = 428
    Top = 209
  end
end
