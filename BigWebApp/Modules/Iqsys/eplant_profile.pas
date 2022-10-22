unit eplant_profile;

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
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniStatusBar,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, uniGUIFrame,
  IQUniGrid, Vcl.Controls;

type
  TFrmEPlantProfile = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    SrcEplant_Profile: TDataSource;
    QryEplant_Profile: TFDQuery;
    QryEplant_ProfileID: TBCDField;
    QryEplant_ProfileEPLANT_ID: TBCDField;
    QryEplant_ProfileMODULE: TStringField;
    QryEplant_ProfileTOPIC: TStringField;
    QryEplant_ProfileVALUE1: TStringField;
    QryEplant_ProfileVALUE2: TStringField;
    StatusBar1: TUniStatusBar;
    QryEplant_ProfileEPlantName: TStringField;
    wwQueryEplant: TFDQuery;
    wwQueryEplantID: TBCDField;
    wwQueryEplantNAME: TStringField;
    wwDBLookupComboEplant: TUniDBLookupComboBox;
    UpdateSQLEplant_Profile: TFDUpdateSQL;
    Bevel1: TUniPanel;
    procedure wwQueryEplantBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    { TODO : TNavigateBtn not yet converted }
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure QryEplant_ProfileBeforePost(DataSet: TDataSet);
    procedure QryEplant_ProfileNewRecord(DataSet: TDataSet);
    procedure QryEplant_ProfileBeforeOpen(DataSet: TDataSet);
    procedure QryEplant_ProfileCalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    procedure SetModules(const Value: String);
    procedure SetTopic(const Value: String);
    { Private declarations }
  protected
    FModule: string;
    FTopic : string;
    procedure UpdateStatusBar; virtual;
  public
    { Public declarations }
    class procedure DoShowModal( AModule, ATopic: string );

    class function GetValue( AModule, ATopic, AFieldName: string; AEPlant_ID: Real ): string;
    class function GetReportName( AReportFieldName: string ): string;
    class function GetBeforeExecName( AReportFieldName: string ): string;
    property Module : String write SetModules;
    property Topic : String write SetTopic;
  end;

implementation

{$R *.DFM}

uses
  eplant_profile_share,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  iqsys_rscstr;


class procedure TFrmEPlantProfile.DoShowModal(AModule, ATopic: string);
var
  LFrmEPlantProfile : TFrmEPlantProfile;
begin
  LFrmEPlantProfile := TFrmEPlantProfile.Create(UniGUIApplication.UniApplication);
  with LFrmEPlantProfile do
  begin
    Module :=AModule;
    Topic := ATopic;
    ShowModal;
  end;
end;

class function TFrmEPlantProfile.GetValue( AModule, ATopic, AFieldName: string; AEPlant_ID: Real ): string;
begin
  Result:= SelectValueFmtAsString( 'select %s from eplant_profile '+
                         ' where eplant_id = %f             '+
                         '   and module = ''%s''            '+
                         '   and topic  = ''%s''            ',
                         [ AFieldName,
                           AEPlant_ID,
                           AModule,
                           ATopic ]);
end;


class function TFrmEPlantProfile.GetReportName( AReportFieldName: string ): string;
begin
  Result:= TFrmEPlantProfile.GetValue( epMODULE_REPORTS {eplant_profile_share.pas}, {eplant_profile.pas}
                                       AReportFieldName,
                                       'value1',
                                       SecurityManager.EPlant_ID_AsFloat );
end;

class function TFrmEPlantProfile.GetBeforeExecName(AReportFieldName: string ): string;
begin
  Result:= TFrmEPlantProfile.GetValue( epMODULE_REPORTS {eplant_profile_share.pas}, {eplant_profile.pas}
                                       AReportFieldName,
                                       'value2',
                                       SecurityManager.EPlant_ID_AsFloat );
end;


{ TFrmEPlantProfile }

procedure TFrmEPlantProfile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmEPlantProfile.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  UpdateStatusBar;
end;

procedure TFrmEPlantProfile.UpdateStatusBar;
begin
  StatusBar1.Panels[ 0 ].Text:= ' ' + iqsys_rscstr.cTXT0000068 {'Module:'} + ' ' + FModule;
  StatusBar1.Panels[ 1 ].Text:= ' ' + iqsys_rscstr.cTXT0000068 {'Module:'} + ' ' + FTopic;
end;

procedure TFrmEPlantProfile.wwQueryEplantBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;
{ TODO : TNavigateBtn not yet converted }
{procedure TFrmEPlantProfile.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;   }

procedure TFrmEPlantProfile.QryEplant_ProfileBeforePost(DataSet: TDataSet);
begin
  if QryEplant_ProfileID.asFloat = 0 then
     QryEplant_ProfileID.asFloat:= GetNextID('eplant_profile');
end;

procedure TFrmEPlantProfile.QryEplant_ProfileCalcFields(DataSet: TDataSet);
begin
  QryEplant_ProfileEPlantName.AsString := SelectValueFmtAsString(
    'SELECT name FROM eplant WHERE id = %d',
    [QryEplant_ProfileEPLANT_ID.AsLargeInt]);
end;

procedure TFrmEPlantProfile.QryEplant_ProfileNewRecord(DataSet: TDataSet);
begin
  QryEplant_ProfileMODULE.asString:= FModule;
  QryEplant_ProfileTOPIC.asString := FTopic;
end;

procedure TFrmEPlantProfile.SetModules(const Value: String);
begin
  FModule := Value;
end;

procedure TFrmEPlantProfile.SetTopic(const Value: String);
begin
  FTopic := Value;
end;

procedure TFrmEPlantProfile.QryEplant_ProfileBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('module').asString:= FModule;
    ParamByName('topic').asString := FTopic;
  end;
end;


end.
