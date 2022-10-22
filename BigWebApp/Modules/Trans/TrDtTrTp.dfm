inherited FrmTranDates: TFrmTranDates
  ClientHeight = 200
  ClientWidth = 376
  Caption = 'Date Scope and Trans. Type'
  OnShow = UniFormShow
  OnCreate = UniFormCreate
  ExplicitWidth = 382
  ExplicitHeight = 229
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Width = 376
    Height = 61
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 376
    ExplicitHeight = 61
    inherited Label2: TUniLabel
      Left = 177
      ExplicitLeft = 177
    end
    inherited DateTimePicker2: TUniDateTimePicker
      Left = 201
      ExplicitLeft = 201
    end
  end
  inherited Panel1: TUniPanel
    Top = 162
    Width = 376
    Height = 38
    ExplicitTop = 162
    ExplicitWidth = 376
    ExplicitHeight = 38
    inherited Panel2: TUniPanel
      Left = 161
      Width = 214
      Height = 36
      ExplicitLeft = 161
      ExplicitWidth = 214
      ExplicitHeight = 36
      inherited btnCancel: TUniButton
        Left = 112
        ExplicitLeft = 112
      end
    end
  end
  object GroupBox2: TUniGroupBox
    Left = 0
    Top = 61
    Width = 376
    Height = 70
    Hint = ''
    Caption = ' Select Transaction Type '
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    object Label3: TUniLabel
      Left = 16
      Top = 23
      Width = 87
      Height = 13
      Hint = ''
      Caption = 'Transaction Type:'
      TabOrder = 3
    end
    object cbTransType: TUniDBComboBox
      Left = 109
      Top = 19
      Width = 189
      Height = 21
      Hint = ''
      Style = csDropDownList
      Items.Strings = (
        'Disposition Transactions'#9'DISPOSITION TRANSACTIONS'
        'Manual Transactions'#9'MANUAL TRANSACTIONS'
        'Receiving Transactions'#9'RECEIVING TRANSACTIONS'
        'Physical Inventory'#9'PHYSICAL INVENTORY'
        'Scrap'#9'SCRAP'
        'InterPlant Transfers'#9'INTERPLANT TRANSFERS'
        'Repair/Rework'#9'REPAIR'
        'Process WIP'#9'PROCESS WIP'
        'Finish Process WIP'#9'FINISH PROCESS WIP'
        'Shipments'#9'PACKING SLIP'
        'Shipments-COGS'#9'SHIPMENTS-COGS'
        'MRO'#9'PM'
        'Projects'#9'PROJECTS'
        'Process Reverse Backflush'#9'REVERSE_BACKFLUSH'
        'Adjust WIP'#9'ADJUST WIP')
      TabOrder = 0
      OnCloseUp = cbTransTypeCloseUp
    end
    object chkHideOrphan: TUniCheckBox
      Left = 109
      Top = 44
      Width = 228
      Height = 17
      Hint = ''
      Caption = 'Hide unprocessed floor dispo transactions'
      TabOrder = 1
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 131
    Width = 376
    Height = 31
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 28
      Width = 374
      Height = 2
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
      Caption = ''
    end
    object chkReviewPosted: TUniCheckBox
      Left = 1
      Top = 6
      Width = 215
      Height = 17
      Hint = ''
      Caption = 'Process/Review Posted Transactions'
      TabOrder = 0
    end
  end
end
