tableextension 50100 TableExt50100 extends Item
{
    fields
    {
        field(50100; "Total Calories"; Integer)
        {
            CalcFormula = sum("EOS Nutritional Information"."Calorie Count" where("Item No." = field("No.")));
            FieldClass = FlowField;
        }
    }
}