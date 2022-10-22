unit IQMS.Common.ExistingLocksEx;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Wwdatsrc,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQMS.Common.ExistingLocks, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniDBNavigator, uniPanel,
  IQUniGrid, Vcl.Controls, Vcl.Forms, uniGUIFrame;

type
  TFrmExistingLocksEx = class(TFrmExistingLocks)
    wwDBComboBox1: TUniDBComboBox;
    procedure wwDBComboBox1CloseUp(Sender: TObject);
  private
    procedure AddLockNamesForIQAlertGroups;
    procedure SetLockName(ALockName: string);
    { Private declarations }
  public
    { Public declarations }
    property LockName: string write SetLockName;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Locks;

procedure TFrmExistingLocksEx.SetLockName(ALockName: string);
begin

  AddLockNamesForIQAlertGroups;

  wwDBComboBox1.text:= ALockName;
end;

procedure TFrmExistingLocksEx.wwDBComboBox1CloseUp(Sender: TObject);
begin

  if wwDBComboBox1.ItemIndex = - 1 then EXIT;

  AssignLockName( wwDBComboBox1.text );

  Reopen( procFindLocks );
end;


procedure TFrmExistingLocksEx.AddLockNamesForIQAlertGroups;
var
  AList: TStringList;
  I: Integer;
begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList, 'select id from mon_group' );    {pas}

    // genaral
    wwDBComboBox1.Items.Add( Format('%s - 0', [ IQMS_IQALERT ]));

    // grpup specific
    for I:= 0 to AList.Count - 1 do
      wwDBComboBox1.Items.Add( Format('%s - %s', [IQMS_IQALERT, AList[ I ]]))

  finally
    AList.Free;
  end;
end;

end.
