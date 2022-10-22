unit WC_7722;

interface

implementation

uses
  TestReg,
  System.Variants,
  plm_prompt_clone;

procedure Test1;
var
  AName, ADescrip: string;
  ADetail, ANotes, AIntDoc, AExtDoc, AEmail, AUserFields, AUDForm, AIdeas: Boolean ;
begin
  AName:= 'Test_name';
  ADescrip := 'Test_Descrip';
  ADetail:= true;
  ANotes:=  false;
  AIntDoc:= true;
  AExtDoc:= false;
  AEmail:=  true;
  AUserFields:=  true;
  AUDForm:= true;
  AIdeas:= true;
  TFrmPlmPromptClone.DoExecute( 12345,
                                AName, ADescrip,
                                ADetail, ANotes, AIntDoc, AExtDoc, AEmail, AUserFields, AUDForm, AIdeas );
end;

initialization

  TTestRepo.RegisterTest('WC-7722', 'Plm ', 'FrmPlmPromptClone', 'DoExecute', Test1);
end.
