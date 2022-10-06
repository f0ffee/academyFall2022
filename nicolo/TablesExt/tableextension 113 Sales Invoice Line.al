tableextension 50103 "TableExt50103" extends "Sales Invoice Line" //113
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