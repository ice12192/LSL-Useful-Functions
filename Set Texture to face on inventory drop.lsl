integer finalized = FALSE;
integer gListener;

default
{
    state_entry()
    {
        llAllowInventoryDrop(TRUE);
    }

    touch_start(integer total_number)
    {
        if(llDetectedKey(0) != llGetOwner()){
            return;   
        }
        integer channel = (integer)llFrand(500)*1000000 + (integer)llFrand(1000000);
        llListenRemove(gListener);
        key user = llDetectedKey(0);
        gListener = llListen(channel, "", user, "FINALIZE");
        
        llDialog(user, "\nWarning! By clicking FINALIZE you will not be able to change your label! Make sure you are satisfied before clicking this!", ["FINALIZE", "CANCEL"] , channel);
    }
    
    on_rez(integer num)
    {
        llOwnerSay("***** You can CTRL drop a texture on me to change the label. Please remember to click and finalize me when your done!");
    }
    
    listen(integer chan, string name, key id, string msg)
    {
        if(id == llGetOwner()){
            if(msg == "FINALIZE"){
                llListenRemove(gListener);
                llAllowInventoryDrop(FALSE);
                llSetObjectDesc("Finalized on " + llGetDate() + " by " + llKey2Name(id));
                llRemoveInventory(llGetScriptName());
            }
        }
    }
    
    changed(integer change)
    {
        if (change & (CHANGED_ALLOWED_DROP | CHANGED_INVENTORY))
        {
            // Look for texture
            integer i = 0;
            integer count = llGetInventoryNumber(INVENTORY_TEXTURE);
            for(i=0; i<count; i++){
                string texture = llGetInventoryName(INVENTORY_TEXTURE, i);
                key texture_key = llGetInventoryKey(texture);
                llRemoveInventory(texture);
                llSetLinkTexture(LINK_ROOT, texture_key, 1);
                
            }
        }   
    }
}
