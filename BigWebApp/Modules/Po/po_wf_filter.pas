unit po_wf_filter;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  //wf_eval,
  wf_const,
  //qc_eval_share,
  //QC_Share,
  wf_filter,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
//  vcl.wwdblook,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniComboBox,
  uniDBComboBox,
  uniButton,
  uniGUIApplication;

type
  TFrmWorkflowFilterPO = class(TFrmWorkflowFilter)
    GroupBox3: TUniGroupBox;
    rbtnVendAll: TUniRadioButton;
    rbtnVendOne: TUniRadioButton;
    QryVendor: TFDQuery;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    QryVendorID: TBCDField;
    wwDBLookupComboVendor: TUniDBLookupComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlVendDropDown(Sender: TObject);
  private
    procedure InitVars( AFilter: TWorkflowFilter ); override;
  public
    { Public declarations }
    procedure AssignFilter( var AFilter: TWorkflowFilter ); override;
    class function DoModify( var AFilter: TWorkflowFilter ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib;

class function TFrmWorkflowFilterPO.DoModify( var AFilter: TWorkflowFilter ): Boolean;
var
  aFrmWorkflowFilterPO : TFrmWorkflowFilterPO;
begin
  aFrmWorkflowFilterPO := TFrmWorkflowFilterPO.Create(UniGUIApplication.UniApplication);
  aFrmWorkflowFilterPO.Filter:= AFilter;
  Result:= aFrmWorkflowFilterPO.ShowModal = mrOK;
end;

procedure TFrmWorkflowFilterPO.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    rbtnVendAll.Checked:= Vendor_ID <= 0;
    rbtnVendOne.Checked:= Vendor_ID > 0;
    if rbtnVendOne.Checked then with wwDBLookupComboVendor do
    begin
      KeyValue:= SelectValueByID( 'vendorno', 'vendor', Vendor_ID );
      //PerformSearch;
    end;
  end;

end;

procedure TFrmWorkflowFilterPO.btnOKClick(Sender: TObject);
begin
  if rbtnVendOne.Checked and (wwDBLookupComboVendor.Text = '') then
     raise Exception.Create('Vendor is not selected');

  inherited;
end;

procedure TFrmWorkflowFilterPO.EnableControlVendDropDown(Sender: TObject);
begin
  IQEnableControl( wwDBLookupComboVendor, rbtnVendOne.Checked );
end;

procedure TFrmWorkflowFilterPO.AssignFilter(var AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    if rbtnVendAll.Checked then
       Vendor_ID:= 0
    else
       Vendor_ID:= QryVendorID.asFloat;
  end;
end;


end.
