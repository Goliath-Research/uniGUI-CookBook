inherited Shop_SetUp_PM: TShop_SetUp_PM
  ClientHeight = 381
  ClientWidth = 681
  ExplicitWidth = 697
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TUniStatusBar
    Top = 357
    Width = 681
    ExplicitTop = 299
    ExplicitWidth = 681
  end
  inherited PageControl1: TUniPageControl
    Width = 681
    Height = 357
    ActivePage = tabMfgCell
    ExplicitWidth = 681
    ExplicitHeight = 299
    inherited tabDefault: TUniTabSheet
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited pnlDefaultSettings: TUniPanel
        Width = 673
        Height = 271
        inherited Splitter3: TUniSplitter
          Height = 271
        end
        inherited pnlDefaultLeft01: TUniPanel
          Height = 271
        end
        inherited pnlSettings: TUniPanel
          Width = 400
          Height = 271
          inherited pgctrlDefaultSettings: TUniPageControl
            Width = 400
            Height = 271
            inherited TabSystem: TUniTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited GroupBox1: TUniGroupBox
                Width = 505
                ExplicitWidth = 505
                inherited DBText1: TUniDBEdit
                  Width = 374
                  ExplicitWidth = 374
                end
                inherited DBText2: TUniDBEdit
                  Width = 374
                  ExplicitWidth = 374
                end
                inherited DBText3: TUniDBEdit
                  Width = 374
                  ExplicitWidth = 374
                end
              end
              inherited Panel3: TUniPanel
                Width = 681
                ExplicitWidth = 681
                inherited NavMainDefault: TUniDBNavigator
                  Left = 605
                  ExplicitLeft = 605
                end
              end
            end
            inherited TabEPlant: TUniTabSheet
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
            end
          end
        end
      end
    end
    inherited tabMfgCell: TUniTabSheet
      Caption = 'MRO Cell'
      ExplicitWidth = 673
      ExplicitHeight = 271
      inherited Splitter1: TUniSplitter
        Left = 375
        Height = 329
        ExplicitLeft = 417
        ExplicitHeight = 229
      end
      inherited dbgridMfgCell: TUniDBGrid
        Width = 375
        Height = 329
        Columns = <
          item
            Expanded = False
            FieldName = 'MFGCELL'
            Title.Caption = 'Cell'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIP'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MFGTYPE'
            Title.Caption = 'MFG Type'
            Width = 89
            Visible = True
          end>
      end
      inherited Panel1: TUniPanel
        Left = 378
        Height = 329
        ExplicitLeft = 378
        ExplicitHeight = 271
      end
    end
    inherited TabWorkCenter: TUniTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited Panel4: TUniPanel
        inherited NavWorkCenter: TUniDBNavigator
        end
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'SHOP_SETUP_PM'
    Left = 114
  end
  inherited IQAbout1: TIQWebAbout
    ModuleName = 'Shop Setup MRO'
  end
  inherited IQRepDef1: TIQWebRepDef
    App_ID = 'Shop_SetUp_PM'
  end
  inherited QryMfgCell: TFDQuery
    Filtered = True
    OnFilterRecord = QryMfgCellFilterRecord
  end
end
