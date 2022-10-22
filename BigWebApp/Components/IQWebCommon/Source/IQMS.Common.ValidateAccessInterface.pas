unit IQMS.Common.ValidateAccessInterface;

interface

type
  IValidateAccess = interface
  ['{BB9FC21C-7EF0-4847-99E4-E5E3B5462181}']
    procedure ValidateDataBaseAccess( Sender: TObject; ARequestingFreePass: Boolean = FALSE; ARaiseExceptionOnCheckLogin:Boolean = FALSE  );
    procedure ValidateFileAccess( Sender: TObject );
  end;

implementation

end.
