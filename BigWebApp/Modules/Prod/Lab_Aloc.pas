unit Lab_Aloc;

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
  ComCtrls,
  ExtCtrls,
  IQMS.WebVcl.Search,
  Grids,
  DBGrids,
  Db,
  Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniDateTimePicker,
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
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniComboBox,
  uniDBComboBox;

type
  TFrmLaborAllocation = class(TUniForm)
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    TabSheet2: TUniTabSheet;
    Panel3: TUniPanel;
    DBGrid1: TUniDBGrid;
    wwSrcItems: TDataSource;
    wwQryItems: TFDQuery;
    wwQryItemsARINVT_ID: TBCDField;
    wwQryItemsCLASS: TStringField;
    wwQryItemsITEMNO: TStringField;
    wwQryItemsDESCRIP: TStringField;
    wwQryItemsSTANDARD_ID: TBCDField;
    wwQryItemsMFGNO: TStringField;
    SrcSndOp: TDataSource;
    QrySndOp: TFDQuery;
    QrySndOpSEQ: TBCDField;
    QrySndOpOPNO: TStringField;
    QrySndOpSNDOP_ID: TBCDField;
    wwSrcMfg: TDataSource;
    wwQryMfg: TFDQuery;
    wwQryMfgMFGNO: TStringField;
    wwQryMfgSTANDARD_ID: TBCDField;
    IQSearch2: TIQUniGridControl;
    wwSrcSndOp: TDataSource;
    wwQrySndOpAll: TFDQuery;
    QrySndOpDESCRIP: TStringField;
    wwQrySndOpAllOPNO: TStringField;
    wwQrySndOpAllDESCRIP: TStringField;
    wwQrySndOpAllSNDOP_ID: TBCDField;
    wwQryItemsREV: TStringField;
    procAppend_Free_Form: TFDStoredProc;
    PnlOpLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlOpLeft02: TUniPanel;
    PnlOpClient02: TUniPanel;
    PnlOpClient01: TUniPanel;
    Splitter3: TUniSplitter;
    PnlOpLeft03: TUniPanel;
    PnlOpClient03: TUniPanel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    Label3: TUniLabel;
    Label4: TUniLabel;
    edHrs: TUniEdit;
    edQty: TUniEdit;
    Splitter4: TUniSplitter;
    Panel5: TUniPanel;
    Label6: TUniLabel;
    pnlBottomBtns: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwcombMfg: TUniDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwSrcItemsDataChange(Sender: TObject; Field: TField);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Validate;
    procedure CheckCondition( ACondition: Boolean; AMesg: string );
    function GetSndOpID: Real;
  public
    { Public declarations }
  end;

procedure DoLaborAllocation;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  prod_rscstr;

procedure DoLaborAllocation;
var
  FrmLaborAllocation: TFrmLaborAllocation;
begin

  FrmLaborAllocation := TFrmLaborAllocation.Create(uniGUIApplication.UniApplication);

  FrmLaborAllocation.ShowModal;

end;

procedure TFrmLaborAllocation.FormCreate(Sender: TObject);
begin
 // IQRegFormRead( self, [ self, PnlOpLeft01, PnlOpLeft02, PnlOpLeft03 ]);
  DateTimePicker1.DateTime:= Date;
  IQSetTablesActive( TRUE, self );
  wwSrcItemsDataChange( NIL, NIL );
end;

procedure TFrmLaborAllocation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //IQRegFormWrite( self, [ self, PnlOpLeft01, PnlOpLeft02, PnlOpLeft03 ]);
end;

procedure TFrmLaborAllocation.wwSrcItemsDataChange(Sender: TObject;
  Field: TField);
begin
   with wwcombMfg do
   begin
    // LookupValue:= LookUpTable.FieldByName('mfgno').asString;
    //PerformSearch;
   end;
end;

function TFrmLaborAllocation.GetSndOpID: Real;
begin
  if PageControl1.ActivePage = TabSheet1 then
     Result:= QrySndOpSNDOP_ID.asFloat
  else
     Result:= wwQrySndOpAllSNDOP_ID.asFloat;
end;

procedure TFrmLaborAllocation.btnOKClick(Sender: TObject);
begin
  Validate;
  with procAppend_Free_Form do
  begin
    ParamByName('v_arinvt_id'     ).AsFMTBCD:= wwQryItemsARINVT_ID.asFloat;
    ParamByName('v_standard_id_in').AsFMTBCD:= wwQryMfgSTANDARD_ID.asFloat;
    ParamByName('v_sndop_id'      ).AsFMTBCD:= GetSndOpID;
    ParamByName('v_prod_date'     ).AsDateTime := DateTimePicker1.DateTime;
    ParamByName('v_act_hrs'       ).AsFMTBCD:= StrToFloat(edHrs.Text);
    ParamByName('v_act_qty'       ).AsFMTBCD:= StrToFloat(edQty.Text);
    ParamByName('v_day_part_id'   ).Clear;
    Prepare;
    ExecProc;
  end;
  edHrs.Text:= '0';
  edQty.Text:= '0';
end;

procedure TFrmLaborAllocation.Validate;
begin
  CheckCondition( not (wwQryItems.Eof and wwQryItems.Bof), prod_rscstr.cTXT0000002 {'No inventory item selected'});
  CheckCondition( GetSndOpID > 0, prod_rscstr.cTXT0000003 {'No operation selected'});
  CheckCondition( Trim(wwcombMfg.Text) > '', prod_rscstr.cTXT0000004 {'No Manufacturing number selected.'});
  StrToFloat(edHrs.Text);
  StrToFloat(edQty.Text);
end;

procedure TFrmLaborAllocation.CheckCondition( ACondition: Boolean; AMesg: string );
begin
  if not ACondition then
     raise Exception.Create( AMesg );
end;

procedure TFrmLaborAllocation.FormActivate(Sender: TObject);
begin
  //IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmPROD_REP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmLaborAllocation.FormShow(Sender: TObject);
begin
  CheckVistaAdjustSize([ edHrs, edQty ]);
end;

end.
