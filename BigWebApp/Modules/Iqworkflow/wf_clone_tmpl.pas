unit wf_clone_tmpl;

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
  StdCtrls,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmCloneWorkflowTemplate = class(TUniForm)
    Label1: TUniLabel;
    edName: TUniEdit;
    Label2: TUniLabel;
    edDescrip: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute( AOld_Header_ID: Real; AHeader_Table_Name, AElement_Table_Name: string; AChildTables: array of string ): Real;
    class function ExecuteSimple( var AName, ADescription: string ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS;

{ TFrmCloneWorkflowTemplate }

class function TFrmCloneWorkflowTemplate.Execute( AOld_Header_ID: Real; AHeader_Table_Name, AElement_Table_Name: string;
                                                  AChildTables: array of string ): Real;
var
  aFrmCloneWorkflowTemplate : TFrmCloneWorkflowTemplate;
  AParamStr: string;
  I        : Integer;
begin
  IQAssert( AOld_Header_ID > 0, 'Nothing to clone!');

  Result:= 0;

  aFrmCloneWorkflowTemplate := TFrmCloneWorkflowTemplate.Create(UniGUIApplication.UniApplication);

  if aFrmCloneWorkflowTemplate.ShowModal <> mrOK then
     EXIT;

  Result:= GetNextID( AHeader_Table_Name );

  {start building param string passed to the procedure}
  AParamStr:= IQFormat( '%f,      '+    { v_old_header_id       }
                        '%f,      '+    { v_new_header_id       }
                        '''%s'',  '+    { v_new_name            }
                        '''%s'',  '+    { v_new_descrip         }
                        '''%s'',  '+    { v_header_table_name   }
                        '''%s'',  ',    { v_element_table_name  }
                        [ AOld_Header_ID,
                          Result,
                          aFrmCloneWorkflowTemplate.edName.Text,
                          aFrmCloneWorkflowTemplate.edDescrip.Text,
                          AHeader_Table_Name,
                          AElement_Table_Name ]);

  {add child tables - AChildTables holds pairs of Child1Name, Child1_FK_name, Child2Name, Child2_FK_name etc}
  I:= 0;
  while I < High( AChildTables ) do
  begin
    if I = High( AChildTables ) - 1 then
       AParamStr:= AParamStr + Format('''%s'', ''%s'''  , [ AChildTables[ I ], AChildTables[ I + 1 ] ])
    else
       AParamStr:= AParamStr + Format('''%s'', ''%s'', ', [ AChildTables[ I ], AChildTables[ I + 1 ] ]);
    I:= I + 2;
  end;

  {clone!}
  ExecuteCommandFmt('begin wf_misc.clone_template( %s ); end;', [ AParamStr ]);
end;


class function TFrmCloneWorkflowTemplate.ExecuteSimple( var AName, ADescription: string): Boolean;
var
  aFrmCloneWorkflowTemplate : TFrmCloneWorkflowTemplate;
begin
  aFrmCloneWorkflowTemplate := TFrmCloneWorkflowTemplate.Create(UniGUIApplication.UniApplication);
  Result:= aFrmCloneWorkflowTemplate.ShowModal = mrOK;
  if Result then
  begin
    AName       := aFrmCloneWorkflowTemplate.edName.Text;
    ADescription:= aFrmCloneWorkflowTemplate.edDescrip.Text;
  end;
end;


{ TFrmCloneWorkflowTemplate }

procedure TFrmCloneWorkflowTemplate.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmCloneWorkflowTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmCloneWorkflowTemplate.btnOKClick(Sender: TObject);
begin
  IQAssert( edName.Text > '', 'Name must be entered');
  IQAssert( edDescrip.Text > '', 'Description must be entered');
  ModalResult:= mrOK;
end;



end.
