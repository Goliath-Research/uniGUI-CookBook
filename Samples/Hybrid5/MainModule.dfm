object UniMainModule: TUniMainModule
  OnCreate = UniGUIMainModuleCreate
  OnDestroy = UniGUIMainModuleDestroy
  MonitoredKeys.Keys = <>
  EnableSynchronousOperations = True
  OnNewComponent = UniGUIMainModuleNewComponent
  Height = 165
  Width = 277
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=X:\OneDrive\GitHub\unigui-cookbook\Samples\Databases\Fi' +
        'reDAC\SQLite\SQLite_Sales.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 16
    Top = 24
  end
  object ActionList1: TActionList
    Images = UniImageListAdapter1
    Left = 208
    Top = 64
    object actEditUsers: TAction
      Category = 'App Services'
      Caption = 'Edit Users'
      ImageIndex = 0
      OnExecute = actEditUsersExecute
    end
    object actEditOrders: TAction
      Category = 'App Services'
      Caption = 'Edit Orders'
      ImageIndex = 1
      OnExecute = actEditOrdersExecute
    end
    object actReportSales: TAction
      Category = 'App Services'
      Caption = 'Report Sales'
      ImageIndex = 4
      OnExecute = actReportSalesExecute
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Width = 32
    Height = 32
    Left = 96
    Top = 96
    Images = {
      05000000FFFFFF1F04FE01000089504E470D0A1A0A0000000D49484452000000
      20000000200806000000737A7AF4000000097048597300000EC300000EC301C7
      6FA864000001B0494441545885E597CF51834014873F1D0BA003E9405281E4C6
      65C7A48374106D80243410AD20B102E370E1A65690D801255082875D46061678
      CBC0C1F17762C8FBF3EDDBCD7B0BFC775DB93AA824F38015F000044001E4C02B
      704AE3A8980C4025D90238005E8B490E2CD338BA8C0E6092BF094C0B602E85B8
      1626F780BDC4165D9D83D05606002C005F1A14084CC54603B87748EEE42305F0
      07000463020C513E26C0D70080EF31018E03004EA301A47194033B87E43BE3D3
      2BD74EB8071E7BCC9ED3387A92C61C320B42608DEE0D559D8097348E3E5D63FE
      0DA9240B55926D05765B5325913AB74025990F6CD0E52E27E0328D23EB09AF0D
      AC02BD2D9D07B2F55FA0926C059CD1B3BF3A7ED71DCCD5DFCA7BC3D9C4B2CA5A
      01E3D035D1E6F5C366CAFED1E163AD5C5B05FA46EF46F8AE2AEB821A0066256D
      379E5261F5A099E7B0CDD8C8B38DE81B5BF09E40A50E2AC966E5B3D027A0D6A2
      6D00B7C2603EBF7BEE0B7DEEEA2F6C00D260209CF91535B676CAFB804836807C
      C27C8DD83680DD441017A031251B00A66DCE18760969D311DDBC1A5F4D9259B0
      40DF703DF4A1EBEB11057AB500EFE8CFB5DC09F75FE9071063761A56A2F6B900
      00000049454E44AE426082FFFFFF1F040502000089504E470D0A1A0A0000000D
      4948445200000020000000200806000000737A7AF4000000097048597300000E
      C300000EC301C76FA864000001B7494441545885ED97CF4DC33014873F570CC0
      081DA1552F1CE9891C6AFE6C5036A0033471CC006583B61380F0C59CE0C80591
      0DE8084C8039D44151A1C5691C8903EF64BF27E5FBF4B32227F057CB18E38C31
      2ED67E5B1D6C3694520E404A2962EE955222480020CB3206838103188D46008D
      F6799E6F4DA0B375D242496D7B9BBD6FB128A55C966551C1799E5FBE748E00E6
      C0C2A4C965396B3B8102E8BF748E0A0F07184B6DCB75AB0205303CBD7E589934
      298045653696DACEDA1428E15DE04D6A3BF6B1DFF8F93BB06C4BA00A7F040E81
      B9D47666D264025C00439FCACFAF6164785957525BBCC457C54C60171C2AB1B7
      211002FF8A3DB6C0DEF0180241F0C1C7F3D60734110882DF4F4FF0F3A80275E1
      9BF34602D1E0FB0884C27BC0EB6FF0BA0275E073022B54E04908D13FBD7E388C
      09AF23B094DA763D68150B1E2AB012422C589FE93930647D1C8DE1107619E552
      DB31FE56F3BDA15FE74DE02102EF428885D4F6B5D29B039834B970CECD80AB7D
      E121027752DB63A0FC982C58DF684FCEB95EA5DF9AC012380626C09D49939573
      AEEBC1B74DE12102B3FBE9C90438031E99BA6E0C681D811E3B2E92D60476FDC9
      FC57ECFA04FD24F5DE18BF9AA80000000049454E44AE426082FFFFFF1F044106
      000089504E470D0A1A0A0000000D494844520000002000000020080600000073
      7A7AF40000002C744558744372656174696F6E2054696D650057656420323620
      44656320323030372032303A31313A3439202D30303030995BAA010000000774
      494D4507D80910141420615FFD3D000000097048597300000EC200000EC20115
      284A800000000467414D410000B18F0BFC6105000005984944415478DAED564B
      6C1B55143DE3B1E37F1CDB69FC899334FF2A4DDA26FD8882F87451F193106C5A
      5109902A546001420209214151CB8675592058D01550B542E55BD34855532288
      9A8694A4691A274DD3F81F3BB16367C689EDF10C6FC64E14271EB720A46E7AAD
      F1B39FC7EF9C77CF3DF70DF0301EC6C378C041896F2F9F38243C10F0F9ED26E5
      EA97DD2DDDFF69114110C0F33C727CAE30F264CC1546F9F9A02704AD0E1665A9
      45795E00457253556B4685460583C9204B8017362C2EE447F162930C92090691
      A9707EC74A85042EDEBB1A9B08E4723CD91601AF33C36233CB038F2731F2B707
      7EDF1C1E7DBC1BDADD96227011A442A78645AB84A6428DC89D301826058A86F4
      FB6A2836EE5C04B7B5D4C06AB7C88227068212B85EAFC7E1C34F6370601491CB
      FE22F0F5D95056AA50D36487C1A0034D5EBC2C01B27B4BBD0546B3B1ACEE7766
      0210780ACDADF500ADC0FEFDBB7063C4232B853827E8015DAD01D94C56AA8B92
      0468255D94763E9CC4F4D834967C9122CD83812852CB2BB8313A8950701E8160
      045CAE18DC18A390988E43BB40E6848224956A2854C51928AE016A5D36C20C26
      024104BC3E44CC066CA37230D5DA2480963DAD981CF4C0556F87C3B985A82620
      93C9AC03A731190C20E40F205AA5475B530312FA7C36440869A4A8D245B81AD3
      E11086FB866176993136780B6A83065D8E2DD24E349D5A601060975288CC2DA0
      BF6F083B8EEE0217F6233335818E2D0AD4F309681A3858B5C409C1CB8866CDD0
      A875E84FAB904D576099529620B0AE1DEDDBD68DAB7DD730DCFB17BA0E76A1B6
      AA4A0267FC2B885E9F93EEB15A4DB0DBAAA5CF815E1F0E3A27E16CB2A0AB6727
      387D0B9489EBF9C59800B8740C8BFE697454A6D07F5B8DEFE2ED9B09E4B81CE2
      9145986BAAA0AEAEC4AB475FC18F177E42538B0B550D4E2975B36377119A0A61
      2E124392F8DC4924686B6FC4A467064CC52CBA9E398050E02E52B1DFC1C6C358
      49A530BB40C358A947A3AB1166DC44945112294A48A0505058F02E40A526D3A4
      F79C3A5383936FBD07DFCA485EDF088FC0B84FBAD75663C1F46D1F82A128DA5A
      EB9022404B6935464747E0686887A3DA8934330B5AC8A23936036129063E7D13
      E3711BB2D964E91A50104BE5381EE1C939D80D0E882C8E7F91C0F1635DF0AE0C
      932642A3F3B14E24E713520B36561B11641789B62AD27434D02AAC181AF6C334
      760B19D253D26960254B5CC0890EA3A0515512DBB1A4BB921A5A59E782EEB61E
      34399A0B752090DD0A60A3AC44E0F0B3ED38F995071F1FDB85E9CA21187718A1
      E3F56B3E8FF3AC541BEA470CA0FB433872E435CCFABC606221A41251A4979711
      88D3D01BB5A8B35B61C97A70717C9D0B0EBC7B45705F2DDB7724129F1212EFBC
      D88A3F477FD974B0AC7EAE21D53D399197A0CE655F93202B49300F3EEBC5386B
      83B0510211A05CDCBACB48F79CFAC183B79FDC0B53FC1C1469623355C1668B6C
      DE6666332E5DF1C06A988052457A435A909720B3A1118920F743E2B3B32CBEFF
      F07DD8F47350254BD86C6FDE66F6E64EF06C5856029AEE7C8AFC33A9C4BF0891
      C4D1433D78EE03377A4F6810B9E696B5D9BED61D3050265909C4D6F1EDE79FC4
      2402DE501AD74662F745E2ECF941FC7CB21E8ACC00EAB677CBDAECE2AFBF41C9
      B1F212B0F973682D03DA0AEA9EE0E31353F8F20DC0E3FE081EA4CB6ABCB5B11E
      EA8C5F560212FC1A81D367FE9005DDB3673BC0711822E7FFD76F66D053378798
      6E37E972E56DD6B2AD03265A5F4E024E22E0C8F5991CAD28F9F47161B461461C
      45F0AD968597BC57BF39EFE09BE1DCDA8EFABAF236BBE47683E6529B32148867
      2E3094EB1C792E49896B97CDBBE989D3828E3C5689E08DD6D8402BD7BB8F9C63
      AFB73BF1C2E64E070240C31F57F52628A73B4877F79325164A2C9B157D43AE14
      29C2EC3D0974B818099C7C9D2F4CEB209D1450CBFCAD08E05E7555D686CFEFF4
      9A0A4031B2D8EA73D452E1FA5FE21F49918FC04B0150220000000049454E44AE
      426082FFFFFF1F046002000089504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF4000000097048597300000EC300000EC301C76F
      A86400000212494441545885E596CD71DB3010469F332E801D84E980AA20E40D
      178CA50EEC0A1237005968C07205562A3033B8E026A503A503766076901C003A
      34CC1F90A64FD913C559ECF7B05CE103FCEF71119B28B54D806BE00AC8801AA8
      801F406994A83F0C406ABB061E81A427A502364689F3E2005EFC29A2560D1453
      213E8D8827C07D64AD04D7A549310800AC817442BDCC776C3180AF538ACD5933
      0690CE00C896049813D59200BF6600FC5E12E03003A05C0CC0285101BB09F576
      7E4D74C49E84F7C0F791B4BD51E2768A78348087C8816FB8B3A11D25F0609438
      45D6C97027EBC628718E065822BCF811776AD64031FA3794DAE652DBBB88BC3B
      DFA55E71EF138DA125C0536707A4B629B0C5B5BB59B0314A744E78605835EEB3
      BC0C647BE746890BA9ED1F9F57BC0190DA5EE30C28B4DE9351A2E801380279F0
      BA0656BE4ED376003C44F66606BCF890A315E1B0F9B61F3B726F8073284E60DB
      E10C8C59EF36F25D94F82B00BF93BE1B4F13797BD0FC731EE4448B035CB68B8F
      8837F128B55D35CFEF110F013E4702A4FCFBE6E97BC44380B42BA12742CF1F14
      67C0A297B80F8C89C3C03FAB0D507D90F8D1FF1E05D84D84288D1207DC093824
      5E01BD2EF902E08FCD15F1979007A9EDDA28F185D73B6C8B97B801ECEDC09017
      AC7137DC043774ED5D36B0CFC0C1287123B57DC6EDB4F46B4F319793D976EC1D
      B239056F8D12FB39752EC7537A630BEC819FB19791AEF80BD8CCCEDB1106DFD3
      0000000049454E44AE426082FFFFFF1F041B01000089504E470D0A1A0A000000
      0D4948445200000020000000200806000000737A7AF400000009704859730000
      0EC300000EC301C76FA864000000CD494441545885ED57DB0D83300CBC20C6F3
      008CC004640626201B9001BC9FFB031F54558989A92395932CE5238FCBE56C39
      4144E0897E1FC49C4C99CCC3185404B6452687C79C8AE776262756A007006696
      791803330B00101100DD4DAEAAD786024414624E62E5013581BB5092595F3D50
      8B3345634E8D7BA0D6139FB2E87D4F77053AE0E00130F3EF0978C2BD0EB4A180
      571D005A51E0AF3DF0D481C703878644D3039A1328EDE3ADA17A82BD5232B36C
      E3B3B025700B444415D3BA8815A6751177052EB5E596D912BCBFE72F0B64E570
      929E35BB0000000049454E44AE426082}
  end
  object UniImageListAdapter1: TUniImageListAdapter
    UniImageList = UniNativeImageList1
    Left = 96
    Top = 24
  end
end
