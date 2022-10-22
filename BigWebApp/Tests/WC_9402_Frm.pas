unit WC_9402_Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniSplitter, uniGUIBaseClasses, uniBasicGrid,
  uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, IQMS.WebVcl.Documents, uniGUIFrame;

type
  TWC_9402 = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniSplitter1: TUniSplitter;
    Qry: TFDQuery;
    ds_Qry: TDataSource;
    IQWebDocs1: TIQWebDocs;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowModal9402;

implementation

uses
  uniGUIApplication;

{$R *.dfm}

procedure DoShowModal9402;
var
  frm : TWC_9402;
begin
  frm := TWC_9402.Create(UniApplication);
  frm.ShowModal;
end;

procedure TWC_9402.UniFormCreate(Sender: TObject);
begin
  Qry.Open;
  IQWebDocs1.Active := true;
end;

procedure TWC_9402.UniFormDestroy(Sender: TObject);
begin
  IQWebDocs1.Active := false;
  Qry.Close;
end;

end.
