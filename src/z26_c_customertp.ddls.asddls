@AbapCatalog.sqlViewName: 'Z26CCUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRAIN_26'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Search.searchable: true
@ObjectModel: {
    transactionalProcessingDelegated: true,
    compositionRoot: true,
    
    semanticKey: ['CustomerNumber'],
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}
define view Z26_C_CUSTOMERTP as select from DS4_I_CUSTOMERTP association[*] to Z26_C_BOOKINGTP as _Booking on $projection.CustomerGuid = _Booking.CustomerGuid {
    key CustomerGuid,
    CustomerNumber,
    Form,
    @Search.defaultSearchElement: true
     @Search.fuzzinessThreshold: 0.8
    CustomerName ,
    Street,
    PostCode,
     @Search.defaultSearchElement: true
     @Search.fuzzinessThreshold: 0.8
    City,
    Country,
    Email,
     @Search.defaultSearchElement: true
     @Search.fuzzinessThreshold: 0.8
    Telephone,
    Discount,
    /* Associations */
    @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD]
    _Booking
}
