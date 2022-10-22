object FrmSndClone: TFrmSndClone
  Left = 302
  Top = 227
  ClientHeight = 277
  ClientWidth = 423
  Caption = 'Clone Process'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  DesignSize = (
    423
    277)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 13
    Top = 14
    Width = 88
    Height = 13
    Hint = ''
    Caption = 'Existing Process #'
    TabOrder = 5
  end
  object Label2: TUniLabel
    Left = 13
    Top = 39
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'New Process #'
    TabOrder = 6
  end
  object Label3: TUniLabel
    Left = 13
    Top = 64
    Width = 53
    Height = 13
    Hint = ''
    Caption = 'Description'
    TabOrder = 7
  end
  object edExistOperNo: TUniEdit
    Left = 118
    Top = 10
    Width = 138
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
    Color = clBtnFace
    ReadOnly = True
  end
  object edNewOperNo: TUniEdit
    Left = 118
    Top = 35
    Width = 138
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edNewDesc: TUniEdit
    Left = 118
    Top = 60
    Width = 297
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 236
    Width = 423
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 421
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 247
      Top = 2
      Width = 176
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object pnlOptions: TUniPanel
    Left = 111
    Top = 87
    Width = 302
    Height = 141
    Hint = ''
    TabOrder = 4
    Caption = ''
    object chkWorkCenters: TUniCheckBox
      Left = 8
      Top = 3
      Width = 180
      Height = 17
      Hint = ''
      Caption = 'Include Qualified Work Centers'
      TabOrder = 0
    end
    object chkCertified: TUniCheckBox
      Left = 8
      Top = 22
      Width = 180
      Height = 17
      Hint = ''
      Caption = 'Include Certified Employees/Jobs'
      TabOrder = 1
    end
    object chkInspections: TUniCheckBox
      Left = 8
      Top = 41
      Width = 121
      Height = 17
      Hint = ''
      Caption = 'Include Inspections'
      TabOrder = 2
    end
    object chkMaterials: TUniCheckBox
      Left = 8
      Top = 60
      Width = 121
      Height = 17
      Hint = ''
      Caption = 'Include Materials'
      TabOrder = 3
    end
    object chkRejectsCodes: TUniCheckBox
      Left = 8
      Top = 79
      Width = 121
      Height = 17
      Hint = ''
      Caption = 'Include Reject Codes'
      TabOrder = 4
    end
    object chkAuxEquip: TUniCheckBox
      Left = 8
      Top = 98
      Width = 145
      Height = 17
      Hint = ''
      Caption = 'Include Aux Equipment'
      TabOrder = 5
    end
    object chkDocuments: TUniCheckBox
      Left = 8
      Top = 117
      Width = 145
      Height = 17
      Hint = ''
      Caption = 'Include Documents'
      TabOrder = 6
    end
  end
end
