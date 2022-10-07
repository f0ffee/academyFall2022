tableextension 50140 "EOS Item" extends Item //27
{
    fields
    {
        // Add changes to table fields here
        field(50140; "Reverse Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Reverse Description';
        }
    }
}