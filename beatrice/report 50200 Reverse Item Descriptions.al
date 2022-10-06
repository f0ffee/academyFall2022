report 50200 "Reverse Item Descriptions"
{
    ApplicationArea = All;
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;

    trigger OnPreReport()
    var
        Item: Record Item;
        Word: Text;
        WordList: List of [Text];
    begin
        // Item.SetLoadFields(Description);
        if Item.FindSet() then
            repeat
                Clear(WordList);
                Item."Reversed Description" := '';
                WordList := Item.Description.Split();
                foreach Word in WordList do
                    Item."Reversed Description" := Word + ' ' + Item."Reversed Description";
                Item.Modify();
            until Item.Next() = 0;
    end;
}