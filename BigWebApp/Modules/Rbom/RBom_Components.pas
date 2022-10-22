unit RBom_Components;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls;

type
  TFrmRBom_Components = class(TUniForm)
    Panel1: TUniPanel;
    DBGrid1: TUniDBGrid;
    SrcOpMat: TDataSource;
    QryOpMat: TFDQuery;
    NavMain: TUniDBNavigator;
    QryOpMatID: TBCDField;
    QryOpMatSNDOP_ID: TBCDField;
    QryOpMatARINVT_ID: TBCDField;
    QryOpMatSEQ: TBCDField;
    QryOpMatOVERLAP_HRS: TBCDField;
    QryOpMatCLASS: TStringField;
    QryOpMatITEMNO: TStringField;
    QryOpMatDESCRIP: TStringField;
    QryOpMatDESCRIP2: TStringField;
    QryOpMatUNIT: TStringField;
    QryOpMatSTANDARD_ID: TBCDField;
    Splitter1: TUniSplitter;
    QryOpMatOP_CLASS: TStringField;
    OpMatUpdateSQL: TFDUpdateSQL;
    QryOpMatSCRAP: TBCDField;
    pnlDetail: TUniPanel;
    PageControl1: TUniPageControl;
    tshNone: TUniTabSheet;
    tshPackaging: TUniTabSheet;
    Label1: TUniLabel;
    Label4: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    tshComponents: TUniTabSheet;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DBEdit2: TUniDBEdit;
    DBEdit3: TUniDBEdit;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    QryOpMatPTSPER_DISP: TFMTBCDField;
    QryOpMatNON_MATERIAL: TStringField;
    procedure QryOpMatBeforeOpen(DataSet: TDataSet);
    procedure SrcOpMatDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure QryOpMatAfterPost(DataSet: TDataSet);
    procedure QryOpMatNewRecord(DataSet: TDataSet);
    procedure QryOpMatAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryOpMatBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FParent_Partno_ID: Real;
    FModified        : Boolean;
    procedure SetParent_Partno_ID(const Value: Real);
    function GetCreateSndOp( AOp_Class: string ): Real;
  public
    { Public declarations }
    property Parent_Partno_ID: Real write SetParent_Partno_ID;
  end;

function DoRouteBom_Components( AParent_Partno_ID: Real ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataConst,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  RBom_Pick_Comp,
  System.Variants;

function DoRouteBom_Components( AParent_Partno_ID: Real ): Boolean;
var
  frm: TFrmRBom_Components;
begin
  frm := TFrmRBom_Components.Create(uniGUIApplication.UniApplication);
  frm.FParent_Partno_ID := AParent_Partno_ID;
  frm.ShowModal;
  Result:= frm.FModified;
end;

procedure TFrmRBom_Components.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1, pnlDetail ]);
//  IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TFrmRBom_Components.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1, pnlDetail ]);
end;

procedure TFrmRBom_Components.QryOpMatBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('partno_id').Value := FParent_Partno_ID;
end;

procedure TFrmRBom_Components.SetParent_Partno_ID(const Value: Real);
begin
  FParent_Partno_ID := Value;
end;

procedure TFrmRBom_Components.SrcOpMatDataChange(Sender: TObject;
  Field: TField);
begin
  if QryOpMatOP_CLASS.asString = 'Packaging' then
     PageControl1.ActivePage:= tshPackaging
  else if QryOpMatOP_CLASS.asString = 'Components' then
     PageControl1.ActivePage:= tshComponents
  else
     PageControl1.ActivePage:= tshNone;
end;

procedure TFrmRBom_Components.DBGrid1EditButtonClick(Sender: TObject);
var
  AArinvt_ID: Real;
  AOp_Class : string;
begin
  if DoRouteBom_Pick_Component( AArinvt_ID, AOp_Class ) then
  with QryOpMat do
  begin
     Edit;
     QryOpMatARINVT_ID.asFloat:= AArinvt_ID;
     QryOpMatSNDOP_ID.asFloat := GetCreateSndOp( AOp_Class );  {this unit}
     Post;
  end;
end;

function TFrmRBom_Components.GetCreateSndOp( AOp_Class: string ): Real;
var
  AOpSeq : Real;
  AOpDesc: string;
begin
  {Locate sndop that is attached to parent partno}
  Result:= SelectValueFmtAsFloat('select o.sndop_id             '+
                        '  from ptoper o,              '+
                        '       sndop                  '+
                        ' where o.partno_id = %f       '+
                        '   and o.sndop_id = sndop.id  '+
                        '   and sndop.op_class = ''%s''', [ FParent_Partno_ID, AOp_Class ]);
  if Result = 0 then
  begin
    {Append to Sndop}
    Result:= GetNextID('sndop');
    AOpDesc:= IIf( AOp_Class = 'PK', 'Attached Packaging', 'Attached Components' );
    ExecuteCommandFmt('insert into sndop( id, opno, op_class, opdesc) values( %f, %f, ''%s'', ''%s'')', [ Result, Result, AOp_Class, AOpDesc ]);

    {Append to PtOper}
    AOpSeq:= 1 + SelectValueFmtAsFloat('select max(opseq) from ptoper where partno_id = %f', [ FParent_Partno_ID ]);
    ExecuteCommandFmt('insert into ptoper( partno_id, sndop_id, opseq ) values( %f, %f, %f )', [ FParent_Partno_ID, Result, AOpSeq ]);
  end;
end;

procedure TFrmRBom_Components.QryOpMatAfterPost(DataSet: TDataSet);
begin
  //QryOpMat.DataBase.ApplyUpdates( [ QryOpMat ]);
  QryOpMat.ApplyUpdates;
  RefreshDataSetByID( QryOpMat );
  FModified:= TRUE;
end;


procedure TFrmRBom_Components.QryOpMatNewRecord(DataSet: TDataSet);
begin
  QryOpMatID.asFloat    := GetNextID('opmat');
  QryOpMatPTSPER_DISP.asFloat:= 1;
end;

procedure TFrmRBom_Components.QryOpMatAfterDelete(DataSet: TDataSet);
begin
  {Post Changes}
  QryOpMatAfterPost(DataSet);

  {Delete SndOp if opmat is empty}
  with TFDQuery.Create(self) do
  try
    ConnectionName := cnstFDConnectionName;
    SQL.Add(       'select ptoper.sndop_id'                              );
    SQL.Add(       '  from ptoper,'                                      );
    SQL.Add(       '       opmat  '                                      );
    SQL.Add(Format(' where ptoper.partno_id = %f', [ FParent_Partno_ID ]));
    SQL.Add(       '   and ptoper.sndop_id = opmat.sndop_id(+)'          );
    SQL.Add(       '   and opmat.id is NULL'                             );
    Open;
    while not Eof do
    begin
      ExecuteCommandFmt('delete from ptoper where sndop_id = %f and partno_id = %f', [ Fields[0].asFloat, FParent_Partno_ID ]);
      ExecuteCommandFmt('delete from sndop where id = %f', [ Fields[0].asFloat ]);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmRBom_Components.btnOKClick(Sender: TObject);
begin
  QryOpMat.CheckBrowseMode;
  Close;
end;

procedure TFrmRBom_Components.btnCancelClick(Sender: TObject);
begin
  if (QryOpMat.State in [dsEdit, dsInsert]) and IQConfirmYN('Post changes before exit?') then
     btnOK.Click
  else
     Close;
end;

procedure TFrmRBom_Components.FormShow(Sender: TObject);
var
  A: Variant;
begin
  { TODO -oLema : Dependent on IQSecIns }
  //EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}

  IQSetTablesActive( TRUE, self );

  A:= SelectValueArrayFmt('select RTrim(a.itemno), s.route_seq from partno p, arinvt a, standard s where p.id = %f and p.arinvt_id = a.id and p.standard_id = s.id', [ FParent_Partno_ID ]);
  if VarArrayDimCount( A ) > 0 then
     Caption:= Format('Components for %s, Route # %.0f', [ A[ 0 ], DtoF(A[ 1 ])]);
end;

procedure TFrmRBom_Components.QryOpMatBeforePost(DataSet: TDataSet);
begin
  if SelectValueByID( 'non_material', 'arinvt', DataSet.FieldByName('arinvt_id').asFloat ) = 'Y' then
     DataSet.FieldByName('ptsper_disp').asFloat:= 0;
end;

end.
