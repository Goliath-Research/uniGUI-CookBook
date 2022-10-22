unit WC_7912;

interface

implementation

uses
  TestReg,
  System.SysUtils,
  DateUtils,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  prn_filename_format;

procedure TestDoShowModal;
begin
  TFrmPrnFileNameFormat.DoShowModal('SOURCE', 'NAME,ID,DESCR');
end;

initialization

  TTestRepo.RegisterTest('WC-7912', 'Print_Dialogs', 'TFrmPrnFileNameFormat', 'DoShowModal', TestDoShowModal);

end.
