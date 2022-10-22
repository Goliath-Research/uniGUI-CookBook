inherited FrmDOCWorkflowTeam: TFrmDOCWorkflowTeam
  Caption = 'Document Revision WorkflowTeam'
  ExplicitWidth = 726
  ExplicitHeight = 406
PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TUniPanel
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    inherited SBSearch: TUniSpeedButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited sbtnReplace: TUniSpeedButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited DBNavigator1: TUniDBNavigator
      Left = 431
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 431
    end
  end
  inherited Grid: TIQUniGridControl
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited wwemail: TUniEdit
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited wwUsers: TUniEdit
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  inherited TblTeam: TFDTable
    Active = False
  end
  inherited PkSearch: TIQWebHPick
    Connection = UniMainModule.FDConnection1
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'DocWorkflowTeam'
  end
  inherited PkUsers: TIQWebHPick
    Connection = UniMainModule.FDConnection1
  end
end
