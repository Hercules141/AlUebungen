pageextension 50101 ItemCardExtensionPage extends "Item Card"
{

    layout
    {
        addfirst(content)
        {
            group(General)
            {
                field("My Card Extension Field for ablaufdatum field on table"; Rec.AblaufdatumTableField)
                {
                    // Caption = 'overriden';
                }
            }
        }

        addafter("My Card Extension Field for ablaufdatum field on table")
        {
            field(DescriptionFieldCard; Rec."Description 3")
            {
                Caption = 'Description 3';
            }
        }
    }

    actions
    {
        addfirst(Functions)
        {
            action("Get Description 3 Length")
            {
                // ApplicationArea = All;
                Image = "1099Form";
                trigger OnAction()
                begin
                    Message('Description 3 Lenght: %1', Rec.GetDescriptionLenght());

                    Message(rec.TableCaption());

                end;
            }
        }
    }


}
