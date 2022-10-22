unit assy_work_center_pklist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.LargeGrid,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmAssyWorkCenterPickList = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnMainNext: TUniBitBtn;
    btnMainCancel: TUniBitBtn;
    Panel3: TUniPanel;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1EQNO: TStringField;
    wwQuery1CNTR_TYPE: TStringField;
    wwQuery1CNTR_DESC: TStringField;
    wwQuery1WORKCENTER_ID: TBCDField;
    wwQuery1PMEQMT_ID: TBCDField;
    wwQuery1TOOLNO: TStringField;
    procedure btnMainNextClick(Sender: TObject);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSndOp_ID: Real;
    procedure SetSndOp_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal(AOwner: TComponent; ASndOp_ID: Real; var APmeqmt_ID, AWork_Center_ID: Real ): Boolean;
    property SndOp_ID: Real write SetSndOp_ID;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous;

{ TFrmAssyWorkCenterPickList }

class function TFrmAssyWorkCenterPickList.DoShowModal(AOwner: TComponent; ASndOp_ID: Real; var APmeqmt_ID, AWork_Center_ID: Real ): Boolean;
Var
LFrmAssyWorkCenterPickList :TFrmAssyWorkCenterPickList;
begin
  LFrmAssyWorkCenterPickList := TFrmAssyWorkCenterPickList.Create(UniGUIApplication.UniApplication);
  with LFrmAssyWorkCenterPickList do
  begin
  FSndOp_ID:= ASndop_ID;
    Result:= ShowModal = mrOK;
    if Result then
    begin
      APmeqmt_ID:= wwQuery1PMEQMT_ID.asFloat;
      AWork_Center_ID:= wwQuery1WORKCENTER_ID.asFloat;
    end;
  end;
end;

procedure TFrmAssyWorkCenterPickList.SetSndOp_ID(const Value: Real);
begin
  FSndOp_ID := Value;
end;

procedure TFrmAssyWorkCenterPickList.UniFormCreate(Sender: TObject);
begin
  inherited;
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmAssyWorkCenterPickList.btnMainNextClick(Sender: TObject);
begin
  IQAssert( not (wwQuery1.Eof and wwQuery1.Bof), 'No work center selected');
  IQAssert( wwQuery1PMEQMT_ID.asFloat > 0, 'Tool # is not assigned');
  ModalResult:= mrOK;
end;

procedure TFrmAssyWorkCenterPickList.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  //with DataSet as TFDQuery do
  //  ParamByName('sndop_id').Value := FSndop_ID;
  AssignQueryParamValue(DataSet, 'sndop_id', FSndop_ID);
end;

end.
