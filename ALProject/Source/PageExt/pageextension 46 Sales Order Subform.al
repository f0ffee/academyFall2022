pageextension 50102 "PageExt50102" extends "Sales Order Subform" // 46
{
    layout
    {
        addafter(Description)
        {
            field(Carbohydrates; Rec.Carbohydrates)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Fats; Rec.Fats)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(Protein; Rec.Protein)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Total Calories"; Rec."Total Calories")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}