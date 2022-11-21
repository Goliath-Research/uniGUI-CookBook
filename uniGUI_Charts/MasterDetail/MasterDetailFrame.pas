unit MasterDetailFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  [ComponentPlatforms(pidWin32 + pidWin64)]
  TfrmMasterDetail = class(TFrame)
  private
    pnlMaster: TPanel;
    Splitter1: TSplitter;
    pnlDetail: TPanel;
    tbMaster: TToolBar;
    tbDetail: TToolBar;
    dsMaster: TDataSource;
    dsDetail: TDataSource;
    navMaster: TDBNavigator;
    navDetail: TDBNavigator;
    dbgMaster: TDBGrid;
    dbgDetail: TDBGrid;

    procedure SetDetail(const Value: TDataSource);
    procedure SetMaster(const Value: TDataSource);
    function GetDetail: TDataSource;
    function GetMaster: TDataSource;
  published
    property MasterDataSource : TDataSource read GetMaster write SetMaster;
    property DetailDataSource : TDataSource read GetDetail write SetDetail;
  end;

implementation

{$R *.dfm}

{ TfrmMasterDetail }

function TfrmMasterDetail.GetMaster: TDataSource;
begin
    Result := dsMaster
end;

procedure TfrmMasterDetail.SetMaster(const Value: TDataSource);
begin
    dsMaster := Value
end;

function TfrmMasterDetail.GetDetail: TDataSource;
begin
    Result := dsDetail
end;

procedure TfrmMasterDetail.SetDetail(const Value: TDataSource);
begin
    dsDetail := Value
end;

end.
