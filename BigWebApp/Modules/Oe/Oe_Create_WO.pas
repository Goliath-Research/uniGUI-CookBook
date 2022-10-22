unit Oe_Create_WO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TReleaseCargo = class
     ID               : Real;
     Quan             : Real;
     Cum_Quan         : Real;
     Promise_Date     : TDateTime;
     Seq              : Real;
     Ship_Date        : TDateTime;
     Shipped_Quan     : Real;
     constructor Create( AID, AQuan, ACum_Quan, ASeq: Real; APromise_Date, AShip_Date: TDateTime );
  end;


  TFrmOeCreateWO = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQSearch1: TIQUniGridControl;
    QryReleases: TFDQuery;
    QryReleasesSEQ: TBCDField;
    QryReleasesQUAN: TBCDField;
    QryReleasesREQUEST_DATE: TDateTimeField;
    QryReleasesPROMISE_DATE: TDateTimeField;
    QryReleasesFORECAST: TStringField;
    QryReleasesSHIP_DATE: TDateTimeField;
    QryReleasesORIG_QUAN: TBCDField;
    QryReleasesRAN: TStringField;
    QryReleasesSHIP_TO_ATTN: TStringField;
    QryReleasesDATE_TYPE: TStringField;
    QryReleasesBATCH_NO: TStringField;
    QryReleasesJOB_SEQ: TBCDField;
    QryReleasesMUST_SHIP_DATE: TDateTimeField;
    QryReleasesLOCK_MUST_SHIP_DATE: TStringField;
    QryReleasesACK: TStringField;
    QryReleasesCUSER1: TStringField;
    QryReleasesCUSER2: TStringField;
    QryReleasesUSER_DATE: TDateTimeField;
    QryReleasesUSER_DATE_2: TDateTimeField;
    QryReleasesUSER_DATE_3: TDateTimeField;
    QryReleasesECODE: TStringField;
    QryReleasesUNIT_PRICE: TFMTBCDField;
    QryReleasesID: TBCDField;
    QryReleasesORD_DETAIL_ID: TBCDField;
    QryReleasesSHIP_TO_ID: TBCDField;
    QryReleasesSHIPPED_QUAN: TBCDField;
    QryReleasesINTERNAL_UPDATE_TYPE: TStringField;
    QryReleasesREL_DATE: TDateTimeField;
    QryReleasesCUSER3: TStringField;
    QryReleasesFREIGHT_ID: TBCDField;
    QryReleasesSHIPVIA: TStringField;
    QryReleasesWO_NOTE: TStringField;
    SrcReleases: TDataSource;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    QryReleasesLEFT_TO_SHIP: TFMTBCDField;
    QryReleasesRELEASED: TFMTBCDField;
    QryReleasesSHIP_TO_ID_EX: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryReleasesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure BtnOkClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrdDetailId:Real;
    FReleasesList: TList;
    FArinvt_ID:Real;
    procedure  AssignCaption;
    procedure RebuildReleasesList;
    function GetReleasesCumQuan( AReleases_ID:Real): Real;
    procedure SetOrdDetailId(const Value: Real);

  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AOrdDetailId:Real);
    property OrdDetailId:Real read FOrdDetailId write SetOrdDetailId;
  end;




procedure Do_Oe_Create_WO( AOrdDetailId:Real);

implementation

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  System.Generics.Collections,
  { TODO -oSanketG -cWC : Need to revisit }
  //wo_main,
  wo_misc;

{$R *.dfm}

constructor TReleaseCargo.Create( AID, AQuan, ACum_Quan, ASeq: Real; APromise_Date, AShip_Date: TDateTime );
begin
  inherited Create;
  ID          := AID;
  Quan        := AQuan;
  Cum_Quan    := ACum_Quan;
  Seq         := ASeq;
  Promise_Date:= APromise_Date;
  Ship_Date   := AShip_Date;
end;


procedure ClearList( AList: TList );
var
  I: Integer;
begin
  if Assigned(AList) then
  begin
    for I:= AList.Count - 1 downto 0 do
      if Assigned( AList.Items[ I ]) then
         TObject(AList.Items[ I ]).Free;
    AList.Clear;
  end;
end;

procedure Do_Oe_Create_WO( AOrdDetailId:Real);
var
  FrmOeCreateWO: TFrmOeCreateWO;
begin
  FrmOeCreateWO := TFrmOeCreateWO.Create(UniGUIApplication.uniApplication);
  with FrmOeCreateWO do
  begin
    OrdDetailId := AOrdDetailId;
    Show;
  end;
end;

procedure TFrmOeCreateWO.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmOeCreateWO.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOeCreateWO.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(HelpContext);
end;

procedure TFrmOeCreateWO.UniFormCreate(Sender: TObject);
begin
  FReleasesList:= TList.Create;
  IQRegFormRead( self, [ self]);
end;

procedure TFrmOeCreateWO.UniFormShow(Sender: TObject);
begin
  FArinvt_ID := SelectValueFmtAsFloat('select arinvt_id from ord_detail where id = %f', [FOrdDetailId]);

  RebuildReleasesList;
  AssignCaption;

  QryReleases.ParamByName('AId').asFloat := FOrdDetailId;
  QryReleases.Open;
end;

procedure TFrmOeCreateWO.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOeCreateWO.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmGEN{CHM}, iqhtmGEN{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOeCreateWO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self]);
end;


procedure TFrmOeCreateWO.AssignCaption;
var
  ACaption:String;
  A: Variant;
begin
  if FArinvt_ID > 0 then
  begin
    A:= SelectValueArrayFmt( 'select itemno, class, rev, unit, descrip, descrip2 from arinvt where id = %f', [ FArinvt_ID ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      ACaption := Format('  %s (%s)', [A[ 4 ], A[ 0 ]]);
    end;
  end
  else
  begin
    ACaption := SelectValueFmtAsString('select MISC_ITEM from ord_detail where id = %f', [FOrdDetailId]);
    ACaption := Format('  %s (%s)', [Trim(ACaption), 'Misc.Item']);
  end;
  Panel3.Caption := ACaption;
end;

procedure TFrmOeCreateWO.FormDestroy(Sender: TObject);
begin
  ClearList( FReleasesList );
  FReleasesList.Free;
end;


procedure TFrmOeCreateWO.RebuildReleasesList;
var
  ACum_Quan: Real;
begin
  if not Assigned(FReleasesList) then EXIT;

  {Clear List}
  ClearList( FReleasesList );

  {Rebuild the FReleasesList}
  ACum_Quan:= 0;
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(         'select id, quan, seq, promise_date, ship_date from releases ');
    SQL.Add(IQFormat(' where ord_detail_id = %f', [ FOrdDetailId ]));
    SQL.Add(         ' order by promise_date, id');
    Open;
    while not Eof do
    begin
      {running cumulative}
      ACum_Quan:= ACum_Quan + FieldByName('quan').asFloat;
      FReleasesList.Add( TReleaseCargo.Create( FieldByName('id').asFloat,
                                               FieldByName('quan').asFloat,
                                               ACum_Quan,
                                               FieldByName('seq').asFloat,
                                               FieldByName('promise_date').asDateTime,
                                               FieldByName('ship_date').asDateTime ));
      Next;
    end;
  finally
    Free; // free TFDQuery
  end;
end;

procedure TFrmOeCreateWO.SetOrdDetailId(const Value: Real);
begin
  FOrdDetailId := Value;
end;

function TFrmOeCreateWO.GetReleasesCumQuan( AReleases_ID:Real): Real;
var
  I: Integer;
begin
  if Assigned(FReleasesList) then
     for I:= 0 to FReleasesList.Count - 1 do with TReleaseCargo(FReleasesList.Items[ I ]) do
       if ID = AReleases_ID then
       begin
          Result:= Cum_Quan;
          EXIT;
       end;
  Result:= 0;
end;


procedure TFrmOeCreateWO.QryReleasesFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := true;
  with QryReleases do
  begin
     if FieldByName('Ship_date').AsDateTime > 0 then
        Accept := false

     else if FieldByName('Quan').AsFloat > 0 then
        begin
          if FieldByName('Left_To_Ship').AsFloat = 0 then
             Accept := false
          else
             Accept := true
        end

     else
        Accept := false
  end;
end;


procedure TFrmOeCreateWO.BtnOkClick(Sender: TObject);
var
  AList : TList<TWOReleaseCargo>;
  ACargo: TWOReleaseCargo;
  I     : Integer;

  procedure AddReleaseToList( DataSet: TDataSet );
  begin
    if Dataset.FieldByName('LEFT_TO_SHIP').asFloat = 0 then
       EXIT;
    ACargo:= TWOReleaseCargo.Create;
    ACargo.Rel_Quan:= Dataset.FieldByName('LEFT_TO_SHIP').asFloat;
    ACargo.Rel_Date:= Dataset.FieldByName('PROMISE_DATE').asDateTime;
    ACargo.Must_Ship_Date:= Dataset.FieldByName('MUST_SHIP_DATE').asDateTime;
    ACargo.Ship_To_ID:= 0;
    if Dataset.FindField('SHIP_TO_ID_EX') <> nil then
       ACargo.Ship_To_ID:= Dataset.FieldByName('SHIP_TO_ID_EX').asFloat;

    AList.Add(ACargo);
  end;

begin
  if IQSearch1.DataSource.DataSet.Eof and IQSearch1.DataSource.DataSet.Bof then
  begin
    IQWarning('Please add sales order releases to create firm work order');
    Close;
    EXIT;
  end;

  if not IQConfirmYN('You are about to create manual firm workorder for selected releases.'#13#13'Please confirm to continue.') then
     EXIT;

  with IQSearch1 do
  try
     AList:= TList<TWOReleaseCargo>.Create;
     DataSource.DataSet.DisableControls;

     { TODO -oSanketG -cWC :Need to find alternative for wwDBGrid  in TIQUniGridControl  }
     {if Wwdbgrid.SelectedList.Count > 0 then
        for I:= 0 to Wwdbgrid.SelectedList.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark( Wwdbgrid.SelectedList.Items[ I ]);
          AddReleaseToList( DataSource.DataSet );
        end
     else
          AddReleaseToList( DataSource.DataSet );}

     { TODO -oSanketG -cWC : Need to revisit , depends on wo_main}
     {wo_main.DoAddShowWorkOrder( nil,                                              // Owner
                                 SelectValueByID('standard_id', 'arinvt', FArinvt_ID),  // AStandard_ID
                                 FArinvt_ID,                                       // AArinvt_ID
                                 AList,                                            // ARel_List: TList<TWOReleaseCargo>
                                 FOrdDetailID,                                     // AOrd_Detail_ID
                                 'Y',                                              // AFirmYN
                                 TRUE,                                             // AShow
                                 TRUE );                                           // Manual Source - this will cause the workorder.manual_source_ord_detail_id to be assigned passed ord_detail_id}
  finally
     DataSource.DataSet.EnableControls;
     for I:= AList.Count - 1 downto 0 do
          AList[ I ].Free;
     AList.Free;
  end;

  Close;
end;


end.
