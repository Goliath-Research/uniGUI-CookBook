object FrmUPSParam: TFrmUPSParam
  Left = 413
  Top = 179
  ClientHeight = 419
  ClientWidth = 451
  Caption = 'Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 389
    Width = 451
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      451
      30)
    object btnOK: TUniBitBtn
      Left = 246
      Top = 2
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TUniBitBtn
      Left = 350
      Top = 2
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 389
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 449
      Height = 387
      Hint = ''
      ActivePage = TabUPS
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabGeneral: TUniTabSheet
        Hint = ''
        ImageIndex = 2
        Caption = 'General'
        object lblHandling: TUniLabel
          Left = 8
          Top = 10
          Width = 118
          Height = 13
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          Caption = 'Handling fee percentage'
          TabOrder = 2
        end
        object Label5: TUniLabel
          Left = 8
          Top = 34
          Width = 79
          Height = 13
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          Caption = 'Handling flat fee'
          TabOrder = 3
        end
        object dbeHandling: TUniDBEdit
          Left = 176
          Top = 7
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'UPS_HANDLING'
          DataSource = SrcIQSYS
          TabOrder = 0
        end
        object wwDBEdit1: TUniDBEdit
          Left = 176
          Top = 31
          Width = 121
          Height = 21
          Hint = ''
          DataField = 'UPS_HANDLING_FLAT'
          DataSource = SrcIQSYS
          TabOrder = 1
        end
      end
      object TabUPS: TUniTabSheet
        Hint = ''
        Caption = 'UPS'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox1: TUniGroupBox
          Left = 0
          Top = 120
          Width = 441
          Height = 103
          Hint = ''
          Caption = ' Reference Column '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            441
            103)
          object Label1: TUniLabel
            Left = 8
            Top = 16
            Width = 423
            Height = 52
            Hint = ''
            AutoSize = False
            Caption = 
              'Which Reference column do you use in UPS WorldShip to record the' +
              ' EnterpriseIQ Packing Slip number?'
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
          end
          object cmbUPSRefColumn: TUniComboBox
            Left = 8
            Top = 64
            Width = 277
            Height = 21
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Reference 1'
              'Reference 2'
              'Reference 3'
              'Reference 4'
              'Reference 5')
            TabOrder = 2
          end
        end
        object GroupBox2: TUniGroupBox
          Left = 0
          Top = 0
          Width = 441
          Height = 120
          Hint = ''
          Caption = ' Database '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          object Label2: TUniLabel
            Left = 8
            Top = 16
            Width = 634
            Height = 13
            Hint = ''
            Caption = 
              'Please specify the name of the database exported by UPS.  This i' +
              's the database you specified in UPS Online Connect, Batch Export' +
              '.'
            TabOrder = 2
          end
          object sbtnBrowseDB: TUniSpeedButton
            Left = 408
            Top = 75
            Width = 23
            Height = 22
            Hint = ''
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF708890608090
              6078805070805060704058604048503038402030302020301018201010101010
              20FF00FFFF00FFFF00FF88888882828278787872727263636358585849494939
              39392F2F2F242424191919101010141414FF00FFFF00FFFF00FF70889090A0B0
              70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
              60AE9783FF00FFFF00FF888888A3A3A3B4B4B49D9D9D9D9D9D9D9D9D98989892
              92928888888888887E7E7E7474744C4C4C959595FF00FFFF00FF80889080C0D0
              90A8B080E0FF60D0FF50C8FF50C8FF40C0F030B0F030A8F020A0E01090D02068
              80615A57FF00FFFF00FF898989C0C0C0A8A8A8E2E2E2D6D6D6D1D1D1D1D1D1C6
              C6C6BBBBBBB6B6B6ACACAC9D9D9D6B6B6B5A5A5AFF00FFFF00FF8090A080D0F0
              90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
              D0204860D8BBA5FF00FF939393D3D3D3A8A8A8C1C1C1DCDCDCD6D6D6D6D6D6D1
              D1D1CBCBCBC1C1C1BBBBBBB6B6B69797974C4C4CB9B9B9FF00FF8090A080D8F0
              80C8E090A8B080E0FF70D0FF60D8FF60D0FF60D0FF50C8FF40C0F040B8F030B0
              F0206880748588FF00FF939393D9D9D9CACACAA8A8A8E2E2E2D7D7D7DCDCDCD6
              D6D6D6D6D6D1D1D1C6C6C6C1C1C1BBBBBB6B6B6B858585FF00FF8098A090E0F0
              90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
              F030A0E04A6774D9C3B4989898E0E0E0E3E3E3A8A8A8B7B7B7DCDCDCDCDCDCDC
              DCDCDCDCDCD6D6D6D6D6D6D1D1D1C1C1C1ACACAC686868C2C2C28098A090E0F0
              A0E8FF80C8E090A8B080E0FF80E0FF80E0FF80E0FF80E0FF80E0FF80E0FF70D8
              FF70D8FF50A8D0909091989898E0E0E0E9E9E9CACACAA8A8A8E2E2E2E2E2E2E2
              E2E2E2E2E2E2E2E2E2E2E2E2E2E2DCDCDCDCDCDCAEAEAE90909090A0A0A0E8F0
              A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
              A08090A08088907088909F9F9FE6E6E6E9E9E9E9E9E9B2B2B2B2B2B2A8A8A8A8
              A8A8A2A2A2A2A2A298989898989893939393939389898988888890A0B0A0E8F0
              A0F0FFA0E8FFA0E8FF80D8FF60D8FF60D8FF60D8FF60D8FF60D8FF60D8FF7088
              90FF00FFFF00FFFF00FFA3A3A3E6E6E6EFEFEFE9E9E9E9E9E9DDDDDDDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC888888FF00FFFF00FFFF00FF90A0B0A0F0F0
              B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
              90FF00FFFF00FFFF00FFA3A3A3ECECECEDEDEDEFEFEFE9E9E9E9E9E9DCDCDC9F
              9F9F9898989898989393938F8F8F888888FF00FFFF00FFFF00FF90A8B0A0D0E0
              B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BDC5BFFF00FFFF00FFFF00FFFF00FFFF00
              FF906850906850906850A8A8A8D1D1D1EDEDEDEDEDEDEFEFEFE9E9E9A3A3A3C4
              C4C4FF00FFFF00FFFF00FFFF00FFFF00FF676767676767676767DAD1C690A8B0
              90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFDFC2B2906850906850D0D0D0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8C1C1C1FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1676767676767FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860D3B6A1FF00FFF7DF
              CCA09080DFC8B3907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF757575B4B4B4FF00FFDEDEDE8E8E8EC6C6C6757575FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
              80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFD1D1D18E8E8E888888959595B9B9B9FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = DoSelectUPSDatabase
          end
          object edtUPSDatabase: TUniEdit
            Left = 3
            Top = 75
            Width = 399
            Height = 21
            Hint = ''
            Text = 'C:\UPS\WSTD\ImpExp\defOut.mdb'
            TabOrder = 0
          end
        end
      end
      object TabFedEx: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'FedEx'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox4: TUniGroupBox
          Left = 0
          Top = 0
          Width = 441
          Height = 118
          Hint = ''
          Caption = ' Reference Column '
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          DesignSize = (
            441
            118)
          object Label3: TUniLabel
            Left = 8
            Top = 16
            Width = 423
            Height = 67
            Hint = ''
            AutoSize = False
            Caption = 
              'Which Reference column do you use in FedEx Ship Manager to recor' +
              'd the EnterpriseIQ Packing Slip number?'
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
          end
          object cmbFedExRef: TUniComboBox
            Left = 8
            Top = 80
            Width = 277
            Height = 21
            Hint = ''
            Style = csDropDownList
            Text = ''
            Items.Strings = (
              'Additional Reference 1'
              'Additional Reference 2'
              'Additional Reference 3')
            TabOrder = 2
          end
        end
      end
    end
  end
  object SrcIQSYS: TDataSource
    DataSet = TblIQSYS
    Left = 156
    Top = 69
  end
  object TblIQSYS: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQSYS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'IQSYS'
    Left = 128
    Top = 160
    object TblIQSYSUPS_HANDLING: TBCDField
      FieldName = 'UPS_HANDLING'
      Size = 2
    end
    object TblIQSYSUPS_HANDLING_FLAT: TFMTBCDField
      FieldName = 'UPS_HANDLING_FLAT'
      Size = 6
    end
    object TblIQSYSID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 245
    Top = 57
  end
end
