unit IQMS.PrintLabels.lmedit;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.DBCtrls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
//  Vcl.Wwdatsrc,
  Mask,
  uniDBGrid,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Phys.ADS,
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
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, IQUniGrid, uniGUIFrame, uniFileUpload;

const
  fStr = 'insert into lm_labels_detail ' +
         '(lm_labels_id, ' +
         'field_name, '    +
         'field_type, '    +
         'width, '         +
         'dec, '           +
         'act_width) '     +
         'values '         +
         '(%f, '           +
         '''%s'', '        +
         '''%s'', '        +
         '%d, '            +
         '%d, '            +
         '%d)';


type
  TFrmLabels = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    Delete1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlToolbarUpper: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    PC: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    SBToggleHeader: TUniSpeedButton;
    GridHeader: TIQUniGridControl;
    SrcLabelsDtl: TDataSource;
    TblLabelsDtl: TFDTable;
    SrcLabels: TDataSource;
    TblLabels: TFDTable;
    TblLabelsID: TBCDField;
    TblLabelsARCUSTO_ID: TBCDField;
    TblLabelsLABEL_FILE: TStringField;
    TblLabelsLABEL_MENU_NAME: TStringField;
    TblLabelsLABEL_TYPE: TStringField;
    TblLabelsCustomer: TStringField;
    QryArcusto: TFDQuery;
    wwCustomerForm: TUniDBLookupComboBox;
    EditLabel: TUniDBEdit;
    EditMenu: TUniDBEdit;
    CBType: TUniDBComboBox;
    QryArcustoID: TBCDField;
    QryArcustoCOMPANY: TStringField;
    QryArcustoCUSTNO: TStringField;
    QryArcustoADDR1: TStringField;
    QryArcustoADDR2: TStringField;
    QryArcustoCITY: TStringField;
    QryArcustoSTATE: TStringField;
    QryArcustoZIP: TStringField;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    TblLMInv: TFDTable;
    TblLMMat: TFDTable;
    TblLabelsDtlLM_LABELS_ID: TBCDField;
    TblLabelsDtlFIELD_NAME: TStringField;
    TblLabelsDtlFIELD_TYPE: TStringField;
    TblLabelsDtlWIDTH: TBCDField;
    TblLabelsDtlDEC: TBCDField;
    TblLabelsDtlACT_WIDTH: TBCDField;
    TblArcusto: TFDTable;
    TblArcustoID: TBCDField;
    TblArcustoCUSTNO: TStringField;
    TblArcustoCOMPANY: TStringField;
    TblArcustoADDR1: TStringField;
    TblArcustoADDR2: TStringField;
    TblArcustoCITY: TStringField;
    TblArcustoSTATE: TStringField;
    TblArcustoZIP: TStringField;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    BtnCreate: TUniButton;
    BtnReset: TUniButton;
    Panel7: TUniPanel;
    Label37: TUniLabel;
    EditLMDir: TUniDBEdit;
    sbtnSelectDir: TUniSpeedButton;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    SBSearch: TUniSpeedButton;
    N2: TUniMenuItem;
    Search1: TUniMenuItem;
    N3: TUniMenuItem;
    ResettoDefaults1: TUniMenuItem;
    CreateDBFFile1: TUniMenuItem;
    TblLabelsLABEL_KIND: TStringField;
    Label5: TUniLabel;
    cbKind: TUniDBComboBox;
    PCustomer: TUniPopupMenu;
    SelectCustomer1: TUniMenuItem;
    TblLabelsREMOTE_SERVER: TStringField;
    TblLabelsEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    TblLabelsEPlant_Name: TStringField;
    TblLabelsCOMM_PORT: TStringField;
    Label6: TUniLabel;
    wwDBComboBox2: TUniDBComboBox;
    Label7: TUniLabel;
    Label8: TUniLabel;
    sbtnEPlant: TUniSpeedButton;
    dbePlantName: TUniDBEdit;
    wwDBComboBox1: TUniDBComboBox;
    QryArcustoPK_HIDE: TStringField;
    popmHeader: TUniPopupMenu;
    Trace1: TUniMenuItem;
    TblLabelsREPORT_NAME: TStringField;
    PnlDetailGrid: TUniPanel;
    GridDetail: TIQUniGridControl;
    bvSpacerDetail1: TUniPanel;
    TblLabelsCRW_LABEL_COPIES: TBCDField;
    Label9: TUniLabel;
    DBEdit1: TUniDBEdit;
    Contents1: TUniMenuItem;
    TblLabelsVERIFY_REPRINT: TStringField;
    N4: TUniMenuItem;
    CreateDBFFileforEveryLMLabel1: TUniMenuItem;
    TblLabelsLABEL_TEMPLATE_ID: TBCDField;
    TblLabelTemplate: TFDTable;
    TblLabelsTemplate: TStringField;
    Edit1: TUniMenuItem;
    LabelTemplates1: TUniMenuItem;
    sbtnArcusto: TUniSpeedButton;
    SrcArcusto: TDataSource;
    UniFileUpload1: TUniFileUpload;
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBToggleHeaderClick(Sender: TObject);
    procedure TblLabelsBeforePost(DataSet: TDataSet);
    procedure TblLabelsDtlBeforeEdit(DataSet: TDataSet);
    procedure TblLabelsDtlBeforeDelete(DataSet: TDataSet);
    procedure SrcLabelsDtlDataChange(Sender: TObject; Field: TField);
    procedure TblLabelsAfterPost(DataSet: TDataSet);
    procedure BtnCreateClick(Sender: TObject);
    procedure TblLabelsDtlBeforePost(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure sbtnSelectDirClick(Sender: TObject);
    procedure BtnResetClick(Sender: TObject);
    procedure SBSearchClick(Sender: TObject);
    procedure SelectCustomer1Click(Sender: TObject);
    procedure wwNetNamesDropDown(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure sbtnEPlantClick(Sender: TObject);
    procedure wwCustomerGridDropDown(Sender: TObject);
    procedure Trace1Click(Sender: TObject);
    procedure wwDBComboBoxRTMReportNameDropDown(Sender: TObject);
    procedure SrcLabelsDataChange(Sender: TObject; Field: TField);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CreateDBFFileforEveryLMLabel1Click(Sender: TObject);
    procedure wwDBComboBoxLabelTemplateDropDown(Sender: TObject);
    procedure LabelTemplates1Click(Sender: TObject);
    procedure PkLabelTemplatesIQModify(Sender: TObject;
      var Action: TModalResult; var ResultValue: Variant);
    procedure FormShow(Sender: TObject);
//    procedure NavHeaderBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure TblLabelsTemplateChange(Sender: TField);
    procedure wwCustomerGridCloseUp(Sender: TObject);
    procedure TblLabelsBeforeDelete(DataSet: TDataSet);
    procedure GridHeaderUniDBLookupComboBox1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure GridHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridDetailDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    procedure InsertDtlRecord(AID:Real; AFieldName, AFieldType:String; AWidth, ADec, Actual:Integer; AQry:TFDQuery);
    procedure Validate;
    procedure CreateDBFFile( AConfirmOverwrite: Boolean = TRUE );
  protected
    { Protected declarations }
    FDBFConnection: TFDConnection;
    function GetDBFConnection: TFDConnection;
    function GetDBFDirectory: string;
    procedure AssignManufacturedLabelRecords;
    procedure AssignPurchasedLabelRecords;
    procedure AssignRejectLabelRecords;
    procedure CheckAssignRejectLabelRecords(AID: Real; AQry:TFDQuery);
    procedure AssignLoadLabelRecords;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

procedure DoLabelMaintenance;

implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.Directory,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LMEditTouchScreen,
  IQMS.PrintLabels.LMShare,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.LabelEditor,
  Math,
  IQMS.Common.PanelMsg,
   IQMS.Common.SetPlant,
   IQMS.Common.TRBase,
  IQMS.WebVcl.ResourceStrings;

procedure DoLabelMaintenance;
begin
  if IQMS.Common.ApplicationSet.IsTouchScreen then //  IQLMEdit_TouchScreen.pas
    TFrmLabelsTouchScreen.DoShowModal
  else
    TFrmLabels.DoShowModal;
end;

class procedure TFrmLabels.DoShowModal;
begin
  with TFrmLabels.Create(uniGUIApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TFrmLabels.FormShow(Sender: TObject);
begin
    IQRegFormRead( self, [self, GridHeader, GridDetail, Panel2]);

    IQSetTablesActive( true, self );
    PC.ActivePage := TabGrid;
end;

procedure TFrmLabels.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmLBL{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmLabels.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    IQRegFormWrite( self, [self, GridHeader, GridDetail, Panel2]);
end;

procedure TFrmLabels.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmLabels.SBToggleHeaderClick(Sender: TObject);
begin
  if (PC.ActivePage = TabGrid) or (Sender = NIL) then
  begin
    GridHeader.DataSource:= NIL;
    PC.ActivePage := TabForm;
  end
  else
  begin
    GridHeader.DataSource:= SrcLabels;
    PC.ActivePage := TabGrid;
  end;
end;

procedure TFrmLabels.TblLabelsBeforeDelete(DataSet: TDataSet);
begin
  IQCheckDelete(GridHeader.DBNavigator, nbDelete, IQMS.WebVcl.ResourceStrings.cTXT0000458);
end;

procedure TFrmLabels.TblLabelsBeforePost(DataSet: TDataSet);
var
  cFileName:String;
  aEplantId:Real;
begin
  IQAssignIDBeforePost(DataSet); {in IQlib}
  if dataset.State in [dsInsert] then
  begin
    aEplantId := SelectValueAsFloat('select misc.geteplantid from dual');
    if (aEplantId <> 0) then
      TblLabelsEPLANT_ID.asFloat := aEplantId;
  end;
  Validate;

  with TblLabels do
  begin
    if (State = dsInsert) and (FieldByName('eplant_id').asFloat = 0) and (SecurityManager.EPlant_ID_AsFloat > 0) then
       FieldByName('eplant_id').asFloat:= SecurityManager.EPlant_ID_AsFloat;

    if not ( (FieldByName('label_kind').asString = ''       ) or
             (FieldByName('label_kind').asString = 'PALLET' ) or
             (FieldByName('label_kind').asString = 'RF' ) or
             (FieldByName('label_kind').asString = 'NONSERIAL' ) or
             (FieldByName('label_kind').asString = 'SCANID' ) or
             (FieldByName('label_kind').asString = 'NOSHIP' ) or
             (FieldByName('label_kind').asString = 'GENERAL')  ) then
       ExecuteCommandFmt('update lm_labels set label_kind = null '+
                 ' where label_type = ''%s''             '+
                 '   and label_kind = ''%s''             '+
                 '   and NVL(eplant_id,0) = %f           '+
                 '   and (arcusto_id is null or arcusto_id = %f) '+
                 '   and id <> %f                        ',
                [ FieldByName('label_type').asString,
                  FieldByName('label_kind').asString,
                  FieldByName('eplant_id').asFloat,
                  FieldByName('arcusto_id').asFloat,
                  FieldByName('ID').asFloat ]);
  end;
end;

procedure TFrmLabels.Validate;
var
  AFileName: string;
begin
  if (TblLabelsLABEL_FILE.asString > '') and (TblLabelsREPORT_NAME.asString > '') then
     // '%s and %s are mutually exclusive.  Please choose one or the other.'
     raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000138, [ TblLabelsLABEL_FILE.DisplayLabel, TblLabelsREPORT_NAME.DisplayLabel ]);

  if (TblLabelsLABEL_FILE.asString > '') and (TblLabelsLABEL_TEMPLATE_ID.AsFloat > 0) then
     // '%s and %s are mutually exclusive.  Please choose one or the other.'
     raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000138, [ TblLabelsLABEL_FILE.DisplayLabel, TblLabelsLABEL_TEMPLATE_ID.DisplayLabel ]);

  if (TblLabelsLABEL_TEMPLATE_ID.AsFloat > 0) and (TblLabelsREPORT_NAME.asString > '') then
     // '%s and %s are mutually exclusive.  Please choose one or the other.'
     raise Exception.CreateFmt( IQMS.WebVcl.ResourceStrings.cTXT0000138, [ TblLabelsLABEL_TEMPLATE_ID.DisplayLabel, TblLabelsREPORT_NAME.DisplayLabel ]);

  if (TblLabelsLABEL_FILE.asString = '') and (TblLabelsREPORT_NAME.asString = '')
    and not (TblLabelsLABEL_TEMPLATE_ID.AsFloat > 0) then
     raise Exception.CreateFmt(IQMS.WebVcl.ResourceStrings.cTXT0000139 {'Please choose either %s or %s or %s.'},
      [ TblLabelsLABEL_FILE.DisplayLabel, TblLabelsREPORT_NAME.DisplayLabel, TblLabelsLABEL_TEMPLATE_ID.DisplayLabel ]);

  with TblLabels do
    if (TblLabelsLABEL_FILE.asString > '') then
       begin
         AFileName := FieldByName('Label_File').asString;
         if (Occurances('.', AFileName) > 1) or (Pos('.', AFileName) = 1) then
           raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000140 {'Invalid file name.'} );

         if Occurances('.', AFileName) > 0 then
           AFileName := Copy(AFileName, 1, Pos('.', AFileName) - 1);

         FieldByName('label_file').asString:= AFileName + '.DBF';
       end;

  if (TblLabels.FieldByName('label_kind').asString = 'PALLET' ) or
     (TblLabels.FieldByName('label_kind').asString = 'RF' ) or
//     (TblLabels.FieldByName('label_kind').asString = 'NONSERIAL' ) or   (*Remmed by AMB 06-08-15- EIQ-6510 SER # 06754- Remove limit of One Per Customer from NONSERIAL Type *)
     (TblLabels.FieldByName('label_kind').asString = 'SCANID' ) then
  begin
    if TblLabelsARCUSTO_ID.asFloat = 0 then
    begin
      if TblLabelsEPLANT_ID.asFloat = 0 then
      begin
        if SelectValueFmtAsFloat('select count(id) from LM_LABELS where LABEL_KIND = ''%s'' and LABEL_TYPE = ''%s'' and ARCUSTO_ID is null and id <> %f and eplant_id is null',
                   [TblLabelsLABEL_KIND.asString, TblLabelsLABEL_TYPE.asString, TblLabelsID.asFloat]) <> 0 then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000443); {'Label with the same kind and type already exists'}
      end
      else
      begin
        if SelectValueFmtAsFloat('select count(id) from LM_LABELS where LABEL_KIND = ''%s'' and LABEL_TYPE = ''%s'' and ARCUSTO_ID is null and id <> %f and eplant_id = %f',
                   [TblLabelsLABEL_KIND.asString, TblLabelsLABEL_TYPE.asString, TblLabelsID.asFloat, TblLabelsEPLANT_ID.asFloat]) <> 0 then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000443); {'Label with the same kind and type already exists'}
      end;
    end
    else
    begin
      if TblLabelsEPLANT_ID.asFloat = 0 then
      begin
        if SelectValueFmtAsFloat('select count(id) from LM_LABELS where LABEL_KIND = ''%s'' and LABEL_TYPE = ''%s'' and ARCUSTO_ID = %f and id <> %f and eplant_id is null',
                     [TblLabelsLABEL_KIND.asString, TblLabelsLABEL_TYPE.asString, TblLabelsARCUSTO_ID.asFloat, TblLabelsID.asFloat]) <> 0 then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000443); {'Label with the same kind and type already exists'}

      end
      else
      begin
        if SelectValueFmtAsFloat('select count(id) from LM_LABELS where LABEL_KIND = ''%s'' and LABEL_TYPE = ''%s'' and ARCUSTO_ID = %f and id <> %f and eplant_id = %f',
                     [TblLabelsLABEL_KIND.asString, TblLabelsLABEL_TYPE.asString, TblLabelsARCUSTO_ID.asFloat, TblLabelsID.asFloat, TblLabelsEPLANT_ID.asFloat]) <> 0 then
         raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000443); {'Label with the same kind and type already exists'}

      end;

    end;
  end;
end;

procedure TFrmLabels.TblLabelsAfterPost(DataSet: TDataSet);
var
  nId:Real;
begin
  TblLabels.Refresh;

  if ((TblLabelsREPORT_NAME.asString > '') or (TblLabelsLABEL_TEMPLATE_ID.AsFloat > 0))  then
     {if we using report builder or label designer we don't need lm_labels_detail records}
     ExecuteCommandFmt('delete from lm_labels_detail where lm_labels_id = %f', [ TblLabelsID.asFloat ])

  else if SelectValueFmtAsFloat('select count(lm_labels_id) from lm_labels_detail where lm_labels_id = %f', [ TblLabelsID.asFloat ]) = 0 then
     {check if needed to create the DBF file}
     btnCreate.Click;

  TblLabelsDtl.Refresh;
end;



procedure TFrmLabels.TblLabelsDtlBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
end;

procedure TFrmLabels.TblLabelsDtlBeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;


procedure TFrmLabels.InsertDtlRecord(AID:Real; AFieldName, AFieldType:String; AWidth, ADec, Actual:Integer; AQry:TFDQuery);
begin
  if SelectValueFmtAsFloat('select lm_labels_id from LM_LABELS_DETAIL where TrimLeft(RTrim(field_Name)) = ''%s'' and LM_LABELS_ID = %f',
               [AFieldName, AID]) <> 0 then Exit;
  with AQry do
  begin
    Sql.Clear;
    Sql.Add(IQFormat(fStr, [AId, AFieldName, AFieldType, AWidth, ADec, Actual]));
    ExecSql;
  end;
end;

procedure TFrmLabels.LabelTemplates1Click(Sender: TObject);
begin
//  with PkLabelTemplates do
//    if Execute then
//      IQMS.Common.LabelEditor.EditLabel(GetValue('ID'));
end;

procedure TFrmLabels.AssignManufacturedLabelRecords;
var
  nId :Real;
  AQry:TFDQuery;
begin
  nId := TblLabels.FieldByName('ID').asFloat;
  AQry := TFDQuery.Create(NIL);
  with AQry do
  try
    ConnectionName := 'IQFD';
    InsertDtlRecord(nId, UpperCase('part_no'),    'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('part_desc'),  'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('quantity'),   'Numeric'  ,  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('rev'),        'Character', 15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('moldno'),     'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('order_no'),   'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('pono'),       'Character', 20, 0, 20, AQry);
    InsertDtlRecord(nId, UpperCase('cust_no'),    'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('customer'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('address1'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('address2'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('address3'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('city_st_zp'), 'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('material'),   'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('vendor'),     'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('packno'),     'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('ptspac'),     'Numeric'  , 12, 2, 12, AQry);
    InsertDtlRecord(nId, UpperCase('fg_lotno'),   'Character', 25, 0, 25, AQry);
//    InsertDtlRecord(nId, UpperCase('baseno'),     'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('baseno'),     'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('routing'),    'Character',  5, 0,  5, AQry);
    InsertDtlRecord(nId, UpperCase('boxno'),      'Numeric'  ,  4, 0,  4, AQry);
    InsertDtlRecord(nId, UpperCase('part_no2'),   'Character', 26, 0, 26, AQry);
    InsertDtlRecord(nId, UpperCase('quantity2'),  'Character',  9, 0,  9, AQry);
    InsertDtlRecord(nId, UpperCase('rev2'),       'Character', 16, 0, 16, AQry);
    InsertDtlRecord(nId, UpperCase('moldno2'),    'Character', 26, 0, 26, AQry);
    InsertDtlRecord(nId, UpperCase('order_no2'),  'Character', 11, 0, 11, AQry);
    InsertDtlRecord(nId, UpperCase('pono2'),      'Character', 21, 0, 21, AQry);
    InsertDtlRecord(nId, UpperCase('cust_no2'),   'Character', 11, 0, 11, AQry);
    InsertDtlRecord(nId, UpperCase('ptspac2'),    'Character', 12, 0, 12, AQry);
    InsertDtlRecord(nId, UpperCase('fg_lotno2'),  'Character', 26, 0, 26, AQry);
//    InsertDtlRecord(nId, UpperCase('baseno2'),    'Character', 11, 0, 11, AQry);
    InsertDtlRecord(nId, UpperCase('baseno2'),    'Character', 26, 0, 26, AQry);
    InsertDtlRecord(nId, UpperCase('routing2'),   'Character',  6, 0,  6, AQry);
    InsertDtlRecord(nId, UpperCase('boxno2'),     'Character',  5, 0,  5, AQry);
    InsertDtlRecord(nId, UpperCase('ord_quan'),   'Numeric'  , 13, 2, 13, AQry);
    InsertDtlRecord(nId, UpperCase('aka_ptno'),   'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('aka_ptno2'),  'Character', 26, 0, 26, AQry);
    InsertDtlRecord(nId, UpperCase('aka_desc'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('pck_wght'),   'Numeric'  , 14, 6, 14, AQry);
    InsertDtlRecord(nId, UpperCase('pck_wght2'),  'Character', 21, 0, 21, AQry);
    InsertDtlRecord(nId, UpperCase('serial'),     'Numeric',   15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('cserial'),    'Character',  9, 0,  9, AQry);
    InsertDtlRecord(nId, UpperCase('zipcode'),    'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('vendor_2'),   'Character', 31, 0, 31, AQry);
    InsertDtlRecord(nId, UpperCase('series'),     'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('tboxno'),     'Numeric'  ,  5, 0,  5, AQry);
    InsertDtlRecord(nId, UpperCase('billname'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('billadd'),    'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('billadd2'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('billadd3'),   'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('billcityst'), 'Character', 30, 0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('billzip'),    'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('ecno'),       'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('lbl_time'),   'Character',  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('material2'),  'Character',100, 0,100, AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item1'), 'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item2'), 'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item3'), 'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item4'), 'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item5'), 'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('bldesc1'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('bldesc2'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('bldesc3'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('bldesc4'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('bldesc5'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt1'), 'Numeric'  , 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt2'), 'Numeric'  , 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt3'), 'Numeric'  , 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt4'), 'Numeric'  , 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt5'), 'Numeric'  , 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('serial2'),    'Character', 16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('drawing'),    'Character', 15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('pressno'),    'Character', 10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('cntr_desc'),    'Character', 50, 0, 50, AQry);
    InsertDtlRecord(nId, UpperCase('pl_itemno'),  'Character', 25, 0, 25, AQry);

    InsertDtlRecord(nId, UpperCase('inv_cuser1'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser2'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser3'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser4'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser5'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser6'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser7'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser8'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser9'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('invcuser10'), 'Character', 100,  0, 100, AQry);

    InsertDtlRecord(nId, UpperCase('inv_nuser1'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser2'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser3'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser4'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser5'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser6'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser7'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser8'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser9'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('invnuser10'), 'Numeric'  ,  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('cartonsplt'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('piecescart'), 'Numeric'  ,  16,  6, 16,  AQry);



    InsertDtlRecord(nId, UpperCase('DOCKID'),     'Character',  30,  0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('LINEFEED'),   'Character',  30,  0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('RESERVELOC'), 'Character',  30,  0, 30, AQry);
    InsertDtlRecord(nId, UpperCase('SHPTOUSER1'), 'Character',  60,  0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('SHPTOUSER2'), 'Character',  60,  0, 60, AQry);

    InsertDtlRecord(nId, UpperCase('eplant_id'),  'Numeric'  ,  15, 0, 15,  AQry);
    InsertDtlRecord(nId, UpperCase('label_date'), 'Date'     ,  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('raw_mat_ex'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('class'),      'Character',   2,  0,  2,  AQry);
    InsertDtlRecord(nId, UpperCase('raw_cusr1'),  'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('raw_cusr2'),  'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('raw_cusr3'),  'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('raw_cusr4'),  'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('raw_cusr5'),  'Character', 100,  0, 100, AQry);
//    InsertDtlRecord(nId, UpperCase('raw_cusr6'),  'Character', 100,  0, 100, AQry);
//    InsertDtlRecord(nId, UpperCase('raw_cusr7'),  'Character', 100,  0, 100, AQry);
//    InsertDtlRecord(nId, UpperCase('raw_cusr8'),  'Character', 100,  0, 100, AQry);
//    InsertDtlRecord(nId, UpperCase('raw_cusr9'),  'Character', 100,  0, 100, AQry);
//    InsertDtlRecord(nId, UpperCase('raw_cusr10'), 'Character', 100,  0, 100, AQry);

    InsertDtlRecord(nId, UpperCase('raw_nusr1'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('raw_nusr2'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('raw_nusr3'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('raw_nusr4'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('raw_nusr5'), 'Numeric'  ,  16,  6, 16,  AQry);
//    InsertDtlRecord(nId, UpperCase('raw_nusr6'), 'Numeric'  ,  16,  6, 16,  AQry);
//    InsertDtlRecord(nId, UpperCase('raw_nusr7'), 'Numeric'  ,  16,  6, 16,  AQry);
//    InsertDtlRecord(nId, UpperCase('raw_nusr8'), 'Numeric'  ,  16,  6, 16,  AQry);
//    InsertDtlRecord(nId, UpperCase('raw_nusr9'), 'Numeric'  ,  16,  6, 16,  AQry);
//    InsertDtlRecord(nId, UpperCase('raw_nusr10'), 'Numeric' ,  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('ptwt'),       'Numeric'  , 14, 6, 14, AQry);
    InsertDtlRecord(nId, UpperCase('prod_date'),  'Date'     ,  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('shift'),      'Numeric',   1, 0, 1, AQry);

    // InsertDtlRecord(nId, UpperCase('ord_detail'),  'Numeric'  ,  15, 0, 15,  AQry);

    {Packaging AKA}
    InsertDtlRecord(nId, UpperCase('pk_akaitem'),  'Character',  25, 0, 25,  AQry);

    // Pkg_arinvt_itemno
    InsertDtlRecord(nId, UpperCase('Pkg_itemno'),  'Character',  25, 0, 25,  AQry);

    // columns for serialized shipping labels on complete pallet
    InsertDtlRecord(nId, UpperCase('qty_per_pk'), 'Numeric',   16, 6, 16, AQry);
    InsertDtlRecord(nId, UpperCase('qty_of_pks'), 'Numeric',   16, 6, 16, AQry);

    {EDI}
    InsertDtlRecord(nId, UpperCase('isa_r_code'), 'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('su_s_code'),  'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_11z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_12z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_13z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_14z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_15z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_16z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('pci_17z'),    'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('ship_to_u5'), 'Character',   60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('edi_s_code'), 'Character',   20, 0,  20,  AQry);
    InsertDtlRecord(nId, UpperCase('cust_ref'),   'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('sf_n1_code'), 'Character',  250, 0, 250,  AQry);
    InsertDtlRecord(nId, UpperCase('ran'),        'Character',   30, 0,  30,  AQry);

    InsertDtlRecord(nId, UpperCase('seg_man'),    'Character',  250, 0, 250,  AQry);

    InsertDtlRecord(nId, UpperCase('aka_c4'),     'Character',   60, 0,  60,  AQry);

    InsertDtlRecord(nId, UpperCase('co_addr1'),   'Character',   60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('co_addr2'),   'Character',   60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('co_city' ),   'Character',   30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('co_state'),   'Character',    5, 0,   5,  AQry);
    InsertDtlRecord(nId, UpperCase('co_zip'  ),   'Character',   10, 0,  10,  AQry);

    InsertDtlRecord(nId, UpperCase('aka_rev'),    'Character',   15, 0,  15,  AQry);
    InsertDtlRecord(nId, UpperCase('division'),   'Character',   25, 0,  25,  AQry);

    InsertDtlRecord(nId, UpperCase('EDIUser1'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser2'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser3'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser4'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser5'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser6'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser7'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser8'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser9'),  'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser10'), 'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser11'), 'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser12'), 'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser13'), 'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser14'), 'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('EDIUser15'), 'Character',    60, 0,  60,  AQry);

    InsertDtlRecord(nId, UpperCase('supp_code'), 'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('upc_code'),  'Character',    20, 0,  20,  AQry);
    InsertDtlRecord(nId, UpperCase('upc_code2'), 'Character',    20, 0,  20,  AQry);
    InsertDtlRecord(nId, UpperCase('pk_1_item'), 'Character',    25, 0,  25,  AQry);
    InsertDtlRecord(nId, UpperCase('pk_1_tare'), 'Numeric',      14, 6,  14,  AQry);
    InsertDtlRecord(nId, UpperCase('pk_tare'),   'Numeric',      14, 6,  14,  AQry);

    InsertDtlRecord(nId, UpperCase('rel_cuser1'),'Character',    60, 0,  60,  AQry);
    InsertDtlRecord(nId, UpperCase('rel_cuser2'),'Character',    60, 0,  60,  AQry);

    InsertDtlRecord(nId, UpperCase('country'),   'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('lot_date'),  'Date'     ,    8, 0,    8,  AQry);
    InsertDtlRecord(nId, UpperCase('workord_id'),'Numeric'  ,    15, 0,  15,  AQry);
    InsertDtlRecord(nId, UpperCase('countryorg'),'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('packslipno'),'Character',    15, 0,  15,  AQry);
    InsertDtlRecord(nId, UpperCase('DATE_REC'),'Date',    8, 0,  8,  AQry);

    InsertDtlRecord(nId, UpperCase('shelf_life'),'Numeric',     8, 0,  8,  AQry);
    InsertDtlRecord(nId, UpperCase('start_time'),'Character',   30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('expiry_dt'),'Date'     ,   8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('part_desc2'),  'Character',  100, 0, 100, AQry);

    InsertDtlRecord(nId, UpperCase('ord_uom'),   'Character',  10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('ord_seq'),   'Numeric',    15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser1'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser2'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser3'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser4'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser5'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser6'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('shipeplant'),'Numeric',    15, 0, 15, AQry);

    CheckAssignRejectLabelRecords(nId, AQry);

  finally
    AQry.Free;
  end;
  TblLabelsDtl.Refresh;
end;

procedure TFrmLabels.AssignLoadLabelRecords;
var
  nId :Real;
  AQry:TFDQuery;
begin
//  ExecuteCommandFmt('delete from lm_labels_detail where lm_labels_id = %f', [ TblLabels.FieldByName('ID').AsFloat ]);
  nId := TblLabels.FieldByName('ID').asFloat;
  AQry := TFDQuery.Create(NIL);
  with AQry do
  try
    ConnectionName := 'IQFD';
    InsertDtlRecord(nId, UpperCase('lbl_date'),   'Date'     ,  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('descrip'),    'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('serial'),     'Numeric',   15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('cserial'),    'Character',  9, 0,  9, AQry);

    InsertDtlRecord(nId, UpperCase('inv_cuser1'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser2'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser3'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser4'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser5'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser6'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser7'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser8'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser9'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('invcuser10'), 'Character', 100,  0, 100, AQry);

    InsertDtlRecord(nId, UpperCase('inv_nuser1'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser2'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser3'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser4'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser5'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser6'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser7'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser8'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser9'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('invnuser10'), 'Numeric'  ,  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('cartonsplt'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('piecescart'), 'Numeric'  ,  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('countryorg'),'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('packslipno'),'Character',    15, 0,  15,  AQry);
    InsertDtlRecord(nId, UpperCase('DATE_REC'),'Date',    8, 0,  8,  AQry);
    InsertDtlRecord(nId, UpperCase('expiry_dt'),'Date'     ,   8, 0,  8, AQry);

    CheckAssignRejectLabelRecords(nId, AQry);

  finally
    AQry.Free;
  end;
end;


procedure TFrmLabels.AssignPurchasedLabelRecords;
var
  nId :Real;
  AQry:TFDQuery;
begin
  nId := TblLabels.FieldByName('ID').asFloat;
  AQry := TFDQuery.Create(NIL);
  with AQry do
  try
    ConnectionName := 'IQFD';
    InsertDtlRecord(nId, UpperCase('cserial'),    'Character',   9,  0, 9,   AQry);
    InsertDtlRecord(nId, UpperCase('serial'),     'Numeric'  ,  15,  0, 15,  AQry);
    InsertDtlRecord(nId, UpperCase('itemno'),     'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('descrip'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('quantity'),   'Numeric'  ,   8,  0,  8,  AQry);
    InsertDtlRecord(nId, UpperCase('vendor'),     'Character',  30,  0, 30,  AQry);
    InsertDtlRecord(nId, UpperCase('vendor2'),    'Character',  31,  0, 31,  AQry);
    InsertDtlRecord(nId, UpperCase('ven_code'),   'Character',  10,  0, 10,  AQry);
    InsertDtlRecord(nId, UpperCase('ven_code2'),  'Character',  11,  0, 11,  AQry);
    InsertDtlRecord(nId, UpperCase('lbl_date'),   'Date'     ,   8,  0,  8,  AQry);
    InsertDtlRecord(nId, UpperCase('location'),   'Character',  30,  0, 30,  AQry);
    InsertDtlRecord(nId, UpperCase('class'),      'Character',   2,  0,  2,  AQry);
    InsertDtlRecord(nId, UpperCase('unit'),       'Character',   4,  0,  4,  AQry);
    InsertDtlRecord(nId, UpperCase('quantity2'),  'Character',   9,  0,  9,  AQry);
    InsertDtlRecord(nId, UpperCase('lotno'),      'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('lotno2'),     'Character',  26,  0, 26,  AQry);
    InsertDtlRecord(nId, UpperCase('location2'),  'Character',  31,  0, 31,  AQry);
    InsertDtlRecord(nId, UpperCase('itemno2'),    'Character',  26,  0, 26,  AQry);
    InsertDtlRecord(nId, UpperCase('pono'),       'Character',  20,  0, 20,  AQry);
    InsertDtlRecord(nId, UpperCase('pono2'),      'Character',  21,  0, 21,  AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item1'), 'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item2'), 'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item3'), 'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item4'), 'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('bcls_item5'), 'Character',  25,  0, 25,  AQry);
    InsertDtlRecord(nId, UpperCase('bldesc1'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('bldesc2'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('bldesc3'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('bldesc4'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('bldesc5'),    'Character',  35,  0, 35,  AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt1'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt2'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt3'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt4'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('bld_prcnt5'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('descrip2'),   'Character',  100, 0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('serial2'),    'Character',  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('inv_cuser1'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser2'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser3'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser4'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser5'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser6'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser7'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser8'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('inv_cuser9'), 'Character', 100,  0, 100, AQry);
    InsertDtlRecord(nId, UpperCase('invcuser10'), 'Character', 100,  0, 100, AQry);


    InsertDtlRecord(nId, UpperCase('inv_nuser1'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser2'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser3'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser4'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser5'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser6'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser7'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser8'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('inv_nuser9'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('invnuser10'), 'Numeric'  ,  16,  6, 16,  AQry);

    InsertDtlRecord(nId, UpperCase('cartonsplt'), 'Numeric'  ,  16,  6, 16,  AQry);
    InsertDtlRecord(nId, UpperCase('piecescart'), 'Numeric'  ,  16,  6, 16,  AQry);


    InsertDtlRecord(nId, UpperCase('receiptno'), 'Character',   50,  0, 50, AQry);
    InsertDtlRecord(nId, UpperCase('rev'),       'Character',   15,  0, 15, AQry);

    InsertDtlRecord(nId, UpperCase('division'),  'Character',   25,  0, 25, AQry);

    InsertDtlRecord(nId, UpperCase('supp_code'), 'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('upc_code'),  'Character',    20, 0,  20,  AQry);
    InsertDtlRecord(nId, UpperCase('upc_code2'), 'Character',    20, 0,  20,  AQry);
    InsertDtlRecord(nId, UpperCase('lot_date'), 'Date'     ,  8, 0,  8, AQry);
    InsertDtlRecord(nId, UpperCase('countryorg'),'Character',    30, 0,  30,  AQry);
    InsertDtlRecord(nId, UpperCase('packslipno'),'Character',    15, 0,  15,  AQry);
    InsertDtlRecord(nId, UpperCase('DATE_REC'),'Date',    8, 0,  8,  AQry);
    InsertDtlRecord(nId, UpperCase('expiry_dt'), 'Date'     ,   8, 0,  8, AQry);

    InsertDtlRecord(nId, UpperCase('ord_uom'),   'Character',  10, 0, 10, AQry);
    InsertDtlRecord(nId, UpperCase('ord_seq'),   'Numeric',    15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser1'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser2'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser3'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser4'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser5'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('ord_cuser6'),'Character',  60, 0, 60, AQry);
    InsertDtlRecord(nId, UpperCase('shipeplant'),'Numeric',    15, 0, 15, AQry);

    CheckAssignRejectLabelRecords(nId, AQry);

  finally
    AQry.Free;
  end;
  TblLabelsDtl.Refresh;
end;


procedure TFrmLabels.CheckAssignRejectLabelRecords(AID: Real; AQry: TFDQuery);
begin
  if CompareText(TblLabelsLABEL_KIND.AsString,'NONSERIAL') = 0 then
    begin
    // Reject Code and comment
    InsertDtlRecord(AID, UpperCase('rej_code'),   'Character', 5, 0, 5, AQry);
    InsertDtlRecord(AID, UpperCase('rej_desc'),   'Character', 20, 0, 20, AQry);
    InsertDtlRecord(AID, UpperCase('rej_commnt'), 'Character', 250, 0, 250, AQry);

    //Mfg #
    InsertDtlRecord(AID, UpperCase('mfgno'),      'Character', 25, 0, 25, AQry);

    //Lot #
    InsertDtlRecord(AID, UpperCase('fg_lotno'),   'Character', 25, 0, 25, AQry);

    //User ID
    InsertDtlRecord(AID, UpperCase('user_id'),    'Character', 30, 0, 30, AQry);
    end;
end;

procedure TFrmLabels.AssignRejectLabelRecords;
var
  nId :Real;
  AQry:TFDQuery;
begin
  nId := TblLabels.FieldByName('ID').asFloat;
  AQry := TFDQuery.Create(NIL);
  with AQry do
  try
    ConnectionName := 'IQFD';

    //Label Date
    InsertDtlRecord(nId, UpperCase('label_date'), 'Date'     ,  8, 0,  8, AQry);

    // Inventory Item information
    InsertDtlRecord(nId, UpperCase('part_no'),    'Character', 25, 0, 25, AQry);
    InsertDtlRecord(nId, UpperCase('part_desc'),  'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('material'),   'Character', 35, 0, 35, AQry);
    InsertDtlRecord(nId, UpperCase('rev'),        'Character', 15, 0, 15, AQry);
    InsertDtlRecord(nId, UpperCase('class'),      'Character',   2,  0,  2,  AQry);

    // Reject Quantity
    InsertDtlRecord(nId, UpperCase('quantity'),   'Numeric'  ,  8, 0,  8, AQry);

    // Reject Code and comment
    InsertDtlRecord(nId, UpperCase('rej_code'),   'Character', 5, 0, 5, AQry);
    InsertDtlRecord(nId, UpperCase('rej_desc'),   'Character', 20, 0, 20, AQry);
    InsertDtlRecord(nId, UpperCase('rej_commnt'), 'Character', 250, 0, 250, AQry);

    //Mfg #
    InsertDtlRecord(nId, UpperCase('moldno'),     'Character', 25, 0, 25, AQry);

    //Lot #
    InsertDtlRecord(nId, UpperCase('fg_lotno'),   'Character', 25, 0, 25, AQry);

    //User ID
    InsertDtlRecord(nId, UpperCase('user_id'),    'Character', 30, 0, 30, AQry);

  finally
    AQry.Free;
  end;
  TblLabelsDtl.Refresh;
end;

procedure TFrmLabels.SrcLabelsDtlDataChange(Sender: TObject;
  Field: TField);
begin
  TblLabelsDtl.FieldByName('ACT_WIDTH').ReadOnly :=
      (TblLabelsDtl.FieldByName('FIELD_TYPE').asString = 'Numeric') or
      (TblLabelsDtl.FieldByName('FIELD_TYPE').asString = 'Date');
end;

procedure TFrmLabels.BtnCreateClick(Sender: TObject);
begin
  CreateDBFFile;
  // IQMS.WebVcl.ResourceStrings.cTXT0000146 = 'DBF file created'
  IQMS.Common.Dialogs.IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000146);
end;

procedure TFrmLabels.TblLabelsDtlBeforePost(DataSet: TDataSet);
begin
  if TblLabelsDtl.FieldByName('act_width').asInteger >
     TblLabelsDtl.FieldByName('width').asInteger then
     // 'The Actual Width cannot be greater then the default width.'
     raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000142);

  if TblLabelsDtl.FieldByName('act_width').asInteger = 0 then
     raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000143 {'The Actual Width cannot be zero.'} );
end;

procedure TFrmLabels.TblLabelsTemplateChange(Sender: TField);
begin
  if not (TblLabelsTemplate.AsString > '') then
    TblLabelsLABEL_TEMPLATE_ID.Clear;
end;

procedure TFrmLabels.About1Click(Sender: TObject);
begin
//  IQAbout1.Execute;
end;

//procedure TFrmLabels.NavHeaderBeforeAction(Sender: TObject;
//  Button: TNavigateBtn);
//begin
  // IQMS.WebVcl.ResourceStrings.cTXT0000458 = 'Delete label record?';

//end;

procedure TFrmLabels.New1Click(Sender: TObject);
begin
  TblLabels.Insert;
end;

procedure TFrmLabels.PkLabelTemplatesIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrABORT;
  ResultValue:= 0;
  IQMS.Common.LabelEditor.EditLabel(0, false);
end;

procedure TFrmLabels.Delete1Click(Sender: TObject);
begin
  TblLabels.delete;
end;

procedure TFrmLabels.sbtnSelectDirClick(Sender: TObject);
var
  cDir:String;
begin
  with TblParams do
  begin
    CheckBrowseMode;
    cDir := FieldByName('LM_DIRECTORY').asString;
    if DirBrowse(cDir) then
    begin
      Edit;
      FieldByName('LM_DIRECTORY').asString := cDir;
      Post;
    end;
  end;
end;

procedure TFrmLabels.BtnResetClick(Sender: TObject);
begin
  TblLabelsDtl.CheckBrowseMode;
  ExecuteCommandFmt('update LM_LABELS_DETAIL set act_width = width where lm_labels_id = %f',
    [TblLabels.FieldByName('ID').asFloat]);
  TblLabelsDtl.Refresh;
  // IQMS.WebVcl.ResourceStrings.cTXT0000144 = 'Defaults have been reset.'
  IQMS.Common.Dialogs.IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000144);
end;

procedure TFrmLabels.SBSearchClick(Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select l.id as id, '+
                      ' l.label_file as label_file, '+
                      ' l.label_menu_name as label_menu, '+
                      ' l.label_type as label_type, '+
                      ' a.custno as custno, '+
                      ' a.company as customer, '+
                      ' l.eplant_id as eplant_id '+
                      ' from lm_labels l, '+
                      ' arcusto a '+
                      ' where l.arcusto_id = a.id(+)');
  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);

    TblLabels.Locate('ID', ID, []);
  finally
    Qry.Free;
  end;
end;

procedure TFrmLabels.SelectCustomer1Click(Sender: TObject);
begin
  {Shows the picklist that allows users to create a new contact for the
  selected customer.}
  TblLabels.CheckBrowseMode;
//  IQPickAndReplace( TblLabelsARCUSTO_ID, PkArcusto, 'ID' );  {In IQLib}
  TblLabels.Refresh;
end;

procedure TFrmLabels.wwNetNamesDropDown(Sender: TObject);
begin
  if Sender is TUniComboBox then with TUniComboBox(Sender) do
    if Items.Count = 0 then
      try
        LoadWNetComputersNames( Items, NIL );  {IQMisc}
      except on E: Exception do
        IQMS.Common.Dialogs.IQError(E.Message);
      end;
end;

procedure TFrmLabels.AssignEPlantFilter(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmLabels.sbtnEPlantClick(Sender: TObject);
begin
  DoChangePlantID( TblLabels ); { SetPlant.pas}
end;

procedure TFrmLabels.wwCustomerGridCloseUp(Sender: TObject);
begin
  QryArcusto.Filter := '';
end;

procedure TFrmLabels.wwCustomerGridDropDown(Sender: TObject);
begin
  QryArcusto.Filter := 'PK_HIDE = NULL or PK_HIDE = ''N''';
  QryArcusto.Locate('ID', TblLabelsARCUSTO_ID.asFloat, []);
end;

procedure TFrmLabels.Trace1Click(Sender: TObject);
begin
  DoShowTrace( 'LM_LABELS', TblLabelsID.asFloat );   {TR_Base.pas}
end;

procedure TFrmLabels.wwDBComboBoxLabelTemplateDropDown(Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select l.id as id, '+
                      ' l.label_file as label_file, '+
                      ' l.label_menu_name as label_menu, '+
                      ' l.label_type as label_type, '+
                      ' a.custno as custno, '+
                      ' a.company as customer, '+
                      ' l.eplant_id as eplant_id '+
                      ' from lm_labels l, '+
                      ' arcusto a '+
                      ' where l.arcusto_id = a.id(+)');
  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);

    if not (TblLabels.State in [dsEdit, dsInsert]) then
      TblLabels.Edit;
      TblLabelsLABEL_TEMPLATE_ID.AsFloat := ID;  {In IQLib}
  finally
    Qry.Free;
  end;
end;

procedure TFrmLabels.wwDBComboBoxRTMReportNameDropDown(Sender: TObject);
var
  AFilePath: string;
begin
  with UniFileUpload1 do
  begin
    if Execute then
    begin
      CopyFile(pwidechar(CacheFile),pwidechar(IQGetReportsPath+ ExtractFileName( FileName )),false);
//      AFilePath:= UpperCase( StrTran(ExtractFileDir( FileName ) + '\', '\\', '\'));
//      IQAssert( CompareText( AFilePath, UpperCase( IQGetReportsPath )) = 0,
//                // 'Cannot proceed.  Please copy this report into the EnterpriseIQ subdirectory, %s.'
//                Format( IQMS.WebVcl.ResourceStrings.cTXT0000145, [ IQGetReportsPath ]));
      TblLabels.Edit;
      TblLabelsREPORT_NAME.asString:= ExtractFileName( FileName );
      TblLabelsLABEL_FILE.Clear;
      TblLabelsREMOTE_SERVER.Clear;
      TblLabelsLABEL_TEMPLATE_ID.Clear;
    end;
  end;
end;

procedure TFrmLabels.SrcLabelsDataChange(Sender: TObject; Field: TField);
begin
  btnReset.Enabled := TblLabelsREPORT_NAME.asString = '';
  btnCreate.Enabled:= TblLabelsREPORT_NAME.asString = '';
end;

procedure TFrmLabels.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

function TFrmLabels.GetDBFDirectory: string;
begin
  Result := SelectValueAsString('select LM_DIRECTORY from PARAMS');
end;

procedure TFrmLabels.GridDetailDBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (UpperCase(Column.Field.FieldName) = 'ACT_WIDTH') then
    Attribs.Color := clWindow;
end;

procedure TFrmLabels.GridHeaderMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
   popmHeader.Popup(x,y,sender);
end;

procedure TFrmLabels.GridHeaderUniDBLookupComboBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbright then
    PCustomer.Popup(x,y,sender);
end;

function TFrmLabels.GetDBFConnection: TFDConnection;
begin
  if not Assigned(FDBFConnection) then
    FDBFConnection := TFDConnection.Create(Self);
  FDBFConnection.Params.Clear;
  // See the following for documentation on how to configure the connection:
  // http://docwiki.embarcadero.com/RADStudio/Berlin/en/Connect_to_Advantage_Database_Server_(FireDAC)
  FDBFConnection.Params.Add('DriverID=ADS');
  FDBFConnection.Params.Add(Format('Database=%s',[IncludeTrailingPathDelimiter(GetDBFDirectory)]));
  FDBFConnection.Params.Add('ServerTypes=Local');
  FDBFConnection.Params.Add('TableType=CDX'); // CDX, VFP
  Result := FDBFConnection;
end;

procedure TFrmLabels.CreateDBFFile( AConfirmOverwrite: Boolean);
var
  ALabelFileName, AFileName: string;
  ATable: TFDTable;
begin
  TblLabels.CheckBrowseMode;
  TblLabelsDtl.CheckBrowseMode;
  TblLabelsDtl.Refresh;

  // Create the DBF
  TLMCreateDBF.CreateEmptyDbfFile(TblLabelsID.AsLargeInt, AConfirmOverwrite);

{  ALabelFileName:= TblLabels.FieldByName('LABEL_FILE').asString;
  AFileName := IncludeTrailingPathDelimiter(GetDBFDirectory) + ALabelFileName;

  if FileExists(AFileName) then
  begin
    if AConfirmOverwrite and
      // IQMS.WebVcl.ResourceStrings.cTXT0000141 =
      // 'Do you wish to overwrite the existing template?'
      not IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000141) then
       Exit;
     DeleteFile(AFileName);
  end;
}
  if StrInList( TblLabels.FieldByName('LABEL_TYPE').asString, ['MANUFACTURED', 'MIXED']) then
     AssignManufacturedLabelRecords
  else if TblLabels.FieldByName('LABEL_TYPE').asString = 'PURCHASED' then
     AssignPurchasedLabelRecords
  else
     AssignLoadLabelRecords;
(*
  TblLabelsDtl.First;
  // Notes:
  // This page discusses "create table" syntax:
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/supported_statements/create_table.htm
  //
  // See the following for supported data types:
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/supported_statements/supported_data_types_in_the_advantage_sql_engine.htm
  // https://devzone.advantagedatabase.com/dz/webhelp/Advantage9.0/server1/adt_field_types_and_specifications.htm

  with TFDCommand.Create(NIL) do
  try
    Connection := GetDBFConnection;
    Connection.Connected := True;
    CommandText.Add( IQFormat('CREATE TABLE %s ', [ FileNameNoExt(ALabelFileName) ]));
    CommandText.Add( '(' );
    while not TblLabelsDtl.eof do
    begin
      if (TblLabelsDtl.FieldByName('FIELD_TYPE').asString = 'Character') then
        CommandText.Add(Format('%s Char(%d),', [TblLabelsDtl.FieldByName('FIELD_NAME').asString,
                                      //TblLabelsDtl.FieldByName('FIELD_TYPE').asString,
                                      TblLabelsDtl.FieldByName('WIDTH').asInteger]))
      else if (TblLabelsDtl.FieldByName('FIELD_TYPE').asString = 'Numeric') then
        CommandText.Add(Format('%s Numeric(%d, %d),', [TblLabelsDtl.FieldByName('FIELD_NAME').asString,
                                          //TblLabelsDtl.FieldByName('FIELD_TYPE').asString,
                                          TblLabelsDtl.FieldByName('WIDTH').asInteger,
                                          TblLabelsDtl.FieldByName('DEC').asInteger]))
      else if (TblLabelsDtl.FieldByName('FIELD_TYPE').asString = 'Date') then
        CommandText.Add(Format('%s Date,', [TblLabelsDtl.FieldByName('FIELD_NAME').asString]))
                                      //TblLabelsDtl.FieldByName('FIELD_TYPE').asString]));
      else
        CommandText.Add(Format('%s %s,', [TblLabelsDtl.FieldByName('FIELD_NAME').asString,
                                      TblLabelsDtl.FieldByName('FIELD_TYPE').asString]));

      TblLabelsDtl.Next;
    end;
    CommandText[CommandText.Count - 1] := Copy(CommandText[CommandText.Count - 1], 1, Length(CommandText[CommandText.Count - 1]) - 1);
    CommandText.Add( ')' );

    Execute;
  finally
    Free;
  end;


  TblLabelsDtl.First;
  with TFDTable.Create(nil) do
  try
    Connection := GetDBFConnection;
    Connection.Connected := True;
    TableName    := FileNameNoExt(ALabelFileName);
    Open;
    Insert;
    while not TblLabelsDtl.eof do
    begin
      if CompareText(TblLabelsDtl.FieldByName('Field_Type').asString, 'Character') = 0 then
        FieldByName(TblLabelsDtl.FieldByName('Field_name').asString).asString :=
          Repl('X', TblLabelsDtl.FieldByName('Act_width').asInteger)
      else if CompareText(TblLabelsDtl.FieldByName('Field_Type').asString, 'Numeric') = 0 then
      begin
        if TblLabelsDtl.FieldByName('Dec').asInteger = 0 then
          FieldByName(TblLabelsDtl.FieldByName('Field_name').asString).asString :=
            Repl('9', TblLabelsDtl.FieldByName('Act_width').asInteger - 1)
        else
          FieldByName(TblLabelsDtl.FieldByName('Field_name').asString).asString :=
            Repl('9', TblLabelsDtl.FieldByName('Act_width').asInteger -
                      TblLabelsDtl.FieldByName('Dec').asInteger - 2) +
                      FormatSettings.DecimalSeparator +
            Repl('9', TblLabelsDtl.FieldByName('Dec').asInteger);
      end;

      TblLabelsDtl.Next;
    end;
    Post;
  finally
    Free;
  end;
*)
end;

procedure TFrmLabels.CreateDBFFileforEveryLMLabel1Click(Sender: TObject);
var
  hMsg : TPanelMesg;
begin
  // IQMS.WebVcl.ResourceStrings.cTXT0000316 =
  // 'About to apply "Create DBF File" to every label -
  // are you sure you wish to continue?'
  if not IQConfirmYN( IQMS.WebVcl.ResourceStrings.cTXT0000316) then
     EXIT;

  TblLabels.CheckBrowseMode;
  TblLabels.First;

  hMsg:= hPleaseWait('');
  try
    while not TblLabels.Eof do
    begin
      if TblLabelsREPORT_NAME.asString = '' then
         CreateDBFFile( FALSE );
      TblLabels.Next;
      Application.ProcessMessages;
    end;
  finally
    hMsg.Free;
  end;

  TblLabels.First;
  // IQMS.WebVcl.ResourceStrings.cTXT0000317 =
  // 'DBF files created successfully'
  IQMS.Common.Dialogs.IQInformation(IQMS.WebVcl.ResourceStrings.cTXT0000317);
end;

end.

