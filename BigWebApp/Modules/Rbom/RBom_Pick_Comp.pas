unit RBom_Pick_Comp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
//  Mask,
  IQMS.WebVcl.Search,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmRBom_Pick_Comp = class(TUniForm)
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQryArinvt: TFDQuery;
    wwQryArinvtITEMNO: TStringField;
    wwQryArinvtCLASS: TStringField;
    wwQryArinvtREV: TStringField;
    wwQryArinvtDESCRIP: TStringField;
    wwQryArinvtDESCRIP2: TStringField;
    wwQryArinvtUNIT: TStringField;
    wwQryArinvtID: TBCDField;
    wwQryArinvtEPLANT_ID: TBCDField;
    Label1: TUniLabel;
    ComboBox1: TUniComboBox;
    wwQryArinvtNON_MATERIAL: TStringField;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnNew: TUniButton;
    btnCancel: TUniButton;
    procedure wwQryArinvtBeforeOpen(DataSet: TDataSet);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Validate;
  public
    { Public declarations }
  end;

function DoRouteBom_Pick_Component( var AArinvt_ID: Real; var AOp_Class: string ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.QuickAddBase,
  Qk_Inv,
  Qk_Pkg;

function DoRouteBom_Pick_Component( var AArinvt_ID: Real; var AOp_Class: string ): Boolean;
var
  frm: TFrmRBom_Pick_Comp;
begin
  frm := TFrmRBom_Pick_Comp.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    Result:= (ShowModal = mrOK);
    if Result then
    begin
      AArinvt_ID:= wwQryArinvtID.asFloat;
      case ComboBox1.ItemIndex of
        0: AOp_Class:= 'PK';
        1: AOp_Class:= 'IN';
      else
        AOp_Class:= 'IN';
      end;
    end;

  end;

end;

procedure TFrmRBom_Pick_Comp.UniFormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex:= 0;
  IQRegFormRead( self, [ self, ComboBox1 ]);
end;

procedure TFrmRBom_Pick_Comp.UniFormShow(Sender: TObject);
begin
  Reopen( wwQryArinvt );
end;

procedure TFrmRBom_Pick_Comp.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, ComboBox1 ]);
end;


procedure TFrmRBom_Pick_Comp.ComboBox1Change(Sender: TObject);
begin
  Reopen( wwQryArinvt );
end;

procedure TFrmRBom_Pick_Comp.wwQryArinvtBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );

  with DataSet as TFDQuery do
       ParamByName('class').asString:= IIf( ComboBox1.ItemIndex = 0, 'PK', '**' );
end;


procedure TFrmRBom_Pick_Comp.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmRBom_Pick_Comp.Validate;
begin
  IQAssert( not (wwQryArinvt.Eof and wwQryArinvt.Bof), 'No Item selected' );
end;

procedure TFrmRBom_Pick_Comp.btnNewClick(Sender: TObject);
var
  AResultValue: Variant;
  AQkForm     : TQuickAddBaseClass;
begin
  if ComboBox1.ItemIndex = 0 then
     AQkForm:= TQuickAddPackaging
  else
     AQkForm:= TQuickAddRawArinvt;

  if DoQuickAppend( AQkForm, AResultValue, TRUE ) = mrOK then
  begin
    Reopen( wwQryArinvt );
    if not wwQryArinvt.Locate('ID', DtoF(AResultValue), []) then
       raise Exception.CreateFmt('Unable to locate new item in the inventory. ID = %.0f', [ DtoF(AResultValue) ]);
    btnOK.Click;
  end;
end;

end.
