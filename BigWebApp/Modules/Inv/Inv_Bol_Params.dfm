object FrmInvBOLParams: TFrmInvBOLParams
  Left = 275
  Top = 165
  HelpContext = 1386703
  ClientHeight = 557
  ClientWidth = 384
  Caption = 'BOL Data'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 516
    Width = 384
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      384
      41)
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 382
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
    end
    object btnOK: TUniButton
      Left = 169
      Top = 9
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 277
      Top = 9
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 0
    Width = 384
    Height = 516
    DisableThemes = False
    Align = alClient
    TabOrder = 1
    DataSource = SrcArinvt
    Items = <
      item
        DataSource = SrcArinvt
        DataField = 'ITEMNO'
        Caption = 'Item#'
        ReadOnly = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'DESCRIP'
            Caption = 'Description'
            ReadOnly = True
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'CLASS'
            Caption = 'Class'
            ReadOnly = True
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'REV'
            Caption = 'Rev'
            ReadOnly = True
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'Loose Info'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'LOOSE_WEIGHT'
            Caption = 'Weight'
            TagString = 'loose_weight_label'
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'LOOSE_VOLUME'
            Caption = 'Volume'
            CustomControl = wwDBComboDlgLooseVolume
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'LOOSE_LENGTH'
                Caption = 'Length'
                TagString = 'loose_length_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'LOOSE_WIDTH'
                Caption = 'Width'
                TagString = 'loose_width_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'LOOSE_HEIGHT'
                Caption = 'Height'
                TagString = 'loose_height_label'
                WordWrap = False
              end>
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'Case Info'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'PK_WEIGHT'
            Caption = 'Weight'
            TagString = 'case_weight_label'
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'PK_PTSPER'
            Caption = 'Items Per Case'
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'VOLUME'
            Caption = 'Volume'
            CustomControl = wwDBComboDlgPkVolume
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'PK_LENGTH'
                Caption = 'Length'
                TagString = 'case_length_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'PK_WIDTH'
                Caption = 'Width'
                TagString = 'case_width_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'PK_HEIGHT'
                Caption = 'Height'
                TagString = 'case_height_label'
                WordWrap = False
              end>
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'Pallet Info'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'PALLET_WEIGHT'
            Caption = 'Weight'
            TagString = 'pallet_weight_label'
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'PALLET_PTSPER'
            Caption = 'Items Per Pallet'
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'PALLET_VOLUME'
            Caption = 'Volume'
            CustomControl = wwDBComboDlgPalletVolume
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'PALLET_LENGTH'
                Caption = 'Length'
                TagString = 'pallet_length_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'PALLET_WIDTH'
                Caption = 'Width'
                TagString = 'pallet_width_label'
                WordWrap = False
              end
              item
                DataSource = SrcArinvt
                DataField = 'PALLET_HEIGHT'
                Caption = 'Height'
                TagString = 'pallet_height_label'
                WordWrap = False
              end>
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'BOL_CALC_OVERRIDE'
        Caption = 'Override BOM information'
        PickList.Items.Strings = (
          'Y'
          'N')
        PickList.Style = csDropDownList
        PickList.DisplayAsCheckbox = True
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'Movement Class'
        ReadOnly = True
        Expanded = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'LOOSE_INV_MOVE_CLASS_ID'
            Caption = 'Loose'
            CustomControl = wwDBLookupComboLooseMoveClass
            PickList.Items.Strings = (
              'A-Fast Mover'#9'A'
              'B-Average Mover'#9'B'
              'C-Slow Mover'#9'C')
            PickList.MapList = True
            PickList.Style = csDropDownList
            PickList.AllowClearKey = True
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'LOOSE_MOVE_RANK_LOCK'
                Caption = 'Lock Move Class'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'PACK_INV_MOVE_CLASS_ID'
            Caption = 'Case'
            CustomControl = wwDBLookupComboPackMoveClass
            PickList.Items.Strings = (
              'A-Fast Mover'#9'A'
              'B-Average Mover'#9'B'
              'C-Slow Mover'#9'C')
            PickList.MapList = True
            PickList.Style = csDropDownList
            PickList.AllowClearKey = True
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'PACK_MOVE_RANK_LOCK'
                Caption = 'Lock Move Class'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'PALLET_INV_MOVE_CLASS_ID'
            Caption = 'Pallet'
            CustomControl = wwDBLookupComboPalletMoveClass
            PickList.Items.Strings = (
              'A-Fast Mover'#9'A'
              'B-Average Mover'#9'B'
              'C-Slow Mover'#9'C')
            PickList.MapList = True
            PickList.Style = csDropDownList
            PickList.AllowClearKey = True
            Items = <
              item
                DataSource = SrcArinvt
                DataField = 'PALLET_MOVE_RANK_LOCK'
                Caption = 'Lock Move Class'
                PickList.Items.Strings = (
                  'Y'
                  'N')
                PickList.DisplayAsCheckbox = True
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcArinvt
            DataField = 'MAX_PALLET_STACK'
            Caption = 'Max Pallet Stack'
            WordWrap = False
          end>
        TagString = 'MovementClass'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'PK_UNIT_TYPE'
        Caption = 'Default Pk Unit Type'
        CustomControl = wwDBPackageType
        TagString = 'DefaultPkUnitType'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'Directed Transactions'
        ReadOnly = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'OVERRIDE_REC_LOC'
            Caption = 'Override Receiving Default'
            PickList.Items.Strings = (
              'Y'
              'N')
            PickList.DisplayAsCheckbox = True
            WordWrap = False
          end>
        TagString = 'DirectedTransactions'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        Caption = 'ICT Info'
        ReadOnly = True
        Items = <
          item
            DataSource = SrcArinvt
            DataField = 'ICT_TRUCK_PTSPER'
            Caption = 'Items Per Full Truck'
            TagString = 'items_per_full_truck'
            WordWrap = False
          end>
        TagString = 'ict_Info'
        WordWrap = False
      end>
    DefaultRowHeight = 19
    CaptionWidth = 167
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    OnDrawCaptionCell = wwDataInspector1DrawCaptionCell
    DesignSize = (
      380
      512)
    object wwDBComboDlgPkVolume: TUniEdit
      Left = 79
      Top = 166
      Width = 211
      Height = 18
      Hint = 
        'Enter volume or click the button to recalc volume based on lengt' +
        'h, width and height'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      BorderStyle = ubsNone
      Text = ''
      TabOrder = 0
      TabStop = False
    end
    object wwDBComboDlgPalletVolume: TUniEdit
      Left = 79
      Top = 166
      Width = 211
      Height = 18
      Hint = 
        'Enter volume or click the button to recalc volume based on lengt' +
        'h, width and height'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      BorderStyle = ubsNone
      Text = ''
      TabOrder = 1
      TabStop = False
    end
    object wwDBLookupComboLooseMoveClass: TUniDBLookupComboBox
      Left = 144
      Top = 187
      Width = 211
      Height = 19
      Hint = ''
      Visible = False
      ListFieldIndex = 0
      DataField = 'LOOSE_INV_MOVE_CLASS_ID'
      DataSource = SrcArinvt
      Anchors = [akLeft, akTop, akRight]
      TabStop = False
      TabOrder = 2
      Color = clWindow
    end
    object wwDBLookupComboPackMoveClass: TUniDBLookupComboBox
      Left = 144
      Top = 211
      Width = 211
      Height = 19
      Hint = ''
      Visible = False
      ListFieldIndex = 0
      DataField = 'PACK_INV_MOVE_CLASS_ID'
      DataSource = SrcArinvt
      Anchors = [akLeft, akTop, akRight]
      TabStop = False
      TabOrder = 3
      Color = clWindow
    end
    object wwDBLookupComboPalletMoveClass: TUniDBLookupComboBox
      Left = 144
      Top = 238
      Width = 211
      Height = 19
      Hint = ''
      Visible = False
      ListFieldIndex = 0
      DataField = 'PALLET_INV_MOVE_CLASS_ID'
      DataSource = SrcArinvt
      Anchors = [akLeft, akTop, akRight]
      TabStop = False
      TabOrder = 4
      Color = clWindow
    end
    object wwDBPackageType: TUniDBComboBox
      Left = 135
      Top = 266
      Width = 211
      Height = 18
      Hint = ''
      Visible = False
      DataField = 'PK_UNIT_TYPE'
      DataSource = SrcArinvt
      Style = csDropDownList
      Items.Strings = (
        'E-Loose'#9'E'
        'C-Case'#9'C'
        'P-Pallet'#9'P')
      TabStop = False
      TabOrder = 5
    end
    object wwDBComboDlgLooseVolume: TUniEdit
      Left = 184
      Top = 72
      Width = 211
      Height = 18
      Hint = ''
      Visible = False
      BorderStyle = ubsNone
      Text = ''
      TabOrder = 6
      TabStop = False
    end
  end
  object UpdateSQLArinvt: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into arinvt'
      
        '  (ID, VOLUME, EPLANT_ID, PK_HIDE, PK_WEIGHT, PK_PTSPER, IS_LINK' +
        'ED_TO_SERIAL, '
      
        '   PK_LENGTH, PK_WIDTH, PK_HEIGHT, PALLET_LENGTH, PALLET_WIDTH, ' +
        'PALLET_HEIGHT, '
      
        '   PALLET_VOLUME, PALLET_PTSPER, PALLET_WEIGHT, LENGTH, WIDTH, L' +
        'OOSE_INV_MOVE_CLASS_ID, '
      
        '   PACK_INV_MOVE_CLASS_ID, PALLET_INV_MOVE_CLASS_ID, PK_UNIT_TYP' +
        'E, FIFO, '
      
        '   OVERRIDE_REC_LOC, BOL_CALC_OVERRIDE, MAX_PALLET_STACK, LOOSE_' +
        'MOVE_RANK_LOCK, '
      
        '   PACK_MOVE_RANK_LOCK, PALLET_MOVE_RANK_LOCK, LOOSE_LENGTH, LOO' +
        'SE_WIDTH, '
      '   LOOSE_HEIGHT, LOOSE_VOLUME, LOOSE_WEIGHT, ICT_TRUCK_PTSPER)'
      'values'
      
        '  (:ID, :VOLUME, :EPLANT_ID, :PK_HIDE, :PK_WEIGHT, :PK_PTSPER, :' +
        'IS_LINKED_TO_SERIAL, '
      
        '   :PK_LENGTH, :PK_WIDTH, :PK_HEIGHT, :PALLET_LENGTH, :PALLET_WI' +
        'DTH, :PALLET_HEIGHT, '
      
        '   :PALLET_VOLUME, :PALLET_PTSPER, :PALLET_WEIGHT, :LENGTH, :WID' +
        'TH, :LOOSE_INV_MOVE_CLASS_ID, '
      
        '   :PACK_INV_MOVE_CLASS_ID, :PALLET_INV_MOVE_CLASS_ID, :PK_UNIT_' +
        'TYPE, :FIFO, '
      
        '   :OVERRIDE_REC_LOC, :BOL_CALC_OVERRIDE, :MAX_PALLET_STACK, :LO' +
        'OSE_MOVE_RANK_LOCK, '
      
        '   :PACK_MOVE_RANK_LOCK, :PALLET_MOVE_RANK_LOCK, :LOOSE_LENGTH, ' +
        ':LOOSE_WIDTH, '
      
        '   :LOOSE_HEIGHT, :LOOSE_VOLUME, :LOOSE_WEIGHT, :ICT_TRUCK_PTSPE' +
        'R)')
    ModifySQL.Strings = (
      'update arinvt'
      'set'
      '  ID = :ID,'
      '  VOLUME = :VOLUME,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  PK_HIDE = :PK_HIDE,'
      '  PK_WEIGHT = :PK_WEIGHT,'
      '  PK_PTSPER = :PK_PTSPER,'
      '  IS_LINKED_TO_SERIAL = :IS_LINKED_TO_SERIAL,'
      '  PK_LENGTH = :PK_LENGTH,'
      '  PK_WIDTH = :PK_WIDTH,'
      '  PK_HEIGHT = :PK_HEIGHT,'
      '  PALLET_LENGTH = :PALLET_LENGTH,'
      '  PALLET_WIDTH = :PALLET_WIDTH,'
      '  PALLET_HEIGHT = :PALLET_HEIGHT,'
      '  PALLET_VOLUME = :PALLET_VOLUME,'
      '  PALLET_PTSPER = :PALLET_PTSPER,'
      '  PALLET_WEIGHT = :PALLET_WEIGHT,'
      '  LENGTH = :LENGTH,'
      '  WIDTH = :WIDTH,'
      '  LOOSE_INV_MOVE_CLASS_ID = :LOOSE_INV_MOVE_CLASS_ID,'
      '  PACK_INV_MOVE_CLASS_ID = :PACK_INV_MOVE_CLASS_ID,'
      '  PALLET_INV_MOVE_CLASS_ID = :PALLET_INV_MOVE_CLASS_ID,'
      '  PK_UNIT_TYPE = :PK_UNIT_TYPE,'
      '  FIFO = :FIFO,'
      '  OVERRIDE_REC_LOC = :OVERRIDE_REC_LOC,'
      '  BOL_CALC_OVERRIDE = :BOL_CALC_OVERRIDE,'
      '  MAX_PALLET_STACK = :MAX_PALLET_STACK,'
      '  LOOSE_MOVE_RANK_LOCK = :LOOSE_MOVE_RANK_LOCK,'
      '  PACK_MOVE_RANK_LOCK = :PACK_MOVE_RANK_LOCK,'
      '  PALLET_MOVE_RANK_LOCK = :PALLET_MOVE_RANK_LOCK,'
      '  LOOSE_LENGTH = :LOOSE_LENGTH,'
      '  LOOSE_WIDTH = :LOOSE_WIDTH,'
      '  LOOSE_HEIGHT = :LOOSE_HEIGHT,'
      '  LOOSE_VOLUME = :LOOSE_VOLUME,'
      '  LOOSE_WEIGHT = :LOOSE_WEIGHT,'
      '  ICT_TRUCK_PTSPER = :ICT_TRUCK_PTSPER'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arinvt'
      'where'
      '  ID = :OLD_ID')
    Left = 223
    Top = 311
  end
  object TblArinvt: TFDQuery
    BeforeOpen = TblArinvtBeforeOpen
    AfterPost = TblArinvtAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'arinvt'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArinvt
    SQL.Strings = (
      'select id,'
      '       itemno,'
      '       descrip,'
      '       rev,'
      '       class,'
      '       volume,'
      '       eplant_id,'
      '       pk_hide,'
      '       pk_weight,'
      '       pk_ptsper,'
      '       is_linked_to_serial,'
      '       pk_length,'
      '       pk_width,'
      '       pk_height,'
      '       pallet_length,'
      '       pallet_width,'
      '       pallet_height,'
      '       pallet_volume,'
      '       pallet_ptsper,'
      '       pallet_weight,'
      '       length,'
      '       width,'
      '       loose_inv_move_class_id,'
      '       pack_inv_move_class_id,'
      '       pallet_inv_move_class_id,'
      '       pk_unit_type,'
      '       fifo,'
      '       override_rec_loc,'
      '       bol_calc_override,'
      '       max_pallet_stack,'
      '       loose_move_rank_lock,'
      '       pack_move_rank_lock,'
      '       pallet_move_rank_lock,'
      '       loose_length,'
      '       loose_width,'
      '       loose_height,'
      '       loose_volume,'
      '       loose_weight,'
      '       ict_truck_ptsper'
      '  from arinvt'
      ' where id = :id'
      ''
      ''
      '')
    Left = 222
    Top = 286
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object TblArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'arinvt.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblArinvtVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Size = 6
    end
    object TblArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Size = 0
    end
    object TblArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblArinvtPK_WEIGHT: TFMTBCDField
      FieldName = 'PK_WEIGHT'
      Origin = 'PK_WEIGHT'
      Size = 6
    end
    object TblArinvtPK_PTSPER: TFMTBCDField
      FieldName = 'PK_PTSPER'
      Origin = 'PK_PTSPER'
      Size = 6
    end
    object TblArinvtIS_LINKED_TO_SERIAL: TStringField
      FieldName = 'IS_LINKED_TO_SERIAL'
      Origin = 'IS_LINKED_TO_SERIAL'
      FixedChar = True
      Size = 1
    end
    object TblArinvtPK_LENGTH: TFMTBCDField
      FieldName = 'PK_LENGTH'
      Origin = 'PK_LENGTH'
      Size = 6
    end
    object TblArinvtPK_WIDTH: TFMTBCDField
      FieldName = 'PK_WIDTH'
      Origin = 'PK_WIDTH'
      Size = 6
    end
    object TblArinvtPK_HEIGHT: TFMTBCDField
      FieldName = 'PK_HEIGHT'
      Origin = 'PK_HEIGHT'
      Size = 6
    end
    object TblArinvtPALLET_LENGTH: TFMTBCDField
      FieldName = 'PALLET_LENGTH'
      Origin = 'PALLET_LENGTH'
      Size = 6
    end
    object TblArinvtPALLET_WIDTH: TFMTBCDField
      FieldName = 'PALLET_WIDTH'
      Origin = 'PALLET_WIDTH'
      Size = 6
    end
    object TblArinvtPALLET_HEIGHT: TFMTBCDField
      FieldName = 'PALLET_HEIGHT'
      Origin = 'PALLET_HEIGHT'
      Size = 6
    end
    object TblArinvtPALLET_VOLUME: TFMTBCDField
      FieldName = 'PALLET_VOLUME'
      Origin = 'PALLET_VOLUME'
      Size = 6
    end
    object TblArinvtPALLET_PTSPER: TFMTBCDField
      FieldName = 'PALLET_PTSPER'
      Origin = 'PALLET_PTSPER'
      Size = 6
    end
    object TblArinvtPALLET_WEIGHT: TFMTBCDField
      FieldName = 'PALLET_WEIGHT'
      Origin = 'PALLET_WEIGHT'
      Size = 6
    end
    object TblArinvtLENGTH: TFMTBCDField
      DisplayLabel = 'Length'
      FieldName = 'LENGTH'
      Origin = 'LENGTH'
      Size = 6
    end
    object TblArinvtWIDTH: TFMTBCDField
      DisplayLabel = 'Width'
      FieldName = 'WIDTH'
      Origin = 'WIDTH'
      Size = 6
    end
    object TblArinvtPACK_INV_MOVE_CLASS_ID: TBCDField
      FieldName = 'PACK_INV_MOVE_CLASS_ID'
      Visible = False
      Size = 0
    end
    object TblArinvtPALLET_INV_MOVE_CLASS_ID: TBCDField
      FieldName = 'PALLET_INV_MOVE_CLASS_ID'
      Visible = False
      Size = 0
    end
    object TblArinvtPK_UNIT_TYPE: TStringField
      FieldName = 'PK_UNIT_TYPE'
      Size = 1
    end
    object TblArinvtFIFO: TStringField
      FieldName = 'FIFO'
      Size = 1
    end
    object TblArinvtOVERRIDE_REC_LOC: TStringField
      FieldName = 'OVERRIDE_REC_LOC'
      Visible = False
      Size = 1
    end
    object TblArinvtLOOSE_INV_MOVE_CLASS_ID: TBCDField
      FieldName = 'LOOSE_INV_MOVE_CLASS_ID'
      Size = 0
    end
    object TblArinvtBOL_CALC_OVERRIDE: TStringField
      FieldName = 'BOL_CALC_OVERRIDE'
      Size = 1
    end
    object TblArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object TblArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object TblArinvtREV: TStringField
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object TblArinvtCLASS: TStringField
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object TblArinvtMAX_PALLET_STACK: TBCDField
      FieldName = 'MAX_PALLET_STACK'
      Size = 0
    end
    object TblArinvtLOOSE_MOVE_RANK_LOCK: TStringField
      FieldName = 'LOOSE_MOVE_RANK_LOCK'
      Size = 1
    end
    object TblArinvtPACK_MOVE_RANK_LOCK: TStringField
      FieldName = 'PACK_MOVE_RANK_LOCK'
      Size = 1
    end
    object TblArinvtPALLET_MOVE_RANK_LOCK: TStringField
      FieldName = 'PALLET_MOVE_RANK_LOCK'
      Size = 1
    end
    object TblArinvtLOOSE_LENGTH: TFMTBCDField
      FieldName = 'LOOSE_LENGTH'
      Size = 6
    end
    object TblArinvtLOOSE_WIDTH: TFMTBCDField
      FieldName = 'LOOSE_WIDTH'
      Size = 6
    end
    object TblArinvtLOOSE_HEIGHT: TFMTBCDField
      FieldName = 'LOOSE_HEIGHT'
      Size = 6
    end
    object TblArinvtLOOSE_VOLUME: TFMTBCDField
      FieldName = 'LOOSE_VOLUME'
      Size = 6
    end
    object TblArinvtLOOSE_WEIGHT: TFMTBCDField
      FieldName = 'LOOSE_WEIGHT'
      Size = 6
    end
    object TblArinvtICT_TRUCK_PTSPER: TFMTBCDField
      FieldName = 'ICT_TRUCK_PTSPER'
      Size = 6
    end
  end
  object SrcArinvt: TDataSource
    DataSet = TblArinvt
    Left = 221
    Top = 263
  end
  object QryMoveClass: TFDQuery
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip,'
      '       rank_percent'
      '  from inv_move_class'
      '')
    Left = 260
    Top = 264
    object QryMoveClassCODE: TStringField
      DisplayLabel = 'Movement Class'
      DisplayWidth = 15
      FieldName = 'CODE'
      Required = True
      Size = 1
    end
    object QryMoveClassDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 22
      FieldName = 'DESCRIP'
    end
    object QryMoveClassRANK_PERCENT: TBCDField
      DisplayLabel = 'Transaction Rank %'
      DisplayWidth = 18
      FieldName = 'RANK_PERCENT'
      Visible = False
      Size = 2
    end
    object QryMoveClassID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end
