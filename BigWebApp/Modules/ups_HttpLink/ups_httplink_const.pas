unit ups_httplink_const;

{ *** UPS HTTP Link - Application Constants ***

  This unit contains constants related to our application.  Placing these
  constants in this unit makes them more visible to developmers and easier
  to change, as needed.
}

interface

const
    // -------------------------------------------------------------------------
    // -- IQMS Account-Related Information
    // -------------------------------------------------------------------------

    CLIENT_SOFTWARE_VERSION = '11.0.0.1'; // "Client Software Version"
    CLIENT_DATA_SOURCE = '49'; // "Data Source": assigned by UPS
    SOFTWARE_VENDOR_CODE = '967'; // "Software Vendor Code": assigned by UPS
    VENDOR_NAME = 'IQMS';
    VENDOR_SOFTWARE_NAME = 'ENTERPRISEIQ';

    COMM_SOFTWARE_VERSION = '2.28'; //=commSoftwareVersion
    // three-letter software name followed by version number
    // (UPS Ready Certification Guide, page 5)
    SHIPPING_SOFTWARE_VERSION = 'EIQ 11.0'; //=shippingSoftwareVersion

    // Unique SNA control point name
    CONTROL_POINT_NAME = '12345678'; // 'Z71F2D5E';

//    RATE_TABLE_VERSION = '2009'; //=rateVersion (old: '2/94'
//    URC = '84.5A';
//    URC_DATE = '10/2008'; // used for test cases
    //84.5A 10/2008
{The Cert Tool Login is:
un: iqms2008
pw: upslink}

    PLDExt: array[0..4] of String = ( '.req',
                                      '.res',
                                      '.msg',
                                      '.plde',   // PC_PLD_UPLOAD_ENHANCED_MSG
                                      '.pldt' ); // PC_TDPLD_UPLOAD_ENHANCED_MSG


implementation

end.
