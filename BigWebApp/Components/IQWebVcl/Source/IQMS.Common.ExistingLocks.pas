unit IQMS.Common.ExistingLocks;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  IQUniGrid,
  uniGUIApplication,
  uniDBNavigator, uniGUIFrame;

type
  TFrmExistingLocks = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    procFindLocks: TFDStoredProc;
    procFindLocksLOCKER: TStringField;
    procFindLocksLOCK_HANDLE: TStringField;
    procFindLocksMODULE: TStringField;
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    procedure procFindLocksBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure procFindLocksUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure AbortOperation(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure procFindLocksBeforeRefresh(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FLockName: string;
  protected
    procedure AssignLockName( ALockName: string );
    procedure SetLockName(ALockName: string);
  public
    { Public declarations }
    class procedure DoShowModal( ALockName: string );
    property LockName: string write SetLockName;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;


class procedure TFrmExistingLocks.DoShowModal( ALockName: string );
var
  FrmExistingLocks: TFrmExistingLocks;
begin
  FrmExistingLocks:= TFrmExistingLocks.Create(uniGUIApplication.UniApplication);
  FrmExistingLocks.ShowModal;
end;

procedure TFrmExistingLocks.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmEIQ{CHM}, iqhtmEIQ{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmExistingLocks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ])
end;

procedure TFrmExistingLocks.AssignLockName( ALockName: string );
begin
  FLockName:= UpperCase( Trim( ALockName ));
end;

procedure TFrmExistingLocks.procFindLocksBeforeOpen(DataSet: TDataSet);
begin
  procFindLocks.ParamByName('V_LOCKNAME').asString:= FLockName;
end;

procedure TFrmExistingLocks.procFindLocksBeforeRefresh(DataSet: TDataSet);
begin
    Reopen(procFindLocks);
    ABORT;
end;

procedure TFrmExistingLocks.procFindLocksUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

procedure TFrmExistingLocks.SetLockName(ALockName: string);
begin
  AssignLockName( ALockName );

  procFindLocks.Open;
end;

procedure TFrmExistingLocks.UniFormCreate(Sender: TObject);
begin

  IQRegFormRead(self, [ self, wwDBGrid1 ])
end;

procedure TFrmExistingLocks.AbortOperation(DataSet: TDataSet);
begin
  ABORT;
end;


end.


