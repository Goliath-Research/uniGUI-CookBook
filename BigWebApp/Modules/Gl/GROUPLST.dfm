object FrmGroups: TFrmGroups
  Left = 270
  Top = 189
  Caption = 'Budget Groups'
  ClientHeight = 198
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 334
    Height = 3
    Align = alTop
    ExplicitWidth = 342
  end
  object PnlToolbar: TUniPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 27
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 342
    object DBNavigator1: TUniDBNavigator
      Left = 166
      Top = 1
      Width = 175
      Height = 25
      VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 30
    Width = 334
    Height = 168
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitWidth = 342
    ExplicitHeight = 173
    object DBGrid1: TUniDBGrid
      Left = 0
      Top = 0
      Width = 342
      Height = 173
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'Code'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Description'
          Width = 160
          Visible = True
        end>
    end
  end
end
