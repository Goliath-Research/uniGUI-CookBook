unit AssyTrack_SelectMfgType;

interface

uses
  Winapi.Windows,
  RTSelect,
  vcl.Wwkeycb,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.DBGrids,
  Vcl.Controls,
  System.Classes, Vcl.StdCtrls, uniCheckBox, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniSplitter, uniGroupBox, uniButton, Vcl.Forms, uniGUIBaseClasses,
  uniPanel;

type
  TFrmAssyTrackSelectMfgType = class(TFrmSelection) 
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  FrmAssyTrackSelectMfgType: TFrmAssyTrackSelectMfgType;

implementation

{$R *.dfm}

end.
