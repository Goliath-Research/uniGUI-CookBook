inherited FrmDispoCust: TFrmDispoCust
  Left = 93
  Top = 95
  ClientHeight = 361
  ClientWidth = 784
  Caption = 'FrmDispoCust'
  ExplicitWidth = 800
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 784
    Height = 361
    ExplicitWidth = 784
    ExplicitHeight = 361
    inherited Panel2: TUniPanel
      Top = 321
      Width = 782
      ExplicitTop = 321
      ExplicitWidth = 782
      inherited Panel3: TUniPanel
        Left = 572
        ExplicitLeft = 572
      end
    end
    inherited PnlCarrier: TUniPanel
      Width = 782
      Height = 320
      ExplicitWidth = 782
      ExplicitHeight = 320
      inherited SplitterCarrierLeft01: TUniSplitter
        Left = 267
        Width = 5
        Height = 318
        ExplicitLeft = 267
        ExplicitTop = 0
        ExplicitWidth = 5
        ExplicitHeight = 318
      end
      inherited ScrollBoxCarrierLeft01: TUniScrollBox
        Width = 266
        Height = 318
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 266
        ExplicitHeight = 318
        ScrollHeight = 326
        inherited pnlCarrierLeft01: TUniPanel
          Width = 247
          Height = 326
          ExplicitWidth = 247
          ExplicitHeight = 326
          DesignSize = (
            247
            326)
          inherited Label1: TUniLabel
            Left = 7
            Top = 80
            ExplicitLeft = 7
            ExplicitTop = 80
          end
          inherited Label2: TUniLabel
            Left = 7
            Top = 11
            ExplicitLeft = 7
            ExplicitTop = 11
          end
          inherited Label3: TUniLabel
            Left = 7
            Top = 103
            ExplicitLeft = 7
            ExplicitTop = 103
          end
          inherited Label4: TUniLabel
            Left = 7
            Top = 34
            Width = 53
            Caption = 'Description'
            ExplicitLeft = 7
            ExplicitTop = 34
            ExplicitWidth = 53
          end
          object lblExtDesc: TUniLabel [4]
            Left = 7
            Top = 57
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'Ext Description'
            TabOrder = 12
          end
          inherited lblUnit: TUniLabel
            Left = 7
            Top = 126
            ExplicitLeft = 7
            ExplicitTop = 126
          end
          inherited DBEdit1: TUniDBEdit
            Left = 95
            Top = 77
            Width = 80
            ExplicitLeft = 95
            ExplicitTop = 77
            ExplicitWidth = 80
          end
          inherited DBEdit2: TUniDBEdit
            Left = 95
            Top = 8
            Width = 163
            Anchors = [akLeft, akTop, akRight]
            ExplicitLeft = 95
            ExplicitTop = 8
            ExplicitWidth = 163
          end
          inherited DBEdit3: TUniDBEdit
            Left = 95
            Top = 100
            Width = 80
            ExplicitLeft = 95
            ExplicitTop = 100
            ExplicitWidth = 80
          end
          inherited DBEdit4: TUniDBEdit
            Left = 95
            Top = 31
            Width = 163
            Anchors = [akLeft, akTop, akRight]
            ExplicitLeft = 95
            ExplicitTop = 31
            ExplicitWidth = 163
          end
          inherited dbeUNIT: TUniDBEdit
            Left = 95
            Top = 123
            Width = 80
            ExplicitLeft = 95
            ExplicitTop = 123
            ExplicitWidth = 80
          end
          object dbeExtDescription: TUniDBEdit
            Tag = 1
            Left = 95
            Top = 54
            Width = 163
            Height = 19
            Hint = ''
            DataSource = SrcMaster
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            Color = clBtnFace
            ReadOnly = True
          end
        end
      end
      inherited pnlCarrierClient01: TUniPanel
        Left = 272
        Width = 509
        Height = 318
        ExplicitLeft = 272
        ExplicitWidth = 509
        ExplicitHeight = 318
        inherited Splitter1: TUniSplitter
          Top = 139
          Width = 507
          ExplicitLeft = 0
          ExplicitTop = 139
          ExplicitWidth = 507
        end
        inherited PageControl1: TUniPageControl
          Width = 507
          Height = 138
          ExplicitWidth = 507
          ExplicitHeight = 138
          inherited TabSheet1: TUniTabSheet
            ExplicitWidth = 499
            ExplicitHeight = 128
            inherited Panel1: TUniPanel
              Width = 499
              Height = 110
              ExplicitWidth = 499
              ExplicitHeight = 110
              inherited bvAddTo: TUniPanel
                Width = 497
                ExplicitTop = 47
                ExplicitWidth = 497
              end
              inherited Panel5: TUniPanel
                Width = 497
                ExplicitTop = 20
                ExplicitWidth = 497
                inherited DBNavigator1: TUniDBNavigator
                  Left = 371
                  ExplicitLeft = 371
                end
              end
              inherited gridTargetLoc: TUniDBGrid
                Width = 497
                Height = 58
                Columns = <
                  item
                    Title.Caption = 'Location'
                    Width = 64
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    Title.Caption = 'Lot'
                    Width = 91
                    CheckBoxField.FieldValues = 'true;false'
                  end
                  item
                    Title.Caption = 'Quantity'
                    Width = 106
                    CheckBoxField.FieldValues = 'true;false'
                  end>
              end
              inherited PnlAddToCaption: TUniPanel
                Width = 497
                ExplicitWidth = 497
              end
            end
          end
        end
        inherited Panel4: TUniPanel
          Top = 142
          Width = 507
          Height = 175
          ExplicitTop = 142
          ExplicitWidth = 507
          ExplicitHeight = 175
          inherited Splitter2: TUniSplitter
            Height = 173
            ExplicitLeft = 239
            ExplicitTop = 0
            ExplicitHeight = 173
          end
          inherited Panel7: TUniPanel
            Height = 173
            ExplicitHeight = 173
            inherited bvMaterialsInvolved: TUniPanel
              ExplicitTop = 47
            end
            inherited gridMatReq: TUniDBGrid
              Height = 121
              Columns = <
                item
                  Title.Caption = 'Class'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Item #'
                  Width = 67
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Description'
                  Width = 61
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Quantity'
                  Width = 50
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'RG Quantity'
                  Width = 68
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Revision'
                  Width = 63
                  ReadOnly = True
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            inherited Panel11: TUniPanel
              ExplicitTop = 20
              inherited DBNavigator3: TUniDBNavigator
                ExplicitLeft = 112
              end
            end
          end
          inherited Panel9: TUniPanel
            Width = 233
            Height = 173
            ExplicitLeft = 272
            ExplicitWidth = 233
            ExplicitHeight = 173
            inherited bvRelieve: TUniPanel
              Width = 231
              ExplicitTop = 47
              ExplicitWidth = 231
            end
            inherited Panel10: TUniPanel
              Width = 231
              ExplicitTop = 20
              ExplicitWidth = 231
              inherited DBNavigator2: TUniDBNavigator
                Left = 105
                ExplicitLeft = 105
              end
            end
            inherited gridMatLoc: TUniDBGrid
              Width = 231
              Height = 121
              Columns = <
                item
                  Title.Caption = 'Location'
                  Width = 64
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Lot'
                  Width = 35
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'Quantity'
                  Width = 47
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  Title.Caption = 'RG Quantity'
                  Width = 76
                  CheckBoxField.FieldValues = 'true;false'
                end>
            end
            inherited PnlRelieveCaption: TUniPanel
              Width = 231
              ExplicitWidth = 231
            end
          end
          inherited Panel8: TUniPanel
            Height = 173
            ExplicitLeft = 245
            ExplicitHeight = 173
            inherited sbtnLeft: TUniSpeedButton
              Top = 96
              Hint = 'Remove selected material'
              ShowHint = True
              ParentShowHint = False
              ExplicitTop = 96
            end
            inherited sbtnRight: TUniSpeedButton
              Top = 64
              Hint = 'Relieve selected material'
              ShowHint = True
              ParentShowHint = False
              ExplicitTop = 64
            end
          end
        end
      end
    end
  end
  inherited SrcDetail: TDataSource
    OnDataChange = SrcDetailDataChange
  end
  inherited SrcDetailLoc: TDataSource
    OnDataChange = SrcDetailLocDataChange
  end
  inherited TblDetailLoc: TFDTable
    AfterPost = TblDetailLocAfterPost
    IndexFieldNames = 'ID;ID;ID;ID'
  end
  inherited SR: TIQWebSecurityRegister
    Left = 180
    Top = 76
  end
  object PkArinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip,'
      '       descrip2'
      '  from arinvt      '
      '           ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 40
    Top = 288
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  object PkMasterFGMulti: TIQWebHpick
    BeforeOpen = PkMasterFGMultiBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       loc.loc_desc as loc_desc,'
      '       f.lotno as lotno,'
      '       nvl(f.onhand, 0) as onhand,'
      '       nc.descrip as non_conform,'
      '       loc.VMI as VMI,'
      '       loc.division_id,'
      '       div.name as division_name,'
      ''
      
        '       case (select upper(source) from v_fgmulti_allocated where' +
        ' fgmulti_id = f.id)'
      
        '         when '#39'workorder_bom_mat_loc'#39' then (select '#39'WO# '#39' || b.w' +
        'orkorder_id'
      
        '                                              from workorder_bom' +
        '_mat_loc m, '
      
        '                                                   workorder_bom' +
        ' b'
      
        '                                             where m.fgmulti_id ' +
        '= f.id'
      
        '                                               and m.workorder_b' +
        'om_id = b.id)'
      '         when '#39'fab_lot_mat_loc'#39' then (select '#39'Lot# '#39' || d.lotno '
      '                                         from fab_lot_mat_loc l,'
      '                                              fab_lot_mat a,'
      '                                              fab_lot_process b,'
      '                                              fab_lot_wo c,'
      '                                              fab_lot d'
      
        '                                        where l.fgmulti_id = f.i' +
        'd'
      
        '                                          and l.fab_lot_mat_id =' +
        ' a.id'
      
        '                                          and a.fab_lot_process_' +
        'id = b.id'
      
        '                                          and b.fab_lot_wo_id = ' +
        'c.id'
      
        '                                          and c.fab_lot_id = d.i' +
        'd )'
      '        else'
      '          null '
      '        end as hard_allocated_to,'
      ''
      
        '        decode( (select source from v_fgmulti_allocated where fg' +
        'multi_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) as is_hard_alloc,'
      ''
      '        f.non_conform_id as non_conform_id,'
      '        f.non_allocate_id as non_allocate_id,'
      
        '        f.shipment_dtl_id_in_transit as shipment_dtl_id_in_trans' +
        'it,'
      '        f.make_to_order_detail_id as make_to_order_detail_id,'
      '        f.lot_date as lot_date,'
      
        '        (select shelf_life from arinvt where id = f.arinvt_id) a' +
        's shelf_life,'
      
        '        case (select count(id) from arinvt_lot_docs where arinvt' +
        '_id = f.arinvt_id and trim(lotno) = trim(f.lotno))     '
      '          when 0 then'
      
        '            (select country from vendor where id = :AVendorId an' +
        'd :AVendorId <> 0) '
      '          else'
      
        '            (select country from arinvt_lot_docs where arinvt_id' +
        ' = f.arinvt_id and trim(lotno) = trim(f.lotno) and rownum < 2)  ' +
        '             '
      '          end as country  '
      ''
      '        '
      '-- HPICK_FROM_START'
      ''
      '  from fgmulti f,'
      '       locations loc,'
      '       non_conform nc,'
      '       division div'
      ' where f.loc_id = loc.id'
      '   and arinvt_id = :arinvt_id'
      '   and f.non_conform_id = nc.id(+)'
      '   and ( NVL(loc.VMI, '#39'N'#39')  = :AVMI or 1 = :ADummy)'
      '   and loc.division_id = div.id(+)')
    OnIQModify = PkMasterFGMultiIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 80
    Top = 240
    ParamData = <
      item
        Name = 'AVendorId'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AVMI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkMasterFGMultiFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object PkMasterFGMultiLOTNO: TStringField
      DisplayLabel = 'Lot#'
      FieldName = 'LOTNO'
      Size = 25
    end
    object PkMasterFGMultiONHAND: TFMTBCDField
      DisplayLabel = 'OnHand'
      FieldName = 'ONHAND'
    end
    object PkMasterFGMultiNON_CONFORM: TStringField
      DisplayLabel = 'Non Conform'
      FieldName = 'NON_CONFORM'
      Size = 30
    end
    object PkMasterFGMultiVMI: TStringField
      FieldName = 'VMI'
      Size = 1
    end
    object PkMasterFGMultiDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkMasterFGMultiHARD_ALLOCATED_TO: TStringField
      DisplayLabel = 'Hard Allocated To'
      FieldName = 'HARD_ALLOCATED_TO'
      Visible = False
      Size = 44
    end
    object PkMasterFGMultiNON_CONFORM_ID: TBCDField
      FieldName = 'NON_CONFORM_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiNON_ALLOCATE_ID: TBCDField
      FieldName = 'NON_ALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField
      FieldName = 'SHIPMENT_DTL_ID_IN_TRANSIT'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiMAKE_TO_ORDER_DETAIL_ID: TBCDField
      FieldName = 'MAKE_TO_ORDER_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiLOT_DATE: TDateTimeField
      FieldName = 'LOT_DATE'
      Visible = False
    end
    object PkMasterFGMultiSHELF_LIFE: TFMTBCDField
      FieldName = 'SHELF_LIFE'
      Visible = False
      Size = 38
    end
    object PkMasterFGMultiIS_HARD_ALLOC: TStringField
      FieldName = 'IS_HARD_ALLOC'
      Visible = False
      Size = 1
    end
    object PkMasterFGMultiCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Size = 100
    end
  end
  object QryFGMulti: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       f.lotno,'
      '       f.onhand,'
      '       loc.loc_desc,'
      '       f.eplant_id'
      '  from fgmulti f, locations loc'
      ' where f.loc_id = loc.id'
      ' ')
    Left = 154
    Top = 210
    object QryFGMultiFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Size = 0
    end
    object QryFGMultiLOTNO: TStringField
      FieldName = 'LOTNO'
      Size = 25
    end
    object QryFGMultiONHAND: TBCDField
      FieldName = 'ONHAND'
    end
    object QryFGMultiLOC_DESC: TStringField
      FieldName = 'LOC_DESC'
      Size = 30
    end
  end
  object QryEPlant: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       name,'
      '       '#39'['#39' || ID || '#39']  '#39' || name as descrip'
      '  from eplant'
      ' '
      ' ')
    Left = 155
    Top = 176
  end
  object PkMasterFGMultiRecDef: TIQWebHpick
    BeforeOpen = PkMasterFGMultiBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       loc.loc_desc as loc_desc,'
      '       f.lotno as lotno,'
      '       f.onhand as onhand,'
      '       nc.descrip as non_conform,'
      '       loc.VMI as VMI,'
      '       loc.division_id,'
      '       div.name as division_name,'
      ''
      
        '       case (select upper(source) from v_fgmulti_allocated where' +
        ' fgmulti_id = f.id)'
      
        '         when '#39'workorder_bom_mat_loc'#39' then (select '#39'WO# '#39' || b.w' +
        'orkorder_id'
      
        '                                              from workorder_bom' +
        '_mat_loc m, '
      
        '                                                   workorder_bom' +
        ' b'
      
        '                                             where m.fgmulti_id ' +
        '= f.id'
      
        '                                               and m.workorder_b' +
        'om_id = b.id)'
      '         when '#39'fab_lot_mat_loc'#39' then (select '#39'Lot# '#39' || d.lotno '
      '                                         from fab_lot_mat_loc l,'
      '                                              fab_lot_mat a,'
      '                                              fab_lot_process b,'
      '                                              fab_lot_wo c,'
      '                                              fab_lot d'
      
        '                                        where l.fgmulti_id = f.i' +
        'd'
      
        '                                          and l.fab_lot_mat_id =' +
        ' a.id'
      
        '                                          and a.fab_lot_process_' +
        'id = b.id'
      
        '                                          and b.fab_lot_wo_id = ' +
        'c.id'
      
        '                                          and c.fab_lot_id = d.i' +
        'd )'
      '        else'
      '          null '
      '        end as hard_allocated_to,'
      ''
      
        '        decode( (select source from v_fgmulti_allocated where fg' +
        'multi_id = f.id), NULL, '#39'N'#39', '#39'Y'#39' ) as is_hard_alloc,'
      ''
      '        f.non_conform_id as non_conform_id,'
      '        f.non_allocate_id as non_allocate_id,'
      
        '        f.shipment_dtl_id_in_transit as shipment_dtl_id_in_trans' +
        'it,'
      '        f.make_to_order_detail_id as make_to_order_detail_id,'
      '        f.lot_date as lot_date,'
      
        '        (select shelf_life from arinvt where id = f.arinvt_id) a' +
        's shelf_life,'
      
        '        (select country from arinvt_lot_docs where id = f.arinvt' +
        '_id and lotno = f.lotno) as country'
      ''
      '        '
      '-- HPICK_FROM_START'
      ''
      '  from fgmulti f,'
      '       locations loc,'
      '       non_conform nc,'
      '       division div'
      ' where f.loc_id = loc.id'
      '   and arinvt_id = :arinvt_id'
      '   and f.non_conform_id = nc.id(+)'
      '   and ( NVL(loc.VMI, '#39'N'#39')  = :AVMI or 1 = :ADummy)'
      '   and loc.division_id = div.id(+)'
      '   and NVL(loc.RECV_DEFAULT, '#39'N'#39') = '#39'Y'#39)
    OnIQModify = PkMasterFGMultiIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 80
    Top = 288
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'AVMI'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'ADummy'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkMasterFGMultiRecDefFGMULTI_ID: TBCDField
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefLOC_DESC: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      FixedChar = True
      Size = 30
    end
    object PkMasterFGMultiRecDefLOTNO: TStringField
      DisplayLabel = 'Lot#'
      FieldName = 'LOTNO'
      FixedChar = True
      Size = 25
    end
    object PkMasterFGMultiRecDefONHAND: TBCDField
      DisplayLabel = 'OnHand'
      FieldName = 'ONHAND'
    end
    object PkMasterFGMultiRecDefNON_CONFORM: TStringField
      DisplayLabel = 'Non Conform'
      FieldName = 'NON_CONFORM'
      Size = 30
    end
    object PkMasterFGMultiRecDefVMI: TStringField
      FieldName = 'VMI'
      FixedChar = True
      Size = 1
    end
    object PkMasterFGMultiRecDefDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object PkMasterFGMultiRecDefDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkMasterFGMultiRecDefHARD_ALLOCATED_TO: TStringField
      DisplayLabel = 'Hard Allocated To'
      FieldName = 'HARD_ALLOCATED_TO'
      Visible = False
      Size = 44
    end
    object PkMasterFGMultiRecDefIS_HARD_ALLOC: TStringField
      FieldName = 'IS_HARD_ALLOC'
      Visible = False
      Size = 1
    end
    object PkMasterFGMultiRecDefNON_CONFORM_ID: TBCDField
      FieldName = 'NON_CONFORM_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefNON_ALLOCATE_ID: TBCDField
      FieldName = 'NON_ALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefSHIPMENT_DTL_ID_IN_TRANSIT: TBCDField
      FieldName = 'SHIPMENT_DTL_ID_IN_TRANSIT'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefMAKE_TO_ORDER_DETAIL_ID: TBCDField
      FieldName = 'MAKE_TO_ORDER_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefLOT_DATE: TDateTimeField
      FieldName = 'LOT_DATE'
      Visible = False
    end
    object PkMasterFGMultiRecDefSHELF_LIFE: TFMTBCDField
      FieldName = 'SHELF_LIFE'
      Visible = False
      Size = 0
    end
    object PkMasterFGMultiRecDefCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 18
      FieldName = 'COUNTRY'
      Size = 100
    end
  end
end
