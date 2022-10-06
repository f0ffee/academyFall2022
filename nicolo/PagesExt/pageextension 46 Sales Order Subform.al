pageextension 50102 "PageExt50102" extends "Sales Order Subform"//46
{
    layout
    {
        addafter("No.")
        {
            field(Fats; Rec.Fats)
            {
                ApplicationArea = All;
                Editable = false;
            }

            field(Proteins; Rec.Proteins)
            {
                ApplicationArea = All;
                Editable = false;


            }

            field(Carbohydrates; Rec.Carbohydrates)
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