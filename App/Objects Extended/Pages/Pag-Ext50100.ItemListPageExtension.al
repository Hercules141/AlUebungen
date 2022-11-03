pageextension 50100 ItemListPageExtension extends "Item List"
{

    PromotedActionCategories = 'New Caption, Start';

    layout
    {

        addafter("No.")
        {

            field("My Page Extension Field"; Rec.AblaufdatumTableField)
            {
                Caption = 'page extension field caption';
                ApplicationArea = All;
            }
        }

        addafter("My Page Extension Field")
        {
            field("Description 2"; Rec."Description 2")
            {
                Caption = 'Description 2';
            }

            field(DescriptionFieldList; Rec."Description 3")
            {
                Caption = 'Description 3 (On Item List)';
            }
        }

    }

    actions
    {

        // addbefore("Item")
        addfirst(Functions)
        {
            action("Get Item Info")
            {
                ApplicationArea = All;
                Image = Info;

                trigger OnAction()
                var
                    doIt: Boolean;
                begin
                    doIt := Dialog.Confirm('Do it?');
                    if (doIt) then begin
                        Message('Item Info: %1', Rec."No.");
                    end;
                    rec.GetDescriptionLenght()
                end;
            }

            action("Get my field Info")
            {
                ApplicationArea = All;
                Image = "8ball";

                // trigger OnAction()
                // var
                //     // itemIdsRange: Text;
                //     // codes: list of [Code[20]];
                //     // info: Text;

                //     // Item: Record Item;
                // ItemRec: Record 27;
                // begin
                //     // rec.Mark()
                //     // MarkedOnly();
                //     // infos.AddRange(GetSelectionFilter().Split(','));
                //     // Message('My Field: %1', Rec.AblaufdatumTableField);
                //     // ItemRecIdsRange := GetSelectionFilter();
                //     // ItemRec.SetFilter("No.", ItemRecIdsRange);

                //     // CurrPage.SetSelectionFilter(ItemRec); 
                //     // SetSelectionFilter(ItemRec);

                //     // If ItemRec.FindSet() then       //check if ItemRec Table/Record has items
                //     // repeat
                //     //     Message('desc, itemno: %1, %2', ItemRec.Description, ItemRec."No.");
                //     // until ItemRec.Next = 0;     //probably iterates to next item returning an integer with the amount of remaining items

                //     // ItemRecIdsRange.
                //     // foreach info in 1..100 do begin
                //     //     Message('there: %1', info);
                //     // end;

                // end;
                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    SetSelectionFilter(ItemRec);
                    if ItemRec.FindSet() then
                        repeat
                            Message('Item No: %1, Item Description: %2', ItemRec."No.", ItemRec.Description);
                        until ItemRec.Next() = 0;
                end;
            }

            action("Change Case of Desription 3")
            {
                trigger OnAction()
                var
                    codUn: Codeunit "Item Management";
                begin
                    codUn.ChangeCase(Rec);
                end;
            }

            action("Replace Chars")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    codeUn: Codeunit "Item Management";
                begin
                    codeUn.SubstituteChar(Rec);
                end;
            }

            action("Open Card Page")
            {
                ApplicationArea = All;
                Image = Card;

                trigger OnAction()
                var
                    card: Page "Item Card Light";
                begin
                    card.Run();
                end;
            }

            action("Action in Custom Promoted Action Category")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Message('this is the right page');
    // end;

}
