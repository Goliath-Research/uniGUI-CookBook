object FrmReworkDlg: TFrmReworkDlg
  Left = 283
  Top = 241
  ClientHeight = 147
  ClientWidth = 389
  Caption = 'Create Rework Order'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 104
    Width = 389
    Height = 43
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 387
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Left = 207
      Top = 3
      Width = 181
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 95
        Top = 7
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 104
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 69
      Top = 1
      Width = 6
      Height = 102
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object pnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 68
      Height = 102
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 11
        Top = 37
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Mfg #'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 11
        Top = 61
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Due Date'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 11
        Top = 85
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Qty'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 11
        Top = 13
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 4
      end
    end
    object Panel5: TUniPanel
      Left = 75
      Top = 1
      Width = 313
      Height = 102
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        313
        102)
      object edMfgNo: TUniEdit
        Left = 0
        Top = 33
        Width = 285
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        ReadOnly = True
      end
      object edQty: TUniEdit
        Left = 0
        Top = 81
        Width = 121
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 1
      end
      object timepkDueDate: TUniDateTimePicker
        Left = 0
        Top = 57
        Width = 121
        Height = 21
        Hint = ''
        DateTime = 42681.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
      object edItemNo: TUniEdit
        Left = 0
        Top = 10
        Width = 285
        Height = 19
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clBtnFace
        ReadOnly = True
      end
      object Panel6: TUniPanel
        Left = 284
        Top = 1
        Width = 28
        Height = 100
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 4
        Caption = ''
        object sbtnMfgNo: TUniSpeedButton
          Left = 1
          Top = 33
          Width = 23
          Height = 22
          Hint = ''
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
            90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
            40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
            00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
            E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
            00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
            F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
            B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
            4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
            FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
            50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
            5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
            C09880B08060A068509050309058409D6842B07860B08870A070508048308048
            20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
            00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
            CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
            37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
            00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnMfgNoClick
        end
      end
    end
  end
  object PkMfg: TIQWebHpick
    BeforeOpen = PkMfgBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select s.mfgno,'
      '       s.descrip,'
      '       p.standard_id  '
      '  from partno p, standard s'
      ' where p.arinvt_id = :arinvt_id'
      '   and p.standard_id = s.id'
      '   and mfg.lookup_mfgtype(s.mfg_type) = '#39'REWORK'#39
      '   and misc.eplant_filter( s.eplant_id ) = 1')
    OnIQModify = PkMfgIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 8
    Top = 118
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
      end>
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkMfgSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
end
