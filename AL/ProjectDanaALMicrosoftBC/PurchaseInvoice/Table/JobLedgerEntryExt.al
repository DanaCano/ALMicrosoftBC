tableextension 50305 "Job Ledger Entry Ext" extends "Job Ledger Entry"
{
    fields
    {
        // Agrega el nuevo campo en la extensión de la tabla
        field(50400; "New Column"; Text[50])
        {
            Caption = 'New Column';
            DataClassification = CustomerContent;
        }
    }
}
