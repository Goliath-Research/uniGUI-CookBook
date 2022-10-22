unit ict_wizard;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Search,
  IQMS.Common.UserMessages,
  ict_diagram,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  DBCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmICT_Wizard = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    N1: TUniMenuItem;
    Setup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    pctrlSteps: TUniPageControl;
    tabStep1: TUniTabSheet;
    tabStep3: TUniTabSheet;
    tabStep2: TUniTabSheet;
    Panel14: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Panel1: TUniPanel;
    btnStep1Next: TUniButton;
    btnStep1Cancel: TUniButton;
    Panel2: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel3: TUniPanel;
    Bevel2: TUniPanel;
    btnStep3Back: TUniButton;
    btnStep3Cancel: TUniButton;
    btnStep3Finish: TUniButton;
    Panel4: TUniPanel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Panel5: TUniPanel;
    Bevel3: TUniPanel;
    btnStep2Back: TUniButton;
    btnStep2Cancel: TUniButton;
    btnStep2Next: TUniButton;
    Bevel1: TUniPanel;
    IQSearchArinvt: TIQUniGridControl;
    pnlStep1Carrier: TUniPanel;
    pnlStep2Carrier: TUniPanel;
    SrcArinv: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtONHAND: TBCDField;
    QryArinvtQTY: TFMTBCDField;
    QryArinvtDUE_DATE: TDateTimeField;
    QryArinvtUOM: TStringField;
    Panel6: TUniPanel;
    SR: TIQWebSecurityRegister;
    Label7: TUniLabel;
    edPoNo: TUniEdit;
    chkCreateNewSalesOrder: TUniCheckBox;
    PkSalesOrder: TIQWebHPick;
    PkSalesOrderID: TBCDField;
    PkSalesOrderORDERNO: TStringField;
    PkSalesOrderCUSTNO: TStringField;
    PkSalesOrderSHIP_TO_ATTN: TStringField;
    PkSalesOrderSOURCE_EPLANT: TStringField;
    PkSalesOrderDIVISION_NAME: TStringField;
    QryArinvtNON_COMMITTED: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Setup1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnStep1NextClick(Sender: TObject);
    procedure btnStep2BackClick(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure btnStep1CancelClick(Sender: TObject);
    procedure QryArinvtUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure btnStep3FinishClick(Sender: TObject);
    procedure QryArinvtBeforePost(DataSet: TDataSet);
    procedure IQSearchArinvtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryArinvtAfterPost(DataSet: TDataSet);
    procedure chkCreateNewSalesOrderClick(Sender: TObject);
    procedure PkSalesOrderBeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    TargetChild: TFrmICTDiagram;
    SourceChild: TFrmICTDiagram;
    FItemsList: TStringList;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure DoOnShowHint( var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo );
    function GetChildInFocus: TFrmICTDiagram;
    procedure UpdateObject( AIndex: Integer; AQty: Real; ADate: TDateTime );
  protected
    property ChildInFocus: TFrmICTDiagram read GetChildInFocus;
  public
    { Public declarations }
    class procedure DoShow;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ict_setup,
  ict_objects,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  ict_share,
  { TODO -oSanketG -cWC : Need to revisit }
  //oe_main,
  IQMS.Common.Controls,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.HelpHook;

{ TFrmICT_Wizard }

class procedure TFrmICT_Wizard.DoShow;
var
  FrmICT_Wizard: TFrmICT_Wizard;
begin
  FrmICT_Wizard :=  self.Create( UniGUIApplication.uniApplication );
  FrmICT_Wizard.Show;
end;


procedure TFrmICT_Wizard.UniFormCreate(Sender: TObject);
begin
  FItemsList:= TStringList.Create;

  IQRegFormRead( self, [ self ]);
  pctrlSteps.ActivePageIndex:= 0;
  { TODO -oSanketG -cWC : Need to find alternative for DBNav, wwDBGrid  in TIQUniGridControl   }
  {IQSearchArinvt.DBNav.VisibleButtons:= IQSearchArinvt.DBNav.VisibleButtons + [nbCancel, nbPost];

  IQSearchArinvt.wwDBGrid.UseTFields:= FALSE;}

  //PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

procedure TFrmICT_Wizard.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  QryArinvt.Close;
  IQRegFormWrite( self, [ self ]);
  Application.OnShowHint:= NIL;
end;

procedure TFrmICT_Wizard.FormDestroy(Sender: TObject);
begin
  ClearStringListOfObjects( FItemsList );
  FItemsList.Free;

  if Assigned( TargetChild ) then
     TargetChild.Close;
  if Assigned( SourceChild ) then
     SourceChild.Close;
end;

procedure TFrmICT_Wizard.FormActivate(Sender: TObject);
begin
  Application.OnShowHint:= DoOnShowHint;
  IQHelp.AssignHTMLFile( iqchmICT{CHM}, iqhtmICT{HTM - obsolete} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmICT_Wizard.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmICT_Wizard.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmICT_Wizard.Setup1Click(Sender: TObject);
begin
  TFrmICT_SetUp.DoShowModal;  {ict_setup.pas}

  pctrlSteps.ActivePageIndex:= 0;

  {Rebuild diagrams}
  TargetChild.BuildDiagram;
  SourceChild.BuildDiagram;
end;

procedure TFrmICT_Wizard.IQAfterShowMessage(var Msg: TMessage);
begin
  {ensure default are assigned}
  ExecuteCommand('begin intercomp.ensure_internal_arcusto_exists; end;');

  {create 2 diagrams: target & source}
  TargetChild:= TFrmICTDiagram.Create(self);
  TargetChild.pnlCarrier.Parent:= pnlStep1Carrier;

  SourceChild:= TFrmICTDiagram.Create(self);
  SourceChild.pnlCarrier.Parent:= pnlStep2Carrier;
end;


procedure TFrmICT_Wizard.DoOnShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  with HintInfo do
  begin
    if (HintControl is TICT_Location_Base) then
       HintStr:= (HintControl as TICT_Location_Base).Text;
  end;
end;

procedure TFrmICT_Wizard.btnStep1NextClick(Sender: TObject);
begin
  if not Assigned( ChildInFocus ) then
     ABORT;

  IQAssert( ChildInFocus.SelectedLocationIndex >= 0, 'Please select location.' );

  if pctrlSteps.ActivePageIndex < pctrlSteps.PageCount - 1 then
     pctrlSteps.ActivePageIndex:= pctrlSteps.ActivePageIndex + 1;

  if ChildInFocus = SourceChild then
     SourceChild.DisableLocation( TargetChild.SelectedLocationIndex );

  if pctrlSteps.ActivePage = tabStep3 then
     Reopen( QryArinvt );
end;

procedure TFrmICT_Wizard.btnStep2BackClick(Sender: TObject);
begin
  if pctrlSteps.ActivePageIndex > 0 then
     pctrlSteps.ActivePageIndex:= pctrlSteps.ActivePageIndex - 1
end;

function TFrmICT_Wizard.GetChildInFocus: TFrmICTDiagram;
begin
  case pctrlSteps.ActivePageIndex of
    0: Result:= TargetChild;
    1: Result:= SourceChild;
  else
    Result:= NIL;
  end;
end;

procedure TFrmICT_Wizard.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  if not Assigned(SourceChild) or not Assigned(SourceChild.SelectedLocation) then
     EXIT;

  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('division_id').asFloat:= SourceChild.SelectedLocation.FDivision_ID;
  //   ParamByName('eplant_id').asFloat  := SourceChild.SelectedLocation.FEPlant_ID;
  // end;
  AssignQueryParamValue(DataSet, 'division_id', SourceChild.SelectedLocation.FDivision_ID );
  AssignQueryParamValue(DataSet, 'eplant_id',   SourceChild.SelectedLocation.FEPlant_ID );

  ClearStringListOfObjects( FItemsList );
  FItemsList.Clear;
end;

procedure TFrmICT_Wizard.QryArinvtUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

begin
  AAction := eaApplied;
end;

procedure TFrmICT_Wizard.QryArinvtBeforePost(DataSet: TDataSet);
begin
  if (QryArinvtDUE_DATE.AsDateTime > 0) and  (QryArinvtQTY.asFloat <= 0) then
     raise Exception.Create('Qty must be entered.')

  else if (QryArinvtDUE_DATE.AsDateTime = 0) and  (QryArinvtQTY.asFloat > 0) then
     raise Exception.Create('Due Date must be entered.');
end;

procedure TFrmICT_Wizard.btnStep1CancelClick(Sender: TObject);
begin
  if IQConfirmYN('Are you sure you want to exit?') then
     Close;
end;

procedure TFrmICT_Wizard.IQSearchArinvtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { TODO -oSanketG -cWC : Need to find alternative for wwDBGrid  in TIQUniGridControl}
  {if (Key = VK_DELETE) and (IQSearchArinvt.wwDBGrid.SelectedField = QryArinvtDUE_DATE) then
  begin
    QryArinvt.Edit;
    QryArinvtDUE_DATE.Clear;
    Key:= 0;
  end;}
end;

procedure TFrmICT_Wizard.QryArinvtAfterPost(DataSet: TDataSet);
var
  I: Integer;
begin
  with FItemsList do
  begin
    I:= IndexOf( QryArinvtID.asString );

    {Qty > 0 and not found in the list}
    if QryArinvtQTY.asFloat > 0 then
    begin
      if I = -1 then
         AddObject( QryArinvtID.asString, TICT_Cargo.Create( QryArinvtID.asFloat, QryArinvtQTY.asFloat, QryArinvtDue_Date.asDateTime))
      else
         UpdateObject(I, QryArinvtQTY.asFloat, QryArinvtDue_Date.asDateTime);
      EXIT;
    end;

    {Qty = 0 and found in the list}
    if I > -1 then
    begin
       Objects[ I ].Free;
       Delete( I );
    end;
  end;
end;

procedure TFrmICT_Wizard.UpdateObject( AIndex: Integer; AQty: Real; ADate: TDateTime );
begin
  with FItemsList.Objects[ AIndex ] as TICT_Cargo do
  begin
    Qty         := AQty;
    Promise_Date:= ADate;
  end;
end;

procedure TFrmICT_Wizard.btnStep3FinishClick(Sender: TObject);
var
  AEPlant_ID       : string;
  AIsSpecificEPlant: Boolean;
  AOrders_ID    : Real;
begin
   QryArinvt.CheckBrowseMode;
   IQAssert( FItemsList.Count > 0, 'Nothing is selected - unable to continue');

   if IQConfirmYN(Format('About to initiate intercompany transaction for %d item(s) - are you sure you wish to continue?', [ FItemsList.Count ])) then
   try
     {ensure eplant is marked as NULL}
     AIsSpecificEPlant:= SecurityManager.EPlant_ID <> 'NULL';
     if AIsSpecificEPlant then
     begin
       AEPlant_ID:= SecurityManager.EPlant_ID;
       SecurityManager.EPlant_ID:= 'NULL';
     end;

     if not chkCreateNewSalesOrder.Checked then
        edPoNo.Text:= '';

     AOrders_ID := 0;
     if not chkCreateNewSalesOrder.Checked then
     begin
       if PkSalesOrder.Execute then
         AOrders_ID := PkSalesOrder.GetValue('ID');
     end;

     { TODO -oSanketG -cWC : Need to revisit }
     {create sales order}
     {DoCreateEnsureOrder_ICT( TargetChild.SelectedLocation.FArcusto_ID,  // Arcusto_ID
                              SourceChild.SelectedLocation.FShip_To_ID,  // AShip_To_ID_From
                              TargetChild.SelectedLocation.FShip_TO_ID,  // AShip_To_ID_Trg
                              FItemsList,
                              chkCreateNewSalesOrder.Checked,
                              AOrders_ID,
                              edPoNo.Text );}
   finally
     {ensure eplant is restored!}
     if AIsSpecificEPlant then
        SecurityManager.EPlant_ID:= AEPlant_ID;
   end;

   Close;
end;

procedure TFrmICT_Wizard.chkCreateNewSalesOrderClick(Sender: TObject);
begin
  IQEnableControl( edPoNo, chkCreateNewSalesOrder.Checked );
end;

procedure TFrmICT_Wizard.PkSalesOrderBeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('arcusto_id').asFloat:= TargetChild.SelectedLocation.FArcusto_ID;
  // TFDQuery(DataSet).ParamByName('ASource_Eplant_ID').asFloat:= SourceChild.SelectedLocation.FEPlant_ID;

  AssignQueryParamValue(DataSet, 'arcusto_id', TargetChild.SelectedLocation.FArcusto_ID );
  AssignQueryParamValue(DataSet, 'ASource_Eplant_ID', SourceChild.SelectedLocation.FEPlant_ID );
end;


end.
