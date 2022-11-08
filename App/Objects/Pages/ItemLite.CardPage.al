page 50100 "Item Card Light"
{
    //Importante!
    SourceTable = Item;
    PageType = Card;

    Caption = 'Item Card Light';

    layout
    {
        area(Content)
        {

            group(General)
            {
                Caption = 'Allgemein';
                field("Item No"; Rec."No.") { }

            }
            group(misc)
            {

                Caption = 'Weitere Informationen';
                field("Item Desc 1"; Rec.Description) { }

                field("Item Desc 2"; Rec."Description 2") { }

                field("Item Expiry Date"; Rec.AblaufdatumTableField) { }

                field("Item Desc 3"; Rec."Description 3") { }

            }
        }
    }


}
