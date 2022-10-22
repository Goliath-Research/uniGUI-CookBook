object FrmInvTransAlertParams: TFrmInvTransAlertParams
  Left = 0
  Top = 0
  ClientHeight = 299
  ClientWidth = 329
  Caption = 'Parameters'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 262
    Width = 329
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 113
      Top = 1
      Width = 215
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 113
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 262
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PageControl1: TUniPageControl
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 321
      Height = 254
      Hint = ''
      ActivePage = TabSheet2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Priority Thresholds'
        object Splitter1: TUniSplitter
          Left = 109
          Top = 0
          Width = 6
          Height = 226
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel4: TUniPanel
          Left = 0
          Top = 0
          Width = 109
          Height = 226
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label5: TUniLabel
            Left = 6
            Top = 8
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'Time Increment'
            TabOrder = 1
          end
          object Label6: TUniLabel
            Left = 24
            Top = 32
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'Minutes'
            TabOrder = 2
          end
          object Label7: TUniLabel
            Left = 24
            Top = 56
            Width = 29
            Height = 13
            Hint = ''
            Caption = 'Points'
            TabOrder = 3
          end
        end
        object Panel5: TUniPanel
          Left = 115
          Top = 0
          Width = 198
          Height = 226
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBEdit4: TUniDBEdit
            Left = 1
            Top = 29
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'TIME_INC_MINUTES'
            DataSource = SrcInvTransParams
            TabOrder = 0
          end
          object DBEdit5: TUniDBEdit
            Left = 1
            Top = 53
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'TIME_INC_POINTS'
            DataSource = SrcInvTransParams
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Task Defaults'
        object Splitter2: TUniSplitter
          Left = 121
          Top = 0
          Width = 6
          Height = 226
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel6: TUniPanel
          Left = 0
          Top = 0
          Width = 121
          Height = 226
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label8: TUniLabel
            Left = 6
            Top = 8
            Width = 108
            Height = 13
            Hint = ''
            Caption = 'Starting Priority Levels'
            TabOrder = 1
          end
          object Label9: TUniLabel
            Left = 24
            Top = 32
            Width = 49
            Height = 13
            Hint = ''
            Caption = 'Pick Ticket'
            TabOrder = 2
          end
          object Label10: TUniLabel
            Left = 24
            Top = 56
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Receiving'
            TabOrder = 3
          end
          object Label11: TUniLabel
            Left = 24
            Top = 80
            Width = 77
            Height = 13
            Hint = ''
            Caption = 'Material Staging'
            TabOrder = 4
          end
        end
        object Panel7: TUniPanel
          Left = 127
          Top = 0
          Width = 186
          Height = 226
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object DBEdit3: TUniDBEdit
            Left = 1
            Top = 29
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'PICK_TICKET_PRIORITY'
            DataSource = SrcInvTransParams
            TabOrder = 0
          end
          object DBEdit6: TUniDBEdit
            Left = 1
            Top = 53
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'RECEIVING_PRIORITY'
            DataSource = SrcInvTransParams
            TabOrder = 1
          end
          object DBEdit7: TUniDBEdit
            Left = 1
            Top = 77
            Width = 121
            Height = 21
            Hint = ''
            DataField = 'MAT_STAGING_PRIORITY'
            DataSource = SrcInvTransParams
            TabOrder = 2
          end
        end
      end
    end
  end
  object QryInvTransParams: TFDQuery
    BeforePost = QryInvTransParamsBeforePost
    AfterPost = ApplyUpdates
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'inv_trans_params'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLInvTransParams
    SQL.Strings = (
      'select id,'
      '       time_inc_minutes,'
      '       time_inc_points,'
      '       pick_ticket_priority,'
      '       receiving_priority,'
      '       mat_staging_priority'
      '  from inv_trans_params       ')
    Left = 264
    Top = 117
    object QryInvTransParamsTIME_INC_MINUTES: TBCDField
      FieldName = 'TIME_INC_MINUTES'
      Origin = 'IQ.INV_TRANS_PARAMS.TIME_INC_MINUTES'
      Size = 0
    end
    object QryInvTransParamsTIME_INC_POINTS: TBCDField
      FieldName = 'TIME_INC_POINTS'
      Origin = 'IQ.INV_TRANS_PARAMS.TIME_INC_POINTS'
      Size = 0
    end
    object QryInvTransParamsPICK_TICKET_PRIORITY: TBCDField
      FieldName = 'PICK_TICKET_PRIORITY'
      Origin = 'IQ.INV_TRANS_PARAMS.PICK_TICKET_PRIORITY'
      Size = 0
    end
    object QryInvTransParamsRECEIVING_PRIORITY: TBCDField
      FieldName = 'RECEIVING_PRIORITY'
      Origin = 'IQ.INV_TRANS_PARAMS.RECEIVING_PRIORITY'
      Size = 0
    end
    object QryInvTransParamsMAT_STAGING_PRIORITY: TBCDField
      FieldName = 'MAT_STAGING_PRIORITY'
      Origin = 'IQ.INV_TRANS_PARAMS.MAT_STAGING_PRIORITY'
      Size = 0
    end
    object QryInvTransParamsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
  end
  object SrcInvTransParams: TDataSource
    DataSet = QryInvTransParams
    Left = 264
    Top = 56
  end
  object UpdateSQLInvTransParams: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into inv_trans_params'
      
        '  (ID, TIME_INC_MINUTES, TIME_INC_POINTS, PICK_TICKET_PRIORITY, ' +
        'RECEIVING_PRIORITY, '
      '   MAT_STAGING_PRIORITY)'
      'values'
      
        '  (:ID, :TIME_INC_MINUTES, :TIME_INC_POINTS, :PICK_TICKET_PRIORI' +
        'TY, :RECEIVING_PRIORITY, '
      '   :MAT_STAGING_PRIORITY)')
    ModifySQL.Strings = (
      'update inv_trans_params'
      'set'
      '  ID = :ID,'
      '  TIME_INC_MINUTES = :TIME_INC_MINUTES,'
      '  TIME_INC_POINTS = :TIME_INC_POINTS,'
      '  PICK_TICKET_PRIORITY = :PICK_TICKET_PRIORITY,'
      '  RECEIVING_PRIORITY = :RECEIVING_PRIORITY,'
      '  MAT_STAGING_PRIORITY = :MAT_STAGING_PRIORITY'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from inv_trans_params'
      'where'
      '  ID = :OLD_ID')
    Left = 264
    Top = 169
  end
end
