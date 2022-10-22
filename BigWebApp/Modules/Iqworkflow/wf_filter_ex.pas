unit wf_filter_ex;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  wf_filter,
  Db,
  StdCtrls,
  wf_const,
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
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox, uniComboBox, uniDBComboBox, uniButton;

type
  TFrmWorkflowFilterEx = class(TFrmWorkflowFilter)
    GroupBox3: TUniGroupBox;
    rbtnVendAll: TUniRadioButton;
    rbtnVendOne: TUniRadioButton;
    wwDBLookupComboVendor: TUniDBLookupComboBox;
    QryVendor: TFDQuery;
    QryVendorID: TBCDField;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlVendDropDown(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVars( AFilter: TWorkflowFilter ); override;
  public
    { Public declarations }
    procedure AssignFilter( var AFilter: TWorkflowFilter ); override;
    class function DoModify( var AFilter: TWorkflowFilter ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  uniGUIapplication;

{ TFrmWorkflowFilterEx }

class function TFrmWorkflowFilterEx.DoModify( var AFilter: TWorkflowFilter ): Boolean;
var
  LFrmWorkflowFilterEx : TFrmWorkflowFilterEx;
begin
  LFrmWorkflowFilterEx := TFrmWorkflowFilterEx.Create(uniGUIapplication.UniApplication);
  with LFrmWorkflowFilterEx do
  begin
    Filter := AFilter;
    Result:= ShowModal = mrOK;
    if Result then
       AssignFilter( AFilter );
  end;
end;

procedure TFrmWorkflowFilterEx.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    rbtnVendAll.Checked:= Vendor_ID <= 0;
    rbtnVendOne.Checked:= Vendor_ID > 0;
    if rbtnVendOne.Checked then with wwDBLookupComboVendor do
    begin
      ListField := SelectValueByID( 'vendorno', 'vendor', Vendor_ID );
      { TODO -oathite -cWebConvert : Undeclared identifier: 'PerformSearch'
      PerformSearch; }
    end;
  end;
end;

procedure TFrmWorkflowFilterEx.btnOKClick(Sender: TObject);
begin
  if rbtnVendOne.Checked and (wwDBLookupComboVendor.Text = '') then
     raise Exception.Create('Vendor is not selected');

  inherited;
end;

procedure TFrmWorkflowFilterEx.EnableControlVendDropDown(Sender: TObject);
begin
  IQEnableControl( wwDBLookupComboVendor, rbtnVendOne.Checked );
end;

procedure TFrmWorkflowFilterEx.AssignFilter(var AFilter: TWorkflowFilter);
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
