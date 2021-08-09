//Basic face animation script

list faces_steps = [3,2,1];

integer index = 0;
integer current_face;
default
{
    state_entry()
    {
        llSetTimerEvent(5);
        current_face = llList2Integer(faces_steps, index);
    }
    
    timer()
    {
        //Turn current invis
        llSetLinkAlpha(LINK_THIS, 0, current_face);
        
        //Get Next face
        index++;
        if(index >= llGetListLength(faces_steps)){
            index = 0;
        }
        current_face = llList2Integer(faces_steps, index);
        llSetLinkAlpha(LINK_THIS, 1, current_face);
    }
}