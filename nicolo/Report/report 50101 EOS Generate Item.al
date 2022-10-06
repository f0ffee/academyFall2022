report 50101 "EOS Generate Item"
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
                group(GroupName)
                {
                    Caption = 'Options';
                    field(ItemQuantity; ItemQuantity)
                    {
                        ApplicationArea = All;
                        Caption = 'No. of items to create';
                        ToolTip = 'Specify the number of items to create';
                    }
                }
            }
        }
    }

    var
        ItemQuantity: Integer;

    trigger OnPostReport()
    var
        ItemNo: Code[20];
        ItemDesc: Text[100];
        Amount: Decimal;
        Item: Record Item;
        NutrInfo: Record "EOS Nutritional Information";
        InfoType: Enum "EOS Information Type";
        I: Integer;
        DescrTxt: Label 'This is the description of item %1';

    begin
        for I := 1 to ItemQuantity do begin
            ItemNo := CopyStr(CreateGuid(), 1, 20);
            ItemDesc := StrSubstNo(DescrTxt, ItemNo);
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