object FrmPM_Capacity_Params: TFrmPM_Capacity_Params
  Left = 122
  Top = 246
  ClientHeight = 120
  ClientWidth = 357
  Caption = 'MRO Capacity Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 78
    Width = 357
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 149
      Top = 1
      Width = 208
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 7
        Top = 8
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 111
        Top = 8
        Width = 90
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 78
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 355
      Height = 74
      Hint = ''
      Constraints.MinHeight = 74
      Caption = ' MRO Capacity Thresholds '
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object Label4: TUniLabel
        Left = 17
        Top = 23
        Width = 43
        Height = 13
        Hint = ''
        Caption = 'Available'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 17
        Top = 47
        Width = 35
        Height = 13
        Hint = ''
        Caption = 'Booked'
        TabOrder = 4
      end
      object DBEdit3: TUniDBEdit
        Left = 101
        Top = 19
        Width = 36
        Height = 21
        Hint = ''
        DataField = 'PM_CAPACITY_AVAIL_THRESHOLD'
        DataSource = SrcParams
        TabOrder = 0
      end
      object DBEdit4: TUniDBEdit
        Left = 101
        Top = 43
        Width = 36
        Height = 21
        Hint = ''
        DataField = 'PM_CAPACITY_BOOKED_THRESHOLD'
        DataSource = SrcParams
        TabOrder = 1
      end
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 10
    Top = 79
  end
  object TblParams: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 58
    Top = 84
    object TblParamsPM_CAPACITY_AVAIL_THRESHOLD: TBCDField
      FieldName = 'PM_CAPACITY_AVAIL_THRESHOLD'
      Precision = 5
      Size = 2
    end
    object TblParamsPM_CAPACITY_BOOKED_THRESHOLD: TBCDField
      FieldName = 'PM_CAPACITY_BOOKED_THRESHOLD'
      Precision = 5
      Size = 2
    end
  end
end
