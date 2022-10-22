unit day_proj;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBGrids,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SoftEPlant,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,uniMainMenu,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel;

type
  TFrmDPartsProj = class(TUniForm)
    pnlMain: TUniPanel;
    Panel2: TUniPanel;
    pnlItems: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Splitter2: TUniSplitter;
    GridItems: TUniDBGrid;
    Panel5: TUniPanel;
    GridDay: TUniDBGrid;
    GridProj: TUniDBGrid;
    DBNavigator1: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    Options1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    Filter1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SrcItems: TDataSource;
    QryItems: TFDQuery;
    SrcDays: TDataSource;
    QryDays: TFDQuery;
    SrcProj: TDataSource;
    QryProj: TFDQuery;
    QryDaysQTY: TFMTBCDField;
    QryDaysPROD_DATE: TDateTimeField;
    QryDaysDayOfWeek: TStringField;
    PkArinvt: TIQWebHPick;
    QryItemsARINVT_ID: TBCDField;
    QryItemsITEMNO: TStringField;
    QryItemsDESCRIP: TStringField;
    QryItemsCLASS: TStringField;
    QryItemsREV: TStringField;
    QryItemsPARTNO_ID: TBCDField;
    QryItemsMFGNO: TStringField;
    PkArinvtARINVT_ID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtPARTNO_ID: TBCDField;
    PkArinvtMFGNO: TStringField;
    QryItemsSTANDARD_ID: TBCDField;
    QryDaysWORKORDER_ID: TBCDField;
    QryDaysPARTNO_ID: TBCDField;
    QryProjWORKORDER_ID: TBCDField;
    QryProjCUSTNO: TStringField;
    QryProjCOMPANY: TStringField;
    QryProjORDERNO: TStringField;
    QryProjPONO: TStringField;
    QryProjREL_DATE: TDateTimeField;
    QryProjREL_QUAN: TBCDField;
    QryProjEQNO: TStringField;
    SBSearch: TUniSpeedButton;
    SBFilter: TUniSpeedButton;
    StatusBar1: TUniStatusBar;
    N2: TUniMenuItem;
    Recalculate1: TUniMenuItem;
    QryItemsEPLANT_ID: TBCDField;
    QryItemsEPLANT_DESCRIP: TStringField;
    sbtnEplantView: TUniSpeedButton;
    SetEPlantView1: TUniMenuItem;
    SoftEPlant1: TIQWebSoftEPlant;
    PkArinvtEPLANT_ID: TBCDField;
    QryItemsBUYER_CODE_ID: TBCDField;
    QryItemsBUYER_CODE: TStringField;
    QryProjCNTR_DESC: TStringField;
    Bevel1: TUniPanel;
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    Label2: TUniLabel;
    Panel15: TUniPanel;
    Panel8: TUniPanel;
    Panel9: TUniPanel;
    Label1: TUniLabel;
    Panel10: TUniPanel;
    DBNavigator2: TUniDBNavigator;
    DBNavigator3: TUniDBNavigator;
    PkArinvtDESCRIP2: TStringField;
    QryItemsDESCRIP2: TStringField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure QryDaysCalcFields(DataSet: TDataSet);
    procedure SBSearchClick(Sender: TObject);
    procedure SBFilterClick(Sender: TObject);
    procedure Recalculate1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure sbtnEplantViewClick(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
     procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
  public
    { Public declarations }
    FWOFilterON:Boolean;
    FArCustoId:Real;
  end;

procedure DoDailyPartsProj;


implementation

{$R *.DFM}

uses
  capacity_rscstr,
  CapShare,
  DppFilt,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

const FSelect =
                'select a.id as arinvt_id, '    +
                       'a.itemno as itemno, '   +
                       'a.descrip as descrip, ' +
                       'a.descrip2 as descrip2, ' +
                       'a.class as class, '     +
                       'a.rev as rev, '         +
                       'p.id as partno_id, '    +
                       's.mfgno as mfgno, '     +
                       's.id as standard_id, '  +
                       'a.eplant_id, '          +
                       'decode( e.id, NULL, '' '', ''['' || e.ID || '']  '' || e.name ) as eplant_descrip, ' +
                       'a.buyer_code_id as buyer_code_id, '+
                       'b.buyer_code as buyer_code        '+
                  'from arinvt a, '             +
                       'partno p, '             +
                       'standard s, '           +
                       'arcusto c1, '           +
                       'eplant e,   '           +
                       'buyer_code b '          ;

const FWhere =
               'where p.standard_id = s.id '    +
                 'and p.arinvt_id = a.id '      +
                 'and s.arcusto_id = c1.id(+) ' +
                 'and a.eplant_id = e.id(+) '   +
                 'and a.buyer_code_id = b.id(+) ';

const FOrderBy = 'order by a.itemno ';

procedure DoDailyPartsProj;
var
  H:TPanelMesg;
begin
  H:= hPleaseWait('');
  try
    TFrmDPartsProj.Create(uniGUIApplication.UniApplication).Show;
  finally
    H.Free;
  end;
end;


procedure TFrmDPartsProj.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, GridItems, GridDay, GridProj, pnlItems, pnlMain]);
  Action := caFree;
end;

procedure TFrmDPartsProj.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, GridItems, GridDay, GridProj, pnlItems, pnlMain]);
  IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000002 {'Accessing Daily Parts Projection.  Please wait.'});


  FWOFilterON :=False;
  with QryItems do
  begin
    Close;
    Sql.Clear;
    Sql.Add(FSelect);
    Sql.Add(FWhere);
    Sql.Add(FOrderBy);
    Open;
  end;
  FArCustoID := 0;
  StatusBar1.Panels[0].Text := 'Inv.Items: ALL';
  StatusBar1.Panels[1].Text := 'Customers: ALL';
end;

procedure TFrmDPartsProj.IQRefreshDataSets( var Msg: TMessage );
begin
  // 02/14/2008 (Byron) These 2 lines prevent a screen-repaint problem
  Application.ProcessMessages;
  Invalidate;

  IQSetTablesActive( FALSE, self );
  IQSetTablesActiveEx( TRUE, self, capacity_rscstr.cTXT0000001 {'Refreshing data.  Please wait.'} );
end;

procedure TFrmDPartsProj.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDPartsProj.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmDPartsProj.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmDPartsProj.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmDPartsProj.QryDaysCalcFields(DataSet: TDataSet);
var
  nDay:Integer;
begin
  with QryDays do
    FieldByName('DayOfWeek').asString :=
     FormatDateTime('ddd.', FieldByName('PROD_DATE').asDateTime);
end;

procedure TFrmDPartsProj.SBSearchClick(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
      QryItems.Locate('PARTNO_ID', GetValue('PARTNO_ID'), []);
end;

procedure TFrmDPartsProj.SBFilterClick(Sender: TObject);
var
  cCustNo:String;
begin
  if DoDppFilter then  {in DppFilt.pas}
     with QryItems do
     begin
       Close;
       SQL.Clear;

       if FWOFilterOn then
          begin
            StatusBar1.Panels[0].Text := 'Inv.Items: On Workorders';
            if FArCustoID <> 0 then
               SQL.Add(FSelect + FWhere + IQFormat( ' and exists ( select ''X'' from workorder where standard_id = s.id and arcusto_id = %f ) ',
                                                   [ FArCustoId ]))
            else
               SQL.Add(FSelect + FWhere + 'and exists ( select ''X'' from workorder where standard_id = s.id )');
          end
       else
          begin
            StatusBar1.Panels[0].Text := 'Inv.Items: ALL';
            Sql.Add(FSelect + FWhere);
          end;

       SQL.Add(FOrderBy);

       Open;
     end;

  if FArCustoId <> 0 then
    with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      Sql.Add(IQFormat('select custno, company from arcusto where id = %f', [FArCustoId]));
      Open;
      StatusBar1.Panels[1].Text := Format('Customer: %s, (Cust#: %s)', [Trim(FieldByName('company').asstring),
                                                                        FieldByName('custno').asstring]);
    finally
      Free;
    end
  else
    StatusBar1.Panels[1].Text := 'Customers: ALL';

end;

procedure TFrmDPartsProj.Recalculate1Click(Sender: TObject);
begin
  //DoDayHrs( self, FALSE );
end;

procedure TFrmDPartsProj.FormActivate(Sender: TObject);
begin
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSCHED{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDPartsProj.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmDPartsProj.sbtnEplantViewClick(Sender: TObject);
begin
  if SoftEPlant1.ChangeEPlantView then
     PostMessage( Handle, iq_RefreshDataSets, 0, 0 );
end;

procedure TFrmDPartsProj.UniFormShow(Sender: TObject);
begin
   CheckMatReqRecalc(self);
end;

procedure TFrmDPartsProj.AssignEPlantFilter(DataSet: TDataSet);
begin
  SoftEPlant1.AssignEPlantFilter( DataSet );
end;

end.
