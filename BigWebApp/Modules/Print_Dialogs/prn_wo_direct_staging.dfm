inherited FrmPrintWODirectedStaging: TFrmPrintWODirectedStaging
  Constraints.MinHeight = 276
  Constraints.MinWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited PageControl1: TUniPageControl
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited tabSelectionCriteria: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      inherited pnlCriteriaBottom: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited lblPrinting: TUniLabel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited edStatus: TUniEdit
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
      inherited pnlCriteriaTop: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited Label1: TUniLabel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited wwcombFrom: TUniDBLookupComboBox
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited pnlCriteriaRight: TUniPanel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          inherited Label2: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited wwcombTo: TUniDBLookupComboBox
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
        end
        inherited chkExcludeAttachedDocs: TUniCheckBox
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
    end
    inherited tabDestination: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 421
      ExplicitHeight = 302
      inherited PnlDestinationPCCarrier: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited pgctrDestination: TUniPageControl
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          inherited tabPrinter: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Label3: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabScreen: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Label4: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabFile: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Splitter2: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlFileRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited btnSaveFile: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFileClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited edSaveFile: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited cboxFileType: TUniComboBox
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlDestFileLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label6: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label5: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabEmail: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            inherited Splitter3: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlEmailRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited sbtnAssignEmail: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnBoilerPlates: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnOtherAttachments: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlEMailClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited edEmailTo: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited edSubject: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited memoEmail: TUniMemo
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited cboxEMailFileType: TUniComboBox
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited EdAttachmentName: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited edOtherAttachments: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlDestEMailLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label7: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label8: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label9: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label11: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lblOtherAttachments: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabFax: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited pnlFaxRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited sbtnFax: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnFaxSetup: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFaxClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited bvTopBuffer: TUniPanel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvLeftBuffer: TUniPanel
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvRightBuffer: TUniPanel
                Left = 383
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvBottomBuffer: TUniPanel
                Top = 241
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lviewFaxRecipients: TListView
                Left = 3
                Top = 3
                Width = 380
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
        end
      end
      inherited Panel1: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited TabControl1: TUniTabControl
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
    end
  end
  inherited pnlButtons: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Constraints.MinHeight = 35
    inherited pnlButtonsRight: TUniPanel
      Left = 115
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      inherited btnOK: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited btnCancel: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited BtnProp: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
  end
  inherited wwQryLookup: TFDQuery
    Tag = 0
    SQL.Strings = (
      'select /*+ ORDERED */'
      '       workorder.id as id,'
      '       standard.mfgno as mfgno,'
      '       arinvt.itemno as itemno,'
      '       arinvt.descrip as descrip,'
      '       arinvt.descrip2 as descrip2,'
      '       arinvt.rev as rev,'
      '       workorder.standard_id'
      '  from '
      '       standard, '
      '       partno, '
      '       arinvt,'
      '       workorder'
      ' where workorder.standard_id = standard.id'
      '   and partno.arinvt_id = arinvt.id'
      '   and partno.standard_id = standard.id'
      '   and misc.eplant_filter(standard.eplant_id) = 1'
      ' order by workorder.id'
      '')
    object wwQryLookupID: TBCDField
      DisplayLabel = 'WO#'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WORKORDER.ID'
      Size = 0
    end
    object wwQryLookupMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'IQ.STANDARD.MFGNO'
      Size = 50
    end
    object wwQryLookupITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object wwQryLookupDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Visible = False
      Size = 100
    end
    object wwQryLookupDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Visible = False
      Size = 100
    end
    object wwQryLookupREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      Visible = False
      FixedChar = True
      Size = 15
    end
    object wwQryLookupSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Origin = 'IQ.WORKORDER.STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select standard.id as standard_id,'
      '       workorder.id as workorder_id,'
      '       standard.mfg_type'
      '  from standard,'
      '       workorder'
      ' where workorder.id between :param1 and :param2'
      '   and workorder.standard_id = standard.id'
      '   and misc.eplant_filter(standard.eplant_id) = 1'
      ' order by workorder.id')
    ParamData = <
      item
        Name = 'param1'
        DataType = ftFloat
      end
      item
        Name = 'param2'
        DataType = ftFloat
      end>
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select 1'
      '  from dual'
      ' where 0 > 1'
      '-- this is just a stub'
      '')
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select 1'
      '  from dual'
      ' where 0 > 1'
      '-- this is just a stub'
      '')
  end
end
