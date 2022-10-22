{obsolete}
unit qc_doc_wait_for_app;


interface

uses
  Classes,
  Windows,
  Messages;

type
  TWaitForApplication = class(TThread)
  private
  protected
    procedure Execute; override;
  public
    hProcess: THandle;
    FileName: string;
    ThreadList: TThreadList;
    constructor Create( AList: TThreadList );
    destructor Destroy; override;
    procedure TerminateApplication;
  end;

implementation

uses
  SyncObjs,
  SysUtils,
  FileCtrl;

{ TWaitForApplication }

constructor TWaitForApplication.Create( AList: TThreadList );
begin
  inherited Create(TRUE);     {Create in suspended mode}
  ThreadList:= AList;
  ThreadList.Add(self);
  FreeOnTerminate:= TRUE;
end;

destructor TWaitForApplication.Destroy;
begin
  ThreadList.Remove( self );
  inherited;
end;

procedure TWaitForApplication.Execute;
begin
  WaitForSingleObject( hProcess, INFINITE );

  CloseHandle( hProcess );
  DeleteFile( FileName );
end;

procedure TWaitForApplication.TerminateApplication;
begin
  TerminateProcess(hProcess, 0);
end;

end.

