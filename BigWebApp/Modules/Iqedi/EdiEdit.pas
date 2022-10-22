unit EdiEdit;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.About,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, uniComboBox, uniDBComboBox, uniGUIFrame,
  IQUniGrid;

type
  TFrmEdiEdit = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Splitter2: TUniSplitter;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    GridHdr: TIQUniGridControl;
    GridDtl: TIQUniGridControl;
    GridToken: TIQUniGridControl;
    SrcHdr: TDataSource;
    SrcDtl: TDataSource;
    SrcToken: TDataSource;
    TblHdr: TFDTable;
    TblToken: TFDTable;
    TblHdrID: TBCDField;
    TblHdrTRANSACTION_SET_UNIQUE_ID: TStringField;
    TblHdrEDI_PARTNERS_TS_ID: TBCDField;
    TblHdrEDI_FILE: TStringField;
    TblTokenID: TBCDField;
    TblTokenEDI_EDIT_DTL_ID: TBCDField;
    TblTokenTOKEN_CODE: TStringField;
    TblTokenDATA_TYPE: TStringField;
    TblTokenTOKEN_NAME: TStringField;
    TblTokenTOKEN_VALUE: TStringField;
    TblTokenSEGMENT_TOKENS_ID: TBCDField;
    IQAbout1: TIQWebAbout;
    QryDtl: TFDQuery;
    QryDtlID: TBCDField;
    QryDtlEDI_EDIT_HDR_ID: TBCDField;
    QryDtlSEG: TStringField;
    QryDtlMASTER_SEGMENTS_ID: TBCDField;
    QryDtlDESCRIP: TStringField;
    QryDtlSEQ: TBCDField;
    wwedifile: TUniEdit;
    OpenDialog1: TOpenDialog;
    SBSearch: TUniSpeedButton;
    PkSearch: TIQWebHPick;
    QryTsPartner: TFDQuery;
    QryTsPartnerID: TBCDField;
    QryTsPartnerEDI_PARTNERS_ID: TBCDField;
    QryTsPartnerTP_INTERCHANGE_CODE: TStringField;
    QryTsPartnerARCUSTO_ID: TBCDField;
    QryTsPartnerCOMPANY: TStringField;
    QryTsPartnerCUSTNO: TStringField;
    TblHdrinterchange_code: TStringField;
    TblHdrcustomer: TStringField;
    TblHdrcustno: TStringField;
    PkSearchID: TBCDField;
    PkSearchTRANSACTION_SET_UNIQUE_ID: TStringField;
    PkSearchEDI_FILE: TStringField;
    PkSearchEDI_PARTNERS_TS_ID: TBCDField;
    PkSearchINTERCHANGE_CODE: TStringField;
    PkSearchARCUSTO_ID: TBCDField;
    PkSearchCUSTOMER: TStringField;
    PkSearchCUSTNO: TStringField;
    New1: TUniMenuItem;
    N1: TUniMenuItem;
    Search1: TUniMenuItem;
    UpdateSQL1: TFDUpdateSQL;
    dbCustomer: TUniDBLookupComboBox;
    sbCreateEdiFile: TUniSpeedButton;
    CreateOutputEdifile1: TUniMenuItem;
    TblHdrPOOL_BILL_NUMBER: TStringField;
    TblHdrNET: TFMTBCDField;
    TblHdrGROSS: TFMTBCDField;
    TblHdrDOCK_NUMBER: TStringField;
    TblHdrTARE: TFMTBCDField;
    TblHdrSHIPMENTS_ID: TBCDField;
    QryShip: TFDQuery;
    QryShipID: TBCDField;
    QryShipSHIPDATE: TDateTimeField;
    TblHdrPackslipno: TStringField;
    TblHdrShipDate: TDateTimeField;
    PkSearchSHIPMENTS_ID: TBCDField;
    PkSearchPOOL_BILL_NUMBER: TStringField;
    PkSearchDOCK_NUMBER: TStringField;
    QryShipPACKSLIPNO: TStringField;
    PkSearchPACKSLIPNO: TStringField;
    CreateXMLfile1: TUniMenuItem;
    procedure TblHdrBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure wwedifileCustomDlg(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure PkSearchIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblTokenBeforeEdit(DataSet: TDataSet);
    procedure QryDtlBeforeEdit(DataSet: TDataSet);
    procedure QryDtlBeforePost(DataSet: TDataSet);
    procedure QryDtlBeforeInsert(DataSet: TDataSet);
    procedure QryDtlAfterCancel(DataSet: TDataSet);
    procedure QryDtlAfterDelete(DataSet: TDataSet);
    procedure QryDtlAfterPost(DataSet: TDataSet);
    { TODO : TGridDrawState and TNaviagetBtn has no corresponding uni component }
  {  procedure NavDtlBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure GridDtlCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);     }
    procedure About1Click(Sender: TObject);
    procedure TblTokenBeforePost(DataSet: TDataSet);
    procedure sbCreateEdiFileClick(Sender: TObject);
    procedure CreateXMLfile1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    Finserting :Boolean;
    FSeq : Integer;
    FBof : Boolean;
    FEof : Boolean;
    FEdi:TextFile;

    FISA_Seq :String;
    FGS_Seq  :String;
    FST_Seq  :String;
    FES  :String;
    FST  :String;
    FSES :String;
    FId: Real;

    procedure UpdateSECount;
    procedure PopulateEdiFile;
    procedure GetISA_GS_ST_Sequences;
    procedure GetSeparators;
    function  ConvertASCIItoTEXT(AStr:String):string;
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    property Id : Real write SetId;
  end;

procedure DoShowEdiEdit(AId:Real);

implementation

uses
  edi_rscstr,
  ediXMLShare,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{$R *.DFM}

procedure DoShowEdiEdit(AId:Real);
var
  LFrmEdiEdit : TFrmEdiEdit;
begin
  LFrmEdiEdit := TFrmEdiEdit.Create(UniGUIApplication.UniApplication);
  LFrmEdiEdit.Id := AId;
  LFrmEdiEdit.Show;
end;

procedure TFrmEdiEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridHdr, GridDtl, GridToken, Panel2, Panel3]);
end;

procedure TFrmEdiEdit.TblHdrBeforePost(DataSet: TDataSet);
begin
  if TblHdrEDI_PARTNERS_TS_ID.asFloat = 0 then
    raise Exception.Create(edi_rscstr.cTXT0000176 {'Please assign a Customer.'});
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;


procedure TFrmEdiEdit.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEdiEdit.wwedifileCustomDlg(Sender: TObject);
var
  ADir:string;
begin
  if IQRegStringScalarRead( self, 'EdiFileDir', ADir ) then
    OpenDialog1.InitialDir := ADir;
  with OpenDialog1, TblHdr do
    if OpenDialog1.Execute then
    begin
      IQRegStringScalarWrite( self, 'EdiFileDir', ExtractFileDir(FileName));
      if not (State in [dsEdit, dsInsert]) then Edit;
      FieldByName('EDI_FILE').AsString := FileName;
    end;

end;

procedure TFrmEdiEdit.SBSearchClick(Sender: TObject);
var
  nId:Real;
begin
  with PkSearch do
    if Execute then
    begin
      nId := GetValue('ID');
      if nID > 0 then
         TblHdr.FindKey( [ nId ]);
    end
    else System.SysUtils.Abort;

end;

procedure TFrmEdiEdit.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmEdiEdit.New1Click(Sender: TObject);
begin
  { TODO : NavHdr has no method BtnClick }
  //GridHdr.DBNavigator.BtnClick(nbInsert);
end;

procedure TFrmEdiEdit.PkSearchIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action     := mrOK;
  ResultValue:= 0;
  PostMessage( Handle, wm_Command, New1.Command, 0 );
end;

procedure TFrmEdiEdit.TblTokenBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmEdiEdit.QryDtlBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmEdiEdit.QryDtlBeforePost(DataSet: TDataSet);
begin
  QryDtlEDI_EDIT_HDR_ID.AsFloat := TblHdrID.asFloat;
  if QryDtlEDI_EDIT_HDR_ID.AsFloat = 0 then
    raise exception.create(edi_rscstr.cTXT0000177 {'Parent record must be assigned.'});

  if QryDtlID.asFloat = 0 then
    QryDtlID.AsFloat := GetNextID('EDI_EDIT_DTL');
end;

procedure TFrmEdiEdit.QryDtlBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  Finserting := True;
  FSeq := QryDtlSEQ.asInteger;
  FBof := QryDtl.Bof;
  FEof := QryDtl.Eof;
end;

procedure TFrmEdiEdit.QryDtlAfterCancel(DataSet: TDataSet);
begin
  Finserting := False;
end;

procedure TFrmEdiEdit.QryDtlAfterDelete(DataSet: TDataSet);
var
  ASeq:integer;
  AId:Real;
begin
  try
{
    try
      QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
    except on E:Exception do
      begin
        Application.ShowException(E);
        QryDtl.Close;
        QryDtl.Open;
        ABORT;
      end;
    end;
}
    AId := QryDtlID.asFloat;
    ASeq := 0;
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(Format('select id from edi_edit_dtl where edi_edit_hdr_id = %f order by seq', [TblHdrID.asFloat]));
      Open;
      while not eof do
      begin
        Inc(ASeq);
        ExecuteCommandFmt('update edi_edit_dtl set seq = %d where id = %f', [ASeq, FieldByName('ID').asFloat]);
        next;
      end;
    finally
      free;
    end;
    UpdateSECount;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
  finally
    Finserting := False;
  end;
end;

procedure TFrmEdiEdit.QryDtlAfterPost(DataSet: TDataSet);
var
  AId:Real;
begin
{
  try
    QryDtl.DataBase.ApplyUpdates( [ QryDtl ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryDtl.Close;
      QryDtl.Open;
      ABORT;
    end;
  end;
}
  if FInserting then
  try
    AId := QryDtlID.asFloat;
    if FBof then
    begin
      ExecuteCommandFmt('update edi_edit_dtl set seq = 0 where id = %f', [AId]);
      ExecuteCommandFmt('update edi_edit_dtl set seq = seq + 1 where edi_edit_hdr_id = %f', [TblHdrID.asFloat]);
    end
    else if FEof then
    begin
      ExecuteCommandFmt('update edi_edit_dtl set seq = %d where id = %f', [FSeq + 1, AId]);
    end
    else
    begin
      ExecuteCommandFmt('update edi_edit_dtl set seq = %d where id = %f', [FSeq, AId]);
      ExecuteCommandFmt('update edi_edit_dtl set seq = seq + 1 ' +
                'where edi_edit_hdr_id = %f and seq >= %d and id <> %f', [TblHdrID.asFloat, FSeq, AId]);
    end;
    UpdateSECount;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
  finally
    Finserting := False;
  end;

end;

procedure TFrmEdiEdit.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridHdr, GridDtl, GridToken, Panel2, Panel3]);
  IQSetTablesActive( TRUE, self );
  { TODO : Cannot access protected symbol TWinControl.Ctl3D }
  //GridDtl.Ctl3D := False;
  if not TblHdr.Locate('ID', FId, []) then
  begin

    try
      SBSearchClick(NIL) ;      // activate search speed button
    except on E:EAbort do
      begin
        PostMessage( Handle, wm_Command, Exit1.Command, 0 );   { Call "Exit" }
      end;
    end;

  end;
end;

procedure TFrmEdiEdit.UpdateSECount;
var
  ACounter:Integer;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(Format('select id, seg from edi_edit_dtl where edi_edit_hdr_id = %f order by seq', [TblHdrID.asFloat]));
    Open;
    ACounter := 0;
    while not eof do
    begin
      Inc(ACounter);
      if FieldByName('SEG').asString = 'ST' then
        ACounter := 1;
      if FieldByName('SEG').asString = 'SE' then
        ExecuteCommandFmt('update edi_edit_dtl_tokens set token_value = ''%s'' ' +
                  'where edi_edit_dtl_id = %f and token_code = ''SE01''', [IntToStr(ACounter), FieldByName('ID').asFloat]);
      next;
    end;
  finally
    Free;
  end;
end;

{ TODO : TNavigateBtn has no corresponding uni component }
{procedure TFrmEdiEdit.NavDtlBeforeAction(Sender: TObject;   Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbRefresh then
  begin
    AId := QryDtlID.asFloat;
    QryDtl.Close;
    QryDtl.Open;
    QryDtl.Locate('ID', AId, []);
    Abort;
  end;

end;   }

{ TODO : TGridDrawState has no corresponding uni component }
{procedure TFrmEdiEdit.GridDtlCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if not (UpperCase(Field.FieldName) = 'SEQ')
    then if (not Highlight) then ABrush.Color := clWindow;

end;     }

procedure TFrmEdiEdit.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmEdiEdit.TblTokenBeforePost(DataSet: TDataSet);
begin
  if TblTokenEDI_EDIT_DTL_ID.asFloat = 0 then
    raise Exception.Create(edi_rscstr.cTXT0000177 {'Parent record must be assigned.'});
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;

procedure TFrmEdiEdit.sbCreateEdiFileClick(Sender: TObject);
var
  ADir:string;
  AFile:String;
  I:Integer;
begin
  if not IqConfirmYN(edi_rscstr.cTXT0000119 {'Do you want to create an output file?'}) then Exit;
  AFile := '';
  { TODO : GridHdr has no property 'selected' }
 { if GridHdr.Selected.Count > 1 then
  begin
   if IQRegStringScalarRead( self, 'EdiFileDir', ADir ) then
     OpenDialog1.InitialDir := ADir;
   with OpenDialog1 do
   if Execute then
   begin
     IQRegStringScalarWrite( self, 'EdiFileDir', ExtractFileDir(FileName));
     AFile := FileName;
    end;
  end;    }

  try
    if AFile <> '' then
      AssignFile(FEdi, AFile)
    else
      AssignFile(FEdi, TblHdrEDI_FILE.asString);
  { TODO : GridHdr has no property 'selectedList','SelectedRecord' }
  { if GridHdr.SelectedList.Count = 0 then
     GridHdr.SelectRecord;

    ReWrite(FEdi);

    with GridHdr, GridHdr.datasource.dataset do
    for I:= 0 to SelectedList.Count-1 do
    begin
      GotoBookmark(SelectedList.items[I]);

      GetISA_GS_ST_Sequences;
      GetSeparators;

      PopulateEdiFile;
      TblToken.Refresh;

      ExecuteCommandFmt('update EDI_PARTNERS_TS set isa_sequence = %d, gs_sequence = %d, st_sequence = %d where id = %f',
               [Trunc(StrToFloat(FISA_Seq)),
                Trunc(StrToFloat(FGS_Seq)),
                Trunc(StrToFloat(FST_Seq)),
                TblHdrEDI_PARTNERS_TS_ID.asFloat]);
      edit;
      TblHdrEDI_FILE.asString := AFile;
      post;
    end;         }



  finally
    CloseFile(FEdi);
  end;
end;

procedure TFrmEdiEdit.PopulateEdiFile;
var
  AStr:String;
  AValue:String;
begin
  QryDtl.First;
  while not QryDtl.Eof do
  begin
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(Format('select id, token_code, token_value from edi_edit_dtl_tokens ' +
                     'where edi_edit_dtl_id = %f order by token_code', [QryDtlID.asFloat]));
      Open;
      if eof and bof then
        AStr := ''
      else
      begin
        AStr := QryDtlSEG.asString;
        while not eof do
        begin
          if FieldByName('token_code').asString = 'SE02' then
          begin
            AValue := FST_Seq;
            FST_Seq  := StrTran(Format('%9d', [Trunc(StrToFloat(FST_Seq)) + 1]), ' ', '0');
            ExecuteCommandFmt('update edi_edit_dtl_tokens set token_value = ''%s'' where id = %f', [AValue, FieldByName('ID').asFloat]);
          end
          else if FieldByName('token_code').asString = 'IEA02' then
          begin
            AValue := FISA_Seq;
            FISA_Seq  := StrTran(Format('%9d', [Trunc(StrToFloat(FISA_Seq)) + 1]), ' ', '0');
            ExecuteCommandFmt('update edi_edit_dtl_tokens set token_value = ''%s'' where id = %f', [AValue, FieldByName('ID').asFloat]);
          end
          else if FieldByName('token_code').asString = 'GE02' then
          begin
            AValue := FGS_Seq;
            FGS_Seq  := StrTran(Format('%9d', [Trunc(StrToFloat(FGS_Seq)) + 1]), ' ', '0');
            ExecuteCommandFmt('update edi_edit_dtl_tokens set token_value = ''%s'' where id = %f', [AValue, FieldByName('ID').asFloat]);
          end
          else
            AValue := FieldByName('token_value').asString;

          AStr := AStr + FES + AValue;
          Next;
        end;
      end;
      if AStr <> '' then
      begin
        AStr := AStr + FST;
        Write(FEdi, AStr);
      end;
    finally
      Free;
    end;
    QryDtl.Next;
  end;
end;


procedure TFrmEdiEdit.GetISA_GS_ST_Sequences;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select isa_sequence, gs_sequence, st_sequence from EDI_PARTNERS_TS where id = %f',
            [TblHdrEDI_PARTNERS_TS_ID.asFloat]));
    Open;
    FISA_Seq := StrTran(Format('%9d', [FieldByName('isa_sequence').asInteger + 1]), ' ', '0');
    FGS_Seq  := StrTran(Format('%9d', [FieldByName('gs_sequence').asInteger + 1]), ' ', '0');
    FST_Seq  := StrTran(Format('%9d', [FieldByName('st_sequence').asInteger + 1]), ' ', '0');

  finally
    Free;
  end;
end;

procedure TFrmEdiEdit.GetSeparators;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add(IQFormat('select ELEMENT_SEPARATOR, ' +
                          'SEGMENT_TERMINATOR, ' +
                          'SUB_ELEMENT_SEPARATOR ' +
                          'from EDI_PARTNERS_TS e, EDI_PARTNERS p where e.id = %f and e.edi_partners_id = p.id',
            [TblHdrEDI_PARTNERS_TS_ID.asFloat]));
    Open;
    FES  := ConvertASCIItoTEXT(FieldByName('ELEMENT_SEPARATOR').asString);
    FST  := ConvertASCIItoTEXT(FieldByName('SEGMENT_TERMINATOR').asString);
    FSES := ConvertASCIItoTEXT(FieldByName('SUB_ELEMENT_SEPARATOR').asString);
  finally
    Free;
  end;
end;

function TFrmEdiEdit.ConvertASCIItoTEXT(AStr:String):string;
var
  nTokens, i:Integer;
begin
  nTokens := NumToken(AStr, 'V');
  Result := '';
  if AStr = '' then Exit;
  for i := 1 to nTokens do
    Result := Result + Chr(StrToInt(GetToken(AStr, 'V', i)));
end;




procedure TFrmEdiEdit.CreateXMLfile1Click(Sender: TObject);
var
  ADir:string;
  AFile:String;
begin
  { TODO : GridHdr has no property 'selectedList','SelectedRecord' }
  {if GridHdr.SelectedList.Count = 0 then
     GridHdr.SelectRecord;         }

  CreateXMLfile(TblHdrID.asFloat, True); {in ediXMLShare.pas}
end;

end.
