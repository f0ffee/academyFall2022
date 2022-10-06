tableextension 50100 "TableExt50100" extends Item //27
{
    fields
    {
        field(50100; "Total Calories"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum("EOS Nutritional Information"."Calories Count" where("Item No." = field("No.")));
        }
    }

    var
        myInt: Integer;
}