object FrmInboundOptions: TFrmInboundOptions
  Left = 80
  Top = 185
  ClientHeight = 361
  ClientWidth = 484
  Caption = 'Inbound Transaction Options'
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 320
    Hint = ''
    ActivePage = TabGeneral
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitHeight = 321
    object TabGeneral: TUniTabSheet
      Hint = ''
      Caption = 'General'
      object Panel3: TUniPanel
        Left = 200
        Top = 0
        Width = 276
        Height = 292
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitHeight = 293
        object Panel6: TUniPanel
          Left = 1
          Top = 1
          Width = 10
          Height = 290
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
        end
        object Panel7: TUniPanel
          Left = 10
          Top = 1
          Width = 266
          Height = 290
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object GroupBox2: TUniGroupBox
            Left = 1
            Top = 1
            Width = 264
            Height = 120
            Hint = ''
            Caption = ' Sales Order Miscellaneous '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            object cbUpd: TUniDBCheckBox
              Left = 11
              Top = 16
              Width = 117
              Height = 17
              Hint = 'Overwrite Unit Price on sales orders with price in EDI Orders.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'UPDATE_UNIT_PRICE'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Update Price'
              TabOrder = 0
            end
            object sbSing: TUniDBCheckBox
              Left = 11
              Top = 36
              Width = 117
              Height = 17
              Hint = 
                'Keep all line items with the same PO number and Ship To on a sin' +
                'gle sales order.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'GROUPBYPO'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Single Order per PO'
              TabOrder = 1
            end
            object cbBlank: TUniDBCheckBox
              Left = 11
              Top = 57
              Width = 142
              Height = 17
              Hint = 
                'Update the blanket quantity on the sales order to be the sum of ' +
                'all the releases.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'UPD_BLANKET_QTY'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Update Blanket Quantity'
              TabOrder = 2
            end
            object cbNotes: TUniDBCheckBox
              Left = 11
              Top = 78
              Width = 117
              Height = 17
              Hint = 
                'Notes associated with line items in EDI Orders will be carried o' +
                'ver to sales order -> line item detail '#39'Comments'#39' field.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'PROCESS_NOTES'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Process Notes'
              TabOrder = 3
            end
            object DBDockId: TUniDBCheckBox
              Left = 11
              Top = 99
              Width = 174
              Height = 17
              Hint = 'Use Dock ID in Order Matching'
              ShowHint = True
              ParentShowHint = False
              DataField = 'MATCH_BY_DOCKID'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Use Dock ID in Order Matching'
              TabOrder = 4
            end
          end
          object Panel8: TUniPanel
            Left = 1
            Top = 120
            Width = 264
            Height = 10
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Caption = ''
          end
          object GroupBox3: TUniGroupBox
            Left = 1
            Top = 130
            Width = 264
            Height = 59
            Hint = ''
            Caption = ' Forecast '
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            object Label3: TUniLabel
              Left = 9
              Top = 33
              Width = 110
              Height = 13
              Hint = ''
              Caption = 'Forecast Header Name'
              TabOrder = 3
            end
            object cbFore: TUniDBCheckBox
              Left = 10
              Top = 11
              Width = 175
              Height = 17
              Hint = 'Direct EDI Orders transaction data to the Forecast Module.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'FORECAST'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Forecast Module'
              TabOrder = 0
            end
            object wwDBForeHead: TUniEdit
              Left = 142
              Top = 30
              Width = 119
              Height = 21
              Hint = ''
              Text = ''
              TabOrder = 1
            end
          end
          object Panel9: TUniPanel
            Left = 1
            Top = 189
            Width = 264
            Height = 10
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            Caption = ''
          end
          object GroupBox4: TUniGroupBox
            Left = 1
            Top = 199
            Width = 264
            Height = 91
            Hint = ''
            Caption = ' Miscellaneous '
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 4
            ExplicitHeight = 94
            object cbAuto: TUniDBCheckBox
              Left = 8
              Top = 17
              Width = 194
              Height = 17
              Hint = 
                'Enable transaction to automatically convert when processing via ' +
                'EServer.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'AUTO_CONVERT'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Auto Convert'
              TabOrder = 0
            end
            object cbCrea: TUniDBCheckBox
              Left = 8
              Top = 38
              Width = 194
              Height = 17
              Hint = 'Automatically create outbound 997 when processing via EServer.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'FUNC_ACKN'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Create Functional Acknowledgement'
              TabOrder = 1
            end
            object cbPrint: TUniDBCheckBox
              Left = 8
              Top = 60
              Width = 194
              Height = 17
              Hint = 
                'Enable feature to view raw transaction data in EDI Orders screen' +
                '.'
              ShowHint = True
              ParentShowHint = False
              DataField = 'PRINT_TO_FILE'
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Print to File'
              TabOrder = 2
            end
          end
        end
      end
      object Panel4: TUniPanel
        Left = 0
        Top = 0
        Width = 200
        Height = 292
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitHeight = 293
        object Panel5: TUniPanel
          Left = 1
          Top = 1
          Width = 198
          Height = 41
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object cbProcess: TUniDBCheckBox
            Left = 16
            Top = 16
            Width = 97
            Height = 17
            Hint = 
              'Enable data to process and/or convert into live tables in Enterp' +
              'riseIQ.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'PROCESS_INBOUND'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Process'
            TabOrder = 0
            OnClick = cbProcessClick
          end
        end
        object GroupBox1: TUniGroupBox
          Left = 1
          Top = 41
          Width = 198
          Height = 251
          Hint = ''
          Caption = ' Sales Order Releases '
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object Label1: TUniLabel
            Left = 16
            Top = 154
            Width = 61
            Height = 13
            Hint = ''
            ParentShowHint = False
            Caption = 'Days Setting'
            TabOrder = 10
          end
          object cbSync: TUniDBCheckBox
            Left = 16
            Top = 20
            Width = 153
            Height = 17
            Hint = 
              'Synchronizes sales order release schedule according to the custo' +
              'mer cum quantity in the EDI Order.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'SYNC_SHP'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Sync Cust  SHP'
            TabOrder = 0
          end
          object cbNext: TUniDBCheckBox
            Left = 16
            Top = 94
            Width = 153
            Height = 17
            Hint = 
              'Rounds release quantities up to the next "Multiples Of" value as' +
              'signed to the inventory item.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'LMULTIPLE'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Next Full Box'
            TabOrder = 4
          end
          object cbInc: TUniDBCheckBox
            Left = 16
            Top = 57
            Width = 153
            Height = 17
            Hint = 
              'Rounds release quantities up or down to be in increments of the ' +
              '"Multiples Of" values assigned to the inventory item.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'LINCREMENTS'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Incremental'
            TabOrder = 2
          end
          object cbClear: TUniDBCheckBox
            Left = 16
            Top = 38
            Width = 153
            Height = 17
            Hint = 
              'Removes all shipped and unshipped releases on sales order based ' +
              'on transaction type.  Used in conjunction with Sync. Customer SH' +
              'P to create cumulative adjustment release.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'CLEAR_RELEASES'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Clear Releases'
            TabOrder = 1
          end
          object cbMerge: TUniDBCheckBox
            Left = 16
            Top = 112
            Width = 153
            Height = 17
            Hint = 
              'Merges prior releases back on to the sales order after entering ' +
              'the new release schedule.  Firm release will consume the Forecas' +
              'ts for the same week, replacing or reducing their quantity.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'MRG_FCST'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Merge Firm/Forecasts'
            TabOrder = 5
          end
          object cbFam: TUniDBCheckBox
            Left = 16
            Top = 199
            Width = 153
            Height = 17
            Hint = 
              'Allow multiple releases with the same RAN (Batch No or Job Seq. ' +
              'must be unique).  Used for Honda '#39'Family Batch Orders'#39'.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'FAMILY_BATCH_ORDERS'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Family Batch Orders'
            TabOrder = 8
          end
          object cbAdj: TUniDBCheckBox
            Left = 16
            Top = 75
            Width = 153
            Height = 17
            Hint = 
              'Adjusts the quantity of a partially shipped release to equal the' +
              ' quantity shipped.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'ADJ_PARTIAL_REL'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Adjust Partial Releases'
            TabOrder = 3
          end
          object dbDel: TUniDBCheckBox
            Left = 16
            Top = 131
            Width = 153
            Height = 17
            Hint = 'Deletes releases that are Forecast and with the days setting.'
            ShowHint = True
            ParentShowHint = False
            DataField = 'DELETE_UNUSED_FORECASTS'
            ValueChecked = 'Y'
            ValueUnchecked = 'N'
            Caption = 'Delete Unused Forecasts'
            TabOrder = 6
          end
          object dbFore: TUniDBEdit
            Left = 104
            Top = 151
            Width = 46
            Height = 21
            Hint = 
              'Used in conjunction with "Delete Unused Forecasts" option.  Set ' +
              'the number of days from the system date to remove forecast relea' +
              'ses'
            ShowHint = True
            ParentShowHint = False
            DataField = 'UNUSED_FORECASTS_DAYS'
            TabOrder = 7
          end
        end
      end
    end
    object TabLeg: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Legacy'
      object Label4: TUniLabel
        Left = 19
        Top = 120
        Width = 367
        Height = 13
        Hint = ''
        Caption = 
          'Note: Please contact IQMS prior to implementing these seldom-use' +
          'd options.'
        TabOrder = 4
      end
      object DBCheckBox1: TUniDBCheckBox
        Left = 19
        Top = 16
        Width = 117
        Height = 17
        Hint = 
          'Calculates cumulative quantities although trading partner does n' +
          'ot send the cumulative flag'
        ShowHint = True
        ParentShowHint = False
        DataField = 'LCUMULATIVE'
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Cumulative'
        TabOrder = 0
      end
      object DBCheckBox2: TUniDBCheckBox
        Left = 19
        Top = 39
        Width = 117
        Height = 17
        Hint = 'Parses only FST releases with Weekly (W) timing qualifiers'
        ShowHint = True
        ParentShowHint = False
        DataField = 'LWEEKLYS'
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'FST Weekly Only'
        TabOrder = 1
      end
      object DBCheckBox3: TUniDBCheckBox
        Left = 19
        Top = 62
        Width = 117
        Height = 17
        Hint = 'Parses only firm releases (forecast qualifier = C)'
        ShowHint = True
        ParentShowHint = False
        DataField = 'LNOFORECAST'
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Firm Deliveries-Only'
        TabOrder = 2
      end
      object DBCheckBox4: TUniDBCheckBox
        Left = 19
        Top = 85
        Width = 150
        Height = 17
        Hint = 
          'Prints a hard-coded report for inbound Functional Acknowledgemen' +
          'ts'
        ShowHint = True
        ParentShowHint = False
        DataField = 'PRINTACK'
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
        Caption = 'Print Acknowlegement'
        TabOrder = 3
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 320
    Width = 484
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 274
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 352
    Top = 200
    object ClearForecastHeaderName1: TUniMenuItem
      Caption = 'Clear Forecast Header Name'
      OnClick = ClearForecastHeaderName1Click
    end
  end
end
