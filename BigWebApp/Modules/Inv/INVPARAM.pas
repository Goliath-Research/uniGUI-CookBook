unit InvParam;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  Mask,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
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
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl;

type
  TFrmInvParams = class(TUniForm)
    SrcParams: TDataSource;
    TblParams: TFDTable;
    PnlToolbar: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabSheet1: TUniTabSheet;
    sbtnTranCodes: TUniSpeedButton;
    PnlClient02: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient01: TUniPanel;
    Label20: TUniLabel;
    Label21: TUniLabel;
    dbePO_Safety: TUniDBEdit;
    dbePO_Scope: TUniDBEdit;
    Label1: TUniLabel;
    dbePO_Range: TUniDBEdit;
    PnlCheckboxes: TUniPanel;
    dbchkDeleteEmptyLoc: TUniDBCheckBox;
    DBCheckBox1: TUniDBCheckBox;
    Label2: TUniLabel;
    dbeFifo: TUniDBEdit;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtFIFO_THRESHOLD: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    DBCheckBox2: TUniDBCheckBox;
    TabSheet2: TUniTabSheet;
    Panel1: TUniPanel;
    Splitter2: TUniSplitter;
    Panel2: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    Panel3: TUniPanel;
    comboLocationUOM: TUniDBComboBox;
    wwDBComboBox1: TUniDBComboBox;
    wwDBComboBox2: TUniDBComboBox;
    Label6: TUniLabel;
    wwDBComboBoxWeightUOM: TUniDBComboBox;
    Label7: TUniLabel;
    wwDBComboBox3: TUniDBComboBox;
    DBCheckBox3: TUniDBCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnTranCodesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetShowOnlyLocationPackageUOM( AOnlyUOM: boolean );
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    property ShowOnlyLocationPackageUOM: boolean write SetShowOnlyLocationPackageUOM;
    property Arinvt_ID: Real write SetArinvt_ID;

  end;

procedure DoInvParams(AArinvt_ID: Real);


implementation

{$R *.DFM}

uses
  inv_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm;
  { TODO -oathite -cWebConvert : need to be convert in webIQ
  IQSecIns,  }
  { TODO -oathite -cWebConvert : Needs to conversion TranCode
  TranCode; }

procedure DoInvParams(AArinvt_ID: Real);
var
LFrmInvParams : TFrmInvParams;
begin
  LFrmInvParams := TFrmInvParams.Create(UniApplication);
  LFrmInvParams.Arinvt_ID := AArinvt_ID;
  LFrmInvParams.ShowModal;
end;

procedure TFrmInvParams.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, PnlLeft01 ]);
  { TODO -oathite -cWebConvert : Need to change the function defination in IQMS.Common.Controls.ResizeCheckBoxes
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCheckboxes);   }
  pcMain.ActivePageIndex:= 0;
end;

procedure TFrmInvParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, PnlLeft01 ]);
end;

procedure TFrmInvParams.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : procedure run from IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
end;

procedure TFrmInvParams.btnCancelClick(Sender: TObject);
begin
  if ((TblParams.State in [dsEdit, dsInsert]) or (QryArinvt.State = dsEdit)) and IQWarningYN(inv_rscstr.cTXT0000028 {'Save changes?'}) then
  begin
    TblParams.CheckBrowseMode;
    QryArinvt.CheckBrowseMode;
  end;
  Close;
end;

procedure TFrmInvParams.btnOKClick(Sender: TObject);
begin
  TblParams.CheckBrowseMode;
  QryArinvt.CheckBrowseMode;
  Close;
end;

procedure TFrmInvParams.sbtnTranCodesClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Dependant on TranCode
  DoTransCodes; {TranCode.pas}
end;

procedure TFrmInvParams.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmInvParams.SetShowOnlyLocationPackageUOM( AOnlyUOM: boolean );
begin
  TabSheet1.TabVisible:= not AOnlyUOM;
  pcMain.ActivePage:= TabSheet2;
end;

procedure TFrmInvParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;


procedure TFrmInvParams.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('arinvt_id').Value := FArinvt_ID;
end;

procedure TFrmInvParams.ApplyUpdates(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable(DataSet);
end;

end.
