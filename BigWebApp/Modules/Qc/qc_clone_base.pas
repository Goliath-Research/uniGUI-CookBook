unit qc_clone_base;

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
  StdCtrls,
  ExtCtrls,
  qc_clone_share,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmWorkFlowCloneBase = class(TUniForm)
    PnlButtonCarrier: TUniPanel;
    Bevel1: TUniPanel;
    PnlButtons: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    chkUDForm: TUniCheckBox;
    chkExternalDocuments: TUniCheckBox;
    chkEmailCorrespondence: TUniCheckBox;
    chkElementExternalDocuments: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure AssignNewHeader_ID;
    procedure CloneWorkflow;
    { Private declarations }
  protected
    FParams: TCloneParams;
    FNewHeader_ID: Real;
    FNewWorkflowNo: string;
  public
    { Public declarations }
    procedure SetParams(const Value: TCloneParams);
    function GetParams: TCloneParams;

    class function DoShowModal( AOwner: TComponent; var AParams: TCloneParams ): Boolean;
    property aParams : TCloneParams read GetParams write SetParams;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous;
//  qc_share;

{ TFrmWorkFlowCloneBase }

class function TFrmWorkFlowCloneBase.DoShowModal( AOwner: TComponent; var AParams: TCloneParams ): Boolean;
 var
  frm : TFrmWorkFlowCloneBase;
begin
  frm := TFrmWorkFlowCloneBase.Create(uniGUIApplication.UniApplication);
  try
    frm.FParams   := AParams;

    Result := frm.ShowModal = mrOk;
    if Result then
    begin
      AParams   := frm.FParams;
//      AParams.NewHeader_ID:= FNewHeader_ID;

    end;
  finally
    frm.Free;
  end;

end;




function TFrmWorkFlowCloneBase.GetParams: TCloneParams;
begin
  Result := fParams;
end;

procedure TFrmWorkFlowCloneBase.SetParams(const Value: TCloneParams);
begin
  FParams := Value;
end;




procedure TFrmWorkFlowCloneBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmWorkFlowCloneBase.UniFormCreate(Sender: TObject);
begin
   IQRegFormRead( self, [ self ]);
end;

procedure TFrmWorkFlowCloneBase.AssignNewHeader_ID;
begin
  FNewHeader_ID:= GetNextID( FParams.HeaderTableName );
//  FNewWorkflowNo:= qc_share.GetNewWorkflowNo( FParams.ModuleName, FParams.HeaderTableName, FNewHeader_ID );
end;

procedure TFrmWorkFlowCloneBase.btnOKClick(Sender: TObject);
begin
  AssignNewHeader_ID;
  CloneWorkflow;
  ModalResult:= mrOK;
end;

procedure TFrmWorkFlowCloneBase.CloneWorkflow;
begin
  ExecuteCommandFmt('declare                                           '+
            '  v_old_header_id         number::= %f;           '+
            '  v_new_header_id         number::= %f;           '+
            '  v_header_table_name     varchar2(30)::= ''%s''; '+
            '  v_kind                  varchar2(50)::= ''%s''; '+
            '  v_include_ud_form       varchar2(1)::= ''%s'';  '+
            '  v_include_external      varchar2(1)::= ''%s'';  '+
            '  v_include_email         varchar2(1)::= ''%s'';  '+
            '  v_include_elem_external varchar2(1)::= ''%s'';  '+
            '  v_new_workflowno        varchar2(15)::= ''%s''; '+
            'begin                                             '+
            '  qc_clone.exec( v_old_header_id,                 '+
            '                 v_new_header_id,                 '+
            '                 v_header_table_name,             '+
            '                 v_kind,                          '+
            '                 v_include_ud_form,               '+
            '                 v_include_external,              '+
            '                 v_include_email,                 '+
            '                 v_include_elem_external,         '+
            '                 v_new_workflowno );              '+
            'end;                                              ',
            [ FParams.OldHeader_ID,
              FNewHeader_ID,
              FParams.HeaderTableName,
              FParams.Kind,
              BoolToYN( chkUDForm.Checked ),
              BoolToYN( chkExternalDocuments.Checked ),
              BoolToYN( chkEmailCorrespondence.Checked ),
              BoolToYN( chkElementExternalDocuments.Checked ),
              FNewWorkflowNo ]);
end;


end.

