codeunit 50100 "Eos Nutritional Info"
{
    //non necessario, lo standard sta usando il stransferfields che copia in autimatico i dati tra più tabelle simili (purchè tutti o alcuni campi siano uguali,
    //i campi diversi non vengono toccati)
    // [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', false, false)]
    // local procedure OnAfterInitFromSalesLine(
    //  var SalesShptLine: Record "Sales Shipment Line";
    //  SalesLine: Record "Sales Line"
    // )
    // begin
    //     SalesShptLine.Proteins := SalesLine.Proteins;
    //     SalesShptLine.Carbohydrates := SalesLine.Carbohydrates;
    //     SalesLine.Fats := SalesLine.Fats;
    //     SalesShptLine."Total Calories" := SalesLine."Total Calories";
    // end;
}