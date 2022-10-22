unit shipman_packagingdlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  shipman_common,
  shipman_dc,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniComboBox,
  uniButton,
  uniBitBtn;


type

  TFrmIQShipManPackagingDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlMain: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    lblPromptText: TUniLabel;
    cmbPackaging: TUniComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FCarrier: TCarrierType;
    FServiceCode: String;
    procedure LoadPackageList;
    function GetPackageCode(var APackageDescription: String): String;
  public
    { Public declarations }
  end;

 function DoSelectPackaging(const ACarrierType: TCarrierType;
   const AServiceCode: String; var APackageCode, APackageDescription: String): Boolean;


implementation

{$R *.dfm}

uses
  shipman_rscstr,
  IQMS.Common.Dialogs,
  shipman_shipper,
  shipman_usps;

function DoSelectPackaging(const ACarrierType: TCarrierType;
 const AServiceCode: String; var APackageCode, APackageDescription: String): Boolean;
var
  FrmIQShipManPackagingDlg : TFrmIQShipManPackagingDlg;
begin
  FrmIQShipManPackagingDlg := TFrmIQShipManPackagingDlg.Create(UniApplication);
  with FrmIQShipManPackagingDlg do
  begin
    FCarrier := ACarrierType;
    FServiceCode := AServiceCode;
    LoadPackageList;
     Result := ShowModal = mrOk;
     if Result then
        APackageCode := GetPackageCode(APackageDescription);
  end;
end;

{ TFrmIQShipManPackagingDlg }

function TFrmIQShipManPackagingDlg.GetPackageCode(var APackageDescription: String): String;
var
   i: Integer;
begin
   Result := '';

   i := cmbPackaging.ItemIndex;
   if i = -1 then Exit;

   Result := TDataCargo(cmbPackaging.Items.Objects[i]).Code;
   APackageDescription :=  TDataCargo(cmbPackaging.Items.Objects[i]).Description;
end;

procedure TFrmIQShipManPackagingDlg.LoadPackageList;
var
   AList: TPackageCodeList;
   i, AItemIndex: Integer;
   ACode, ADescription: String;
   AShipper: TShipperClass;
begin
  try
     cmbPackaging.Items.BeginUpdate;
     cmbPackaging.Items.Clear;
     AList:= TPackageCodeList.Create;

     // Get the shipper reference
     AShipper := GetShipperReference(FCarrier); // shipman_shipper.pas
     if AShipper = NIL then Exit;

     // Get the package code list
     with AShipper.Create(NIL,0,'',0) do
     try
       PackageCodeList(FServiceCode, AList);
     finally
       Free;
     end;

      // Apply values from the list
     for i := 0 to AList.Count - 1 do
         begin
           ACode := TPackageCodeItem(AList.Items[i]).Code;

           if ACode = '00' then // "Unknown"
              CONTINUE;

           ADescription := TPackageCodeItem(AList.Items[i]).Description;

           cmbPackaging.Items.AddObject(ADescription, TDataCargo.CreateB(ACode, ADescription));

         end;

     if cmbPackaging.Items.Count > 0 then
        cmbPackaging.ItemIndex := 0;

  finally
     if Assigned(AList) then AList.Free;
     cmbPackaging.Items.EndUpdate;
  end;
end;

procedure TFrmIQShipManPackagingDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   ADummy: String;
begin
  CanClose := TRUE;
  if (ModalResult = mrOk) then
     begin
       CanClose := GetPackageCode(ADummy) <> '';
       if not CanClose then
          IQError(shipman_rscstr.cTXT000038 {'Please select a packaging type.'})
     end;

end;

end.
