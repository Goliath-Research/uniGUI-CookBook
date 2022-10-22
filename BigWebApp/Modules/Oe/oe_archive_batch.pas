unit oe_archive_batch;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Error,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
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
  uniButton,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmOEArchiveBatch = class(TUniForm)
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1ORDERNO: TStringField;
    Query1CUSTNO: TStringField;
    Query1COMPANY: TStringField;
    Query1DATE_TAKEN: TDateTimeField;
    Query1BILL_TO_ATTN: TStringField;
    Query1SHIP_TO_ATTN: TStringField;
    Query1PONO: TStringField;
    Query1ORD_BY: TStringField;
    Query1CURR_CODE: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Query1CAN_BE_ARCHIVED: TStringField;
    IQJumpSO: TIQWebJump;
    PopupMenu1: TUniPopupMenu;
    JumpToSalesOrder1: TUniMenuItem;
    pnlCarrier: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IQSearch1UserBtn1OnClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure IQSearch1AfterSortChange(Sender: TObject);
    procedure JumpToSalesOrder1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  protected
    procedure IQSearch1AfterFilterChange(Sender: TObject);
  private
    { Private declarations }
    FCloseWithinPercent: Real;
    FDate:TDateTime;
    FChecked: boolean;
    FResult: boolean;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure MarkCandidatesForArchiving;
    procedure Validate;
    procedure ProcessMarked;
    procedure ArchiveOrder(AOrders_ID: Real; AOrderNo: string);
    procedure FindRefreshSalesOrderForm;
    procedure FindRefreshSalesOrderForm2;
    function  CheckAutoMark(AId:Real):boolean;
    procedure SetAChecked(const Value: boolean);
    procedure SetDate(const Value: TDateTime);
    procedure SetResult(const Value: boolean);
  public
    { Public declarations }
    FDoNotCloseOnExit:boolean;
    //constructor Create( AOwner: TComponent; AResult, AChecked:boolean; ADate:TDateTime );
    class procedure DoShow;
    property Result :boolean write SetResult;
    property Checked:boolean write SetAChecked;
    property Date:TDateTime write SetDate;
  end;



implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //dm_or,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  OEAutoMark,
  IQMS.Common.PanelMsg,
  SchdChk;

{ TFrmOEArchiveBatch }


class procedure TFrmOEArchiveBatch.DoShow;
var
  ADate:TDateTime;
  AChecked:boolean;
  AResult:boolean;
  FrmOEArchiveBatch: TFrmOEArchiveBatch;
begin
  AResult := GetOEAutoMark( ADate, AChecked); {in OEAutoMark.pas}
  FrmOEArchiveBatch := self.Create( UniGUIApplication.uniApplication );
  with FrmOEArchiveBatch do
  begin
    Result := AResult;
    Checked := AChecked;
    Date := ADate;
    Show;
  end;

end;

procedure TFrmOEArchiveBatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IqRegFormWrite( self, [ self ]);
end;

procedure TFrmOEArchiveBatch.IQNotify(var Msg: TMessage);
begin
  MarkCandidatesForArchiving;
end;

procedure TFrmOEArchiveBatch.UniFormCreate(Sender: TObject);
begin
  FCloseWithinPercent:= SelectValueAsFloat('select closeorderwithin from iqsys');
  IqRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
  { TODO -oSanketG -cWC : Need to find alternative for AfterFilterChange in TIQUniGridControl}
  //IQSearch1.AfterFilterChange := IQSearch1AfterFilterChange;


end;

procedure TFrmOEArchiveBatch.UniFormShow(Sender: TObject);
begin
  if FResult then
  begin
    if not FChecked then
    begin
      FDate := 0;
      { TODO -oSanketG -cWC : Need to find alternative for UserBtn1 in TIQUniGridControl}
      //IQSearch1.UserBtn1.Hint:= Format('Mark orders shipped in full or short within %f%%', [ DtoF( SelectValueAsFloat( 'select closeorderwithin from iqsys' )) ]);
    end
    else
    begin
      //FDate := ADate;
      { TODO -oSanketG -cWC : Need to find alternative for UserBtn1 in TIQUniGridControl}
      {IQSearch1.UserBtn1.Hint:= Format('Mark orders shipped in full or short within %f%% excl. orders with shipments after ''%s''',
        [ DtoF( SelectValueAsFloat( 'select closeorderwithin from iqsys' )),
          FormatDateTime('mm/dd/yyyy', FDate) ]);}
    end;
    //PostMessage( Handle, iq_Notify, 0, 0 );
  end;
end;

procedure TFrmOEArchiveBatch.IQSearch1UserBtn1OnClick(Sender: TObject);
var
  ADate:TDateTime;
  AChecked:boolean;
  AResult:boolean;
begin
  AResult := GetOEAutoMark(ADate, AChecked); {in OEAutoMark.pas}
  if not AResult then
    { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
    //IQSearch1.wwDBGrid.UnselectAll
  else
  begin
    if not AChecked then
    begin
      FDate := 0;
       { TODO -oSanketG -cWC : Need to find alternative for UserBtn1 in TIQUniGridControl}
      //IQSearch1.UserBtn1.Hint:= Format('Mark orders shipped in full or short within %f%% or customer''s undership %%', [ DtoF( SelectValueAsFloat( 'select closeorderwithin from iqsys' )) ]);
    end
    else
    begin
      FDate := ADate;
       { TODO -oSanketG -cWC : Need to find alternative for UserBtn1 in TIQUniGridControl}
      {IQSearch1.UserBtn1.Hint:= Format('Mark orders shipped in full or short within %f%% or customer''s undership %% excl. orders with shipments after ''%s''',
        [ DtoF( SelectValueAsFloat( 'select closeorderwithin from iqsys' )),
          FormatDateTime('mm/dd/yyyy', ADate) ]);}
    end;
    MarkCandidatesForArchiving;
  end
end;

procedure TFrmOEArchiveBatch.MarkCandidatesForArchiving;
var
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
   { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
  //IQSearch1.wwDBGrid.UnselectAll;
  try
    // Reopen( Query1 ); -- 10-12-2011 this throws AV if wwFilterDialog has something assigned
    Query1.Close;
    Query1.Open;
    with Query1 do
      while not Eof do
      begin
        if (Query1CAN_BE_ARCHIVED.asString = 'Y') and CheckAutoMark(Query1ID.asFloat) then
            { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
           //IQSearch1.wwDBGrid.SelectRecord;
        Next;
      end;
    Query1.First;
  finally
    hMsg.Free;
  end;

  if FDate <> 0 then
     { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
    {IQConfirm(Format('Finished marking orders that are fully shipped or short within %f%% or customer''s undership %%. '#13#13'Excluding orders with shipments after %s'#13#13'Number of orders marked: %d.',
                    [ FCloseWithinPercent,
                      FormatDateTime('mm/dd/yyyy', FDate),
                      IQSearch1.wwDBGrid.SelectedList.Count ]))}
  else
     { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
    {IQConfirm(Format('Finished marking orders that are fully shipped or short within %f%% or customer''s undership %%.'#13#13'Number of orders marked: %d.',
                    [ FCloseWithinPercent,
                      IQSearch1.wwDBGrid.SelectedList.Count ]));}
end;

function TFrmOEArchiveBatch.CheckAutoMark(AId:Real):boolean;
begin
  Result := true;
  if FDate <> 0 then
  begin
    Result := SelectValueFmtAsFloat('select count(h.id) from shipments h, shipment_dtl s, ord_detail d ' +
                        ' where h.shipdate > To_Date(''%s'', ''MM/DD/RRRR'') ' +
                        '   and d.orders_id = %f ' +
                        '   and d.id = s.order_dtl_id ' +
                        '   and s.shipments_id = h.id', [FormatDateTime('mm/dd/yyyy', FDate), AId]) = 0;
  end;
end;

procedure TFrmOEArchiveBatch.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOEArchiveBatch.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmOEArchiveBatch.IQSearch1AfterSortChange(Sender: TObject);
begin
   { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
  //IQSearch1.wwDBGrid.UnselectAll;
end;

procedure TFrmOEArchiveBatch.btnOKClick(Sender: TObject);
begin
  Validate;
   { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
  {if not IQConfirmYN(Format('About to archive and delete %d sales orders. Please confirm to continue.', [ IQSearch1.wwDBGrid.SelectedList.Count ])) then
     EXIT;
  try
    ProcessMarked;
    FindRefreshSalesOrderForm;
  finally
    if not FDoNotCloseOnExit then
      Close
    else
    begin
      IQSearch1.wwDBGrid.UnselectAll;
      Query1.Close;
      Query1.Open;
    end;
  end;}
end;


procedure TFrmOEArchiveBatch.Validate;
begin
   { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
  //IQAssert(  IQSearch1.wwDBGrid.SelectedList.Count > 0, 'No orders selected - unable to continue.');
end;


procedure TFrmOEArchiveBatch.ProcessMarked;
var
  I, J   : Integer;
  hMsg: TPanelMesg;
  AMsg:String;
  ACompressing:Boolean;
begin
  with IQSearch1 do
  try
    DataSource.DataSet.DisableControls;
    hMsg:= hPleaseWait('');
    try
      { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
      {for I:= 0 to Wwdbgrid.SelectedList.Count - 1 do
      begin
        DataSource.DataSet.GotoBookmark( Wwdbgrid.SelectedList.Items[ I ]);
        hMsg.Mesg:= Format('Archiving Sales Order # %s', [ Query1.FieldByName('orderno').asString ]);
        ArchiveOrder( DataSource.DataSet.FieldByName('id').asFloat, Query1.FieldByName('orderno').asString );
      end;}

    except on E: Exception do
      begin
        { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid in TIQUniGridControl}
        //IQSearch1.wwDBGrid.UnselectAll;
        Reopen(Query1);

        AMsg := FixFireDACErrorMessage(E.Message);
        if E is EFDDBEngineException then with E as EFDDBEngineException do
        begin
          ACompressing := false;
          for J:= 0 to ErrorCount - 1 do
            if Errors[ J ].ErrorCode = 1502 then
              ACompressing := true;


//          if Errors[ ErrorCount - 1 ].NativeCode = 1502 then
          if ACompressing then
            AMsg := Format('Failed to Archive SO# %s'#13'System is currently busy compressing a table and rebuilding associated indexes.  Please wait and try again later.'#13#13'%s', [ Query1.FieldByName('orderno').asString, AMsg ])
//          else if Errors[ ErrorCount - 1 ].NativeCode = 2292 then
//            AMsg := Format('Failed to Archive SO# %s'#13#13'%s', [ Query1.FieldByName('orderno').asString, E.Message ])
          else
            AMsg := Format('Failed to Archive SO# = %s'#13#13'%s', [ Query1.FieldByName('orderno').asString, AMsg ]);
        end;
        if AMsg <> '' then
          IQWarning(AMsg);


//        IQWarning(Format('Encounterd error while archiving sales order # %s.'#13#13'Error Message: %s',
//                       [  Query1.FieldByName('orderno').asString, E.Message  ]));

//        IQWarning(Format('Encounterd error while archiving sales order # %s.'#13'System is currently busy compressing a table and rebuilding associated indexes.  Please wait and try again later.'#13#13'Error Message: %s',
//                       [  Query1.FieldByName('orderno').asString, E.Message  ]));
        FindRefreshSalesOrderForm2;
        Close;
//        raise Exception.CreateFmt('Encounterd error while archiving sales order # %s.'#13#13'Error Message: %s',
//                                  [  Query1.FieldByName('orderno').asString, E.Message  ]);
      end;
    end;
  finally
    DataSource.DataSet.EnableControls;
    hMsg.Free;
  end;
end;

procedure TFrmOEArchiveBatch.SetAChecked(const Value: boolean);
begin
  FChecked := Value;
end;

procedure TFrmOEArchiveBatch.SetDate(const Value: TDateTime);
begin
  FDate := Value;
end;

procedure TFrmOEArchiveBatch.SetResult(const Value: boolean);
begin
  FResult := Value;
end;

procedure TFrmOEArchiveBatch.ArchiveOrder( AOrders_ID: Real; AOrderNo: string );
begin
  CheckOrdScheduled( AOrders_ID, 0 );               {SchdChk.pas}
  { TODO -oSanketG -cWC : Need to revisit, depends on dm_or }
  (*TOE_DM.CheckOrderForPickTicket( AOrders_ID );     {DM_OR.pas 04-13-2009 }
  TOE_DM.CheckMTOOnWorkorder( AOrders_ID );         {DM_OR.pas 04-27-2009 }*)

  ExecuteCommandFmt('declare                                                                       '+
            '  v_orders_id number::= %f;                                                   '+
            '  v_userid    varchar2(60)::= ''%s'';                                         '+
            '  v_text      varchar2(250)::= ''%s'';                                        '+
            '  v_tmp       number;                                                         '+
            'begin                                                                         '+
            '  begin                                                                       '+
            {   -- place a lock on orders table                                             }
            '    select id into v_tmp from orders where id = v_orders_id for update of id; '+
            '  exception when no_data_found then                                           '+
            '    commit;                                                                   '+
            '    return;                                                                   '+
            '  end;                                                                        '+
            '                                                                              '+
            '  oe_archive_order( v_orders_id );                                            '+
            '                                                                              '+
            '  insert into eventlog( event_time, userid, text, class )                     '+
            '  values( sysdate, v_userid, v_text, ''SO_BATCH_ARCH'' );                     '+
            '                                                                              '+
            '  commit;                                                                     '+
            'end;                                                                          ',
            [ AOrders_ID,
              SecurityManager.UserName,
              Format( 'Sales Orders Batch Archive - Sales Order # %s has been archived and deleted.', [ AOrderNo ]) ]);
end;


procedure TFrmOEArchiveBatch.FindRefreshSalesOrderForm;
var
  I: Integer;
begin
  for I:= Screen.FormCount - 1 downto 0 do
    if CompareText(Screen.Forms[ I ].ClassName, 'TFrmMainOrder') = 0 then
      PostMessage( Screen.Forms[ I ].Handle, iq_RefreshDataSets, 1, 0 );  {note - 2 - this will compress the tables and reopen}
end;

procedure TFrmOEArchiveBatch.FindRefreshSalesOrderForm2;
var
  I: Integer;
begin
  for I:= Screen.FormCount - 1 downto 0 do
    if CompareText(Screen.Forms[ I ].ClassName, 'TFrmMainOrder') = 0 then
      PostMessage( Screen.Forms[ I ].Handle, iq_RefreshDataSets, 1, 0 );  {note - 1 - this will not compress the tables and reopen}
end;


procedure TFrmOEArchiveBatch.JumpToSalesOrder1Click(Sender: TObject);
begin
  IQJumpSO.Execute;
end;

procedure TFrmOEArchiveBatch.IQSearch1AfterFilterChange(Sender: TObject);
begin
  MarkCandidatesForArchiving;
end;


end.
