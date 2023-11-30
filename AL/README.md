## Environment installation
# Create an extension
# English

1. Start Visual Studio Code.

2. Select Show > Extensions (Ctrl+Shift+X).

3. Type AL Language in the Search for extensions in Marketplace search box.

4. Click the green Install button.

5. Create an AL extension project. Select Show > Command Palette… (Ctrl+Shift+P).

6. Type AL: Go! in the search box and select the command from the list.

7. Accept the suggested path (or enter a different path).

8. Select the latest (highest) Business Central target platform.

9. Select Microsoft Cloud Sandbox as the development endpoint.

10. Download the application symbols. Select Show > Command Palette… (Ctrl+Shift+P).

11. Type AL: Download symbols in the search box and select the command from the list.

12. If prompted, provide your business credentials (Microsoft 365 account/Microsoft Entra ID account).

13. Open the app.json file and set the name parameter to Example Dashboard. Reset the publisher setting to Cronus International Ltd.

14. Delete the file HelloWorld.al.

# French
# Créer une extension

1. Démarrez Visual Studio Code.

2. Sélectionnez Afficher > Extensions (Ctrl+Maj+X).

3. Saisissez AL Language dans la zone de recherche Rechercher des extensions dans Marketplace.

4. Cliquez sur le bouton vert Installer.

5. Créez un projet d’extension AL. Sélectionnez Afficher > Palette de commandes… (Ctrl+Maj+P).

6. Saisissez AL: Go! dans la zone de recherche et sélectionnez la commande dans la liste.

7. Acceptez le chemin suggéré (ou saisissez un chemin différent).

8. Sélectionnez la plateforme cible dernière version (la plus élevée) de Business Central.

9. Sélectionnez Bac à sable cloud Microsoft comme point de terminaison de développement.

10. Téléchargez les symboles d’application. Sélectionnez Afficher > Palette de commandes… (Ctrl+Maj+P).

11. Saisissez AL: Download symbols dans la zone de recherche et sélectionnez la commande dans la liste.

12. Si vous y êtes invité, fournissez vos informations d’identification professionnelles (compte Microsoft 365/compte Microsoft Entra ID).

13. Ouvrez le fichier app.json et redéfinissez le paramètre name sur Exemple Tableau de bord. Redéfinissez le paramètre publisher sur Cronus International Ltd.

14. Supprimez le fichier HelloWorld.al.


## Budget extension
# ALProjectD2 : launch.json = "schemaUpdateMode": "Synchronize"
# ALProjectD2 : idRanges = 50300 - 50400 : This is the unique identifier (ID) of the tables, pages, codeunit etc.
# ALProjectD2 : version: "0.2.0"
# ALProjectD2 : application = "23.0.12034"


- EXEMPLE : schemaUpdateMode in ForceSync : Saves the database after modifications.
* idRanges = app.json : "from": 50300,  "to": 50400
- "from": "to":  where the extension begins and ends.



# EXEMPLE Creation of TABLES :
# Before POST
- TableBudgetHeader.al = table 50218 "Budget Header"
- TableBudgetLignes.al = table 50219 "Budget Lines"
# More information : 
# The "Budget Header" table appears to be designed to store budget headers. Each entry (record) in the table could represent a unique budget, identified by its "Budget ID" and described by a "Budget Name". The start and end dates probably delimit the period during which the budget is relevant or valid.

# The "Budget Lines" table appears to be a detail table that could be used to store linear information about budgets, such as amounts assigned to different accounts and dates.

# After POST
- TablePostedBudgetHeader.al = table 50220 "Posted Budget Header"
- TablePostedBudgetLines.al = table 50221 "Posted Budget Lines"
# More information :
# The "Posted Budget Header" table is designed to store information related to published budget headers. Each record in this table would represent a unique published budget, identified by its "Posted Budget ID". The "Description" field is used to provide details or a description related to that published Budget.

# The "Posted Budget Lines" table is used to store detail lines for budgets that have been posted or posted to the system. Each record in this table relates to a specific budget (via the "Budget ID") and contains details about a specific budget line entry, such as a description and an amount. Although the table relationship is commented, the "Budget ID" is likely related to a budget header table to provide additional context about each budget.

# Creation of PAGES : 
# Before POST
- PageBudgetLines.al = page 50219 "Budget Lines"
- PageBudgetList.al  = page 50218 "Budget List"
- PageBudgetCard.al  = page 50220 "Budget Card"
# More information : 
# The "Budget Card" page appears to be used to manage budget headers in Business Central. 

# After POST
- PagePostedBudgetLines.al = page 50224 "Posted Budget Lines"
- PagePostedBudgetList.al  = page 50223 "Posted Budget List"
- PagePostedBudgetCard.al  = page 50222 "Posted Budget Card"
# More information :

# Creation of CodeUnit
- BudgetCodeunit.al = codeunit 50225 "Post Budget"
# More information : This is where the logic (methods/procedure, variables ...) of how pages and tables interact with each other comes in.
# Un CodeUnit est un ensemble de procédures et de fonctions AL qui, dans ce contexte, gère la logique liée au processus de "Post" d'un budget.

## Environment test
- Sandbox (Cronus)



## Voici les types de langages et éléments du AL Code que vous utiliserez pour développer un ERP Microsoft Business central à partir de zéro

Types d'objets
* Page  OK
* Table OK
* Extentions |de Table et de Page| OK
* Codeunit "faire un autre avec des methodes" OK
* Reports Pour l'afficher des report il faut voir :
- L'utilisation des présentations RDLC/RDL, Word, Excell"
- Installer Microsoft Report Builder "oui mais je ne peux pas parce que je ne suis pas admin de l'ordi"
* Queries 
* XMLports

### Autres

* Factboxes
* Triggers 
* Events
* Méthodes
* Fonctions de traitement de données |récupérer des données de la BDD: Get, Find, FindFirst, FindLast, Next, isEmpty.
* Validations
* Rec et xRec mis à jour par MODIFY |Rec représent les données d'enregistrement en cours de traitement.
                                    |xRec " " " " au cours du cycle de processus en cours.



# Extension ALProjectD2 :
## Purchase Invoice

# TransferNewColumnData.Codeunit.al :
- Trigger OnRun() :
Ce trigger est le point d'entrée principal du codeunit. Dans l'extrait, il semble vide, ce qui suggère que la logique principale de ce codeunit est gérée ailleurs, probablement dans les procédures et les gestionnaires d'événements.

- Procédure TransferDataToPostedLine :
Souscrite à l'événement OnAfterInitFromPurchLine de la table "Purch. Inv. Line".
Transfère les données de la ligne d'achat ("Purchase Line") vers la ligne de facture d'achat validée ("Purch. Inv. Line"). En particulier, elle transfère la valeur du champ "New Column" de la ligne d'achat à la ligne de facture d'achat correspondante.
Il y a une souscription à un événement OnAfterInitFromPurchLine de la table "Purch. Inv. Line" (ligne de facture d'achat validée).
La procédure TransferDataToPostedLine est définie pour transférer des données de "Purchase Line" vers "Purch. Inv. Line". Ce codeunit est utilisé pour synchroniser ou migrer des données entre ces deux tables dans certaines conditions.

- Procédure OnAfterPreparePurchase :
Souscrite à l'événement OnAfterPreparePurchase de la table "Invoice Posting Buffer".
Transfère la valeur du champ "New Column" de la ligne d'achat ("Purchase Line") vers le buffer de comptabilisation des factures ("Invoice Posting Buffer"). Cette action peut être utilisée pour regrouper les lignes lors de la comptabilisation des factures.

- Procédure OnAfterBuildPrimaryKey :
Souscrite à l'événement OnAfterBuildPrimaryKey de la table "Invoice Posting Buffer".
Ajuste la clé primaire du buffer de comptabilisation des factures pour inclure la valeur du champ "New Column", ce qui affecte la manière dont les lignes sont regroupées et traitées lors de la comptabilisation.

- Procédure OnAfterCopyToGenJnlLine :
Souscrite à l'événement OnAfterCopyToGenJnlLine de la table "Invoice Posting Buffer".
Transfère la valeur du champ "New Column" du buffer de comptabilisation des factures vers la ligne du journal général correspondante ("Gen. Journal Line").

- Procédure GenJournalLineOnAfterOnAfterCopyGLEntryFromGenJnlLine :
Souscrite à l'événement OnAfterCopyGLEntryFromGenJnlLine de la table "G/L Entry".
Transfère la valeur du champ "New Column" de la ligne du journal général vers les écritures du grand livre ("G/L Entry").

- Procédure TransferNewColumnToJobJnlLine :
Souscrite à l'événement OnAfterFromPurchaseLineToJnlLine du codeunit "Job Transfer Line".
Transfère la valeur du champ "New Column" de "Purchase Line" à "Job Journal Line".

- Procédure OnBeforeInsertJobLedgerEntry :
Souscrite à l'événement OnBeforeJobLedgEntryInsert du codeunit "Job Jnl.-Post Line".
Transfère la valeur du champ "New Column" de "Job Journal Line" à "Job Ledger Entry" avant l'insertion de l'entrée dans le grand livre des travaux.

* Ce codeunit joue un rôle crucial dans le transfert et la synchronisation de la valeur du champ "New Column" à travers différentes tables et processus dans Business Central, notamment lors de la comptabilisation des factures, la gestion des journaux et des jobs. Cela permet une intégration homogène de la nouvelle donnée à travers le système.

# Pages :
# GeneralJournalExt.al : 
Ce fichier définit une extension de page nommée GeneralJournalExt qui étend la page "General Journal".
Dans la mise en page (layout), il ajoute un nouveau champ nommé "New Column" à la page.
Ce champ est ajouté dans un groupe de contrôle spécifique, probablement dans une partie de la page dédiée à afficher des détails supplémentaires.
Le champ "New Column" est disponible pour toutes les zones d'application (ApplicationArea = All), ce qui signifie qu'il est visible quelle que soit la configuration de la zone d'application de l'utilisateur.

# GLEntryPageExt.al :
Ce fichier définit une extension de page nommée "G/L Entry Page Ext" qui étend la page "General Ledger Entries" (Écritures du Grand Livre).
Dans la mise en page (layout), il ajoute un nouveau champ nommé "New Column" à la page "General Ledger Entries".
Ce champ est ajouté au dernier groupe de champs de la page, indiquant probablement une section dédiée aux informations supplémentaires ou personnalisées.
Le champ "New Column" est configuré pour être visible dans toutes les zones d'application, ce qui signifie qu'il sera accessible à tous les utilisateurs, quelle que soit leur configuration.

# JobJournalExt.al :
Ce fichier crée une extension de page appelée "Job Journal Ext" qui étend la page "Job Journal" (Journal des Travaux).
Il suit un modèle similaire à celui du fichier précédent, ajoutant un champ "New Column" à la page "Job Journal".
Ce champ est également ajouté à la fin d'un groupe de champs spécifié, ce qui pourrait indiquer un effort pour inclure des données supplémentaires ou personnalisées pertinentes pour les journaux de travaux.
De même, le champ est disponible pour toutes les zones d'application.

# JobLedgerEntriesExt.al :
Ce fichier crée une extension de page nommée "Job Ledger Entries Ext" qui étend la page "Job Ledger Entries" (Écritures du Livre de Travaux).
La structure est similaire aux extensions précédentes. Un nouveau champ, "New Column", est ajouté à la page.
Ce champ est ajouté à la fin d'un groupe de contrôles, ce qui pourrait indiquer l'intention d'ajouter des informations supplémentaires ou des données spécifiques à la gestion des travaux.
Comme dans les autres extensions, ce champ est rendu disponible dans toutes les zones d'application, suggérant une utilisation universelle.

# PostedPurchInvoicePageExt.al :
Ce fichier définit une extension de page appelée "Posted Purch. Invoice Page Ext" qui étend la page "Posted Purch. Invoice Subform" (Sous-formulaire de Facture d'Achat Comptabilisée).
Il suit le même modèle d'ajout d'un nouveau champ "New Column" à la page.
Ce champ est probablement destiné à enrichir les informations disponibles sur les factures d'achat après leur comptabilisation, offrant potentiellement de nouvelles perspectives ou des détails supplémentaires.
Encore une fois, le champ est accessible dans toutes les zones d'application.

# PurchaseInvoicePageExt.al :
Ce fichier crée une extension, cette extension est appliquée à la page "Purch. Invoice Subform" (Sous-formulaire de Facture d'Achat).
Un nouveau champ, nommé "New Column", est ajouté au groupe de champs "PurchDetailLine". Ce groupe correspond à la partie "LINES" de la page "Purch. Invoice Subform", où les lignes de détail des factures d'achat sont affichées.
Ce champ est lié au champ "New Column" de la source de données de la page (une table), indiqué par Rec."New Column".
Le champ "New Column" est configuré pour être visible dans toutes les zones d'application (ApplicationArea = All). Cela signifie qu'il sera accessible à tous les utilisateurs de Business Central, indépendamment de leur configuration spécifique de zone d'application.
"Purchase Invoice Page Ext" ajoute un champ supplémentaire à la page de sous-formulaire des factures d'achat. Ce champ peut être utilisé pour afficher des informations supplémentaires sur chaque ligne de la facture d'achat, améliorant ainsi la visibilité des données spécifiques ou personnalisées dans le processus de facturation. 