codeunit 50300 "Transfer New Column Data"
{
    trigger OnRun()
    begin
    end;

    // Transférer les données de "Purchase Line" vers "Purch. Inv. Line" (facture d'achat validée)
    [EventSubscriber(ObjectType::Table, Database::"Purch. Inv. Line", 'OnAfterInitFromPurchLine', '', false, false)]
    local procedure TransferDataToPostedLine(PurchInvHeader: Record "Purch. Inv. Header"; PurchLine: Record "Purchase Line"; var PurchInvLine: Record "Purch. Inv. Line")
    begin
        //Transfiere directamente el valor de "New Column" de la línea de compra a la línea de factura de compra validada.
        PurchInvLine."New Column" := PurchLine."New Column";
    end;

    // Traite et transfère les données dans le tampon de comptabilisation des factures
    // 1. le buffer de publication de facture, il transférera notre valeur dans le tampon afin que nous puissions avoir une valeur pour le regroupement des lignes.
    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterPreparePurchase', '', true, true)]
    local procedure OnAfterPreparePurchase(var PurchaseLine: Record "Purchase Line"; var InvoicePostingBuffer: Record "Invoice Posting Buffer")

    begin
        InvoicePostingBuffer."New Column" := PurchaseLine."New Column";
        //InvoicePostingBuffer."Additional Grouping Identifier" := Format(PurchaseLine."New Column", 0, 2);
        //InvoicePostingBuffer."New Column" := format(PurchaseLine."New Column",0,2);
    end;


    // 2. le buffer de publication de la facture ajoutera notre valeur pour le regroupement à la clé parent et le passe-partout s'occupera du reste.
    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", 'OnAfterBuildPrimaryKey', '', false, false)]
    local procedure OnAfterBuildPrimaryKey(var InvoicePostingBuffer: Record "Invoice Posting Buffer")
    begin
        InvoicePostingBuffer."Group ID" :=
        InvoicePostingBuffer.PadField(InvoicePostingBuffer."New Column", MaxStrLen(InvoicePostingBuffer."New Column")) +
        InvoicePostingBuffer."Group ID";
    end;


    // 3. le buffer de comptabilisation des factures est utilisé pour transférer la valeur des groupes de lignes vers le Journal Général pour comptabilisation.
    [EventSubscriber(ObjectType::Table, Database::"Invoice Posting Buffer", "OnAfterCopyToGenJnlLine", '', false, false)]
    local procedure OnAfterCopyToGenJnlLine(var GenJnlLine: Record "Gen. Journal Line"; InvoicePostingBuffer: Record "Invoice Posting Buffer")
    
    begin
        GenJnlLine."New Column" := InvoicePostingBuffer."New Column"; // le 'New Column' est présente dans 'Gen. Ligne de journal
    end;

    // 4. la table G/L Entry prend les valeurs de notre champ General Journal Line vers les champs G/L Entry.
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure GenJournalLineOnAfterOnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry"; var GenJournalLine: Record "Gen. Journal Line")

    begin
        //Transférer la valeur de la ligne General Journal Line
        GLEntry."New Column" := GenJournalLine."New Column";
    end;


    // Transférer la "New Column" de "Purchase Line" à "Job Journal Line"
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPurchaseLineToJnlLine', '', false, false)]
    local procedure TransferNewColumnToJobJnlLine(var JobJnlLine: Record "Job Journal Line"; PurchLine: Record "Purchase Line")
    begin
        JobJnlLine."New Column" := PurchLine."New Column";
    end;

    // Transférer la "New Column" de "Job Journal Line" à "Job Ledger Entry" (gl job)
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post Line", 'OnBeforeJobLedgEntryInsert', '', false, false)]
    local procedure OnBeforeInsertJobLedgerEntry(var JobLedgerEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."New Column" := JobJournalLine."New Column";
    end;
}












// Voir table 55 "Invoice Posting Buffer" 
// Voir table 212 "Job Posting Buffer"
