pageextension 50141 "EOS Item List" extends "Item List" //31
{
    layout
    {
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