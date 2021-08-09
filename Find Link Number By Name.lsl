integer getLinkWithName(string name) {
    integer i = llGetLinkNumber() != 0;
    integer x = llGetNumberOfPrims() + i;
    for (; i < x; ++i)
        if (llGetLinkName(i) == name) 
            return i;
    return -1;
}

default
{
	state_entry()
	{
		integer link = getLinkWithName("Child 1");
		if(link == -1) {
			llOwnerSay("Not found");			
		} else {
			llOwnerSay("Found! Link number is: " + (string)link);
		}
	}
}