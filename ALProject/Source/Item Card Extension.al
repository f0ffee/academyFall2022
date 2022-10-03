pageextension 50101 PageExt50101 extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Total Calories"; Rec."Total Calories")
            {
                ApplicationArea = All;
                Visible = IsFood;
            }
        }

        addafter(ItemPicture)
        {
            part(NutrInfoFactbox; "EOS Nutr. Info. Factbox")
            {
                SubPageLink = "Item No." = field("No.");
                Visible = IsFood;
            }
        }
    }

    var
        IsFood: Boolean;

    trigger OnOpenPage()
    var
        NutrInfo: Record "EOS Nutritional Information";
    begin
        NutrInfo.SetRange("Item No.", Rec."No.");
        if not NutrInfo.IsEmpty then
            IsFood := true;
    end;
}