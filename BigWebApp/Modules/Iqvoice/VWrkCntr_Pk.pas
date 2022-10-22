unit VWrkCntr_Pk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame;

type
  TFrmWorkCenterPkList = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1EQNO: TStringField;
    wwQuery1MFG_TYPE: TStringField;
    wwQuery1MFGCELL: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwQuery1CNTR_DESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute( AList: TStringList ): Boolean;
    procedure SaveTo( AList: TStringList );
  end;



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

class function TFrmWorkCenterPkList.Execute( AList: TStringList ): Boolean;
var
  FrmWorkCenterPkList: TFrmWorkCenterPkList;
begin
  FrmWorkCenterPkList := TFrmWorkCenterPkList.Create(uniGUIApplication.uniApplication);
  with FrmWorkCenterPkList do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       SaveTo( AList );
  end;
end;

procedure TFrmWorkCenterPkList.SaveTo( AList: TStringList );
var
  I: Integer;
begin
  AList.Clear;
  { TODO -oSanketG -cWebConvert : Need to find alternative for wwDBGrid in TIQUniGridControl ,
  [dcc32 Error] VWrkCntr_Pk.pas(82): E2003 Undeclared identifier: 'wwDBGrid'}
  {with IQSearch1.wwDBGrid, IQSearch1.Datasource.Dataset do
  try
    DisableControls;
    for I:= 0 to SelectedList.Count-1 do
    begin
       GotoBookmark(SelectedList.Items[ I ]);
       Freebookmark(SelectedList.Items[ I ]);
       AList.Add( FieldByName('ID').asString );
    end;
    SelectedList.Clear;
  finally
    EnableControls;
  end;}
end;

procedure TFrmWorkCenterPkList.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmWorkCenterPkList.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

end.
