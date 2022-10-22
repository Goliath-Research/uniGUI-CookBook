unit Inv_CostParentMassCustFilter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmCostParentMassCustFilter = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    IQSearch1: TIQUniGridControl;
    btnIncludeAll: TUniButton;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1CUSTNO: TStringField;
    wwQuery1COMPANY: TStringField;
    wwQuery1ADDR1: TStringField;
    wwQuery1ADDR2: TStringField;
    wwQuery1ADDR3: TStringField;
    wwQuery1CITY: TStringField;
    wwQuery1STATE: TStringField;
    wwQuery1COUNTRY: TStringField;
    wwQuery1ZIP: TStringField;
    wwQuery1PHONE_NUMBER: TStringField;
    wwQuery1PRIME_CONTACT: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    wwQuery1ARCUSTO_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure btnIncludeAllClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FBatch: Real;
    procedure Validate;
    procedure MarkSelectedRecords;
    procedure SetBatch(const Value: Real);
  public
    { Public declarations }
    property Batch: Real write SetBatch;
    class function DoShowModal( ABatch: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Depends on FrmCostParentMass
  FrmCostParentMass,  }
  IQMS.Common.PanelMsg;

{ TFrmCostParentMassCustFilter }

class function TFrmCostParentMassCustFilter.DoShowModal(ABatch: Real): Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
  begin
    Batch := ABatch;
    Result:= ShowModal = mrOK;
  end;
end;

procedure TFrmCostParentMassCustFilter.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCostParentMassCustFilter.wwQuery1BeforeOpen(
  DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('batch').Value := FBatch;
end;

procedure TFrmCostParentMassCustFilter.MarkSelectedRecords;
var
  AList: TStringList;
  I: Integer;
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait( '' );

  AList:= TStringList.Create;
  wwQuery1.DisableControls;
  try
    LoadColumnValueIntoStringList( AList, 'select arcusto_id from gtt_arcusto_filter' );
    { TODO -oathite -cWebConvert : Undeclared identifier: 'SelectRecord'
    for I:= 0 to AList.Count - 1 do
      if wwQuery1.Locate('arcusto_id', StrToFloat(AList[ I ]), []) then
         IQSearch1.DBGrid.SelectRecord();
    }
    wwQuery1.First;
  finally
    AList.Free;
    wwQuery1.EnableControls;
    hMsg.Free;
  end;
end;

procedure TFrmCostParentMassCustFilter.SetBatch(const Value: Real);
begin
  FBatch := Value;
end;

procedure TFrmCostParentMassCustFilter.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
  MarkSelectedRecords
end;

procedure TFrmCostParentMassCustFilter.btnIncludeAllClick(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on FrmCostParentMass
  TFrmCostParentMassUpdate.ClearArcustoFilter; }
  ModalResult:= mrOK;
end;

procedure TFrmCostParentMassCustFilter.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  Validate;

  { TODO -oathite -cWebConvert : Depends on FrmCostParentMass
  TFrmCostParentMassUpdate.ClearArcustoFilter;

  if (IQSearch1.DataSet.Eof and IQSearch1.DataSet.Bof) or (IQSearch1.wwDBGrid.SelectedList.Count = 0) then
     EXIT;

  with IQSearch1 do
  try
     DataSet.DisableControls;
     for I:= wwDBGrid.SelectedList.Count - 1 downto 0 do
     begin
       DataSet.GotoBookmark( wwDBGrid.SelectedList.Items[ I ]);
       ExecuteCommandFmt('insert into gtt_arcusto_filter (arcusto_id) values( %f )', [ DataSet.FieldByName('ARCUSTO_ID').asFloat ]);
     end;
  finally
     DataSet.EnableControls;
  end;
  }

  ModalResult:= mrOK;
end;

procedure TFrmCostParentMassCustFilter.Validate;
begin

end;

end.
