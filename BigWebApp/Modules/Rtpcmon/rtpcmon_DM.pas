unit rtpcmon_DM;

interface

uses
  System.SysUtils,
  System.Classes,
  IQMS.WebVcl.Hpick,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TDM_RTPCMon = class(TDataModule)
    srcWorkCenter: TDataSource;
    tblWork_Center: TFDTable;
    tblWork_CenterEQNO: TStringField;
    tblWork_CenterCNTR_TYPE: TStringField;
    tblWork_CenterCNTR_DESC: TStringField;
    tblWork_CenterMFGCELL: TStringField;
    tblWork_CenterMFG_TYPE: TStringField;
    tblWork_CenterIS_RT: TStringField;
    tblWork_CenterID: TBCDField;
    tblWork_CenterEPLANT_ID: TBCDField;
    tblWork_CenterMFGCELL_ID: TBCDField;
    tblWork_CenterPK_HIDE: TStringField;
    tblWork_CenterIS_VIRTUAL: TStringField;
    tblWork_CenterPARENT_ID: TBCDField;
    pkWorkCntr: TIQWebHPick;
    pkWorkCntrEQNO: TStringField;
    pkWorkCntrCNTR_DESC: TStringField;
    pkWorkCntrCNTR_TYPE: TStringField;
    pkWorkCntrID: TBCDField;
    pkWorkCntrEPLANT_ID: TBCDField;
    pkWorkCntrMFGCELL: TStringField;
    pkWorkCntrDIVISION_NAME: TStringField;
    pkWorkCntrEPLANT_NAME: TStringField;
    pkWorkCntrPK_HIDE: TStringField;
    srcPCMonDevice: TDataSource;
    tblPCMON_DEVICE: TFDTable;
    tblPCMON_DEVICEID: TBCDField;
    tblPCMON_DEVICENAME: TStringField;
    tblPCMON_DEVICEDESCRIP: TStringField;
    tblPCMON_DEVICEIP_ADDRESS: TStringField;
    tblPCMON_DEVICETIME_INTERVAL: TBCDField;
    tblPCMON_DEVICEPORT: TBCDField;
    tblPCMON_DEVICEBAUD: TBCDField;
    tblPCMON_DEVICEPARITY: TBCDField;
    tblPCMON_DEVICESTOPBITS: TBCDField;
    tblPCMON_DEVICEDATABITS: TBCDField;
    tblPCMON_DEVICESTART_CHAR: TStringField;
    tblPCMON_DEVICESTOP_CHAR: TStringField;
    srcPCMon_Device_Capab: TDataSource;
    tblPCMON_DEVICE_CAPAB: TFDTable;
    tblPCMON_DEVICE_CAPABID: TBCDField;
    tblPCMON_DEVICE_CAPABPCMON_DEVICE_ID: TBCDField;
    pkPCMonDevice: TIQWebHPick;
    tblPCMON_DEVICE_CAPABCOMMAND: TStringField;
    tblPCMON_DEVICE_CAPABRESULT_PREFIX: TStringField;
    tblPCMON_DEVICEWORK_CENTER_ID: TBCDField;
    spClonePCMonDevice: TFDStoredProc;
    pkPCMonDeviceNAME: TStringField;
    pkPCMonDeviceDESCRIP: TStringField;
    pkPCMonDeviceIP_ADDRESS: TStringField;
    pkPCMonDevicePCMON_DEVICE_ID: TBCDField;
    tblPCMON_DEVICECYCLE_BASED: TStringField;
    tblPCMON_DEVICEOFFLINE_COMMAND: TStringField;
    tblPCMON_DEVICEOFFLINE_RESPONSE: TStringField;
    tblPCMON_DEVICERESULT_PREFIX: TStringField;
    tblPCMON_DEVICERESULT_POSTFIX: TStringField;
    tblPCMON_DEVICE_CAPABRESULT_POSTFIX: TStringField;
    tblPCMON_DEVICE_CAPABPCMON_CAPAB_TYPE_ID: TFMTBCDField;
    srcPCMON_CAPAB_TYPE: TDataSource;
    tblPCMON_CAPAB_TYPE: TFDTable;
    tblPCMON_CAPAB_TYPEID: TFMTBCDField;
    tblPCMON_CAPAB_TYPENAME: TStringField;
    tblPCMON_CAPAB_TYPEDESCRIP: TStringField;
    tblPCMON_DEVICE_CAPABCapabType: TStringField;
    pkPCMonCapabType: TIQWebHPick;
    pkPCMonCapabTypeID: TFMTBCDField;
    pkPCMonCapabTypeNAME: TStringField;
    pkPCMonCapabTypeDESCRIP: TStringField;
    pkWorkCntrDEVICE_NAME: TStringField;
    pkWorkCntrDEVICE_DESCRIP: TStringField;
    tblPCMON_DEVICECYCLE_THRESHOLD: TBCDField;
    tblPCMON_DEVICEPROTOCOL: TStringField;
    pkPCMonDeviceTemplate: TIQWebHPick;
    pkPCMonDeviceTemplateID: TBCDField;
    pkPCMonDeviceTemplateNAME: TStringField;
    pkPCMonDeviceTemplatePROTOCOL: TStringField;
    tblPCMON_DEVICE_CAPABSTART_POS: TBCDField;
    tblPCMON_DEVICE_CAPABPACKET_HEADER: TStringField;
    tblPCMON_DEVICE_TEMPLATE: TFDTable;
    tblPCMON_DEVICE_TEMPLATEID: TBCDField;
    tblPCMON_DEVICE_TEMPLATENAME: TStringField;
    tblPCMON_DEVICE_TEMPLATEPROTOCOL: TStringField;
    tblPCMON_DEVICE_TEMPLATEOFFLINE_COMMAND: TStringField;
    tblPCMON_DEVICE_TEMPLATEOFFLINE_RESPONSE: TStringField;
    tblPCMON_DEVICE_TEMPLATERESULT_PREFIX: TStringField;
    tblPCMON_DEVICE_TEMPLATERESULT_POSTFIX: TStringField;
    srcPCMON_DEVICE_TEMPLATE: TDataSource;
    srcPCMON_DEV_CAPAB_TMPL: TDataSource;
    tblPCMON_DEV_CAPAB_TMPL: TFDTable;
    tblPCMON_DEV_CAPAB_TMPLID: TBCDField;
    tblPCMON_DEV_CAPAB_TMPLPCMON_DEVICE_TEMPLATE_ID: TBCDField;
    tblPCMON_DEV_CAPAB_TMPLCOMMAND: TStringField;
    tblPCMON_DEV_CAPAB_TMPLRESULT_PREFIX: TStringField;
    tblPCMON_DEV_CAPAB_TMPLRESULT_POSTFIX: TStringField;
    tblPCMON_DEV_CAPAB_TMPLPCMON_CAPAB_TYPE_ID: TBCDField;
    tblPCMON_DEV_CAPAB_TMPLSTART_POS: TBCDField;
    tblPCMON_DEV_CAPAB_TMPLPACKET_HEADER: TStringField;
    tblPCMON_DEV_CAPAB_TMPLCapabType: TStringField;
    spCreateDeviceFromTemplate: TFDStoredProc;
    tblPCMON_DEVICEINITS_CONNECT: TStringField;
    tblPCMON_DEVICE_TEMPLATEINITS_CONNECT: TStringField;
    tblPCMON_DEVICE_CAPABVALUE_LENGTH: TBCDField;
    tblPCMON_DEV_CAPAB_TMPLVALUE_LENGTH: TBCDField;
    tblPCMON_DEVICE_TEMPLATEALWAYS_CONNECTED: TStringField;
    tblPCMON_DEVICEALWAYS_CONNECTED: TStringField;
    tblPCMON_DEVICETEMPLATE_ID: TBCDField;
    tblPCMON_DEVICELITTLE_ENDIAN: TStringField;
    tblPCMON_DEVICE_TEMPLATELITTLE_ENDIAN: TStringField;
    tblPCMON_DEVICE_CAPABRESPONSE_ACK: TStringField;
    tblPCMON_DEV_CAPAB_TMPLRESPONSE_ACK: TStringField;
    tblPCMON_DEV_CAPAB_TMPLPACKET_LENGTH: TBCDField;
    tblPCMON_DEVICE_CAPABPACKET_LENGTH: TBCDField;
    pkWorkCntrPCMON_DEVICE_ID: TBCDField;
    tblPCMON_DEVICE_CAPABNAME: TStringField;
    tblPCMON_DEV_CAPAB_TMPLNAME: TStringField;
    tblPCMON_DEV_CAPAB_TMPLUOM: TStringField;
    tblPCMON_DEVICE_CAPABUOM: TStringField;
    tblPCMON_DEVICE_CAPABSEQ: TBCDField;
    tblPCMON_DEVICEPRODMON_ENABLED: TStringField;
    tblPCMON_DEVICEINACTIVE: TStringField;
    pkWorkCntrDEVICE_INACTIVE: TStringField;
    tblPCMON_DEVICE_CAPABACTION_PREDICATE: TStringField;
    tblPCMON_DEVICE_CAPABACTION_OPERATOR: TStringField;
    tblPCMON_DEVICE_CAPABACTION: TStringField;
    tblPCMON_DEVICE_CAPABRESULT_DATA_TYPE: TStringField;
    tblPCMON_DEVICE_CAPABACTION_SQL: TStringField;
    tblPCMON_DEVICESLAVE_NO: TBCDField;
    tblPCMON_DEVICEWATCHER_DIRECTORY: TStringField;
    tblPCMON_DEVICECIP_PATH: TStringField;
    tblPCMON_DEVICESCAN_INTERVAL: TBCDField;
    tblPCMON_DEVICE_CAPABTAGNAME: TStringField;
    procedure tblWork_CenterBeforeEdit(DataSet: TDataSet);
    procedure BeforePost(DataSet: TDataSet);
    procedure tblPCMON_DEVICE_CAPABBeforeInsert(DataSet: TDataSet);
    procedure tblPCMON_DEVICE_CAPABCalcFields(DataSet: TDataSet);
    procedure tblPCMON_DEVICEAfterPost(DataSet: TDataSet);
    procedure tblPCMON_DEVICEBeforeInsert(DataSet: TDataSet);
    procedure tblPCMON_DEV_CAPAB_TMPLCalcFields(DataSet: TDataSet);
    procedure tblPCMON_DEV_CAPAB_TMPLBeforeEdit(DataSet: TDataSet);
    procedure tblPCMON_DEV_CAPAB_TMPLBeforeInsert(
      DataSet: TDataSet);
    procedure tblPCMON_DEVICEBeforePost(DataSet: TDataSet);
    procedure srcPCMon_Device_CapabDataChange(Sender: TObject;
      Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckDeviceCountExceedsLicensed( AIncreaseBy: Integer );
    function CreateFromTemplate(ATemplate_ID: Real):Real;
    procedure PickCapabFromTemplate(ATemplateID: Real);
  end;

var
  DM_RTPCMon: TDM_RTPCMon;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.License,
  IQMS.Common.Miscellaneous,
  Rtpcmon_cntr_setup,
  rtpcmon_pkCapab,
  rtpcmon_rscstr,
  Vcl.Controls,
  Vcl.Forms;

procedure TDM_RTPCMon.tblWork_CenterBeforeEdit(DataSet: TDataSet);
begin
  Abort;
end;

procedure TDM_RTPCMon.BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TDM_RTPCMon.tblPCMON_DEVICE_CAPABBeforeInsert(DataSet: TDataSet);
begin
  tblPCMON_DEVICE.CheckBrowseMode;
  if tblPCMON_DEVICEID.asFloat = 0 then
     // 'Please create a device before trying to add capabilities.'
    raise Exception.Create('Please create a device before trying to add capabilities.');
end;

procedure TDM_RTPCMon.tblPCMON_DEVICE_CAPABCalcFields(DataSet: TDataSet);
begin
  tblPCMON_DEVICE_CAPABCapabType.asString:=
    SelectValueFmtAsString( 'select name from pcmon_capab_type where id = %.0f',
                  [ tblPCMON_DEVICE_CAPABPCMON_CAPAB_TYPE_ID.asFloat ] );
end;

procedure TDM_RTPCMon.tblPCMON_DEVICEAfterPost(DataSet: TDataSet);
begin
  TFrmRTPcmonWrkCntrSetup( self.Owner ).UpdateRTLicenseStatusBar;
end;

procedure TDM_RTPCMon.CheckDeviceCountExceedsLicensed( AIncreaseBy: Integer );
var
  RTLic, RTCount: Real;
begin
  RTCount:= IQMS.Common.License.RT_PCMon_Device_Count;     {IQMS.Common.License.pas }
  RTLic  := IQMS.Common.License.RT_PCMon_Licensed_Count;   {IQMS.Common.License.pas }

  IQAssert( RTCount + AIncreaseBy <= RTLic, rtpcmon_rscstr.cTXT0000006 ); // 'RT Process Monitoring Device count license agreement is exceeded. Operation aborted.'
end;


procedure TDM_RTPCMon.tblPCMON_DEVICEBeforeInsert(DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit( DataSet ); {in IQlib}
  if DataSet.State in [dsInsert] then
     CheckDeviceCountExceedsLicensed( 1 )
  else
     CheckDeviceCountExceedsLicensed( 0 )
end;

function TDM_RTPCMon.CreateFromTemplate(ATemplate_ID:Real):Real;
begin
  spCreateDeviceFromTemplate.Prepare;
  spCreateDeviceFromTemplate.ParamByName( 'v_pcmon_device_id' ).Value := 0;
  spCreateDeviceFromTemplate.ParamByName( 'v_work_center_id' ).Value := tblWork_CenterID.AsFloat;
  spCreateDeviceFromTemplate.ParamByName( 'v_template_id' ).Value := ATemplate_ID;
  spCreateDeviceFromTemplate.ExecProc;

  Result:= spCreateDeviceFromTemplate.ParamByName( 'v_pcmon_device_id' ).AsFloat;

  if tblPCMON_DEVICE.State in [dsInsert,dsEdit] then
    tblPCMON_DEVICE.Cancel;;

  tblPCMON_DEVICE.Refresh;
  TFrmRTPcmonWrkCntrSetup( self.Owner ).UpdateRTLicenseStatusBar;
  tblPCMON_DEVICE.Locate('ID', Result, [] );

  PickCapabFromTemplate( ATemplate_ID );
end;

procedure TDM_RTPCMon.PickCapabFromTemplate(ATemplateID:Real);
begin
  IQAssert( ATemplateID > 0, 'No Template Specified!' );
  {
  with TFrmPkCapabilities.Create( self,
                                  tblPCMON_DEVICEID.AsFloat,
                                  tblPCMON_DEVICEPROTOCOL.AsString ) do
  try
    if ShowModal = mrOK then
      tblPCMON_DEVICE_CAPAB.Refresh;
  finally
    free;
  end;
  }
  doShowModal(tblPCMON_DEVICEID.AsFloat,tblPCMON_DEVICEPROTOCOL.AsString);

end;


procedure TDM_RTPCMon.tblPCMON_DEV_CAPAB_TMPLCalcFields(
  DataSet: TDataSet);
begin
  tblPCMON_DEV_CAPAB_TMPLCapabType.asString:=
    SelectValueFmtAsString( 'select name from pcmon_capab_type where id = %.0f',
                  [ tblPCMON_DEV_CAPAB_TMPLPCMON_CAPAB_TYPE_ID.asFloat ] );
end;

procedure TDM_RTPCMon.tblPCMON_DEV_CAPAB_TMPLBeforeEdit(
  DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TDM_RTPCMon.tblPCMON_DEV_CAPAB_TMPLBeforeInsert(
  DataSet: TDataSet);
begin
  IQPostParentsBeforeEdit(DataSet);
end;

procedure TDM_RTPCMon.tblPCMON_DEVICEBeforePost(DataSet: TDataSet);
begin
  //  see rtpcmon_ctnr_setup.pas tblPCMON_DEVICEBeforePost
end;

procedure TDM_RTPCMon.srcPCMon_Device_CapabDataChange(Sender: TObject;
  Field: TField);
begin
  tblPCMON_DEVICE_CAPABACTION_SQL.ReadOnly:= tblPCMON_DEVICE_CAPABACTION.AsString = 'RTSIGNAL_TX';
end;

end.
