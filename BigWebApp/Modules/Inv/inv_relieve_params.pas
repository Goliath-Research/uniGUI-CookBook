unit inv_relieve_params;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
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
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TInvRelieveToType = (irtNone, irtWorkorder, irtSalesOrder, irtParentSerial, irtWorkCenter);

  TFrmInvRelieveParams = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1SOURCE_NAME: TStringField;
    Query1SOURCE_TABLE: TStringField;
    Query1RELIEVE_TO_PARENT_METHOD: TStringField;
    wwDBComboBox1: TUniDBComboBox;
    Query1KIND: TStringField;
    Query1SOURCE_ID: TFMTBCDField;
    procedure Query1UpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO : TNavigateBtn not yet converted }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure ApplyUpdates(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
    class function GetRelieveToInventoryType( AEPlant_ID: Real = -1 ): TInvRelieveToType;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO : Not yet converted }
  //IQSecIns,
  IQMS.WebVcl.SecurityManager;

class function TFrmInvRelieveParams.GetRelieveToInventoryType( AEPlant_ID: Real = -1 ): TInvRelieveToType;
var
   S: string;
begin
   {default eplant_id to SecurityManager}
   if AEPlant_ID = -1 then
      AEPlant_ID:= SecurityManager.EPlant_ID_asFloat;

   {retrieve the method}
   S:= SelectValueFmtAsString('select relieve_to_parent_method from v_relieve_to_parent_params where source_id = %f', [ AEPlant_ID ]);

   if S = 'W' then
      Result:= irtWorkorder
   else if S = 'O' then
      Result:= irtSalesOrder
   else if S = 'S' then
      Result:= irtParentSerial
   else if S = 'C' then
      Result:= irtWorkCenter
   else
      Result:= irtNone;

   {check if this is an eplant with no method assigned - default to SystemDefault}
   if (Result = irtNone) and (AEPlant_ID > 0) then
      Result:= GetRelieveToInventoryType( 0 );    // note source_id = 0 for system default
end;


class procedure TFrmInvRelieveParams.DoShowModal;
var
  LFrmInvRelieveParams : TFrmInvRelieveParams;
begin
  LFrmInvRelieveParams := TFrmInvRelieveParams.Create(UniGUIApplication.UniApplication);
  with LFrmInvRelieveParams do
  begin
    ShowModal;
  end;
end;

procedure TFrmInvRelieveParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmInvRelieveParams.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  { TODO : IQSecIns not yet converted }
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmInvRelieveParams.ApplyUpdates(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmInvRelieveParams.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet), 'source_id');
    ABORT;
  end;
end;   }

procedure TFrmInvRelieveParams.Query1UpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  if ASender.FieldByName('source_id').asFloat = 0 then
     ExecuteCommandFmt('update params set relieve_to_parent_method = ''%s''',
               [ Query1RELIEVE_TO_PARENT_METHOD.asString ])
  else
     ExecuteCommandFmt('update eplant set relieve_to_parent_method = ''%s'' where id = %f',
               [ Query1RELIEVE_TO_PARENT_METHOD.asString,
                 Query1SOURCE_ID.asFloat ]);

  AAction := eaApplied;
end;

end.
