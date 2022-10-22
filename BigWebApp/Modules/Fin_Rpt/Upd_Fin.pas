unit Upd_Fin;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  CheckLst,
  ExtCtrls,
  DBCtrls,
  Mask,
  Db,
  Buttons,
  ComCtrls,
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
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmUpdate_Fin_Rpt = class(TUniForm)
    PnlToolbarMain: TUniPanel;
    DataSource1: TDataSource;
    sbtnCheckAll: TUniSpeedButton;
    sbtnUncheckAll: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    Panel3: TUniPanel;
    chklstReports: TCheckListBox;
    RichEdit1: TRichEdit;
    Splitter1: TUniSplitter;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    PnlClient02: TUniPanel;
    dbeAcctNumber: TUniDBEdit;
    dbeDescription: TUniDBEdit;
    dblcAcctType: TUniDBEdit;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnCheckAllClick(Sender: TObject);
    procedure sbtnUncheckAllClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FMesgList: TStringList;
    procedure LoadListBox( ABox: TCheckListBox );
    procedure AssignItems( AValue: Boolean );
    procedure Validate;
    function GetDataSet: TDataSet;
    procedure UpdateFinReport( AFinRepID, AGLAcctID: Real );
    procedure SetStatus( const AValue: string );
    function FinRepDescription( AFinRepID: Real ):string;
    procedure GetAccountDetails( AGLAcctID: Real; var AGLAcct, AGLAcctDescrip, AAcctType: string );
    procedure GetParentIDByAcctType( AFinRepID: Real; AAcctType: string;  var AParentID, AParentSortID: Real );
    procedure GetLastLeafID( AParentID: Real; var ALastLeafSortID, ALastLeafSeq: Real );
    procedure ConstructNewSortID( var ANewLeafSortID, ANewLeafSeq: Real; ALastLeafSortID, ALastLeafSeq: Real );
    function AcctExistsInTreeView( AFinRepID, AGLAcctID, AParentID: Real ): Boolean;
    procedure WriteErrMessages;
  public
    { Public declarations }
    property DataSet: TDataSet read GetDataSet;
    property Status: string write SetStatus;
  end;

procedure DoUpdate_Fin_Rpt( ADataSet: TDataSet );


implementation

{$R *.DFM}

uses
  fin_rpt_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  variants;


procedure DoUpdate_Fin_Rpt( ADataSet: TDataSet );
var
  AForm: TUniForm;
  LFrmUpdate_Fin_Rpt : TFrmUpdate_Fin_Rpt;
begin
  AForm:= FindFormByClassName( 'TFrmUpdate_Fin_Rpt' );
  if Assigned( AForm ) then
     AForm.BringToFront
  else
  begin
    LFrmUpdate_Fin_Rpt := TFrmUpdate_Fin_Rpt.Create( uniGUIApplication.UniApplication);
    LFrmUpdate_Fin_Rpt.FMesgList:= TStringList.Create;
    LFrmUpdate_Fin_Rpt.DataSource1.DataSet:= ADataSet;
    LFrmUpdate_Fin_Rpt.Show;
  end;

end;

procedure TFrmUpdate_Fin_Rpt.FormDestroy(Sender: TObject);
begin
  FMesgList.Free;
end;

procedure TFrmUpdate_Fin_Rpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmUpdate_Fin_Rpt.LoadListBox( ABox: TCheckListBox );
var
  I: Integer;
begin
  ABox.Items.Clear;
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add( 'select id, descrip from financial_rpt order by descrip' );
    Open;
    while not Eof do
    begin
      I:= ABox.Items.AddObject( Fields[ 1 ].asString, Pointer( Fields[ 0 ].asInteger ));
      ABox.Checked[ I ]:= TRUE;
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmUpdate_Fin_Rpt.sbtnCheckAllClick(Sender: TObject);
begin
  AssignItems( TRUE );
end;

procedure TFrmUpdate_Fin_Rpt.sbtnUncheckAllClick(Sender: TObject);
begin
  AssignItems( FALSE );
end;

procedure TFrmUpdate_Fin_Rpt.AssignItems( AValue: Boolean );
var
  I: Integer;
begin
  with chklstReports do
    for I:= 0 to Items.Count - 1 do
      Checked[ I ]:= AValue;
end;

procedure TFrmUpdate_Fin_Rpt.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TFrmUpdate_Fin_Rpt.GetDataSet: TDataSet;
begin
  Result:= DataSource1.DataSet;
end;

function TFrmUpdate_Fin_Rpt.FinRepDescription( AFinRepID: Real ):string;
begin
  Result:= SelectValueFmtAsString( 'select descrip from financial_rpt where id = %f', [ AFinRepID ]);
end;

procedure TFrmUpdate_Fin_Rpt.SetStatus( const AValue: string );
begin
//  StatusBar1.SimpleText:= AValue;
  StatusBar1.Update;
end;

procedure TFrmUpdate_Fin_Rpt.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  FMesgList.Clear;
  RichEdit1.Clear;
  Status:= Format(fin_rpt_rscstr.cTXT0000009 {'Processing: %s'},
   [DataSet.FieldByName('acct').asString]);
  try
    Validate;
    with chklstReports do
      for I:= 0 to Items.Count - 1 do if Checked[ I ] then
        UpdateFinReport( LongInt( Items.Objects[ I ] ), DataSet.FieldByName('id').asFloat );
  finally
    Status:= Format(fin_rpt_rscstr.cTXT0000010 {'Finished Processing: %s'},
     [DataSet.FieldByName('acct').asString]);
    WriteErrMessages;
  end;
end;

procedure TFrmUpdate_Fin_Rpt.WriteErrMessages;
var
  I: Integer;
begin
  if FMesgList.Count > 0 then
  begin
     //RichEdit1.Lines.Add(Format('%s - errors', [ Trim(DataSet.FieldByName('acct').asString) ]));
     //for I:= 0 to FMesgList.Count - 1 do
     //  RichEdit1.Lines.Add( Format('   %s', [ FMesgList[ I ]] )) ;
     RichEdit1.Lines.Assign( FMesgList );
  end
  else
     RichEdit1.Lines.Add(Format(fin_rpt_rscstr.cTXT0000011 {'%s - No errors'}, [ Trim(DataSet.FieldByName('acct').asString) ]));
end;


procedure TFrmUpdate_Fin_Rpt.Validate;
var
  I: Integer;
begin
  with chklstReports do
    for I:= 0 to Items.Count - 1 do
      if Checked[ I ] then
         EXIT;
  // 'Please select report(s) to be updated using check box.'
  raise Exception.Create(fin_rpt_rscstr.cTXT0000012)
end;

procedure TFrmUpdate_Fin_Rpt.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, PnlLeft01 ]);
  LoadListBox( chklstReports );
end;

procedure TFrmUpdate_Fin_Rpt.UpdateFinReport( AFinRepID, AGLAcctID: Real );
var
  AGLAcct         : string;
  AGLAcctDescrip  : string;
  AAcctType       : string;

  AParentID       : Real;
  APArentSortID   : Real;

  ALastLeafSortID : Real;
  ALastLeafSeq    : Real;

  ANewLeafSortID  : Real;
  ANewLeafSeq     : Real;
  ANewHeader      : string;
  ANewFooter      : string;
  ANewAcctType    : string;
//  AOracleDecSep   : String;
//  ANewLeafSortIDStr  : String;
begin
  try
    {Account Details}
    GetAccountDetails( AGLAcctID, AGLAcct, AGLAcctDescrip, AAcctType );

    {Find Parent}
    GetParentIDByAcctType( AFinRepID, AAcctType, AParentID, AParentSortID );

    {Exit is already assigned for this report, acct type}
    if AcctExistsInTreeView( AFinRepID, AGLAcctID, AParentID ) then
       EXIT;

    {Find Last Leaf}
    GetLastLeafID( AParentID, ALastLeafSortID, ALastLeafSeq );

    {Figure out new record sort_id}
    if ALastLeafSortID > 0 then
       ConstructNewSortID( ANewLeafSortID, ANewLeafSeq, ALastLeafSortID, ALastLeafSeq )
    else
       ConstructNewSortID( ANewLeafSortID, ANewLeafSeq, AParentSortID,   -1 );

    {Header and Footer}
    ANewHeader  := Format('[%s] %s',       [ AGLAcct, AGLAcctDescrip ]);
    ANewFooter  := Format(fin_rpt_rscstr.cTXT0000013 {'TOTAL [%s] %s'}, [ AGLAcct, AGLAcctDescrip ]);
    ANewAcctType:= Format('[%s] %s',       [ AGLAcct, AGLAcctDescrip ]);

    {Finally insert into financial_rpt_detail }

//    AOracleDecSep := SelectValueAsString('select SubStr(value, 1, 1) from NLS_DATABASE_PARAMETERS where parameter = ''NLS_NUMERIC_CHARACTERS''');
//    ANewLeafSortIDStr := FloatToStr( ANewLeafSortID );
//    ANewLeafSortIDStr := StrTran( ANewLeafSortIDStr, SysUtils.DecimalSeparator, AOracleDecSep);






    ExecuteCommandFmt('insert into financial_rpt_detail( financial_rpt_id, '+
              '                                  parent_id,        '+
              '                                  acct_type,        '+
              '                                  seq,              '+
              '                                  heading,          '+
              '                                  footer,           '+
              '                                  glacct_id,        '+
              '                                  sort_id )         '+
              '                          values( %f,               '+
              '                                  %f,               '+
              '                                  ''%s'',           '+
              '                                  %f,               '+
              '                                  ''%s'',           '+
              '                                  ''%s'',           '+
              '                                  %f,               '+
              '                                  %.6f )          ',
              [ AFinRepID,
                AParentID,
                ANewAcctType,
                ANewLeafSeq,
                ANewHeader,
                ANewFooter,
                AGLAcctID,
                ANewLeafSortID]);

  except on E:Exception do
    FMesgList.Add( Format( '%s - %s', [ FinRepDescription( AFinRepID ), E.Message ] ));
  end;
end;

procedure TFrmUpdate_Fin_Rpt.GetAccountDetails( AGLAcctID: Real; var AGLAcct, AGLAcctDescrip, AAcctType: string );
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select a.acct, a.descrip, t.descrip from glacct a, glsub_acct_type t where a.id = %f and a.gl_subacct_type_id = t.id(+)',
                      [ AGLAcctID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    AGLAcct       := A[ 0 ];
    AGLAcctDescrip:= A[ 1 ];
    AAcctType     := A[ 2 ];
  end
  else
    {'GL Account not found (ID: %f).'}
    raise Exception.CreateFmt(fin_rpt_rscstr.cTXT0000014, [AGLAcctID]);
end;


procedure TFrmUpdate_Fin_Rpt.GetParentIDByAcctType( AFinRepID: Real; AAcctType: string;  var AParentID, AParentSortID: Real );
var
  A: Variant;
begin
  AParentID:= 0;
  A:= SelectValueArrayFmt('select id, sort_id from financial_rpt_detail where acct_type = ''%s'' and glacct_id is NULL and financial_rpt_id = %f', [ AAcctType, AFinRepID ]);
  if VarArrayDimCount( A ) > 0 then
    begin
      AParentID    := A[ 0 ];
      APArentSortID:= A[ 1 ];
    end
  else
    // 'Account type, %s, is not in the report.'
    raise Exception.CreateFmt(fin_rpt_rscstr.cTXT0000015, [ AAcctType ]);
end;

function TFrmUpdate_Fin_Rpt.AcctExistsInTreeView( AFinRepID, AGLAcctID, AParentID: Real ): Boolean;
begin
  Result:= SelectValueFmtAsFloat('select 1 from financial_rpt_detail where financial_rpt_id = %f and parent_id = %f and glacct_id = %f',
                     [ AFinRepID, AParentID, AGLAcctID ]) = 1;
end;

procedure TFrmUpdate_Fin_Rpt.GetLastLeafID( AParentID: Real; var ALastLeafSortID, ALastLeafSeq: Real );
var
  A: Variant;
begin
  ALastLeafSortID:= 0;
  A:= SelectValueArrayFmt('select sort_id, seq from financial_rpt_detail where parent_id = %f and glacct_id is NOT NULL order by seq desc', [ AParentID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    ALastLeafSortID:= A[ 0 ];
    ALastLeafSeq   := A[ 1 ];
  end;
end;


procedure TFrmUpdate_Fin_Rpt.ConstructNewSortID( var ANewLeafSortID, ANewLeafSeq: Real; ALastLeafSortID, ALastLeafSeq: Real );
var
  S: string;
begin
  ANewLeafSeq:= ALastLeafSeq + 1;

  S:= StrBeforeDot( FloatToStr( ALastLeafSortID ), FormatSettings.DecimalSeparator) +         { current sort id BEFORE decimal point}
//       '.'                                       +
      FormatSettings.DecimalSeparator                    +
      Format('%.0f', [ GetNextID( 'FINANCIAL_RPT_DETAIL' ) ]);  { keep decimal portion growing }

  ANewLeafSortID:= StrToFloat( S );
end;

procedure TFrmUpdate_Fin_Rpt.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmGL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
