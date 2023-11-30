tableextension 50303 "Invoice Posting Buffer Ext" extends "Invoice Posting Buffer"
{
    fields
    {
        field(50100; "New Column"; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }
}
