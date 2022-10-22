unit Quote_UOM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  BOM_UOM,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  IQMS.WebVcl.SecurityRegister, uniGUIClasses, uniMultiItem, uniListBox,
  uniButton, Vcl.Forms, uniGUIBaseClasses, uniPanel,UniGUIApplication;


type
  TFrmQuote_UomSelect = class(TFrmBom_UomSelect)
  private
    { Private declarations }
  protected
    procedure ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string ); override;
  public
    { Public declarations }
  end;

function GetQuote_UOM :Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;
{ TODO -oGPatil -cWebConvert : Dependency on Files
  Uom_Lst; }


function GetQuote_UOM :Boolean;
var
  LFrmQuote_UomSelect : TFrmQuote_UomSelect;
begin
  LFrmQuote_UomSelect := TFrmQuote_UomSelect.Create( UniGUIApplication.UniApplication );
  Result:= LFrmQuote_UomSelect.ShowModal = mrOK;
end;

procedure TFrmQuote_UomSelect.ApplyConvertTo( ID:Real; AFromUOM, AToUOM: string );
var
  I:Integer;
begin
  if Assigned( FDataSet ) then with FDataSet do
  begin
    ExecuteCommandFmt('update QINVT set ptwt_disp = UOM.IQConvert( ''%s'', ''%s'', ptwt_disp, -1 ) where quote_id = %f',
              [ AFromUOM, AToUOM, ID ]);
    {quote}
    Edit;
    FieldByName( FDataField ).asString:= ListBox1.Items[ ListBox1.ItemIndex ];
    Post;


    with TFDTable(FDataSet).Connection do
      for I:= 0 to DatasetCount - 1 do
         if (DataSets[I].ClassType = TFDTable) then with DataSets[I] as TFDTable do
           if (CompareText('QINVT', TableName) = 0) or (CompareText('IQMS.QINVT', TableName) = 0) then
              TFDTable(DataSets[I]).Refresh;
  end;
end;

end.
