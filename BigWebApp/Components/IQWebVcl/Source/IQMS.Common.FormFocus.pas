unit IQMS.Common.FormFocus;

{ Unit creates a thread which allows processes time to complete
  and then brings the calling form to the forefront.  Call this method
  in Form.Show or in AfterShow

  The array, AModalFormClass, should be a list of form classes that might
  be modal at the time this method is called.  They are brought to the front
  in sequence, so that the last modal form class listed will be the one
  on finally top.

  Example:

  IQFormFocus.ForceFormFocus(Self, ['TFrmReqSpecFieldsDlg', 'THyperPick']);

}

interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, System.SysUtils,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys;
  {*UG_rem_AE*}
  //db_dm;

type
  TFormFocus = class(TThread)
  private
    { Private declarations }
    FOwnerForm: TForm;
    FModalForms: array of String;
    procedure Delay(dwMilliseconds: LongInt);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(const AOwner: TForm; const AModalFormClass: array of String);
    procedure Execute; override;
  end;

  procedure ForceFormFocus(const AOwner: TForm); overload;
  procedure ForceFormFocus(const AOwner: TForm; const AModalFormClass: array of String); overload;


var
   FormFocusDescriptor: TFormFocus;

implementation

uses
    IQMS.Common.Controls;
    {*UG_rem_AE*}
    //iqscreen;

procedure ForceFormFocus(const AOwner: TForm);
begin
  ForceFormFocus(AOwner, []);
end;

procedure ForceFormFocus(const AOwner: TForm; const AModalFormClass: array of String);
var
   mnu: HMENU; // reference to the form Close button
begin

  // ensure form exists in memory or is not being destroyed
  if not Assigned(AOwner) or (csDestroying in AOwner.ComponentState) then Exit;

  // don't run this method if the thread is already running; exit early.
  if Assigned(FormFocusDescriptor) then Exit;

  try
     // get handle of system Close button
     mnu := GetSystemMenu(AOwner.Handle, LongBool(False));

     // disable the ability to close the form with the close ("X") button
     EnableMenuItem(mnu, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);

     // create the thread
     FormFocusDescriptor := TFormFocus.Create(AOwner, AModalFormClass);

     // process the thread
     if Assigned(FormFocusDescriptor) then
       try
         FormFocusDescriptor.Execute;
       finally
         FormFocusDescriptor.Terminate;
       end;

  finally
    // reset the variable, pointing to the thread
    if Assigned(FormFocusDescriptor) then
       FreeAndNil(FormFocusDescriptor);

    // enable the close button back again
    EnableMenuItem(mnu, SC_CLOSE, MF_BYCOMMAND or MF_ENABLED);
  end;
end;

{ TFormFocus }

constructor TFormFocus.Create(const AOwner: TForm;
 const AModalFormClass: array of String);
var
   i: Integer;
begin
  inherited Create(False);

  // assign value of owner; this is the form that will be affected
  FOwnerForm := AOwner;

  // copy array of form class names
  SetLength(FModalForms, High(AModalFormClass)+1);
  for i := 0 to High(AModalFormClass) do
      FModalForms[i] := AModalFormClass[i];

  // it is much safer to free the thread within a calling "try...finally..."
  FreeOnTerminate := False;

end;

procedure TFormFocus.Execute;
const
  cInterval = 500; // how long do we wait?
var
   i: Integer;  // counter var
begin
  // wait a second ... literally
  Delay(cInterval);

  // bring the calling form to the front
  if Assigned(FOwnerForm) then
     try
         {*UG_rem_AE*}
//       if iqscreen.IndexOfForm(FOwnerForm) > -1 then
//         begin
//           IQMS.Common.Controls.ForceForegroundWindowB(FOwnerForm.Handle);
//           FOwnerForm.BringToFront;
//
//           // lastly, bring other modal forms, by class name, to the front
//           for i := 0 to High(FModalForms) do
//            ActivateFormByClassName(FModalForms[i]);
//         end;
     except // intentional suppress
     end;
end;

procedure TFormFocus.Delay(dwMilliseconds: LongInt);
var
  iStart, iStop: DWORD;
begin
  iStart := GetTickCount;
  repeat
    iStop := GetTickCount;
    Application.ProcessMessages;
    Sleep(1); // addition from Christian Scheffler to avoid high CPU last
  until (iStop - iStart) >= dwMilliseconds;
end;

end.
