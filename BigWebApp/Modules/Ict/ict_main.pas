{pay attention to the tree view indexes - clicking on the treeview launches things based on AbsoluteIndex}
unit ict_main;

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
  IQMS.WebVcl.About,
  ict_diagram,
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  Data.DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.RepDef,
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
  System.ImageList,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniTreeView,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu,
  IQMS.Common.JumpConstants;

const
  {These are TreeView absolute indexes that we go by when user clicks on the those nodes}
  cWIZARD       = 1;
  cTRUCK_RATE   = 2;
  cINVENTORY    = 4;
  cSALESORDER   = 5;
  cKANBAN_SETUP = 6;

type
  TFrmICT_Main = class(TUniForm)
    pnlActions: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    pnlCarrier: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel4: TUniPanel;
    Panel14: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    imgListActions: TUniImageList;
    IQAbout1: TIQWebAbout;
    StatusBar1: TUniStatusBar;
    N1: TUniMenuItem;
    Setup1: TUniMenuItem;
    TV: TUniTreeView;
    PkSalesOrder: TIQWebHPick;
    PkSalesOrderID: TBCDField;
    PkSalesOrderORDERNO: TStringField;
    PkSalesOrderCUSTNO: TStringField;
    PkSalesOrderSHIP_TO_ATTN: TStringField;
    PkSalesOrderSOURCE_EPLANT: TStringField;
    PkSalesOrderDIVISION_NAME: TStringField;
    Contents1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQRepDef1: TIQWebRepDef;
    SecurityRegister1: TIQWebSecurityRegister;
    Options1: TUniMenuItem;
    Parameters1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    { TODO -oSanketG -cWC : Need to revisit,
    [dcc32 Error] ict_main.pas(98): E2003 Undeclared identifier: 'TCustomTreeView' ,[dcc32 Error] ict_main.pas(99): E2003 Undeclared identifier: 'TCustomDrawState'}
    {procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TUniTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);}
    procedure TVClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Setup1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PkSalesOrderBeforeOpen(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Parameters1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FDiagram: TFrmICTDiagram;
    procedure DispatchTVClick(AIndex: Integer);
    procedure SetStatusText(const Value: string);
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
    { Private declarations }
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent ); override;
    class procedure DoShow;
    property StatusText: string write SetStatusText;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oSanketG -cWC : Need to revisit }
  //ict_wizard,
  ict_setup,
  ict_objects,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.Jump,
  { TODO -oSanketG -cWC : Need to revisit }
  //ict_inventory,
  IQMS.WebVcl.SecurityManager,
  { TODO -oSanketG -cWC : Need to revisit }
  {ict_kanban_eplant,
  ict_kanban_division,}
  IQMS.Common.HelpHook,
  ict_params,
  ict_truck_rate;

{ TFrmICT_Main }

class procedure TFrmICT_Main.DoShow;
var
  FrmICT_Main: TFrmICT_Main;
begin
  if SelectValueAsFloat('select NVL(acct_id_IntPlant_Sales, 0) from iqsys where rownum < 2') = 0 then
    raise Exception.Create('Default InterPlant Sales GL Account not assigned. Please assign in System Parameters.');
  FrmICT_Main := self.Create(UniGUIApplication.uniApplication);
  FrmICT_Main.Show;
end;

procedure TFrmICT_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.OnShowHint:= NIL;
  IQRegFormWrite( self, [ self, pnlActions ]);
end;


procedure TFrmICT_Main.UniFormCreate(Sender: TObject);
begin
   IQRegFormRead( self, [ self, pnlActions ]);
  //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmICT_Main.FormDestroy(Sender: TObject);
begin
  if Assigned( FDiagram ) then
     FDiagram.Close;
end;

procedure TFrmICT_Main.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmICT{CHM}, iqhtmICT{HTM - obsolete} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmICT_Main.IQAfterShowMessage(var Msg: TMessage);
begin
  TV.FullExpand;

  {ensure default are assigned}
  ExecuteCommand('begin intercomp.ensure_internal_arcusto_exists; end;');

  {create diagram}
  FDiagram:= TFrmICTDiagram.Create(self);
  FDiagram.pnlCarrier.Parent:= pnlCarrier;
end;

procedure TFrmICT_Main.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmICT_Main.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

{ TODO -oSanketG -cWC : Need to revisit }
(*procedure TFrmICT_Main.TVCustomDrawItem(Sender: TCustomTreeView;
  Node: TUniTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  {Write main nodes in bold style}
  with TV.Canvas do
    if Node.Level = 0 then
      Font.Style:= [fsBold];
end;*)

procedure TFrmICT_Main.TVClick(Sender: TObject);
begin
  if Assigned( TV.Selected ) then
     DispatchTVClick( TV.Selected.AbsoluteIndex );
end;

procedure TFrmICT_Main.DispatchTVClick( AIndex: Integer );
var
  AOrders_ID: Real;
  AKind     : string;
begin
  case AIndex of
    {cWIZARD    :
      { TODO -oSanketG -cWC : Need to revisit , depends on ict_wizard}
      {TFrmICT_Wizard.DoShow; {ict_wizard.pas}

    {cTRUCK_RATE:
      { TODO -oSanketG -cWC : Need to revisit , depends on ict_truck_rate}
      //TFrmICT_TruckRate.DoShow( self );  {ict_truck_rate.pas}

    cINVENTORY :
      begin
        IQAssert( FDiagram.SelectedLocationIndex >= 0, 'You must select intercompany location first' );
         { TODO -oSanketG -cWC : Need to revisit , depends on ict_inventory}
        //TFrmICT_Inventory.DoShow( FDiagram.SelectedLocation.FEplant_ID, FDiagram.SelectedLocation.FDivision_ID );   // ict_inventory
      end;

    cSALESORDER:
      begin
        IQAssert( FDiagram.SelectedLocationIndex >= 0, 'You must select intercompany location first' );
        // AOrders_ID:= SelectValueFmtAsFloat('select id from orders where arcusto_id = %f and ship_to_id = %f', [ FDiagram.SelectedLocation.FArcusto_ID, FDiagram.SelectedLocation.FShip_TO_ID ]);
        AOrders_ID:= SelectValueFmtAsFloat('select id from orders where arcusto_id = %f', [ FDiagram.SelectedLocation.FArcusto_ID ]);
        if AOrders_ID = 0 then
        begin
          IQConfirm('No intercompany order found for selected location.');
          EXIT;
        end;
        if PkSalesOrder.Execute then
           JumpDirect( iq_JumpToSalesOrder, Trunc( PkSalesOrder.GetValue('ID')));
      end;

    cKANBAN_SETUP:
      begin
        IQAssert( FDiagram.SelectedLocationIndex >= 0, 'You must select intercompany location first' );
        IQAssert( not (FDiagram.SelectedLocation is TICT_Location_Corporate), 'Corporate inventory level is not applicable to eKanban trigger.' );
        { TODO -oSanketG -cWC : Need to revisit }
        (*if FDiagram.SelectedLocation is TICT_Location_EPlant then
           TFrmKanban_EPlant.DoShow( 'EPlant', FDiagram.SelectedLocation.FEplant_ID, FDiagram.SelectedLocation.FDivision_ID )      {ict_kanban_eplant.pas}

        else if FDiagram.SelectedLocation is TICT_Location_Division then
           TFrmKanban_Division.DoShow( 'Division', FDiagram.SelectedLocation.FEplant_ID, FDiagram.SelectedLocation.FDivision_ID ); {ict_kanban_division.pas}*)
      end;
  end;
end;

procedure TFrmICT_Main.SetStatusText(const Value: string);
begin
  { TODO -oSanketG -cWC : Need to find alternative for SimpleText in TUniStatusBar}
  //StatusBar1.SimpleText:= Value;
  StatusBar1.Update;
end;


procedure TFrmICT_Main.Setup1Click(Sender: TObject);
begin
  TFrmICT_SetUp.DoShowModal;  {ict_setup.pas}
  FDiagram.BuildDiagram;
end;


procedure TFrmICT_Main.DoOnShowHint(var HintStr: string;  var CanShow: Boolean; var HintInfo: THintInfo);
var
  ANode: TUniTreeNode;
begin
  with HintInfo do
  begin
    if (HintControl is TICT_Location_Base) then
       HintStr:= (HintControl as TICT_Location_Base).Text

    else if HintControl = TV then
       begin
          { TODO -oSanketG -cWC : Need to find laternative for GetNodeAt in TUniTreeNode}
          //ANode:= TV.GetNodeAt(HintInfo.CursorPos.X, HintInfo.CursorPos.Y);
          if not Assigned( ANode ) or not (ANode.AbsoluteIndex in [ cWIZARD, cINVENTORY, cSALESORDER ]) then
          begin
            CanShow:= FALSE;
            EXIT;
          end;

          ReshowTimeout:= 400;
          case ANode.AbsoluteIndex of
            cWIZARD    : HintStr:= 'Launch Intercompany Transaction Wizard';
            cTRUCK_RATE: HintStr:= 'Full truck rate table maintenance';
            cINVENTORY : HintStr:= 'Show inventory info based on selected intercompany location';
            cSALESORDER:
               begin
                 HintStr:= 'Show sales order generated to be shipped to selected intercompany location';
                 if SecurityManager.EPlant_ID_AsFloat > 0 then
                    HintStr:= HintStr + #13#13 + Format('Note - sales order will only show items belonging to EPlant %s', [ SecurityManager.EPlant_Name ]);
               end;
          end
       end;
  end;
end;


procedure TFrmICT_Main.PkSalesOrderBeforeOpen(DataSet: TDataSet);
begin
  // if FDiagram.SelectedLocationIndex >= 0 then with DataSet as TFDQuery do
  //    ParamByName('arcusto_id').asFloat:= FDiagram.SelectedLocation.FArcusto_ID;

  if FDiagram.SelectedLocationIndex >= 0 then
     AssignQueryParamValue(DataSet, 'arcusto_id', FDiagram.SelectedLocation.FArcusto_ID);
end;

procedure TFrmICT_Main.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmICT_Main.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmICT_Main.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext )
end;

procedure TFrmICT_Main.Parameters1Click(Sender: TObject);
begin
  TFrmICT_Params.DoShowModal(  );  // ict_params.pas
end;


end.
