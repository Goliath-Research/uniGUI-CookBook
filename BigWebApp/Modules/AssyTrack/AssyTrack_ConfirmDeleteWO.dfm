inherited FrmAssyTrackConfirmDeleteWO: TFrmAssyTrackConfirmDeleteWO
  Left = 89
  Top = 209
  ClientHeight = 156
  ExplicitWidth = 413
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Height = 116
    ExplicitHeight = 116
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 88
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Width = 31
        Caption = 'Status'
        ExplicitWidth = 31
      end
      inherited Label2: TUniLabel
        Width = 37
        Caption = 'Confirm'
        ExplicitWidth = 37
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'IS_COMPLETED'
      end
      inherited DBEdit3: TUniDBEdit
        Font.Color = clBlack
        Color = clYellow
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 116
    Height = 40
    ExplicitTop = 116
    ExplicitHeight = 40
    inherited Panel2: TUniPanel
      Left = 140
      Width = 267
      Height = 38
      ExplicitLeft = 140
      ExplicitWidth = 267
      ExplicitHeight = 38
      inherited btnOK: TUniButton
        Caption = 'Yes'
      end
      inherited btnCancel: TUniButton
        Left = 179
        ExplicitLeft = 179
      end
      object btnNo: TUniButton
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        ModalResult = 7
        TabOrder = 3
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       '#39'Completed'#39' as is_completed,'
      '       '#39'Delete workorder?'#39' as status_id'
      '  from workorder'
      ' where id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'btnNo')
    SecurityCode = 'FRMASSYTRACKCONFIRMDELETEWO'
  end
end
