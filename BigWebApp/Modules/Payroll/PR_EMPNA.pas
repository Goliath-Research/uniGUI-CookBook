unit PR_empNa;

interface

uses
  Vcl.Forms,
  Mask,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMemo,
  uniDBMemo,
  uniEdit,
  uniDBEdit,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, MainModule;

type
  TForm1 = class(TUniForm)
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label37: TUniLabel;
    Label38: TUniLabel;
    Label39: TUniLabel;
    Label40: TUniLabel;
    Label41: TUniLabel;
    Label42: TUniLabel;
    Label56: TUniLabel;
    Label58: TUniLabel;
    Label59: TUniLabel;
    Label65: TUniLabel;
    Label73: TUniLabel;
    dbeEmpAddr1: TUniDBEdit;
    dbeEmpAddr2: TUniDBEdit;
    dbeEmpAddr3: TUniDBEdit;
    dbeEmpCity: TUniDBEdit;
    dbeEmpZIP: TUniDBEdit;
    dbeEmpState: TUniDBComboBox;
    dbeEmpCountry: TUniDBEdit;
    dbeEmpPhone: TUniDBEdit;
    dbeEmpFax: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBMemo1: TUniDBMemo;
    dbeEmpFName: TUniDBEdit;
    dbeEmpLastName: TUniDBEdit;
    DBEdit4: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}


end.
