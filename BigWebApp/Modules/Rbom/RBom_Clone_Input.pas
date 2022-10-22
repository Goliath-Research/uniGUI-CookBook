unit RBom_Clone_Input;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Mask,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.DBCtrls, //TNavigateBtn
  uniDBGrid, //TUniDBGridColumn
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmRBomCloneInput = class(TUniForm)
    Panel1: TUniPanel;
    SrcRBom_Clone: TDataSource;
    QryRBom_Clone: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    QryRBom_CloneMFGNO_DISP: TStringField;
    QryRBom_CloneITEMNO: TStringField;
    QryRBom_CloneDESCRIP: TStringField;
    QryRBom_CloneREV: TStringField;
    QryRBom_CloneCLASS: TStringField;
    QryRBom_CloneID: TBCDField;
    QryRBom_CloneSTANDARD_ID: TBCDField;
    QryRBom_CloneARINVT_ID: TBCDField;
    QryRBom_CloneNEW_MFGNO: TStringField;
    QryRBom_CloneNEW_ITEMNO: TStringField;
    QryRBom_CloneNEW_REV: TStringField;
    QryRBom_CloneNEW_DESCRIP: TStringField;
    Panel2: TUniPanel;
    wwDBComboDlgNewMfg: TUniEdit;
    wwDBComboDlgNewItemNo: TUniEdit;
    QryRBom_CloneKIND: TStringField;
    QryRBom_CloneNEW_MFG_DESCRIP: TStringField;
    sbtnPopulateAll: TUniSpeedButton;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    chkReuseOperations: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryRBom_CloneBeforeOpen(DataSet: TDataSet);
    procedure QryRBom_CloneUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdatesToTable(DataSet: TDataSet);
    procedure wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnOKClick(Sender: TObject);
    procedure SrcRBom_CloneDataChange(Sender: TObject; Field: TField);
    procedure wwDBComboDlgNewMfgCustomDlg(Sender: TObject);
    procedure wwDBComboDlgNewItemNoCustomDlg(Sender: TObject);
    procedure sbtnPopulateAllClick(Sender: TObject);
    procedure QryRBom_CloneBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FMain_Partno_ID: Real;
    procedure SetMain_Partno_ID(const Value: Real);
    function IsItemInfoChanged: Boolean;
    function IsMfgChanged: Boolean;
  public
    { Public declarations }
    property Main_Partno_ID : Real write SetMain_Partno_ID;
    class function DoShowModal( APartno_ID: Real; var AReuseOperations: Boolean ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataConst,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  RBom_QkPrompt,
  System.Variants;

{ TFrmRBomCloneInput }

class function TFrmRBomCloneInput.DoShowModal( APartno_ID: Real; var AReuseOperations: Boolean ): Boolean;
var
  frm: TFrmRBomCloneInput;
begin
  frm := TFrmRBomCloneInput.Create(uniGUIApplication.UniApplication);
  frm.Main_Partno_ID := APartno_ID;
  Result:= (frm.ShowModal = mrOK);
  if Result then
    AReuseOperations:= frm.chkReuseOperations.Checked;
end;

procedure TFrmRBomCloneInput.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1, chkReuseOperations ]);
end;

procedure TFrmRBomCloneInput.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmRBomCloneInput.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, chkReuseOperations ]);
end;

procedure TFrmRBomCloneInput.QryRBom_CloneBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('main_partno_id').Value := FMain_Partno_ID;
end;

procedure TFrmRBomCloneInput.QryRBom_CloneBeforePost(DataSet: TDataSet);
begin
  QryRBom_CloneNEW_MFGNO.asString := UpperCase(QryRBom_CloneNEW_MFGNO.asString);
  QryRBom_CloneNEW_ITEMNO.asString:= UpperCase(QryRBom_CloneNEW_ITEMNO.asString);
  QryRBom_CloneNEW_REV.asString   := UpperCase(QryRBom_CloneNEW_REV.asString);
end;

procedure TFrmRBomCloneInput.QryRBom_CloneUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  case ARequest of
    arUpdate:
       begin
         ExecuteCommandFmt('update rbom_clone               '+
                   '   set new_mfgno  = ''%s'',     '+
                   '       new_itemno = ''%s'',     '+
                   '       new_rev    = ''%s'',     '+
                   '       new_descrip = ''%s'',    '+
                   '       new_mfg_descrip = ''%s'' '+
                   ' where id = %f',
                   [ FixStr( ASender.FieldByName('new_mfgno').asString ), // IQMS.Common.StringUtils.pas - replace single ' with ''
                     FixStr( ASender.FieldByName('new_itemno').asString ),
                     FixStr( ASender.FieldByName('new_rev').asString ),
                     FixStr( ASender.FieldByName('new_descrip').asString ),
                     FixStr( ASender.FieldByName('new_mfg_descrip').asString ),
                     ASender.FieldByName('id').asFloat ]);
       end;
    arInsert: ;
    arDelete:;
  end;

  AAction := eaApplied;
end;

procedure TFrmRBomCloneInput.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
      begin
         RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
         ABORT;
      end;
  end;
end;

procedure TFrmRBomCloneInput.ApplyUpdatesToTable(DataSet: TDataSet);
begin
  try
    (FDManager.FindConnection(cnstFDConnectionName) as TFDConnection).ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
  RefreshDataSetByID( DataSet );
end;

procedure TFrmRBomCloneInput.wwDBGrid1DBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
//  if Highlight then EXIT;

  if Column.Field = QryRBom_CloneMFGNO_DISP then
  begin
    Attribs.Color:= clInfoBk;
    EXIT;
  end;

  if Column.Field.ReadOnly then
  begin
    Attribs.Color:= clBtnFace;
    EXIT;
  end;
end;

procedure TFrmRBomCloneInput.btnOKClick(Sender: TObject);
begin
  {validate}
  QryRBom_Clone.First;

  {ensure all entered}
  IQAssert( QryRBom_CloneNEW_MFGNO.asString > '',   'New Mfg # must be assigned');
  IQAssert( QryRBom_CloneNEW_ITEMNO.asString > '',  'New Item # must be assigned');
  IQAssert( QryRBom_CloneNEW_DESCRIP.asString > '', 'New Description must be assigned');

  {top item has unique mfg#}
  IQAssert( IsMfgChanged, 'Main (top) item must have unique new Mfg #');

  {ensure if item# is changed - mfg# is changed also }
  while not QryRBom_Clone.Eof do
  begin
    {change in descrip requires change in item or rev}
    if ( Trim(SelectValueByID('descrip', 'arinvt', QryRBom_CloneARINVT_ID.asFloat)) <> Trim(QryRBom_CloneNEW_DESCRIP.asString))
       and
       ( Trim(SelectValueByID('itemno', 'arinvt', QryRBom_CloneARINVT_ID.asFloat)) = Trim(QryRBom_CloneNEW_ITEMNO.asString))
       and
       ( Trim(SelectValueByID('rev', 'arinvt', QryRBom_CloneARINVT_ID.asFloat)) = Trim(QryRBom_CloneNEW_REV.asString)) then
      raise Exception.CreateFmt( 'New Item# and Mfg# is required for Item# %s'#13#13'Change of description is detected - this item is about to be cloned and requires a new Item# and Mfg#.',
                                 [ SelectValueByID('rtrim(itemno)', 'arinvt', QryRBom_CloneARINVT_ID.asFloat)]);

    if IsItemInfoChanged then
       IQAssert( IsMfgChanged, Format('New Mfg# is required for Item# %s'#13#13'Change of item#, revision or description is detected - this item is about to be cloned and requires a new Mfg#.',
                               [ SelectValueByID('rtrim(itemno)', 'arinvt', QryRBom_CloneARINVT_ID.asFloat) ]));
    QryRBom_Clone.Next;
  end;

  ModalResult:= mrOK;
end;

procedure TFrmRBomCloneInput.SetMain_Partno_ID(const Value: Real);
begin
  FMain_Partno_ID := Value;
end;

procedure TFrmRBomCloneInput.SrcRBom_CloneDataChange(Sender: TObject;
  Field: TField);
begin
  if (QryRBom_Clone.State = dsEdit) and (Field = QryRBom_CloneNEW_MFGNO) and (QryRBom_CloneNEW_ITEMNO.asString = '') then
     QryRBom_CloneNEW_ITEMNO.asString:= QryRBom_CloneNEW_MFGNO.asString;
end;

procedure TFrmRBomCloneInput.wwDBComboDlgNewMfgCustomDlg(Sender: TObject);
begin
  QryRBom_CloneNEW_MFGNO.asString:= QryRBom_CloneNEW_ITEMNO.asString
end;

procedure TFrmRBomCloneInput.wwDBComboDlgNewItemNoCustomDlg(
  Sender: TObject);
begin
  QryRBom_CloneNEW_ITEMNO.asString:= QryRBom_CloneNEW_MFGNO.asString;
end;


function TFrmRBomCloneInput.IsItemInfoChanged: Boolean;
var
  A: Variant;
begin
  Result:= FALSE;
  if QryRBom_CloneARINVT_ID.asFloat = 0 then
     EXIT;

  A:= SelectValueArrayFmt( 'select itemno, rev, descrip from arinvt where id = %f', [ QryRBom_CloneARINVT_ID.asFloat ]);
  IQAssert( VarArrayDimCount( A ) > 0, Format('Unable to locate item arinvt_id = %.0f', [ QryRBom_CloneARINVT_ID.asFloat ]));

  Result:= (QryRBom_CloneNEW_ITEMNO.asString <> A[ 0 ])
           or
           (QryRBom_CloneNEW_REV.asString <> A[ 1 ])
           or
           (QryRBom_CloneNEW_DESCRIP.asString <> A[ 2 ]);
end;

function TFrmRBomCloneInput.IsMfgChanged: Boolean;
var
  A: Variant;
begin
  Result:= FALSE;
  if QryRBom_CloneSTANDARD_ID.asFloat = 0 then
     EXIT;

  Result:= Trim(QryRBom_CloneNEW_MFGNO.asString) <> SelectValueByID('rtrim(mfgno)', 'standard', QryRBom_CloneSTANDARD_ID.asFloat);
end;


procedure TFrmRBomCloneInput.sbtnPopulateAllClick(Sender: TObject);
 var
   AMfgNo, AItemNo: string;
begin
  if not TFrmRBomQuickPrompt.DoShowModal( AMfgNo, AItemNo ) then // RBom_QkPrompt
     EXIT;

  with QryRBom_Clone do
  begin
    First;
    while not Eof do
    begin
      Edit;
      if AMfgNo > '' then
         QryRBom_CloneNEW_MFGNO.asString:= AMfgNo;
      if AItemNo > '' then
         QryRBom_CloneNEW_ITEMNO.asString:= AItemNo;
      Post;
      Next;
    end;
  end;
end;

end.
