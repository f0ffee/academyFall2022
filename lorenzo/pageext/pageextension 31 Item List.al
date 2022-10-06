pageextension 50141 "EOS Item List" extends "Item List" //31
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Reverse Description"; Rec."Reverse Description")
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
            }
        }
    }
}