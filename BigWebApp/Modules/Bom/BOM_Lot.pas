unit Bom_Lot;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniEdit,
  uniDBEdit,
  uniLabel,
  uniPageControl,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniCheckBox,
  uniDBCheckBox,
  uniDBNavigator,
  uniBitBtn,
  uniSpeedButton, uniDateTimePicker, uniDBDateTimePicker, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, IQUniEditor, IQUniEditorDlg,
  IQUniEditorDlgMemo,
  MainModule;

type
  TBomNextLotNo = class(TUniForm)
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsFG_LOTNO: TBCDField;
    TabSheet2: TUniTabSheet;
    PnlToolbarGeneral: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    TblParamsFG_LOTNO_FORMULA: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnNext: TUniButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlThisBom: TUniPanel;
    Splitter1: TUniSplitter;
    PnlThisBomLeft: TUniPanel;
    PnlThisBomClient1: TUniPanel;
    Label2: TUniLabel;
    PnlThisBomClient3: TUniPanel;
    PnlThisBomClient2: TUniPanel;
    eFgLotNo: TUniEdit;
    sbtnFGLotnoExpression: TUniSpeedButton;
    PnlGeneralClient1: TUniPanel;
    Splitter2: TUniSplitter;
    PnlGeneralLeft: TUniPanel;
    PnlGeneralClient2: TUniPanel;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    chkUseUniqueLot: TUniCheckBox;
    TblParamsNO_DEFAULT_LOTNO_FINAL_ASSY: TStringField;
    dbchkDoNotDefaultLotnoFinalAssy: TUniDBCheckBox;
    chkRetainWorkorder: TUniCheckBox;
    lblExpLotDate: TUniLabel;
    wwDBDateTimePickerLotExpiry: TUniDateTimePicker;
    TblParamsID: TBCDField;
    procedure btnNextClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnFGLotnoExpressionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure TblParamsBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FStandard_ID: Real;
    FWorkorder_ID: Real;
    FOld_Use_Unique_Lotno: Boolean;
    FUse_WO_For_LotNo: Boolean;
    FIsLotExpiryDateMandatory: Boolean;

    function GetFGLotNo:string;
    procedure SetFGLotNo( const AValue: string );
    procedure CheckUpdateWorkorderFGLotNo;
    procedure CheckUpdateLotExpiryDate;
    procedure SetStandard_ID(const Value: Real);
    procedure SetWorkOrder_ID(const Value: Real);
  public
    { Public declarations }
    class function EvaluateExpression( ASQL: string; AStandard_ID: Real; AWorkorder_ID: Real = 0 ): string;

    property FGLotNo      : string read GetFGLotNo write SetFGLotNo;
    property Standard_ID  : Real                   write SetStandard_ID;
    property WorkOrder_ID : Real                   write SetWorkOrder_ID;
  end;

function DoGetFGLotNo( AFGLotNo:string; AStandard_ID: Real = 0; AWorkorder_ID: Real = 0):Boolean;

implementation

{$R *.DFM}

uses
  bom_rscstr,
//  EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
//  IQMS.Common.SecIns,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare;

function DoGetFGLotNo( AFGLotNo:string; AStandard_ID: Real = 0; AWorkorder_ID: Real = 0):Boolean;
var
  frm : TBomNextLotNo;
begin
  frm := TBomNextLotNo.Create(UniGUIApplication.UniApplication);
  frm.FGLotNo      := AFGLotNo;
  frm.Standard_ID  := AStandard_ID;
  frm.WorkOrder_ID := AWorkOrder_ID;

  Result := frm.ShowModal = mrOk;
  if Result then
    AFGLotNo:= frm.FGLotNo;
end;

function TBomNextLotNo.GetFGLotNo:string;
begin
  Result:= eFgLotNo.Text;
end;

procedure TBomNextLotNo.SetFGLotNo( const AValue: string );
begin
  eFgLotNo.Text:= AValue;
end;

procedure TBomNextLotNo.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TBomNextLotNo.SetWorkOrder_ID(const Value: Real);
begin
  FWorkorder_ID := Value;
end;

procedure TBomNextLotNo.TblParamsBeforePost(DataSet: TDataSet);
begin
  ExecuteCommandFmt('update params set fg_lotno = %s', [ DBEdit1.Text ]);
  if dbchkDoNotDefaultLotnoFinalAssy.Visible then
     ExecuteCommandFmt('update params set no_default_lotno_final_assy = ''%s''',
      [ IQMS.Common.StringUtils.BoolToYN( dbchkDoNotDefaultLotnoFinalAssy.Checked )]);
  TblParams.Cancel;
  Reopen( TblParams );
  FGLotNo:= IntToStr( TblParamsFG_LOTNO.asInteger );
  ABORT;
end;

procedure TBomNextLotNo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, PnlThisBomLeft, PnlGeneralLeft ]);
end;

procedure TBomNextLotNo.UniFormDestroy(Sender: TObject);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TBomNextLotNo.btnNextClick(Sender: TObject);
label exit_point;
begin
  if FUse_WO_For_LotNo and (FWorkorder_ID > 0) and (SelectValueByID('fg_lotno', 'workorder', FWorkorder_ID) > '') then
  begin
    // FGLotNo:= FloatToStr(FWorkorder_ID);
    // EIQ-4995 RT Production Monitoring - Lot# does not increment when ‘Use WO as Lot#’ is checked.
    FGLotNo:= SelectValueByID('fg_lotno', 'workorder', FWorkorder_ID);
    goto exit_point;
  end;

  ExecuteCommand('update params set fg_lotno = fg_lotno+1');
  Reopen( TblParams );

  {default fg_lot expression}
  if TblParamsFG_LOTNO_FORMULA.asString = '' then
  begin
    FGLotNo:= IntToStr( TblParamsFG_LOTNO.asInteger );
    goto exit_point;
  end;

  {custom expression}
  try
    // FGLotNo:= SelectValueAsString( TblParamsFG_LOTNO_FORMULA.asString );
    FGLotNo:= EvaluateExpression( TblParamsFG_LOTNO_FORMULA.asString, FStandard_ID, FWorkorder_ID );  {this unit}
  except on E: Exception do
    begin
      FGLotNo:= IntToStr( TblParamsFG_LOTNO.asInteger );
      IQError(Format('While evaluating user assigned Lot# expression the following error occured: '#13+
                     '%s'#13#13'Default Lot# is used instead.', [ FixFireDACErrorMessage(E) ]));
    end;
  end;

  exit_point:
    CheckUpdateWorkorderFGLotNo;
end;

procedure TBomNextLotNo.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQHelpHk.pas}
end;

procedure TBomNextLotNo.sbtnFGLotnoExpressionClick(Sender: TObject);
var
  S: string;
begin
  S:= TblParamsFG_LOTNO_FORMULA.asString;
//  if DoEditMemoStr( self, S, 4000, 'Lot# SQL Expression' ) then  {EditMemoStr.pas}
//  begin
//    TblParams.Edit;
//    TblParamsFG_LOTNO_FORMULA.asString:= S;
//    TblParams.Post;
//  end;
end;

procedure TBomNextLotNo.FormShow(Sender: TObject);
var
  ADate: TDateTime;
begin
  FUse_WO_For_LotNo:= SelectValueAsString('select sched_use_wo_for_lotno from params') = 'Y';

  IQSetTablesActiveEx( TRUE, self, '' );
  PageControl1.ActivePageIndex:= 0;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlThisBomClient2);

  FOld_Use_Unique_Lotno:= SelectValueFmtAsString('select use_unique_lotno from standard where id = %f', [ FStandard_ID ]) = 'Y';
  chkUseUniqueLot.Checked:= FOld_Use_Unique_Lotno;
  chkUseUniqueLot.Visible:= (FStandard_ID > 0) and SecurityRegister1.Visible['chkUseUniqueLot'];

  chkRetainWorkorder.Visible:= (FWorkorder_ID > 0) and (SelectValueByID('firm', 'workorder', FWorkorder_ID) = 'Y') and SecurityRegister1.Visible['chkRetainWorkorder'];
  if chkRetainWorkorder.Visible then
     chkRetainWorkorder.Checked:= SelectValueByID('fg_lotno', 'workorder', FWorkorder_ID) > '';

  dbchkDoNotDefaultLotnoFinalAssy.Visible:= (FStandard_ID > 0)
                                            and
                                            SecurityRegister1.Visible['dbchkDoNotDefaultLotnoFinalAssy']
                                            and
                                            IQMS.Common.MfgShare.IsMfgTypeSimilarToASSY1( SelectValueByID('mfg_type', 'standard', FStandard_ID ));

  // 11-03-2014 - Expiration Date is Mandatory
  // Note: in the future if  we need to populate the Exp Date see inv_misc.pas GetLotExpiryDate
  FIsLotExpiryDateMandatory:= (FStandard_ID > 0)
                              and
                              (SelectValueFmtAsFloat('select 1                                      '+
                                         '  from partno p, arinvt a                     '+
                                         ' where p.standard_id = %f                     '+
                                         '   and p.arinvt_id = a.id                     '+
                                         '   and a.is_lot_expiry_date_mandatory = ''Y'' '+
                                         '   and rownum < 2                             ',
                                         [ FStandard_ID ]) = 1);
   lblExpLotDate.Visible:= FIsLotExpiryDateMandatory and SecurityRegister1.Visible['wwDBDateTimePickerLotExpiry'];
   wwDBDateTimePickerLotExpiry.Visible:= FIsLotExpiryDateMandatory and SecurityRegister1.Visible['wwDBDateTimePickerLotExpiry'];
   if wwDBDateTimePickerLotExpiry.Visible then
   begin
     ADate:= SelectValueFmtAsFloat('select arinvt_misc.get_family_lot_expiry_date(%f, ''%s'') from dual',
                       [ FStandard_ID, FGLotNo ]);
     if ADate > 0 then
        wwDBDateTimePickerLotExpiry.DateTime:= ADate;
   end;
end;

class function TBomNextLotNo.EvaluateExpression( ASQL: string; AStandard_ID: Real; AWorkorder_ID: Real = 0 ): string;
var
  I: Integer;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( ASQL );

    for I:= 0 to ParamCount - 1 do
    begin
       {support parameter standard_id }
       if CompareText( Params[ I ].Name, 'standard_id') = 0 then
       begin
         ParamByName('standard_id').Value := AStandard_ID;
         Continue;
       end;

       {support parameter workorder_id }
       if CompareText( Params[ I ].Name, 'workorder_id') = 0 then
       begin
         ParamByName('workorder_id').Value := AWorkorder_ID;
         Continue;
       end;

       raise Exception.CreateFmt(#13+
                                 'Invalid parameter name ''%s'' in the SQL expression:'#13+
                                 '%s.'#13#13+
                                 'Supported parameter name are: '':standard_id, :workorder_id''.'#13+
                                 'Example: select rtrim(mfgno) from standard where id = :standard_id',
                                 [ Params[ I ].Name,
                                   ASQL ]);
    end;

    Open;

    Result:= Fields[ 0 ].asString;
  finally
    Free;
  end;
end;

procedure TBomNextLotNo.btnOKClick(Sender: TObject);
begin
  if chkUseUniqueLot.Visible and chkUseUniqueLot.Enabled and (FStandard_ID > 0) and (FOld_Use_Unique_Lotno <> chkUseUniqueLot.Checked) then
     ExecuteCommandFmt('update standard set use_unique_lotno = ''%s'' where id = %f',
               [ IQMS.Common.StringUtils.BoolToYN( chkUseUniqueLot.Checked ),
                 FStandard_ID ]);

  CheckUpdateWorkorderFGLotNo;

  CheckUpdateLotExpiryDate;

  ModalResult:= mrOK;
end;

procedure TBomNextLotNo.CheckUpdateWorkorderFGLotNo;
var
  AOldFg_Lotno: string;
begin
  if not chkRetainWorkorder.Visible then
     EXIT;

  AOldFg_Lotno:= SelectValueByID('fg_lotno', 'workorder', FWorkorder_ID );

  case chkRetainWorkorder.Checked of
     TRUE : if Trim(AOldFg_Lotno) <> Trim(FGLotNo) then
               ExecuteCommandFmt('update workorder set fg_lotno = ''%s'' where id = %f', [ FGLotNo, FWorkorder_ID ]);
     FALSE: if AOldFg_Lotno <> '' then
               ExecuteCommandFmt('update workorder set fg_lotno = null where id = %f', [ FWorkorder_ID ]);
  end;
end;

procedure TBomNextLotNo.CheckUpdateLotExpiryDate;
begin
  if not FIsLotExpiryDateMandatory or not wwDBDateTimePickerLotExpiry.Visible or (FStandard_ID = 0) then
     EXIT;

  if (wwDBDateTimePickerLotExpiry.DateTime = 0) or (FStandard_ID = 0) then
     EXIT;

  if not IQMS.Common.Dialogs.IQConfirmYNWithSecurity( bom_rscstr.cTXT0000034,  {'You are about to change the Expiration Date for this Lot#'}
                                         'UpdateLotExpiryDate',
                                         True) then
     ABORT;

  IQAssert( wwDBDateTimePickerLotExpiry.DateTime > 0, 'Expiration Date must be entered.');

  ExecuteCommandFmt('declare                                                                 '+
            '  v_standard_id number::= %f;                                           '+
            '  v_lotno       varchar2(100)::= ''%s'';                                '+
            '  v_date        date::= to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'');     '+
            'begin                                                                   '+
            '  for v in (select p.arinvt_id                                          '+
            '              from partno p, arinvt a                                   '+
            '             where p.standard_id = v_standard_id                        '+
            '               and p.arinvt_id = a.id                                   '+
            '               and a.is_lot_expiry_date_mandatory = ''Y''               '+
            '               order by p.id)                                           '+
            '  loop                                                                  '+
            '    arinvt_misc.assign_lot_expiry_date( v.arinvt_id, v_lotno, v_date ); '+
            '  end loop;                                                             '+
            'end;                                                                    ',
            [ FStandard_ID,
              FGLotNo,
              FormatDateTime('mm/dd/yyyy hh:nn:ss', wwDBDateTimePickerLotExpiry.DateTime) ]);
end;

end.

