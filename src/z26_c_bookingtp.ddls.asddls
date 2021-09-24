@AbapCatalog.sqlViewName: 'Z26CBOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'TRAIN_26'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION

@ObjectModel: {
    semanticKey: [ 'AirlineID', 'ConnectionNumber', 'FlightDate', 'BookingNumber' ],

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view Z26_C_BOOKINGTP as select from DS4_I_BOOKINGTP
association [1] to Z26_C_CUSTOMERTP as _Customer
    on $projection.CustomerGuid = _Customer.CustomerGuid {
    key BookingGuid,
    AirlineID,
    ConnectionNumber,
    FlightDate,
BookingNumber,
    BookingDate,
    Class,
    ForeignCurrencyPayment,
    ForeignCurrency,
    AgencyNumber,
    CustomerGuid,
    IsCancelled,
    /* Associations */
    @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
    _Customer // Make association public
}
