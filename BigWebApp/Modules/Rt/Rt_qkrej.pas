unit RT_QkRej;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.Buttons,
  Data.DB,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  System.Variants,
  IQMS.WebVcl.About,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TRTQuickReject = class(TUniForm)
    SrcHist_illum_rt: TDataSource;
    QryHist_Illum_rt: TFDQuery;
    SrcRejects: TDataSource;
    TblRejects: TFDTable;
    TblRejectsID: TBCDField;
    TblRejectsHIST_ILLUM_PART_ID: TBCDField;
    TblRejectsPROD_DATE: TDateTimeField;
    TblRejectsSHIFT: TBCDField;
    TblRejectsREJECTS: TBCDField;
    TblRejectsREJECT_CODE: TStringField;
    TblRejectsSOURCE: TStringField;
    SrcCurrentProductionDate: TDataSource;
    QryCurrentProductionDate: TFDQuery;
    QryCurrentProductionDatePROD_DATE: TDateTimeField;
    QryCurrentProductionDateSHIFT: TFMTBCDField;
    QryCurrentProductionDateMFGCELL: TStringField;
    QryCurrentProductionDateWHEN_COMPLETED: TFMTBCDField;
    QryCurrentProductionDateWORK_CENTER_ID: TBCDField;
    QryHist_Illum_rtID: TBCDField;
    QryHist_Illum_rtCLASS: TStringField;
    QryHist_Illum_rtITEMNO: TStringField;
    QryHist_Illum_rtDESCRIP: TStringField;
    QryCurrentProductionDateILLUM_RT_ID: TBCDField;
    PnlMain: TUniPanel;
    PnlEnterRejectQty2: TUniPanel;
    QryCurrentProductionDateEQNO: TStringField;
    Panel5: TUniPanel;
    PnlProduction: TUniPanel;
    PnlNavProd: TUniPanel;
    NavProd: TUniDBNavigator;
    dbGridProductionDate: TUniDBGrid;
    PnlRejects: TUniPanel;
    dbGridRejects: TUniDBGrid;
    PnlNavRejects: TUniPanel;
    NavRejects: TUniDBNavigator;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    dbGridParts: TUniDBGrid;
    PnlNavParts: TUniPanel;
    NavParts: TUniDBNavigator;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    SD: TIQWebSecurityRegister;
    QryAllProductionDatesAndShifts: TFDQuery;
    DateTimeField1: TDateTimeField;
    FloatField1: TFMTBCDField;
    StringField1: TStringField;
    FloatField2: TFMTBCDField;
    FloatField3: TBCDField;
    FloatField4: TBCDField;
    StringField2: TStringField;
    SrcAllProductionDatesAndShifts: TDataSource;
    sbtnCurrentWorkCenterOnly: TUniSpeedButton;
    sbtnAllWorkCenters: TUniSpeedButton;
    sbtnAllProductionDatesAndShifts: TUniSpeedButton;
    QryCurrentOnly: TFDQuery;
    DateTimeField2: TDateTimeField;
    FloatField5: TFMTBCDField;
    StringField3: TStringField;
    FloatField6: TFMTBCDField;
    FloatField7: TBCDField;
    FloatField8: TBCDField;
    StringField4: TStringField;
    SrcCurrentOnly: TDataSource;
    edtIllum_RT_ID: TUniEdit;
    pnlButtons: TUniPanel;
    btnNew: TUniBitBtn;
    btnChange: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnClose: TUniBitBtn;
    TblRejectsATTRIBUTE: TStringField;
    SrcReject_Code: TDataSource;
    TblReject_Code: TFDTable;
    QryHist_Illum_rtFG_LOTNO: TStringField;
    TblRejectsFG_LOTNO: TStringField;
    QryHist_Illum_rtPROD_DATE: TDateTimeField;
    QryHist_Illum_rtSHIFT: TFMTBCDField;
    QryHist_Illum_rtACTCAV: TFMTBCDField;
    QryHist_Illum_rtHIST_ILLUM_RT_ID: TBCDField;
    QryHist_Illum_rtDAY_PART_ID: TBCDField;
    QryHist_Illum_rtXDAYPROD_ID: TFMTBCDField;
    TblRejectsDAY_PART_ID: TBCDField;
    TblRejectsCAVITY_NO: TStringField;
    QryHist_Illum_rtDESCRIP2: TStringField;
    QryHist_Illum_rtREV: TStringField;
    IQAbout1: TIQWebAbout;
    PopupMenu1: TUniPopupMenu;
    About1: TUniMenuItem;
    QryCurrentOnlyCNTR_DESC: TStringField;
    TblRejectsCOMMENT1: TStringField;
    TblReject_CodeREJECT_CODE: TStringField;
    TblReject_CodeATTRIBUTE: TStringField;
    TblReject_CodeEPLANT_ID: TBCDField;
    TblReject_CodeMFGCELL_ID: TBCDField;
    TblReject_CodeID: TBCDField;
    TblReject_CodePK_HIDE: TStringField;
    TblReject_CodeCUSER1: TStringField;
    TblReject_CodeCUSER2: TStringField;
    TblReject_CodeACCT_ID_REJECT: TBCDField;
    TblReject_CodeNON_CONFORM_LOCATIONS_ID: TBCDField;
    procedure bbtnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignIDBeforePost(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SrcHist_illum_rtDataChange(Sender: TObject; Field: TField);
    procedure SrcRejectsDataChange(Sender: TObject; Field: TField);
    procedure edtQtyChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure pnlButtonsResize(Sender: TObject);
    procedure SrcCurrentProductionDateDataChange(Sender: TObject; Field: TField);
    procedure dbGridProductionDateDblClick(Sender: TObject);
    procedure dbGridProductionDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnCurrentWorkCenterOnlyClick(Sender: TObject);
    procedure sbtnAllWorkCentersClick(Sender: TObject);
    procedure sbtnAllProductionDatesAndShiftsClick(Sender: TObject);
    procedure edtIllum_RT_IDChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
    MFGType: String;
    procedure OpenTables( AValue:Boolean );
    procedure FixLastColumnWidth( Grid:TUniDBGrid );
    procedure SetBtnNewEnable;
    procedure SetBtnChangeEnable;
    procedure ScaleForm( AFormName: TUniForm; XVariable, XConstant, YVariable, YConstant: Integer );

    procedure SyncRejectsTable;
    procedure Set_Init_ID(const Value: Real);
    procedure SetEquipmentNo(const Value: string);
  public
    { Public declarations }
    Init_ID         : Real;
    Prod_Date       : TDateTime;
    Shift           : Integer;
    FFormActive     : Boolean;

    property _Init_ID: Real write Set_Init_ID;
    property EquipmentNo : string write SetEquipmentNo;
  end;

procedure DoQuickRejects( A_Init_ID:Real; const AEquipmentNo :string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  //WEB_CONVERT IQSecIns,
  IQMS.Common.StringUtils,
  SD_Rej;
  //WEB_CONVERT touchscrn;


procedure DoQuickRejects( A_Init_ID:Real; const AEquipmentNo : string );
begin
   with TRTQuickReject.Create(UniGUIApplication.UniApplication) do
   begin
     _Init_ID:= A_Init_ID;
     EquipmentNo:= AEquipmentNo;
     Show;
   end;
end;

procedure TRTQuickReject.SetEquipmentNo(const Value: string);
begin
  Caption:= Format('RT Quick Reject Entry for Machine # %s', [ Value ]);
end;

procedure TRTQuickReject.Set_Init_ID(const Value: Real);
begin
  Init_ID:= Value;
end;

procedure TRTQuickReject.FormCreate(Sender: TObject);
var
   A: Variant;
begin
  IQSetTablesActive( TRUE, Self );

  IQRegFormRead( self, [ self,
                       PnlProduction,
                       PnlEnterRejectQty2,
                       // dbGridProductionDate,
                       dbGridParts ]);

  edtIllum_RT_ID.Text := FloatToStr( Init_ID );

  Application.ProcessMessages;

  sbtnCurrentWorkCenterOnlyClick( Self );

  // 01/19/2007
  MFGType:= SelectValueFmtAsString('select mfg.lookup_mfgtype( mfg_type ) from hist_illum_rt where id = %.0f', [Init_ID]);

  // 01/19/2007 Show or hide the CAVITY_NO column, depending on MFG type
  dbGridRejects.Columns[3].Visible := StrInList( MFGType, ['INJECTION', 'DIECAST', 'BLOWMOLD']);
end;

procedure TRTQuickReject.OpenTables( AValue:Boolean );
var
  i:Integer;
begin
  for i:= 0 to ComponentCount - 1 do
    if (Components[i] is TFDTable) or (Components[i] is TFDQuery) then
       TDataSet( Components[i] ).Active:= AValue;
end;

procedure TRTQuickReject.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self,
                       PnlProduction,
                       PnlEnterRejectQty2,
                       // dbGridProductionDate,
                       dbGridParts ]);

  FFormActive := FALSE;
  if (TblRejects.State in [dsEdit, dsInsert]) then with TblRejects do

     if IQConfirmYN('Last change has not been saved.'+#13+#13+'Save Now?') then
        Post
     else
        Cancel;
  IQSetTablesActive( FALSE, Self );

  FFormActive:= FALSE;
end;

procedure TRTQuickReject.bbtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TRTQuickReject.AssignIDBeforePost(DataSet: TDataSet);
begin
  with TblRejects do if State in [dsEdit, dsInsert] then begin
    if FieldByName('PROD_DATE').Value = NULL then
       FieldByName('PROD_DATE').asDateTime:= QryHist_Illum_rtPROD_DATE.asDateTime;  // Prod_Date;

    if FieldByName('SHIFT').Value = NULL then
       FieldByName('SHIFT').asInteger:= QryHist_Illum_rtSHIFT.asInteger; // Shift;

    if FieldByName('SOURCE').Value = NULL then
       FieldByName('SOURCE').asString:= 'RT';  {(R)eal(T)ime reject}

    if FieldByName('FG_LOTNO').Value = NULL then
       FieldByName('FG_LOTNO').asString:= QryHist_Illum_rtFG_LOTNO.asString;

     if QryHist_Illum_rtDAY_PART_ID.asFloat > 0 then
        FieldByName('DAY_PART_ID').asFloat:= QryHist_Illum_rtDAY_PART_ID.asFloat
     else
        FieldByName('DAY_PART_ID').Clear;

    //FieldByName('REJECTS').asFloat:= StrToFloat( Trim(edtQty.Text) );
    //FieldByName('REJECT_CODE').asString:= TblREJECT_CODE.FieldByName('REJECT_CODE').asString;
  end;
  IQAssignIDBeforePost(DataSet);
end;

procedure TRTQuickReject.FormResize(Sender: TObject);
begin
  if FFormActive = FALSE then Exit;
  {fix a few things}
  //PnlProduction.Height  := Round( PnlMain.Height / 3 );
  //PnlPartsRejects.Width := Round( PnlMain.Width / 2 );

  FixLastColumnWidth( dbGridProductionDate );
  FixLastColumnWidth( dbGridParts );
  FixLastColumnWidth( dbGridRejects );

end;

procedure TRTQuickReject.FixLastColumnWidth( Grid:TUniDBGrid );
const
  iINDICATOR_WIDE = 12;
var
  i, PixCount: Integer;
begin
  PixCount:= 0;
  with Grid do begin
    for i:= 0 to Columns.Count - 2 do    {leave out last column}
    begin
      Inc(PixCount, Columns[ I ].Width);
      if dgColLines in Grid.Options then
         Inc(PixCount, 3);
    end;

    if dgIndicator in Grid.Options then
      Inc(PixCount, iINDICATOR_WIDE + 3);

    {Assign Last Column Width}
    if Grid.ClientWidth - PixCount - 3 > 0 then
       Columns[Columns.Count - 1].Width:= Grid.ClientWidth - PixCount - 3;

    //if dgColLines in Grid.Options then
    //  Columns[Columns.Count - 1].Width:= Grid.ClientWidth - PixCount - Columns.Count - 1
    //else
    //  Columns[Columns.Count - 1].Width:= Grid.ClientWidth - PixCount - 1;
  end;
end;


procedure TRTQuickReject.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TRTQuickReject.SrcHist_illum_rtDataChange(Sender: TObject;
  Field: TField);
begin
  SetBtnNewEnable;
  SyncRejectsTable;
end;

procedure TRTQuickReject.SetBtnNewEnable;
begin
  btnNew.Enabled:= not (QryHist_Illum_rt.Eof and QryHist_Illum_rt.Bof);
end;

procedure TRTQuickReject.SyncRejectsTable;
var
  AIllum_Part_ID: Real;
  ADate         : TDateTime;
  AShift        : Real;
begin
  if not (dsInactive in [QryHist_Illum_rt.State, TblRejects.State ]) then
  begin
    AIllum_Part_ID:= QryHist_Illum_rtID.asFloat;
    ADate         := QryHist_Illum_rtPROD_DATE.asDateTime;
    AShift        := QryHist_Illum_rtSHIFT.asFloat;

    TblRejects.SetRange( [ AIllum_Part_ID, ADate, AShift ], [ AIllum_Part_ID, ADate, AShift ] );

    if QryHist_Illum_rtDAY_PART_ID.asFloat > 0 then
       TblRejects.Filter:= Format('DAY_PART_ID = %.0f', [ QryHist_Illum_rtDAY_PART_ID.asFloat ])
    else
       TblRejects.Filter:= 'DAY_PART_ID = NULL or DAY_PART_ID = 0';
    TblRejects.Filtered:= TRUE;
  end;
end;

procedure TRTQuickReject.SrcRejectsDataChange(Sender: TObject;
  Field: TField);
begin
  SetBtnChangeEnable;
  btnDelete.Enabled:= not(TblRejects.Eof and TblRejects.Bof);
end;

procedure TRTQuickReject.SetBtnChangeEnable;
begin
  btnChange.Enabled:= not(TblRejects.Eof and TblRejects.Bof);
end;

procedure TRTQuickReject.edtQtyChange(Sender: TObject);
begin
  SetBtnNewEnable;
  SetBtnChangeEnable;
end;

procedure TRTQuickReject.btnNewClick(Sender: TObject);
var
  ARejectOptions: TRejectOptions;
begin
  try
     if DoRejectPad( QryCurrentProductionDateWORK_CENTER_ID.AsFloat,
      QryHist_Illum_rtID.asFloat, ARejectOptions) then
        begin
          with TblRejects do
           begin
             Insert;
             TblRejectsREJECT_CODE.AsString := ARejectOptions.RejectCode;
             TblRejectsATTRIBUTE.AsString   := ARejectOptions.Attribute;
             TblRejectsREJECTS.AsFloat      := ARejectOptions.Quantity;
             TblRejectsCOMMENT1.AsString    := ARejectOptions.Comment;

             FieldByName('HIST_ILLUM_PART_ID').asFloat:= QryHist_Illum_rtID.asFloat;
             FieldByName('PROD_DATE').asDateTime      := QryHist_Illum_rtPROD_DATE.asDateTime;
             FieldByName('SHIFT').asFloat             := QryHist_Illum_rtSHIFT.asFloat;
             FieldByName('FG_LOTNO').asString         := QryHist_Illum_rtFG_LOTNO.asString;
             FieldByName('SOURCE').asString           := 'RT';
             if ARejectOptions.Cavity > 0 then
                FieldByName('CAVITY_NO').asString        := IntToStr(ARejectOptions.Cavity);

             if QryHist_Illum_rtDAY_PART_ID.asFloat > 0 then
                FieldByName('DAY_PART_ID').asFloat:= QryHist_Illum_rtDAY_PART_ID.asFloat
             else
                FieldByName('DAY_PART_ID').Clear;

             Post;
           end;
          end;
  except on E:Exception do
     begin
       { TODO -oBantuK -cWEB_CONVERT : Uses clause of this file is compile out.
       touchscrn.TouchScreen_Msg_Error(E.Message);}
       System.SysUtils.Abort;
     end;
  end;
end;


procedure TRTQuickReject.btnChangeClick(Sender: TObject);

{  if not IQConfirmYN(Format('Replace Current Rej Qty = %s, Reason = %s with New Qty = %s and Reason = %s?',
                            [TblRejects.FieldByName('REJECTS').asString, TblRejects.FieldByName('Reason').asString,
                             Trim(edtQty.Text), TblReject_Code.FieldByName('ATTRIBUTE').asString]))
}
var
  ARejectOptions: TRejectOptions;
begin
  try
     if DoRejectPad( QryCurrentProductionDateWORK_CENTER_ID.AsFloat,
      QryHist_Illum_rtID.asFloat, ARejectOptions) then
        begin
          with TblRejects do
           begin
             Edit;
             TblRejectsREJECT_CODE.AsString := ARejectOptions.RejectCode;
             TblRejectsATTRIBUTE.AsString   := ARejectOptions.Attribute;
             TblRejectsREJECTS.AsFloat      := ARejectOptions.Quantity;
             if ARejectOptions.Cavity > 0 then
                TblRejectsCAVITY_NO.AsString := IntToStr(ARejectOptions.Cavity);
             TblRejectsCOMMENT1.AsString    := ARejectOptions.Comment;
             Post;
           end;
        end;
  except on E:Exception do
    begin
       { TODO -oBantuK -cWEB_CONVERT : Uses clause of this file is compile out.
      touchscrn.TouchScreen_Msg_Error(E.Message);}
      System.SysUtils.Abort;
    end;
  end;
end;

procedure TRTQuickReject.btnDeleteClick(Sender: TObject);
begin
  // 11/12/2009 Changed LgMsgBx call to touchscrn call (Byron)
  { TODO -oBantuK -cWEB_CONVERT : Uses clause of this file is compile out.
  if not touchscrn.TouchScreen_Msg_ConfirmYN(
     Format('Delete current reject?'#13 +
            '(quantity = %s, reason = %s)',
            [TblRejects.FieldByName('REJECTS').asString,
             TblRejects.FieldByName('ATTRIBUTE').asString]))
     then EXIT;}

  TblRejects.Delete;
end;

procedure TRTQuickReject.pnlButtonsResize(Sender: TObject);
var
   W1: Integer;
begin
     {Prevents an access violation}
     if FFormActive = FALSE then Exit;

     W1 := Round( pnlButtons.ClientWidth / 4 ) - 2;
     if W1 < 77 then
        W1 := 77;

     btnNew.Width    := W1;
     btnChange.Width := W1;
     btnDelete.Width := W1;
     btnClose.Width   := W1;

     btnChange.Left := btnNew.Left + btnNew.Width;
     btnDelete.Left := btnChange.Left + btnChange.Width;

     if btnClose.Visible then
        btnClose.Left   := btnDelete.Left + btnDelete.Width;
end;

procedure TRTQuickReject.ScaleForm( AFormName: TUniForm; XVariable, XConstant, YVariable, YConstant: Integer );
var
   ARndPerc       : Integer;
   //ARealPerc      : Real;
   W, H, AUse     : Real;
begin
   {Get percentage of difference between original and current size}
   W := XVariable / XConstant;
   H := YVariable / YConstant;

   {Use the smaller value,
   whether the difference between width or between height}
   if H < W then
      AUse := H
   else
      AUse := W;
      ARndPerc := Round( AUse * 100 );

   {Get a real value percentage}
   //ARealPerc := ( ARndPerc * 0.01 ) ;  {}

   {Apply the scaling and sizing}
   with AFormName do
      begin
        ScaleBy( ARndPerc, 100 );
        Repaint;
      end;

end;

procedure TRTQuickReject.SrcCurrentProductionDateDataChange(Sender: TObject;
  Field: TField);
begin
     dbGridParts.DataSource   := nil;
     NavParts.DataSource      := nil;
     dbGridRejects.DataSource := nil;
     NavRejects.DataSource    := nil;

     dbGridParts.Color        := clBtnFace;
     dbGridParts.Enabled      := FALSE;
     dbGridRejects.Color      := clBtnFace;
     dbGridRejects.Enabled    := FALSE;
end;

procedure TRTQuickReject.dbGridProductionDateDblClick(Sender: TObject);
begin
     if FFormActive = FALSE then Exit;

     dbGridParts.DataSource      := SrcHist_illum_rt;
     NavParts.DataSource         := SrcHist_illum_rt;
     QryHist_Illum_rt.DataSource := dbGridProductionDate.DataSource;
     dbGridRejects.DataSource    := SrcRejects;
     NavRejects.DataSource       := SrcRejects;

     dbGridParts.Color           := clWindow;
     dbGridParts.Enabled         := TRUE;
     dbGridRejects.Color         := clWindow;
     dbGridRejects.Enabled       := TRUE;

end;

procedure TRTQuickReject.dbGridProductionDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ( Key = VK_RETURN ) or ( Key = VK_EXECUTE ) or ( Key = VK_F5 ) then
        dbGridProductionDateDblClick( Self );
end;

procedure TRTQuickReject.sbtnCurrentWorkCenterOnlyClick(Sender: TObject);
var
   AID: Real;
begin
     {Show only the current work center}
     {Get value from the edit box.  This can be easily changed if RTQuickReject
     is a child form of another application, namely Shop Data}
     try
        AID := StrToFloat( edtIllum_RT_ID.Text );
     except on Exception do raise;
     end;

     QryCurrentOnly.Close;
     dbGridProductionDate.DataSource := SrcCurrentOnly;
     NavProd.DataSource              := SrcCurrentOnly;
     QryCurrentOnly.ParamByName( 'illum_rt_id' ).Value := AID;
     QryCurrentOnly.Open;
end;

procedure TRTQuickReject.sbtnAllWorkCentersClick(Sender: TObject);
var
   AID: Real;
begin
     {Show all work centers for the current production date
     and shift, but find the current work center}
     {Get value from the edit box.  This can be easily changed if RTQuickReject
     is a child form of another application, namely Shop Data}
     AID := StrToFloat( edtIllum_RT_ID.Text );
     QryCurrentProductionDate.Close;
     dbGridProductionDate.DataSource := SrcCurrentProductionDate;
     NavProd.DataSource              := SrcCurrentProductionDate;
     QryCurrentProductionDate.Open;
     QryCurrentProductionDate.Locate( 'illum_rt_id', AID, [] );
end;

procedure TRTQuickReject.sbtnAllProductionDatesAndShiftsClick(
  Sender: TObject);
var
   AID: Real;
begin
     {Show all work centers for all production dates
     and shifts, and find the current work center}
     {Get value from the edit box.  This can be easily changed if RTQuickReject
     is a child form of another application, namely Shop Data}
     AID := StrToFloat( edtIllum_RT_ID.Text );
     QryAllProductionDatesAndShifts.Close;
     dbGridProductionDate.DataSource := SrcAllProductionDatesAndShifts;
     NavProd.DataSource              := SrcAllProductionDatesAndShifts;
     QryAllProductionDatesAndShifts.Open;
     QryAllProductionDatesAndShifts.Locate( 'illum_rt_id', AID, [] );
end;

procedure TRTQuickReject.edtIllum_RT_IDChange(Sender: TObject);
begin
    Init_ID := StrToFloat( edtIllum_RT_ID.Text );
end;

procedure TRTQuickReject.FormShow(Sender: TObject);
begin
  FFormActive:= TRUE;
  {get current prod date and shift}
  with TFDQuery.Create(self) do
  try
    ConnectionName:= 'IQFD';
    SQL.Add('Select prod_date, prod_shift from params');
    Open;
    Prod_Date:= Fields[0].asDateTime;
    Shift    := Fields[1].asInteger;
  finally
    Close; Free;
  end;

  { TODO -oBantuK -cWEB_CONVERT : Uses clause of this function is compile out.
  EnsureSecurityInspectorOnTopOf( self );}
end;

procedure TRTQuickReject.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

end.
