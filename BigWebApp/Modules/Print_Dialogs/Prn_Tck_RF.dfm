inherited FrmPrintDocsTicketShippingLabel: TFrmPrintDocsTicketShippingLabel
  ClientWidth = 479
  Constraints.MinHeight = 340
  Constraints.MinWidth = 494
  ExplicitWidth = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Width = 479
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 479
  end
  inherited PageControl1: TUniPageControl
    Width = 479
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitWidth = 479
    inherited tabSelectionCriteria: TUniTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitWidth = 471
      inherited pnlCriteriaBottom: TUniPanel
        Width = 471
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 471
        inherited lblPrinting: TUniLabel
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
        inherited edStatus: TUniEdit
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
      end
      inherited pnlCriteriaTop: TUniPanel
        Width = 471
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 471
        inherited Label1: TUniLabel
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
        inherited wwcombFrom: TUniDBLookupComboBox
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
        inherited pnlCriteriaRight: TUniPanel
          Left = 309
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitLeft = 309
          inherited Label2: TUniLabel
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
          end
          inherited wwcombTo: TUniDBLookupComboBox
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
          end
        end
        inherited chkExcludeAttachedDocs: TUniCheckBox
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
        end
      end
    end
    inherited tabDestination: TUniTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitWidth = 471
      inherited PnlDestinationPCCarrier: TUniPanel
        Width = 471
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 471
        inherited pgctrDestination: TUniPageControl
          Width = 469
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 469
          inherited tabPrinter: TUniTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 461
            inherited Label3: TUniLabel
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
            end
          end
          inherited tabScreen: TUniTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 461
            inherited Label4: TUniLabel
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
            end
          end
          inherited tabFile: TUniTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 461
            inherited Splitter2: TUniSplitter
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
            end
            inherited pnlFileRight: TUniPanel
              Left = 437
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitLeft = 437
              inherited btnSaveFile: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
            end
            inherited pnlFileClient: TUniPanel
              Width = 350
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitWidth = 350
              inherited edSaveFile: TUniEdit
                Width = 353
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 353
              end
              inherited cboxFileType: TUniComboBox
                Width = 353
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 353
              end
            end
            inherited PnlDestFileLeft01: TUniPanel
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              inherited Label6: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited Label5: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
            end
          end
          inherited tabEmail: TUniTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 461
            inherited Splitter3: TUniSplitter
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
            end
            inherited pnlEmailRight: TUniPanel
              Left = 437
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitLeft = 437
              inherited sbtnAssignEmail: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited sbtnBoilerPlates: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited sbtnOtherAttachments: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
            end
            inherited pnlEMailClient: TUniPanel
              Width = 302
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitWidth = 302
              inherited edEmailTo: TUniEdit
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
              inherited edSubject: TUniEdit
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
              inherited memoEmail: TUniMemo
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
              inherited cboxEMailFileType: TUniComboBox
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
              inherited EdAttachmentName: TUniEdit
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
              inherited edOtherAttachments: TUniEdit
                Width = 306
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 306
              end
            end
            inherited PnlDestEMailLeft01: TUniPanel
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              inherited Label7: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited Label8: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited Label9: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited Label11: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited lblOtherAttachments: TUniLabel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
            end
          end
          inherited tabFax: TUniTabSheet
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            ExplicitWidth = 461
            inherited pnlFaxRight: TUniPanel
              Left = 437
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitLeft = 437
              inherited sbtnFax: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited sbtnFaxSetup: TUniSpeedButton
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
            end
            inherited pnlFaxClient: TUniPanel
              Width = 437
              Margins.Left = 5
              Margins.Top = 5
              Margins.Right = 5
              Margins.Bottom = 5
              ExplicitWidth = 437
              inherited bvTopBuffer: TUniPanel
                Width = 435
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 435
              end
              inherited bvLeftBuffer: TUniPanel
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
              end
              inherited bvRightBuffer: TUniPanel
                Left = 432
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitLeft = 432
              end
              inherited bvBottomBuffer: TUniPanel
                Width = 435
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 435
              end
              inherited lviewFaxRecipients: TListView
                Width = 428
                Margins.Left = 5
                Margins.Top = 5
                Margins.Right = 5
                Margins.Bottom = 5
                ExplicitWidth = 428
              end
            end
          end
        end
      end
      inherited Panel1: TUniPanel
        Width = 471
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        ExplicitWidth = 471
        inherited TabControl1: TUniTabControl
          Width = 469
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          ExplicitWidth = 469
        end
      end
    end
  end
  inherited pnlButtons: TUniPanel
    Width = 479
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Constraints.MinHeight = 28
    ExplicitWidth = 479
    inherited pnlButtonsRight: TUniPanel
      Left = 164
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 164
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited btnCancel: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited BtnProp: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
    end
  end
  inherited wwQryLookup: TFDQuery
    SQL.Strings = (
      'select distinct ps_ticket_id as id'
      'from v_ps_tickets_ex'
      'where misc.eplant_filter(eplant_id) = 1'
      'order by ps_ticket_id')
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select p.ps_ticket_id as id,'
      '       '#39' '#39' as mfg_type,'
      '       s.prime_contact as attn,'
      '       s.attn as company,'
      '       s.fax as fax_number'
      'from '
      
        '       (select distinct ps_ticket_id, ship_to_id from v_ps_ticke' +
        'ts_ex) p,'
      '       ship_to s'
      'where '
      '       p.ps_ticket_id between :param1 and :param2'
      '   and p.ship_to_id = s.id(+)'
      '   and misc.eplant_filter(s.eplant_id) = 1'
      'order by p.ps_ticket_id'
      ' '
      ' '
      ' ')
    Left = 36
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
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPrintDocsTicketShippingLabel')
  end
  inherited ImageList2: TUniImageList
    Top = 208
  end
end
