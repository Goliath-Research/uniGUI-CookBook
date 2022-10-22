unit _MyFormIntf;

interface

const
  MyFormClassName = 'TMyForm';

type

  IMyForm = interface
    ['{80CDB092-DDA0-49A0-9FFF-F8D69E18777C}']

    function GetSomeText: string;
    procedure SetSomeText(const Value: string);

    property SomeText : string read GetSomeText write SetSomeText;
  end;

implementation

end.
