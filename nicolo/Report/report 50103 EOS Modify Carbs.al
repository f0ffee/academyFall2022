report 50103 "EOS Modify Carbs"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    // UseRequestPage = false;
    Caption = 'Eos Modify Carbs';

    dataset
    {
        dataitem(Item; Item) { }
    }

    trigger OnPreReport()
    var
        NutrInfo: Record "EOS Nutritional Information";
        InfoType: enum "EOS Information Type";
        ModifyCarbsQst: Label 'Are you sure you want to modify some items?';
        tmp: Text[100];
        tmp2: List of [Text];


    begin
        if not Confirm(ModifyCarbsQst) then
            CurrReport.Quit();

            // Item.SetLoadFields(Description) //carica solo quel campo della tabella per migliorare le
        if Item.FindSet() then
            repeat
                if NutrInfo.Get(Item."No.", InfoType::Carbohydrates) then begin
                    NutrInfo.Validate(Amount, 0);
                    NutrInfo.Modify(true);
                    tmp2 := tmp.Split(' ');
                    // tmp := tmp2;

                end;
            until Item.Next() = 0;
    end;
}