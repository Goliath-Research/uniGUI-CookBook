unit IQMS.Common.DialogsCheckBoxIntf;

interface
  uses Forms, SysUtils, IQMS.Common.DialogCheckBoxDlg,
  uniGUIApplication, uniGUIForm, Vcl.Controls, IQMS.Common.Regfrm;

  type
   TFormClass = class of TUniForm;
   TExecute   = procedure of object;

   IQDialogCheckBox = interface
    ['{71C7A4B4-71D2-4749-BE35-8ACCA6550E00}']
       procedure SetMessageText(const Value: String);
       procedure CallMethod(Name : String);
       procedure DoShowChkDlg;
       procedure SetYesBtnText( const value : String );
       procedure SetNoBtnText( const value : String );
       procedure SetCancelBtnText( const value : String );
       procedure SetCaptionText( const value : String );
       procedure SetShowCheckBox(const Value: Boolean);
       procedure SetKey(const Value: string);
       procedure SetNumberOfButtons( const Value : Integer );
       function  GetModalResults: TModalResult;
       function  GetModTagResults: Integer;
       property  MessageStr      : String         write SetMessageText;
       property  CaptionText     : String         write SetCaptionText;
       property  Key             : string         write SetKey;
       property  YesBtnText      : string         write SetYesBtnText;
       property  NoBtnText       : string         write SetNoBtnText;
       property  CancelBtnText   : string         write SetCancelBtnText;
       property  ShowCheckBox    : Boolean        write SetShowCheckBox;
       property  ModResults      : TModalResult  read  GetModalResults;
       property  ModTagResults   : Integer       read  GetModTagResults;
       property  NumberOfButtons : Integer        Write SetNumberOfButtons;
   end;

   TIUniForm = class(TInterfacedObject, IQDialogCheckBox)
   private
     FMessageText   : String;
     ContainedForm  : TUniForm;
     FYesBtnText    : String;
     FNoBtnText     : String;
     FCancelBtnText : String;
     FformCaption   : String;
     FModalResults  : TModalResult;
     FModTagResults : Integer;
     FKey           : String;
     FNumBtns       : Integer;
     FShowCheckBox  : Boolean;
     procedure  SetMessageText(const Value: String);
     procedure  SetYesBtnText( const value : String );
     procedure  SetNoBtnText( const value : String );
     procedure  SetCancelBtnText( const value : String );
     procedure  SetCaptionText( const value : String );
     procedure  SetShowCheckBox(const Value: Boolean);
     procedure  SetKey(const Value: string);
     function   GetModalResults: TModalResult;
     function   GetModTagResults: Integer;
     procedure  SetNumberofButtons( const Value : Integer );
   public
     procedure   CallMethod(Name   : String);
     constructor Create(AFormClass : TFormClass; MessageStr, frmCaption, YBtnText, NBtnText, StrKey : String ; bShowCheckBox : Boolean); overload;
     constructor Create(AFormClass : TFormClass); overload;
     constructor Create(); overload;
     constructor Create(AStr, AKey : string; AShowCheckBox : boolean = true); overload;
     constructor Create(AStr : string; AShowCheckBox : boolean = true); overload;
     destructor  destroy; override;
     procedure   DoShowChkDlg;
   end;

implementation

Procedure TIUniForm.CallMethod(Name: String);

var Routine : TMethod;
    Execute : TExecute;

begin
 Routine.Data := Pointer(ContainedForm) ;
 Routine.Code := ContainedForm.MethodAddress(Name);
 if Assigned(Routine.Code) then
  begin
   Execute := TExecute(Routine) ;
   Execute; // call the method
  end
 else
  raise Exception.CreateFmt('Method %s not found!', [Name]);
end;

constructor TIUniForm.Create(AFormClass : TFormClass; MessageStr, frmCaption, YBtnText, NBtnText, StrKey : String ; bShowCheckBox : Boolean);
begin
    ContainedForm := AFormClass.Create(uniGUIApplication.UniApplication);
    SetMessageText( MessageStr );
    SetCaptionText( frmCaption );
    SetYesBtnText( YBtnText );
    SetNoBtnText( NBtnText );
    SetShowCheckBox( bShowCheckBox );
    if StrKey <> '' then begin
      SetKey( strKey );
    end;
    FModalResults := ContainedForm.ShowModal; // = mrOk;
end;

constructor TIUniForm.Create(AFormClass : TFormClass);
begin
  ContainedForm := AFormClass.Create(uniGUIApplication.UniApplication);
end;

constructor TIUniForm.Create();
var
  AFormClass : TIQDialogCheckDlgBox;
begin
  AFormClass     := TIQDialogCheckDlgBox.Create(uniGUIApplication.UniApplication);
  ContainedForm  := AFormClass;
end;

constructor TIUniForm.Create(AStr, AKey : string; AShowCheckBox : boolean = true );
var
  AFormClass : TIQDialogCheckDlgBox;
  AShowDialog, Achecked : Boolean;
  AModalResult : TModalResult;
begin

  TIQRegForm.ReadDialogCheckBox(AKey,{ var } Achecked,
  { var } AModalResult,{ var } AStr, { var } AShowCheckBox, mrOk);

  if ( AModalResult = mrOk ) then  
  begin
    AFormClass := TIQDialogCheckDlgBox.Create(uniGUIApplication.UniApplication);
    ContainedForm := AFormClass;
    SetMessageText(AStr);
    SetShowCheckBox(AShowCheckBox);
    SetNumberOfButtons(2);
    SetNoBtnText('Yes');
    SetCancelBtnText('No');
    TIQDialogCheckDlgBox(ContainedForm).BtnNo.Tag := 1;
    TIQDialogCheckDlgBox(ContainedForm).BtnCancel.Tag := 0;
    TIQDialogCheckDlgBox(ContainedForm).BtnNo.ModalResult := mrOk;
    TIQDialogCheckDlgBox(ContainedForm).BtnCancel.ModalResult := mrNo;
    if AKey <> '' then
    begin
      SetKey(AKey);
    end;
    DoShowChkDlg;
  end;
end;

constructor TIUniForm.Create(AStr : string; AShowCheckBox : boolean = true);
var
  AFormClass : TIQDialogCheckDlgBox;
begin
  AFormClass     := TIQDialogCheckDlgBox.Create(uniGUIApplication.UniApplication);
  ContainedForm  := AFormClass;
  SetNoBtnText( 'Yes' );
  SetCancelBtnText( 'No' );
  TIQDialogCheckDlgBox(ContainedForm).BtnNo.Tag := 1;
  TIQDialogCheckDlgBox(ContainedForm).BtnCancel.Tag := 0;

  TIQDialogCheckDlgBox(ContainedForm).BtnNo.ModalResult := mrOk;
  TIQDialogCheckDlgBox(ContainedForm).BtnCancel.ModalResult := mrNo;

  SetShowCheckBox( AShowCheckBox );
  SetMessageText( AStr );
  SetNumberofButtons( 2 );
  DoShowChkDlg;
end;

destructor TIUniForm.destroy;
begin
  if Assigned(ContainedForm) then
    ContainedForm.Free;
end;

procedure TIUniForm.SetMessageText(const Value: String);
begin
   FMessageText := Value;
   TIQDialogCheckDlgBox(ContainedForm).MsgText := FMessageText;
end;

procedure TIUniForm.SetCaptionText(const Value: String);
begin
   FformCaption := Value;
   TIQDialogCheckDlgBox(ContainedForm).CaptionText := FformCaption;
end;

procedure TIUniForm.SetKey(const Value: String);
begin
  if Value > '' then
  begin
     FKey := Value;
     TIQDialogCheckDlgBox(ContainedForm).Key := FKey;
  end;
end;

procedure TIUniForm.SetYesBtnText(const Value: String);
begin
   FYesBtnText := Value;
   TIQDialogCheckDlgBox(ContainedForm).YesBtnText := FYesBtnText;
end;

procedure TIUniForm.SetNoBtnText(const Value: String);
begin
   FNoBtnText := Value;
   TIQDialogCheckDlgBox(ContainedForm).NoBtnText := FNoBtnText;
end;

procedure TIUniForm.SetCancelBtnText(const Value: String);
begin
   FCancelBtnText := Value;
   TIQDialogCheckDlgBox(ContainedForm).CancelBtnText := FCancelBtnText;
end;

procedure TIUniForm.SetShowCheckBox(const Value: Boolean);
begin
   FShowCheckBox := Value;
   TIQDialogCheckDlgBox(ContainedForm).ShowCheckBox := FShowCheckBox;
end;

procedure TIUniForm.DoShowChkDlg;
begin
  ContainedForm.ShowModal;
  FModalResults  := TIQDialogCheckDlgBox(ContainedForm).ModalResultsDlg;
  FModTagResults :=  TIQDialogCheckDlgBox(ContainedForm).DlgTagModResults;
end;

function TIUniForm.GetModalResults: TModalResult;
begin
   Result := FModalResults;
end;

function TIUniForm.GetModTagResults: Integer;
begin
   Result := FModTagResults;
end;


procedure TIUniForm.SetNumberofButtons( const Value : Integer );
begin
   FNumBtns := Value;
   TIQDialogCheckDlgBox(ContainedForm).NumberOfButtons := FNumBtns;
end;


end.
