report 50103 "EOS Delete Carbs"
{
    ApplicationArea = All;
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    UseRequestPage = true;

    dataset
    {
        dataitem(Item; Item) { }
    }

    trigger OnPreReport()
    var
        NutrInfo: Record "EOS Nutritional Information";
        InfoType: Enum "EOS Information Type";
        DeleteCarbsQst: Label 'Are you sure you want to modify all carbohydrates?';
    begin
        if not Confirm(DeleteCarbsQst) then
            exit;

        if Item.FindSet() then
            repeat
                if NutrInfo.Get(Item."No.", InfoType::Carbohydrates) then begin
                    NutrInfo.Validate(Amount, 0);
                    NutrInfo.Modify(true);
                end;
            until Item.Next() = 0;
    end;

    // var
    // Item: Record Item;
}