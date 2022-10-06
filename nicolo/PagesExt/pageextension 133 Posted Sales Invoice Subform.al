pageextension 50104 "PageExt50104" extends "Posted Sales Invoice Subform" //133
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