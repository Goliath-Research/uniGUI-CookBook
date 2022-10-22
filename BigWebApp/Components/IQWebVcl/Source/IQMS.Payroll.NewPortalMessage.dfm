object frmNewPortalMsg: TfrmNewPortalMsg
  Left = 0
  Top = 0
  ClientHeight = 470
  ClientWidth = 614
  Caption = 'Send New Message'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TUniPageControl
    Left = 0
    Top = 27
    Width = 614
    Height = 443
    Hint = ''
    ActivePage = tabNewMsg
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tabNewMsg: TUniTabSheet
      Hint = ''
      Caption = 'Send New Message'
      object pnlLeft: TUniPanel
        Left = 0
        Top = 0
        Width = 80
        Height = 415
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label1: TUniLabel
          Left = 3
          Top = 37
          Width = 12
          Height = 13
          Hint = ''
          Caption = 'To'
          TabOrder = 1
        end
        object Label2: TUniLabel
          Left = 3
          Top = 64
          Width = 36
          Height = 13
          Hint = ''
          Caption = 'Subject'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 3
          Top = 92
          Width = 69
          Height = 13
          Hint = ''
          Caption = 'Attachment(s)'
          TabOrder = 3
        end
        object Label4: TUniLabel
          Left = 3
          Top = 128
          Width = 22
          Height = 13
          Hint = ''
          Caption = 'Text'
          TabOrder = 4
        end
        object Bevel1: TUniPanel
          Left = 1
          Top = 1
          Width = 78
          Height = 2
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Caption = ''
        end
      end
      object pnlMain: TUniPanel
        Left = 80
        Top = 0
        Width = 526
        Height = 415
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object pnlParams: TUniPanel
          Left = 1
          Top = 1
          Width = 524
          Height = 413
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object pnlEmailParams: TUniPanel
            Left = 1
            Top = 1
            Width = 522
            Height = 130
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              522
              130)
            object sbtnAssignEmailTo: TUniSpeedButton
              Left = 495
              Top = 32
              Width = 25
              Height = 22
              Hint = 'Add '#39'To'#39' Address'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
                90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
                40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
                00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
                E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
                90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
                00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
                E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
                B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
                00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
                E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
                B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
                00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
                F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
                B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
                00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
                A068509050308048308048208038108F4C26B08870A068509058309048308040
                20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
                4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
                FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
                50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
                B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
                F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
                50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
                57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
                C09880B08060A068509050309058409D6842B07860B08870A070508048308048
                20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
                67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
                C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
                20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
                00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
                CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
                37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
                00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
                00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
                00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Anchors = [akTop, akRight]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnAssignEmailToClick
            end
            object sbtAttachments: TUniSpeedButton
              Left = 495
              Top = 90
              Width = 25
              Height = 25
              Hint = 'Select files to attach to message'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF70889060809060788050708050607040586040485030
                3840203030202030101820101010101020FF00FFFF00FFFF00FF70889090A0B0
                70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
                60AE9783FF00FFFF00FF80889080C0D090A8B080E0FF60D0FF50C8FF50C8FF40
                C0F030B0F030A8F020A0E01090D0206880615A57FF00FFFF00FF8090A080D0F0
                90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
                D0204860D8BBA5FF00FF8090A080D8F080C8E090A8B080E0FF70D0FF60D8FF60
                D0FF60D0FF50C8FF40C0F040B8F030B0F0206880748588FF00FF8098A090E0F0
                90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
                F030A0E04A6774D9C3B48098A090E0F0A0E8FF80C8E090A8B080E0FF80E0FF80
                E0FF80E0FF80E0FF80E0FF80E0FF70D8FF70D8FF50A8D090909190A0A0A0E8F0
                A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
                A08090A080889070889090A0B0A0E8F0A0F0FFA0E8FFA0E8FF80D8FF60D8FF60
                D8FF60D8FF60D8FF60D8FF60D8FF708890FF00FFFF00FFFF00FF90A0B0A0F0F0
                B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
                90FF00FFFF00FFFF00FF90A8B0A0D0E0B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BD
                C5BFFF00FFFF00FFFF00FFFF00FFFF00FF906850906850906850DAD1C690A8B0
                90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFDFC2B2906850906850FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FF907860D3B6A1FF00FFF7DFCCA09080DFC8B3907860FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
                80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Anchors = [akTop, akRight]
              ParentColor = False
              Color = clWindow
              OnClick = sbtAttachmentsClick
            end
            object Bevel2: TUniPanel
              Left = 1
              Top = 1
              Width = 520
              Height = 2
              Hint = ''
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 6
              Caption = ''
            end
            object edtTo: TUniEdit
              Left = 1
              Top = 33
              Width = 486
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              ReadOnly = True
            end
            object edtSubject: TUniEdit
              Left = 1
              Top = 60
              Width = 486
              Height = 21
              Hint = ''
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object memAttachFiles: TUniMemo
              Left = 1
              Top = 87
              Width = 486
              Height = 35
              Hint = ''
              ScrollBars = ssVertical
              Anchors = [akLeft, akTop, akRight]
              ReadOnly = True
              TabOrder = 2
            end
          end
          object MemMessage: TUniMemo
            Left = 1
            Top = 130
            Width = 522
            Height = 283
            Hint = ''
            ScrollBars = ssVertical
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
          end
        end
      end
    end
    object hiddenlists: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'hiddenlists'
      object pnlTo: TUniPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 150
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object GroupBox1: TUniGroupBox
          Left = 1
          Top = 1
          Width = 604
          Height = 148
          Hint = ''
          Caption = 'To List'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object F_To_List: TUniMemo
            Left = 2
            Top = 15
            Width = 600
            Height = 131
            Hint = ''
            ScrollBars = ssVertical
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object pnlAttach: TUniPanel
        Left = 0
        Top = 150
        Width = 606
        Height = 150
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object GroupBox2: TUniGroupBox
          Left = 1
          Top = 1
          Width = 604
          Height = 148
          Hint = ''
          Caption = 'Attachments List'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object F_Attach_list: TUniMemo
            Left = 2
            Top = 15
            Width = 600
            Height = 131
            Hint = ''
            ScrollBars = ssBoth
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object pnlSpeed: TUniPanel
    Left = 0
    Top = 0
    Width = 614
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object sbtSendMesg: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 125
      Height = 25
      Hint = ''
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF20A02D1FA02CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF20A02D44EE7541FF7D1FA02CFF00
        FFFF00FFFF00FFFF00FFFF00FFCCA589C4A07CBD9770BD9770BD9770BD97701F
        A02C27F54B2DFF5948E8793EFF711FA02CC09972C49B78FF00FFFF00FFCDAB8C
        D8BEA2EFE4D8EADCCCE6D5C220A02D27F54B23E5421FA02C20A02D40E26D32FF
        621FA02CBC9870FF00FFFF00FFD4B59CD7BDA0DEC4B0F0E6DBECDFD0ECDDCF20
        A02D20A02DECDDCFECDDCF1FA02C4BFF8C26FF4B1FA02CFF00FFFF00FFD7B9A1
        E0CFB7DBC6ACDEC5B0F5EDE6F4EAE0F3EAE0F3EAE0F3EAE0ECDFD1D5BA9F1FA0
        2C3EFF7A25FF4B1FA02CFF00FFD7B8A2EEE0D5ECDDCFE8D8C7E3CBBBF6EEE9DC
        C3AED9C0A9EEE2D7D9BFA5E9D9C8E8D8C81FA02C46FF8220A02DFF00FFD7B9A3
        F5EDE4F4ECE3F4ECE3F4EAE0DCC1ADE7D7C9E6D7C5D4B79BF2E8DEF3EAE0F3EA
        E0F3EAE01FA02DFF00FFFF00FFD8B9A4F9F4EEF9F4EFF9F4EFE4CEBCEDE0D4EF
        E5DAECDCCFE7D8C6D9BDA4F8F3EDF8F3EDF8F2ECD1B295FF00FFFF00FFE0C5B4
        FBF9F5FBF9F5E5D0C1F0E7DDF2EAE0F1E8DDF1E8DDF1E8DDEBDECFDEC4AFF8F2
        ECF7F1EADCC3ABFF00FFFF00FFE0C5B4FDFBFAE8D4C6EFE4D9F6F2ECF7F0EAF7
        F0EAF7F0EAF7F0EAF6EFE9EDE4D3E1CAB7F3EDE2E1CAB6FF00FFFF00FFE0C5B5
        E8D7C9EFE4DAF7F3EDF9F4EFF9F4EFF9F4EFF9F4EFF9F4EFF9F4EFF7F4EEECE2
        D3E3CEBBE5D0C1FF00FFFF00FFDEC2B0EADDD0F3EEE5F1EAE3F1EAE3F1EAE3F1
        EAE3F1EAE3F1EAE3F1EAE3F1EAE3F0EAE2E4D8C5DFC5B3FF00FFFF00FFDAB8A5
        DCBEABDCBEADDCBEADDCBEADDCBEADDCBEADDCBEADDCBEADDCBEADDCBEADDCBE
        ADDCBDABD6B29DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = '&Send Message'
      ParentColor = False
      Color = clWindow
      OnClick = sbtSendMesgClick
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 359
    Top = 5
    object File1: TUniMenuItem
      Caption = 'File'
      object ViewSentMessages1: TUniMenuItem
        Caption = '&View Sent Messages'
        OnClick = ViewSentMessages1Click
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmNewPortalMsg'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190887 $'
    BuildVersion = '176554'
    Left = 523
    Top = 2
  end
  object PkTo: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select p.id                  as id              ,'
      '       p.empno               as empno           ,'
      
        '       substrB( iqstring.concat3w( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as full_name,'
      '       p.first_name          as first_name      ,'
      '       p.middle_name         as middle_name     ,'
      '       p.last_name           as last_name       ,'
      '       p.addr1               as addr1           ,'
      '       p.addr2               as addr2           ,'
      '       p.state               as state           ,'
      '       p.country             as country         ,'
      '       p.zip                 as zip             ,'
      '       p.phone_number        as phone_number    ,'
      '       p.city                as city            ,'
      '       p.charge_rate         as charge_rate     ,'
      '       p.status_code         as status_code     ,'
      '       p.date_hired          as date_hired      ,'
      '       p.termination_date    as termination_date,'
      '       p.last_review_date    as last_review_date,'
      '       p.next_review_date    as next_review_date,'
      '       nvl(p.pk_hide, '#39'N'#39') as pk_hide         ,'
      '       case'
      
        '         when NVL(p.country, '#39'USA'#39') = '#39'USA'#39' then Decode(length(p' +
        '.ssnmbr), 9, SubStr(p.ssnmbr, 1, 3) || '#39'-'#39' || SubStr(p.ssnmbr, 4' +
        ', 2) || '#39'-'#39' || SubStr(p.ssnmbr, 6, 4), p.ssnmbr)'
      
        '         when NVL(p.country, '#39'USA'#39') = '#39'UNITED STATES'#39' then Decod' +
        'e(length(p.ssnmbr), 9, SubStr(p.ssnmbr, 1, 3) || '#39'-'#39' || SubStr(p' +
        '.ssnmbr, 4, 2) || '#39'-'#39' || SubStr(p.ssnmbr, 6, 4), p.ssnmbr)'
      
        '         else Decode(length(p.ssnmbr), 9, SubStr(p.ssnmbr, 1, 3)' +
        ' || '#39'-'#39' || SubStr(p.ssnmbr, 4, 3) || '#39'-'#39' || SubStr(p.ssnmbr, 7, ' +
        '3), p.ssnmbr)'
      '       end as ssnmbr'
      ' from pr_emp p,'
      '       pr_paygroup g,'
      '       pr_department d,'
      '       pr_emp s,'
      '       division n'
      ' where p.pr_paygroup_id = g.id(+)'
      '   and p.supervisor_id = s.id(+)'
      '   and p.pr_department_id = d.id(+)'
      '   and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      '   and g.division_id = n.id(+)'
      '   and (p.pr_paygroup_id is null'
      '        or p.pr_paygroup_id in (select pr_paygroup_id'
      '                                  from s_user_paygroup'
      
        '                                 where misc.GetUserName = user_n' +
        'ame))')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 474
    Top = 3
    object PkToID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkToEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PkToFULL_NAME: TStringField
      DisplayLabel = 'Full Name'
      FieldName = 'FULL_NAME'
      Size = 255
    end
    object PkToFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object PkToMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object PkToLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PkToADDR1: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkToADDR2: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkToSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkToZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkToPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone Number'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkToCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkToCHARGE_RATE: TBCDField
      DisplayLabel = 'Charge Rate'
      FieldName = 'CHARGE_RATE'
      Size = 2
    end
    object PkToSTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      FieldName = 'STATUS_CODE'
      Size = 10
    end
    object PkToDATE_HIRED: TDateTimeField
      DisplayLabel = 'Date Hired'
      FieldName = 'DATE_HIRED'
    end
    object PkToTERMINATION_DATE: TDateTimeField
      DisplayLabel = 'Termination Date'
      FieldName = 'TERMINATION_DATE'
    end
    object PkToLAST_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Last Review Date'
      FieldName = 'LAST_REVIEW_DATE'
    end
    object PkToNEXT_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Next Review Date'
      FieldName = 'NEXT_REVIEW_DATE'
    end
    object PkToPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object PkToSSNMBR: TStringField
      DisplayLabel = 'Social Security #'
      FieldName = 'SSNMBR'
      Size = 11
    end
  end
  object UniFileUpload1: TUniFileUpload
    OnCompleted = UniFileUpload1Completed
    Title = 'Upload'
    Messages.Uploading = 'Uploading...'
    Messages.PleaseWait = 'Please Wait'
    Messages.Cancel = 'Cancel'
    Messages.Processing = 'Processing...'
    Messages.UploadError = 'Upload Error'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Please Select a File'
    Messages.BrowseText = 'Browse...'
    Left = 304
    Top = 248
  end
end
