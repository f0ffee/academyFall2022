pageextension 50103 "PageExt50103" extends "Posted Sales Shpt. Subform" //131
{
    layout
    {
        addafter("No.")
        {
            field(Fats; Rec.Fats)
            {
                ApplicationArea = All;
            }

            field(Proteins; Rec.Proteins)
            {
                ApplicationArea = All;
            }

            field(Carbohydrates; Rec.Carbohydrates)
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