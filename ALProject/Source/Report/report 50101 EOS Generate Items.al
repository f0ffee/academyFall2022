report 50101 "EOS Generate Items"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(ItemCount; ItemCount)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of items to create';
                        ToolTip = 'Specifies the number of items that are going to be generated.';
                    }
                }
            }
        }
    }

    var
        ItemCount: Integer;

    trigger OnPostReport()
    var
        Item: Record Item;
        NutrInfo: Record "EOS Nutritional Information";
        InfoType: Enum "EOS Information Type";
        ItemNo: Code[20];
        ItemDesc: Text[100];
        Amount: Decimal;
        i: Integer;
        DescTxt: Label 'This is the description of item %1';
    begin
        for i := 1 to ItemCount do begin
            ItemNo := CopyStr(CreateGuid(), 1, 20);
            ItemDesc := StrSubstNo(DescTxt, ItemNo);

            Item.Validate("No.", ItemNo);
            Item.Validate(Description, ItemDesc);
            Item.Insert(true);

            foreach InfoType in Enum::"EOS Information Type".Ordinals() do
                if InfoType.AsInteger() <> 0 then begin
                    Amount := Random(50);

                    NutrInfo.Validate("Item No.", ItemNo);
                    NutrInfo.Validate("Information Type", InfoType);
                    NutrInfo.Validate(Amount, Amount);
                    NutrInfo.Insert(true);
                end;
        end;
    end;
}