unit assy_data_get_ser;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  GetSer,
  Vcl.Buttons,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, uniCheckBox, uniPanel, uniEdit, Vcl.Forms, uniLabel,
  uniGUIApplication;

type
  TFrmAssyDataGetSerialNumber = class(TFrmGetSerialNumber)
    sbtnEdit: TUniSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbtnEditClick(Sender: TObject);
    procedure btnVoidClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( var AID: Real;
      var ASerialNo: string; var ATableName: string ): Boolean;
  end;



implementation

{$R *.dfm}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //touchscrn,
  IQMS.Common.Controls,
  { TODO -oSanketG -cWC : Need to revisit }
  //assy_data_ser_void,
  assy_data_ser_reprint_range;


class function TFrmAssyDataGetSerialNumber.DoShowModal(
  var AID: Real; var ASerialNo, ATableName: string): Boolean;
var
  FrmAssyDataGetSerialNumber: TFrmAssyDataGetSerialNumber;
begin
  FrmAssyDataGetSerialNumber := self.Create( uniGUIApplication.UniApplication );
  with FrmAssyDataGetSerialNumber do
  begin
    try
      Result:= ShowModal = mrOK;
      if Result then
      begin
        AID       := FID;
        ATableName:= FTable;
        ASerialNo := SerialNo;
      end;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmAssyDataGetSerialNumber.FormCreate(Sender: TObject);
begin
  inherited;
  { TODO -oSanketG -cWC : Need to revisit, dependent on touchscrn }
  //ApplyTouchscreenFont( self );
  { TODO -oSanketG -cWC : Need to revisit ,
  [dcc32 Error] assy_data_get_ser.pas(76): E2010 Incompatible types: 'TForm' and 'TFrmAssyDataGetSerialNumber'}
  //IQMS.Common.Controls.CenterForm( self, FALSE );
end;

procedure TFrmAssyDataGetSerialNumber.sbtnEditClick(Sender: TObject);
var
  S: string;
begin
  inherited;  // n
  S:= edSer.Text;
  { TODO -oSanketG -cWC : Need to revisit , dependent on touchscrn}
  {if TouchScreen_KeyboardSimple( self, S, 50, 'Enter Serial #' ) then
     edSer.Text:= S;}
end;


procedure TFrmAssyDataGetSerialNumber.btnReprintClick(Sender: TObject);
begin
  // inherited;
  TFrmAssyDataSerialPrintRange.DoShowModal;    // assy_data_ser_reprint_range.pas
end;

procedure TFrmAssyDataGetSerialNumber.btnVoidClick(Sender: TObject);
begin
  // inherited;
  { TODO -oSanketG -cWC : Need to revisit , dependent on assy_data_ser_void}
  //TFrmAssyDataSerialVoid.DoShowModal( self );  // assy_data_ser_void.pas
end;

end.
