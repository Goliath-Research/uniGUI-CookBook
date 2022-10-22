object FrmRBom_Components: TFrmRBom_Components
  Left = 153
  Top = 177
  ClientHeight = 296
  ClientWidth = 698
  Caption = 'Components'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 507
    Top = 27
    Width = 6
    Height = 235
    Hint = ''
    Align = alRight
    ParentColor = False
    Color = clBtnFace
    ExplicitLeft = 338
    ExplicitHeight = 156
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 698
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 490
    object NavMain: TUniDBNavigator
      Left = 497
      Top = 1
      Width = 200
      Height = 25
      Hint = ''
      DataSource = SrcOpMat
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 289
    end
  end
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 27
    Width = 507
    Height = 235
    Hint = ''
    DataSource = SrcOpMat
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'OP_CLASS'
        Title.Caption = 'Type'
        Width = 50
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 33
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 97
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PTSPER_DISP'
        Title.Caption = 'Parts Per'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 96
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'Unit'
        Width = 44
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NON_MATERIAL'
        Title.Caption = 'Non Material'
        Width = 76
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object pnlDetail: TUniPanel
    Left = 513
    Top = 27
    Width = 185
    Height = 235
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 2
    Caption = 'pnlDetail'
    ExplicitLeft = 456
    object PageControl1: TUniPageControl
      Left = 1
      Top = 1
      Width = 183
      Height = 233
      Hint = ''
      ActivePage = tshComponents
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 2
      ExplicitWidth = 144
      ExplicitHeight = 214
      object tshNone: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'tshNone'
        ExplicitWidth = 136
        ExplicitHeight = 126
      end
      object tshPackaging: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 1
        Caption = 'tshPackaging'
        ExplicitWidth = 136
        ExplicitHeight = 126
        object Label1: TUniLabel
          Left = 5
          Top = 8
          Width = 49
          Height = 13
          Hint = ''
          Caption = 'Pkg Seq #'
          TabOrder = 2
        end
        object Label4: TUniLabel
          Left = 5
          Top = 33
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'Scrap'
          TabOrder = 3
        end
        object DBEdit1: TUniDBEdit
          Left = 72
          Top = 4
          Width = 64
          Height = 21
          Hint = ''
          DataField = 'SEQ'
          DataSource = SrcOpMat
          TabOrder = 0
        end
        object DBEdit4: TUniDBEdit
          Left = 72
          Top = 29
          Width = 64
          Height = 21
          Hint = ''
          DataField = 'SCRAP'
          DataSource = SrcOpMat
          TabOrder = 1
        end
      end
      object tshComponents: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 2
        Caption = 'tshComponents'
        ExplicitWidth = 136
        ExplicitHeight = 126
        object Label2: TUniLabel
          Left = 5
          Top = 8
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'Overlap Hrs'
          TabOrder = 2
        end
        object Label3: TUniLabel
          Left = 5
          Top = 33
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'Scrap'
          TabOrder = 3
        end
        object DBEdit2: TUniDBEdit
          Left = 72
          Top = 4
          Width = 64
          Height = 21
          Hint = ''
          DataField = 'OVERLAP_HRS'
          DataSource = SrcOpMat
          TabOrder = 0
        end
        object DBEdit3: TUniDBEdit
          Left = 72
          Top = 29
          Width = 64
          Height = 21
          Hint = ''
          DataField = 'SCRAP'
          DataSource = SrcOpMat
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 262
    Width = 698
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 183
    ExplicitWidth = 490
    DesignSize = (
      698
      34)
    object btnOK: TUniButton
      Left = 534
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&OK'
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = btnOKClick
      ExplicitLeft = 326
    end
    object btnCancel: TUniButton
      Left = 620
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnClick = btnCancelClick
      ExplicitLeft = 412
    end
  end
  object SrcOpMat: TDataSource
    DataSet = QryOpMat
    OnDataChange = SrcOpMatDataChange
    Left = 120
    Top = 56
  end
  object QryOpMat: TFDQuery
    BeforeOpen = QryOpMatBeforeOpen
    BeforePost = QryOpMatBeforePost
    AfterPost = QryOpMatAfterPost
    AfterDelete = QryOpMatAfterDelete
    OnNewRecord = QryOpMatNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = OpMatUpdateSQL
    SQL.Strings = (
      'select o.id,'
      '       o.sndop_id,'
      '       o.arinvt_id,'
      '       o.ptsper_disp,'
      '       o.seq,'
      '       o.overlap_hrs,'
      '       a.class,'
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.unit,'
      '       a.standard_id,'
      '       o.scrap,'
      
        '       decode(sndop.op_class, '#39'PK'#39', '#39'Packaging'#39', '#39'IN'#39', '#39'Componen' +
        'ts'#39', sndop.op_class ) as op_class,'
      '       a.non_material'
      '  from opmat o,'
      '       arinvt a,'
      '       sndop,'
      '       ptoper'
      ' where ptoper.partno_id = :partno_id'
      '   and ptoper.sndop_id = sndop.id'
      '   and sndop.id = o.sndop_id'
      '   and o.arinvt_id = a.id'
      '   and not (sndop.op_class in ('#39'OP'#39', '#39'FB'#39'))'
      ' order by'
      '       sndop.op_class,'
      '       o.seq'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 56
    ParamData = <
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryOpMatID: TBCDField
      FieldName = 'ID'
      Origin = 'OPMAT.ID'
      Visible = False
      Size = 0
    end
    object QryOpMatSNDOP_ID: TBCDField
      FieldName = 'SNDOP_ID'
      Origin = 'OPMAT.SNDOP_ID'
      Visible = False
      Size = 0
    end
    object QryOpMatARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'OPMAT.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryOpMatOP_CLASS: TStringField
      DisplayLabel = 'Type'
      FieldName = 'OP_CLASS'
      Origin = 'SNDOP.OP_CLASS'
      Size = 10
    end
    object QryOpMatCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object QryOpMatITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 50
    end
    object QryOpMatDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object QryOpMatDESCRIP2: TStringField
      DisplayLabel = 'Ext Description '
      FieldName = 'DESCRIP2'
      Origin = 'ARINVT.DESCRIP2'
      Size = 100
    end
    object QryOpMatPTSPER_DISP: TFMTBCDField
      DisplayLabel = 'Parts Per'
      FieldName = 'PTSPER_DISP'
      Origin = 'OPMAT.PTSPER_DISP'
      Size = 6
    end
    object QryOpMatUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Origin = 'ARINVT.UNIT'
      Size = 10
    end
    object QryOpMatSEQ: TBCDField
      DisplayLabel = 'Seq'
      FieldName = 'SEQ'
      Origin = 'OPMAT.SEQ'
      Size = 0
    end
    object QryOpMatOVERLAP_HRS: TBCDField
      DisplayLabel = 'Overlap Hrs'
      FieldName = 'OVERLAP_HRS'
      Origin = 'OPMAT.OVERLAP_HRS'
      Size = 2
    end
    object QryOpMatSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'ARINVT.STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryOpMatSCRAP: TBCDField
      DisplayLabel = 'Scrap'
      FieldName = 'SCRAP'
      Size = 2
    end
    object QryOpMatNON_MATERIAL: TStringField
      DisplayLabel = 'Non Material'
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
  end
  object OpMatUpdateSQL: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into opmat'
      
        '  (ID, SNDOP_ID, ARINVT_ID, PTSPER_DISP, SEQ, OVERLAP_HRS, SCRAP' +
        ')'
      'values'
      
        '  (:ID, :SNDOP_ID, :ARINVT_ID, :PTSPER_DISP, :SEQ, :OVERLAP_HRS,' +
        ' :SCRAP)')
    ModifySQL.Strings = (
      'update opmat'
      'set'
      '  ID = :ID,'
      '  SNDOP_ID = :SNDOP_ID,'
      '  ARINVT_ID = :ARINVT_ID,'
      '  PTSPER_DISP = :PTSPER_DISP,'
      '  SEQ = :SEQ,'
      '  OVERLAP_HRS = :OVERLAP_HRS,'
      '  SCRAP = :SCRAP'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from opmat'
      'where'
      '  ID = :OLD_ID')
    Left = 16
    Top = 104
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'NavMain')
    SecurityCode = 'FRMRBOM_COMPONENTS'
    Left = 161
    Top = 105
  end
end
