object FrmPREmplStatus: TFrmPREmplStatus
  Left = 36
  Top = 148
  Width = 243
  Height = 199
  HelpContext = 14028
  Caption = 'Employment Status'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 227
    Height = 30
    Align = alTop
    TabOrder = 0
    object Nav: TUniDBNavigator
      Left = 1
      Top = 1
      Width = 225
      Height = 28
      DataSource = PR_DM.SrcEmplStatus
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      TabOrder = 0
    end
  end
  object Grid: TUniDBGrid
    Left = 0
    Top = 30
    Width = 227
    Height = 133
    Align = alClient
    DataSource = PR_DM.SrcEmplStatus
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRIP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INCL_IN_PREPOST_PAYROLL'
        PickList.Strings = (
          'Y'
          'N')
        Title.Caption = 'Incl. in Payroll'
        Visible = True
      end>
  end
end
