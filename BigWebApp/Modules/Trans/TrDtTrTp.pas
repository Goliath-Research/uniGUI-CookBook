unit TrDtTrTp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.DATESDLG,
  Mask,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGroupBox,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniButton, uniDateTimePicker,
  UniGUIApplication;

type
  TFrmTranDates = class(TFrmDatesDialog)
    GroupBox2: TUniGroupBox;
    Label3: TUniLabel;
    cbTransType: TUniDBComboBox;
    chkHideOrphan: TUniCheckBox;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    chkReviewPosted: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure cbTransTypeCloseUp(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    Extended : Boolean;
    FHideOrphan: Boolean;
    FFrom: TDateTime;
    FFTo: TDateTime;
    FTransType: string;
    FReviewPosted: Boolean;
    function GetTransTypeText: string;
    procedure CheckDatesPeriods;
    function HideShipmentsBasedOnCostPostingSettings: Boolean;
    procedure SetFrom(const Value: TDateTime);
    procedure SetFTo(const Value: TDateTime);
    procedure SetHideOrphan(const Value: Boolean);
    procedure SetReviewPosted(const Value: Boolean);
    procedure SetTransType(const Value: string);
  public
    { Public declarations }
    class function TransTypeDescriptionToText(S: string): string;
    property FTo: TDateTime write SetFTo;
    property From : TDateTime write SetFrom;
    property TransType:string write SetTransType;
    property ReviewPosted: Boolean write SetReviewPosted;
    property HideOrphan: Boolean write SetHideOrphan;
  end;

function GetTransDatesAndType( var AFrom, AFTo: TDateTime; var ATransType:string; var AHideOrphan, AReviewPosted: Boolean ): Boolean;
function GetTransDatesAndTypeEx( var AFrom, AFTo: TDateTime; var ATransType:string; var AHideOrphan, AReviewPosted: Boolean ): Boolean;



implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //CheckTransDates,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  System.Variants;

function GetTransDatesAndType( var AFrom, AFTo: TDateTime; var ATransType:string; var AHideOrphan, AReviewPosted: Boolean ): Boolean;
var
  FrmTranDates: TFrmTranDates;
begin
  FrmTranDates := TFrmTranDates.Create(UniGUIApplication.UniApplication);
  with FrmTranDates do
  begin
    try
       Result:= ShowModal = mrOK;
       if Result then
       begin
         AFrom:= Trunc(DateTimePicker1.DateTime);
         AFTo  := Trunc(DateTimePicker2.DateTime);
         ATransType := GetTransTypeText;  // cbTransType.Text;
         AHideOrphan:= chkHideOrphan.Checked;
         AReviewPosted:= chkReviewPosted.Checked;
       end;
    finally
       //Free;
    end
  end;
end;

function GetTransDatesAndTypeEx( var AFrom, AFTo: TDateTime; var ATransType:string; var AHideOrphan, AReviewPosted: Boolean ): Boolean;
var
  FrmTranDates: TFrmTranDates;
begin
  FrmTranDates := TFrmTranDates.Create(UniGUIApplication.UniApplication );
  with FrmTranDates do
  begin
    try
       Extended := TRUE;
       Result:= ShowModal = mrOK;
       if Result then
       begin
         AFrom:= Trunc(DateTimePicker1.DateTime);
         AFTo  := Trunc(DateTimePicker2.DateTime);
         ATransType := GetTransTypeText;  // cbTransType.Text;
         AHideOrphan:= chkHideOrphan.Checked;
         AReviewPosted:= chkReviewPosted.Checked;
       end;
    finally
       //Free;
    end
  end;
end;

procedure TFrmTranDates.UniFormCreate(Sender: TObject);
var
  I: Integer;
  S: string;
begin
  Extended := FALSE;

  // 09-15-2014 EIQ-4283
  if HideShipmentsBasedOnCostPostingSettings() then
  begin
    for I:= 0 to cbTransType.Items.Count - 1 do
    begin
       S:= GetToken( cbTransType.Items[ I ], #9, 1);  {IQMS.Common.StringUtils.pas}
       if CompareText( S, 'Shipments' ) = 0 then
       begin
         cbTransType.Items.Delete( I );
         Break;
       end;
    end;
    { TODO -oSanketG -cWC : Need to find alternative for ApplyList  in TUniDBComboBox  }
    //cbTransType.ApplyList;
  end;

  {drop down trans type}
  if FTransType > '' then
     for I:= 0 to cbTransType.Items.Count - 1 do
     begin
        if FTransType = 'Shipments' then
          S:= GetToken( cbTransType.Items[ I ], #9, 1 )  {IQMS.Common.StringUtils.pas}
        else if FTransType = 'Process Reverse Backflush' then
          S:= GetToken( cbTransType.Items[ I ], #9, 1 )  {IQMS.Common.StringUtils.pas}
        else
          S:= GetToken( cbTransType.Items[ I ], #9, 2 );  {IQMS.Common.StringUtils.pas}
        if CompareText( S, FTransType ) = 0 then
        begin
           cbTransType.ItemIndex:= I;
           BREAK;
        end;
     end;

  chkHideOrphan.Checked:= FHideOrphan;
  chkReviewPosted.Checked:= FReviewPosted;

  cbTransTypeCloseUp( nil );
end;

procedure TFrmTranDates.UniFormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not Extended then
  begin
    for I:= cbTransType.Items.Count - 1 downto 0 do
      if CompareText( IQMS.Common.StringUtils.GetToken( cbTransType.Items[ I ], #9, 2), 'SHIPMENTS-COGS' ) = 0 then
      begin
        cbTransType.Items.Delete( I );
        Break;
      end;
    { TODO -oSanketG -cWC : Need to find alternative for ApplyList  in TUniDBComboBox  }
    //cbTransType.ApplyList;
  end;

end;

function TFrmTranDates.HideShipmentsBasedOnCostPostingSettings: Boolean;
var
  A: Variant;
begin
  // 09-15-2014 EIQ-4283 PIT Std and Act- Hide transaction type Shipments from drop down list - Internal (AIT)
  A:= SelectValueArray('select nvl(std_cost_posting,''N''), nvl(act_cost_posting, ''N'') from iqsys');
  IQAssert( VarArrayDimCount( A ) > 0, 'Encountered error while accessing IQSYS.FIELDS STD_COST_POSTING and IQSYS.ACT_COST_POSTING');

  Result:= ((A[0] = 'Y') or (A[1] = 'Y'))
           and
           (SelectValueAsString('select post_ship_avait_inv from iqsys2') <> 'Y');
end;


procedure TFrmTranDates.SetFrom(const Value: TDateTime);
begin
  FFrom := Value;
end;

procedure TFrmTranDates.SetFTo(const Value: TDateTime);
begin
  FFTo := Value;
end;

procedure TFrmTranDates.SetHideOrphan(const Value: Boolean);
begin
  FHideOrphan := Value;
end;

procedure TFrmTranDates.SetReviewPosted(const Value: Boolean);
begin
  FReviewPosted := Value;
end;

procedure TFrmTranDates.SetTransType(const Value: string);
begin
  FTransType := Value;
end;

procedure TFrmTranDates.btnOKClick(Sender: TObject);
begin
  if DateTimePicker1.DateTime > DateTimePicker2.DateTime then
     raise Exception.Create( 'Invalid Scope - please reenter');
  // if Trim(cbTransType.Text) = '' then
  if GetTransTypeText = '' then
     raise Exception.Create( 'Transaction Type not specified');

   CheckDatesPeriods;

  // if Trim(cbTransType.Text) = 'InterPlant Transfers' then
  if GetTransTypeText = 'InterPlant Transfers' then
  begin
    if SecurityManager.EPlantsExist then
    begin
      if SecurityManager.EPlant_ID <> 'NULL' then
        raise exception.create('Cannot be logged into an EPlant to do Inter-Plant PIT transactions');
    end;
  end;
  ModalResult := mrOk;
end;

procedure TFrmTranDates.cbTransTypeCloseUp(Sender: TObject);
begin
  inherited;
  // IQEnableControl( chkHideOrphan,  Trim(cbTransType.Text) = 'Disposition Transactions' );
  IQEnableControl( chkHideOrphan,  GetTransTypeText = 'Disposition Transactions' );
  IQEnableControl( chkReviewPosted,  GetTransTypeText <> 'Shipments-COGS' );
  if not (chkReviewPosted.Enabled) then chkReviewPosted.Checked := false;
end;

function TFrmTranDates.GetTransTypeText: string;
var
  S: string;
  I:Integer;
  AFound:boolean;
begin
  if cbTransType.ItemIndex > -1 then
  begin

    // 03-28-2014 - commented out (not clear why we need this)
    // if cbTransType.ItemIndex > 11 then
    // begin
    //   AFound := false;
    //   for I:= cbTransType.Items.Count - 1 downto 0 do
    //     if CompareText( IQMS.Common.StringUtils.GetToken( cbTransType.Items[ I ], #9, 2), 'SHIPMENTS-COGS' ) = 0 then
    //     begin
    //       AFound := true;
    //       Break;
    //     end;
    //   if not AFound then  cbTransType.ItemIndex := cbTransType.ItemIndex - 1;
    // end;

    S:= GetToken( cbTransType.Items[ cbTransType.ItemIndex ], #9, 2 );  {IQMS.Common.StringUtils.pas}
    Result:= TransTypeDescriptionToText( S );
    // if      CompareText( S, 'Disposition Transactions' ) = 0 then  Result:= 'Disposition Transactions'
    // else if CompareText( S, 'Manual Transactions'      ) = 0 then  Result:= 'Manual Transactions'
    // else if CompareText( S, 'Receiving Transactions'   ) = 0 then  Result:= 'Receiving Transactions'
    // else if CompareText( S, 'Physical Inventory'       ) = 0 then  Result:= 'Physical Inventory'
    // else if CompareText( S, 'Scrap'                    ) = 0 then  Result:= 'Scrap'
    // else if CompareText( S, 'InterPlant Transfers'     ) = 0 then  Result:= 'InterPlant Transfers'
    // else if CompareText( S, 'Repair'                   ) = 0 then  Result:= 'Repair'
    // else if CompareText( S, 'Process WIP'              ) = 0 then  Result:= 'Process WIP'
    // else if CompareText( S, 'Finish Process WIP'       ) = 0 then  Result:= 'Finish Process WIP'
    // else if CompareText( S, 'Packing Slip'             ) = 0 then  Result:= 'Shipments'
    // else if CompareText( S, 'Shipments-COGS'           ) = 0 then  Result:= 'Shipments-COGS'
    // else if (CompareText( S, 'MRO'                     ) = 0) or
    //         (CompareText( S, 'PM'                      ) = 0)then  Result:= 'PM'
    // else if CompareText( S, 'Projects'                 ) = 0 then  Result:= 'Projects'
    // else if CompareText( S, 'REVERSE_BACKFLUSH'        ) = 0 then  Result:= 'Process Reverse Backflush'
    // else if CompareText( S, 'ADJUST WIP'               ) = 0 then  Result:= 'Adjust WIP'
    // else
    //      raise Exception.CreateFmt('Invalid trans type %s', [ S ])  {s/n happen}
  end
  else
     Result:= '';
end;


class function TFrmTranDates.TransTypeDescriptionToText( S: string ): string;
begin
  if      CompareText( S, 'Disposition Transactions' ) = 0 then  Result:= 'Disposition Transactions'
  else if CompareText( S, 'Manual Transactions'      ) = 0 then  Result:= 'Manual Transactions'
  else if CompareText( S, 'Receiving Transactions'   ) = 0 then  Result:= 'Receiving Transactions'
  else if CompareText( S, 'Physical Inventory'       ) = 0 then  Result:= 'Physical Inventory'
  else if CompareText( S, 'Scrap'                    ) = 0 then  Result:= 'Scrap'
  else if CompareText( S, 'InterPlant Transfers'     ) = 0 then  Result:= 'InterPlant Transfers'
  else if CompareText( S, 'Repair'                   ) = 0 then  Result:= 'Repair'
  else if CompareText( S, 'Process WIP'              ) = 0 then  Result:= 'Process WIP'
  else if CompareText( S, 'Finish Process WIP'       ) = 0 then  Result:= 'Finish Process WIP'
  else if CompareText( S, 'Packing Slip'             ) = 0 then  Result:= 'Shipments'
  else if CompareText( S, 'Shipments-COGS'           ) = 0 then  Result:= 'Shipments-COGS'
  else if (CompareText( S, 'MRO'                     ) = 0)
          or
          (CompareText( S, 'PM'                      ) = 0)then  Result:= 'PM'
  else if CompareText( S, 'Projects'                 ) = 0 then  Result:= 'Projects'
  else if CompareText( S, 'REVERSE_BACKFLUSH'        ) = 0 then  Result:= 'Process Reverse Backflush'
  else if CompareText( S, 'ADJUST WIP'               ) = 0 then  Result:= 'Adjust WIP'
  else
       raise Exception.CreateFmt('Invalid trans type %s', [ S ])  {s/n happen}
end;

procedure TFrmTranDates.CheckDatesPeriods;
var
  AConfirm:Integer;
  AFromPeriodId, AToPeriodId:Real;
begin
  AFromPeriodId := SelectValueFmtAsFloat('select gl_misc.GetGLPeriodID(To_Date(''%s'', ''MM/DD/RRRR'')) from dual', [FormatDateTime('mm/dd/yyyy', DateTimePicker1.DateTime)]);
  AToPeriodId   := SelectValueFmtAsFloat('select gl_misc.GetGLPeriodID(To_Date(''%s'', ''MM/DD/RRRR'')) from dual', [FormatDateTime('mm/dd/yyyy', DateTimePicker2.DateTime)]);
  if AFromPeriodId <> AToPeriodId then
  begin
    { TODO -oSanketG -cWC : Need to revisit, dependent on CheckTransDates }
    {AConfirm := IQDialogChkEx( TFrmCheckTransDates, 'Selected date scope spans multiple GL Periods. Continue?', 'TRANS_Confirm_Dates' );
    if AConfirm <> 1 then
      raise Exception.Create('Invalid Date Range');}
  end;
end;


end.

