unit AutoCum;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
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
  uniTreeView,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, uniGUIFrame, IQUniGrid, uniDateTimePicker, uniDBDateTimePicker;

type
  TTreeViewCargo = class
    ArcustoId  : Real;
    ShipToId   : Real;
    OrdersId   : Real;
    constructor Create(AArcustoId, AShipToId, AOrdersId:Real);
  end;


type
  TFrmAutoCum = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Splitter3: TUniSplitter;
    TV: TUniTreeView;
    SrcCust: TDataSource;
    QryCust: TFDQuery;
    SrcShip: TDataSource;
    QryShip: TFDQuery;
    SrcOrds: TDataSource;
    QryOrd: TFDQuery;
    QryCustID: TBCDField;
    QryCustCUSTNO: TStringField;
    QryCustCOMPANY: TStringField;
    QryCustADDR1: TStringField;
    QryCustADDR2: TStringField;
    QryCustADDR3: TStringField;
    QryCustCITY: TStringField;
    QryCustSTATE: TStringField;
    QryCustCOUNTRY: TStringField;
    QryCustZIP: TStringField;
    IQAbout1: TIQWebAbout;
    SecurityRegister1: TIQWebSecurityRegister;
    QryShipID: TBCDField;
    QryShipATTN: TStringField;
    QryShipADDR1: TStringField;
    QryShipADDR2: TStringField;
    QryShipADDR3: TStringField;
    QryShipCITY: TStringField;
    QryShipSTATE: TStringField;
    QryShipCOUNTRY: TStringField;
    QryShipZIP: TStringField;
    QryShipEPLANT_ID: TBCDField;
    QryShipNAME: TStringField;
    QryShipDESCRIP: TStringField;
    QryOrdID: TBCDField;
    QryOrdORDERNO: TStringField;
    QryOrdPONO: TStringField;
    QryOrdDATE_TAKEN: TDateTimeField;
    Panel4: TUniPanel;
    IQSCust: TIQUniGridControl;
    Panel5: TUniPanel;
    Splitter2: TUniSplitter;
    Panel8: TUniPanel;
    IQSOrds: TIQUniGridControl;
    Panel6: TUniPanel;
    IQShip: TIQUniGridControl;
    PopupMenu1: TUniPopupMenu;
    DeleteNode1: TUniMenuItem;
    sbcalc: TUniSpeedButton;
    Exit1: TUniMenuItem;
    N1: TUniMenuItem;
    Calculate1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Panel7: TUniPanel;
    Panel13: TUniPanel;
    Label2: TUniLabel;
    Panel15: TUniPanel;
    sbtnExpand: TUniSpeedButton;
    sbtnCollapse: TUniSpeedButton;
    Panel10: TUniPanel;
    Label4: TUniLabel;
    Panel11: TUniPanel;
    Label3: TUniLabel;
    Panel9: TUniPanel;
    Label5: TUniLabel;
    Label1: TUniLabel;
    wwDate: TUniDBDateTimePicker;
    Bevel1: TUniPanel;
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure IQSCustMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IQShipMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IQSOrdsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TVDragDrop(Sender, Source: TObject; X, Y: Integer);
    function LocateNode(ALevel:Integer):TUniTreeNode;
    procedure sbtnExpandClick(Sender: TObject);
    procedure sbtnCollapseClick(Sender: TObject);
    procedure DeleteNode1Click(Sender: TObject);
    procedure TVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbcalcClick(Sender: TObject);
    procedure QryCustAfterScroll(DataSet: TDataSet);
    procedure QryShipAfterScroll(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ClearTreeView;
    procedure AssignCustomer;
    procedure AssignShipTo;
    procedure AssignOrder;

    procedure DeleteCustomer;
    procedure DeleteShipTo;
    procedure DeleteOrder;

    procedure DeleteNode(ANode:TUniTreeNode);

    procedure AssignShipToNode(ANode:TUniTreeNode);
    procedure AssignOrdersNode(ANode:TUniTreeNode);
    procedure ProcessOrder(AOrderId:Real);
    procedure CheckOrderForPickTicket(AOrders_ID: Real);


  public
    { Public declarations }
  end;


procedure DoAutoCum;


implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.Common.HelpHook,
  PkTktChkEx;

{$R *.DFM}


constructor TTreeViewCargo.Create(AArcustoId, AShipToId, AOrdersId:Real);
begin
  ArcustoId := AArcustoId;
  ShipToId  := AShipToId ;
  OrdersId  := AOrdersId ;
end;


procedure DoAutoCum;
var
  LFrmAutoCum : TFrmAutoCum;
begin
  LFrmAutoCum := TFrmAutoCum.Create(UniGUIApplication.UniApplication);
  LFrmAutoCum.Show;
end;

procedure TFrmAutoCum.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmAutoCum.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAutoCum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel2, Panel4, Panel6]);
end;


procedure TFrmAutoCum.ClearTreeView;
var
  Node: TUniTreeNode;
begin
  Node:= TV.Items.GetFirstNode;
  while Node <> nil do
  begin
    if Assigned(Node.Data) then
       TObject(Node.Data).Free;
    { TODO : TUniTreeNode has no member GetNext }
    //Node := Node.GetNext;
  end;
  TV.Items.Clear;
end;


procedure TFrmAutoCum.TVDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
  {if (Source = IQSCust.wwDBGrid) or (Source = IQShip.wwDBGrid) or (Source = IQSOrds.wwDBGrid)
  then Accept := True
  else Accept := False;   }
end;

procedure TFrmAutoCum.IQSCustMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
 {IQSCust.wwdbgrid.SelectRecord;
 IQSCust.wwDBGrid.BeginDrag(FALSE);    }
end;

procedure TFrmAutoCum.IQShipMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
 {IQShip.wwdbgrid.SelectRecord;
 IQShip.wwDBGrid.BeginDrag(FALSE);   }
end;

procedure TFrmAutoCum.IQSOrdsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
{ IQSOrds.wwdbgrid.SelectRecord;
 IQSOrds.wwDBGrid.BeginDrag(FALSE);  }
end;

procedure TFrmAutoCum.TVDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
 { if (Source = IQSCust.wwDBGrid) then
    AssignCustomer
  else if (Source = IQShip.wwDBGrid) then
    AssignShipTo
  else if (Source = IQSOrds.wwDBGrid) then
    AssignOrder;

  IQSCust.wwDBGrid.UnselectAll;
  IQShip.wwDBGrid.UnselectAll;
  IQSOrds.wwDBGrid.UnselectAll;    }

end;

procedure TFrmAutoCum.AssignCustomer;
var
  Node:TUniTreeNode;
  i:Integer;
begin
  {if IQSCust.wwdbgrid.SelectedList.Count = 0 then
    IQSCust.wwdbgrid.SelectRecord;
  with IQSCust.wwdbgrid, IQSCust.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);
    DeleteCustomer;
    Node := TV.Items.AddChildObject( nil, QryCustCUSTNO.asString, TTreeViewCargo.Create( QryCustID.asFloat, 0, 0));
    AssignShipToNode(Node);
  end;        }
end;

procedure TFrmAutoCum.AssignShipTo;
var
  Node:TUniTreeNode;
  i:Integer;
begin
{ TODO : TIQUniGridControl has no member wwDBGrid. TUniTreeNode has no member AddChildObject}
 { if IQShip.wwdbgrid.SelectedList.Count = 0 then
    IQShip.wwdbgrid.SelectRecord;

  with IQShip.wwdbgrid, IQShip.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);

    DeleteShipTo;
    Node := LocateNode(0);
    if Node <> nil then
    begin
      Node := TV.Items.AddChildObject( Node, QryShipATTN.asString, TTreeViewCargo.Create( 0, QryShipID.AsFloat, 0));
    end
    else
    begin
      Node := TV.Items.AddChildObject( nil, QryCustCUSTNO.asString, TTreeViewCargo.Create( QryCustID.asFloat, 0, 0));
      Node := TV.Items.AddChildObject( Node, QryShipATTN.asString, TTreeViewCargo.Create( 0, QryShipID.AsFloat, 0));
    end;
    AssignOrdersNode(Node);
  end;
       }

end;

procedure TFrmAutoCum.AssignOrder;
var
  Node:TUniTreeNode;
  i:Integer;
begin
{ TODO : TIQUniGridControl has no member wwDBGrid. TUniTreeNode has no member AddChildObject}
 { if IQSOrds.wwdbgrid.SelectedList.Count = 0 then
    IQSOrds.wwdbgrid.SelectRecord;

  with IQSOrds.wwdbgrid, IQSOrds.wwdbgrid.datasource.dataset do
  for i:= 0 to SelectedList.Count-1 do
  begin
    GotoBookmark(SelectedList.items[i]);

    DeleteOrder;
    Node := LocateNode(1);

    if Node = nil then
    begin
      Node := LocateNode(0);
      if Node <> nil then
      begin
        Node := TV.Items.AddChildObject( Node, QryShipATTN.asString, TTreeViewCargo.Create( 0, QryShipID.AsFloat, 0));
      end
      else
      begin
        Node := TV.Items.AddChildObject( nil, QryCustCUSTNO.asString, TTreeViewCargo.Create( QryCustID.asFloat, 0, 0));
        Node := TV.Items.AddChildObject( Node, QryShipATTN.asString, TTreeViewCargo.Create( 0, QryShipID.AsFloat, 0));
      end;
    end;

    CheckOrderForPickTicket( QryOrdID.AsFloat );
    TV.Items.AddChildObject( Node, QryOrdORDERNO.asString, TTreeViewCargo.Create( 0, 0, QryOrdID.AsFloat));
  end;
     }

end;

procedure TFrmAutoCum.DeleteCustomer;
var
  Node:TUniTreeNode;
begin
 Node := LocateNode(0);
 if Node <> nil then
   DeleteNode(Node);
end;

procedure TFrmAutoCum.DeleteShipTo;
var
  Node:TUniTreeNode;
begin
 Node := LocateNode(1);
 if Node <> nil then
   DeleteNode(Node);
end;

procedure TFrmAutoCum.DeleteOrder;
var
  Node:TUniTreeNode;
begin
 Node := LocateNode(2);
 if Node <> nil then
   DeleteNode(Node);
end;



procedure TFrmAutoCum.AssignShipToNode(ANode:TUniTreeNode);
var
  Node:TUniTreeNode;
begin
  QryShip.First;
  while not QryShip.eof do
  begin
  { TODO : TUniTreeNode has no member addchildobject}
   // Node := TV.Items.AddChildObject( ANode, QryShipATTN.asString, TTreeViewCargo.Create( 0, QryShipID.AsFloat, 0));
    AssignOrdersNode(Node);
    QryShip.Next;
  end;
end;

procedure TFrmAutoCum.AssignOrdersNode(ANode:TUniTreeNode);
begin
  QryOrd.First;
  while not QryOrd.eof do
  begin
    CheckOrderForPickTicket( QryOrdID.AsFloat );
    { TODO : TUniTreeNode has no member addchildobject }
    //TV.Items.AddChildObject( ANode, QryOrdORDERNO.asString, TTreeViewCargo.Create( 0, 0, QryOrdID.AsFloat));
    QryOrd.Next;
  end;
end;



procedure TFrmAutoCum.DeleteNode(ANode:TUniTreeNode);
begin
  if ANode = NIL then EXIT;

  if ANode.HasChildren then DeleteNode( ANode.GetFirstChild ); // Recursive Delete

  if Assigned(ANode.Data) then TObject(ANode.Data).Free; // Free Mem

  TV.Items.Delete( ANode ); // Finally Delete
end;


function TFrmAutoCum.LocateNode(ALevel:Integer):TUniTreeNode;
var
  I:Integer;
begin
 Result := nil;
 for I := 0 to TV.Items.Count - 1 do
 if TV.Items[I].Level = ALevel then
 begin
   if ALevel = 0 then
   begin
     if TTreeViewCargo(TV.Items[I].Data).ArcustoId = QryCustID.asFloat then
     begin
       Result := TV.Items[I];
       exit;
     end;
   end
   else if ALevel = 1 then
   begin
     if TTreeViewCargo(TV.Items[I].Data).ShipToId = QryShipID.asFloat then
     begin
       Result := TV.Items[I];
       exit;
     end
   end
   else
   begin
     if TTreeViewCargo(TV.Items[I].Data).OrdersId = QryOrdID.asFloat then
     begin
       Result := TV.Items[I];
       exit;
     end
   end;
 end;

end;


procedure TFrmAutoCum.sbtnExpandClick(Sender: TObject);
begin
  TV.FullExpand;
end;

procedure TFrmAutoCum.sbtnCollapseClick(Sender: TObject);
begin
  TV.FullCollapse;
end;

procedure TFrmAutoCum.DeleteNode1Click(Sender: TObject);
begin
  if (TV.Selected = nil) or (TV.Selected.Count = 0) then
    IQWarning('There is no Node to delete.')
  else
  begin
    if not IqConfirmYN(Format('Do you wish to delete ''%s'' node?', [TV.Selected.Text])) then Exit;
    DeleteNode(TV.Selected);
  end;
end;

procedure TFrmAutoCum.TVMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Destination:TUniTreeNode;
  AQry:TFDQuery;
begin
  { TODO : TUniTreeNode has no member getnodeat }
  //Destination:= (Sender as TUniTreeView).GetNodeAt(X,Y);
  if Destination = nil then Exit;
  Destination.Selected := True;
{
  TV.Hint := '';

  if Destination.Level = 0 then
  begin
    AQry := TFDQuery.Create(NIL);
    with AQry do
    try
      Connection := MainModule.FDConnection;
      Sql.Add(IqFormat('select custno, company, addr1, addr2, addr3, city, state, country, zip from arcusto where id = %f',
              [TTreeViewCargo(Destination.Data).ArcustoId]));
      open;
      if not eof and bof then
      begin
        TV.Hint := Format('Cust#: %s'#13'Customer: %s'#13'Address1: %s'#13'Address2: %s'#13'City: %s'#13'State: %s'#13'Country: %s'#13'ZIP: %s',
                          [FieldByName('custno').asString,
                          FieldByName('company').asString,
                          FieldByName('addr1').asString,
                          FieldByName('addr2').asString,
                          FieldByName('addr3').asString,
                          FieldByName('city').asString,
                          FieldByName('state').asString,
                          FieldByName('country').asString,
                          FieldByName('zip').asString]);
      end;

    finally
      free;
    end;
  end
  else if Destination.Level = 1 then
  begin
  end
  else if Destination.Level = 2 then
  begin
  end
  else

  }
end;

procedure TFrmAutoCum.UniFormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, Panel2, Panel4, Panel6]);
  IQSetTablesActive( TRUE, self );
  { TODO : TIQUniGridControl has no member wwDBGrid }
  {IQSCust.wwDBGrid.MultiSelectOptions := [msoShiftSelect];
  IQShip.wwDBGrid.MultiSelectOptions := [msoShiftSelect];
  IQSOrds.wwDBGrid.MultiSelectOptions := [msoShiftSelect]; }
end;

procedure TFrmAutoCum.sbcalcClick(Sender: TObject);
var
  I:Integer;
begin
  if not IqConfirmYN('Do you wish to process Cumulative Resets') then Exit;
  if wwDate.Text = '' then
    raise exception.create('No Cumulative Reset Date specified');

 for I := 0 to TV.Items.Count - 1 do
 if TV.Items[I].Level = 2 then
   ProcessOrder(TTreeViewCargo(TV.Items[I].Data).OrdersId);

  IqConfirm('Cumulative Resets processed');
  ClearTreeView;
  QryCust.Close;
  QryCust.Open;
  QryShip.Close;
  QryShip.Open;
  QryOrd.Close;
  QryOrd.Open;
end;

procedure TFrmAutoCum.ProcessOrder(AOrderId:Real);
begin
  ExecuteCommandFmt('begin                                                            '+
            '  delete from ps_ticket_dtl where ord_detail_id in (select id from ord_detail where orders_id = %f); '+
            '  IQ_AUTO_CUM.ProcessOrder(%f, To_Date(''%s'', ''MM/DD/RRRR'')); '+
            'end;                                                             ',
            [ AOrderId,
              AOrderId,
              FormatDateTime('mm/dd/yyyy', wwDate.DateTime)]);
end;


procedure TFrmAutoCum.QryCustAfterScroll(DataSet: TDataSet);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
  {IQShip.wwDBGrid.UnselectAll;
  IQSOrds.wwDBGrid.UnselectAll;}
end;

procedure TFrmAutoCum.QryShipAfterScroll(DataSet: TDataSet);
begin
{ TODO : TIQUniGridControl has no member wwDBGrid }
 // IQSOrds.wwDBGrid.UnselectAll;
end;

procedure TFrmAutoCum.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1089659 );
end;

procedure TFrmAutoCum.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmAutoCum.CheckOrderForPickTicket( AOrders_ID: Real );
var
  AList: TStringList;
  I: Integer;
begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, IQFormat('select id from ord_detail where orders_id = %f', [ AOrders_ID ]));
    for I:= 0 to AList.Count - 1 do
      TFrmOrdOnPkTktExceptionEx.CheckPickTicketExists( StrToFloat(AList[ I ])); {PkTktChkEx.pas}
  finally
    AList.Free;
  end;
end;

end.
