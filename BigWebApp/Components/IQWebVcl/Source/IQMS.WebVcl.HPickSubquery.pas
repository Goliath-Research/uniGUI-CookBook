unit IQMS.WebVcl.HPickSubquery;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  IQMS.WebVcl.About,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmHPickSubquery = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    IQSearch1: TIQUniGridControl;
    wwDBGrid1: TIQUniGridControl;
    navMain: TUniDBNavigator;
    navDetail: TUniDBNavigator;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnClear: TUniBitBtn;
    SrcHeader: TDataSource;
    SrcDetail: TDataSource;
    QryHeader: TFDQuery;
    QryDetail: TFDQuery;
    QryHeaderID: TBCDField;
    QryHeaderMODULE_NAME: TStringField;
    QryHeaderDESCRIP: TStringField;
    QryDetailID: TBCDField;
    QryDetailHPICK_SUBQUERY_HDR_ID: TBCDField;
    QryDetailVALUE: TBCDField;
    QryDetailBINARY_OPERATOR: TStringField;
    QryDetailItemNo: TStringField;
    QryDetailDescrip: TStringField;
    QryDetailRev: TStringField;
    QryDetailClass: TStringField;
    QryDetailDescrip2: TStringField;
    wwDBComboDlgItemNo: TUniEdit;
    wwDBComboBoxOperator: TUniDBComboBox;
    PkArinvt: TIQWebHPick;
    StringField1: TStringField;
    PkArinvtCLASS: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    PkArinvtDESCRIP2: TStringField;
    StringField4: TStringField;
    PkArinvtCUSTNO: TStringField;
    PkArinvtCOMPANY: TStringField;
    FloatField1: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    MainMenu1: TUniMainMenu;
    IQAbout1: TIQWebAbout;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    StatusBar1: TUniStatusBar;
    QryDetailEPlant_ID: TIntegerField;
    N1: TUniMenuItem;
    ExcludeSameItemsInOtherEPlants1: TUniMenuItem;
    PnlToolbarFilters: TUniPanel;
    PnlToolbarFiltersCaption: TUniPanel;
    lblFilterCaptionLabel: TUniLabel;
    PnlToolbarFiltersInner: TUniPanel;
    PnlToolbarComponents: TUniPanel;
    PnlToolbarComponentsCaption: TUniPanel;
    lblCaptionComponentsLabel: TUniLabel;
    PnlToolbarComponentsInner: TUniPanel;
    procedure btnClearClick(Sender: TObject);
    procedure QryHeaderNewRecord(DataSet: TDataSet);
    procedure QryHeaderBeforePost(DataSet: TDataSet);
    procedure QryDetailNewRecord(DataSet: TDataSet);
    procedure wwDBComboDlgItemNoCustomDlg(Sender: TObject);
    procedure QryDetailBeforePost(DataSet: TDataSet);
    procedure QryDetailCalcFields(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryHeaderBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure PostParentBeforeEdit(DataSet: TDataSet);
    procedure ExcludeSameItemsInOtherEPlants1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FModuleName: string; 
    FResultValue: Integer;
    procedure AddToDetail(AID: Real);
    procedure SetResultValue(const Value: Integer);
  public
    { Public declarations }
    constructor Create( AModuleName :string );
    property ResultValue: Integer read FResultValue write SetResultValue;  // -1 - exit, 0-clear 1234-id of the filter (hpick_subquery_hdr_id)
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.ResourceStrings;

{ TFrmHPickSubquery }

constructor TFrmHPickSubquery.Create(AModuleName: string);
var
  B: Boolean;
begin
  FModuleName:= AModuleName;
  ResultValue:= -1;
  
  inherited Create(uniGUIApplication.UniApplication);
  IQSetTablesActive(TRUE, self);
  StatusBar1.Panels[0].Text:= Format('Module: %s', [ FModuleName ]);
  if IQRegBooleanScalarRead( nil,  'AdvancedSearch_ExcludeOtherEPlants', B, TRUE ) then
     ExcludeSameItemsInOtherEPlants1.Checked:= B;
end;

procedure TFrmHPickSubquery.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
//  IQMS.Common.Controls.AutoSizeNavBar(navMain);
//  IQMS.Common.Controls.AutoSizeNavBar(navDetail);
end;

procedure TFrmHPickSubquery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
  IQRegBooleanScalarWrite( nil,  'AdvancedSearch_ExcludeOtherEPlants', ExcludeSameItemsInOtherEPlants1.Checked, TRUE );
end;

procedure TFrmHPickSubquery.ExcludeSameItemsInOtherEPlants1Click(
  Sender: TObject);
begin
  ExcludeSameItemsInOtherEPlants1.Checked:= not ExcludeSameItemsInOtherEPlants1.Checked;
end;

procedure TFrmHPickSubquery.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmHPickSubquery.PostParentBeforeEdit(DataSet: TDataSet);
begin
  QryHeader.CheckBrowseMode;
end;

procedure TFrmHPickSubquery.QryDetailBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'hpick_subquery_dtl');
end;

procedure TFrmHPickSubquery.QryDetailNewRecord(DataSet: TDataSet);
begin
  QryDetailID.asBCD:= 0;
  QryDetailHPICK_SUBQUERY_HDR_ID.asBCD:= QryHeaderID.asBCD;
  QryDetailBINARY_OPERATOR.asString:= 'OR';
end;

procedure TFrmHPickSubquery.QryHeaderBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'module_name', FModuleName);
end;

procedure TFrmHPickSubquery.QryHeaderBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'hpick_subquery_hdr');
end;

procedure TFrmHPickSubquery.QryHeaderNewRecord(DataSet: TDataSet);
begin
  QryHeaderMODULE_NAME.asString:= FModuleName;
end;

procedure TFrmHPickSubquery.SetResultValue(const Value: Integer);
begin
  FResultValue:= Value;
end;

procedure TFrmHPickSubquery.btnCancelClick(Sender: TObject);
begin
  ResultValue:= -1;
end;

procedure TFrmHPickSubquery.btnClearClick(Sender: TObject);
begin
  ResultValue:= 0;
  ModalResult:= mrOK;
end;

procedure TFrmHPickSubquery.btnOKClick(Sender: TObject);
begin
  QryHeader.CheckBrowseMode;
  QryDetail.CheckBrowseMode;
  IQAssert( not (QryDetail.Eof and QryDetail.Bof), IQMS.WebVcl.ResourceStrings.cTXT0000491 ); // 'Filter settings are incomplete - unable to proceed.';

  ResultValue:= QryHeaderID.asInteger;
  ModalResult:= mrOK;
end;

procedure TFrmHPickSubquery.QryDetailCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if QryDetailVALUE.asBCD > 0 then
  begin
    A:= SelectValueArrayFmt('select itemno, rev, class, descrip, descrip2, eplant_id from arinvt where id = %.0f', [ QryDetailVALUE.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      QryDetailItemNo.asString  := A[ 0 ];
      QryDetailRev.asString     := A[ 1 ];
      QryDetailClass.asString   := A[ 2 ];
      QryDetailDescrip.asString := A[ 3 ];
      QryDetailDescrip2.asString:= A[ 4 ];
      if A[ 5 ] > 0  then
         QryDetailEPlant_ID.asFloat:= A[ 5 ]
    end;
  end;
end;

procedure TFrmHPickSubquery.wwDBComboDlgItemNoCustomDlg(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
       AddToDetail( GetValue('id'));
end;

procedure TFrmHPickSubquery.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmHPickSubquery.AddToDetail( AID: Real );
begin
  if SelectValueFmtAsInteger('select 1 from hpick_subquery_dtl    '+
                                   ' where hpick_subquery_hdr_id = %.0f '+
                                   '   and value = %.0f',               
                                   [ QryHeaderID.asFloat,
                                     AID ]) = 0 then
  begin                                   
    QryDetail.Edit;
    QryDetailVALUE.asFloat:= AID;
    QryDetail.Post;
  end;

  // if ExcludeSameItemsInOtherEPlants1.Checked then
  //    EXIT;
  // 
  // ExecuteCommandFmt('insert into hpick_subquery_dtl                                                                    '+
  //                         '     ( hpick_subquery_hdr_id, value, binary_operator )                                            '+
  //                         'select %.0f,                                                                                      '+
  //                         '       id,                                                                                        '+
  //                         '       ''OR''                                                                                     '+
  //                         '  from arinvt                                                                                     '+
  //                         ' where (class, itemno, rev) =                                                                     '+
  //                         '       (select class, itemno, rev from arinvt where id = %.0f)                                    '+
  //                         '   and not exists                                                                                 '+
  //                         '       (select 1 from hpick_subquery_dtl where hpick_subquery_hdr_id = %.0f and arinvt.id = value)',
  //                         [ QryHeaderID.asFloat,
  //                           AID,
  //                           QryHeaderID.asFloat ]);
  // QryDetail.Refresh;
end;


end.
