program IQXML;

uses
  Forms,
  XML_Main in 'XML_Main.pas' {FrmIQXML};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmIQXML, FrmIQXML);
  Application.Run;
end.
