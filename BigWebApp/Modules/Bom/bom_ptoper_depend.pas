unit bom_ptoper_depend;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.wwDataInspector,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  Mask,
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
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, IQUniGrid, uniGUIFrame, Vcl.Grids;

type
  TFrmBomPtOperDepend = class(TUniForm)
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    SrcPtoper: TDataSource;
    QryPtoper: TFDQuery;
    QryPtoperID: TBCDField;
    QryPtoperOPSEQ: TBCDField;
    QryPtoperOPNO: TStringField;
    QryPtoperOPDESC: TStringField;
    Panel3: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcPtoperDepend: TDataSource;
    QryPtoperDepend: TFDQuery;
    Label1: TUniLabel;
    QryPtoperDependID: TBCDField;
    QryPtoperDependPTOPER_ID: TBCDField;
    QryPtoperDependPARENT_ID: TBCDField;
    QryPtoperDependOPNO: TStringField;
    QryPtoperDependOPDESC: TStringField;
    QryPtoperDependOPSEQ: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    SecurityRegister1: TIQWebSecurityRegister;
    wwDBComboDlgProcess: TUniEdit;
    PkSndop: TIQWebHPick;
    PkSndopOPSEQ: TFMTBCDField;
    PkSndopOPNO: TStringField;
    PkSndopOPDESC: TStringField;
    PkSndopPK_HIDE: TStringField;
    PkSndopPTOPER_ID: TFMTBCDField;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplyUpdates(DataSet: TDataSet);
    { TODO -oGPatil -cWebConvert : { TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);  }
    procedure QryPtoperBeforeOpen(DataSet: TDataSet);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwDBComboDlgProcessCustomDlg(Sender: TObject);
    procedure QryPtoperDependNewRecord(DataSet: TDataSet);
    procedure QryPtoperDependBeforePost(DataSet: TDataSet);
    procedure PkSndopBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPtOper_ID: Real;
    FPartno_ID: Real;
    FOpSeq    : Real;
    procedure SetPtoper_ID(const Value: Real);

  public
    { Public declarations }
    class procedure DoShowModal(APtoper_ID: Real );
    property Ptoper_ID : Real write SetPtoper_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;
  { TODO -oGPatil -cWebConvert : Dependency on IQSecIns.pas File
  IQSecIns;   }

{ TFrmBomPtOperDepend }

class procedure TFrmBomPtOperDepend.DoShowModal( APtoper_ID: Real);
var
  LFrmBomPtOperDepend : TFrmBomPtOperDepend;
begin
  LFrmBomPtOperDepend := TFrmBomPtOperDepend.Create(UniGUIApplication.UniApplication);
  LFrmBomPtOperDepend.PtOper_ID:= APtoper_ID;
  LFrmBomPtOperDepend.ShowModal;
end;

procedure TFrmBomPtOperDepend.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1, Panel1 ]);
end;

procedure TFrmBomPtOperDepend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, Panel1 ]);
end;

procedure TFrmBomPtOperDepend.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  RefreshDataSetByID(DataSet);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmBomPtOperDepend.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end; }

procedure TFrmBomPtOperDepend.QryPtoperBeforeOpen(DataSet: TDataSet);
begin
  // with TFDQuery(Dataset) do
  //   ParamByName('ptoper_id').Value := FPtOper_ID;
  AssignQueryParamValue(DataSet, 'ptoper_id', FPtOper_ID);
end;

procedure TFrmBomPtOperDepend.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.Readonly then
     ABrush.Color:= clBtnFace;
end;

procedure TFrmBomPtOperDepend.wwDBComboDlgProcessCustomDlg(
  Sender: TObject);
begin
  with PkSndop do
    if Execute then
    begin
      QryPtoperDepend.Edit;
      QryPtoperDependPARENT_ID.asFloat:= GetValue('ptoper_id');
      QryPtoperDepend.Post;
    end;
end;

procedure TFrmBomPtOperDepend.QryPtoperDependNewRecord(DataSet: TDataSet);
begin
  QryPtoperDependPTOPER_ID.asFloat:= QryPtoperID.asFloat;
end;

procedure TFrmBomPtOperDepend.SetPtoper_ID(const Value: Real);
begin
  FPtOper_ID := Value;
end;

procedure TFrmBomPtOperDepend.QryPtoperDependBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'ptoper_depend');
end;

procedure TFrmBomPtOperDepend.PkSndopBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('partno_id').Value := FPartno_ID;
  //   ParamByName('opseq').Value := FOpSeq;
  // end;
  AssignQueryParamValue(DataSet, 'partno_id', FPartno_ID);
  AssignQueryParamValue(DataSet, 'opseq', FOpSeq);
end;

procedure TFrmBomPtOperDepend.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on IQSecins.pas File
  EnsureSecurityInspectorOnTopOf( self );  }
  IQAssert(FPtOper_ID > 0, 'Invalid argument Ptoper_ID = 0');
  FPartno_ID:= SelectValueByID('partno_id', 'ptoper', FPtoper_ID );
  FOpSeq    := SelectValueByID('opseq', 'ptoper', FPtoper_ID );
end;

end.
