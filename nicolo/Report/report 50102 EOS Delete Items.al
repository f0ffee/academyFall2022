report 50102 "EOS Delete Items"
{
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    ApplicationArea = All;
    UseRequestPage = false;
    Caption = 'Eos Delete Items';

    trigger OnPostReport()
    var
        //Txt
        //Msg
        //Qst
        //Err
        //Lbl
        Item: Record Item;
        NutrInfo: Record "EOS Nutritional Information";
        ConfirmDeletionQst: Label 'Are you sure you want to delete some items?';
    begin
        if not Confirm(ConfirmDeletionQst) then
            CurrReport.Quit();

        Item.SetFilter("No.", '{*');
        if Item.FindSet() then
            repeat
                NutrInfo.SetRange("Item No.", Item."No.");
                if NutrInfo.FindSet() then
                    repeat
                        NutrInfo.Delete();
                    until NutrInfo.Next() = 0;
                Item.Delete();
            until Item.Next() = 0;

        // if not Item.IsEmpty then
        //     Item.DeleteAll();
    end;
}