object FrmRunsTheBestDocs: TFrmRunsTheBestDocs
  Left = 182
  Top = 162
  HelpContext = 1227392
  Caption = 'Documents Assigned to Selected "Runs The Best"'
  ClientHeight = 303
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  object PageControl1: TUniPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 303
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Caption = 'Internal'
      object IQDocs1: TIQWebDocs
        Left = 0
        Top = 0
        Width = 529
        Height = 275
        Active = False
        Align = alClient
        BevelOuter = bvNone
        ColumnsWidth = 250
        DataBaseName = 'IQ'
        DocClass = 'WC'
        SingleDoc = False
        MasterFields = 'ID'
        MasterSource = FrmRunsTheBest.wwSrcRuns_Best
        PopupMenu = IQDocs1.PopUpMenu
        TableName = 'RUNS_BEST_DOCS'
        TabOrder = 0
        OnGetMasterTableName = IQDocs1GetMasterTableName
        OnGetIndexFieldNames = IQDocs1GetIndexFieldNames
        OnNewRecord = IQDocs1NewRecord
      end
    end
    object TabSheet2: TUniTabSheet
      Caption = 'External'
      object IQExtDoc1: TIQWebExtDoc
        Left = 0
        Top = 0
        Width = 529
        Height = 275
        Active = False
        Align = alClient
        BevelOuter = bvNone
        DataBaseName = 'IQ'
        Filter = '(*.*)|*.*|(*.doc)|*.doc|(*.rtf)|*.rtf'
        MasterFields = 'ID'
        MasterSource = FrmRunsTheBest.wwSrcRuns_Best
        Source = 'RUNS_BEST'
        TableName = 'RUNS_BEST'
        TabOrder = 0
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmItemDocs')
    SecurityItems.Strings = (
      'IQDocs1'
      'IQExtDoc1')
    SecurityCode = 'FRMRUNSTHEBESTDOCS'
    Left = 127
    Top = 80
  end
  object SrcLocalRunsBest: TDataSource
    DataSet = QryLocalRunsBest
    Left = 31
    Top = 105
  end
  object QryLocalRunsBest: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id'
      '  from runs_best r'
      ' where r.standard_id = :standard_id'
      '   and r.work_center_id_act = :work_center_id'
      ' ')
    Left = 30
    Top = 131
    ParamData = <
      item
        Name = 'standard_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLocalRunsBestID: TBCDField
      DisplayWidth = 5
      FieldName = 'ID'
      Origin = 'r.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
end

