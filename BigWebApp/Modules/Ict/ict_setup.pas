unit ict_setup;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  //WEB_CONVERT IQMS.Common.UserMessages,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.CaptionPanel,
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
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniImageList,
  uniGUIClasses,
  uniTreeView,
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
  uniDBNavigator,
  uniMainMenu, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TICT_SetupCargo = class
     Arcusto_ID: Real;
     Company   : string;
     Addr1     : string;
     Addr2     : string;
     Addr3     : string;
     City      : string;
     State     : string;
     Country   : string;
     Zip       : string;
     Phone     : string;
     Fax       : string;
     EPlant_ID : Real;
     constructor Create( AArcusto_ID: Real; AEPlant_ID: Real = 0 );
  end;

  TFrmICT_SetUp = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Splitter2: TUniSplitter;
    DI: TwwDataInspector;
    Panel3: TUniPanel;
    wwDBGridShipTo: TIQUniGridControl;
    SrcShip_to: TDataSource;
    QryShipTo: TFDQuery;
    QryShipToID: TBCDField;
    QryShipToARCUSTO_ID: TBCDField;
    QryShipToATTN: TStringField;
    QryShipToADDR1: TStringField;
    QryShipToADDR2: TStringField;
    QryShipToADDR3: TStringField;
    QryShipToCITY: TStringField;
    QryShipToSTATE: TStringField;
    QryShipToCOUNTRY: TStringField;
    QryShipToZIP: TStringField;
    QryShipToSHIP_TIME: TBCDField;
    QryShipToPHONE_NUMBER: TStringField;
    QryShipToEXT: TStringField;
    QryShipToFAX: TStringField;
    QryShipToPRIME_CONTACT: TStringField;
    QryShipToEPLANT_ID: TBCDField;
    QryShipToDIVISION_ID: TBCDField;
    UpdateSQLShipTo: TFDUpdateSQL;
    QryShipToDivision_Name: TStringField;
    wwDBLookupComboDivision: TUniDBLookupComboBox;
    QryDivision: TFDQuery;
    QryDivisionID: TBCDField;
    QryDivisionNAME: TStringField;
    QryDivisionDESCRIP: TStringField;
    QryDivisionEPLANT_ID: TBCDField;
    ImageList1: TUniImageList;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PopupMenu1: TUniPopupMenu;
    AddDivision1: TUniMenuItem;
    QryShipToDEFAULT_SHIP_TO: TStringField;
    Panel5: TUniPanel;
    TV: TUniTreeView;
    pnlMasterDistributionWarning: TUniPanel;
    CaptionPanel1: TIQWebCaptionPanel;
    Bevel1: TUniPanel;
    Panel6: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure TVChange(Sender: TObject; Node: TUniTreeNode);
    procedure ApplyUpdateToTable(DataSet: TDataSet);
    procedure QryShipToNewRecord(DataSet: TDataSet);
    procedure QryShipToBeforeOpen(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);}
    procedure QryDivisionBeforeOpen(DataSet: TDataSet);
    procedure wwDBLookupComboDivisionDropDown(Sender: TObject);

    procedure QryShipToBeforePost(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure AddDivision1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryShipToCalcFields(DataSet: TDataSet);
    procedure wwDBLookupComboDivisionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_AfterShowMessage'
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;}
    procedure LoadOrganizationStructure;
    procedure ClearTreeView;
    function LoadCorporate: TUniTreeNode;
    procedure LoadEplants( AParentNode: TUniTreeNode );
    procedure AssignDataInspector(ACargo: TICT_SetupCargo);
    function GetSelected_Arcusto_ID: Real;
    function GetSelected_EPlant_ID: Real;
    procedure CheckDisplayWarningMasterDistributionMissing;
  public
    { Public declarations }
    class procedure DoShowModal;
    property Selected_Arcusto_ID: Real read GetSelected_Arcusto_ID;
    property Selected_EPlant_ID: Real read GetSelected_EPlant_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.SysShare,
  IQMS.Common.StringUtils,
  ict_new_division,
  IQMS.Common.HelpHook;


{ TICT_SetupCargo }

constructor TICT_SetupCargo.Create( AArcusto_ID: Real; AEPlant_ID: Real = 0 );
var
  A: Variant;
begin
  A:= SelectValueArrayFmt('select a.id, a.company, a.addr1, a.addr2, a.addr3, a.city, a.state, a.country, a.zip, a.phone_number, a.fax_number from arcusto a where a.id = %f',
                     [ AArcusto_ID ]);
  if VarArrayDimCount( A ) > 0 then
  begin
    Arcusto_ID:= A[ 0 ];
    Company   := A[ 1 ];
    Addr1     := A[ 2 ];
    Addr2     := A[ 3 ];
    Addr3     := A[ 4 ];
    City      := A[ 5 ];
    State     := A[ 6 ];
    Country   := A[ 7 ];
    Zip       := A[ 8 ];
    Phone     := A[ 9 ];
    Fax       := A[ 10];
  end;

  EPlant_ID:= AEPlant_ID; {only relevant for eplant nodes}
end;

{ TFrmICT_SetUp }

class procedure TFrmICT_SetUp.DoShowModal;
begin
  with self.Create(UniGUIApplication.UniApplication) do
    ShowModal;
end;

procedure TFrmICT_SetUp.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  {ensure default are assigned}
  ExecuteCommand('begin intercomp.ensure_internal_arcusto_exists; end;');

  IQRegFormWrite( self, [ self, wwDBGridShipTo ]);
end;

procedure TFrmICT_SetUp.FormDestroy(Sender: TObject);
begin
  ClearTreeView;
end;

(* TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_AfterShowMessage'
procedure TFrmICT_SetUp.IQAfterShowMessage(var Msg: TMessage);
begin
  LoadOrganizationStructure;
  TV.FullExpand;
  TV.Selected:= TV.Items[ TV.Items.Count - 1 ];
  Application.ProcessMessages;
  {change selected to refresh data inspector...}
  TV.Selected:= TV.Items[ 0 ];
end;
*)

procedure TFrmICT_SetUp.LoadOrganizationStructure;
var
  ANode: TUniTreeNode;
begin
  ClearTreeView;

  ANode:= LoadCorporate;

  if SelectValueAsFloat('select count(*) from eplant') > 0 then
     LoadEplants( ANode );

  CheckDisplayWarningMasterDistributionMissing;
end;

procedure TFrmICT_SetUp.ClearTreeView;
var
  I: Integer;
begin
  for I:= TV.Items.Count - 1 downto 0 do
  begin
    if Assigned( TV.Items[ I ].Data ) then TICT_SetupCargo(TV.Items[ I ].Data).Free;
    TV.Items.Delete( TV.Items[ I ]);
  end;
end;


function TFrmICT_SetUp.LoadCorporate: TUniTreeNode;
var
  ACargo: TICT_SetupCargo;
begin
  ACargo:= TICT_SetupCargo.Create( SelectValueAsFloat('select arcusto_id_intercomp from iqsys'));
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'AddChildObject'
  Result:= TV.Items.AddChildObject( nil, ACargo.Company, ACargo );}
  Result.ImageIndex:= 0;
  Result.SelectedIndex:= 0;
end;


procedure TFrmICT_SetUp.LoadEplants( AParentNode: TUniTreeNode );
var
  ACargo: TICT_SetupCargo;
begin
  with TFDQuery.Create(nil) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add('select id, arcusto_id_intercomp from eplant where nvl(inactive, ''N'') <> ''Y'' order by id');
    Open;
    while not Eof do
    begin
      ACargo:= TICT_SetupCargo.Create( FieldByName('arcusto_id_intercomp').asFloat, FieldByName('id').asFloat );
      { TODO -oBantuK -cWEB_CONVERT :
              Undeclared identifier: 'AddChildObject'
              Undeclared identifier: 'ImageIndex'
              Undeclared identifier: 'SelectedIndex'
      with TV.Items.AddChildObject( AParentNode, ACargo.Company, ACargo ) do
      begin
        ImageIndex:= 1;
        SelectedIndex:= 1;
      end;}
      Next;
    end;
  finally
    Free;
  end;
end;


procedure TFrmICT_SetUp.TVChange(Sender: TObject; Node: TUniTreeNode);
begin
  if Assigned( Node.Data ) then
  begin
    QryShipTo.CheckBrowseMode;
    AssignDataInspector( TICT_SetupCargo( Node.Data ));
    Reopen( QryShipTo );
  end;
end;


procedure TFrmICT_SetUp.UniFormShow(Sender: TObject);
begin
  {ensure default are assigned}
  ExecuteCommand('begin intercomp.ensure_internal_arcusto_exists; end;');

  IQSetTablesActive( TRUE, self );

  // CheckReplaceDivisionOfWWSelected( Selected ) didn't work - switch to directly assigning the caption;
  { TODO -oBantuK -cWEB_CONVERT :
        Undeclared identifier: 'ColumnByName'
        Undeclared identifier: 'DisplayLabel'
  with wwDBGridShipTo.ColumnByName('division_name') do DisplayLabel:= CheckReplaceDivisionCaption(DisplayLabel);
  with AddDivision1 do Caption:= CheckReplaceDivisionCaption( Caption );}

  IQRegFormRead( self, [ self, wwDBGridShipTo ]);

  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'iq_AfterShowMessage'
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );}
end;

procedure TFrmICT_SetUp.AssignDataInspector( ACargo: TICT_SetupCargo );
begin
  DI.GetItemByTagString('Company').EditText:= ACargo.Company;
  DI.GetItemByTagString('Addr1').EditText  := ACargo.Addr1;
  DI.GetItemByTagString('Addr2').EditText  := ACargo.Addr2;
  DI.GetItemByTagString('Addr3').EditText  := ACargo.Addr3;
  DI.GetItemByTagString('City').EditText   := ACargo.City;
  DI.GetItemByTagString('State').EditText  := ACargo.State;
  DI.GetItemByTagString('Country').EditText:= ACargo.Country;
  DI.GetItemByTagString('Zip').EditText    := ACargo.Zip;
  DI.GetItemByTagString('Phone').EditText  := ACargo.Phone;
  DI.GetItemByTagString('Fax').EditText    := ACargo.Fax;
  DI.Invalidate;
end;

procedure TFrmICT_SetUp.ApplyUpdateToTable(DataSet: TDataSet);
begin
  RefreshDataSetByID( DataSet );
  CheckDisplayWarningMasterDistributionMissing;
end;

procedure TFrmICT_SetUp.QryShipToNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID').asFloat:= GetNextID('ship_to');
  DataSet.FieldByName('ARCUSTO_ID').asFloat:= Selected_Arcusto_ID;

  if Assigned(TV.Selected) and (TV.Selected.Level = 1) then
     DataSet.FieldByName('eplant_id').asFloat:= TICT_SetupCargo( TV.Selected.Data ).EPlant_ID;
end;

function TFrmICT_SetUp.GetSelected_Arcusto_ID: Real;
begin
  if Assigned(TV.Selected) and Assigned( TV.Selected.Data ) then
     Result:= TICT_SetupCargo( TV.Selected.Data ).Arcusto_ID
  else
     Result:= 0;
end;

procedure TFrmICT_SetUp.QryShipToBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('arcusto_id').asFloat:= Selected_Arcusto_ID;
  //
  //   if Assigned(TV.Selected) then
  //      if TV.Selected.Level = 0 then
  //         ParamByName('all_eplant').asFloat:= 1
  //      else
  //         ParamByName('all_eplant').asFloat:= 0;
  //
  //   ParamByName('eplant_id').asFloat:= Selected_EPlant_ID;
  // end;

  AssignQueryParamValue(DataSet, 'arcusto_id', Selected_Arcusto_ID);
  if Assigned(TV.Selected) then
     if TV.Selected.Level = 0 then
        AssignQueryParamValue(DataSet, 'all_eplant', 1)
     else
        AssignQueryParamValue(DataSet, 'all_eplant', 0);
  AssignQueryParamValue(DataSet, 'eplant_id', Selected_EPlant_ID);
end;

procedure TFrmICT_SetUp.QryDivisionBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   if Assigned(TV.Selected) then
  //      if TV.Selected.Level = 0 then
  //         ParamByName('all_eplant').asFloat:= 1
  //      else
  //         ParamByName('all_eplant').asFloat:= 0;
  //
  //   ParamByName('eplant_id').asFloat:= Selected_EPlant_ID;
  // end;

  if Assigned(TV.Selected) then
     if TV.Selected.Level = 0 then
        AssignQueryParamValue(DataSet, 'all_eplant', 1)
     else
        AssignQueryParamValue(DataSet, 'all_eplant', 0);
  AssignQueryParamValue(DataSet, 'eplant_id', Selected_EPlant_ID);
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TNavigateBtn'
procedure TFrmICT_SetUp.CheckRefresh(Sender: TObject;  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;}

procedure TFrmICT_SetUp.wwDBLookupComboDivisionCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if modified then
  begin
     QryShipTo.Edit;
     QryShipToDIVISION_ID.asFloat:= LookupTable.FieldByName('id').asFloat
  end;
end;

procedure TFrmICT_SetUp.wwDBLookupComboDivisionDropDown(Sender: TObject);
begin
  Reopen(QryDivision)
end;

procedure TFrmICT_SetUp.QryShipToBeforePost(DataSet: TDataSet);
begin
  {ensure unique arcusto_id, eplant_id, division_id}
  IQAssert( SelectValueFmtAsFloat('select 1 from ship_to where arcusto_id = %f and NVL(eplant_id, 0) = NVL(%f,0) and NVL(division_id,0) = NVL(%f,0) and id <> %f',
                      [ DataSet.FieldByName('arcusto_id').asFloat,
                        DataSet.FieldByName('eplant_id').asFloat,
                        DataSet.FieldByName('division_id').asFloat,
                        DataSet.FieldByName('id').asFloat ]) = 0,
           CheckReplaceDivisionCaption('Duplicated Ship To address - EPlant ID / Division combination must be unique.' ));  {IQMS.Common.SysShare.pas}

  if QryShipToATTN.asString = '' then
     QryShipToATTN.asString:= ProperCase(Trim(QryShipToDivision_Name.asString));


  if  DataSet.FieldByName('default_ship_to').asString = 'Y' then
      ExecuteCommandFmt('update ship_to set default_ship_to = ''N''           '+
                ' where id in ( select s.id from arcusto a, ship_to s '+
                '                where a.is_intercomp = ''Y''         '+
                '                  and a.id = s.arcusto_id            '+
                '                  and s.default_ship_to = ''Y''      '+
                '                  and s.id <> %f )                   ',
                [ DataSet.FieldByName('id').asFloat ]);
end;

procedure TFrmICT_SetUp.QryShipToCalcFields(DataSet: TDataSet);
begin
  if QryShipToDIVISION_ID.asFloat > 0 then
     QryShipToDivision_Name.asString:= SelectValueByID('name', 'division', QryShipToDIVISION_ID.asFloat)
end;

procedure TFrmICT_SetUp.btnOKClick(Sender: TObject);
begin
  QryShipTo.CheckBrowseMode;
  Close;
end;

function TFrmICT_SetUp.GetSelected_EPlant_ID: Real;
begin
  if Assigned(TV.Selected) then
     if (TV.Selected.Level = 1) and Assigned( TV.Selected.Data ) then
        Result:= TICT_SetupCargo( TV.Selected.Data ).EPlant_ID
     else
        Result:= 0;
end;


procedure TFrmICT_SetUp.AddDivision1Click(Sender: TObject);
var
  AEplnt_ID: Real;
begin
  if not IQConfirmYN( CheckReplaceDivisionCaption('About to create new Division along with shipping address - please confirm to continue.')) then
     EXIT;

  if TFrmICTNewDivision.Execute( Selected_Arcusto_ID, Selected_EPlant_ID ) then  {ict_new_division.pas}
  begin
    Reopen( QryShipTo );
  end;
end;


procedure TFrmICT_SetUp.CheckDisplayWarningMasterDistributionMissing;
begin
  pnlMasterDistributionWarning.Visible:= SelectValueAsFloat('select 1 from arcusto a, ship_to s where a.is_intercomp = ''Y'' '+
                                                '   and a.id = s.arcusto_id and s.default_ship_to = ''Y'' ') = 0;
end;


procedure TFrmICT_SetUp.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmICT{CHM}, iqhtmICT{HTM - obsolete} );  {IQMS.Common.HelpHook.pas}
end;

end.
