unit NonAlloc;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  NonConf,
  Data.DB,
  FireDAC.Phys,
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
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  System.Classes,
  Vcl.Controls, IQUniGrid, uniGUIFrame, uniGUIBaseClasses, uniGUIClasses,UniGUIApplication,
  uniPanel;

type
  TNonAllocateTable = class(TNonConformTable)
    procedure Query1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure RefreshDataSet; override;
  public
    { Public declarations }
  end;

procedure DoNonAllocateCodes;


implementation

{$R *.DFM}

uses
{ TODO -ohphadke : Dependency }
  //InvtShel,
  IQMS.Common.DataLib;

procedure DoNonAllocateCodes;
begin
  with TNonAllocateTable.Create(UniGUIApplication.UniApplication) do
  Begin
    ShowModal;
  end;
end;

procedure TNonAllocateTable.Query1BeforePost(DataSet: TDataSet);
begin
  if Query1ID.asFloat = 0 then
    Query1ID.asFloat := GetNextID('NON_ALLOCATE');
end;

procedure TNonAllocateTable.RefreshDataSet;
begin
//  if Owner is TInvt_Shell then
//     TInvt_Shell(Owner).DM.TblNon_Allocate.Refresh;
end;

end.

