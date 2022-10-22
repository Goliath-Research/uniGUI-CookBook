unit IQMS.WebVcl.SecGroupClone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmSecurityGroupClone = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edName: TUniEdit;
    edDescrip: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FGroup_ID: Real;
    FNewGroup_ID: Real;
    procedure Validate;
    procedure Execute;
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; AGroup_ID: Real );
    class function DoShowModal( AGroup_ID: Real; var ANewGroup_ID: Real ): Boolean;
    property NewGroup_ID: Real read FNewGroup_ID write FNewGroup_ID;
  end;

var
  FrmSecurityGroupClone: TFrmSecurityGroupClone;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings,
  Data.DB;

{ TFrmSecurityGroupClone }

class function TFrmSecurityGroupClone.DoShowModal(AGroup_ID: Real; var ANewGroup_ID: Real ): Boolean;
var frm : TFrmSecurityGroupClone;
begin
  frm := TFrmSecurityGroupClone.Create(uniGUIApplication.UniApplication);
  frm.FGroup_ID := AGroup_ID;

  Result := frm.ShowModal = mrOK;

  if Result then
    ANewGroup_ID := frm.NewGroup_ID;

end;

procedure TFrmSecurityGroupClone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSecurityGroupClone.btnOKClick(Sender: TObject);
begin
  Validate;
  Execute;
  ModalResult:= mrOK;
end;

procedure TFrmSecurityGroupClone.Validate;
begin
  IQAssert( edName.Text > '', IQMS.WebVcl.ResourceStrings.cTXT0000439 ); // 'Security group name must be specified - operation aborted';
  IQAssert( edDescrip.Text > '', IQMS.WebVcl.ResourceStrings.cTXT0000440 ); // 'Security group description must be specified - operation aborted';
end;

procedure TFrmSecurityGroupClone.Execute;
begin
  FNewGroup_ID:= GetNextID('s_group');

  ExecuteCommandFmt('declare                                   '+
            '  v_old_group_id number::= %f;            '+
            '  v_new_group_id number::= %f;            '+
            '  v_new_name     varchar2(100)::= ''%s''; '+
            '  v_new_descrip  varchar2(100)::= ''%s''; '+
            'begin                                     '+
            '  sec_misc.clone_group( v_old_group_id,   '+
            '                        v_new_group_id,   '+
            '                        v_new_name,       '+
            '                        v_new_descrip );  '+
            'end;                                      ',
            [ FGroup_ID,
              FNewGroup_ID,
              FixStr(edName.Text),
              FixStr(edDescrip.Text)]);
end;

end.
