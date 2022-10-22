object Master_DetailForm: TMaster_DetailForm
  Left = 0
  Top = 0
  Caption = 'Orders / Items -> Simple Master / Detail using FireDAC'
  ClientHeight = 386
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 185
    Width = 505
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 169
    ExplicitWidth = 217
  end
  object pnlOrders: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 185
    Align = alTop
    TabOrder = 0
    object dbgOrders: TDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 157
      Align = alClient
      DataSource = dsOrders
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlMasterGrid: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Align = alTop
      TabOrder = 1
      object dbnOrders: TDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        DataSource = dsOrders
        Align = alRight
        TabOrder = 0
      end
    end
  end
  object pnlItems: TPanel
    Left = 0
    Top = 188
    Width = 505
    Height = 198
    Align = alClient
    TabOrder = 1
    object pnlDetailGrid: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 26
      Align = alTop
      TabOrder = 0
      object dbnItems: TDBNavigator
        Left = 262
        Top = 1
        Width = 240
        Height = 24
        DataSource = dsItems
        Align = alRight
        TabOrder = 0
      end
    end
    object dbgItems: TDBGrid
      Left = 1
      Top = 27
      Width = 503
      Height = 170
      Align = alClient
      DataSource = dsItems
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object tblOrders: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'CustomerID'
        DataType = ftInteger
      end
      item
        Name = 'Posted'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 224
    Top = 32
    Content = {
      414442530F00B028B0010000FF00010001FF02FF03040012000000740062006C
      004F007200640065007200730005000A0000005400610062006C006500060000
      000000070000080032000000090000FF0AFF0B04000400000049004400050004
      000000490044000C00010000000E000D000F0001100001110001120001130001
      14000115000400000049004400FEFF0B04001400000043007500730074006F00
      6D00650072004900440005001400000043007500730074006F006D0065007200
      490044000C00020000000E000D000F0001100001110001120001130001140001
      15001400000043007500730074006F006D006500720049004400FEFF0B04000C
      00000050006F00730074006500640005000C00000050006F0073007400650064
      000C00030000000E0016000F000110000111000112000113000114000115000C
      00000050006F007300740065006400FEFEFF17FEFF18FEFF19FF1A1B00000000
      00FF1C000001000000010002000000020000E09BD50AF0CC42FEFEFF1A1B0001
      000000FF1C0000020000000100010000000200008057E30AF0CC42FEFEFEFEFE
      FF1DFEFF1E1F0002000000FF20FEFEFE0E004D0061006E006100670065007200
      1E00550070006400610074006500730052006500670069007300740072007900
      12005400610062006C0065004C006900730074000A005400610062006C006500
      08004E0061006D006500140053006F0075007200630065004E0061006D006500
      0A0054006100620049004400240045006E0066006F0072006300650043006F00
      6E00730074007200610069006E00740073001E004D0069006E0069006D007500
      6D0043006100700061006300690074007900180043006800650063006B004E00
      6F0074004E0075006C006C00140043006F006C0075006D006E004C0069007300
      74000C0043006F006C0075006D006E00100053006F0075007200630065004900
      44000E006400740049006E007400330032001000440061007400610054007900
      700065001400530065006100720063006800610062006C006500120041006C00
      6C006F0077004E0075006C006C000800420061007300650014004F0041006C00
      6C006F0077004E0075006C006C0012004F0049006E0055007000640061007400
      650010004F0049006E00570068006500720065001A004F007200690067006900
      6E0043006F006C004E0061006D00650014006400740044006100740065005400
      69006D0065001C0043006F006E00730074007200610069006E0074004C006900
      73007400100056006900650077004C006900730074000E0052006F0077004C00
      690073007400060052006F0077000A0052006F0077004900440010004F007200
      6900670069006E0061006C001800520065006C006100740069006F006E004C00
      6900730074001C0055007000640061007400650073004A006F00750072006E00
      61006C001200530061007600650050006F0069006E0074000E00430068006100
      6E00670065007300}
    object tblOrdersID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object tblOrdersCustomerID: TIntegerField
      FieldName = 'CustomerID'
      Visible = False
    end
    object tblOrdersCustomer: TStringField
      DisplayWidth = 23
      FieldKind = fkLookup
      FieldName = 'Customer'
      LookupDataSet = tblCustomers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'CustomerID'
      Size = 64
      Lookup = True
    end
    object tblOrdersPosted: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Posted'
    end
  end
  object tblCustomers: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 360
    Top = 32
    Content = {
      414442530F00AF2893010000FF00010001FF02FF03040018000000740062006C
      0043007500730074006F006D0065007200730005000A0000005400610062006C
      006500060000000000070000080032000000090000FF0AFF0B04000400000049
      004400050004000000490044000C00010000000E000D000F0001100001110001
      12000113000114000115000400000049004400FEFF0B0400080000004E006100
      6D0065000500080000004E0061006D0065000C00020000000E00160017004000
      00000F00011000011100011200011300011400011500080000004E0061006D00
      6500180040000000FEFEFF19FEFF1AFEFF1BFF1C1D0000000000FF1E00000100
      00000100080000004A6F686E20446F65FEFEFF1C1D0001000000FF1E00000200
      00000100080000004A616E6520446F65FEFEFF1C1D0002000000FF1E00000300
      000001000E0000005069636B7920437573746F6D6572FEFEFF1C1D0003000000
      FF1E000004000000010010000000436F6D70756C73697665204275796572FEFE
      FEFEFEFF1FFEFF20210004000000FF22FEFEFE0E004D0061006E006100670065
      0072001E00550070006400610074006500730052006500670069007300740072
      00790012005400610062006C0065004C006900730074000A005400610062006C
      00650008004E0061006D006500140053006F0075007200630065004E0061006D
      0065000A0054006100620049004400240045006E0066006F0072006300650043
      006F006E00730074007200610069006E00740073001E004D0069006E0069006D
      0075006D0043006100700061006300690074007900180043006800650063006B
      004E006F0074004E0075006C006C00140043006F006C0075006D006E004C0069
      00730074000C0043006F006C0075006D006E00100053006F0075007200630065
      00490044000E006400740049006E007400330032001000440061007400610054
      007900700065001400530065006100720063006800610062006C006500120041
      006C006C006F0077004E0075006C006C000800420061007300650014004F0041
      006C006C006F0077004E0075006C006C0012004F0049006E0055007000640061
      007400650010004F0049006E00570068006500720065001A004F007200690067
      0069006E0043006F006C004E0061006D00650018006400740041006E00730069
      0053007400720069006E0067000800530069007A006500140053006F00750072
      0063006500530069007A0065001C0043006F006E00730074007200610069006E
      0074004C00690073007400100056006900650077004C006900730074000E0052
      006F0077004C00690073007400060052006F0077000A0052006F007700490044
      0010004F0072006900670069006E0061006C001800520065006C006100740069
      006F006E004C006900730074001C0055007000640061007400650073004A006F
      00750072006E0061006C001200530061007600650050006F0069006E0074000E
      004300680061006E00670065007300}
    object tblCustomersID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object tblCustomersName: TStringField
      DisplayWidth = 44
      FieldName = 'Name'
      Size = 64
    end
  end
  object tblItems: TFDMemTable
    Active = True
    OnCalcFields = tblItemsCalcFields
    FieldDefs = <
      item
        Name = 'OrderID'
        DataType = ftInteger
      end
      item
        Name = 'ProductID'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'OrderID'
    MasterSource = dsOrders
    MasterFields = 'ID'
    DetailFields = 'OrderID'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 224
    Top = 232
    Content = {
      414442530F00AF282A020000FF00010001FF02FF03040010000000740062006C
      004900740065006D00730005000A0000005400610062006C0065000600000000
      00070000080032000000090000FF0AFF0B04000E0000004F0072006400650072
      004900440005000E0000004F007200640065007200490044000C00010000000E
      000D000F000110000111000112000113000114000115000116000E0000004F00
      720064006500720049004400FEFF0B040012000000500072006F006400750063
      00740049004400050012000000500072006F006400750063007400490044000C
      00020000000E000D000F00011000011100011200011300011400011500011600
      12000000500072006F00640075006300740049004400FEFF0B04001000000051
      00750061006E0074006900740079000500100000005100750061006E00740069
      00740079000C00030000000E000D000F00011000011100011200011300011400
      011600100000005100750061006E007400690074007900FEFEFF17FEFF18FEFF
      19FF1A1B0000000000FF1C000002000000010004000000020001000000FEFEFF
      1A1B0001000000FF1C000002000000010003000000020001000000FEFEFF1A1B
      0002000000FF1C000002000000010002000000020001000000FEFEFF1A1B0003
      000000FF1C000002000000010001000000020001000000FEFEFF1A1B00040000
      00FF1C000002000000010008000000020001000000FEFEFEFEFEFF1DFEFF1E1F
      0005000000FF20FEFEFE0E004D0061006E0061006700650072001E0055007000
      6400610074006500730052006500670069007300740072007900120054006100
      62006C0065004C006900730074000A005400610062006C00650008004E006100
      6D006500140053006F0075007200630065004E0061006D0065000A0054006100
      620049004400240045006E0066006F0072006300650043006F006E0073007400
      7200610069006E00740073001E004D0069006E0069006D0075006D0043006100
      700061006300690074007900180043006800650063006B004E006F0074004E00
      75006C006C00140043006F006C0075006D006E004C006900730074000C004300
      6F006C0075006D006E00100053006F007500720063006500490044000E006400
      740049006E007400330032001000440061007400610054007900700065001400
      530065006100720063006800610062006C006500120041006C006C006F007700
      4E0075006C006C000800420061007300650014004F0041006C006C006F007700
      4E0075006C006C0012004F0049006E0055007000640061007400650010004F00
      49006E00570068006500720065000C004F0049006E004B00650079001A004F00
      72006900670069006E0043006F006C004E0061006D0065001C0043006F006E00
      730074007200610069006E0074004C0069007300740010005600690065007700
      4C006900730074000E0052006F0077004C00690073007400060052006F007700
      0A0052006F0077004900440010004F0072006900670069006E0061006C001800
      520065006C006100740069006F006E004C006900730074001C00550070006400
      61007400650073004A006F00750072006E0061006C0012005300610076006500
      50006F0069006E0074000E004300680061006E00670065007300}
    object tblItemsOrderID: TIntegerField
      FieldName = 'OrderID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object tblItemsProductID: TIntegerField
      FieldName = 'ProductID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object tblItemsProduct: TStringField
      DisplayWidth = 37
      FieldKind = fkLookup
      FieldName = 'Product'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'Description'
      KeyFields = 'ProductID'
      Size = 64
      Lookup = True
    end
    object tblItemsQuantity: TIntegerField
      DisplayWidth = 10
      FieldName = 'Quantity'
    end
    object tblItemsPrice: TCurrencyField
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Price'
      LookupDataSet = tblProducts
      LookupKeyFields = 'ID'
      LookupResultField = 'Price'
      KeyFields = 'ProductID'
      Lookup = True
    end
    object tblItemsTotal: TCurrencyField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
  object tblProducts: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 360
    Top = 232
    Content = {
      414442530F00AF28F6020000FF00010001FF02FF03040016000000740062006C
      00500072006F006400750063007400730005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B040004000000490044
      00050004000000490044000C00010000000E000D000F00011000011100011200
      0113000114000115000400000049004400FEFF0B040016000000440065007300
      6300720069007000740069006F006E0005001600000044006500730063007200
      69007000740069006F006E000C00020000000E0016001700400000000F000110
      0001110001120001130001140001150016000000440065007300630072006900
      7000740069006F006E00180040000000FEFF0B04000A00000050007200690063
      00650005000A000000500072006900630065000C00030000000E0019001A0013
      0000001B00040000000F000110000111000112000113000114000115000A0000
      00500072006900630065001C00130000001D0004000000FEFEFF1EFEFF1FFEFF
      20FF21220000000000FF230000010000000100050000004D6F7573650200A086
      010000000000FEFEFF21220001000000FF230000020000000100080000004B65
      79626F6172640200400D030000000000FEFEFF21220002000000FF2300000300
      00000100070000004D6F6E69746F72020000350C0000000000FEFEFF21220003
      000000FF23000004000000010011000000506572736F6E616C20436F6D707574
      65720200404B4C0000000000FEFEFF21220004000000FF230000050000000100
      0B000000536D6172742050686F6E65020080841E0000000000FEFEFF21220005
      000000FF230000060000000100060000005461626C65740200C0C62D00000000
      00FEFEFF21220006000000FF2300000700000001000A000000555342204D656D
      6F72790200801A060000000000FEFEFF21220007000000FF2300000800000001
      001200000045787465726E616C20535344204472697665020060E31600000000
      00FEFEFEFEFEFF24FEFF25260008000000FF27FEFEFE0E004D0061006E006100
      6700650072001E00550070006400610074006500730052006500670069007300
      74007200790012005400610062006C0065004C006900730074000A0054006100
      62006C00650008004E0061006D006500140053006F0075007200630065004E00
      61006D0065000A0054006100620049004400240045006E0066006F0072006300
      650043006F006E00730074007200610069006E00740073001E004D0069006E00
      69006D0075006D00430061007000610063006900740079001800430068006500
      63006B004E006F0074004E0075006C006C00140043006F006C0075006D006E00
      4C006900730074000C0043006F006C0075006D006E00100053006F0075007200
      63006500490044000E006400740049006E007400330032001000440061007400
      610054007900700065001400530065006100720063006800610062006C006500
      120041006C006C006F0077004E0075006C006C00080042006100730065001400
      4F0041006C006C006F0077004E0075006C006C0012004F0049006E0055007000
      640061007400650010004F0049006E00570068006500720065001A004F007200
      6900670069006E0043006F006C004E0061006D00650018006400740041006E00
      7300690053007400720069006E0067000800530069007A006500140053006F00
      7500720063006500530069007A00650014006400740043007500720072006500
      6E0063007900120050007200650063006900730069006F006E000A0053006300
      61006C0065001E0053006F007500720063006500500072006500630069007300
      69006F006E00160053006F0075007200630065005300630061006C0065001C00
      43006F006E00730074007200610069006E0074004C0069007300740010005600
      6900650077004C006900730074000E0052006F0077004C006900730074000600
      52006F0077000A0052006F0077004900440010004F0072006900670069006E00
      61006C001800520065006C006100740069006F006E004C006900730074001C00
      55007000640061007400650073004A006F00750072006E0061006C0012005300
      61007600650050006F0069006E0074000E004300680061006E00670065007300}
    object tblProductsID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
    end
    object tblProductsDescription: TStringField
      DisplayWidth = 35
      FieldName = 'Description'
      Size = 64
    end
    object tblProductsPrice: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Price'
    end
  end
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 224
    Top = 88
  end
  object dsItems: TDataSource
    DataSet = tblItems
    Left = 224
    Top = 288
  end
end