object FrmAssyTrack_ScheduleOnWorkCenter: TFrmAssyTrack_ScheduleOnWorkCenter
  Left = 244
  Top = 206
  ClientHeight = 281
  ClientWidth = 570
  Caption = 'Finite Schedule Process'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 240
    Width = 570
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 388
      Top = 1
      Width = 181
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 10
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 97
        Top = 10
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 570
    Height = 240
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    inline IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 568
      Height = 238
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 568
      ExplicitHeight = 238
      inherited PageControl: TUniPageControl
        Width = 568
        Height = 209
        ExplicitWidth = 568
        ExplicitHeight = 209
        inherited GridTab: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 560
          ExplicitHeight = 181
          inherited DBGrid: TUniDBGrid
            Width = 351
            Height = 152
            Columns = <>
          end
          inherited GridEditorsPanel: TUniHiddenPanel
            Left = 351
            Height = 152
            ExplicitLeft = 351
            ExplicitHeight = 152
          end
          inherited GridToolBar: TUniToolBar
            Width = 560
            ExplicitWidth = 560
          end
        end
        inherited FormTab: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 560
          ExplicitHeight = 181
        end
      end
      inherited TopToolBar: TUniToolBar
        Width = 568
        ExplicitWidth = 568
      end
      inherited ImgList: TUniNativeImageList
        Images = {
          0C000000FFFFFF1F049900000089504E470D0A1A0A0000000D49484452000000
          100000001008060000001FF3FF61000000097048597300000EC300000EC301C7
          6FA8640000004B49444154388D63601868C0C8C0C0C0505454F49F548D7D7D7D
          8C0C0C0C0C4C94BA806203181818205E40069B376FC6CB47F632C52E608131B6
          6CD9822241883FEA052A7A81E2A43CF000005FBCA0DF38F75F2F000000004945
          4E44AE426082FFFFFF1F04BA00000089504E470D0A1A0A0000000D4948445200
          0000100000001008060000001FF3FF61000000097048597300000EC300000EC3
          01C76FA8640000006C49444154388D63FCFFFF3F0325808922DD0C0C0C2C0C0C
          0C0C7ECD3BC972C6A65A77468A5D40B1010CFFFFFF67282A2AFA4F2A80EA8184
          012ED0D8D88855BCBEBE1ECE46310059034C11B2626C86A21880AE189F2BB01A
          80CFA9641930D2C2A0B8B898A0626C8091D2EC0C00A47660F25BD5D33D000000
          0049454E44AE426082FFFFFF1F04AF00000089504E470D0A1A0A0000000D4948
          4452000000100000001008060000001FF3FF61000000097048597300000EC300
          000EC301C76FA8640000006149444154388D63FCFFFF3F03258005C6282E2EC6
          6A526F6F2FA377DD26AC725B9BFC1859D014A328282E2E26DE05F8C0D6263F46
          BC06E0723E21390606060686FFFFFF33141515FD2707141515FD6722C60BF8C0
          A801A3063030A0E646B20C0000BDE4512706F208350000000049454E44AE4260
          82FFFFFF1F043801000089504E470D0A1A0A0000000D49484452000000100000
          001008060000001FF3FF61000000097048597300000EC300000EC301C76FA864
          000000EA49444154388DA593BD6DC33014843F05426A975E20BD536983B09256
          7036084CD5C203A5019C119C15548923B8F20059C05B9C2BCA3622C149740D09
          82F7C3C363268925785AC406F2B4A9BAF8AF288B132C16A06C874F4978EF4FFA
          23BCF7CA818FAA8BAB17288023B0B93508214C1A9B19702D71FBBD7A03284208
          A348BA94D629D124F0056CAB2ED29BFD4832972275204994ED7028DB41653B1C
          243D4B7AD849EA0080BE71EF5517199334AE008E2184CD94F15D071343742762
          66B3C5E67DE3B2F9078299BD4E1C8F869924CE7BF7EB315EEF629604EABABEFE
          85F52E3E249FF78E445C9A60C405D6E1B84A5BDA13F60000000049454E44AE42
          6082FFFFFF1F04BD00000089504E470D0A1A0A0000000D494844520000001000
          00001008060000001FF3FF61000000097048597300000EC300000EC301C76FA8
          640000006F49444154388DCD51410EC0200CA23E59DF51BEBC1D1613E76875A7
          8DC4C4D206B0025FC3C6A2D67AF43B495BF10050664577974E112F5D46B78897
          092297AC7F1368ADA502AA5F802BBE5257F1DDFDC63F96380FAF2097B40B9256
          222792D64F962C7DC20E7E22B0FAFF196FE7539CDC17345B4013AFE000000000
          49454E44AE426082FFFFFF1F040D01000089504E470D0A1A0A0000000D494844
          52000000100000001008060000001FF3FF61000000097048597300000EC30000
          0EC301C76FA864000000BF49444154388DA552C10D83300CBC20FE5DA1239429
          F240F50A9D2498904598C11252F3EB9B29BA08A28F928AB6242D701FCB967D3E
          F9ACC671C41EE4E4FC09C00DC0418C56E4FC2846ABCF4672FE6D53E8C9C2F056
          05D99EE1401005397FD94C40CE3380768A51E489CDF594D6E4FC7DAD82F6479E
          5630C792A5AB0800C05A1BFDB6A40B733033FAA1A07E28C0CC60E67504652504
          40362BE81A92AEA1AFFADF043184235A31BA06D2572F2B79C5A0469D9BEB11CF
          A7597C5B315AA55C7800411C3EFFCB0E2E8B0000000049454E44AE426082FFFF
          FF1F04D702000089504E470D0A1A0A0000000D49484452000000100000001008
          060000001FF3FF610000029E4944415478DA9D93CD4B14611CC7BFCFCCACAB90
          2BBBB3F49E11B45DFC03F61A418784A043A5C4CC96A1B3B9BA12168865D98B22
          F662C812E1A615BB5368854891870A32F0525058878E82D5415DA77517D775E7
          B5676633BCECC599790ECF6F7ECFE7F77D7E2FE4C8C9A1256CE25197F37E5D37
          09B101D5070FF186AA8110060C014C6B8327713E58D466D1D7F6F93D3DA504CF
          D5FB75D5621D404F4CF2D08DC97284DCBB2894456FC91AC714CFE754207E4970
          B5DF9155C384C9B260BBDAE2D981A792DF34693C1B707540E2D502FDE90279D0
          2990A65E191B01896E01913ED9D20D582E0ECCCD0B71E5FEA8B4958A2E0226E3
          E061193A2C8D13A29F210F06817F004B03C4F64F906341FB0E3AB573B561B732
          39A6F901160EE075E2307F34F44ED94C328B0A8659BEB6D1500E1C0FF1FC16A0
          A059281454701C8B3217BD170D6D5AE47F42398E501F1D5F655971007D3189EF
          8CC695E74F42BE99EF3FE0F37A4920B00FF3F329CCFDFC0596619D930C217631
          885A50F59A9A0044692CE30006620D7C7BF4B1F272B8DE273547EC2090930908
          62A8A4F4BBB7FBD170FE4D5141FF90E4ED08C7D313C9D3BED9D939545656921D
          3BB723FD278D85851418A69851BB0F4CC3C26A7ECD08ECAF664F855F1401EBD4
          D18775BE48A4C551904824100A9556D0DBD383E68EB70AF936331758CDAD796F
          0C4E4DBE92CFF2A9A525BDA2A29CF3783C5859C92193C9D2EE23CEB2680674DD
          423E5F3076EFE2D9BAA63185AC136D25CF864EF85A5BA38E2D994C4214C5920A
          AE777723DAF541219A6E70F45EE631716471426EF02E2EA474B7DBCD56557990
          CDAE20BD9CA105B00B496784F6B241576E75CDDCBB671B7BA66D3C4DEB420782
          10C35630FEA88E6F0CB738116459862008A57370ED0A9A2F7F5448DFC817A6AC
          A2DC7C3F31BDA9B1FE0BC4F6381BACBE77640000000049454E44AE426082FFFF
          FF1F047803000089504E470D0A1A0A0000000D49484452000000100000001008
          060000001FF3FF61000000017352474200AECE1CE90000000467414D410000B1
          8F0BFC6105000000206348524D00007A26000080840000FA00000080E8000075
          300000EA6000003A98000017709CBA513C000000097048597300000EC400000E
          C401952B0E1B000002E149444154384F8D534B48545118FEEE9D3BE3CC75C649
          2B351D07CB242B2A4451C4208908825AB470D52682A0A0161154206D2ACC85F4
          5845B589A44D24D83B2C3489243403B5AC311FF3141B0747E775E7BE3BE78C3D
          5CD57F398773CF39FFF7FFFFF77F87F3FBFD26CF7148A4D2D0340DFF63826081
          CBE984699AE082C18039371F85DD6E87DBED8685E7C093A169C6CAF5D566B55A
          B0188F239596505E5A02EECBC45753370C6CABD9025DD7B0B42C219D515151E6
          86A6AF06B1DBAD181C0A60F3C6F5588885404281575515F9A208599661158087
          3DA3683DDA05C16A033DFB3578DE442812C7C9B3DDF07D8FC25DE0CAED536493
          7C06C982C69B9C8AC15BBE06BD7D13B05979B64F28423C9EC5E9F33D3871AC09
          4D0D1E284A8EAF1C00B964212BDF648C909387CE2B87D0FD640CB2A2D253389D
          36DCB93F0C87C38EE347EA20493203A6960330D98C8E1B7D90640DBDFD3ECC2F
          64301358469E8DC7D3573E3C7E318ECB17F622939509C13A01604E1038921FAD
          6F369840209240E7A503844C1DA954164323611416D870F55A3FEEDE6C85D7E3
          8294557F07A4BEDCE8D8B8293AF2108C28486534B4347BA06B267EC43278F721
          8C81F733A8AC2842EDCE75A47D596CAF29C5D6EAB5988FC6FE90A8929ED7EE28
          C1EEC63264480B15554359493E59CBA4AD594C4EC748401B8A0A9D68BF3EC0F6
          A856A83100C3D0919555428EC2D2A7753F7B3D8D078FC6D075EB303A2EB680E3
          75446359E29C21AA9508E05F245242A92CE9B058382C2514DCBEF7116D675A90
          4C66D0D6FE1632A9BD7E573173A214183922409E01477E0C16996622491A4E9D
          7B8983FBABD1DC588C744A263D572112ED3F7F330551B4338E0CA25246229572
          2A9D46A5D7C31E93697218188C60DF9E4A02AA30B92E2E6BF8FC6D81F0221239
          3BB0A1D485B9B95938C57C70E170C81C1EF984A03F084F453943A50A54547DA5
          5D606559789E9548CDEF0FC1E3F5A2A1BE0EEC390B8280E9E91924534976E15F
          E672BA5055B58964ACE1279E8D7FDFFABBDA8F0000000049454E44AE426082FF
          FFFF1F049301000089504E470D0A1A0A0000000D494844520000001000000010
          0804000000B5FA37EA0000000273424954080855EC4604000000097048597300
          0004B6000004B601672F633D0000001974455874536F66747761726500777777
          2E696E6B73636170652E6F72679BEE3C1A0000011249444154181905C131880D
          000080E1EF5247B944B98191E59294C92D2C0626D47551EE4CB79C4589BAA423
          6FB058B030DCB9C97683D5209358C8A04C32DCE92C575E52F786FB7D9F244992
          24B1603D91244992C48C5D234722C6CDBAEF8653C692C45DC9C83A877D97249F
          5D48CCF92BD9B5C01379E8A4F306FE183AEEA564E88E99B0E5634C58F6C8B433
          06925C4BC20FEFE39664D3941DC98B24E193DFF69897AC58951D03C792849B72
          D5A42D59F2DCAA29D386CE2661BF6D5FED75D1AE0D4B566CBAEC9FB749C4A2BC
          8A654932F04C4E27126BF220660C258F9D93EB89C43E1FE48D430E9AB368C209
          B99D4862DC53F969D681C43DB9944892B8625B46DEF9265F8C2592243169DE9A
          0DBFBC7634C97F6BE6C03B371D0F9F0000000049454E44AE426082FFFFFF1F04
          9001000089504E470D0A1A0A0000000D49484452000000100000001008060000
          001FF3FF610000000473424954080808087C0864880000000970485973000003
          7600000376017DD582CC0000001974455874536F667477617265007777772E69
          6E6B73636170652E6F72679BEE3C1A0000010D49444154388DA5D3B14E954114
          04E06F08465B3B8D113B135EC0572070B1B021A12631F00256BE0325B1B6B096
          C6D0F204B650118DA5151591646C7ECCE5DEFB5F889C6493DDCCCE9C73E6ECA6
          AD87C4EA5D1792ECE2F570BCC6E7B63F6EF09525C447490E718E635CE0083B49
          DEDE29807738C404AF708AF7F88EF5246BA0EDDC1A5ADB5B840DF8637C6C3B5A
          C173FC1E2BADEDD59064B140DB9F78B2A4BD7FB1CC83F53120C91B9C8D0A24D9
          C6B3241F16602FB0DBF60B64F621259960ADED51924FF83564BBC2535CE26BDB
          3F30EBEE160E86FD01B6A7B097589D9BC8D485CD19F2646C8C7302D8C0FE1479
          EB3EE4B6B7FF42927D5CB4FD36368139536F4C4CB2317872725FF22D81FF8DBF
          79D9CDAAE6A330090000000049454E44AE426082FFFFFF1F04A001000089504E
          470D0A1A0A0000000D49484452000000100000001008060000001FF3FF610000
          000473424954080808087C08648800000009704859730000005700000057010E
          14E5780000001974455874536F667477617265007777772E696E6B7363617065
          2E6F72679BEE3C1A0000011D49444154388DC5D1BD2EED511005F0DF3E41DC1C
          213E1AC589422151284878039D44AB260AA58647F0040AD17901894E755A0585
          44A1905051B8570889288C66AEFC8F8F73A232C94A66CF5A6BF6ECD925229452
          7A318F058C61A402B8ADE00A07388C88E782011C631CF738C15FDCE15F3618C2
          2086319D9E0BCC74612DCD97D8C65187067315CF5A17BA53D4832DD4B48F57DC
          64DE5D30994FD8C70AA630817EF4A5F0110F38C72976B188191101EB082C4784
          76C0726AD723C2FF6241134F986D639E4D4D13E5BD41920D9CE1059BA855B85A
          D65E52D378E73EDC50C75E8ED8CCCD0F661EC9D55B3CDF8CBA9A868D4460F52B
          ED975F16113B99FE49546B2DD1E9CF3BC6EF3728B9B4CF44294FB8CEE36844D4
          7F3AC1D237794BBC01E5FFC13EABCA45470000000049454E44AE426082FFFFFF
          1F041D01000089504E470D0A1A0A0000000D4948445200000010000000100806
          0000001FF3FF610000000473424954080808087C086488000000097048597300
          00007400000074013185E5810000001974455874536F66747761726500777777
          2E696E6B73636170652E6F72679BEE3C1A0000009A49444154388DED93310EC2
          300C459FABAE8CB950A79CA5D761E31E08212E10711896AE48666883DC282E3E
          00963CE4C7FFC9C337AA4A6D60B6EFB681049C81F4D59A81F2C3FC045E40A990
          10C098F3669E2A240A7800D9CE6C907B1430F66680D340A054F5EDE84B087054
          7F000C2232F63E3CBDB7C15544A6C69C815B748BC43E9E9935B6C909D52E6C36
          EB85F5505CB30B3090CB91B977F21F49B7153158E1E79A0000000049454E44AE
          426082}
      end
    end
  end
  object SrcWorkCenter: TDataSource
    DataSet = QryWorkCenter
    Left = 43
    Top = 76
  end
  object QryWorkCenter: TFDQuery
    BeforeOpen = QryWorkCenterBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       w.cntr_type,'
      '       w.mfgcell,'
      '       w.mfg_type,'
      '       w.eplant_id,'
      
        '       (select nvl(min(prod_start_time), sysdate) from cntr_sche' +
        'd where work_center_id = w.id) as date_1st_job,'
      
        '       (select nvl(max(prod_end_time), sysdate) from cntr_sched ' +
        'where work_center_id = w.id) as date_available,'
      
        '       (select min(seq) from sndop_runs_best where sndop_id = :s' +
        'ndop_id and work_center_id_act = w.id) as runs_best_seq,'
      
        '       (select max(performance) from sndop_runs_best where sndop' +
        '_id = :sndop_id and work_center_id_act = w.id) as runs_best_perf' +
        'ormance'
      '  from '
      '       work_center w,'
      '  '
      '      ( select count(*) as associated_work_centers_count'
      '          from '
      
        '              ( select workcenter_id from sndop_workcenter where' +
        ' sndop_id = :sndop_id'
      '                 union'
      
        '                select work_center_id_act from sndop_runs_best w' +
        'here sndop_id = :sndop_id )) x'
      ' where '
      '       misc.eplant_filter( w.eplant_id ) = 1'
      '   and nvl(w.pk_hide, '#39'N'#39') = '#39'N'#39
      ''
      
        '   and (   x.associated_work_centers_count = 0 and mfg.lookup_mf' +
        'gtype(w.mfg_type) in ('#39'ASSY1'#39') '
      '         or'
      '           x.associated_work_centers_count > 0 '
      '           and '
      
        '           exists ( select workcenter_id from sndop_workcenter w' +
        'here sndop_id = :sndop_id and workcenter_id = w.id '
      '                     union'
      
        '                    select work_center_id_act from sndop_runs_be' +
        'st where sndop_id = :sndop_id and work_center_id_act = w.id ))'
      ''
      '   and (   :assyline_work_center_id = 0'
      '         or'
      
        '           :assyline_work_center_id > 0 and w.assy_parent_id = :' +
        'assyline_work_center_id )'
      '')
    Left = 43
    Top = 94
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'assyline_work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 13
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      FixedChar = True
      Size = 60
    end
    object QryWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      DisplayWidth = 30
      FieldName = 'CNTR_DESC'
      Origin = 'w.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object QryWorkCenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Origin = 'w.CNTR_TYPE'
      FixedChar = True
    end
    object QryWorkCenterMFGCELL: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'w.mfgcell'
      FixedChar = True
      Size = 15
    end
    object QryWorkCenterEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Size = 0
    end
    object QryWorkCenterDATE_AVAILABLE: TDateTimeField
      DisplayLabel = 'Date Available'
      DisplayWidth = 21
      FieldName = 'DATE_AVAILABLE'
      Origin = 
        '(select nvl(max(prod_end_time), sysdate) from cntr_sched where w' +
        'ork_center_id = w.id)'
    end
    object QryWorkCenterRUNS_BEST_SEQ: TFMTBCDField
      DisplayLabel = 'Runs The Best #'
      DisplayWidth = 15
      FieldName = 'RUNS_BEST_SEQ'
      Origin = 
        '(select min(seq) from sndop_runs_best where sndop_id = :sndop_id' +
        ' and work_center_id_act = w.id)'
      Size = 38
    end
    object QryWorkCenterRUNS_BEST_PERFORMANCE: TFMTBCDField
      DisplayLabel = 'Runs The Best %'
      DisplayWidth = 14
      FieldName = 'RUNS_BEST_PERFORMANCE'
      Origin = 
        '(select max(performance) from sndop_runs_best where sndop_id = :' +
        'sndop_id and work_center_id_act = w.id)'
      Size = 38
    end
    object QryWorkCenterMFG_TYPE: TStringField
      DisplayLabel = 'MfgType'
      DisplayWidth = 11
      FieldName = 'MFG_TYPE'
      Origin = 'w.mfg_type'
      FixedChar = True
      Size = 10
    end
    object QryWorkCenterID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryWorkCenterDATE_1ST_JOB: TDateTimeField
      FieldName = 'DATE_1ST_JOB'
      Visible = False
    end
  end
end
