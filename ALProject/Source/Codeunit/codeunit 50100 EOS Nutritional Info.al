codeunit 50100 "EOS Nutritional Info"
{
    // non necessario perché lo standard usa TransferFields
    // [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', false, false)]
    // local procedure OnAfterInitFromSalesLine(
    //     var SalesShptLine: Record "Sales Shipment Line";
    //     SalesLine: Record "Sales Line"
    // )
    // begin
    //     SalesShptLine.Protein := SalesLine.Protein;
    //     SalesShptLine.Carbohydrates := SalesLine.Carbohydrates;
    //     SalesShptLine.Fats := SalesLine.Fats;
    //     SalesShptLine."Total Calories" := SalesLine."Total Calories";
    // end;
}