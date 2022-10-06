pageextension 50110 "PageExt" extends "Item List"   //31 reverse descr
{
    layout
    {
        addafter(Description) //aggiunge dopo al campo
        {
            field(InvertiDescription; Rec.InvertiDescription)
            {
                ApplicationArea = all;
                Editable = false;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(Functions)  //aggiungi alla fine delle funzioni
        {
            action(ReverseDescription)
            {
                Caption = 'Reverse Description';
                Image = Add;
                ApplicationArea = All;

                trigger OnAction()  //quando premi

                var
                    ListItemDesc: List of [Text];
                    Item: Record Item; //articolo inserito in edge
                    ItemDesc: Text[100];
                    ItemReverse: Text[100];
                    Word: Text; //qualsiasi lunghezza

                begin
                    //Item.SetLoadFields(Description)   prende sola la colonna descrizione
                    if item.FindSet() then
                        repeat
                            ItemDesc := Item.Description;
                            ListItemDesc := ItemDesc.Split(' ');   //ogni volta che trova uno spazio rompe la stringa in ministringhe
                            foreach Word in ListItemDesc do
                                ItemReverse := Word + ' ' + ItemReverse;
                            Item.Validate(InvertiDescription, ItemReverse);

                            Item.Modify(); //conferma modifica

                            Clear(ItemDesc);
                            Clear(ListItemDesc);
                            Clear(ItemReverse);

                        until item.Next() = 0;

                end;
            }
        }
    }

}