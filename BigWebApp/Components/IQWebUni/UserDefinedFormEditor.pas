unit UserDefinedFormEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniTreeView, uniGUIBaseClasses, uniPanel,
  uniImageList, uniPageControl;

type
  TufUDFEditor = class(TUniForm)
    upnlTree: TUniPanel;
    utvTree: TUniTreeView;
    UniImageList1: TUniImageList;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uniGUIApplication;

{$R *.dfm}


end.
