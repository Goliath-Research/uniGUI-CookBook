unit oc_inventory_rejects;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniComboBox, uniDBComboBox;

type
  TFrmOutsourceInvReject = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    edRejectQty: TUniEdit;
    wwDBLookupComboRejectCode: TUniDBLookupComboBox;
    Bevel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwCodeLookUp: TFDQuery;
    wwCodeLookUpREJECT_CODE: TStringField;
    wwCodeLookUpATTRIBUTE: TStringField;
    wwCodeLookUpEPLANT_ID: TBCDField;
    Label3: TUniLabel;
    wwDBLookupComboTransCode: TUniDBLookupComboBox;
    QryTransCode: TFDQuery;
    QryTransCodeCODE: TStringField;
    QryTransCodeDESCRIP: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    ds_CodeLookUp: TDataSource;
    ds_TransCode: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var AQty: Real; var ARejectCode, ATransCode: string): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;
  { TODO -oLema : Dependent on IQSecIns }
  //IQSecIns;


class function TFrmOutsourceInvReject.DoShowModal(var AQty: Real; var ARejectCode, ATransCode: string): Boolean;
var
  frm: TFrmOutsourceInvReject;
begin
  ATransCode:= '';
  frm:= TFrmOutsourceInvReject.Create(uniGUIApplication.UniApplication);
  Result:= (frm.ShowModal = mrOK);
  if Result then
  begin
    AQty       := StrToFloat( frm.edRejectQty.Text );
    ARejectCode:= Trim(frm.wwDBLookupComboRejectCode.Text);
    ATransCode := Trim(frm.wwDBLookupComboTransCode.Text);
  end;

end;

procedure TFrmOutsourceInvReject.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmOutsourceInvReject.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;


procedure TFrmOutsourceInvReject.btnOKClick(Sender: TObject);
begin
  IQAssert( StrToFloat( edRejectQty.Text ) > 0 , 'Valid reject qty must be entered.');
  IQAssert( wwDBLookupComboRejectCode.Text > '', 'Reject code must be entered.');
  ModalResult:= mrOK;
end;

procedure TFrmOutsourceInvReject.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.
