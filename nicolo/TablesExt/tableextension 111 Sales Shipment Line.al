tableextension 50102 "TableExt50102" extends "Sales Shipment Line" //111
{
    fields
    {
        field(50100; "Fats"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50101; "Proteins"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50102; "Carbohydrates"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(50103; "Total Calories"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}