object IQUniModuleFormDesigner: TIQUniModuleFormDesigner
  Left = 0
  Top = 0
  Width = 906
  Height = 542
  OnCreate = UniFrameCreate
  OnDestroy = UniFrameDestroy
  Layout = 'border'
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object LeftPanel: TUniPanel
    Left = 0
    Top = 26
    Width = 225
    Height = 516
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    ShowCaption = False
    Caption = 'LeftPanel'
    Collapsible = True
    Layout = 'fit'
    LayoutConfig.Split = True
    LayoutConfig.Region = 'west'
  end
  object UniToolBar2: TUniToolBar
    Left = 0
    Top = 0
    Width = 906
    Height = 26
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Images = UniNativeImageList1
    BorderWidth = 1
    Anchors = [akLeft, akTop, akRight]
    Align = alTop
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    object UniToolButton1: TUniToolButton
      Left = 0
      Top = 0
      Hint = 'New Design'
      ShowHint = True
      Action = NewModuleAction
      ImageIndex = 0
      ScreenMask.Enabled = True
    end
    object UniToolButton2: TUniToolButton
      Left = 23
      Top = 0
      Hint = 'Save Design'
      ShowHint = True
      Action = SaveModuleAction
      ImageIndex = 1
      ScreenMask.Enabled = True
    end
    object UniToolButton3: TUniToolButton
      Left = 46
      Top = 0
      Hint = 'Load Design'
      ShowHint = True
      Action = OpenModuleAction
      ImageIndex = 2
      ScreenMask.Enabled = True
    end
    object UniToolButton4: TUniToolButton
      Left = 69
      Top = 0
      Width = 8
      Hint = ''
      ShowHint = True
      Style = tbsSeparator
      Caption = 'UniToolButton4'
    end
    object UniToolButton5: TUniToolButton
      Left = 77
      Top = 0
      Hint = 'Refresh Workspace'
      ShowHint = True
      ImageIndex = 3
      Caption = 'UniToolButton5'
      ScreenMask.Enabled = True
      OnClick = UniToolButton5Click
    end
  end
  object UniPanelMain: TUniPanel
    Left = 225
    Top = 26
    Width = 681
    Height = 516
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ShowCaption = False
    Caption = 'UniPanelMain'
    Layout = 'fit'
    LayoutConfig.Region = 'center'
  end
  object ActionList1: TActionList
    Images = UniImageListAdapter1
    Left = 376
    Top = 224
    object NewModuleAction: TAction
      Category = 'Main'
      Caption = 'New Module'
      ImageIndex = 0
      OnExecute = NewModuleActionExecute
    end
    object SaveModuleAction: TAction
      Category = 'Main'
      Caption = 'Save Module'
      ImageIndex = 1
      OnExecute = SaveModuleActionExecute
    end
    object OpenModuleAction: TAction
      Category = 'Main'
      Caption = 'Open Existing'
      ImageIndex = 2
      OnExecute = OpenModuleActionExecute
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 376
    Top = 392
    Images = {
      04000000FFFFFF1F04C500000089504E470D0A1A0A0000000D49484452000000
      100000001008060000001FF3FF61000000097048597300000EC300000EC301C7
      6FA8640000007749444154388D6360A0103022738A8A8AFEE350F7818181C1B1
      AFAFEF025ED38A8A8AFE6303454545FF8B8A8ADE17151519A0EB6122D6A94141
      41020C0C0CFBD10D21DA006B6B6BAC86B0106B407171318C29C0C0C0B09F8181
      419068037A7B7BD10D1380B189F6022E306AC0603000231D202518FA000048C4
      306AC2F338790000000049454E44AE426082FFFFFF1F04B600000089504E470D
      0A1A0A0000000D49484452000000100000001008060000001FF3FF6100000009
      7048597300000EC300000EC301C76FA8640000006849444154388D6360A01030
      323030307446AEFE4F8EE6F2E5A18C2CC80265CB4288D2D815B506CE6622C766
      6430DC0C38BAF61A410DE86A58D025893104A70BC8012CE80284D202721AA08A
      0B701AD015B506C336920C2016C0C2600103034302CC667497D0140000F35B1A
      8471E829520000000049454E44AE426082FFFFFF1F048901000089504E470D0A
      1A0A0000000D49484452000000100000001008060000001FF3FF610000000970
      48597300000EC300000EC301C76FA8640000013B49444154388DC592B14E0241
      1445CFE21658981013D7C286CAD66DC4CA4DE868307C0286DAC20F708CF303E0
      1788FE80411A3A37D359897658A189859318474D0423662DDC254B6003D878BA
      37EFDE3BF3260FFE1B6B9A402BE902974026765C773CB13B355D2B59D64A066F
      9D461031E8BD045AC920D2D85AC96BC04D0A49AF6EB0B4BE33AC17D29991BE0D
      B8CB9B7B638D59494D4A9D073B5EF49F6E78BFBB98C918FE831909F8785049FA
      1A70E478C284E6ACE3892E80A5950C56B60FF87ABDC7DC9E4D32EF57FC5C1DA8
      0225A00B34C2D06A2A52F51EAF265EED78A2C6EF1E9480E3D07C089C03651BE0
      BB6FF87CEE24CDEA567C7CE0B4290A6D80A26C758193E1088B6B5B892F000C90
      07B2805FF17355A01C352DAD6460D96982413F29204E1BC83B9E3045D9CA3445
      C158F1B59C83BCE309FF0FBE717E00BE9878ADFC00AE4E0000000049454E44AE
      426082FFFFFF1F044E01000089504E470D0A1A0A0000000D4948445200000010
      0000001008060000001FF3FF61000000097048597300000EC300000EC301C76F
      A8640000010049444154388DA5923172833010451F99345C81CABE0947704B07
      2554B698910B8A242D054E2AB9834E2E73837083F8083E426EA0148819C5968D
      66F22B69F5F566F557F04F45F34208611EF886AEEB8A87242184F14908619AA6
      314288DE77EF29A4CDAAAA88E338F74182004992DC853C8700EABA76B739709B
      C7BD0CACBE8D311B1F3CA483218AA2426A954AAD5E6DED027C028725C0797F3A
      EEA4565F407A75F602AC9642DC59630AFC30BD7D0D0CC00A16A6B03F1DCFC076
      86B5593958607E63F685B8D01D1010A2D4CA050D6D561652AB1CE883008EDE81
      0F7BF930D7FE00AE3E8CAB0B53165BA736026F91CFED4A6AD5334D63834D1E18
      DBAC1C017E0139108D089AEA5AE80000000049454E44AE426082}
  end
  object UniImageListAdapter1: TUniImageListAdapter
    UniImageList = UniNativeImageList1
    Left = 376
    Top = 312
  end
end
