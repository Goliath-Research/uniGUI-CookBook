unit sys_bol;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmBolParams = class(TUniForm)
    DataSource1: TDataSource;
    tblParams: TFDTable;
    DBCheckBox1: TUniDBCheckBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Bevel1: TUniPanel;
    srcIQSys2: TDataSource;
    tblIQSys2: TFDTable;
    tblIQSys2IS_BOL_SIG_REQUIRED: TStringField;
    cbxBOLSigRequired: TUniDBCheckBox;
    DBCheckBox2: TUniDBCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.Controls;

procedure TFrmBolParams.btnOKClick(Sender: TObject);
begin
  if tblParams.State in [dsInsert, dsEdit] then
  begin
    if TblParams.FieldByName('BOL_CALC_INDIVIDUAL').asString <> 'Y' then
       TblParams.FieldByName('BOL_CALC_LABEL_BASED').Clear;
    tblParams.Post;
  end;
  tblIQSys2.CheckBrowseMode;
  ModalResult:= mrOK;
end;

class procedure TFrmBolParams.DoShowModal;
begin
  with self.Create(UniGuiApplication.UniApplication) do
    ShowModal;
end;

procedure TFrmBolParams.FormCreate(Sender: TObject);
begin
  tblParams.Open;
  tblIQSys2.Open;
  PostMessage( Handle, iq_Notify, 1, 0 );  // enable/disable checkbox
end;

procedure TFrmBolParams.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    1: IQEnableControl( DBCheckBox2, DBCheckBox1.Checked );
  end;
end;

procedure TFrmBolParams.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmBolParams.DBCheckBox1Click(Sender: TObject);
begin
  PostMessage( Handle, iq_Notify, 1, 0 );  // enable/disable checkbox
end;



end.
