unit M_Viewer_Setup;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  DBCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DB,
  Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
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
  uniLabel,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmM_ViewerSetup = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    wwDBGridHeader: TIQUniGridControl;
    NavMain: TUniDBNavigator;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    Panel6: TUniPanel;
    wwDBGridDetail: TIQUniGridControl;
    Panel8: TUniPanel;
    wwDBComboBoxFilter_By: TUniDBComboBox;
    Label1: TUniLabel;
    Panel5: TUniPanel;
    NavDetail: TUniDBNavigator;
    pnlPgCtrlFilter: TUniPanel;
    pgctrlFilter: TUniPageControl;
    TabOverall: TUniTabSheet;
    lblMFGType: TUniLabel;
    lookupMfgTypeOverAll: TUniDBLookupComboBox;
    TabEPlant: TUniTabSheet;
    lblEPlant: TUniLabel;
    lblMFTTypeEplant: TUniLabel;
    lookupEPlant: TUniDBLookupComboBox;
    lookupMfgTypeEPlant: TUniDBLookupComboBox;
    TabMfgCell: TUniTabSheet;
    lblMfgCell: TUniLabel;
    lookupMfgCell: TUniDBLookupComboBox;
    SrcM_View: TDataSource;
    QryM_View: TFDQuery;
    QryM_ViewID: TBCDField;
    QryM_ViewNAME: TStringField;
    QryM_ViewDESCRIP: TStringField;
    UpdateSQL_M_View: TFDUpdateSQL;
    SrcM_View_Detail: TDataSource;
    QryM_View_Detail: TFDQuery;
    QryM_View_DetailID: TBCDField;
    QryM_View_DetailM_VIEW_ID: TBCDField;
    QryM_View_DetailSEQ: TBCDField;
    QryM_View_DetailDESCRIP: TStringField;
    QryM_View_DetailEPLANT_ID: TBCDField;
    QryM_View_DetailMFGTYPE: TStringField;
    QryM_View_DetailMFGCELL_ID: TBCDField;
    UpdateSQL_M_View_Detail: TFDUpdateSQL;
    QryMfgType: TFDQuery;
    QryMfgTypeMFGTYPE: TStringField;
    QryMfgTypeDESCRIP: TStringField;
    QryMfgCell: TFDQuery;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellDESCRIP: TStringField;
    QryMfgCellMFGTYPE: TStringField;
    QryMfgCellEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    QryEPlantNAME: TStringField;
    QryEPlantID: TBCDField;
    QryM_View_DetailFILTER_BY: TStringField;
    QryMfgCellID: TBCDField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlOverallOption: TUniPanel;
    PnlEPlantOption: TUniPanel;
    PnlMfgCellOption: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryM_ViewBeforePost(DataSet: TDataSet);
    procedure QryM_View_DetailNewRecord(DataSet: TDataSet);
    procedure QryM_View_DetailBeforePost(DataSet: TDataSet);
    procedure wwDBComboBoxFilter_ByCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure SrcM_View_DetailDataChange(Sender: TObject; Field: TField);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PostParentsBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryM_ViewNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls,
  IQMS.Common.Miscellaneous;

class procedure TFrmM_ViewerSetup.DoShowModal;
Var
  LFrmM_ViewerSetup : TFrmM_ViewerSetup;
begin
  LFrmM_ViewerSetup := TFrmM_ViewerSetup.Create(UniGUIApplication.UniApplication);
  LFrmM_ViewerSetup.ShowModal;
end;

procedure TFrmM_ViewerSetup.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGridHeader, wwDBGridDetail ]);
end;

procedure TFrmM_ViewerSetup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridHeader, wwDBGridDetail ]);
end;

procedure TFrmM_ViewerSetup.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender,Button);
end;

procedure TFrmM_ViewerSetup.QryM_ViewBeforePost(DataSet: TDataSet);
begin
  if QryM_ViewID.AsLargeInt = 0 then
     QryM_ViewID.AsLargeInt:= GetNextID('m_view');
end;

procedure TFrmM_ViewerSetup.QryM_ViewNewRecord(DataSet: TDataSet);
begin
  QryM_ViewID.AsLargeInt := GetNextID('m_view');
end;

procedure TFrmM_ViewerSetup.QryM_View_DetailNewRecord(DataSet: TDataSet);
begin
  QryM_View_DetailID.AsLargeInt := GetNextID('m_view_detail');

  QryM_View_DetailM_VIEW_ID.asFloat:= QryM_ViewID.asFloat;

  QryM_View_DetailSEQ.asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from m_view_detail where m_view_id = %f', [ QryM_ViewID.asFloat ]);

  QryM_View_DetailDESCRIP.asString:= Format('Monitor # %.0f', [ QryM_View_DetailSEQ.asFloat ]);

  QryM_View_DetailFILTER_BY.asString     := 'O';      {Overall view}
end;

procedure TFrmM_ViewerSetup.QryM_View_DetailBeforePost(DataSet: TDataSet);
begin
  {validate}

     {overall}
  if QryM_View_DetailFILTER_BY.AsString = 'O' then
     begin
       IQAssert( QryM_View_DetailMFGTYPE.asString > '', 'MfgType must be specified.' );
       QryM_View_DetailEPLANT_ID.Clear;
       QryM_View_DetailMFGCELL_ID.Clear;
     end

     {eplant}
  else if QryM_View_DetailFILTER_BY.AsString = 'E' then
     begin
       IQAssert( QryM_View_DetailEPLANT_ID.asFloat > 0, 'EPlant must be specified.' );
       QryM_View_DetailMFGCELL_ID.Clear;
     end

     {cell}
  else if QryM_View_DetailFILTER_BY.AsString = 'C' then
     begin
       IQAssert( QryM_View_DetailMFGCELL_ID.asFloat > 0, 'MfgCell must be specified.' );
       QryM_View_DetailMFGTYPE.asString  := QryMfgCellMFGTYPE.AsString;
       QryM_View_DetailEPLANT_ID.asString:= QryMfgCellEPLANT_ID.asString;
     end

  else
    raise Exception.Create( 'Encountered undefined Filter By value.' );

  if QryM_View_DetailID.asFloat = 0 then
     QryM_View_DetailID.asFloat:= GetNextID('m_view_detail');
end;

procedure TFrmM_ViewerSetup.wwDBComboBoxFilter_ByCloseUp(Sender: TUniDBComboBox; Select: Boolean);
begin
  if wwDBComboBoxFilter_By.ItemIndex >= 0 then
     pgctrlFilter.ActivePageIndex:= wwDBComboBoxFilter_By.ItemIndex
end;

procedure TFrmM_ViewerSetup.SrcM_View_DetailDataChange(Sender: TObject;   Field: TField);
begin
  if Assigned( QryM_View_Detail ) then // and (QryM_View_Detail.State = dsBrowse) then
  begin
    if QryM_View_DetailFILTER_BY.AsString = 'O' then
       pgctrlFilter.ActivePageIndex:= 0

    else if QryM_View_DetailFILTER_BY.AsString = 'E' then
       pgctrlFilter.ActivePageIndex:= 1

    else if QryM_View_DetailFILTER_BY.AsString = 'C' then
       pgctrlFilter.ActivePageIndex:= 2

    else
       pgctrlFilter.ActivePageIndex:= -1
  end;
end;

procedure TFrmM_ViewerSetup.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE,self);
  IQMS.Common.Controls.AdjustPageControlToParent(pgctrlFilter);
end;

procedure TFrmM_ViewerSetup.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmM_ViewerSetup.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmM_ViewerSetup.PostParentsBeforeEdit(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet );
end;

end.


