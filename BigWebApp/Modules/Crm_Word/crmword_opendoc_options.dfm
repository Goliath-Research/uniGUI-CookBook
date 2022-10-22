object FrmCrmWordOpenDocOptions: TFrmCrmWordOpenDocOptions
  Left = 299
  Top = 211
  ClientHeight = 251
  ClientWidth = 401
  Caption = 'Open Mail Merge Document'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlOptions: TUniPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 212
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 210
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object PnlCheckboxes: TUniPanel
        Left = 1
        Top = 1
        Width = 397
        Height = 208
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        ExplicitWidth = 401
        ExplicitHeight = 212
        DesignSize = (
          397
          208)
        object Bevel1: TUniPanel
          Left = 4
          Top = 105
          Width = 392
          Height = 3
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          Caption = ''
        end
        object Label19: TUniLabel
          Left = 12
          Top = 133
          Width = 58
          Height = 13
          Hint = ''
          Caption = 'Campaign #'
          TabOrder = 7
        end
        object Label11: TUniLabel
          Left = 12
          Top = 157
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Code'
          TabOrder = 8
        end
        object Label32: TUniLabel
          Left = 12
          Top = 181
          Width = 53
          Height = 13
          Hint = ''
          Caption = 'Description'
          TabOrder = 9
        end
        object rgUpdateOptions: TUniRadioGroup
          Left = 4
          Top = 1
          Width = 392
          Height = 80
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Merge Options '
          TabOrder = 0
        end
        object chkAssocCampaign: TUniCheckBox
          Left = 4
          Top = 110
          Width = 153
          Height = 17
          Hint = ''
          Caption = 'Associate with campaign'
          TabOrder = 1
        end
        object cmbCampaign: TUniDBLookupComboBox
          Left = 116
          Top = 129
          Width = 145
          Height = 21
          Hint = ''
          ListOnlyMode = lmFollowSource
          ListField = 'CAMPAIGN_NO;CODE;DESCRIPTION'
          ListSource = SrcCampaign
          KeyField = 'CAMPAIGN_NO'
          ListFieldIndex = 0
          TabOrder = 2
          Color = clWindow
        end
        object dbeCampaignCode: TUniDBEdit
          Left = 116
          Top = 153
          Width = 145
          Height = 21
          Hint = ''
          DataField = 'CODE'
          DataSource = SrcCampaign
          TabOrder = 3
          Color = clBtnFace
          ReadOnly = True
        end
        object dbeCampaignDescription: TUniDBEdit
          Left = 116
          Top = 177
          Width = 273
          Height = 21
          Hint = ''
          DataField = 'DESCRIPTION'
          DataSource = SrcCampaign
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Color = clBtnFace
          ReadOnly = True
        end
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 212
    Width = 401
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 189
      Top = 1
      Width = 212
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 108
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 0
      end
      object btnOk: TUniBitBtn
        Left = 4
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
    end
  end
  object SrcCampaign: TDataSource
    DataSet = QryCampaign
    Left = 228
    Top = 63
  end
  object QryCampaign: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'select 0 as id, '#39'<None>'#39' as campaign_no, '#39#39' as code, '#39#39' as descr' +
        'iption from dual'
      'UNION'
      'select id, to_char(id), code, description from campaign'
      'order by 1'
      '')
    Left = 240
    Top = 74
    object QryCampaignCAMPAIGN_NO: TStringField
      DisplayLabel = 'Campaign #'
      DisplayWidth = 15
      FieldName = 'CAMPAIGN_NO'
      Size = 40
    end
    object QryCampaignCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Origin = 'IQ.CAMPAIGN.CODE'
      Size = 10
    end
    object QryCampaignDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 150
      FieldName = 'DESCRIPTION'
      Origin = 'IQ.CAMPAIGN.DESCRIPTION'
      Size = 255
    end
    object QryCampaignID: TFMTBCDField
      DisplayLabel = 'Campaign #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.CAMPAIGN.ID'
      Visible = False
      Size = 38
    end
  end
end
