pageextension 50200 "PageExt50200" extends "Item List" // 31
{
    layout
    {
        addafter(Description)
        {
            field("Reversed Description"; Rec."Reversed Description")
            {
                ApplicationArea = All;
            }
        }
    }
}