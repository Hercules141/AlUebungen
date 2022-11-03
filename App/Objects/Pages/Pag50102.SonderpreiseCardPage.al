page 50102 SonderpreiseCardPage
{
    Caption = 'Sonderpreise Card Caption';
    PageType = Card;
    SourceTable = SonderpreiseTable;
    ApplicationArea = all;
    UsageCategory = Administration;

    layout
    {

        area(content)
        {

            group(General)
            {
                field("PK"; Rec."Entry No.")
                {
                }

                field("Variant"; Rec."Variant Code")
                {
                }



            }

            group(Advanced)
            {


                field("Item No."; Rec."Item No")
                {
                }
                field("Starting Date"; Rec."Starting Date")
                {
                }
                field("Ending Date"; Rec."Ending Date")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Unit Price"; REC."Unit Price")
                {
                }
                field("Special Unit Price"; Rec."Special Unit Price")
                {
                    Lookup = true;
                }
            }
        }
    }
}