unit GetSer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  SerTrack,
//  LAUNCHER,
  ForTrack,
  Vcl.Buttons,
  Data.DB,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmGetSerialNumber = class(TUniForm)
    Label1: TUniLabel;
    edSer: TUniEdit;
    PnlButtons: TUniPanel;
    CbFor: TUniCheckBox;
    sbtnPickMFG: TUniSpeedButton;
    PnlButtonsInner: TUniPanel;
    btnReprint: TUniButton;
    btnOk: TUniButton;
    btnVoid: TUniButton;
    BtnCancel: TUniButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoidClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure sbtnPickMFGClick(Sender: TObject);
  private
    { Private declarations }
    function GetSerialNo: string;
    procedure SetSerialNo( AValue: string );
  public
    { Public declarations }
    FId:Real;
    FTable:String;
    constructor Create(AOwner:TComponent);
    property SerialNo: string read GetSerialNo write SetSerialNo;
  end;

function GetSerialTrackingNumber:Boolean;


implementation

uses
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  SerReprintRange,
//  iqrf.share,
  SerVoid,
  IQMS.WebVcl.SecurityManager;

{$R *.DFM}

function GetSerialTrackingNumber:Boolean;
var
  AForm: TUniForm;
  AId:Real;
begin
  with TFrmGetSerialNumber.Create(uniGUIApplication.UniApplication) do
  try
    ShowModal;
    Result := ModalResult = mrOk;
    if Result then
    begin
      AId := FId;

      if FTable = 'master_label' then
      begin
        AForm := FindFormByClassName( 'TFrmTrackSer');
        if not Assigned( AForm ) then
        begin
          AForm := TFrmTrackSer.Create(uniGUIApplication.UniApplication );
          AForm.Show;
        end
        else
          TFrmTrackSer(AForm).RefreshData( AId );
      end
      else
      begin
        AForm:= FindFormByClassName( 'TFrmForTrack');
        if not Assigned( AForm ) then
        begin
          AForm := TFrmForTrack.Create(uniGUIApplication.UniApplication );
          TFrmForTrack(AForm).Ser:=SerialNo;
          AForm.Show;
        end
        else
          TFrmForTrack(AForm).RefreshData( SerialNo );
      end;

      AForm.BringToFront;

    end
    else
      Aid := 0;
  finally
    Free;
  end;
end;

constructor TFrmGetSerialNumber.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
//  PkMasterLabelVIN_NO.Visible :=  SecurityManager.SetVisibleIfLicensed( NIL{speedbtn}, NIL{MenuOption}, NIL{Separator}, IQAppsNames[ apVINGen ], NIL);

  IQRegFormRead( self, [self]);
//  if (AOwner is TFrmTrackSer) or (AOwner is TIQLauncher) then
//    CbFor.Checked := False;
end;

procedure TFrmGetSerialNumber.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmGetSerialNumber.btnOkClick(Sender: TObject);
var
  AId:Real;
begin
  if CbFor.Checked then
    FTable := 'foreign_label'
  else
    FTable := 'master_label';

  AId := SelectValueFmtAsFloat('select id from %s where serial = ''%s''', [FTable, SerialNo ]);
  if AId = 0 then
    raise exception.create('Wrong Serial#');

  FId := AId;
  ModalResult := mrOk;

end;


procedure TFrmGetSerialNumber.btnVoidClick(Sender: TObject);
begin
  TFrmSerialVoid.DoShowModal; {SerVoid.pas}
end;

procedure TFrmGetSerialNumber.btnReprintClick(Sender: TObject);
begin
  TFrmSerialPrintRange.DoShowModal;  {SerReprintRange.pas}
end;

function TFrmGetSerialNumber.GetSerialNo: string;
begin
//  Result:= iqrf.share.StripSerialPrefix( edSer.Text );
end;

procedure TFrmGetSerialNumber.SetSerialNo(AValue: string);
begin
  edSer.Text:= AValue;
end;

procedure TFrmGetSerialNumber.sbtnPickMFGClick(Sender: TObject);
var
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select id as id, '+
                      ' serial as serial, '+
                      ' class as class, '+
                      ' itemno as itemno, '+
                      ' descrip as descrip, '+
                      ' descrip2 as descrip2, '+
                      ' qty as qty, '+
                      ' print_date as print_date, '+
                      ' dispo_scan as dispo_scan, '+
                      ' user_name as user_name, '+
                      ' decode(shipment_dtl_id, null, ''N'', ''Y'') as shipped, '+
                      ' vin_no '+
                      ' from master_label');

  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);

    SerialNo:= qry.FieldByName('serial').AsString;
  finally
    Qry.Free;
  end;
end;

end.


