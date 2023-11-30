tableextension 50300 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50300; "New Column"; Text[50])
        {
            Caption = 'New Column';
            DataClassification = CustomerContent;
        }
    }
}
