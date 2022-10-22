unit jc_select_wo;

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
  DB,
  Wwdatsrc,
  Wwquery,
  StdCtrls,
  IQMS.WebVcl.Search,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame, uniImageList, uniDBNavigator, uniEdit,
  uniToolBar, uniBasicGrid, uniDBGrid, uniPageControl;

type
  TFrmJCSelectWO = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    Cancel: TUniButton;
    wwQryWO: TFDQuery;
    wwQryWOWORKORDER_ID: TBCDField;
    SrcWO: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQryWOBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDays: Real;
    FUserID: string;
    procedure SetADays(const Value: Real);
    procedure SetAUserID(const Value: string);
  public
    { Public declarations }
    class function DoShowModal(ADays: Real; AUserID: string): Boolean;
    property ADays: Real write SetADays;
    property AUserID: string write SetAUserID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous;

{ TFrmJCSelectWO }

class function TFrmJCSelectWO.DoShowModal(ADays: Real; AUserID: string ): Boolean;
var
  LFrm: TFrmJCSelectWO;
begin
  LFrm:= Self.Create(UniGUIApplication.UniApplication);
  LFrm.ADays:= ADays;
  LFrm.AUserID:= AUserID;
  Result:= LFrm.ShowModal = mrOK;
end;

procedure TFrmJCSelectWO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmJCSelectWO.SetADays(const Value: Real);
begin
  FDays := Value;
end;

procedure TFrmJCSelectWO.SetAUserID(const Value: string);
begin
  FUserID := Value;
end;

procedure TFrmJCSelectWO.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmJCSelectWO.wwQryWOBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue( DataSet, 'date_start', Date - FDays );
  AssignQueryParamValue( DataSet, 'date_end',   Date );
//  with DataSet as TFDQuery do
//  begin
//    ParamByName('date_start').asDateTime:= Date - FDays;
//    ParamByName('date_end').asDateTime:= Date;
//  end;
end;

procedure TFrmJCSelectWO.btnOKClick(Sender: TObject);
var
  I: Integer;

  procedure AddWO( AWorkorder_ID: Real );
  begin
    if SelectValueFmtAsFloat('select 1 from c_process_cost_wo where workorder_id = %f and userid = ''%s''', [ AWorkorder_ID, FUserID  ]) = 0 then
       ExecuteCommandFmt('insert into c_process_cost_wo( workorder_id, userid ) values (%f, ''%s'')',
                 [ AWorkorder_ID, FUserID ]);
  end;

begin
  { TODO -oBantuK -cWEB_CONVERT : Dataset, wwDBGrid properties are missing from
   IQSearch. I am not aware of equivalent properties.
  with IQSearch1 do
  try
     DataSet.DisableControls;

     IQAssert( not (DataSet.Eof and DataSet.Bof), 'No workorders selected');

     if wwDBGrid.SelectedList.Count > 0 then
        for I:= 0 to wwDBGrid.SelectedList.Count - 1 do
        begin
          DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
          AddWO( DataSet.FieldByNAme('workorder_id').asFloat );
        end
     else
        AddWO( DataSet.FieldByNAme('workorder_id').asFloat );
  finally
     DataSet.EnableControls;
  end;
  }
  ModalResult:= mrOK;
end;

end.
