pageextension 50103 RoleCenterExtension extends "Business Manager Role Center"
{
    Caption = 'RoleCenterExtension';

    layout
    {
        //another navigation option
        addfirst(rolecenter)
        {
            //creating a "Tile" using Custom CardPart (not Extension) (uses cuegroup which looks cool)
            part("CardPart"; CardPartForRolecenter)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        //links to my lists etc. via embedding (Actions under Promoted Actions)
        addfirst(embedding)
        {
            action("Sonderpreise")
            {
                ApplicationArea = All;
                //the intresting part
                RunObject = Page SonderpreiseList;
            }
        }

        //other navigation option
        addfirst(New)
        {

            // Image = ListPage;
            // Caption = 'My Pages';
            action("Sonderpreise2")
            {
                Caption = 'Sonderpreis';
                ApplicationArea = All;
                RunObject = page SonderpreiseList;
            }
        }
    }

    var
        RecSonder: Record SonderpreiseTable;

}


//  addfirst(RoleCenter)
//         {
//             repeater(General)
//             {
//                Caption = 'Orders & Contacts';
//                 action("Vendors")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     Caption = 'Vendors';
//                     RunObject = page "Vendor List";
//                 }
//             }
//         }