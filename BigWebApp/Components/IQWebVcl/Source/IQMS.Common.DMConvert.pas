unit IQMS.Common.DMConvert;

interface

uses
  Winapi.Windows,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB;

type
  TCnvrt_DM = class(TDataModule)
    TblArinvt: TFDTable;
    TblFgMulti: TFDTable;
    TblArinvt_Breaks: TFDTable;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CancelInsert( ATable : TFDTable );
  end;

var
  Cnvrt_DM: TCnvrt_DM;

implementation

uses
  IQMS.Common.DataLib;
{$R *.DFM}

procedure TCnvrt_DM.CancelInsert( ATable : TFDTable );
begin
  if ATable.State in [dsInsert, dsEdit] then
     ATable.Cancel;
end;


end.
