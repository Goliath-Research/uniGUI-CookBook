unit ship_to_labels_share;

interface

const
   {type}
   cSHIP_TO_LABEL_TYPE_SERIALIZED     = 0;
   cSHIP_TO_LABEL_TYPE_NON_SERIALIZED = 1;
   cSHIP_TO_LABEL_TYPE_REPRINT        = 2;
   cSHIP_TO_LABEL_TYPE_EXT_CONTAINER  = 3;

   {event}
   cSHIP_TO_LABEL_EVENT_ON_CONVERT_PS = 0;
   cSHIP_TO_LABEL_EVENT_ON_SERIAL     = 1;
   cSHIP_TO_LABEL_EVENT_ON_BATCH      = 2;
   cSHIP_TO_LABEL_EVENT_ON_MIXED      = 3;
   cSHIP_TO_LABEL_EVENT_ON_PALLET     = 4;
   cSHIP_TO_LABEL_EVENT_ON_SERIAL_CHILDREN = 5;  {reprint of pallet + children}

implementation

end.

