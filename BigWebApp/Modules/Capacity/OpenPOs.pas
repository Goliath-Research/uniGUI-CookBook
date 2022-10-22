unit OpenPOs;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  PastDuPo,
  Data.DB,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.UI.Intf,
  MainModule,
  uniMainMenu,
  uniLabel,
  uniDBNavigator,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUIBaseClasses,
  uniSplitter,
  uniGUIApplication;

type
  TFrmOpenPOs = class(TFrmPastDuePOs)
    procedure UniFormCreate(Sender: TObject);
  end;

procedure DoShowOpenPOs( AArinvt_ID: Real;  ADate: TDateTime );


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure DoShowOpenPOs( AArinvt_ID: Real;  ADate: TDateTime );
var
  aFrmOpenPOs : TFrmOpenPOs;
begin
  aFrmOpenPOs := TFrmOpenPOs.Create(UniGUIApplication.UniApplication);
  aFrmOpenPOs.Arinvt_ID := AArinvt_ID;
  aFrmOpenPOs.Date := ADate;
  aFrmOpenPOs.Show;
end;

{ TFrmOpenPOs }

procedure TFrmOpenPOs.UniFormCreate(Sender: TObject);
begin
  inherited;
  Caption:= 'Open POs for ' +
            SelectValueFmtAsString('select RTrim(itemno)||'',''||RTrim(descrip) from arinvt where id = %f',
            [ Query1.ParamByName('arinvt_id').asFloat ]);
end;

end.
