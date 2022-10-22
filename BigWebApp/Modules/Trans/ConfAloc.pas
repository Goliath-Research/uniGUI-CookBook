unit ConfAloc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniComboBox,
  uniDBComboBox;


type TransOrigin = (ADD, SUBTRUCT, MOVE, CONFORM, ALLOCATE, CLEAR, DELETE); // Delete when Trans_Share Ready
type
  TFrmConfAlloc = class(TUniForm)
    SR: TIQWebSecurityRegister;
    wwQuery1: TFDQuery;
    wwQuery1DESCRIP: TStringField;
    wwQuery1CODE: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnNonConformMasterReason: TUniButton;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    CmbReason: TUniDBLookupComboBox;
    chkApplyToLot: TUniCheckBox;
    chkAllocatble: TUniCheckBox;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNonConformMasterReasonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FIgnoreAlreadyMarkedNCError : Boolean;
    procedure AssignToFgMulti(nCaId:Real);
    function  AssignNewValueToConforAlloc:Real;
    function  GetRightSql:String;
    procedure AssignFrmCaption;
    procedure AssignCmbBoxValues;
    Procedure CreateProcess( nFgMultiId:Real; nOrigin:TransOrigin; nIgnoreAlreadyMarkedNCError : Boolean = false );
  public
    { Public declarations }
    FReason_ID: Real;
    nOrig: TransOrigin;
    nId:Real;
  end;


procedure DoConfAlloc(nFgMultiId:Real; nOrigin:TransOrigin; nIgnoreAlreadyMarkedNCError : Boolean = false);
function DoGetReasonID(var AReason_ID: Real; nOrigin:TransOrigin):Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  trans_rscstr;


procedure DoConfAlloc(nFgMultiId:Real; nOrigin:TransOrigin; nIgnoreAlreadyMarkedNCError : Boolean = false);
var
  AConfirm:integer;
  ATranslog_ID: Real;
  FrmConfAlloc: TFrmConfAlloc;
begin
  FrmConfAlloc:=TFrmConfAlloc.Create(uniGUIApplication.UniApplication);
  with FrmConfAlloc do
  begin
    CreateProcess(nFgMultiId, nOrigin, nIgnoreAlreadyMarkedNCError);
    if (ShowModal = mrOK) and (FReason_ID > 0) then
    begin
       AssignToFgMulti( FReason_ID );
       // if nOrig = CONFORM then
       // begin
       //    {transaction}
       //    with TTransNonConform.Create( Application, nID, FReason_ID, IQMS.Common.StringUtils.BoolToYN( chkAllocatble.Checked )) do
       //    try
       //      Execute;
       //      ATranslog_ID:= SelectValueFmtAsFloat('select id from translog where sub_batch = %f and fgmulti_id = %f', [ Sub_Batch, nID ]);
       //    finally
       //      Free;
       //    end;
       //
       //    {mrb}
       //    if SecurityManager.SetVisibleIfLicensed( nil {sbtn}, nil {menu option}, NIL, IQAppsNames[ apIQMRB   ], nil {SR} )  then
       //    begin
       //      AConfirm := IQDialogChkEx( TFrmCheckMrb, 'Would you like to create an MRB?', 'Trans_ConfirmMRB' );
       //      if AConfirm = 1 then
       //      try
       //         Com_Exec( 'IQQC', [ QC_Const.QC_MRB_INSERT_NEW_EX_2,                        { IQComExe.pas }
       //                             0,                                                    { wf_header_id }
       //                             SelectValueByID( 'arinvt_id', 'fgmulti', nFgMultiId ),     { arinvt_id    }
       //                             nFgMultiId,                                           { fgmulti_id   }
       //                             ATranslog_ID ]);                                      { translog_id (to update source & source_id)}
       //      except on E:Exception do                                                     // in case Cancel was clicked
       //         if not E.ClassNameIs( 'EAbort' ) and not E.ClassNameIs( 'EOleException' ) then raise;
       //      end;
       //    end;
//             and IQConfirmYN('Would you like to create an MRB?') then
       // end;
    end;
  end;
end;


function DoGetReasonID(var AReason_ID: Real; nOrigin:TransOrigin):Boolean;
var
  FrmConfAlloc: TFrmConfAlloc;
begin
  FrmConfAlloc:=TFrmConfAlloc.Create(uniGUIApplication.UniApplication);
  with FrmConfAlloc do
  begin
    CreateProcess( 0, nOrigin);
    Result:= ShowModal = mrOK;
    if Result then
       AReason_ID:= FReason_ID;
  end;
end;

procedure TFrmConfAlloc.CreateProcess(nFgMultiId: Real; nOrigin: TransOrigin;
  nIgnoreAlreadyMarkedNCError: Boolean);
begin
  nId := nFgMultiId;
  FReason_ID:= 0;
  FIgnoreAlreadyMarkedNCError:= nIgnoreAlreadyMarkedNCError;
  nOrig := nOrigin;
//  CheckBox1.checked := SelectValueAsString('select NVL(DONT_UPDATE_NON_CONFORM, ''N'') from iqsys2 where rownum < 2') = 'Y';
//  CheckBox1.visible := (nOrig = CONFORM);

  chkApplyToLot.Visible:= (nID > 0) and (nOrigin in [CONFORM, ALLOCATE]) and (SelectValueByID('lotno', 'fgmulti', nID) > '');
  chkAllocatble.Visible:= (nID > 0) and (nOrigin in [ CONFORM ]);

  AssignFrmCaption;
  AssignCmbBoxValues;

  // self.Constraints.MinHeight:= Height;
  // self.Constraints.MaxHeight:= Height;
end;

procedure TFrmConfAlloc.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, PnlLeft01 ]);
end;

procedure TFrmConfAlloc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;


procedure TFrmConfAlloc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:= True;

  if ( nOrig in [CONFORM, ALLOCATE] ) and FIgnoreAlreadyMarkedNCError then
    CanClose := Trim(CmbReason.Text) <> '';
end;

procedure TFrmConfAlloc.AssignFrmCaption;
begin
  case nOrig of
    ADD      : Caption := 'Add Reason';
    SUBTRUCT : Caption := 'Subtruct Reason';
    MOVE     : Caption := 'Transfer Reason';
    CONFORM  : Caption := 'Non-Conform Reason';
    ALLOCATE : Caption := 'Non-Allocate Reason';
    CLEAR    : Caption := 'Clear Location Reason';
    DELETE   : Caption := 'Delete Location Reason';
  end
end;

procedure TFrmConfAlloc.AssignCmbBoxValues;
begin
  if not (nOrig in [CONFORM, ALLOCATE]) then Exit;

  with wwQuery1 do
  begin
    SQL.Clear;
    case nOrig of
      CONFORM  : Sql.Add('Select descrip, code from non_conform where NVL(pk_hide, ''N'') = ''N'' order by descrip');
      ALLOCATE : Sql.Add('Select descrip, code from non_allocate order by descrip');
    end;
    Open;
  end;
end;

procedure TFrmConfAlloc.BtnOkClick(Sender: TObject);
var
  cSql:String;
  nCAId:Real;
  AText: string;
begin
  AText:= UpperCase(CmbReason.Text);

  if nOrig in [CONFORM, ALLOCATE] then
  begin
    if Trim(AText) = '' then
      raise Exception.Create( trans_rscstr.cTXT0000079 {'Reason is empty'});

    cSql := GetRightSql;
    nCaId:= SelectValueFmtAsFloat( cSql, [ FixStr( AText ) ]);  {IQMS.Common.StringUtils.pas}

    if nCaId = 0 then
      nCaId:= AssignNewValueToConforAlloc;

    if nCaId <> 0 then
      FReason_ID:= nCaId;

    if (nCaId = 0) and chkApplyToLot.Visible and chkApplyToLot.Checked then
      raise Exception.Create(trans_rscstr.cTXT0000080); //'Undefined reason code. Unable to apply to lot number - operation aborted';

  end;

  ModalResult:= mrOK;
end;


function TFrmConfAlloc.AssignNewValueToConforAlloc:Real;
begin
  case nOrig of
    CONFORM  :
    begin
//      if not CheckBox1.checked then
//      begin
//        Result := GetNextID('NON_CONFORM');
//        ExecuteCommandFmt('insert into non_conform (id, code, descrip) values (%f, ''%.0f'', ''%s'')', [Result, Result, CmbReason.Text]);
//      end
//      else
        Result := 0;
    end;
    ALLOCATE :
    begin
      Result := GetNextID('NON_ALLOCATE');
      ExecuteCommandFmt('insert into non_allocate (id, code, descrip) values (%f, ''%.0f'', ''%s'')', [Result, Result, CmbReason.Text])
    end;
  end;
end;


function TFrmConfAlloc.GetRightSql:String;
begin
  case nOrig of
    CONFORM  : Result := 'select id from non_conform where upper(descrip) = upper(''%s'')';
    ALLOCATE : Result := 'select id from non_allocate where upper(descrip) = upper(''%s'')';
  end;
end;

procedure TFrmConfAlloc.AssignToFgMulti(nCaId:Real);
var
  AArinvt_Lot_Doc_ID: Real;
  AFgMultiList: TStringList;
  AArinvt_ID :Real;
  ALotNo: string;
  APSTicketList :String;
  AList: TStringList;
  I: Integer;
begin
  if nId = 0 then EXIT;

  AArinvt_ID:= SelectValueByID( 'arinvt_id', 'fgmulti', nID {fgmulti_id});
  ALotNo:= SelectValueByID( 'lotno', 'fgmulti', nID {fgmulti_id});

  AArinvt_Lot_Doc_ID:= 0;
  if chkApplyToLot.Visible and chkApplyToLot.Checked then
  begin
    AList:= TStringList.Create;
    try
      AList.Sorted:= TRUE;
      AList.Duplicates:= DupIgnore;
      with TFDQuery.Create(NIL) do
      try
        Connection := UniMainModule.FDConnection1;

        SQL.Add(Format( 'select id from fgmulti where lotno = ''%s'' and arinvt_id = %f', [ ALotNo, AArinvt_ID ]));
        Open;
        while not Eof do
        begin
          LoadColumnValueIntoStringList( AList,
                                         Format( 'select d.ps_ticket_id '+
                                                 '  from ps_ticket_dtl d, ps_ticket_rel r '+
                                                 ' where r.fgmulti_id = %f '+
                                                 '   and r.ps_ticket_dtl_id = d.id', [FieldByName('ID').asFloat]),
                                         nil,  // AExecuteOnAdd
                                         FALSE );  // AClearList

          Next;
        end;
      finally
        Free;
      end;

      if AList.Count > 0 then
      begin
        for I:= 0 to AList.Count - 1 do
        begin
          if I = 0 then
            APSTicketList:= AList[ I ]
          else
            APSTicketList:= APSTicketList + ', ' + AList[ I ];
        end;
      end;

      if AList.Count > 0 then
        IQWarning(Format(cTXT0000081, [ ALotNo, APSTicketList ])); // 'Lot # %s has inventory on Pick Ticket # %s. Please make the necessary adjustments to the Pick Ticket'
    finally
      AList.Free;
    end;

    ExecuteCommandFmt('begin arinvt_misc.check_create_arinvt_lot_docs( %f ); end;', [ nID ]);
    AArinvt_Lot_Doc_ID:= SelectValueFmtAsFloat('select arinvt_misc.get_arinvt_lot_docs_id( %f ) from dual', [ nID ]);
  end;

  case nOrig of
    CONFORM  :
       begin
         // process fgmulti
         AFgMultiList:= TStringList.Create;
         try
//           if AArinvt_Lot_Doc_ID > 0 then
//              trans_share.LoadConformingTransLocationsUsingLotNo( AFgMultiList, AArinvt_ID, ALotNo )
//            else
//              AFgMultiList.Add( FloatToStr(nID {fgmulti}));
//           if AFgMultiList.Count > 0 then
//             trans_share.ToggletoNonConf2( self, AFgMultiList, nCaId, BoolToYN(chkAllocatble.Checked), FIgnoreAlreadyMarkedNCError );
         finally
           AFgMultiList.Free;
         end;

         // chkApplyToLot.Checked
         if AArinvt_Lot_Doc_ID > 0 then
         begin
            ExecuteCommandFmt('update arinvt_lot_docs set non_conform_id = %f where id = %f', [ nCaId, AArinvt_Lot_Doc_ID ]);
            if chkAllocatble.Visible then
                ExecuteCommandFmt('update arinvt_lot_docs set non_conform_allocatable = ''%s'' where id = %f', [ IQMS.Common.StringUtils.BoolToYN( chkAllocatble.Checked ), AArinvt_Lot_Doc_ID ]);
         end;
       end;

    ALLOCATE :
       begin
         if AArinvt_Lot_Doc_ID > 0 then
            ExecuteCommandFmt('update arinvt_lot_docs set non_allocate_id = %f where id = %f', [ nCaId, AArinvt_Lot_Doc_ID ]);
         ExecuteCommandFmt('update fgmulti set non_allocate_id = %f where id = %f', [nCaId, nId]);
       end;
  end;
end;


procedure TFrmConfAlloc.BtnCancelClick(Sender: TObject);
begin
  if FIgnoreAlreadyMarkedNCError then
  begin
    IQError( trans_rscstr.cTXT0000078);//'Reason Required for new locations!'
    ABORT;
  end
  else
    ModalResult:= mrCancel;
end;

procedure TFrmConfAlloc.btnNonConformMasterReasonClick(Sender: TObject);
begin
//  case nOrig of
//    CONFORM  : DoNonConformCodes;  {NonConf}
//    ALLOCATE : DoNonAllocateCodes; {NonAlloc}
//  end;
  AssignCmbBoxValues;
end;

procedure TFrmConfAlloc.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.
