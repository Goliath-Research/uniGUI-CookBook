object dmPickListAdmin: TdmPickListAdmin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 164
  Width = 425
  object IQPickLists: TFDQuery
    AfterPost = IQPickListsAfterPost
    IndexFieldNames = 'NAME'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select pl.*, pl.rowid'
      'from IQPickList pl')
    Left = 120
    Top = 24
    object IQPickListsID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
      Precision = 5
      Size = 0
    end
    object IQPickListsNAME: TStringField
      DisplayLabel = 'Pick List'
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 64
    end
    object IQPickListsROWID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ROWID'
      Origin = '"ROWID"'
      Visible = False
      Size = 23
    end
  end
  object QryPickListItem: TFDQuery
    IndexFieldNames = 'Seq;Text'
    MasterSource = dsPickLists
    MasterFields = 'ID'
    DetailFields = 'PICKLIST_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select * from IQPickListItem where PickList_ID = :ID')
    Left = 120
    Top = 88
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 10000c
      end>
    object QryPickListItemID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 5
      Size = 0
    end
    object QryPickListItemTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'TEXT'
      Required = True
      Size = 64
    end
    object QryPickListItemSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object QryPickListItemPICKLIST_ID: TBCDField
      FieldName = 'PICKLIST_ID'
      Origin = 'PICKLIST_ID'
      Precision = 5
      Size = 0
    end
  end
  object dsPickLists: TDataSource
    DataSet = IQPickLists
    Left = 40
    Top = 21
  end
  object dsPickListItems: TDataSource
    DataSet = QryPickListItem
    Left = 40
    Top = 88
  end
  object alPickLists: TActionList
    Images = ilAdapter
    Left = 200
    Top = 64
    object acMoveUp: TAction
      Caption = 'Move Up'
      ImageIndex = 0
      OnExecute = acMoveUpExecute
    end
    object acMoveDown: TAction
      Caption = 'Move Down'
      ImageIndex = 1
      OnExecute = acMoveDownExecute
    end
  end
  object ilAdapter: TUniImageListAdapter
    UniImageList = ilPickLists
    Left = 280
    Top = 64
  end
  object ilPickLists: TUniNativeImageList
    Left = 360
    Top = 65
    Images = {
      02000000FFFFFF1F040E02000089504E470D0A1A0A0000000D49484452000000
      100000001008060000001FF3FF61000000017352474200AECE1CE90000000467
      414D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B
      000001A349444154384F7593CB4AC4301486FFB6990BCE459C0710F4097C0077
      2E05173E872E75E7CA952B41D09D2FE042441174E38501055150170AE288A3A8
      88DA5A6A67EC24694D3A719C4EEA073F8193D3FF9CE4A44624C03F1C3E7A18EA
      CF61B09C55111D53AD1A4D1E61E1A08EB9BDBA8AA4F3AFC1CC6E0D7983C3767D
      2C9FBEA8A84EAAC1DAD51B6E9E1D588890B322AC9F3FE1C66EAADD249AC17B93
      61A55A431F0118A7E09CA1608598D9BE5619493483A98DCBB875F921636D4521
      87F7E5637EFF5665FD9130583ABEC7C3AB0D035C55A79D551E65EBA28E932757
      65B7E98CF1DE696072B58A813C816118308D78BF4328B25818A225EC8FA6C754
      B4CBE097AF806274710795424E45DA7CF801CE66C741CCE4A9B53B701A2D5075
      F65E397E4B65FDA119C88664B2BCC46E3146C550F547AB194864726F75A934D2
      3B90157B44650729BF8D6E2026E0F8DFF86C0409398D6F71E57AC3F1145CD785
      EFFBA0545C12E7D8BCB813730BC1C5039298A6156B626458143091C966512C16
      512E97DB06B66DC3F33C614063E58915AFA29918D939C910042C042104596150
      2A9550A954F00304EB13471604EA180000000049454E44AE426082FFFFFF1F04
      2102000089504E470D0A1A0A0000000D49484452000000100000001008060000
      001FF3FF61000000017352474200AECE1CE90000000467414D410000B18F0BFC
      6105000000097048597300000EC400000EC401952B0E1B000001B64944415438
      4F75523D2F0451143DFB31CBC65A9F4B652341A1A0210A95289088284429D16C
      34F8012AFF40A395A83442A392F017340A111A211A1F63ECEEEC7CBC9971DF9B
      B7769FB7CEE66477CFBB73EEBDEF4C2222A0090E0B7178F386B654422A002FF0
      8308BB530518A9642C4A6806AFDF2E36CFEFD1D39E964A0CD36138591F477F87
      219518AA1D81F74D448C18A80C496B0CF50BCD20A28FEFFBF0994A8F34A8C30A
      E80654E4FB5E6CD24CE689BBF80BCD209D4CD0032E1853C93543AB6E32B05C86
      07CBC5E3978328606A772248BBFBACE1F6DD46183666F94D81052146F6CFD0DB
      D186AE6C461CFEC57BC5C1606716D7BB8B52699A204DF99E95E660D9351AD9D7
      C8A7703C0F573B0BF28918CA56D3C50256278660566C6D8557F31B076B3314A5
      9AA5762D07EBB308695FDEAD1E6199A69A2EF6616572585635D0E25E818BED65
      3CBD99A2B3474666D5C6E9D6923C55D1D26074A01B3BF393F82857F0F261E1A4
      D4B8340D3C85FF30B6771C6D1C5DCA7FAD2162B42C0BD56A558CCBC9410778A6
      EE058ACD30D248265342CF643282B95C0EF97C3E5E210802B12F634CFCE6DFB6
      4399E7B3E2FD77DDF8D5AED7D56B01E00725C75E9826ED06EB0000000049454E
      44AE426082}
  end
end
