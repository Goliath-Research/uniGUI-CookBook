inherited FrmCRMQuoteAddCustomer: TFrmCRMQuoteAddCustomer
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 446
    Height = 37
    ExplicitTop = 446
    ExplicitHeight = 37
    inherited Panel2: TUniPanel
      Height = 35
    end
  end
  inherited PageControl1: TUniPageControl
    Height = 446
    ExplicitWidth = 444
    ExplicitHeight = 454
    inherited TabSheet1: TUniTabSheet
      ExplicitHeight = 418
      inherited ScrollBox1: TUniScrollBox
        Height = 418
        ExplicitWidth = 436
        ExplicitHeight = 426
        ScrollHeight = 411
        inherited PnlDisplay: TUniPanel
          Height = 411
          ExplicitHeight = 411
          inherited Splitter1: TUniSplitter
            Height = 409
            ExplicitHeight = 409
          end
          inherited PnlLeft: TUniPanel
            Height = 409
            ExplicitHeight = 409
          end
          inherited PnlClient: TUniPanel
            Height = 409
            ExplicitWidth = 319
            ExplicitHeight = 425
            inherited Panel3: TUniPanel
              Height = 407
              ExplicitHeight = 407
            end
            inherited PnlEditBoxes: TUniPanel
              Height = 407
              ExplicitHeight = 407
              inherited dbchkUSAmaskCustomer: TUniDBCheckBox
                Width = 156
                ExplicitWidth = 156
              end
              inherited dbeTelephone: TUniDBEdit
                Width = 145
                ExplicitWidth = 145
              end
              inherited dbeExt: TUniDBEdit
                Width = 97
                ExplicitWidth = 97
              end
              inherited dbeFax: TUniDBEdit
                Width = 145
                ExplicitWidth = 145
              end
              inherited dbePrimeContactEmail: TUniEdit
                Width = 271
                ExplicitWidth = 271
              end
            end
            object chkQuickCopy: TUniCheckBox
              Left = 0
              Top = 392
              Width = 317
              Height = 17
              Hint = ''
              Checked = True
              Caption = 'Create default "Bill To" and "Ship To" addresses'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  inherited Table1: TFDTable
    object Table1CRM_PROSPECT: TStringField
      FieldName = 'CRM_PROSPECT'
      FixedChar = True
      Size = 1
    end
    object Table1CUST_SINCE: TDateTimeField
      FieldName = 'CUST_SINCE'
      Origin = 'CUST_SINCE'
    end
    object Table1STATUS_DATE: TDateTimeField
      FieldName = 'STATUS_DATE'
      Origin = 'STATUS_DATE'
    end
  end
end
