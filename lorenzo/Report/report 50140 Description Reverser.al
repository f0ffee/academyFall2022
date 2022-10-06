report 50140 "Description Reverser"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    trigger OnPostReport()
    var
        Item: Record Item;
        i: Integer;
        ListOfWords: List of [Text];
        Reverse_Desc: Text;
    begin
        if Item.FindSet() then
            repeat
                Reverse_Desc := ' ';
                ListOfWords := Item.Description.Split();
                for i := 1 to ListOfWords.Count do
                    Reverse_Desc := ListOfWords.Get(i) + ' ' + Reverse_Desc;
                Item.Validate("Reverse Description", Reverse_Desc);
                Item.Modify();
            until Item.Next() = 0;
    end;
}