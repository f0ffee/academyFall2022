pageextension 50103 "PageExt50103" extends "Posted Sales Shpt. Subform" // 131
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