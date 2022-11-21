object dmDemoVCL: TdmDemoVCL
  Height = 173
  Width = 362
  object Persons: TFDMemTable
    Active = True
    OnCalcFields = PersonsCalcFields
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 48
    Content = {
      41444253100000005F030000FF00010001FF02FF0304000E0000005000650072
      0073006F006E00730005000E00000050006500720073006F006E007300060000
      000000070000080032000000090000FF0AFF0B04000400000049006400050004
      000000490064000C00010000000E000D000F0001100001110001120001130001
      14000115000116000400000049006400FEFF0B04001200000046006900720073
      0074004E0061006D006500050012000000460069007200730074004E0061006D
      0065000C00020000000E00170018001E0000000F000110000112000113000114
      0001150001160012000000460069007200730074004E0061006D00650019001E
      000000FEFF0B0400100000004C006100730074004E0061006D00650005001000
      00004C006100730074004E0061006D0065000C00030000000E00170018003C00
      00000F00011000011200011300011400011500011600100000004C0061007300
      74004E0061006D00650019003C000000FEFF0B04001200000042006900720074
      0068004400610074006500050012000000420069007200740068004400610074
      0065000C00040000000E001A000F000110000112000113000114000115000116
      0012000000420069007200740068004400610074006500FEFF0B04000A000000
      5300650078004900640005000A000000530065007800490064000C0005000000
      0E000D000F000110000112000113000114000115000116000A00000053006500
      780049006400FEFF0B040010000000460075006C006C004E0061006D00650005
      0010000000460075006C006C004E0061006D0065000E0017001800640000000F
      00011000011B0001130001140001150001160010000000460075006C006C004E
      0061006D006500190064000000FEFF0B04000600000041006700650005000600
      00004100670065000E000D000F00011000011B00011300011400011500011600
      06000000410067006500FEFEFF1CFEFF1DFEFF1EFF1F200000000000FF210000
      0100000002000F000000497A61646120526F6472696775657A0300000030D097
      1ECC42040001000000FEFEFF1F200001000000FF210000020000000100060000
      00476C6164797302000D000000436173617320436172646F736F030000006CDB
      6545CC42040002000000FEFEFEFEFEFF22FEFF23240002000000FF25FEFEFE0E
      004D0061006E0061006700650072001E00550070006400610074006500730052
      00650067006900730074007200790012005400610062006C0065004C00690073
      0074000A005400610062006C00650008004E0061006D006500140053006F0075
      007200630065004E0061006D0065000A0054006100620049004400240045006E
      0066006F0072006300650043006F006E00730074007200610069006E00740073
      001E004D0069006E0069006D0075006D00430061007000610063006900740079
      00180043006800650063006B004E006F0074004E0075006C006C00140043006F
      006C0075006D006E004C006900730074000C0043006F006C0075006D006E0010
      0053006F007500720063006500490044000E006400740049006E007400330032
      0010004400610074006100540079007000650014005300650061007200630068
      00610062006C006500120041006C006C006F0077004E0075006C006C000E0041
      00750074006F0049006E0063000800420061007300650014004F0041006C006C
      006F0077004E0075006C006C0012004F0049006E005500700064006100740065
      0010004F0049006E00570068006500720065001A004F0072006900670069006E
      0043006F006C004E0061006D00650018006400740041006E0073006900530074
      00720069006E0067000800530069007A006500140053006F0075007200630065
      00530069007A0065001400640074004400610074006500540069006D00650014
      00430061006C00630075006C0061007400650064001C0043006F006E00730074
      007200610069006E0074004C00690073007400100056006900650077004C0069
      00730074000E0052006F0077004C00690073007400060052006F0077000A0052
      006F0077004900440010004F0072006900670069006E0061006C001800520065
      006C006100740069006F006E004C006900730074001C00550070006400610074
      00650073004A006F00750072006E0061006C001200530061007600650050006F
      0069006E0074000E004300680061006E00670065007300}
    object PersonsId: TAutoIncField
      DisplayWidth = 10
      FieldName = 'Id'
    end
    object PersonsFirstName: TStringField
      DisplayWidth = 30
      FieldName = 'FirstName'
      Size = 30
    end
    object PersonsLastName: TStringField
      DisplayWidth = 35
      FieldName = 'LastName'
      Size = 60
    end
    object PersonsFullName: TStringField
      DisplayWidth = 32
      FieldKind = fkInternalCalc
      FieldName = 'FullName'
      Size = 100
    end
    object PersonsBirthDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'BirthDate'
    end
    object PersonsAge: TIntegerField
      DisplayWidth = 10
      FieldKind = fkInternalCalc
      FieldName = 'Age'
    end
    object PersonsSexId: TIntegerField
      FieldName = 'SexId'
      Visible = False
    end
    object PersonsSex: TStringField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Sex'
      LookupDataSet = Sexes
      LookupKeyFields = 'Id'
      LookupResultField = 'Sex'
      KeyFields = 'SexId'
      Size = 10
      Lookup = True
    end
  end
  object Cars: TFDMemTable
    Active = True
    MasterSource = dsPersons
    MasterFields = 'Id'
    DetailFields = 'PersonId'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 48
    Content = {
      4144425310000000C2010000FF00010001FF02FF030400080000004300610072
      0073000500080000004300610072007300060000000000070000080032000000
      090000FF0AFF0B04000400000049006400050004000000490064000C00010000
      000E000D000F0001100001110001120001130001140001150001160004000000
      49006400FEFF0B0400060000004300610072000500060000004300610072000C
      00020000000E00170018001E0000000F00011000011200011300011400011500
      0116000600000043006100720019001E000000FEFF0B04001000000050006500
      720073006F006E004900640005001000000050006500720073006F006E004900
      64000C00030000000E000D000F00011000011200011300011400011500011600
      1000000050006500720073006F006E0049006400FEFEFF1AFEFF1BFEFF1CFF1D
      1E0000000000FF1F00000100000001001B0000004A65657020436865726F6B65
      65203230313920332E324C20415744020001000000FEFEFF1D1E0001000000FF
      1F00000200000001001A0000004A65657020436F6D7061737320323031382032
      2E344C20415744020002000000FEFEFEFEFEFF20FEFF21220002000000FF23FE
      FEFE0E004D0061006E0061006700650072001E00550070006400610074006500
      73005200650067006900730074007200790012005400610062006C0065004C00
      6900730074000A005400610062006C00650008004E0061006D00650014005300
      6F0075007200630065004E0061006D0065000A00540061006200490044002400
      45006E0066006F0072006300650043006F006E00730074007200610069006E00
      740073001E004D0069006E0069006D0075006D00430061007000610063006900
      74007900180043006800650063006B004E006F0074004E0075006C006C001400
      43006F006C0075006D006E004C006900730074000C0043006F006C0075006D00
      6E00100053006F007500720063006500490044000E006400740049006E007400
      3300320010004400610074006100540079007000650014005300650061007200
      63006800610062006C006500120041006C006C006F0077004E0075006C006C00
      0E004100750074006F0049006E0063000800420061007300650014004F004100
      6C006C006F0077004E0075006C006C0012004F0049006E005500700064006100
      7400650010004F0049006E00570068006500720065001A004F00720069006700
      69006E0043006F006C004E0061006D00650018006400740041006E0073006900
      53007400720069006E0067000800530069007A006500140053006F0075007200
      63006500530069007A0065001C0043006F006E00730074007200610069006E00
      74004C00690073007400100056006900650077004C006900730074000E005200
      6F0077004C00690073007400060052006F0077000A0052006F00770049004400
      10004F0072006900670069006E0061006C001800520065006C00610074006900
      6F006E004C006900730074001C0055007000640061007400650073004A006F00
      750072006E0061006C001200530061007600650050006F0069006E0074000E00
      4300680061006E00670065007300}
    object CarsId: TAutoIncField
      FieldName = 'Id'
    end
    object CarsCar: TStringField
      FieldName = 'Car'
      Size = 30
    end
    object CarsPersonId: TIntegerField
      FieldName = 'PersonId'
    end
  end
  object Sexes: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 48
    Content = {
      41444253100000002B010000FF00010001FF02FF0304000A0000005300650078
      006500730005000A000000530065007800650073000600000000000700000800
      32000000090000FF0AFF0B04000400000049006400050004000000490064000C
      00010000000E000D000F00011000011100011200011300011400011500040000
      0049006400FEFF0B040006000000530065007800050006000000530065007800
      0C00020000000E00160017000A0000000F000110000111000112000113000114
      000115000600000053006500780018000A000000FEFEFF19FEFF1AFEFF1BFF1C
      1D0000000000FF1E0000010000000100040000004D616C65FEFEFF1C1D000100
      0000FF1E00000200000001000600000046656D616C65FEFEFEFEFEFF1FFEFF20
      210002000000FF22FEFEFE0E004D0061006E0061006700650072001E00550070
      0064006100740065007300520065006700690073007400720079001200540061
      0062006C0065004C006900730074000A005400610062006C00650008004E0061
      006D006500140053006F0075007200630065004E0061006D0065000A00540061
      00620049004400240045006E0066006F0072006300650043006F006E00730074
      007200610069006E00740073001E004D0069006E0069006D0075006D00430061
      00700061006300690074007900180043006800650063006B004E006F0074004E
      0075006C006C00140043006F006C0075006D006E004C006900730074000C0043
      006F006C0075006D006E00100053006F007500720063006500490044000E0064
      00740049006E0074003300320010004400610074006100540079007000650014
      00530065006100720063006800610062006C006500120041006C006C006F0077
      004E0075006C006C000800420061007300650014004F0041006C006C006F0077
      004E0075006C006C0012004F0049006E0055007000640061007400650010004F
      0049006E00570068006500720065001A004F0072006900670069006E0043006F
      006C004E0061006D00650018006400740041006E007300690053007400720069
      006E0067000800530069007A006500140053006F007500720063006500530069
      007A0065001C0043006F006E00730074007200610069006E0074004C00690073
      007400100056006900650077004C006900730074000E0052006F0077004C0069
      0073007400060052006F0077000A0052006F0077004900440010004F00720069
      00670069006E0061006C001800520065006C006100740069006F006E004C0069
      00730074001C0055007000640061007400650073004A006F00750072006E0061
      006C001200530061007600650050006F0069006E0074000E004300680061006E
      00670065007300}
    object SexesId: TIntegerField
      FieldName = 'Id'
    end
    object SexesSex: TStringField
      FieldName = 'Sex'
      Size = 10
    end
  end
  object dsPersons: TDataSource
    DataSet = Persons
    Left = 48
    Top = 112
  end
  object dsCars: TDataSource
    DataSet = Cars
    Left = 144
    Top = 112
  end
end
