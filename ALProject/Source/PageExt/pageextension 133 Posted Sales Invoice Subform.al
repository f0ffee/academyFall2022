pageextension 50104 "PageExt50104" extends "Posted Sales Invoice Subform" // 133
{
    layout
    {
        addafter(Description)
        {
            field(Carbohydrates; Rec.Carbohydrates)
            {
                ApplicationArea = All;
            }
            field(Fats; Rec.Fats)
            {
                ApplicationArea = All;
            }
            field(Protein; Rec.Protein)
            {
                ApplicationArea = All;
            }
            field("Total Calories"; Rec."Total Calories")
            {
                ApplicationArea = All;
            }
        }
    }
}