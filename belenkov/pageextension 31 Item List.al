pageextension 50110 "EOS Description PageExt" extends "Item List" // 31
{
    layout
    {
        addafter(Description)
        {
            field("Reverse Description"; Rec."Reverse Description")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addlast(Functions)
        {
            action("Reverse_Description")
            {
                Caption = 'Reverse Description';
                Image = Add;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Item: Record Item;
                    ItemDesc: Text[100];
                    ListOfItemDesc: List of [Text];
                    ItemDescReverse: Text[100];
                    Word: Text;
                begin
                    if Item.FindSet() then
                        repeat
                            ItemDesc := Item.Description;
                            ListOfItemDesc := ItemDesc.Split(' ');
                            foreach Word in ListOfItemDesc do
                                ItemDescReverse := Word + ' ' + ItemDescReverse;

                            Item.Validate("Reverse Description", ItemDescReverse);
                            Item.Modify();
                            Clear(ItemDesc);
                            Clear(ListOfItemDesc);
                            Clear(ItemDescReverse);
                        until Item.Next() = 0;
                end;

            }
        }
    }
}