unit TaPrepHl;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Mask,
  wwdbedit,
  Wwdbspin,
  ComCtrls,
  wwdblook,
  Buttons,
  ExtCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniStatusBar,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniProgressBar,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniDateTimePicker, uniEdit, uniDBEdit, uniComboBox, uniDBComboBox;

type
  TFrmTaPrepHoliday = class(TUniForm)
    Panel4: TUniPanel;
    SbEmp: TUniSpeedButton;
    SbShift: TUniSpeedButton;
    SbDept: TUniSpeedButton;
    sbAll: TUniSpeedButton;
    sbPT: TUniSpeedButton;
    sbPayGrp: TUniSpeedButton;
    Label1: TUniLabel;
    dtFrom: TUniDateTimePicker;
    Label2: TUniLabel;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    StatusBar1: TUniStatusBar;
    Panel2: TUniPanel;
    ProgressBar1: TUniProgressBar;
    Label3: TUniLabel;
    DBEdit10: TUniDBNumberEdit;
    Panel1: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FrmTaPrepHoliday: TFrmTaPrepHoliday;

implementation

{$R *.DFM}

end.
